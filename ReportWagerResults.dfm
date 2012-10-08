object WagerResultsReportForm: TWagerResultsReportForm
  Left = 72
  Top = 124
  Width = 568
  Height = 356
  Caption = 'Wager Results Report'
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
    Top = 302
    Width = 560
    Height = 27
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
  object dbWagerResultsReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbWagerResultsReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 424
    Top = 120
  end
  object tblPrevDayHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 
      '((IsPrintedOnValueSheet=True) OR (IsYouBetTrack=True)) AND ( ((O' +
      'wnWinsRank > 0) AND (OwnWinsRank <> 9999)) OR ((OwnEarningsRank ' +
      '> 0) and (OwnEarningsRank <> 9999)) ) AND ((PowerRank >= 1) AND ' +
      '(PowerRank <= 3))'
    Filtered = True
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbWagerResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByFinishPos'
    TableName = 'PrevDayHH'
    Left = 150
    Top = 104
  end
  object dsPrevDayHH: TDataSource
    DataSet = tblPrevDayHH
    Left = 142
    Top = 144
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
      FieldAlias = 'IsOverlaySheetSelected'
      FieldName = 'IsOverlaySheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 158
    end
    object plPrevDayHHppField160: TppField
      FieldAlias = 'IsTopOwnerSheetSelected'
      FieldName = 'IsTopOwnerSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 159
    end
    object plPrevDayHHppField161: TppField
      FieldAlias = 'IsTopOwnerOddsSheetSelected'
      FieldName = 'IsTopOwnerOddsSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 160
    end
    object plPrevDayHHppField162: TppField
      FieldAlias = 'iS2'
      FieldName = 'iS2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 161
    end
    object plPrevDayHHppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPct'
      FieldName = 'TodaysWagerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 162
    end
    object plPrevDayHHppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerValueBet'
      FieldName = 'TodaysWagerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 163
    end
    object plPrevDayHHppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerLineTo1Fair'
      FieldName = 'TodaysWagerLineTo1Fair'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object plPrevDayHHppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysWagerWinPctRank'
      FieldName = 'TodaysWagerWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 165
    end
    object plPrevDayHHppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnWinsRank'
      FieldName = 'TrnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 166
    end
    object plPrevDayHHppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnEarningsRank'
      FieldName = 'TrnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 167
    end
    object plPrevDayHHppField169: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTrackRank'
      FieldName = 'TrnTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 168
    end
    object plPrevDayHHppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyWinsRank'
      FieldName = 'JkyWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 169
    end
    object plPrevDayHHppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyEarningsRank'
      FieldName = 'JkyEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 170
    end
    object plPrevDayHHppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'JkyTrackRank'
      FieldName = 'JkyTrackRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 171
    end
    object plPrevDayHHppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnWinsRank'
      FieldName = 'OwnWinsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 172
    end
    object plPrevDayHHppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnEarningsRank'
      FieldName = 'OwnEarningsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 173
    end
    object plPrevDayHHppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPct'
      FieldName = 'TotalOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object plPrevDayHHppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRank'
      FieldName = 'TotalOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 175
    end
    object plPrevDayHHppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerSelectedRank'
      FieldName = 'WagerSelectedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 176
    end
    object plPrevDayHHppField178: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerAmt'
      FieldName = 'WagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 177
    end
    object plPrevDayHHppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcWagerAmt'
      FieldName = 'PlcWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 178
    end
    object plPrevDayHHppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'ShoWagerAmt'
      FieldName = 'ShoWagerAmt'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 179
    end
    object plPrevDayHHppField181: TppField
      FieldAlias = 'CT'
      FieldName = 'CT'
      FieldLength = 10
      DisplayWidth = 10
      Position = 180
    end
  end
  object ppWagerResultsReport: TppReport
    AutoStop = False
    DataPipeline = plPrevDayHH
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\ratings31\LinerResults.rtm'
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
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 248
    Top = 104
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plPrevDayHH'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15610
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 15610
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 15610
        mmLeft = 0
        mmTop = 0
        mmWidth = 203200
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
        Caption = 'Fin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2836
        mmLeft = 49382
        mmTop = 10319
        mmWidth = 3006
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
        mmHeight = 2836
        mmLeft = 56262
        mmTop = 10319
        mmWidth = 5122
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
        mmHeight = 3969
        mmLeft = 134408
        mmTop = 10054
        mmWidth = 7673
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
        Caption = 'Liner Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 0
        mmWidth = 143669
        BandType = 0
      end
      object varStartDate: TppLabel
        UserName = 'lblStartDate'
        Caption = 'lblStartDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5292
        mmLeft = 147638
        mmTop = 0
        mmWidth = 19050
        BandType = 0
      end
      object varEndDate: TppLabel
        UserName = 'lblEndDate'
        Caption = 'EndDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5292
        mmLeft = 178065
        mmTop = 0
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lblFinishNbrs1'
        Caption = 'Win'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 10054
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Place'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 10054
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Show'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 183092
        mmTop = 9525
        mmWidth = 6615
        BandType = 0
      end
    end
    object DetailBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object dbRaceNbr: TppDBText
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
        mmHeight = 3969
        mmLeft = 41540
        mmTop = 0
        mmWidth = 10848
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
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3440
        mmLeft = 43392
        mmTop = 0
        mmWidth = 3175
        BandType = 4
      end
      object FinishNbrs: TppDBText
        UserName = 'FinishNbrs'
        DataField = 'WagerSheetOrder'
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
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 121709
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpRight
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 142875
        mmTop = 0
        mmWidth = 794
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 13229
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
        mmLeft = 47096
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 19844
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
      object TodaysWagerOrder: TppDBText
        UserName = 'TodaysWagerOrder'
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
        mmHeight = 19844
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
        mmHeight = 2836
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
        mmHeight = 2836
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
      object ppDBText1: TppDBText
        UserName = 'TrkCode1'
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
      object WagerAmt: TppDBText
        UserName = 'WagerAmt'
        AutoSize = True
        DataField = 'WagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3440
        mmLeft = 151341
        mmTop = 0
        mmWidth = 2117
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
        mmHeight = 2381
        mmLeft = 147109
        mmTop = 5027
        mmWidth = 6879
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
        mmLeft = 147109
        mmTop = 9790
        mmWidth = 6879
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
        mmLeft = 164836
        mmTop = 9790
        mmWidth = 6879
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
        mmLeft = 182827
        mmTop = 9260
        mmWidth = 6879
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
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3440
        mmLeft = 0
        mmTop = 10054
        mmWidth = 13229
        BandType = 4
      end
      object PlcWagerAmt: TppDBText
        UserName = 'PlcWagerAmt'
        AutoSize = True
        DataField = 'PlcWagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3440
        mmLeft = 169598
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ShoWagerAmt: TppDBText
        UserName = 'ShoWagerAmt'
        AutoSize = True
        DataField = 'ShoWagerAmt'
        DataPipeline = plPrevDayHH
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3440
        mmLeft = 187590
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object Odds: TppDBText
        UserName = 'Odds'
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
        mmHeight = 3440
        mmLeft = 55710
        mmTop = 265
        mmWidth = 5292
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line14'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 19579
        mmWidth = 203200
        BandType = 4
      end
      object WagerFinalOrder: TppDBText
        UserName = 'WagerFinalOrder'
        DataField = 'WagerFinalOrder'
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
        mmLeft = 106098
        mmTop = 4233
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'MorningLineDesc1'
        AutoSize = True
        DataField = 'Power'
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
        mmHeight = 3440
        mmLeft = 14023
        mmTop = 3969
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'PowerRank'
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
        mmHeight = 3440
        mmLeft = 21431
        mmTop = 3969
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'OwnWinsRank'
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
        mmHeight = 3440
        mmLeft = 35983
        mmTop = 7938
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'OwnEarningsRank'
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
        mmHeight = 3440
        mmLeft = 42862
        mmTop = 7938
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'MorningLineTo1Rank'
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
        mmHeight = 3440
        mmLeft = 45244
        mmTop = 3969
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'Odds1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrOfOwnerOddsSelected'
        DataPipeline = plPrevDayRH
        DisplayFormat = '##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3440
        mmLeft = 35190
        mmTop = 4233
        mmWidth = 25929
        BandType = 4
      end
      object detailPlcWagered: TppVariable
        UserName = 'detailPlcWagered'
        CalcOrder = 4
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 164836
        mmTop = 5027
        mmWidth = 6879
        BandType = 4
      end
      object detailShoWagered: TppVariable
        UserName = 'detailShoWagered'
        CalcOrder = 5
        DataType = dtCurrency
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 182827
        mmTop = 4763
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'TrnWinsRank'
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
        mmHeight = 3440
        mmLeft = 34925
        mmTop = 11906
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = 'TrnTrackRank'
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
        mmHeight = 3440
        mmLeft = 41010
        mmTop = 11906
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText102'
        AutoSize = True
        DataField = 'TrnEarningsRank'
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
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 11906
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'HorseName1'
        DataField = 'Owner'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 3440
        mmLeft = 14023
        mmTop = 7938
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'Trainer'
        DataPipeline = plTrainer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plTrainer'
        mmHeight = 3440
        mmLeft = 14023
        mmTop = 11906
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Jockey'
        DataPipeline = plJockey
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plJockey'
        mmHeight = 3440
        mmLeft = 14023
        mmTop = 15610
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText103'
        AutoSize = True
        DataField = 'JkyWinsRank'
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
        mmHeight = 3440
        mmLeft = 37042
        mmTop = 15610
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'JkyTrackRank'
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
        mmHeight = 3440
        mmLeft = 41011
        mmTop = 15610
        mmWidth = 1058
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'JkyEarningsRank'
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
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 15610
        mmWidth = 1058
        BandType = 4
      end
      object DebutIndicator: TppDBText
        UserName = 'DebutIndicator'
        DataField = 'DebutIndicator'
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
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 11642
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DebutIndicator1'
        DataField = 'TurfIndicator'
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
        mmHeight = 3440
        mmLeft = 56092
        mmTop = 11642
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DebutIndicator2'
        DataField = 'Is1stBred'
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
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 15610
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'IsTurfBred'
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
        mmHeight = 3175
        mmLeft = 56092
        mmTop = 15875
        mmWidth = 4763
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 69850
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 47096
        mmLeft = 529
        mmTop = 0
        mmWidth = 55298
        BandType = 7
      end
      object imgWin: TppShape
        UserName = 'imgWin'
        mmHeight = 21960
        mmLeft = 56621
        mmTop = 1058
        mmWidth = 49213
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
        mmHeight = 3175
        mmLeft = 46831
        mmTop = 7673
        mmWidth = 6350
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
        mmHeight = 3175
        mmLeft = 46038
        mmTop = 1852
        mmWidth = 7144
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
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 1852
        mmWidth = 7144
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
        mmTop = 33073
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
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 1852
        mmWidth = 14817
        BandType = 7
      end
      object varWinWon: TppVariable
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
        mmLeft = 93398
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 95642
        mmTop = 11906
        mmWidth = 8467
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
        mmLeft = 106892
        mmTop = 1058
        mmWidth = 49477
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
        mmLeft = 108215
        mmTop = 2646
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
        mmLeft = 108215
        mmTop = 7408
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
        mmLeft = 108215
        mmTop = 12435
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
        mmLeft = 140759
        mmTop = 2646
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
        mmLeft = 145257
        mmTop = 7408
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 12435
        mmWidth = 7938
        BandType = 7
      end
      object imgSho: TppShape
        UserName = 'imgSho'
        mmHeight = 21960
        mmLeft = 156898
        mmTop = 1058
        mmWidth = 46302
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
        mmLeft = 157692
        mmTop = 3175
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
        mmLeft = 157692
        mmTop = 7938
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
        mmLeft = 157692
        mmTop = 12965
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
        mmLeft = 187590
        mmTop = 3175
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
        mmLeft = 192352
        mmTop = 7938
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 193675
        mmTop = 12965
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
        mmLeft = 265
        mmTop = 48419
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
        mmLeft = 1058
        mmTop = 38629
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
        mmLeft = 43127
        mmTop = 38100
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
        mmLeft = 92075
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
        mmLeft = 143669
        mmTop = 18256
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
        mmLeft = 108215
        mmTop = 17992
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
        mmLeft = 157692
        mmTop = 18256
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
        mmLeft = 190765
        mmTop = 18521
        mmWidth = 11642
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
        726F6772616D54797065070B747450726F63656475726506536F757263650C49
        01000070726F636564757265207657696E734F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A2020696620706C507265
        7644617948485B2746696E697368506F73275D203D2031207468656E20626567
        696E0D0A09696620706C5072657644617948485B274F646473275D203E203020
        7468656E20626567696E0D0A0909696620706C5072657644617948485B274D6F
        726E696E674C696E65546F3152616E6B275D203E2031207468656E2062656769
        6E0D0A202020202020090969662028706C5072657644617952485B274E62724F
        664F776E65724F64647353656C6563746564275D203E203029207468656E2062
        6567696E0D0A2020090909202056616C7565203A3D2056616C7565202B20313B
        0D0A090909656E643B0D0A09092020656E643B0D0A092020656E643B0D0A2020
        656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057657696E
        73094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E5472
        6B436F64654F6E5072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F7572636506B770726F6365647572652054726B436F64654F
        6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C50726576446179
        48485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A
        202020202054726B436F64652E466F6E742E426F6C64203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A202020202054726B436F64652E
        466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060754726B436F646509457665
        6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061150726F677261
        6D4E62724F6E5072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F7572636506BC70726F6365647572652050726F6772616D4E62
        724F6E5072696E743B0D0A626567696E0D0A696620706C507265764461794848
        5B2746696E697368506F73275D203D2031207468656E20626567696E0D0A2020
        20202050726F6772616D4E62722E466F6E742E426F6C64203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A202020202050726F6772616D
        4E62722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A50726F6772616D
        4E6272094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        10486F7273654E616D654F6E5072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506BD70726F63656475726520486F72
        73654E616D654F6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C
        5072657644617948485B2746696E697368506F73275D203D2031207468656E20
        626567696E0D0A2020202020486F7273654E616D652E466F6E742E426F6C6420
        3A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20202020
        20486F7273654E616D652E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
        486F7273654E616D65094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060E526163654E62724F6E5072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F7572636506B770726F636564757265
        20526163654E62724F6E5072696E743B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617948485B2746696E697368506F73275D203D203120746865
        6E20626567696E0D0A2020202020526163654E62722E466F6E742E426F6C6420
        3A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20202020
        20526163654E62722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506075261
        63654E6272094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        6506164D6F726E696E674C696E65446573634F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506D670726F6365
        64757265204D6F726E696E674C696E65446573634F6E5072696E743B0D0A6265
        67696E0D0A2020696620706C5072657644617948485B274D6F726E696E674C69
        6E65546F3152616E6B275D203D2031207468656E20626567696E0D0A20202020
        204D6F726E696E674C696E65446573632E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E6420656C736520626567696E0D0A20202020204D6F726E
        696E674C696E65446573632E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0F4D6F726E696E674C696E6544657363094576656E744E616D6506074F6E5072
        696E74074576656E74494402200001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060D765374617274734F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C56010000
        70726F63656475726520765374617274734F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C5072
        657644617948485B2746696E697368506F73275D203E2030207468656E206265
        67696E0D0A09696620706C5072657644617948485B274F646473275D203E2030
        207468656E20626567696E0D0A0909696620706C5072657644617948485B274D
        6F726E696E674C696E65546F3152616E6B275D203E2031207468656E20626567
        696E0D0A202020202020090969662028706C5072657644617952485B274E6272
        4F664F776E65724F64647353656C6563746564275D203E203029207468656E20
        626567696E0D0A2020090909202056616C7565203A3D2056616C7565202B2031
        3B0D0A090909656E643B0D0A09092020656E643B0D0A20202020202020656E64
        3B20202020200D0A2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060776537461727473094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060B76506C63734F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F757263650C4E01000070726F636564
        7572652076506C63734F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A2020696620706C5072657644617948485B
        2746696E697368506F73275D203D2032207468656E20626567696E0D0A096966
        20706C5072657644617948485B274F646473275D203E2030207468656E206265
        67696E0D0A0909696620706C5072657644617948485B274D6F726E696E674C69
        6E65546F3152616E6B275D203E2031207468656E20626567696E0D0A20202020
        2020090969662028706C5072657644617952485B274E62724F664F776E65724F
        64647353656C6563746564275D203E203029207468656E20626567696E0D0A20
        20090909202056616C7565203A3D2056616C7565202B20313B0D0A090909656E
        643B0D0A09092020656E643B0D0A0909656E643B0D0A2020656E643B0D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060576506C6373094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65061146696E697368
        4E6272734F6E5072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F7572636506B170726F6365647572652046696E6973684E6272
        734F6E5072696E743B0D0A626567696E0D0A0D0A202046696E6973684E627273
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A0D0A2020696620706C50
        72657644617948485B2746696E697368506F73275D203D2031207468656E2062
        6567696E0D0A2020202020202046696E6973684E6272732E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060A46696E6973684E627273094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D650617546F6461797357616765
        724F726465724F6E5072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C0301000070726F63656475726520546F6461
        797357616765724F726465724F6E5072696E743B0D0A626567696E0D0A0D0A20
        20546F6461797357616765724F726465722E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020200D0A2020696620706C5072657644617948485B27
        46696E697368506F73275D203D2031207468656E20626567696E0D0A20202020
        20546F6461797357616765724F726465722E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A2020202020546F64
        61797357616765724F726465722E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D650610546F6461797357616765724F72646572094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65061057696E5061796F75744F6E5072
        696E740B50726F6772616D54797065070B747450726F63656475726506536F75
        72636506E970726F6365647572652057696E5061796F75744F6E5072696E743B
        0D0A626567696E0D0A0D0A20202057696E5061796F75742E466F6E742E426F6C
        64203A3D2046616C73653B0D0A20202020200D0A202020696620706C50726576
        44617948485B2746696E697368506F73275D203D2031207468656E2062656769
        6E0D0A202020202057696E5061796F75742E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E
        5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095769
        6E5061796F7574094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060D7657696E5063744F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C3401000070726F636564757265
        207657696E5063744F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A7661720D0A6957696E5063743A696E74656765723B0D0A6657696E
        5063743A646F75626C653B0D0A626567696E20202020202020200D0A0D0A2020
        206957696E5063743A3D303B0D0A2020206657696E5063743A3D303B0D0A2020
        202020202020202020202020200D0A20202069662028765374617274732E4173
        496E7465676572203E203029207468656E20626567696E0D0A20202020202066
        57696E506374203A3D20287657696E732E4173496E746567657220202F207653
        74617274732E4173496E746567657229202A203130303B0D0A202020656E643B
        2020200D0A2020200D0A20202056616C7565203A3D206657696E5063743B0D0A
        2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506077657696E50
        6374094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061076
        546F74616C4F6464734F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506A770726F6365647572652076546F7461
        6C4F6464734F6E43616C63287661722056616C75653A2056617269616E74293B
        0D0A626567696E0D0A0D0A2020696620706C5072657644617948485B2746696E
        697368506F73275D203D2031207468656E20626567696E0D0A2020202056616C
        7565203A3D2056616C7565202B20706C5072657644617948485B274F64647327
        5D3B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060A76546F74616C4F646473094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060E764176674F6464734F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C9601
        000070726F63656475726520764176674F6464734F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A7661720D0A664176674F6464733A64
        6F75626C653B0D0A665374617274733A646F75626C653B0D0A6657696E733A64
        6F75626C653B0D0A0D0A626567696E0D0A20202020202020202020202020200D
        0A202020664176674F6464733A3D303B0D0A202020665374617274733A3D303B
        0D0A2020206657696E733A3D303B0D0A0D0A20202066537461727473203A3D20
        765374617274732E4173496E74656765723B2020202020202020202020202020
        0D0A2020206657696E73203A3D207657696E732E4173496E74656765723B2020
        2020202020202020202020200D0A2020202020200D0A20202069662028665374
        61727473203E203029207468656E20626567696E0D0A20202020202066417667
        4F646473203A3D202876546F74616C4F6464732E4173446F75626C65202F2066
        57696E73293B0D0A202020656E643B2020200D0A2020200D0A20202056616C75
        65203A3D20664176674F6464733B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D650608764176674F646473094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506117657696E576167657265644F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C7D
        01000070726F636564757265207657696E576167657265644F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A7661720D0A6657696E5761
        676572416D743A646F75626C653B0D0A626567696E0D0A202020096657696E57
        61676572416D74203A3D20303B0D0A2020200D0A20202009696620706C507265
        7644617948485B274F646473275D203E2030207468656E20626567696E0D0A09
        09696620706C5072657644617948485B274D6F726E696E674C696E65546F3152
        616E6B275D203E2031207468656E20626567696E0D0A09090969662028706C50
        72657644617952485B274E62724F664F776E65724F64647353656C6563746564
        275D203E203029207468656E20626567696E0D0A090909202020202020665769
        6E5761676572416D74203A3D2020342E30303B0D0A2020202020200909656E64
        3B0D0A0909656E643B0D0A09656E643B0D0A0D0A0956616C7565203A3D206657
        696E5761676572416D74202B2056616C75653B0D0A2020200D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060B7657696E57616765726564094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060D7657696E576F6E4F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C8502000070726F636564757265207657696E576F6E4F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A207661720D0A664F
        6464733A20646F75626C653B0D0A665061796F75743A646F75626C653B0D0A66
        5761676572416D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A202020
        202020664F646473203A3D20706C5072657644617948485B274F646473275D3B
        0D0A202020202020665061796F7574203A3D20303B0D0A202020202020665761
        676572416D74203A3D20303B0D0A2020202020200D0A20202020202069662070
        6C5072657644617948485B274F646473275D203E2030207468656E2062656769
        6E0D0A0909696620706C5072657644617948485B274D6F726E696E674C696E65
        546F3152616E6B275D203E2031207468656E20626567696E0D0A090909696620
        28706C5072657644617952485B274E62724F664F776E65724F64647353656C65
        63746564275D203E203029207468656E20626567696E0D0A0909092020202020
        20665761676572416D74203A3D2020342E30303B0D0A2020202020200909656E
        643B0D0A0909656E643B0D0A09656E643B0D0A0D0A0D0A09696620664F646473
        203E2030207468656E20626567696E0D0A090969662028706C50726576446179
        48485B2746696E697368506F73275D203D203129207468656E20626567696E0D
        0A090909665061796F7574203A3D2028664F646473202A20665761676572416D
        7429202B20665761676572416D743B0D0A0909656E643B0D0A090956616C7565
        203A3D2056616C7565202B20665061796F75743B0D0A09656E6420656C736520
        626567696E0D0A090956616C7565203A3D2056616C75653B0D0A20202009656E
        643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776
        57696E576F6E094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65060C7657696E504C4F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C6D01000070726F636564757265207657
        696E504C4F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C57
        6167657265643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B
        0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A202020
        66546F74616C576167657265643A3D303B0D0A20202066546F74616C504C3A3D
        303B0D0A0D0A20202066546F74616C576F6E203A3D207657696E576F6E2E4173
        446F75626C653B20202020202020202020202020200D0A20202066546F74616C
        57616765726564203A3D207657696E576167657265642E4173446F75626C653B
        20202020202020202020202020200D0A20202066546F74616C504C203A3D2066
        546F74616C576F6E202D2066546F74616C576167657265643B20200D0A202020
        0D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D6506067657696E504C094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060B7653686F734F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        8E70726F636564757265207653686F734F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C507265
        7644617948485B2746696E697368506F73275D203D2033207468656E20626567
        696E0D0A2020202056616C7565203A3D2056616C7565202B20313B0D0A202065
        6E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060576
        53686F73094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1176506C63576167657265644F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C3102000070726F636564757265
        2076506C63576167657265644F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A7661720D0A665761676572416D743A646F75626C653B0D
        0A626567696E0D0A2009665761676572416D74203A3D20303B0D0A2020200D0A
        20202009696620706C5072657644617948485B274D6F726E696E674C696E6554
        6F3152616E6B275D203D2031207468656E20626567696E0D0A09096966202870
        6C5072657644617952485B274E62724F664F776E65724F64647353656C656374
        6564275D203E203029207468656E20626567696E0D0A09090966576167657241
        6D74203A3D20342E30303B200D0A09202020202020656E643B20202020202020
        2020200D0A09656E643B0D0A0D0A09696620706C5072657644617948485B274D
        6F726E696E674C696E65546F3152616E6B275D203C3D2032207468656E206265
        67696E0D0A0909696620706C5072657644617948485B27506F77657252616E6B
        275D203C3D2033207468656E20626567696E0D0A09090969662028706C507265
        7644617952485B274E62724F664F776E65724F64647353656C6563746564275D
        203E203029207468656E20626567696E0D0A09090909665761676572416D7420
        3A3D20342E30303B200D0A092020202009202020202020656E643B2020202020
        20202020200D0A0909656E643B0D0A09656E643B0D0A20200D0A20200D0A2020
        56616C7565203A3D20665761676572416D74202B2056616C75653B0D0A202020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B76506C6357616765
        726564094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        76506C63576F6E4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C2D04000070726F6365647572652076506C63
        576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        7661720D0A664F6464733A646F75626C653B0D0A665761676572416D743A646F
        75626C653B0D0A665061794F75743A646F75626C653B0D0A626567696E0D0A20
        2020664F6464733A3D303B0D0A2020200D0A2020206966202828706C50726576
        44617948485B2746696E697368506F73275D203E3D203129616E642028706C50
        72657644617948485B2746696E697368506F73275D203C3D2032292920746865
        6E20626567696E0D0A20202009696620706C5072657644617952485B2757696E
        506C635061796F7574275D203E2030207468656E20626567696E0D0A09202020
        202020664F646473203A3D2028706C5072657644617952485B2757696E506C63
        5061796F7574275D202D20322E303029202F20323B0D0A202020202020656E64
        3B0D0A202020656E643B0D0A2020200D0A2020202009665761676572416D7420
        3A3D20303B0D0A2020200D0A20202009696620706C5072657644617948485B27
        4D6F726E696E674C696E65546F3152616E6B275D203D2031207468656E206265
        67696E0D0A090969662028706C5072657644617952485B274E62724F664F776E
        65724F64647353656C6563746564275D203E203029207468656E20626567696E
        0D0A090909665761676572416D74203A3D20342E30303B200D0A092020202020
        20656E643B202020202020202020200D0A09656E643B0D0A0D0A09696620706C
        5072657644617948485B274D6F726E696E674C696E65546F3152616E6B275D20
        3C3D2032207468656E20626567696E0D0A0909696620706C5072657644617948
        485B27506F77657252616E6B275D203C3D2033207468656E20626567696E0D0A
        09090969662028706C5072657644617952485B274E62724F664F776E65724F64
        647353656C6563746564275D203E203029207468656E20626567696E0D0A0909
        0909665761676572416D74203A3D20342E30303B200D0A092020202009202020
        202020656E643B202020202020202020200D0A0909656E643B0D0A09656E643B
        0D0A2020200D0A20200D0A202020665061796F7574203A3D20303B0D0A202020
        0D0A202020696620664F646473203E2030207468656E20626567696E0D0A0969
        66202828706C5072657644617948485B2746696E697368506F73275D203E3D20
        312920616E642028706C5072657644617948485B2746696E697368506F73275D
        203C3D20322929207468656E20626567696E0D0A0909665061796F7574203A3D
        2028664F646473202A20665761676572416D7429202B20665761676572416D74
        3B0D0A09656E643B0D0A0956616C7565203A3D2056616C7565202B2066506179
        6F75743B0D0A202020656E6420656C736520626567696E0D0A0956616C756520
        3A3D2056616C75653B0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060776506C63576F6E094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060C76506C63504C4F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        6D01000070726F6365647572652076506C63504C4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A
        646F75626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A
        66546F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A2020206654
        6F74616C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D30
        3B0D0A20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C57
        6F6E203A3D2076506C63576F6E2E4173446F75626C653B202020202020202020
        20202020200D0A20202066546F74616C57616765726564203A3D2076506C6357
        6167657265642E4173446F75626C653B20202020202020202020202020200D0A
        20202066546F74616C504C203A3D2066546F74616C576F6E202D2066546F7461
        6C576167657265643B20200D0A2020200D0A20202056616C7565203A3D206654
        6F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0676506C63504C094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D6506117653686F576167657265644F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F757263650C3502000070726F636564
        757265207653686F576167657265644F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A7661720D0A665761676572416D743A646F75626C
        653B0D0A626567696E0D0A20202009665761676572416D74203A3D20303B0D0A
        2020200D0A20202009696620706C5072657644617948485B274D6F726E696E67
        4C696E65546F3152616E6B275D203D2031207468656E20626567696E0D0A0909
        69662028706C5072657644617952485B274E62724F664F776E65724F64647353
        656C6563746564275D203E203029207468656E20626567696E0D0A0909096657
        61676572416D74203A3D20342E30303B200D0A09202020202020656E643B2020
        20202020202020200D0A09656E643B0D0A0D0A09696620706C50726576446179
        48485B274D6F726E696E674C696E65546F3152616E6B275D203C3D2032207468
        656E20626567696E0D0A0909696620706C5072657644617948485B27506F7765
        7252616E6B275D203C3D2033207468656E20626567696E0D0A09090969662028
        706C5072657644617952485B274E62724F664F776E65724F64647353656C6563
        746564275D203E203029207468656E20626567696E0D0A090909096657616765
        72416D74203A3D20342E30303B200D0A092020202009202020202020656E643B
        202020202020202020200D0A0909656E643B0D0A09656E643B0D0A20200D0A20
        200D0A202056616C7565203A3D20665761676572416D74202B2056616C75653B
        0D0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060B76
        53686F57616765726564094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060D7653686F576F6E4F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C3A04000070726F63656475
        7265207653686F576F6E4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A7661720D0A664F6464733A646F75626C653B0D0A6657616765
        72416D743A646F75626C653B0D0A665061794F75743A646F75626C653B0D0A62
        6567696E0D0A0D0A202020664F6464733A3D303B0D0A2020200D0A2020206966
        202828706C5072657644617948485B2746696E697368506F73275D203E3D2031
        2920616E642028706C5072657644617948485B2746696E697368506F73275D20
        3C3D20332929207468656E20626567696E0D0A20202009696620706C50726576
        44617952485B2757696E53686F5061796F7574275D203E2030207468656E2062
        6567696E0D0A09202020202020664F646473203A3D2028706C50726576446179
        52485B2757696E53686F5061796F7574275D202D20322E303029202F20323B0D
        0A202020202020656E643B0D0A202020656E643B0D0A2020200D0A2020200D0A
        2020202009665761676572416D74203A3D20303B0D0A2020200D0A2020200969
        6620706C5072657644617948485B274D6F726E696E674C696E65546F3152616E
        6B275D203D2031207468656E20626567696E0D0A090969662028706C50726576
        44617952485B274E62724F664F776E65724F64647353656C6563746564275D20
        3E203029207468656E20626567696E0D0A090909665761676572416D74203A3D
        20342E30303B200D0A09202020202020656E643B202020202020202020200D0A
        09656E643B0D0A0D0A09696620706C5072657644617948485B274D6F726E696E
        674C696E65546F3152616E6B275D203C3D2032207468656E20626567696E0D0A
        0909696620706C5072657644617948485B27506F77657252616E6B275D203C3D
        2033207468656E20626567696E0D0A09090969662028706C5072657644617952
        485B274E62724F664F776E65724F64647353656C6563746564275D203E203029
        207468656E20626567696E0D0A09090909665761676572416D74203A3D20342E
        30303B200D0A092020202009202020202020656E643B20202020202020202020
        0D0A0909656E643B0D0A09656E643B0D0A20200D0A20200D0A20200D0A202020
        665061796F7574203A3D20303B0D0A2020200D0A202020696620664F64647320
        3E2030207468656E20626567696E0D0A096966202828706C5072657644617948
        485B2746696E697368506F73275D203E3D20312920616E642028706C50726576
        44617948485B2746696E697368506F73275D203C3D20332929207468656E2062
        6567696E0D0A0909665061796F7574203A3D2028664F646473202A2066576167
        6572416D7429202B20665761676572416D743B0D0A09656E643B0D0A0956616C
        7565203A3D2056616C7565202B20665061796F75743B0D0A202020656E642065
        6C736520626567696E0D0A0956616C7565203A3D2056616C75653B0D0A202020
        656E643B0D0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D
        6506077653686F576F6E094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060C7653686F504C4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C6F01000070726F6365647572
        65207653686F504C4F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F
        74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F75
        626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D
        0A20202066546F74616C576167657265643A3D303B0D0A20202066546F74616C
        504C3A3D303B0D0A0D0A0D0A20202066546F74616C576F6E203A3D207653686F
        576F6E2E4173446F75626C653B20202020202020202020202020200D0A202020
        66546F74616C57616765726564203A3D207653686F576167657265642E417344
        6F75626C653B20202020202020202020202020200D0A20202066546F74616C50
        4C203A3D2066546F74616C576F6E202D2066546F74616C576167657265643B20
        200D0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D6506067653686F504C094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060C76575053504C
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068770726F6365647572652076575053504C4F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A626567696E0D0A2020200D
        0A20202056616C7565203A3D20207657696E504C2E4173446F75626C65202B20
        76506C63504C2E4173446F75626C65202B207653686F504C2E4173446F75626C
        653B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060676
        575053504C094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060E57696E4E6272734F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F7572636506DE70726F6365647572652057696E4E
        6272734F6E5072696E743B0D0A626567696E0D0A0D0A202057696E4E6272732E
        466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A20202069
        6620706C5072657644617948485B2746696E697368506F73275D203D20312074
        68656E20626567696E0D0A202020202057696E4E6272732E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202057696E4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650607
        57696E4E627273094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65061357696E506C635061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506F470726F636564
        7572652057696E506C635061796F75744F6E5072696E743B0D0A626567696E0D
        0A0D0A202057696E506C635061796F75742E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020200D0A202020696620706C5072657644617948485B
        2746696E697368506F73275D203D2031207468656E20626567696E0D0A202020
        202057696E506C635061796F75742E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A202020202057696E506C63
        5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C5769
        6E506C635061796F7574094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65061357696E53686F5061796F75744F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506F670726F
        6365647572652057696E53686F5061796F75744F6E5072696E743B0D0A626567
        696E0D0A0D0A202057696E53686F5061796F75742E466F6E742E426F6C64203A
        3D2046616C73653B0D0A20202020200D0A202020696620706C50726576446179
        48485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A
        202020202057696E53686F5061796F75742E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E
        53686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060C57696E53686F5061796F7574094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060E506C634E6272734F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506E370726F
        63656475726520506C634E6272734F6E5072696E743B0D0A626567696E0D0A0D
        0A202020506C634E6272732E466F6E742E426F6C64203A3D2046616C73653B0D
        0A20202020200D0A202020696620706C5072657644617948485B2746696E6973
        68506F73275D203D2032207468656E20626567696E0D0A2020202020506C634E
        6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A2020202020506C634E6272732E466F6E742E426F6C64
        203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D650607506C634E627273094576656E744E616D
        6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65060E53686F4E6272734F6E5072
        696E740B50726F6772616D54797065070B747450726F63656475726506536F75
        72636506DD70726F6365647572652053686F4E6272734F6E5072696E743B0D0A
        626567696E0D0A20202053686F4E6272732E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020200D0A202020696620706C5072657644617948485B
        2746696E697368506F73275D203D2033207468656E20626567696E0D0A202020
        202053686F4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E6420656C736520626567696E0D0A202020202053686F4E6272732E466F6E
        742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060753686F4E627273094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D650610506C635061796F7574
        4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
        06536F7572636506E570726F63656475726520506C635061796F75744F6E5072
        696E743B0D0A626567696E0D0A202020506C635061796F75742E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A20202020200D0A202020696620706C5072
        657644617948485B2746696E697368506F73275D203D2032207468656E206265
        67696E0D0A2020202020506C635061796F75742E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A202020202050
        6C635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609506C
        635061796F7574094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D650613506C6353686F5061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506F370726F636564
        75726520506C6353686F5061796F75744F6E5072696E743B0D0A626567696E0D
        0A202020506C6353686F5061796F75742E466F6E742E426F6C64203A3D204661
        6C73653B0D0A20202020200D0A202020696620706C5072657644617948485B27
        46696E697368506F73275D203D2032207468656E20626567696E0D0A20202020
        20506C6353686F5061796F75742E466F6E742E426F6C64203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A2020202020506C6353686F50
        61796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E64
        3B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C506C63
        53686F5061796F7574094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061053686F5061796F75744F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506E770726F63656475
        72652053686F5061796F75744F6E5072696E743B0D0A626567696E0D0A202020
        53686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        202020200D0A202020696620706C5072657644617948485B2746696E69736850
        6F73275D203D2033207468656E20626567696E0D0A202020202053686F506179
        6F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202053686F5061796F75742E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060953686F5061796F7574094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060F7657696E504C506374
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068170726F636564757265207657696E504C5063744F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A20
        202056616C7565203A3D20436F6D70757465504C50637420287657696E576F6E
        2E4173446F75626C652C7657696E576167657265642E4173446F75626C65290D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506097657696E504C50
        6374094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F76
        506C63504C5063744F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F75726365068370726F6365647572652076506C63504C
        5063744F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A0D0A20202056616C7565203A3D20436F6D70757465504C5063
        74202876506C63576F6E2E4173446F75626C652C76506C63576167657265642E
        4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060976506C63504C506374094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060F7653686F504C5063744F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F75726365068370726F636564
        757265207653686F504C5063744F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A0D0A20202056616C7565203A3D2043
        6F6D70757465504C50637420287653686F576F6E2E4173446F75626C652C7653
        686F576167657265642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506097653686F504C506374094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65061364657457696E57616765726564
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F757263650C3001000070726F6365647572652064657457696E5761676572
        65644F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A2020202056616C7565203A3D2056616C75653B0D0A0D0A096966
        20706C5072657644617948485B274F646473275D203E2030207468656E206265
        67696E0D0A0909696620706C5072657644617948485B274D6F726E696E674C69
        6E65546F3152616E6B275D203E2031207468656E20626567696E0D0A20202020
        2020090969662028706C5072657644617952485B274E62724F664F776E65724F
        64647353656C6563746564275D203E203029207468656E20626567696E0D0A09
        09090956616C7565203A3D2056616C7565202B20342E30303B0D0A090909656E
        643B0D0A0909656E643B0D0A09656E643B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060D64657457696E57616765726564094576656E744E61
        6D6506064F6E43616C63074576656E74494402210001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65061264657457696E5061796F75
        744F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C5902000070726F6365647572652064657457696E5061796F
        75744F6E43616C63287661722056616C75653A2056617269616E74293B0D0A76
        61720D0A664F6464733A20646F75626C653B0D0A665061796F75743A646F7562
        6C653B0D0A665761676572416D743A646F75626C653B0D0A0D0A626567696E0D
        0A20202009665761676572416D74203A3D20303B0D0A0D0A09696620706C5072
        657644617948485B274D6F726E696E674C696E65546F3152616E6B275D203E20
        31207468656E20626567696E0D0A090969662028706C5072657644617952485B
        274E62724F664F776E65724F64647353656C6563746564275D203E2030292074
        68656E20626567696E0D0A090909665761676572416D74203A3D20342E30303B
        200D0A0909090D0A090920656E643B202020202020202020200D0A09656E643B
        0D0A20200D0A2020202020200D0A202020202020664F646473203A3D20706C50
        72657644617948485B274F646473275D3B0D0A202020202020665061796F7574
        203A3D20303B0D0A2020200D0A09696620664F646473203E2030207468656E20
        626567696E0D0A090969662028706C5072657644617948485B2746696E697368
        506F73275D203D203129207468656E20626567696E0D0A090909665061796F75
        74203A3D2028664F646473202A20665761676572416D7429202B206657616765
        72416D743B0D0A0909656E643B0D0A090956616C7565203A3D2056616C756520
        2B20665061796F75743B0D0A09656E6420656C736520626567696E0D0A090956
        616C7565203A3D2056616C75653B0D0A20202009656E643B0D0A2020200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060C64657457696E5061796F75
        74094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506126465
        74506C635061796F75744F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C9503000070726F6365647572652064
        6574506C635061796F75744F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A7661720D0A664F6464733A20646F75626C653B0D0A665061
        796F75743A646F75626C653B0D0A665761676572416D743A646F75626C653B0D
        0A0D0A626567696E0D0A0920665761676572416D74203A3D20303B0D0A202020
        2020200D0A09696620706C5072657644617948485B274D6F726E696E674C696E
        65546F3152616E6B275D203D2031207468656E20626567696E0D0A0909696620
        28706C5072657644617952485B274E62724F664F776E65724F64647353656C65
        63746564275D203E203029207468656E20626567696E0D0A0909096657616765
        72416D74203A3D20342E30303B200D0A0909090D0A2020202009202020202020
        656E643B202020202020202020200D0A09656E643B0D0A0D0A09696620706C50
        72657644617948485B274D6F726E696E674C696E65546F3152616E6B275D203C
        3D2032207468656E20626567696E0D0A0909696620706C507265764461794848
        5B27506F77657252616E6B275D203C3D2033207468656E20626567696E0D0A09
        090969662028706C5072657644617952485B274E62724F664F776E65724F6464
        7353656C6563746564275D203E203029207468656E20626567696E0D0A090909
        09665761676572416D74203A3D20342E30303B200D0A090909090D0A09202020
        2009202020202020656E643B202020202020202020200D0A0909656E643B0D0A
        09656E643B0D0A202020200D0A2020202020200D0A202020202020664F646473
        203A3D2028706C5072657644617952485B2757696E506C635061796F7574275D
        202D20322E303029202F20323B0D0A0D0A202020202020665061796F7574203A
        3D20303B0D0A2020200D0A09696620664F646473203E2030207468656E206265
        67696E0D0A09096966202828706C5072657644617948485B2746696E69736850
        6F73275D203E3D20312920616E642028706C5072657644617948485B2746696E
        697368506F73275D203C3D20322929207468656E20626567696E0D0A09090966
        5061796F7574203A3D2028664F646473202A20665761676572416D7429202B20
        665761676572416D743B0D0A0909656E643B0D0A090956616C7565203A3D2056
        616C7565202B20665061796F75743B0D0A09656E6420656C736520626567696E
        0D0A090956616C7565203A3D2056616C75653B0D0A20202009656E643B0D0A20
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C646574506C63
        5061796F7574094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061264657453686F5061796F75744F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F757263650C9203000070726F636564
        7572652064657453686F5061796F75744F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A664F6464733A20646F75626C653B
        0D0A665061796F75743A646F75626C653B0D0A665761676572416D743A646F75
        626C653B0D0A0D0A626567696E0D0A0D0A2020665761676572416D74203A3D20
        303B0D0A2020202020200D0A09696620706C5072657644617948485B274D6F72
        6E696E674C696E65546F3152616E6B275D203D2031207468656E20626567696E
        0D0A090969662028706C5072657644617952485B274E62724F664F776E65724F
        64647353656C6563746564275D203E203029207468656E20626567696E0D0A09
        0909665761676572416D74203A3D20342E30303B200D0A0909090D0A20202020
        09202020202020656E643B202020202020202020200D0A09656E643B0D0A0D0A
        09696620706C5072657644617948485B274D6F726E696E674C696E65546F3152
        616E6B275D203C3D2032207468656E20626567696E0D0A0909696620706C5072
        657644617948485B27506F77657252616E6B275D203C3D2033207468656E2062
        6567696E0D0A09090969662028706C5072657644617952485B274E62724F664F
        776E65724F64647353656C6563746564275D203E203029207468656E20626567
        696E0D0A09090909665761676572416D74203A3D20342E30303B200D0A090909
        090D0A092020202009202020202020656E643B202020202020202020200D0A09
        09656E643B0D0A09656E643B0D0A202020200D0A09664F646473203A3D202870
        6C5072657644617952485B2757696E53686F5061796F7574275D202D20322E30
        3029202F20323B0D0A0D0A2020202020200D0A202020202020665061796F7574
        203A3D20303B0D0A2020200D0A09696620664F646473203E2030207468656E20
        626567696E0D0A09096966202828706C5072657644617948485B2746696E6973
        68506F73275D203E3D20312920616E642028706C5072657644617948485B2746
        696E697368506F73275D203C3D20332929207468656E20626567696E0D0A0909
        09665061796F7574203A3D2028664F646473202A20665761676572416D742920
        2B20665761676572416D743B0D0A0909656E643B0D0A090956616C7565203A3D
        2056616C7565202B20665061796F75743B0D0A09656E6420656C736520626567
        696E0D0A090956616C7565203A3D2056616C75653B0D0A20202009656E643B0D
        0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C64657453
        686F5061796F7574094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D6506115761676572416D744F6E476574546578740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C7102000070726F6365
        64757265205761676572416D744F6E476574546578742876617220546578743A
        20537472696E67293B0D0A7661720D0A2020665761676572416D743A646F7562
        6C653B0D0A20200D0A626567696E0D0A09665761676572416D74203A3D20303B
        0D0A0D0A09696620706C5072657644617948485B274D6F726E696E674C696E65
        546F3152616E6B275D203E2031207468656E20626567696E0D0A090969662028
        706C5072657644617952485B274E62724F664F776E65724F64647353656C6563
        746564275D203E203029207468656E20626567696E0D0A090909665761676572
        416D74203A3D20342E30303B200D0A09090954657874203A3D20466C6F617454
        6F53747228665761676572416D74293B0D0A090920656E643B20202020202020
        2020200D0A09656E643B0D0A20200D0A20200D0A09696620706C507265764461
        7948485B274D6F726E696E674C696E65546F3152616E6B275D203C3D20322074
        68656E20626567696E0D0A0909696620706C5072657644617948485B27506F77
        657252616E6B275D203C3D2033207468656E20626567696E0D0A090909696620
        28706C5072657644617952485B274E62724F664F776E65724F64647353656C65
        63746564275D203E203029207468656E20626567696E0D0A0909090966576167
        6572416D74203A3D20303B200D0A0909090954657874203A3D20466C6F617454
        6F53747228665761676572416D74293B0D0A092020202009202020202020656E
        643B202020202020202020200D0A0909656E643B0D0A09656E643B0D0A202020
        200D0A0954657874203A3D20466C6F6174546F53747228665761676572416D74
        293B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060857616765
        72416D74094576656E744E616D6506094F6E47657454657874074576656E7449
        4402350001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D650614506C635761676572416D744F6E476574546578740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C9202000070726F
        63656475726520506C635761676572416D744F6E476574546578742876617220
        546578743A20537472696E67293B0D0A7661720D0A2020665761676572416D74
        3A646F75626C653B0D0A20200D0A626567696E0D0A2020202020206657616765
        72416D74203A3D20303B0D0A2020202020200D0A09696620706C507265764461
        7948485B274D6F726E696E674C696E65546F3152616E6B275D203D2031207468
        656E20626567696E0D0A090969662028706C5072657644617952485B274E6272
        4F664F776E65724F64647353656C6563746564275D203E203029207468656E20
        626567696E0D0A090909665761676572416D74203A3D20342E30303B200D0A09
        090954657874203A3D20466C6F6174546F53747228665761676572416D74293B
        0D0A2020202009202020202020656E643B202020202020202020200D0A09656E
        643B0D0A0D0A09696620706C5072657644617948485B274D6F726E696E674C69
        6E65546F3152616E6B275D203C3D2032207468656E20626567696E0D0A090969
        6620706C5072657644617948485B27506F77657252616E6B275D203C3D203320
        7468656E20626567696E0D0A09090969662028706C5072657644617952485B27
        4E62724F664F776E65724F64647353656C6563746564275D203E203029207468
        656E20626567696E0D0A09090909665761676572416D74203A3D20342E30303B
        200D0A0909090954657874203A3D20466C6F6174546F53747228665761676572
        416D74293B0D0A092020202009202020202020656E643B202020202020202020
        200D0A0909656E643B0D0A09656E643B0D0A202020200D0A0954657874203A3D
        20466C6F6174546F53747228665761676572416D74293B0D0A20202020202020
        20202020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060B50
        6C635761676572416D74094576656E744E616D6506094F6E4765745465787407
        4576656E74494402350001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65061453686F5761676572416D744F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C83
        02000070726F6365647572652053686F5761676572416D744F6E476574546578
        742876617220546578743A20537472696E67293B0D0A7661720D0A2020665761
        676572416D743A646F75626C653B0D0A20200D0A626567696E0D0A0966576167
        6572416D74203A3D20303B0D0A09696620706C5072657644617948485B274D6F
        726E696E674C696E65546F3152616E6B275D203D2031207468656E2062656769
        6E0D0A090969662028706C5072657644617952485B274E62724F664F776E6572
        4F64647353656C6563746564275D203E203029207468656E20626567696E0D0A
        090909665761676572416D74203A3D20342E30303B200D0A0909095465787420
        3A3D20466C6F6174546F53747228665761676572416D74293B0D0A2020202009
        202020202020656E643B202020202020202020200D0A09656E643B0D0A0D0A09
        696620706C5072657644617948485B274D6F726E696E674C696E65546F315261
        6E6B275D203C3D2032207468656E20626567696E0D0A0909696620706C507265
        7644617948485B27506F77657252616E6B275D203C3D2033207468656E206265
        67696E0D0A09090969662028706C5072657644617952485B274E62724F664F77
        6E65724F64647353656C6563746564275D203E203029207468656E2062656769
        6E0D0A09090909665761676572416D74203A3D20342E30303B200D0A09090909
        54657874203A3D20466C6F6174546F53747228665761676572416D74293B0D0A
        092020202009202020202020656E643B202020202020202020200D0A0909656E
        643B0D0A09656E643B0D0A20200D0A20200954657874203A3D20466C6F617454
        6F53747228665761676572416D74293B0D0A2020202020202020202020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060B53686F5761676572416D
        74094576656E744E616D6506094F6E47657454657874074576656E7449440235
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1664657461696C506C63576167657265644F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F757263650CFC01000070726F63
        65647572652064657461696C506C63576167657265644F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202020
        202056616C7565203A3D20303B0D0A09696620706C5072657644617948485B27
        4D6F726E696E674C696E65546F3152616E6B275D203D2031207468656E206265
        67696E0D0A090969662028706C5072657644617952485B274E62724F664F776E
        65724F64647353656C6563746564275D203E203029207468656E20626567696E
        0D0A09090956616C7565203A3D2056616C7565202B20342E30303B200D0A2020
        202009202020202020656E643B202020202020202020200D0A09656E643B0D0A
        0D0A09696620706C5072657644617948485B274D6F726E696E674C696E65546F
        3152616E6B275D203C3D2032207468656E20626567696E0D0A0909696620706C
        5072657644617948485B27506F77657252616E6B275D203C3D2033207468656E
        20626567696E0D0A09090969662028706C5072657644617952485B274E62724F
        664F776E65724F64647353656C6563746564275D203E203029207468656E2062
        6567696E0D0A0909090956616C7565203A3D2076616C7565202B20342E30303B
        200D0A092020202009202020202020656E643B202020202020202020200D0A09
        09656E643B0D0A09656E643B0D0A0D0A656E643B0D0A0D0A0D436F6D706F6E65
        6E744E616D65061064657461696C506C6357616765726564094576656E744E61
        6D6506064F6E43616C63074576656E74494402210001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65061664657461696C53686F5761
        67657265644F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650CFA01000070726F6365647572652064657461696C
        53686F576167657265644F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A20202020202056616C7565203A3D2030
        3B0D0A09696620706C5072657644617948485B274D6F726E696E674C696E6554
        6F3152616E6B275D203D2031207468656E20626567696E0D0A09096966202870
        6C5072657644617952485B274E62724F664F776E65724F64647353656C656374
        6564275D203E203029207468656E20626567696E0D0A09090956616C7565203A
        3D2056616C7565202B20342E30303B200D0A2020202009202020202020656E64
        3B202020202020202020200D0A09656E643B0D0A0D0A09696620706C50726576
        44617948485B274D6F726E696E674C696E65546F3152616E6B275D203C3D2032
        207468656E20626567696E0D0A0909696620706C5072657644617948485B2750
        6F77657252616E6B275D203C3D2033207468656E20626567696E0D0A09090969
        662028706C5072657644617952485B274E62724F664F776E65724F6464735365
        6C6563746564275D203E203029207468656E20626567696E0D0A090909095661
        6C7565203A3D2076616C7565202B20342E30303B200D0A092020202009202020
        202020656E643B202020202020202020200D0A0909656E643B0D0A09656E643B
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65061064657461696C
        53686F57616765726564094576656E744E616D6506064F6E43616C6307457665
        6E74494402210000}
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
    Filter = 'TypeOfRace='#39'T'#39' and IsYouBetTrack=True'
    Filtered = True
    OnNewRecord = tblPrevDayRHNewRecord
    DatabaseName = 'dbWagerResultsReport'
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
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 216
    Top = 161
  end
  object tblTrainer: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbWagerResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTrnEquibaseKey'
    MasterFields = 'TrnEquibaseKey'
    MasterSource = dsPrevDayHH
    TableName = 'Trainer'
    Left = 222
    Top = 160
  end
  object dsTrainer: TDataSource
    DataSet = tblTrainer
    Left = 222
    Top = 208
  end
  object plTrainer: TppDBPipeline
    DataSource = dsTrainer
    CloseDataSource = True
    UserName = 'plTrainer'
    OnMasterRecordPositionChange = plPrevDayHHMasterRecordPositionChange
    OnTraversal = plPrevDayHHTraversal
    Left = 238
    Top = 258
    MasterDataPipelineName = 'plPrevDayHH'
  end
  object tblJockey: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbWagerResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByJkyEquibaseKey'
    MasterFields = 'JkyEquibaseKey'
    MasterSource = dsPrevDayHH
    TableName = 'Jockey'
    Left = 334
    Top = 152
  end
  object dsJockey: TDataSource
    DataSet = tblJockey
    Left = 342
    Top = 216
  end
  object plJockey: TppDBPipeline
    DataSource = dsJockey
    CloseDataSource = True
    UserName = 'plJockey'
    OnMasterRecordPositionChange = plPrevDayHHMasterRecordPositionChange
    OnTraversal = plPrevDayHHTraversal
    Left = 334
    Top = 266
    MasterDataPipelineName = 'plPrevDayHH'
  end
end
