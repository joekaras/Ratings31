object HospitalResultsReportForm: THospitalResultsReportForm
  Left = 178
  Top = 54
  Width = 656
  Height = 348
  Caption = 'Previous Day Results Report'
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
    Top = 292
    Width = 648
    Height = 29
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 5
    Top = 61
    Width = 549
    Height = 41
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbHospitalPrevDayReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbHospitalPrevDayReport'
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
    Filter = 'TodaysWagerWinPctRank=1 And IsPrintedOnValueSheet=True '
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbHospitalPrevDayReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    ReadOnly = True
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
      FieldAlias = 'ProgNbrSort'
      FieldName = 'ProgNbrSort'
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
      FieldAlias = 'MorningLineTo1Rank'
      FieldName = 'MorningLineTo1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object plPrevDayHHppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPos'
      FieldName = 'FinishPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object plPrevDayHHppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'Odds'
      FieldName = 'Odds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object plPrevDayHHppField20: TppField
      FieldAlias = 'IsFavorite'
      FieldName = 'IsFavorite'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
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
      FieldAlias = 'Sex'
      FieldName = 'Sex'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object plPrevDayHHppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object plPrevDayHHppField25: TppField
      FieldAlias = 'Equip'
      FieldName = 'Equip'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object plPrevDayHHppField26: TppField
      FieldAlias = 'Med'
      FieldName = 'Med'
      FieldLength = 5
      DisplayWidth = 5
      Position = 25
    end
    object plPrevDayHHppField27: TppField
      FieldAlias = 'IsFirstTimeJuice'
      FieldName = 'IsFirstTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 26
    end
    object plPrevDayHHppField28: TppField
      FieldAlias = 'IsSecondTimeJuice'
      FieldName = 'IsSecondTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 27
    end
    object plPrevDayHHppField29: TppField
      FieldAlias = 'IsDebut'
      FieldName = 'IsDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 28
    end
    object plPrevDayHHppField30: TppField
      FieldAlias = 'IsDebutTwo'
      FieldName = 'IsDebutTwo'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 29
    end
    object plPrevDayHHppField31: TppField
      FieldAlias = 'IsDebutThird'
      FieldName = 'IsDebutThird'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 30
    end
    object plPrevDayHHppField32: TppField
      FieldAlias = 'IsTurfDebut'
      FieldName = 'IsTurfDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 31
    end
    object plPrevDayHHppField33: TppField
      FieldAlias = 'DebutIndicator'
      FieldName = 'DebutIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 32
    end
    object plPrevDayHHppField34: TppField
      FieldAlias = 'TurfIndicator'
      FieldName = 'TurfIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 33
    end
    object plPrevDayHHppField35: TppField
      FieldAlias = 'MudIndicator'
      FieldName = 'MudIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 34
    end
    object plPrevDayHHppField36: TppField
      FieldAlias = 'RouteIndicator'
      FieldName = 'RouteIndicator'
      FieldLength = 2
      DisplayWidth = 2
      Position = 35
    end
    object plPrevDayHHppField37: TppField
      FieldAlias = 'IsClaimed1Back'
      FieldName = 'IsClaimed1Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 36
    end
    object plPrevDayHHppField38: TppField
      FieldAlias = 'IsClaimed2Back'
      FieldName = 'IsClaimed2Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 37
    end
    object plPrevDayHHppField39: TppField
      FieldAlias = 'IsDirtToTurf'
      FieldName = 'IsDirtToTurf'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 38
    end
    object plPrevDayHHppField40: TppField
      FieldAlias = 'IsTurfToDirt'
      FieldName = 'IsTurfToDirt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 39
    end
    object plPrevDayHHppField41: TppField
      FieldAlias = 'IsSprToRte'
      FieldName = 'IsSprToRte'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 40
    end
    object plPrevDayHHppField42: TppField
      FieldAlias = 'IsRteToSpr'
      FieldName = 'IsRteToSpr'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
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
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork'
      FieldName = 'DaysLastWork'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 43
    end
    object plPrevDayHHppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork2'
      FieldName = 'DaysLastWork2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 44
    end
    object plPrevDayHHppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork3'
      FieldName = 'DaysLastWork3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object plPrevDayHHppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrWorksLast'
      FieldName = 'NbrWorksLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object plPrevDayHHppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'StartsWorks21'
      FieldName = 'StartsWorks21'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 47
    end
    object plPrevDayHHppField49: TppField
      FieldAlias = 'JkyEquibaseKey'
      FieldName = 'JkyEquibaseKey'
      FieldLength = 10
      DisplayWidth = 10
      Position = 48
    end
    object plPrevDayHHppField50: TppField
      FieldAlias = 'TrnEquibaseKey'
      FieldName = 'TrnEquibaseKey'
      FieldLength = 10
      DisplayWidth = 10
      Position = 49
    end
    object plPrevDayHHppField51: TppField
      FieldAlias = 'SireName'
      FieldName = 'SireName'
      FieldLength = 16
      DisplayWidth = 16
      Position = 50
    end
    object plPrevDayHHppField52: TppField
      FieldAlias = 'DamSireName'
      FieldName = 'DamSireName'
      FieldLength = 16
      DisplayWidth = 16
      Position = 51
    end
    object plPrevDayHHppField53: TppField
      FieldAlias = 'DamName'
      FieldName = 'DamName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 52
    end
    object plPrevDayHHppField54: TppField
      FieldAlias = 'BredIn'
      FieldName = 'BredIn'
      FieldLength = 6
      DisplayWidth = 6
      Position = 53
    end
    object plPrevDayHHppField55: TppField
      FieldAlias = 'Owner'
      FieldName = 'Owner'
      FieldLength = 45
      DisplayWidth = 45
      Position = 54
    end
    object plPrevDayHHppField56: TppField
      FieldAlias = 'Breeder'
      FieldName = 'Breeder'
      FieldLength = 67
      DisplayWidth = 67
      Position = 55
    end
    object plPrevDayHHppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeed'
      FieldName = 'LastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 56
    end
    object plPrevDayHHppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRank'
      FieldName = 'LastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 57
    end
    object plPrevDayHHppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'Power'
      FieldName = 'Power'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 58
    end
    object plPrevDayHHppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRank'
      FieldName = 'PowerRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plPrevDayHHppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeed'
      FieldName = 'BackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 60
    end
    object plPrevDayHHppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRank'
      FieldName = 'BackSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object plPrevDayHHppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPace'
      FieldName = 'EarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object plPrevDayHHppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRank'
      FieldName = 'EarlyPaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 63
    end
    object plPrevDayHHppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePos'
      FieldName = 'EarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 64
    end
    object plPrevDayHHppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRank'
      FieldName = 'EarlyPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 65
    end
    object plPrevDayHHppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePace'
      FieldName = 'MiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 66
    end
    object plPrevDayHHppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRank'
      FieldName = 'MiddlePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 67
    end
    object plPrevDayHHppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePos'
      FieldName = 'MiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object plPrevDayHHppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRank'
      FieldName = 'MiddlePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 69
    end
    object plPrevDayHHppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePace'
      FieldName = 'LatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 70
    end
    object plPrevDayHHppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRank'
      FieldName = 'LatePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 71
    end
    object plPrevDayHHppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePos'
      FieldName = 'LatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 72
    end
    object plPrevDayHHppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRank'
      FieldName = 'LatePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 73
    end
    object plPrevDayHHppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePos'
      FieldName = 'FinishPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object plPrevDayHHppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePosRank'
      FieldName = 'FinishPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 75
    end
    object plPrevDayHHppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClass'
      FieldName = 'AvgClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 76
    end
    object plPrevDayHHppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRank'
      FieldName = 'AvgClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 77
    end
    object plPrevDayHHppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeed'
      FieldName = 'AvgSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 78
    end
    object plPrevDayHHppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeedRank'
      FieldName = 'AvgSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 79
    end
    object plPrevDayHHppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRating'
      FieldName = 'AvgClassRating'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 80
    end
    object plPrevDayHHppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRatingRank'
      FieldName = 'AvgClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 81
    end
    object plPrevDayHHppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClass'
      FieldName = 'BackClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 82
    end
    object plPrevDayHHppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClassRank'
      FieldName = 'BackClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 83
    end
    object plPrevDayHHppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClass'
      FieldName = 'LastClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 84
    end
    object plPrevDayHHppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClassRank'
      FieldName = 'LastClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 85
    end
    object plPrevDayHHppField87: TppField
      FieldAlias = 'IsDollar'
      FieldName = 'IsDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 86
    end
    object plPrevDayHHppField88: TppField
      FieldAlias = 'IsDoubleDollar'
      FieldName = 'IsDoubleDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 87
    end
    object plPrevDayHHppField89: TppField
      FieldAlias = 'IsFrontDoubleLiner0'
      FieldName = 'IsFrontDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 88
    end
    object plPrevDayHHppField90: TppField
      FieldAlias = 'IsFrontDoubleLiner1'
      FieldName = 'IsFrontDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 89
    end
    object plPrevDayHHppField91: TppField
      FieldAlias = 'IsFrontDoubleLiner2'
      FieldName = 'IsFrontDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 90
    end
    object plPrevDayHHppField92: TppField
      FieldAlias = 'IsFrontDoubleLiner3'
      FieldName = 'IsFrontDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 91
    end
    object plPrevDayHHppField93: TppField
      FieldAlias = 'IsBackDoubleLiner0'
      FieldName = 'IsBackDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 92
    end
    object plPrevDayHHppField94: TppField
      FieldAlias = 'IsBackDoubleLiner1'
      FieldName = 'IsBackDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 93
    end
    object plPrevDayHHppField95: TppField
      FieldAlias = 'IsBackDoubleLiner2'
      FieldName = 'IsBackDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 94
    end
    object plPrevDayHHppField96: TppField
      FieldAlias = 'IsBackDoubleLiner3'
      FieldName = 'IsBackDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 95
    end
    object plPrevDayHHppField97: TppField
      FieldAlias = 'IsTripleLiner0'
      FieldName = 'IsTripleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 96
    end
    object plPrevDayHHppField98: TppField
      FieldAlias = 'IsTripleLiner1'
      FieldName = 'IsTripleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 97
    end
    object plPrevDayHHppField99: TppField
      FieldAlias = 'IsTripleLiner2'
      FieldName = 'IsTripleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 98
    end
    object plPrevDayHHppField100: TppField
      FieldAlias = 'IsTripleLiner3'
      FieldName = 'IsTripleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 99
    end
    object plPrevDayHHppField101: TppField
      FieldAlias = 'IsFrontDoubleLiner'
      FieldName = 'IsFrontDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 100
    end
    object plPrevDayHHppField102: TppField
      FieldAlias = 'IsBackDoubleLiner'
      FieldName = 'IsBackDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 101
    end
    object plPrevDayHHppField103: TppField
      FieldAlias = 'IsTripleDot'
      FieldName = 'IsTripleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 102
    end
    object plPrevDayHHppField104: TppField
      FieldAlias = 'IsFrontDoubleDot'
      FieldName = 'IsFrontDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 103
    end
    object plPrevDayHHppField105: TppField
      FieldAlias = 'IsBackDoubleDot'
      FieldName = 'IsBackDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 104
    end
    object plPrevDayHHppField106: TppField
      FieldAlias = 'IsTripleLiner'
      FieldName = 'IsTripleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 105
    end
    object plPrevDayHHppField107: TppField
      FieldAlias = 'IsLayoffAndUp'
      FieldName = 'IsLayoffAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 106
    end
    object plPrevDayHHppField108: TppField
      FieldAlias = 'IsClaimedAndUp'
      FieldName = 'IsClaimedAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 107
    end
    object plPrevDayHHppField109: TppField
      FieldAlias = 'IsClaimedAndDown'
      FieldName = 'IsClaimedAndDown'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 108
    end
    object plPrevDayHHppField110: TppField
      FieldAlias = 'IsFirstTimeClaiming'
      FieldName = 'IsFirstTimeClaiming'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 109
    end
    object plPrevDayHHppField111: TppField
      FieldAlias = 'IsBelowClaimedPrice'
      FieldName = 'IsBelowClaimedPrice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 110
    end
    object plPrevDayHHppField112: TppField
      FieldAlias = 'IsBlinkersOn'
      FieldName = 'IsBlinkersOn'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 111
    end
    object plPrevDayHHppField113: TppField
      FieldAlias = 'IsBlinkersOff'
      FieldName = 'IsBlinkersOff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 112
    end
    object plPrevDayHHppField114: TppField
      FieldAlias = 'LastEquip'
      FieldName = 'LastEquip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 113
    end
    object plPrevDayHHppField115: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 114
    end
    object plPrevDayHHppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrDebutStarters'
      FieldName = 'NbrDebutStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plPrevDayHHppField117: TppField
      FieldAlias = 'Entry'
      FieldName = 'Entry'
      FieldLength = 5
      DisplayWidth = 5
      Position = 116
    end
    object plPrevDayHHppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'ProgramNbrSort'
      FieldName = 'ProgramNbrSort'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 117
    end
    object plPrevDayHHppField119: TppField
      FieldAlias = 'IsScratched'
      FieldName = 'IsScratched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 118
    end
    object plPrevDayHHppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'Weight'
      FieldName = 'Weight'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 119
    end
    object plPrevDayHHppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceAdvantage'
      FieldName = 'EarlyPaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object plPrevDayHHppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceAdvantage'
      FieldName = 'MiddlePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object plPrevDayHHppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceAdvantage'
      FieldName = 'LatePaceAdvantage'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object plPrevDayHHppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeStarts'
      FieldName = 'LifeStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 123
    end
    object plPrevDayHHppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeWins'
      FieldName = 'LifeWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 124
    end
    object plPrevDayHHppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfStarts'
      FieldName = 'TurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 125
    end
    object plPrevDayHHppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfWins'
      FieldName = 'TurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 126
    end
    object plPrevDayHHppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudStarts'
      FieldName = 'MudStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 127
    end
    object plPrevDayHHppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudWins'
      FieldName = 'MudWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 128
    end
    object plPrevDayHHppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkStarts'
      FieldName = 'TrkStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 129
    end
    object plPrevDayHHppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkWins'
      FieldName = 'TrkWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 130
    end
    object plPrevDayHHppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteStarts'
      FieldName = 'RouteStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 131
    end
    object plPrevDayHHppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteWins'
      FieldName = 'RouteWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 132
    end
    object plPrevDayHHppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintStarts'
      FieldName = 'SprintStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 133
    end
    object plPrevDayHHppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintWins'
      FieldName = 'SprintWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 134
    end
    object plPrevDayHHppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCall'
      FieldName = 'QSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 135
    end
    object plPrevDayHHppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP1stCallRank'
      FieldName = 'QSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 136
    end
    object plPrevDayHHppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCall'
      FieldName = 'QSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 137
    end
    object plPrevDayHHppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'QSP2ndCallRank'
      FieldName = 'QSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 138
    end
    object plPrevDayHHppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCall'
      FieldName = 'KSP1stCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plPrevDayHHppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP1stCallRank'
      FieldName = 'KSP1stCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 140
    end
    object plPrevDayHHppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCall'
      FieldName = 'KSP2ndCall'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 141
    end
    object plPrevDayHHppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'KSP2ndCallRank'
      FieldName = 'KSP2ndCallRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 142
    end
    object plPrevDayHHppField144: TppField
      FieldAlias = 'TodaysWagerOrderKey'
      FieldName = 'TodaysWagerOrderKey'
      FieldLength = 30
      DisplayWidth = 30
      Position = 143
    end
    object plPrevDayHHppField145: TppField
      FieldAlias = 'IsUpInClass'
      FieldName = 'IsUpInClass'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 144
    end
    object plPrevDayHHppField146: TppField
      FieldAlias = 'IsDownInClass'
      FieldName = 'IsDownInClass'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 145
    end
    object plPrevDayHHppField147: TppField
      FieldAlias = 'Is1stClaiming'
      FieldName = 'Is1stClaiming'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 146
    end
    object plPrevDayHHppField148: TppField
      FieldAlias = 'Is1stMCL'
      FieldName = 'Is1stMCL'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 147
    end
    object plPrevDayHHppField149: TppField
      FieldAlias = 'Is1stAfterLayoff'
      FieldName = 'Is1stAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 148
    end
    object plPrevDayHHppField150: TppField
      FieldAlias = 'Is2ndAfterLayoff'
      FieldName = 'Is2ndAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 149
    end
    object plPrevDayHHppField151: TppField
      FieldAlias = 'Is3rdAfterLayoff'
      FieldName = 'Is3rdAfterLayoff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 150
    end
    object plPrevDayHHppField152: TppField
      FieldAlias = 'IsXtremeSpeed'
      FieldName = 'IsXtremeSpeed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 151
    end
    object plPrevDayHHppField153: TppField
      FieldAlias = 'Is2yoBred'
      FieldName = 'Is2yoBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 152
    end
    object plPrevDayHHppField154: TppField
      FieldAlias = 'Is1stBred'
      FieldName = 'Is1stBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 153
    end
    object plPrevDayHHppField155: TppField
      FieldAlias = 'IsTurfBred'
      FieldName = 'IsTurfBred'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 154
    end
    object plPrevDayHHppField156: TppField
      FieldAlias = 'IsYouBetTrack'
      FieldName = 'IsYouBetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 155
    end
    object plPrevDayHHppField157: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 156
    end
    object plPrevDayHHppField158: TppField
      FieldAlias = 'IsWagerSheetSelected'
      FieldName = 'IsWagerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 157
    end
    object plPrevDayHHppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPct'
      FieldName = 'TodaysWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 158
    end
    object plPrevDayHHppField160: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerValueBet'
      FieldName = 'TodaysWagerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 159
    end
    object plPrevDayHHppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerLineTo1Fair'
      FieldName = 'TodaysWagerLineTo1Fair'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 160
    end
    object plPrevDayHHppField162: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPctRank'
      FieldName = 'TodaysWagerWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 161
    end
    object plPrevDayHHppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnWinsRank'
      FieldName = 'TrnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 162
    end
    object plPrevDayHHppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnEarningsRank'
      FieldName = 'TrnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 163
    end
    object plPrevDayHHppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTrackRank'
      FieldName = 'TrnTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 164
    end
    object plPrevDayHHppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyWinsRank'
      FieldName = 'JkyWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 165
    end
    object plPrevDayHHppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyEarningsRank'
      FieldName = 'JkyEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 166
    end
    object plPrevDayHHppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyTrackRank'
      FieldName = 'JkyTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 167
    end
    object plPrevDayHHppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnWinsRank'
      FieldName = 'OwnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 168
    end
    object plPrevDayHHppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnEarningsRank'
      FieldName = 'OwnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 169
    end
    object plPrevDayHHppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPct'
      FieldName = 'TotalOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 170
    end
    object plPrevDayHHppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRank'
      FieldName = 'TotalOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 171
    end
    object plPrevDayHHppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerSelectedRank'
      FieldName = 'WagerSelectedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 172
    end
  end
  object ppPrevDayReport: TppReport
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
    Template.FileName = 'D:\Ratings31\HospitalResults.rtm'
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
        Caption = 'Hospital Top Pick'
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
      mmHeight = 15346
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 15346
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
      object RaceNbr: TppDBText
        UserName = 'RaceNbr'
        DataField = 'RaceNbr'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
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
        Font.Style = []
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
        Font.Style = []
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
        Font.Style = []
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
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3217
        mmLeft = 43646
        mmTop = 0
        mmWidth = 10329
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
        mmHeight = 2540
        mmLeft = 43688
        mmTop = 0
        mmWidth = 2879
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
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object FinishNbrs: TppDBText
        UserName = 'FinishNbrs'
        DataField = 'WagerFinalOrder'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
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
        mmTop = 0
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
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 184415
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
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
        mmHeight = 15346
        mmLeft = 47096
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbDailyDoublePayout: TppDBText
        UserName = 'DailyDoublePayoutFirstRace'
        BlankWhenZero = True
        DataField = 'DailyDoublePayoutLastRace'
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
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object dbPick4Payout: TppDBText
        UserName = 'Pick4Payout'
        BlankWhenZero = True
        DataField = 'Pick4PayoutLastRace'
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
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 15346
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
        mmHeight = 15346
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
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 144727
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 15346
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
        Font.Style = []
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
      object dbSheetOrder: TppDBText
        UserName = 'SheetOrder'
        DataField = 'TodaysWagerOrder'
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
        mmHeight = 3175
        mmLeft = 105834
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 15346
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
        Font.Style = []
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
        Font.Style = []
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
        Font.Style = []
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
        DataField = 'Pick3PayoutLastRace'
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
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object dbDailyDoubleNbrs: TppDBText
        UserName = 'DailyDoubleNbrs'
        BlankWhenZero = True
        DataField = 'DailyDoubleNbrsLastRace'
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
        mmTop = 4233
        mmWidth = 17198
        BandType = 4
      end
      object dbPick3Nbrs: TppDBText
        UserName = 'Pick3Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3NbrsLastRace'
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
        mmLeft = 225012
        mmTop = 4233
        mmWidth = 17611
        BandType = 4
      end
      object dbPick4Nbrs: TppDBText
        UserName = 'Pick4Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4NbrsLastRace'
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
        mmHeight = 2498
        mmLeft = 250762
        mmTop = 4233
        mmWidth = 15409
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
        mmHeight = 2910
        mmLeft = 529
        mmTop = 6085
        mmWidth = 10848
        BandType = 4
      end
      object WagerAmt: TppDBText
        UserName = 'WagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'WagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2540
        mmLeft = 38006
        mmTop = 3175
        mmWidth = 8297
        BandType = 4
      end
      object detailWinWagered: TppVariable
        UserName = 'detWinWagered'
        CalcOrder = 0
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2498
        mmLeft = 48419
        mmTop = 3704
        mmWidth = 12531
        BandType = 4
      end
      object detailWinPayout: TppVariable
        UserName = 'detWinPayout'
        CalcOrder = 1
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 50006
        mmTop = 6350
        mmWidth = 10848
        BandType = 4
      end
      object detailPlcPayout: TppVariable
        UserName = 'detPlcPayout'
        CalcOrder = 2
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 50536
        mmTop = 9260
        mmWidth = 10319
        BandType = 4
      end
      object detailShoPayout: TppVariable
        UserName = 'detShoPayout'
        CalcOrder = 3
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 50006
        mmTop = 12171
        mmWidth = 10848
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
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 143404
        mmTop = 4233
        mmWidth = 13885
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
        mmHeight = 2879
        mmLeft = 159735
        mmTop = 4233
        mmWidth = 10922
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
        mmHeight = 2879
        mmLeft = 172720
        mmTop = 4233
        mmWidth = 10372
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
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 184457
        mmTop = 4233
        mmWidth = 11599
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 143404
        mmTop = 7673
        mmWidth = 123031
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line101'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 143934
        mmTop = 3440
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
        mmHeight = 2455
        mmLeft = 0
        mmTop = 9525
        mmWidth = 12869
        BandType = 4
      end
      object PlcWagerAmt: TppDBText
        UserName = 'PlcWagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PlcWagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2540
        mmLeft = 35635
        mmTop = 5821
        mmWidth = 10668
        BandType = 4
      end
      object ShoWagerAmt: TppDBText
        UserName = 'ShoWagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'ShoWagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2540
        mmLeft = 34958
        mmTop = 8731
        mmWidth = 11345
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
        mmHeight = 2879
        mmLeft = 55774
        mmTop = 265
        mmWidth = 5080
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 98425
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 14288
        mmLeft = 56621
        mmTop = 24871
        mmWidth = 191294
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 39423
        mmLeft = 529
        mmTop = 265
        mmWidth = 55298
        BandType = 7
      end
      object imgWin: TppShape
        UserName = 'imgWin'
        mmHeight = 21960
        mmLeft = 56356
        mmTop = 794
        mmWidth = 61913
        BandType = 7
      end
      object ppVarTotalWins: TppVariable
        UserName = 'vWins'
        CalcOrder = 1
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 46874
        mmTop = 7673
        mmWidth = 6308
        BandType = 7
      end
      object ppVarTotalStarts: TppVariable
        UserName = 'vStarts'
        CalcOrder = 0
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 45984
        mmTop = 2646
        mmWidth = 7197
        BandType = 7
      end
      object ppVarTotalPlcs: TppVariable
        UserName = 'vPlcs'
        CalcOrder = 2
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 47679
        mmTop = 12700
        mmWidth = 5503
        BandType = 7
      end
      object lblStarts: TppLabel
        UserName = 'lblStarts'
        Caption = 'Starts '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 2381
        mmWidth = 7239
        BandType = 7
      end
      object lblWins: TppLabel
        UserName = 'lblWins'
        Caption = 'Wins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 7408
        mmWidth = 5588
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'lblPlcs'
        Caption = 'Places'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 12435
        mmWidth = 7451
        BandType = 7
      end
      object ppVarTotalWinPct: TppVariable
        UserName = 'vWinPct'
        CalcOrder = 3
        DataType = dtDouble
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 44672
        mmTop = 23283
        mmWidth = 8509
        BandType = 7
      end
      object ppLabel21: TppLabel
        UserName = 'lblWinPct'
        Caption = 'Win Pct'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 23019
        mmWidth = 8551
        BandType = 7
      end
      object ppLabel22: TppLabel
        UserName = 'lblAvgOdds'
        Caption = 'Avg Win Odds To $1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 34131
        mmWidth = 22775
        BandType = 7
      end
      object ppVarAvgOdds: TppVariable
        UserName = 'vAvgOdds'
        CalcOrder = 5
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 41899
        mmTop = 34131
        mmWidth = 10753
        BandType = 7
      end
      object ppVarTotalOdds: TppVariable
        UserName = 'vTotalOdds'
        CalcOrder = 4
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 40714
        mmTop = 28840
        mmWidth = 11938
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'lblTotalOdds'
        Caption = 'Total Odds To 1$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1323
        mmTop = 28310
        mmWidth = 19008
        BandType = 7
      end
      object ppLabel24: TppLabel
        UserName = 'lblWinWagered'
        Caption = '$2 Win Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 18076
        BandType = 7
      end
      object ppLabel25: TppLabel
        UserName = 'lblWinPayout'
        Caption = '$2 Win Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 6615
        mmWidth = 17314
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'lblWinPL'
        Caption = '$2 Win P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 11377
        mmWidth = 11811
        BandType = 7
      end
      object varWinWagered: TppVariable
        UserName = 'vWinWagered'
        CalcOrder = 6
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 101991
        mmTop = 1588
        mmWidth = 14690
        BandType = 7
      end
      object ppVariable2: TppVariable
        UserName = 'vWinWon'
        CalcOrder = 7
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 106108
        mmTop = 6350
        mmWidth = 9991
        BandType = 7
      end
      object ppVariable3: TppVariable
        UserName = 'vWinPL'
        CalcOrder = 8
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 108088
        mmTop = 11906
        mmWidth = 8594
        BandType = 7
      end
      object ppVariable4: TppVariable
        UserName = 'vShos'
        CalcOrder = 9
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 46705
        mmTop = 17727
        mmWidth = 6477
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'lblShos'
        Caption = 'Shows'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 1588
        mmTop = 17463
        mmWidth = 7578
        BandType = 7
      end
      object imgPlc: TppShape
        UserName = 'imgPlc'
        mmHeight = 21960
        mmLeft = 121179
        mmTop = 794
        mmWidth = 61913
        BandType = 7
      end
      object ppLabel28: TppLabel
        UserName = 'lblPlcWagered'
        Caption = '$2 Place Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 2117
        mmWidth = 19844
        BandType = 7
      end
      object ppLabel29: TppLabel
        UserName = 'lblPlcPayout'
        Caption = '$2 Place Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 6879
        mmWidth = 19050
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'lblPlcPL'
        Caption = '$2 Place P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 11906
        mmWidth = 13758
        BandType = 7
      end
      object varPlcWagered: TppVariable
        UserName = 'vPlcWagered'
        CalcOrder = 10
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 2117
        mmWidth = 13758
        BandType = 7
      end
      object ppVariable6: TppVariable
        UserName = 'vPlcWon'
        CalcOrder = 11
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 172244
        mmTop = 6879
        mmWidth = 9260
        BandType = 7
      end
      object ppVariable7: TppVariable
        UserName = 'vPlcPL'
        CalcOrder = 12
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 11906
        mmWidth = 7938
        BandType = 7
      end
      object imgSho: TppShape
        UserName = 'imgSho'
        mmHeight = 21960
        mmLeft = 186532
        mmTop = 1058
        mmWidth = 61913
        BandType = 7
      end
      object ppLabel46: TppLabel
        UserName = 'lblShoWagered'
        Caption = '$2 Show Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 2381
        mmWidth = 20108
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'lblShoPayout'
        Caption = '$2 Show Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 7144
        mmWidth = 19315
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'lblShoPL'
        Caption = '$2 Show P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 12171
        mmWidth = 13758
        BandType = 7
      end
      object varShoWagered: TppVariable
        UserName = 'vShoWagered'
        CalcOrder = 13
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 231775
        mmTop = 2381
        mmWidth = 14817
        BandType = 7
      end
      object varShoWon: TppVariable
        UserName = 'vShoWon'
        CalcOrder = 14
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 236538
        mmTop = 7144
        mmWidth = 10054
        BandType = 7
      end
      object ppVariable25: TppVariable
        UserName = 'vShoPL'
        CalcOrder = 15
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 237861
        mmTop = 12171
        mmWidth = 8731
        BandType = 7
      end
      object lblFilter: TppLabel
        UserName = 'lblFilter'
        AutoSize = False
        Caption = 'lblFilter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 18521
        mmLeft = 5027
        mmTop = 76465
        mmWidth = 262996
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'lblWPSPL'
        Caption = 'WPS P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 26194
        mmWidth = 9525
        BandType = 7
      end
      object vWPSPL: TppVariable
        UserName = 'vWPSPL'
        CalcOrder = 16
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 26458
        mmWidth = 9260
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'lblWinPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 16669
        mmWidth = 6350
        BandType = 7
      end
      object varPLPct: TppVariable
        UserName = 'vWinPLPct'
        CalcOrder = 17
        DataType = dtDouble
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 104764
        mmTop = 16933
        mmWidth = 11388
        BandType = 7
      end
      object ppVariable8: TppVariable
        UserName = 'vPlcPLPct'
        CalcOrder = 18
        DataType = dtDouble
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 17727
        mmWidth = 10583
        BandType = 7
      end
      object ppLabel34: TppLabel
        UserName = 'lblPlcPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 17463
        mmWidth = 6350
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'lblShoPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 17463
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable9: TppVariable
        UserName = 'vShoPLPct'
        CalcOrder = 19
        DataType = dtDouble
        DisplayFormat = '0 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 234950
        mmTop = 17727
        mmWidth = 11642
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'lblTotalPL'
        Caption = 'Total P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 57679
        mmTop = 31750
        mmWidth = 9790
        BandType = 7
      end
      object varTotalPL: TppVariable
        UserName = 'vTotalPL'
        CalcOrder = 20
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100277
        mmTop = 33073
        mmWidth = 9260
        BandType = 7
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
        6F6772616D4E616D65061046696E697368506F734F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506BF70726F
        6365647572652046696E697368506F734F6E5072696E743B0D0A626567696E0D
        0A0D0A2020696620706C5072657644617948485B2746696E697368506F73275D
        203D2031207468656E20626567696E0D0A202020202046696E697368506F732E
        466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062
        6567696E0D0A202020202046696E697368506F732E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060946696E697368506F73094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060B7657696E734F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F75726365068E
        70726F636564757265207657696E734F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C50726576
        44617948485B2746696E697368506F73275D203D2031207468656E2062656769
        6E0D0A2020202056616C7565203A3D2056616C7565202B20313B0D0A2020656E
        643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057657
        696E73094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E
        54726B436F64654F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F7572636506B770726F6365647572652054726B436F64
        654F6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C5072657644
        617948485B2746696E697368506F73275D203D2031207468656E20626567696E
        0D0A202020202054726B436F64652E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A202020202054726B436F64
        652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060754726B436F64650945
        76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65061150726F67
        72616D4E62724F6E5072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F7572636506BC70726F6365647572652050726F6772616D
        4E62724F6E5072696E743B0D0A626567696E0D0A696620706C50726576446179
        48485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A
        202020202050726F6772616D4E62722E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A202020202050726F6772
        616D4E62722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E64
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A50726F6772
        616D4E6272094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        650610486F7273654E616D654F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506BD70726F6365647572652048
        6F7273654E616D654F6E5072696E743B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617948485B2746696E697368506F73275D203D203120746865
        6E20626567696E0D0A2020202020486F7273654E616D652E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        202020486F7273654E616D652E466F6E742E426F6C64203A3D2046616C73653B
        0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        0609486F7273654E616D65094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060E526163654E62724F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506B770726F63656475
        726520526163654E62724F6E5072696E743B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617948485B2746696E697368506F73275D203D20312074
        68656E20626567696E0D0A2020202020526163654E62722E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        202020526163654E62722E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650607
        526163654E6272094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D6506164D6F726E696E674C696E65446573634F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506D670726F
        636564757265204D6F726E696E674C696E65446573634F6E5072696E743B0D0A
        626567696E0D0A2020696620706C5072657644617948485B274D6F726E696E67
        4C696E65546F3152616E6B275D203D2031207468656E20626567696E0D0A2020
        2020204D6F726E696E674C696E65446573632E466F6E742E426F6C64203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A20202020204D6F
        726E696E674C696E65446573632E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060F4D6F726E696E674C696E6544657363094576656E744E616D6506074F6E
        5072696E74074576656E74494402200001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060D765374617274734F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506CB70
        726F63656475726520765374617274734F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C507265
        7644617948485B2746696E697368506F73275D203E2030207468656E20626567
        696E0D0A2020202020696620706C5072657644617948485B274F646473275D20
        3E2030207468656E20626567696E0D0A09202056616C7565203A3D2056616C75
        65202B20313B0D0A2020202020656E643B0D0A2020656E643B20202020200D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D650607765374617274
        73094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060B7650
        6C63734F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F75726365068E70726F6365647572652076506C63734F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        2020696620706C5072657644617948485B2746696E697368506F73275D203D20
        32207468656E20626567696E0D0A2020202056616C7565203A3D2056616C7565
        202B20313B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060576506C6373094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061146696E6973684E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506B17072
        6F6365647572652046696E6973684E6272734F6E5072696E743B0D0A62656769
        6E0D0A0D0A202046696E6973684E6272732E466F6E742E426F6C64203A3D2046
        616C73653B0D0A0D0A2020696620706C5072657644617948485B2746696E6973
        68506F73275D203D2031207468656E20626567696E0D0A202020202020204669
        6E6973684E6272732E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A46
        696E6973684E627273094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061153686565744F726465724F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506EB70726F636564
        7572652053686565744F726465724F6E5072696E743B0D0A626567696E0D0A0D
        0A202053686565744F726465722E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A20202020200D0A2020696620706C5072657644617948485B2746696E69
        7368506F73275D203D2031207468656E20626567696E0D0A2020202020536865
        65744F726465722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E
        6420656C736520626567696E0D0A202020202053686565744F726465722E466F
        6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060A53686565744F7264657209
        4576656E744E616D6506074F6E5072696E74074576656E74494402200001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65061057696E
        5061796F75744F6E5072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F7572636506E970726F6365647572652057696E5061796F
        75744F6E5072696E743B0D0A626567696E0D0A0D0A20202057696E5061796F75
        742E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020
        20696620706C5072657644617948485B2746696E697368506F73275D203D2031
        207468656E20626567696E0D0A202020202057696E5061796F75742E466F6E74
        2E426F6C64203A3D20547275653B0D0A2020656E6420656C736520626567696E
        0D0A202020202057696E5061796F75742E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060957696E5061796F7574094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060D7657696E5063744F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C340100
        0070726F636564757265207657696E5063744F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A6957696E5063743A696E7465
        6765723B0D0A6657696E5063743A646F75626C653B0D0A626567696E20202020
        202020200D0A0D0A2020206957696E5063743A3D303B0D0A2020206657696E50
        63743A3D303B0D0A2020202020202020202020202020200D0A20202069662028
        765374617274732E4173496E7465676572203E203029207468656E2062656769
        6E0D0A2020202020206657696E506374203A3D20287657696E732E4173496E74
        6567657220202F20765374617274732E4173496E746567657229202A20313030
        3B0D0A202020656E643B2020200D0A2020200D0A20202056616C7565203A3D20
        6657696E5063743B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506077657696E506374094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061076546F74616C4F6464734F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506A770726F6365
        647572652076546F74616C4F6464734F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C50726576
        44617948485B2746696E697368506F73275D203D2031207468656E2062656769
        6E0D0A2020202056616C7565203A3D2056616C7565202B20706C507265764461
        7948485B274F646473275D3B0D0A2020656E643B0D0A20200D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060A76546F74616C4F64647309457665
        6E744E616D6506064F6E43616C63074576656E74494402210001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65060E764176674F6464
        734F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C9601000070726F63656475726520764176674F6464734F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A
        664176674F6464733A646F75626C653B0D0A665374617274733A646F75626C65
        3B0D0A6657696E733A646F75626C653B0D0A0D0A626567696E0D0A2020202020
        2020202020202020200D0A202020664176674F6464733A3D303B0D0A20202066
        5374617274733A3D303B0D0A2020206657696E733A3D303B0D0A0D0A20202066
        537461727473203A3D20765374617274732E4173496E74656765723B20202020
        202020202020202020200D0A2020206657696E73203A3D207657696E732E4173
        496E74656765723B20202020202020202020202020200D0A2020202020200D0A
        2020206966202866537461727473203E203029207468656E20626567696E0D0A
        202020202020664176674F646473203A3D202876546F74616C4F6464732E4173
        446F75626C65202F206657696E73293B0D0A202020656E643B2020200D0A2020
        200D0A20202056616C7565203A3D20664176674F6464733B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D650608764176674F646473094576656E74
        4E616D6506064F6E43616C63074576656E74494402210001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D6506117657696E5761676572
        65644F6E43616C630B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C0401000070726F636564757265207657696E5761676572
        65644F6E43616C63287661722056616C75653A2056617269616E74293B0D0A76
        61720D0A6657696E5761676572416D743A646F75626C653B0D0A626567696E0D
        0A2020200D0A2020200D0A202020696620706C5072657644617948485B274F64
        6473275D203E2030207468656E20626567696E0D0A096657696E576167657241
        6D74203A3D20322E30303B200D0A202020656E6420656C736520626567696E0D
        0A202020096657696E5761676572416D74203A3D20303B0D0A202020656E643B
        0D0A0D0A202076616C7565203A3D206657696E5761676572416D74202B205661
        6C75653B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0B7657696E57616765726564094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060D7657696E576F6E4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650CA201000070726F6365
        64757265207657696E576F6E4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A207661720D0A664F6464733A20646F75626C653B0D0A66
        5061796F75743A646F75626C653B0D0A665761676572416D743A646F75626C65
        3B0D0A0D0A626567696E0D0A0D0A202020202020665761676572416D74203A3D
        2020323B0D0A202020202020664F646473203A3D20706C507265764461794848
        5B274F646473275D3B0D0A202020202020665061796F7574203A3D20303B0D0A
        2020200D0A09696620664F646473203E2030207468656E20626567696E0D0A09
        0969662028706C5072657644617948485B2746696E697368506F73275D203D20
        3129207468656E20626567696E0D0A090909665061796F7574203A3D2028664F
        646473202A20665761676572416D7429202B20665761676572416D743B0D0A09
        09656E643B0D0A090956616C7565203A3D2056616C7565202B20665061796F75
        743B0D0A09656E6420656C736520626567696E0D0A090956616C7565203A3D20
        56616C75653B0D0A20202009656E643B0D0A2020200D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506077657696E576F6E094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060C7657696E504C4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C6D01
        000070726F636564757265207657696E504C4F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F
        75626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A6654
        6F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F74
        616C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D
        0A20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E
        203A3D207657696E576F6E2E4173446F75626C653B2020202020202020202020
        2020200D0A20202066546F74616C57616765726564203A3D207657696E576167
        657265642E4173446F75626C653B20202020202020202020202020200D0A2020
        2066546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C57
        6167657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F74
        616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060676
        57696E504C094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060B7653686F734F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F75726365068E70726F636564757265207653686F734F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A626567696E
        0D0A0D0A2020696620706C5072657644617948485B2746696E697368506F7327
        5D203D2033207468656E20626567696E0D0A2020202056616C7565203A3D2056
        616C7565202B20313B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506057653686F73094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061176506C63576167657265644F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06F170726F6365647572652076506C63576167657265644F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A7661720D0A66576167657241
        6D743A646F75626C653B0D0A626567696E0D0A2020202020200D0A2020696620
        706C5072657644617948485B274F646473275D203E2030207468656E20626567
        696E0D0A202009665761676572416D74203A3D20323B0D0A2020656E6420656C
        736520626567696E0D0A20202009665761676572416D74203A3D20303B0D0A20
        20656E643B0D0A0D0A202056616C7565203A3D20665761676572416D74202B20
        56616C75653B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060B76506C6357616765726564094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060D76506C63576F6E4F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C8802000070726F
        6365647572652076506C63576F6E4F6E43616C63287661722056616C75653A20
        56617269616E74293B0D0A7661720D0A664F6464733A646F75626C653B0D0A66
        5761676572416D743A646F75626C653B0D0A665061794F75743A646F75626C65
        3B0D0A626567696E0D0A202020664F6464733A3D303B0D0A2020200D0A202020
        6966202828706C5072657644617948485B2746696E697368506F73275D203E3D
        203129616E642028706C5072657644617948485B2746696E697368506F73275D
        203C3D20322929207468656E20626567696E0D0A20202009696620706C507265
        7644617952485B2757696E506C635061796F7574275D203E2030207468656E20
        626567696E0D0A09202020202020664F646473203A3D2028706C507265764461
        7952485B2757696E506C635061796F7574275D202D20322E303029202F20323B
        0D0A202020202020656E643B0D0A202020656E643B0D0A2020200D0A20202066
        5761676572416D74203A3D2020323B0D0A202020665061796F7574203A3D2030
        3B0D0A2020200D0A202020696620664F646473203E2030207468656E20626567
        696E0D0A096966202828706C5072657644617948485B2746696E697368506F73
        275D203E3D20312920616E642028706C5072657644617948485B2746696E6973
        68506F73275D203C3D20322929207468656E20626567696E0D0A090966506179
        6F7574203A3D2028664F646473202A20665761676572416D7429202B20665761
        676572416D743B0D0A09656E643B0D0A0956616C7565203A3D2056616C756520
        2B20665061796F75743B0D0A202020656E6420656C736520626567696E0D0A09
        56616C7565203A3D2056616C75653B0D0A202020656E643B0D0A2020200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060776506C63576F6E09457665
        6E744E616D6506064F6E43616C63074576656E74494402210001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65060C76506C63504C4F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C6D01000070726F6365647572652076506C63504C4F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A7661720D0A66546F74
        616C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A646F75
        626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D0A0D
        0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C57616765
        7265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A20202066
        546F74616C576F6E203A3D2076506C63576F6E2E4173446F75626C653B202020
        20202020202020202020200D0A20202066546F74616C57616765726564203A3D
        2076506C63576167657265642E4173446F75626C653B20202020202020202020
        202020200D0A20202066546F74616C504C203A3D2066546F74616C576F6E202D
        2066546F74616C576167657265643B20200D0A2020200D0A20202056616C7565
        203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060676506C63504C094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506117653686F576167657265644F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506F170726F
        636564757265207653686F576167657265644F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A665761676572416D743A646F
        75626C653B0D0A626567696E0D0A2020200D0A202020696620706C5072657644
        617948485B274F646473275D203E2030207468656E20626567696E0D0A096657
        61676572416D74203A3D20323B0D0A202020656E6420656C736520626567696E
        0D0A20202009665761676572416D74203A3D20303B0D0A202020656E643B0D0A
        0D0A202056616C7565203A3D20665761676572416D74202B2056616C75653B0D
        0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060B7653
        686F57616765726564094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060D7653686F576F6E4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C9002000070726F6365647572
        65207653686F576F6E4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A7661720D0A664F6464733A646F75626C653B0D0A665761676572
        416D743A646F75626C653B0D0A665061794F75743A646F75626C653B0D0A6265
        67696E0D0A202020664F6464733A3D303B0D0A2020200D0A2020206966202828
        706C5072657644617948485B2746696E697368506F73275D203E3D2031292061
        6E642028706C5072657644617948485B2746696E697368506F73275D203C3D20
        332929207468656E20626567696E0D0A20202009696620706C50726576446179
        52485B2757696E53686F5061796F7574275D203E2030207468656E2062656769
        6E0D0A09202020202020664F646473203A3D2028706C5072657644617952485B
        2757696E53686F5061796F7574275D202D20322E303029202F20323B0D0A2020
        20202020656E643B0D0A202020656E643B0D0A2020200D0A2020200D0A202020
        665761676572416D74203A3D2020323B0D0A202020665061796F7574203A3D20
        303B0D0A2020200D0A202020696620664F646473203E2030207468656E206265
        67696E0D0A096966202828706C5072657644617948485B2746696E697368506F
        73275D203E3D20312920616E642028706C5072657644617948485B2746696E69
        7368506F73275D203C3D20332929207468656E20626567696E0D0A0909665061
        796F7574203A3D2028664F646473202A20665761676572416D7429202B206657
        61676572416D743B0D0A09656E643B0D0A0956616C7565203A3D2056616C7565
        202B20665061796F75743B0D0A202020656E6420656C736520626567696E0D0A
        0956616C7565203A3D2056616C75653B0D0A202020656E643B0D0A2020200D0A
        656E643B0D0A0D0A0D436F6D706F6E656E744E616D6506077653686F576F6E09
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060C7653686F
        504C4F6E43616C630B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C6F01000070726F636564757265207653686F504C4F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A66
        546F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A
        646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E
        0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C57
        6167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A0D
        0A20202066546F74616C576F6E203A3D207653686F576F6E2E4173446F75626C
        653B20202020202020202020202020200D0A20202066546F74616C5761676572
        6564203A3D207653686F576167657265642E4173446F75626C653B2020202020
        2020202020202020200D0A20202066546F74616C504C203A3D2066546F74616C
        576F6E202D2066546F74616C576167657265643B20200D0A2020200D0A202020
        56616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506067653686F504C094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061344657461696C416674657247656E657261
        74650B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365062F70726F6365647572652044657461696C416674657247656E65726174
        653B0D0A626567696E0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060644657461696C094576656E744E616D65060D416674657247656E657261
        7465074576656E74494402190001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060C76575053504C4F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F75726365068770726F6365
        647572652076575053504C4F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A2020200D0A20202056616C7565203A3D20
        207657696E504C2E4173446F75626C65202B2076506C63504C2E4173446F7562
        6C65202B207653686F504C2E4173446F75626C653B0D0A2020200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060676575053504C094576656E744E61
        6D6506064F6E43616C63074576656E74494402210001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65060E57696E4E6272734F6E5072
        696E740B50726F6772616D54797065070B747450726F63656475726506536F75
        72636506DE70726F6365647572652057696E4E6272734F6E5072696E743B0D0A
        626567696E0D0A0D0A202057696E4E6272732E466F6E742E426F6C64203A3D20
        46616C73653B0D0A20202020200D0A202020696620706C507265764461794848
        5B2746696E697368506F73275D203D2031207468656E20626567696E0D0A2020
        20202057696E4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202057696E4E6272732E466F
        6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060757696E4E627273094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65061357696E506C635061
        796F75744F6E5072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F7572636506F470726F6365647572652057696E506C63506179
        6F75744F6E5072696E743B0D0A626567696E0D0A0D0A202057696E506C635061
        796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D
        0A202020696620706C5072657644617948485B2746696E697368506F73275D20
        3D2031207468656E20626567696E0D0A202020202057696E506C635061796F75
        742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C7365
        20626567696E0D0A202020202057696E506C635061796F75742E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060C57696E506C635061796F7574094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65061357696E5368
        6F5061796F75744F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F7572636506F670726F6365647572652057696E53686F
        5061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A202057696E5368
        6F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A202020
        20200D0A202020696620706C5072657644617948485B2746696E697368506F73
        275D203D2031207468656E20626567696E0D0A202020202057696E53686F5061
        796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E642065
        6C736520626567696E0D0A202020202057696E53686F5061796F75742E466F6E
        742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060C57696E53686F5061796F
        7574094576656E744E616D6506074F6E5072696E74074576656E744944022000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E
        506C634E6272734F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F7572636506E370726F63656475726520506C634E6272
        734F6E5072696E743B0D0A626567696E0D0A0D0A202020506C634E6272732E46
        6F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020206966
        20706C5072657644617948485B2746696E697368506F73275D203D2032207468
        656E20626567696E0D0A2020202020506C634E6272732E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        2020506C634E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        650607506C634E627273094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060E53686F4E6272734F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506DD70726F6365647572
        652053686F4E6272734F6E5072696E743B0D0A626567696E0D0A20202053686F
        4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D
        0A202020696620706C5072657644617948485B2746696E697368506F73275D20
        3D2033207468656E20626567696E0D0A202020202053686F4E6272732E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A202020202053686F4E6272732E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060753686F4E627273094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D650610506C635061796F75744F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506E570726F63
        656475726520506C635061796F75744F6E5072696E743B0D0A626567696E0D0A
        202020506C635061796F75742E466F6E742E426F6C64203A3D2046616C73653B
        0D0A20202020200D0A202020696620706C5072657644617948485B2746696E69
        7368506F73275D203D2032207468656E20626567696E0D0A2020202020506C63
        5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A2020202020506C635061796F75742E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D650609506C635061796F7574094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D650613506C6353686F5061
        796F75744F6E5072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F7572636506F370726F63656475726520506C6353686F506179
        6F75744F6E5072696E743B0D0A626567696E0D0A202020506C6353686F506179
        6F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A
        202020696620706C5072657644617948485B2746696E697368506F73275D203D
        2032207468656E20626567696E0D0A2020202020506C6353686F5061796F7574
        2E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C736520
        626567696E0D0A2020202020506C6353686F5061796F75742E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060C506C6353686F5061796F757409457665
        6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061053686F506179
        6F75744F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F7572636506E770726F6365647572652053686F5061796F75744F
        6E5072696E743B0D0A626567696E0D0A20202053686F5061796F75742E466F6E
        742E426F6C64203A3D2046616C73653B0D0A20202020200D0A20202069662070
        6C5072657644617948485B2746696E697368506F73275D203D2033207468656E
        20626567696E0D0A202020202053686F5061796F75742E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        202053686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060953686F5061796F7574094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060F7657696E504C5063744F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F75726365068170726F6365
        64757265207657696E504C5063744F6E43616C63287661722056616C75653A20
        56617269616E74293B0D0A626567696E0D0A20202056616C7565203A3D20436F
        6D70757465504C50637420287657696E576F6E2E4173446F75626C652C765769
        6E576167657265642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506097657696E504C506374094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65060F76506C63504C5063744F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        65068370726F6365647572652076506C63504C5063744F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202056
        616C7565203A3D20436F6D70757465504C506374202876506C63576F6E2E4173
        446F75626C652C76506C63576167657265642E4173446F75626C65290D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060976506C63504C50637409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060F7653686F
        504C5063744F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365068370726F636564757265207653686F504C506374
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A20202056616C7565203A3D20436F6D70757465504C5063742028
        7653686F576F6E2E4173446F75626C652C7653686F576167657265642E417344
        6F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
        7653686F504C506374094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060E76546F74616C504C4F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F75726365069170726F63656475726520
        76546F74616C504C4F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A20200D0A202056616C7565203A3D207657696E50
        4C2E4173446F75626C65202B2076506C63504C2E4173446F75626C65202B2076
        53686F504C2E4173446F75626C653B0D0A202020202020202020200D0A20200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060876546F74616C504C09
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65061364657457
        696E576167657265644F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506AF70726F636564757265206465745769
        6E576167657265644F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A09696620706C5072657644617948485B274F6464
        73275D203E2030207468656E20626567696E0D0A090956616C7565203A3D2056
        616C7565202B2020322E30303B0D0A09656E6420656C736520626567696E0D0A
        090956616C7565203A3D2056616C75653B0D0A09656E643B0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060D64657457696E57616765726564094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061264657457696E
        5061796F75744F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F757263650CA901000070726F636564757265206465745769
        6E5061796F75744F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A7661720D0A664F6464733A20646F75626C653B0D0A665061796F7574
        3A646F75626C653B0D0A665761676572416D743A646F75626C653B0D0A0D0A62
        6567696E0D0A0D0A202020202020665761676572416D74203A3D2020322E3030
        3B0D0A202020202020664F646473203A3D20706C5072657644617948485B274F
        646473275D3B0D0A202020202020665061796F7574203A3D20303B0D0A202020
        0D0A09696620664F646473203E2030207468656E20626567696E0D0A09096966
        2028706C5072657644617948485B2746696E697368506F73275D203D20312920
        7468656E20626567696E0D0A090909665061796F7574203A3D2028664F646473
        202A20665761676572416D7429202B20665761676572416D743B0D0A0909656E
        643B0D0A090956616C7565203A3D2056616C7565202B20665061796F75743B0D
        0A09656E6420656C736520626567696E0D0A090956616C7565203A3D2056616C
        75653B0D0A20202009656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060C64657457696E5061796F7574094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D650612646574506C635061796F75744F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650CED01000070726F63656475726520646574506C635061796F7574
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A766172
        0D0A664F6464733A20646F75626C653B0D0A665061796F75743A646F75626C65
        3B0D0A665761676572416D743A646F75626C653B0D0A0D0A626567696E0D0A0D
        0A202020202020665761676572416D74203A3D2020322E30303B0D0A20202020
        2020664F646473203A3D2028706C5072657644617952485B2757696E506C6350
        61796F7574275D202D20322E303029202F20323B0D0A2020202020200D0A2020
        20202020665061796F7574203A3D20303B0D0A2020200D0A09696620664F6464
        73203E2030207468656E20626567696E0D0A09096966202828706C5072657644
        617948485B2746696E697368506F73275D203E3D20312920616E642028706C50
        72657644617948485B2746696E697368506F73275D203C3D2032292920746865
        6E20626567696E0D0A090909665061796F7574203A3D2028664F646473202A20
        665761676572416D7429202B20665761676572416D743B0D0A0909656E643B0D
        0A090956616C7565203A3D2056616C7565202B20665061796F75743B0D0A0965
        6E6420656C736520626567696E0D0A090956616C7565203A3D2056616C75653B
        0D0A20202009656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060C646574506C635061796F7574094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65061264657453686F5061796F75744F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650CED01000070726F6365647572652064657453686F5061796F75744F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A66
        4F6464733A20646F75626C653B0D0A665061796F75743A646F75626C653B0D0A
        665761676572416D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A2020
        20202020665761676572416D74203A3D2020322E30303B0D0A20202020202066
        4F646473203A3D2028706C5072657644617952485B2757696E53686F5061796F
        7574275D202D20322E303029202F20323B0D0A2020202020200D0A2020202020
        20665061796F7574203A3D20303B0D0A2020200D0A09696620664F646473203E
        2030207468656E20626567696E0D0A09096966202828706C5072657644617948
        485B2746696E697368506F73275D203E3D20312920616E642028706C50726576
        44617948485B2746696E697368506F73275D203C3D20332929207468656E2062
        6567696E0D0A090909665061796F7574203A3D2028664F646473202A20665761
        676572416D7429202B20665761676572416D743B0D0A0909656E643B0D0A0909
        56616C7565203A3D2056616C7565202B20665061796F75743B0D0A09656E6420
        656C736520626567696E0D0A090956616C7565203A3D2056616C75653B0D0A20
        202009656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060C64657453686F5061796F7574094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506115761676572416D744F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F757263650654
        70726F636564757265205761676572416D744F6E476574546578742876617220
        546578743A20537472696E67293B0D0A626567696E0D0A0D0A20205465787420
        3A3D2027322E3030273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D6506085761676572416D74094576656E744E616D6506094F6E476574546578
        74074576656E74494402350001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D650614506C635761676572416D744F6E47657454657874
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        065770726F63656475726520506C635761676572416D744F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020
        54657874203A3D2027322E3030273B0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060B506C635761676572416D74094576656E744E616D650609
        4F6E47657454657874074576656E74494402350001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65061453686F5761676572416D744F
        6E476574546578740B50726F6772616D54797065070B747450726F6365647572
        6506536F75726365065770726F6365647572652053686F5761676572416D744F
        6E476574546578742876617220546578743A20537472696E67293B0D0A626567
        696E0D0A0D0A202054657874203A3D2027322E3030273B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060B53686F5761676572416D7409457665
        6E744E616D6506094F6E47657454657874074576656E74494402350000}
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
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'TypeOfRace='#39'T'#39
    OnNewRecord = tblPrevDayRHNewRecord
    DatabaseName = 'dbHospitalPrevDayReport'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByActualPrimary'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsPrevDayHH
    TableName = 'PrevDayRH'
    Left = 32
    Top = 120
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
