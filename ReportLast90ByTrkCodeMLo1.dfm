object Last90DaysReportForm: TLast90DaysReportForm
  Left = 277
  Top = 127
  Width = 573
  Height = 320
  Caption = 'Last 90 Results Report'
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
    Top = 262
    Width = 563
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
  object dbPrevDayByDayReport: TDBISAMDatabase
    EngineVersion = '4.09'
    Connected = True
    DatabaseName = 'dbPrevDayByDayReport'
    Directory = 'c:\RatingsData31'
    SessionName = 'Default'
    Left = 424
    Top = 120
  end
  object tblPrevDayHH: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = '((FinalWinPctRank=1))'
    Filtered = True
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbPrevDayByDayReport'
    SessionName = 'Default'
    EngineVersion = '4.09'
    IndexName = 'ByMorningLineTo1'
    TableName = 'PrevWeekHH'
    Left = 158
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
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object plPrevDayHHppField6: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object plPrevDayHHppField7: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object plPrevDayHHppField8: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 2
      DisplayWidth = 2
      Position = 7
    end
    object plPrevDayHHppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object plPrevDayHHppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object plPrevDayHHppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object plPrevDayHHppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object plPrevDayHHppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object plPrevDayHHppField14: TppField
      FieldAlias = 'ProgramNbr'
      FieldName = 'ProgramNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object plPrevDayHHppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'ProgNbrSort'
      FieldName = 'ProgNbrSort'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object plPrevDayHHppField16: TppField
      FieldAlias = 'MorningLineDesc'
      FieldName = 'MorningLineDesc'
      FieldLength = 6
      DisplayWidth = 6
      Position = 15
    end
    object plPrevDayHHppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1'
      FieldName = 'MorningLineTo1'
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
      FieldAlias = 'IsFavorite'
      FieldName = 'IsFavorite'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 20
    end
    object plPrevDayHHppField22: TppField
      FieldAlias = 'HorseName'
      FieldName = 'HorseName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 21
    end
    object plPrevDayHHppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'HorseNbr'
      FieldName = 'HorseNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 22
    end
    object plPrevDayHHppField24: TppField
      FieldAlias = 'Sex'
      FieldName = 'Sex'
      FieldLength = 1
      DisplayWidth = 1
      Position = 23
    end
    object plPrevDayHHppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object plPrevDayHHppField26: TppField
      FieldAlias = 'Equip'
      FieldName = 'Equip'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object plPrevDayHHppField27: TppField
      FieldAlias = 'Med'
      FieldName = 'Med'
      FieldLength = 5
      DisplayWidth = 5
      Position = 26
    end
    object plPrevDayHHppField28: TppField
      FieldAlias = 'IsFirstTimeJuice'
      FieldName = 'IsFirstTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 27
    end
    object plPrevDayHHppField29: TppField
      FieldAlias = 'IsSecondTimeJuice'
      FieldName = 'IsSecondTimeJuice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 28
    end
    object plPrevDayHHppField30: TppField
      FieldAlias = 'IsDebut'
      FieldName = 'IsDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 29
    end
    object plPrevDayHHppField31: TppField
      FieldAlias = 'IsDebutTwo'
      FieldName = 'IsDebutTwo'
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
      FieldAlias = 'Speed1Back'
      FieldName = 'Speed1Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 42
    end
    object plPrevDayHHppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed2Back'
      FieldName = 'Speed2Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 43
    end
    object plPrevDayHHppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed3Back'
      FieldName = 'Speed3Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 44
    end
    object plPrevDayHHppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed4Back'
      FieldName = 'Speed4Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object plPrevDayHHppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed5Back'
      FieldName = 'Speed5Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object plPrevDayHHppField48: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLast'
      FieldName = 'DaysLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 47
    end
    object plPrevDayHHppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork'
      FieldName = 'DaysLastWork'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object plPrevDayHHppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork2'
      FieldName = 'DaysLastWork2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
    object plPrevDayHHppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork3'
      FieldName = 'DaysLastWork3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 50
    end
    object plPrevDayHHppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrWorksLast'
      FieldName = 'NbrWorksLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 51
    end
    object plPrevDayHHppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'StartsWorks21'
      FieldName = 'StartsWorks21'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
    object plPrevDayHHppField54: TppField
      FieldAlias = 'JkyEquibaseKey'
      FieldName = 'JkyEquibaseKey'
      FieldLength = 10
      DisplayWidth = 10
      Position = 53
    end
    object plPrevDayHHppField55: TppField
      FieldAlias = 'TrnEquibaseKey'
      FieldName = 'TrnEquibaseKey'
      FieldLength = 10
      DisplayWidth = 10
      Position = 54
    end
    object plPrevDayHHppField56: TppField
      FieldAlias = 'SireName'
      FieldName = 'SireName'
      FieldLength = 16
      DisplayWidth = 16
      Position = 55
    end
    object plPrevDayHHppField57: TppField
      FieldAlias = 'DamSireName'
      FieldName = 'DamSireName'
      FieldLength = 16
      DisplayWidth = 16
      Position = 56
    end
    object plPrevDayHHppField58: TppField
      FieldAlias = 'DamName'
      FieldName = 'DamName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 57
    end
    object plPrevDayHHppField59: TppField
      FieldAlias = 'BredIn'
      FieldName = 'BredIn'
      FieldLength = 6
      DisplayWidth = 6
      Position = 58
    end
    object plPrevDayHHppField60: TppField
      FieldAlias = 'Owner'
      FieldName = 'Owner'
      FieldLength = 45
      DisplayWidth = 45
      Position = 59
    end
    object plPrevDayHHppField61: TppField
      FieldAlias = 'Breeder'
      FieldName = 'Breeder'
      FieldLength = 67
      DisplayWidth = 67
      Position = 60
    end
    object plPrevDayHHppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayStarts'
      FieldName = 'TrnTodayStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 61
    end
    object plPrevDayHHppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPct'
      FieldName = 'TrnTodayWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 62
    end
    object plPrevDayHHppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPctRank'
      FieldName = 'TrnTodayWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 63
    end
    object plPrevDayHHppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfStarts'
      FieldName = 'TotalTrnTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 64
    end
    object plPrevDayHHppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPct'
      FieldName = 'TotalTrnTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 65
    end
    object plPrevDayHHppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPctRank'
      FieldName = 'TotalTrnTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 66
    end
    object plPrevDayHHppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10Starts'
      FieldName = 'TotalTrn10Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 67
    end
    object plPrevDayHHppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10WinPct'
      FieldName = 'TotalTrn10WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 68
    end
    object plPrevDayHHppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10WinPctRank'
      FieldName = 'TotalTrn10WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 69
    end
    object plPrevDayHHppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30Starts'
      FieldName = 'TotalTrn30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 70
    end
    object plPrevDayHHppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPct'
      FieldName = 'TotalTrn30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 71
    end
    object plPrevDayHHppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPctRank'
      FieldName = 'TotalTrn30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 72
    end
    object plPrevDayHHppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10Starts'
      FieldName = 'TotalJky10Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 73
    end
    object plPrevDayHHppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPct'
      FieldName = 'TotalJky10WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object plPrevDayHHppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPctRank'
      FieldName = 'TotalJky10WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 75
    end
    object plPrevDayHHppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30Starts'
      FieldName = 'TotalJky30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 76
    end
    object plPrevDayHHppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPct'
      FieldName = 'TotalJky30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 77
    end
    object plPrevDayHHppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPctRank'
      FieldName = 'TotalJky30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 78
    end
    object plPrevDayHHppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnStarts'
      FieldName = 'TotalTrnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 79
    end
    object plPrevDayHHppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPct'
      FieldName = 'TotalTrnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 80
    end
    object plPrevDayHHppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPctRank'
      FieldName = 'TotalTrnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 81
    end
    object plPrevDayHHppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysStarts'
      FieldName = 'TotalTrnDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 82
    end
    object plPrevDayHHppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWinPct'
      FieldName = 'TotalTrnDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 83
    end
    object plPrevDayHHppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWinPctRank'
      FieldName = 'TotalTrnDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 84
    end
    object plPrevDayHHppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyStarts'
      FieldName = 'TotalTrnJkyStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 85
    end
    object plPrevDayHHppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWinPct'
      FieldName = 'TotalTrnJkyWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 86
    end
    object plPrevDayHHppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWinPctRank'
      FieldName = 'TotalTrnJkyWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 87
    end
    object plPrevDayHHppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysStarts'
      FieldName = 'TotalTrnJkyDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 88
    end
    object plPrevDayHHppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWinPct'
      FieldName = 'TotalTrnJkyDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object plPrevDayHHppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWinPctRank'
      FieldName = 'TotalTrnJkyDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 90
    end
    object plPrevDayHHppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyStarts'
      FieldName = 'TotalJkyStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 91
    end
    object plPrevDayHHppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPct'
      FieldName = 'TotalJkyWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 92
    end
    object plPrevDayHHppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPctRank'
      FieldName = 'TotalJkyWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 93
    end
    object plPrevDayHHppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysStarts'
      FieldName = 'TotalJkyDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 94
    end
    object plPrevDayHHppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPct'
      FieldName = 'TotalJkyDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object plPrevDayHHppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPctRank'
      FieldName = 'TotalJkyDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 96
    end
    object plPrevDayHHppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnStarts'
      FieldName = 'TotalTrnOwnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 97
    end
    object plPrevDayHHppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWinPct'
      FieldName = 'TotalTrnOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 98
    end
    object plPrevDayHHppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWinPctRank'
      FieldName = 'TotalTrnOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 99
    end
    object plPrevDayHHppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnStarts'
      FieldName = 'TotalOwnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 100
    end
    object plPrevDayHHppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPct'
      FieldName = 'TotalOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object plPrevDayHHppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRank'
      FieldName = 'TotalOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 102
    end
    object plPrevDayHHppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdStarts'
      FieldName = 'TotalBrdStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 103
    end
    object plPrevDayHHppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPct'
      FieldName = 'TotalBrdWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object plPrevDayHHppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPctRank'
      FieldName = 'TotalBrdWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 105
    end
    object plPrevDayHHppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeed'
      FieldName = 'LastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 106
    end
    object plPrevDayHHppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRank'
      FieldName = 'LastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 107
    end
    object plPrevDayHHppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'Power'
      FieldName = 'Power'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 108
    end
    object plPrevDayHHppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRank'
      FieldName = 'PowerRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 109
    end
    object plPrevDayHHppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeed'
      FieldName = 'BackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 110
    end
    object plPrevDayHHppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRank'
      FieldName = 'BackSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 111
    end
    object plPrevDayHHppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPace'
      FieldName = 'EarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 112
    end
    object plPrevDayHHppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRank'
      FieldName = 'EarlyPaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 113
    end
    object plPrevDayHHppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceO'
      FieldName = 'EarlyPaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 114
    end
    object plPrevDayHHppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceORank'
      FieldName = 'EarlyPaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plPrevDayHHppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceH'
      FieldName = 'EarlyPaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object plPrevDayHHppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceHRank'
      FieldName = 'EarlyPaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 117
    end
    object plPrevDayHHppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePos'
      FieldName = 'EarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object plPrevDayHHppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRank'
      FieldName = 'EarlyPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 119
    end
    object plPrevDayHHppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosO'
      FieldName = 'EarlyPacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 120
    end
    object plPrevDayHHppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosORank'
      FieldName = 'EarlyPacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 121
    end
    object plPrevDayHHppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosH'
      FieldName = 'EarlyPacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 122
    end
    object plPrevDayHHppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosHRank'
      FieldName = 'EarlyPacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 123
    end
    object plPrevDayHHppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePace'
      FieldName = 'MiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 124
    end
    object plPrevDayHHppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRank'
      FieldName = 'MiddlePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 125
    end
    object plPrevDayHHppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'MIddlePaceO'
      FieldName = 'MIddlePaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 126
    end
    object plPrevDayHHppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceORank'
      FieldName = 'MiddlePaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 127
    end
    object plPrevDayHHppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceH'
      FieldName = 'MiddlePaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 128
    end
    object plPrevDayHHppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceHRank'
      FieldName = 'MiddlePaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 129
    end
    object plPrevDayHHppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePos'
      FieldName = 'MiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object plPrevDayHHppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRank'
      FieldName = 'MiddlePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 131
    end
    object plPrevDayHHppField133: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosO'
      FieldName = 'MiddlePacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 132
    end
    object plPrevDayHHppField134: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosORank'
      FieldName = 'MiddlePacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 133
    end
    object plPrevDayHHppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosH'
      FieldName = 'MiddlePacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object plPrevDayHHppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'MIddlePacePosHRank'
      FieldName = 'MIddlePacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 135
    end
    object plPrevDayHHppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePace'
      FieldName = 'LatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object plPrevDayHHppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRank'
      FieldName = 'LatePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 137
    end
    object plPrevDayHHppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceO'
      FieldName = 'LatePaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 138
    end
    object plPrevDayHHppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceORank'
      FieldName = 'LatePaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plPrevDayHHppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceH'
      FieldName = 'LatePaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object plPrevDayHHppField142: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceHRank'
      FieldName = 'LatePaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 141
    end
    object plPrevDayHHppField143: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePos'
      FieldName = 'LatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 142
    end
    object plPrevDayHHppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRank'
      FieldName = 'LatePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 143
    end
    object plPrevDayHHppField145: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosO'
      FieldName = 'LatePacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 144
    end
    object plPrevDayHHppField146: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosORank'
      FieldName = 'LatePacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 145
    end
    object plPrevDayHHppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosH'
      FieldName = 'LatePacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 146
    end
    object plPrevDayHHppField148: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosHRank'
      FieldName = 'LatePacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 147
    end
    object plPrevDayHHppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePos'
      FieldName = 'FinishPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 148
    end
    object plPrevDayHHppField150: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePosRank'
      FieldName = 'FinishPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 149
    end
    object plPrevDayHHppField151: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClass'
      FieldName = 'AvgClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 150
    end
    object plPrevDayHHppField152: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRank'
      FieldName = 'AvgClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 151
    end
    object plPrevDayHHppField153: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRating'
      FieldName = 'ClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 152
    end
    object plPrevDayHHppField154: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRatingRank'
      FieldName = 'ClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 153
    end
    object plPrevDayHHppField155: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRating'
      FieldName = 'TurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 154
    end
    object plPrevDayHHppField156: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRatingRank'
      FieldName = 'TurfRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 155
    end
    object plPrevDayHHppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRating'
      FieldName = 'MudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 156
    end
    object plPrevDayHHppField158: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRatingRank'
      FieldName = 'MudRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 157
    end
    object plPrevDayHHppField159: TppField
      FieldAlias = 'FinalOrderKey'
      FieldName = 'FinalOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 158
    end
    object plPrevDayHHppField160: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalStarts'
      FieldName = 'FinalStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 159
    end
    object plPrevDayHHppField161: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWins'
      FieldName = 'FinalWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 160
    end
    object plPrevDayHHppField162: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWinPct'
      FieldName = 'FinalWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 161
    end
    object plPrevDayHHppField163: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWinPctRank'
      FieldName = 'FinalWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 162
    end
    object plPrevDayHHppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalAvgOdds'
      FieldName = 'FinalAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 163
    end
    object plPrevDayHHppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalTotalProfitLoss'
      FieldName = 'FinalTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object plPrevDayHHppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalValueBet'
      FieldName = 'FinalValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 165
    end
    object plPrevDayHHppField167: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalValueBetRank'
      FieldName = 'FinalValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 166
    end
    object plPrevDayHHppField168: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalValueOdds'
      FieldName = 'FinalValueOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 167
    end
    object plPrevDayHHppField169: TppField
      FieldAlias = 'PrimaryOrderKey'
      FieldName = 'PrimaryOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 168
    end
    object plPrevDayHHppField170: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryStarts'
      FieldName = 'PrimaryStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 169
    end
    object plPrevDayHHppField171: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWins'
      FieldName = 'PrimaryWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 170
    end
    object plPrevDayHHppField172: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWinPct'
      FieldName = 'PrimaryWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 171
    end
    object plPrevDayHHppField173: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWinPctRank'
      FieldName = 'PrimaryWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 172
    end
    object plPrevDayHHppField174: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryAvgOdds'
      FieldName = 'PrimaryAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 173
    end
    object plPrevDayHHppField175: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryTotalProfitLoss'
      FieldName = 'PrimaryTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 174
    end
    object plPrevDayHHppField176: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryValueBet'
      FieldName = 'PrimaryValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 175
    end
    object plPrevDayHHppField177: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryValueBetRank'
      FieldName = 'PrimaryValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 176
    end
    object plPrevDayHHppField178: TppField
      FieldAlias = 'SecondaryOrderKey'
      FieldName = 'SecondaryOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 177
    end
    object plPrevDayHHppField179: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryStarts'
      FieldName = 'SecondaryStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 178
    end
    object plPrevDayHHppField180: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWins'
      FieldName = 'SecondaryWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 179
    end
    object plPrevDayHHppField181: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWinPct'
      FieldName = 'SecondaryWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 180
    end
    object plPrevDayHHppField182: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWinPctRank'
      FieldName = 'SecondaryWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 181
    end
    object plPrevDayHHppField183: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryAvgOdds'
      FieldName = 'SecondaryAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 182
    end
    object plPrevDayHHppField184: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryTotalProfitLoss'
      FieldName = 'SecondaryTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 183
    end
    object plPrevDayHHppField185: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryValueBet'
      FieldName = 'SecondaryValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 184
    end
    object plPrevDayHHppField186: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryValueBetRank'
      FieldName = 'SecondaryValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 185
    end
    object plPrevDayHHppField187: TppField
      FieldAlias = 'DefaultOrderKey'
      FieldName = 'DefaultOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 186
    end
    object plPrevDayHHppField188: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultStarts'
      FieldName = 'DefaultStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 187
    end
    object plPrevDayHHppField189: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWins'
      FieldName = 'DefaultWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 188
    end
    object plPrevDayHHppField190: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWinPct'
      FieldName = 'DefaultWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 189
    end
    object plPrevDayHHppField191: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWinPctRank'
      FieldName = 'DefaultWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 190
    end
    object plPrevDayHHppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultAvgOdds'
      FieldName = 'DefaultAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 191
    end
    object plPrevDayHHppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultTotalProfitLoss'
      FieldName = 'DefaultTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 192
    end
    object plPrevDayHHppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultValueBet'
      FieldName = 'DefaultValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object plPrevDayHHppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultValueBetRank'
      FieldName = 'DefaultValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 194
    end
    object plPrevDayHHppField196: TppField
      FieldAlias = 'IsFinalValue'
      FieldName = 'IsFinalValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 195
    end
    object plPrevDayHHppField197: TppField
      FieldAlias = 'IsChalkValue'
      FieldName = 'IsChalkValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 196
    end
    object plPrevDayHHppField198: TppField
      FieldAlias = 'IsPlayableValue'
      FieldName = 'IsPlayableValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 197
    end
    object plPrevDayHHppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllWinPct'
      FieldName = 'DamAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 198
    end
    object plPrevDayHHppField200: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllWinPctRank'
      FieldName = 'DamAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 199
    end
    object plPrevDayHHppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllTurfWinPct'
      FieldName = 'DamAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 200
    end
    object plPrevDayHHppField202: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllTurfWinPctRank'
      FieldName = 'DamAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 201
    end
    object plPrevDayHHppField203: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllMudWinPct'
      FieldName = 'DamAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 202
    end
    object plPrevDayHHppField204: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllMudWinPctRank'
      FieldName = 'DamAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 203
    end
    object plPrevDayHHppField205: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllWinPct'
      FieldName = 'SireAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 204
    end
    object plPrevDayHHppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllWinPctRank'
      FieldName = 'SireAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 205
    end
    object plPrevDayHHppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllTurfWinPct'
      FieldName = 'SireAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 206
    end
    object plPrevDayHHppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllTurfWinPctRank'
      FieldName = 'SireAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 207
    end
    object plPrevDayHHppField209: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllMudWinPct'
      FieldName = 'SireAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 208
    end
    object plPrevDayHHppField210: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllMudWinPctRank'
      FieldName = 'SireAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 209
    end
    object plPrevDayHHppField211: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllWinPct'
      FieldName = 'DamSireAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 210
    end
    object plPrevDayHHppField212: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllWinPctRank'
      FieldName = 'DamSireAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 211
    end
    object plPrevDayHHppField213: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllTurfWinPct'
      FieldName = 'DamSireAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 212
    end
    object plPrevDayHHppField214: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllTurfWinPctRank'
      FieldName = 'DamSireAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 213
    end
    object plPrevDayHHppField215: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllMudWinPct'
      FieldName = 'DamSireAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 214
    end
    object plPrevDayHHppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllMudWinPctRank'
      FieldName = 'DamSireAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 215
    end
    object plPrevDayHHppField217: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysClass'
      FieldName = 'TodaysClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 216
    end
    object plPrevDayHHppField218: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeed'
      FieldName = 'AvgSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 217
    end
    object plPrevDayHHppField219: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeedRank'
      FieldName = 'AvgSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 218
    end
    object plPrevDayHHppField220: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRating'
      FieldName = 'AvgClassRating'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 219
    end
    object plPrevDayHHppField221: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRatingRank'
      FieldName = 'AvgClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 220
    end
    object plPrevDayHHppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClass'
      FieldName = 'BackClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 221
    end
    object plPrevDayHHppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClassRank'
      FieldName = 'BackClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 222
    end
    object plPrevDayHHppField224: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace1'
      FieldName = 'BackPace1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 223
    end
    object plPrevDayHHppField225: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace1Rank'
      FieldName = 'BackPace1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 224
    end
    object plPrevDayHHppField226: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace2'
      FieldName = 'BackPace2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 225
    end
    object plPrevDayHHppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace2Rank'
      FieldName = 'BackPace2Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 226
    end
    object plPrevDayHHppField228: TppField
      Alignment = taRightJustify
      FieldAlias = 'PastSpeed'
      FieldName = 'PastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 227
    end
    object plPrevDayHHppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'PastSpeedRank'
      FieldName = 'PastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 228
    end
    object plPrevDayHHppField230: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsStarts'
      FieldName = 'TotalTrnOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 229
    end
    object plPrevDayHHppField231: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPct'
      FieldName = 'TotalTrnOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 230
    end
    object plPrevDayHHppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPctRank'
      FieldName = 'TotalTrnOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 231
    end
    object plPrevDayHHppField233: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsStarts'
      FieldName = 'TotalJkyOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 232
    end
    object plPrevDayHHppField234: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPct'
      FieldName = 'TotalJkyOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 233
    end
    object plPrevDayHHppField235: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPctRank'
      FieldName = 'TotalJkyOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 234
    end
    object plPrevDayHHppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClass'
      FieldName = 'CurrClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 235
    end
    object plPrevDayHHppField237: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClassRank'
      FieldName = 'CurrClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 236
    end
    object plPrevDayHHppField238: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseRPI'
      FieldName = 'BaseRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 237
    end
    object plPrevDayHHppField239: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseRPIRank'
      FieldName = 'BaseRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 238
    end
    object plPrevDayHHppField240: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRPI'
      FieldName = 'TurfRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 239
    end
    object plPrevDayHHppField241: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRPIRank'
      FieldName = 'TurfRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 240
    end
    object plPrevDayHHppField242: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRPI'
      FieldName = 'MudRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 241
    end
    object plPrevDayHHppField243: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRPIRank'
      FieldName = 'MudRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 242
    end
    object plPrevDayHHppField244: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenRPI'
      FieldName = 'MaidenRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 243
    end
    object plPrevDayHHppField245: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenRPIRank'
      FieldName = 'MaidenRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 244
    end
    object plPrevDayHHppField246: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionRPI'
      FieldName = 'ConnectionRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 245
    end
    object plPrevDayHHppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionRPIRank'
      FieldName = 'ConnectionRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 246
    end
    object plPrevDayHHppField248: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseIV'
      FieldName = 'BaseIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 247
    end
    object plPrevDayHHppField249: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseIVRank'
      FieldName = 'BaseIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 248
    end
    object plPrevDayHHppField250: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudIV'
      FieldName = 'MudIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 249
    end
    object plPrevDayHHppField251: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudIVRank'
      FieldName = 'MudIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 250
    end
    object plPrevDayHHppField252: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfIV'
      FieldName = 'TurfIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 251
    end
    object plPrevDayHHppField253: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfIVRank'
      FieldName = 'TurfIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 252
    end
    object plPrevDayHHppField254: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenIV'
      FieldName = 'MaidenIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 253
    end
    object plPrevDayHHppField255: TppField
      FieldAlias = 'MaidenIVRank'
      FieldName = 'MaidenIVRank'
      FieldLength = 10
      DisplayWidth = 10
      Position = 254
    end
    object plPrevDayHHppField256: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionIV'
      FieldName = 'ConnectionIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 255
    end
    object plPrevDayHHppField257: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionIVRank'
      FieldName = 'ConnectionIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 256
    end
    object plPrevDayHHppField258: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIV'
      FieldName = 'PaceIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 257
    end
    object plPrevDayHHppField259: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIVRank'
      FieldName = 'PaceIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 258
    end
    object plPrevDayHHppField260: TppField
      Alignment = taRightJustify
      FieldAlias = 'PacePosIV'
      FieldName = 'PacePosIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 259
    end
    object plPrevDayHHppField261: TppField
      Alignment = taRightJustify
      FieldAlias = 'PacePosIVRank'
      FieldName = 'PacePosIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 260
    end
    object plPrevDayHHppField262: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedIV'
      FieldName = 'SpeedIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 261
    end
    object plPrevDayHHppField263: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedIVRank'
      FieldName = 'SpeedIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 262
    end
    object plPrevDayHHppField264: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassIV'
      FieldName = 'ClassIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 263
    end
    object plPrevDayHHppField265: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassIVRank'
      FieldName = 'ClassIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 264
    end
    object plPrevDayHHppField266: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedPoints'
      FieldName = 'SpeedPoints'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 265
    end
    object plPrevDayHHppField267: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedPointsRank'
      FieldName = 'SpeedPointsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 266
    end
    object plPrevDayHHppField268: TppField
      Alignment = taRightJustify
      FieldAlias = 'PDQPaceRating'
      FieldName = 'PDQPaceRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 267
    end
    object plPrevDayHHppField269: TppField
      Alignment = taRightJustify
      FieldAlias = 'PDQPaceRatingRank'
      FieldName = 'PDQPaceRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 268
    end
    object plPrevDayHHppField270: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFavStarts'
      FieldName = 'TotalTrnFavStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 269
    end
    object plPrevDayHHppField271: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFavWinPct'
      FieldName = 'TotalTrnFavWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 270
    end
    object plPrevDayHHppField272: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerStarts'
      FieldName = 'FrontDoubleLinerStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 271
    end
    object plPrevDayHHppField273: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWins'
      FieldName = 'FrontDoubleLinerWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 272
    end
    object plPrevDayHHppField274: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinPct'
      FieldName = 'FrontDoubleLinerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 273
    end
    object plPrevDayHHppField275: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerValueBet'
      FieldName = 'FrontDoubleLinerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 274
    end
    object plPrevDayHHppField276: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerStartsByTrk'
      FieldName = 'FrontDoubleLinerStartsByTrk'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 275
    end
    object plPrevDayHHppField277: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinsByTrk'
      FieldName = 'FrontDoubleLinerWinsByTrk'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 276
    end
    object plPrevDayHHppField278: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinPctByTrk'
      FieldName = 'FrontDoubleLinerWinPctByTrk'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 277
    end
    object plPrevDayHHppField279: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerValueBetByTrk'
      FieldName = 'FrontDoubleLinerValueBetByTrk'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 278
    end
    object plPrevDayHHppField280: TppField
      FieldAlias = 'IsSuperTrainer'
      FieldName = 'IsSuperTrainer'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 279
    end
    object plPrevDayHHppField281: TppField
      FieldAlias = 'IsSuperJockey'
      FieldName = 'IsSuperJockey'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 280
    end
    object plPrevDayHHppField282: TppField
      FieldAlias = 'IsSuperOwner'
      FieldName = 'IsSuperOwner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 281
    end
    object plPrevDayHHppField283: TppField
      FieldAlias = 'IsDollar'
      FieldName = 'IsDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 282
    end
    object plPrevDayHHppField284: TppField
      FieldAlias = 'IsDoubleDollar'
      FieldName = 'IsDoubleDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 283
    end
    object plPrevDayHHppField285: TppField
      FieldAlias = 'IsFrontDoubleLiner0'
      FieldName = 'IsFrontDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 284
    end
    object plPrevDayHHppField286: TppField
      FieldAlias = 'IsFrontDoubleLiner1'
      FieldName = 'IsFrontDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 285
    end
    object plPrevDayHHppField287: TppField
      FieldAlias = 'IsFrontDoubleLiner2'
      FieldName = 'IsFrontDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 286
    end
    object plPrevDayHHppField288: TppField
      FieldAlias = 'IsFrontDoubleLiner3'
      FieldName = 'IsFrontDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 287
    end
    object plPrevDayHHppField289: TppField
      FieldAlias = 'IsBackDoubleLiner0'
      FieldName = 'IsBackDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 288
    end
    object plPrevDayHHppField290: TppField
      FieldAlias = 'IsBackDoubleLiner1'
      FieldName = 'IsBackDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 289
    end
    object plPrevDayHHppField291: TppField
      FieldAlias = 'IsBackDoubleLiner2'
      FieldName = 'IsBackDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 290
    end
    object plPrevDayHHppField292: TppField
      FieldAlias = 'IsBackDoubleLiner3'
      FieldName = 'IsBackDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 291
    end
    object plPrevDayHHppField293: TppField
      FieldAlias = 'IsTripleLiner0'
      FieldName = 'IsTripleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 292
    end
    object plPrevDayHHppField294: TppField
      FieldAlias = 'IsTripleLiner1'
      FieldName = 'IsTripleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 293
    end
    object plPrevDayHHppField295: TppField
      FieldAlias = 'IsTripleLiner2'
      FieldName = 'IsTripleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 294
    end
    object plPrevDayHHppField296: TppField
      FieldAlias = 'IsTripleLiner3'
      FieldName = 'IsTripleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 295
    end
    object plPrevDayHHppField297: TppField
      FieldAlias = 'IsFrontDoubleLiner'
      FieldName = 'IsFrontDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 296
    end
    object plPrevDayHHppField298: TppField
      FieldAlias = 'IsBackDoubleLiner'
      FieldName = 'IsBackDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 297
    end
    object plPrevDayHHppField299: TppField
      FieldAlias = 'IsTripleDot'
      FieldName = 'IsTripleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 298
    end
    object plPrevDayHHppField300: TppField
      FieldAlias = 'IsFrontDoubleDot'
      FieldName = 'IsFrontDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 299
    end
    object plPrevDayHHppField301: TppField
      FieldAlias = 'IsBackDoubleDot'
      FieldName = 'IsBackDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 300
    end
    object plPrevDayHHppField302: TppField
      FieldAlias = 'IsTripleLiner'
      FieldName = 'IsTripleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 301
    end
    object plPrevDayHHppField303: TppField
      FieldAlias = 'IsAngleSheetSelected'
      FieldName = 'IsAngleSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 302
    end
    object plPrevDayHHppField304: TppField
      FieldAlias = 'IsTipSheetSelected'
      FieldName = 'IsTipSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 303
    end
    object plPrevDayHHppField305: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 304
    end
    object plPrevDayHHppField306: TppField
      FieldAlias = 'IsPrintedOnAngleSheet'
      FieldName = 'IsPrintedOnAngleSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 305
    end
    object plPrevDayHHppField307: TppField
      FieldAlias = 'IsYouBetTrack'
      FieldName = 'IsYouBetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 306
    end
    object plPrevDayHHppField308: TppField
      FieldAlias = 'IsLayoffAndUp'
      FieldName = 'IsLayoffAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 307
    end
    object plPrevDayHHppField309: TppField
      FieldAlias = 'IsClaimedAndUp'
      FieldName = 'IsClaimedAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 308
    end
    object plPrevDayHHppField310: TppField
      FieldAlias = 'IsClaimedAndDown'
      FieldName = 'IsClaimedAndDown'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 309
    end
    object plPrevDayHHppField311: TppField
      FieldAlias = 'IsFirstTimeClaiming'
      FieldName = 'IsFirstTimeClaiming'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 310
    end
    object plPrevDayHHppField312: TppField
      FieldAlias = 'IsBelowClaimedPrice'
      FieldName = 'IsBelowClaimedPrice'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 311
    end
    object plPrevDayHHppField313: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerAmt'
      FieldName = 'WagerAmt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 312
    end
    object plPrevDayHHppField314: TppField
      FieldAlias = 'Wager'
      FieldName = 'Wager'
      FieldLength = 10
      DisplayWidth = 10
      Position = 313
    end
    object plPrevDayHHppField315: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerProfitLoss'
      FieldName = 'WagerProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 314
    end
    object plPrevDayHHppField316: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueChoice'
      FieldName = 'ValueChoice'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 315
    end
    object plPrevDayHHppField317: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3Choice'
      FieldName = 'Pk3Choice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 316
    end
    object plPrevDayHHppField318: TppField
      Alignment = taRightJustify
      FieldAlias = 'TriChoice'
      FieldName = 'TriChoice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 317
    end
    object plPrevDayHHppField319: TppField
      Alignment = taRightJustify
      FieldAlias = 'AngleChoice'
      FieldName = 'AngleChoice'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 318
    end
    object plPrevDayHHppField320: TppField
      Alignment = taRightJustify
      FieldAlias = 'TipChoice'
      FieldName = 'TipChoice'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 319
    end
    object plPrevDayHHppField321: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalSheetOrder'
      FieldName = 'FinalSheetOrder'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 320
    end
    object plPrevDayHHppField322: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalSheetOrderRank'
      FieldName = 'FinalSheetOrderRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 321
    end
    object plPrevDayHHppField323: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTurfToDirtStarts'
      FieldName = 'TrnTurfToDirtStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 322
    end
    object plPrevDayHHppField324: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTurfToDirtWinPct'
      FieldName = 'TrnTurfToDirtWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 323
    end
    object plPrevDayHHppField325: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnDirtToTurfStarts'
      FieldName = 'TrnDirtToTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 324
    end
    object plPrevDayHHppField326: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnDirtToTurfWinPct'
      FieldName = 'TrnDirtToTurfWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 325
    end
    object plPrevDayHHppField327: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnRteToSprStarts'
      FieldName = 'TrnRteToSprStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 326
    end
    object plPrevDayHHppField328: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnRteToSprWinPct'
      FieldName = 'TrnRteToSprWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 327
    end
    object plPrevDayHHppField329: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnSprToRteStarts'
      FieldName = 'TrnSprToRteStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 328
    end
    object plPrevDayHHppField330: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnSprToRteWinPct'
      FieldName = 'TrnSprToRteWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 329
    end
    object plPrevDayHHppField331: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutStarts'
      FieldName = 'TotalTrnDebutStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 330
    end
    object plPrevDayHHppField332: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutWinPct'
      FieldName = 'TotalTrnDebutWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 331
    end
    object plPrevDayHHppField333: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoStarts'
      FieldName = 'TotalTrnDebutTwoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 332
    end
    object plPrevDayHHppField334: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoWinPct'
      FieldName = 'TotalTrnDebutTwoWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 333
    end
    object plPrevDayHHppField335: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn91PlusStarts'
      FieldName = 'TotalTrn91PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 334
    end
    object plPrevDayHHppField336: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn91PlusWinPct'
      FieldName = 'TotalTrn91PlusWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 335
    end
    object plPrevDayHHppField337: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork91PlusStarts'
      FieldName = 'TotalTrnWork91PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 336
    end
    object plPrevDayHHppField338: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork91PlusWinPct'
      FieldName = 'TotalTrnWork91PlusWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 337
    end
    object plPrevDayHHppField339: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmStarts'
      FieldName = 'TotalTrnAftClmStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 338
    end
    object plPrevDayHHppField340: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmWinPct'
      FieldName = 'TotalTrnAftClmWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 339
    end
    object plPrevDayHHppField341: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFirstJuiceStarts'
      FieldName = 'TotalTrnFirstJuiceStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 340
    end
    object plPrevDayHHppField342: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFirstJuiceWinPct'
      FieldName = 'TotalTrnFirstJuiceWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 341
    end
    object plPrevDayHHppField343: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnSecondJuiceStarts'
      FieldName = 'TotalTrnSecondJuiceStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 342
    end
    object plPrevDayHHppField344: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnSecondJuiceWinPct'
      FieldName = 'TotalTrnSecondJuiceWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 343
    end
    object plPrevDayHHppField345: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOnStarts'
      FieldName = 'TotalTrnBlinkersOnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 344
    end
    object plPrevDayHHppField346: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOnWinPct'
      FieldName = 'TotalTrnBlinkersOnWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 345
    end
    object plPrevDayHHppField347: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOffStarts'
      FieldName = 'TotalTrnBlinkersOffStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 346
    end
    object plPrevDayHHppField348: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnBlinkersOffWinPct'
      FieldName = 'TotalTrnBlinkersOffWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 347
    end
    object plPrevDayHHppField349: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnClaimed1BackStarts'
      FieldName = 'TotalTrnClaimed1BackStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 348
    end
    object plPrevDayHHppField350: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnClaimed1BackWinPct'
      FieldName = 'TotalTrnClaimed1BackWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 349
    end
    object plPrevDayHHppField351: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnClaimed2BackStarts'
      FieldName = 'TotalTrnClaimed2BackStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 350
    end
    object plPrevDayHHppField352: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnClaimed2BackWinPct'
      FieldName = 'TotalTrnClaimed2BackWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 351
    end
    object plPrevDayHHppField353: TppField
      FieldAlias = 'LastTrkCode'
      FieldName = 'LastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 352
    end
    object plPrevDayHHppField354: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastRaceNbr'
      FieldName = 'LastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 353
    end
    object plPrevDayHHppField355: TppField
      FieldAlias = 'LastRaceDate'
      FieldName = 'LastRaceDate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 10
      Position = 354
    end
    object plPrevDayHHppField356: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPostPos'
      FieldName = 'LastPostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 355
    end
    object plPrevDayHHppField357: TppField
      FieldAlias = 'LastRaceType'
      FieldName = 'LastRaceType'
      FieldLength = 6
      DisplayWidth = 6
      Position = 356
    end
    object plPrevDayHHppField358: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastDistance'
      FieldName = 'LastDistance'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 357
    end
    object plPrevDayHHppField359: TppField
      FieldAlias = 'LastSurf'
      FieldName = 'LastSurf'
      FieldLength = 1
      DisplayWidth = 1
      Position = 358
    end
    object plPrevDayHHppField360: TppField
      FieldAlias = 'LastClaimed'
      FieldName = 'LastClaimed'
      FieldLength = 1
      DisplayWidth = 1
      Position = 359
    end
    object plPrevDayHHppField361: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClmPrice'
      FieldName = 'LastClmPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 360
    end
    object plPrevDayHHppField362: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPurse'
      FieldName = 'LastPurse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 361
    end
    object plPrevDayHHppField363: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastOdds'
      FieldName = 'LastOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 362
    end
    object plPrevDayHHppField364: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastFinishPos'
      FieldName = 'LastFinishPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 363
    end
    object plPrevDayHHppField365: TppField
      FieldAlias = 'LastFavoriteIndicator'
      FieldName = 'LastFavoriteIndicator'
      FieldLength = 1
      DisplayWidth = 1
      Position = 364
    end
    object plPrevDayHHppField366: TppField
      FieldAlias = 'LastTrkCond'
      FieldName = 'LastTrkCond'
      FieldLength = 2
      DisplayWidth = 2
      Position = 365
    end
    object plPrevDayHHppField367: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastRaceKeyStarters'
      FieldName = 'LastRaceKeyStarters'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 366
    end
    object plPrevDayHHppField368: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastRaceKeyWinners'
      FieldName = 'LastRaceKeyWinners'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 367
    end
    object plPrevDayHHppField369: TppField
      FieldAlias = 'AngleDesc'
      FieldName = 'AngleDesc'
      FieldLength = 10
      DisplayWidth = 10
      Position = 368
    end
    object plPrevDayHHppField370: TppField
      Alignment = taRightJustify
      FieldAlias = 'RouteStarts'
      FieldName = 'RouteStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 369
    end
    object plPrevDayHHppField371: TppField
      Alignment = taRightJustify
      FieldAlias = 'SprintStarts'
      FieldName = 'SprintStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 370
    end
    object plPrevDayHHppField372: TppField
      FieldAlias = 'IsBlinkersOn'
      FieldName = 'IsBlinkersOn'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 371
    end
    object plPrevDayHHppField373: TppField
      FieldAlias = 'IsBlinkersOff'
      FieldName = 'IsBlinkersOff'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 372
    end
    object plPrevDayHHppField374: TppField
      FieldAlias = 'LastEquip'
      FieldName = 'LastEquip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 373
    end
  end
  object ppByDayReport: TppReport
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
    Template.FileName = 'D:\Ratings31\PrevByDay.rtm'
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
    Top = 120
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plPrevDayHH'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'lblTrkCode'
        Caption = 'Trk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 1588
        mmTop = 10319
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'lblRaceNbr'
        Caption = 'R#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 8467
        mmTop = 10319
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'lblProgNbr'
        Caption = 'P#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 15346
        mmTop = 10319
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lblHorse'
        Caption = 'Horse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 19050
        mmTop = 10319
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'lblML'
        Caption = 'M/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 42069
        mmTop = 10319
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lbl5Choices'
        Caption = 'Top Choices'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2822
        mmLeft = 105569
        mmTop = 10319
        mmWidth = 16298
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblFinPos'
        Caption = 'Fin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 47890
        mmTop = 10319
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'lblOdds'
        Caption = 'Odds'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 55563
        mmTop = 10319
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'lblFinishNbrs'
        Caption = 'Finish '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 128059
        mmTop = 10054
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'lblExa'
        Caption = 'Exacta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 187855
        mmTop = 10319
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'lblQui'
        Caption = 'Quinella'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 201084
        mmTop = 10319
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'lblPk3'
        Caption = 'Pick 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 237861
        mmTop = 10319
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'lblDD'
        Caption = 'Double'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 219869
        mmTop = 10319
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'lblPk4'
        Caption = 'Pick 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 256382
        mmTop = 10319
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'lblTri'
        Caption = 'Trifecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 168011
        mmTop = 10319
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'lblSfc'
        Caption = 'Superfecta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 146315
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'lblWinNbrs'
        AutoSize = False
        Caption = 'Winner'#39's Win/Place/Show Prices'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 63236
        mmTop = 10319
        mmWidth = 40746
        BandType = 0
      end
      object lblReportTitle: TppLabel
        UserName = 'lblReportTitle'
        AutoSize = False
        Caption = 'Hospital Form Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 126207
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'sysPage'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 236273
        mmTop = 0
        mmWidth = 25665
        BandType = 0
      end
      object varStartDate: TppLabel
        UserName = 'lblStartDate'
        Caption = 'lblStartDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5821
        mmLeft = 177271
        mmTop = 0
        mmWidth = 25400
        BandType = 0
      end
      object varEndDate: TppLabel
        UserName = 'lblEndDate'
        Caption = 'EndDate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5821
        mmLeft = 203200
        mmTop = 0
        mmWidth = 21431
        BandType = 0
      end
      object varFldName: TppDBText
        UserName = 'FldName'
        AutoSize = True
        DataField = 'TrkCode'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 5821
        mmLeft = 126084
        mmTop = 0
        mmWidth = 10971
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'FldName1'
        AutoSize = True
        DataField = 'MorningLineTo1'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 5821
        mmLeft = 155204
        mmTop = 0
        mmWidth = 2752
        BandType = 0
      end
    end
    object DetailBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
      object dbRaceNbr: TppDBText
        UserName = 'RaceNbr'
        DataField = 'RaceNbr'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2625
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2625
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2625
        mmLeft = 0
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2625
        mmLeft = 13758
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object dbFinishPos: TppDBText
        UserName = 'FinishPos'
        BlankWhenZero = True
        DataField = 'FinishPos'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2646
        mmLeft = 47625
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object dbOdds: TppDBText
        UserName = 'Odds'
        BlankWhenZero = True
        DataField = 'Odds'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2646
        mmLeft = 53446
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object dbML: TppDBText
        UserName = 'ML'
        DataField = 'MorningLineDesc'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2293
        mmLeft = 39159
        mmTop = 0
        mmWidth = 7408
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 186532
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object FinishNbrs: TppDBText
        UserName = 'FinishNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 3704
        mmLeft = 123296
        mmTop = 0
        mmWidth = 18785
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2625
        mmLeft = 167746
        mmTop = 0
        mmWidth = 12171
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 202671
        mmTop = 0
        mmWidth = 10319
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 121709
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 213519
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
        mmHeight = 9260
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
        mmHeight = 9260
        mmLeft = 162190
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 181240
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 197115
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
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
        mmHeight = 9260
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 218546
        mmTop = 0
        mmWidth = 10319
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 253207
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 229659
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 248444
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2625
        mmLeft = 148696
        mmTop = 0
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 249503
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2625
        mmLeft = 230717
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 214842
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 198702
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 182827
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2625
        mmLeft = 163777
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
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
        mmHeight = 9260
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 81227
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object dbSheetOrder: TppDBText
        UserName = 'SheetOrder'
        DataField = 'WagerFinalOrder'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
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
        mmHeight = 9260
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 235215
        mmTop = 0
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 218546
        mmTop = 2910
        mmWidth = 10319
        BandType = 4
      end
      object dbPick3: TppDBText
        UserName = 'Pick3'
        BlankWhenZero = True
        DataField = 'Pick3FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 230982
        mmTop = 3175
        mmWidth = 16404
        BandType = 4
      end
      object dbPick4: TppDBText
        UserName = 'Pick4'
        BlankWhenZero = True
        DataField = 'Pick4FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 250032
        mmTop = 2910
        mmWidth = 15346
        BandType = 4
      end
      object dbDailyDoubleNbrs: TppDBText
        UserName = 'DailyDoubleNbrs'
        BlankWhenZero = True
        DataField = 'DailyDoubleNbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 218546
        mmTop = 5821
        mmWidth = 10319
        BandType = 4
      end
      object dbPick3Nbrs: TppDBText
        UserName = 'Pick3Nbrs'
        BlankWhenZero = True
        DataField = 'Pick3NbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 230982
        mmTop = 6085
        mmWidth = 16404
        BandType = 4
      end
      object dbPick4Nbrs: TppDBText
        UserName = 'Pick4Nbrs'
        BlankWhenZero = True
        DataField = 'Pick4NbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 250032
        mmTop = 5821
        mmWidth = 15346
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label1'
        Caption = 'Pk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2328
        mmLeft = 214313
        mmTop = 3175
        mmWidth = 2540
        BandType = 4
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Fin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2328
        mmLeft = 214313
        mmTop = 5821
        mmWidth = 3810
        BandType = 4
      end
      object dbPlcNbrs: TppDBText
        UserName = 'PlcNbrs'
        BlankWhenZero = True
        DataField = 'PlcNbrs'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 62442
        mmTop = 3175
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 62442
        mmTop = 6085
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 89165
        mmTop = 3175
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 97102
        mmTop = 3175
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
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2328
        mmLeft = 97102
        mmTop = 6085
        mmWidth = 6879
        BandType = 4
      end
      object dbRaceDate: TppDBText
        UserName = 'TrkCode1'
        DataField = 'RaceDate'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2381
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
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2646
        mmLeft = 529
        mmTop = 6085
        mmWidth = 6085
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'RaceNbr1'
        DataField = 'DaysLast'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2646
        mmLeft = 7673
        mmTop = 6085
        mmWidth = 4233
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TrkCode'
      DataPipeline = plPrevDayHH
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plPrevDayHH'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        AfterGenerate = ppGroupFooterBand1AfterGenerate
        mmBottomOffset = 0
        mmHeight = 112977
        mmPrintPosition = 0
        object imgPk3: TppShape
          UserName = 'imgDD1'
          mmHeight = 19844
          mmLeft = 193146
          mmTop = 43392
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 33338
          mmLeft = 794
          mmTop = 1058
          mmWidth = 55298
          BandType = 5
          GroupNo = 0
        end
        object ppVarTotalWins: TppVariable
          UserName = 'vWins'
          CalcOrder = 1
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 45508
          mmTop = 6085
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object varTotalStarts: TppVariable
          UserName = 'vStarts'
          CalcOrder = 0
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 42069
          mmTop = 1058
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object lblStarts: TppLabel
          UserName = 'lblStarts'
          Caption = 'Starts '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object lblWins: TppLabel
          UserName = 'lblWins'
          Caption = 'Wins'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 5821
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
        object ppVarTotalPlcs: TppVariable
          UserName = 'vPlcs'
          CalcOrder = 2
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 45244
          mmTop = 10848
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'lblPlcs'
          Caption = 'Places'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 10583
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object ppVarTotalWinPct: TppVariable
          UserName = 'vWinPct'
          CalcOrder = 4
          DataType = dtDouble
          DisplayFormat = '##.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 41804
          mmTop = 20373
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'lblWinPct'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 20108
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppVariable4: TppVariable
          UserName = 'vShos'
          CalcOrder = 3
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 45244
          mmTop = 15610
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'lblShos'
          Caption = 'Shows'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 15346
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 35983
          mmLeft = 529
          mmTop = 34925
          mmWidth = 55298
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'lblAvgOdds'
          Caption = 'Avg Win Odds To $1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 24871
          mmWidth = 33073
          BandType = 5
          GroupNo = 0
        end
        object varAvgOdds: TppVariable
          UserName = 'vAvgOdds'
          CalcOrder = 5
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 40217
          mmTop = 25400
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object varTotalOdds: TppVariable
          UserName = 'vTotalOdds'
          CalcOrder = 6
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 36777
          mmTop = 29898
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'lblTotalOdds'
          Caption = 'Total Odds To 1$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 29633
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'lblWPSPL'
          Caption = 'WPS P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 37042
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object vWPSPL: TppVariable
          UserName = 'vWPSPL'
          CalcOrder = 37
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 43127
          mmTop = 37306
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object vTriSfcPL: TppVariable
          UserName = 'vTriSfcPL'
          CalcOrder = 38
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 38894
          mmTop = 42598
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object lblTriSfcPL: TppLabel
          UserName = 'lblTriSfcPL'
          Caption = 'Tri/Sfc P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 42333
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object lblExaQuiPL: TppLabel
          UserName = 'lblExaQuiPL'
          Caption = 'Exa/Qui P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2381
          mmTop = 47625
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object lblDDPk3PL: TppLabel
          UserName = 'lblDDPk3PL'
          Caption = 'DD/Pk3 P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 52917
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object vExaQuiPL: TppVariable
          UserName = 'vExaQuiPL'
          CalcOrder = 39
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 37835
          mmTop = 47890
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object vDDPk3PL: TppVariable
          UserName = 'vDDPk3PL'
          CalcOrder = 40
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 39688
          mmTop = 53181
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object lblPk4Pk6PL: TppLabel
          UserName = 'lblPk4Pk6PL'
          Caption = 'Pk4/Pk6 P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2646
          mmTop = 59002
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object vPk4Pk6PL: TppVariable
          UserName = 'vPk4Pk6PL'
          CalcOrder = 41
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 37835
          mmTop = 59267
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object lblFilter: TppLabel
          UserName = 'lblFilter'
          AutoSize = False
          Caption = 'lblFilter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          Visible = False
          WordWrap = True
          mmHeight = 6350
          mmLeft = 0
          mmTop = 105834
          mmWidth = 262996
          BandType = 5
          GroupNo = 0
        end
        object imgTri: TppShape
          UserName = 'imgTri'
          mmHeight = 20108
          mmLeft = 126471
          mmTop = 23019
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object imgSfc: TppShape
          UserName = 'imgSfc'
          mmHeight = 20108
          mmLeft = 126736
          mmTop = 1588
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object imgWin: TppShape
          UserName = 'imgWin'
          mmHeight = 20108
          mmLeft = 60325
          mmTop = 1323
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'lblWinWagered'
          Caption = '$2 Win Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 62177
          mmTop = 2381
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'lblWinPayout'
          Caption = '$2 Win Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 62177
          mmTop = 7144
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'lblWinPL'
          Caption = '$2 Win P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 62177
          mmTop = 11906
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppVariable1: TppVariable
          UserName = 'vWinWagered'
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 102923
          mmTop = 2117
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object varWinWon: TppVariable
          UserName = 'vWinWon'
          CalcOrder = 8
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 109538
          mmTop = 7938
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppVariable3: TppVariable
          UserName = 'vWinPL'
          CalcOrder = 9
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 111390
          mmTop = 12171
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object imgPlc: TppShape
          UserName = 'imgPlc'
          mmHeight = 20108
          mmLeft = 60325
          mmTop = 22754
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object ppLabel28: TppLabel
          UserName = 'lblPlcWagered'
          Caption = '$2 Place Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 24077
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel29: TppLabel
          UserName = 'lblPlcPayout'
          Caption = '$2 Place Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 28840
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel30: TppLabel
          UserName = 'lblPlcPL'
          Caption = '$2 Place P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 33602
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object ppVariable5: TppVariable
          UserName = 'vPlcWagered'
          CalcOrder = 10
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 102129
          mmTop = 24077
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppVariable6: TppVariable
          UserName = 'vPlcWon'
          CalcOrder = 11
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 108744
          mmTop = 28840
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppVariable7: TppVariable
          UserName = 'vPlcPL'
          CalcOrder = 12
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 110596
          mmTop = 33867
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object lblSfcWagered: TppLabel
          UserName = 'lblSfcWagered'
          Caption = '$2 Superfecta Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 2646
          mmWidth = 35454
          BandType = 5
          GroupNo = 0
        end
        object lblSfcPayout: TppLabel
          UserName = 'lblSfcPayout'
          Caption = '$2 Superfecta Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 7938
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
        end
        object lblSfcPL: TppLabel
          UserName = 'Label301'
          Caption = '$2 Superfecta P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 12435
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object varSfcPL: TppVariable
          UserName = 'vSfcPL'
          CalcOrder = 15
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 176742
          mmTop = 12700
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varSfcPayout: TppVariable
          UserName = 'vSfcWon'
          CalcOrder = 14
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174890
          mmTop = 8202
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varSfcWagered: TppVariable
          UserName = 'vSfcWagered'
          CalcOrder = 13
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 168275
          mmTop = 2646
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object lblTriWagered: TppLabel
          UserName = 'lblTriWagered'
          Caption = '$2 Trifecta Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 23813
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object lblTriPayout: TppLabel
          UserName = 'lblTriPayout'
          Caption = '$2 Trifecta Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 28575
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object lblTriPL: TppLabel
          UserName = 'lblTriPL'
          Caption = '$2 Trifecta P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 33602
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object varTriPL: TppVariable
          UserName = 'vTriPL'
          CalcOrder = 18
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 176742
          mmTop = 33867
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varTriPayout: TppVariable
          UserName = 'vTriWon'
          CalcOrder = 17
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174890
          mmTop = 28840
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varTriWagered: TppVariable
          UserName = 'vTriWagered'
          CalcOrder = 16
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 168275
          mmTop = 24077
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object imgExa: TppShape
          UserName = 'imgExa'
          mmHeight = 19579
          mmLeft = 126207
          mmTop = 65088
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object imgQui: TppShape
          UserName = 'imgQui'
          mmHeight = 20108
          mmLeft = 126471
          mmTop = 43921
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object lblQuiWagered: TppLabel
          UserName = 'lblQuiWagered'
          Caption = '$2 Quinella Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 44979
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object lblQuiPayout: TppLabel
          UserName = 'lblQuiPayout'
          Caption = '$2 Quinella Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 50271
          mmWidth = 32279
          BandType = 5
          GroupNo = 0
        end
        object lblQuiPL: TppLabel
          UserName = 'lblQuiPL'
          Caption = '$2 Quinella P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 54769
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varQuiPL: TppVariable
          UserName = 'vQuiPL'
          CalcOrder = 21
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 177007
          mmTop = 55033
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varQuiPayout: TppVariable
          UserName = 'vQuiWon'
          CalcOrder = 20
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175155
          mmTop = 50536
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varQuiWagered: TppVariable
          UserName = 'vQuiWagered'
          CalcOrder = 19
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 168540
          mmTop = 45508
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object lblExaWagered: TppLabel
          UserName = 'lblExaWagered'
          Caption = '$2 Exacta Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 65881
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblExaPayout: TppLabel
          UserName = 'lblExaPayout'
          Caption = '$2 Exacta Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 70644
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblExaPL: TppLabel
          UserName = 'lblExaPL'
          Caption = '$2 Exacta P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 75671
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object varExaPL: TppVariable
          UserName = 'vExaPL'
          CalcOrder = 24
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 177007
          mmTop = 75936
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varExaPayout: TppVariable
          UserName = 'vExaWon'
          CalcOrder = 23
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175155
          mmTop = 70908
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varExaWagered: TppVariable
          UserName = 'vExaWagered'
          CalcOrder = 22
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 168540
          mmTop = 66146
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object imgDD: TppShape
          UserName = 'imgDD'
          mmHeight = 33073
          mmLeft = 192882
          mmTop = 1323
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object lblDDWagered: TppLabel
          UserName = 'Label401'
          Caption = '$2 Double Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 193940
          mmTop = 2646
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblDDPayout: TppLabel
          UserName = 'lblDDPayout'
          Caption = '$2 Double Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 7144
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblDDPL: TppLabel
          UserName = 'lblDDPL'
          Caption = '$2 Double P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 11642
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object varDDPL: TppVariable
          UserName = 'vDDPL'
          CalcOrder = 30
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 244475
          mmTop = 11906
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object varDDPayout: TppVariable
          UserName = 'vDDWon'
          CalcOrder = 28
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 242888
          mmTop = 7408
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varDDWagered: TppVariable
          UserName = 'vDDWagered'
          CalcOrder = 26
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 236009
          mmTop = 3175
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object imgSho: TppShape
          UserName = 'imgSho'
          mmHeight = 20108
          mmLeft = 60325
          mmTop = 43921
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object ppLabel46: TppLabel
          UserName = 'lblShoWagered'
          Caption = '$2 Show Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61119
          mmTop = 45244
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel47: TppLabel
          UserName = 'lblShoPayout'
          Caption = '$2 Show Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61119
          mmTop = 50006
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'lblShoPL'
          Caption = '$2 Show P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61119
          mmTop = 55033
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppVariable23: TppVariable
          UserName = 'vShoWagered'
          CalcOrder = 25
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 101865
          mmTop = 45244
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppVariable24: TppVariable
          UserName = 'vShoWon'
          CalcOrder = 27
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 108479
          mmTop = 50006
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppVariable25: TppVariable
          UserName = 'vShoPL'
          CalcOrder = 29
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 110331
          mmTop = 55033
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object lblPk3Wagered: TppLabel
          UserName = 'lblPk3Wagered'
          Caption = '$2 Pick 3 Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 194205
          mmTop = 44979
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblPk3Payout: TppLabel
          UserName = 'lblPk3Payout'
          Caption = '$2 Pick 3 Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 194469
          mmTop = 49213
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblPk3PL: TppLabel
          UserName = 'lblPk3PL'
          Caption = '$2 Pick 3 P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 194469
          mmTop = 54240
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object varPk3PL: TppVariable
          UserName = 'vPk3PL'
          CalcOrder = 33
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 243682
          mmTop = 54504
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varPk3Payout: TppVariable
          UserName = 'vPk3Won'
          CalcOrder = 32
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 241830
          mmTop = 49742
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varPk3Wagered: TppVariable
          UserName = 'vPk3Wagered'
          CalcOrder = 31
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 235480
          mmTop = 45773
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object imgPk4: TppShape
          UserName = 'imgDD2'
          mmHeight = 20902
          mmLeft = 193146
          mmTop = 64029
          mmWidth = 61913
          BandType = 5
          GroupNo = 0
        end
        object lblPk4Wagered: TppLabel
          UserName = 'lblPk4Wagered'
          Caption = '$2 Pick 4 Wagered'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 65088
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblPk4Payout: TppLabel
          UserName = 'lblPk4Payout'
          Caption = '$2 Pick 4 Payouts'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 69850
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object lblPk4PL: TppLabel
          UserName = 'lblPk4PL'
          Caption = '$2 Pick 4 P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 74877
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object varPk4PL: TppVariable
          UserName = 'vPk4PL'
          CalcOrder = 36
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 243153
          mmTop = 74877
          mmWidth = 10054
          BandType = 5
          GroupNo = 0
        end
        object varPk4Payout: TppVariable
          UserName = 'vPk4Won'
          CalcOrder = 35
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 241300
          mmTop = 69850
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varPk4Wagered: TppVariable
          UserName = 'vPk4Wagered'
          CalcOrder = 34
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 234686
          mmTop = 65088
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'lblWinPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 62177
          mmTop = 17198
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object varPLPct: TppVariable
          UserName = 'vWinPLPct'
          CalcOrder = 42
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 105834
          mmTop = 17463
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'lblPlcPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 61383
          mmTop = 38365
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable8: TppVariable
          UserName = 'vPlcPLPct'
          CalcOrder = 43
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 105040
          mmTop = 38629
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel35: TppLabel
          UserName = 'lblShoPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 60854
          mmTop = 59531
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable9: TppVariable
          UserName = 'vShoPLPct'
          CalcOrder = 44
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 104511
          mmTop = 59796
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'lblSfcPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 128059
          mmTop = 16404
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable13: TppVariable
          UserName = 'vSfcPLPct'
          CalcOrder = 45
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170921
          mmTop = 16669
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppVariable14: TppVariable
          UserName = 'vTriPLPct'
          CalcOrder = 46
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170657
          mmTop = 38100
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'lblTriPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127794
          mmTop = 38629
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'lblQuiPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 59796
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable15: TppVariable
          UserName = 'vQuiPLPct'
          CalcOrder = 47
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 171186
          mmTop = 59796
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'lblExaPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 79904
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable16: TppVariable
          UserName = 'vExaPLPct'
          CalcOrder = 48
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 171450
          mmTop = 80433
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'lblPk4PLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 194734
          mmTop = 80169
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable12: TppVariable
          UserName = 'vPk4PLPct'
          CalcOrder = 49
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 237861
          mmTop = 80169
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'lblPk3PLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 194998
          mmTop = 59267
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable11: TppVariable
          UserName = 'vPk3PLPct'
          CalcOrder = 50
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 238125
          mmTop = 59267
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
        end
        object ppLabel36: TppLabel
          UserName = 'lblDDPLPct'
          Caption = 'P/L %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 16140
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppVariable10: TppVariable
          UserName = 'vDDPLPct'
          CalcOrder = 51
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239713
          mmTop = 16404
          mmWidth = 13494
          BandType = 5
          GroupNo = 0
        end
        object ppVariable2: TppVariable
          UserName = 'vTotalPL'
          CalcOrder = 52
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3006
          mmLeft = 38894
          mmTop = 64823
          mmWidth = 13547
          BandType = 5
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'lblTotalPL'
          Caption = 'Total P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3217
          mmLeft = 2381
          mmTop = 64823
          mmWidth = 15240
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'lblDDPLPct1'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193675
          mmTop = 29633
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'Label49'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 20638
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'Label50'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193675
          mmTop = 25135
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object varDDNbrWagers: TppVariable
          UserName = 'vDDNbrWagers'
          CalcOrder = 53
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3006
          mmLeft = 232622
          mmTop = 20902
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object varDDWinPct: TppVariable
          UserName = 'vDDWinPct'
          CalcOrder = 54
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3006
          mmLeft = 236909
          mmTop = 25929
          mmWidth = 15240
          BandType = 5
          GroupNo = 0
        end
        object vDDAvgPayout: TppVariable
          UserName = 'vDDAvgPayout'
          CalcOrder = 55
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3006
          mmLeft = 233151
          mmTop = 30163
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MorningLineTo1'
      DataPipeline = plPrevDayHH
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plPrevDayHH'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060A54726150726F6772616D094368696C645479706502150E497346756E63
        74696F6E54797065090B50726F6772616D4E616D65060C436F6D70757465504C
        5063740B50726F6772616D54797065070A747446756E6374696F6E06536F7572
        6365068966756E6374696F6E20436F6D70757465504C506374202866576F6E3A
        646F75626C653B66576167657265643A646F75626C65293A646F75626C653B0D
        0A626567696E0D0A20200D0A202020526573756C74203A3D20282866576F6E20
        2D20665761676572656429202F20665761676572656429202A203130303B0D0A
        2020200D0A656E643B0D0A0D0A0001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65061346696E6973684E6272734F6E476574546578
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        650CCD01000070726F6365647572652046696E6973684E6272734F6E47657454
        6578742876617220546578743A20537472696E67293B0D0A626567696E0D0A0D
        0A202054657874203A3D2027273B0D0A20200D0A20206966205472696D28706C
        5072657644617952485B27537570657266656374614E627273275D29203C3E20
        2727207468656E20626567696E0D0A202020202054657874203A3D2020706C50
        72657644617952485B27537570657266656374614E627273275D3B0D0A202065
        6E643B0D0A2020200D0A20206966205472696D285465787429203D2027272074
        68656E20626567696E0D0A20200954657874203A3D2020706C50726576446179
        52485B2754726966656374614E627273275D3B0D0A2020656E643B0D0A20200D
        0A20206966205472696D285465787429203D202727207468656E20626567696E
        0D0A20200954657874203A3D2020706C5072657644617952485B274578616374
        614E627273275D3B0D0A2020656E643B0D0A0D0A20206966205472696D285465
        787429203D202727207468656E20626567696E0D0A20200954657874203A3D20
        20706C5072657644617952485B275175696E656C6C614E627273275D3B0D0A20
        20656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060A46696E6973684E627273094576656E744E616D6506094F6E4765745465
        7874074576656E74494402350001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506135069636B3457616765724F6E47657454657874
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06F170726F636564757265205069636B3457616765724F6E4765745465787428
        76617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B275069636B34576167657246697273745261
        6365275D203D2031207468656E20626567696E0D0A2020202054657874203A3D
        20272431273B0D0A2020656E643B20200D0A2020696620706C50726576446179
        52485B275069636B345761676572466972737452616365275D203D2032207468
        656E20626567696E0D0A2020202054657874203A3D20272432273B0D0A202065
        6E643B20200D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060A5069636B345761676572094576656E744E616D6506094F6E4765745465
        7874074576656E74494402350001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506135069636B3357616765724F6E47657454657874
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06EF70726F636564757265205069636B3357616765724F6E4765745465787428
        76617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B275069636B33576167657246697273745261
        6365275D203D2031207468656E20626567696E0D0A2020202054657874203A3D
        20272431273B0D0A2020656E643B20200D0A2020696620706C50726576446179
        52485B275069636B335761676572466972737452616365275D203D2032207468
        656E20626567696E0D0A2020202054657874203A3D20272432273B0D0A202065
        6E643B20200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A5069636B335761676572094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506194461696C79446F75626C6557616765724F6E476574
        546578740B50726F6772616D54797065070B747450726F63656475726506536F
        757263650C0101000070726F636564757265204461696C79446F75626C655761
        6765724F6E476574546578742876617220546578743A20537472696E67293B0D
        0A626567696E0D0A0D0A2020696620706C5072657644617952485B274461696C
        79446F75626C655761676572466972737452616365275D203D2031207468656E
        20626567696E0D0A2020202054657874203A3D20272431273B0D0A2020656E64
        3B20200D0A2020696620706C5072657644617952485B274461696C79446F7562
        6C655761676572466972737452616365275D203D2032207468656E2062656769
        6E0D0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506104461696C7944
        6F75626C655761676572094576656E744E616D6506094F6E4765745465787407
        4576656E74494402350001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506165175696E656C6C6157616765724F6E47657454657874
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06E670726F636564757265205175696E656C6C6157616765724F6E4765745465
        78742876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A
        2020696620706C5072657644617952485B275175696E656C6C61576167657227
        5D203D2031207468656E20626567696E0D0A2020202054657874203A3D202724
        31273B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B
        275175696E656C6C615761676572275D203D2032207468656E20626567696E0D
        0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E656C6C61
        5761676572094576656E744E616D6506094F6E47657454657874074576656E74
        494402350001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65061445786163746157616765724F6E476574546578740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C100100007072
        6F6365647572652045786163746157616765724F6E4765745465787428766172
        20546578743A20537472696E67293B0D0A626567696E0D0A2020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        20202020202020200D0A2020696620706C5072657644617952485B2745786163
        74615761676572275D203D2031207468656E20626567696E0D0A202020205465
        7874203A3D20272431273B0D0A2020656E643B20200D0A2020696620706C5072
        657644617952485B274578616374615761676572275D203D2032207468656E20
        626567696E0D0A2020202054657874203A3D20272432273B0D0A2020656E643B
        20200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B4578
        616374615761676572094576656E744E616D6506094F6E476574546578740745
        76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D650616547269666563746157616765724F6E476574546578740B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        E670726F63656475726520547269666563746157616765724F6E476574546578
        742876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A20
        20696620706C5072657644617952485B2754726966656374615761676572275D
        203D2031207468656E20626567696E0D0A2020202054657874203A3D20272431
        273B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B27
        54726966656374615761676572275D203D2032207468656E20626567696E0D0A
        2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A20200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060D547269666563746157
        61676572094576656E744E616D6506094F6E47657454657874074576656E7449
        4402350001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D6506185375706572666563746157616765724F6E476574546578740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506EC7072
        6F636564757265205375706572666563746157616765724F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020
        696620706C5072657644617952485B2753757065726665637461576167657227
        5D203D2031207468656E20626567696E0D0A2020202054657874203A3D202724
        31273B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B
        27537570657266656374615761676572275D203D2032207468656E2062656769
        6E0D0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F537570657266
        656374615761676572094576656E744E616D6506094F6E476574546578740745
        76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061046696E697368506F734F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506BF70726F6365
        647572652046696E697368506F734F6E5072696E743B0D0A626567696E0D0A0D
        0A2020696620706C5072657644617948485B2746696E697368506F73275D203D
        2031207468656E20626567696E0D0A202020202046696E697368506F732E466F
        6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C736520626567
        696E0D0A202020202046696E697368506F732E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060946696E697368506F73094576656E744E616D6506074F
        6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060B4F6464734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506AB7072
        6F636564757265204F6464734F6E5072696E743B0D0A626567696E0D0A206966
        20706C5072657644617948485B2746696E697368506F73275D203D2031207468
        656E20626567696E0D0A20202020204F6464732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A20202020204F
        6464732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506044F646473094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060B7657696E73
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365068E70726F636564757265207657696E734F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617948485B2746696E697368506F73275D203D20312074
        68656E20626567696E0D0A2020202056616C7565203A3D2056616C7565202B20
        313B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D6506057657696E73094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060E54726B436F64654F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506B770726F6365647572
        652054726B436F64654F6E5072696E743B0D0A626567696E0D0A0D0A20206966
        20706C5072657644617948485B2746696E697368506F73275D203D2031207468
        656E20626567696E0D0A202020202054726B436F64652E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        202054726B436F64652E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060754
        726B436F6465094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65061150726F6772616D4E62724F6E5072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F7572636506BC70726F636564757265
        2050726F6772616D4E62724F6E5072696E743B0D0A626567696E0D0A69662070
        6C5072657644617948485B2746696E697368506F73275D203D2031207468656E
        20626567696E0D0A202020202050726F6772616D4E62722E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202050726F6772616D4E62722E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060A50726F6772616D4E6272094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D650610486F7273654E616D654F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506BD70726F
        63656475726520486F7273654E616D654F6E5072696E743B0D0A626567696E0D
        0A0D0A2020696620706C5072657644617948485B2746696E697368506F73275D
        203D2031207468656E20626567696E0D0A2020202020486F7273654E616D652E
        466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062
        6567696E0D0A2020202020486F7273654E616D652E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D650609486F7273654E616D65094576656E744E616D6506074F
        6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060E526163654E62724F6E5072696E740B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        B770726F63656475726520526163654E62724F6E5072696E743B0D0A62656769
        6E0D0A0D0A2020696620706C5072657644617948485B2746696E697368506F73
        275D203D2031207468656E20626567696E0D0A2020202020526163654E62722E
        466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062
        6567696E0D0A2020202020526163654E62722E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D650607526163654E6272094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D6506094D4C4F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506A870726F6365647572
        65204D4C4F6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C5072
        657644617948485B2746696E697368506F73275D203D2031207468656E206265
        67696E0D0A20202020204D4C2E466F6E742E426F6C64203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A20202020204D4C2E466F6E742E
        426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D6506024D4C094576656E744E616D6506074F6E
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
        6772616D54797065070B747450726F63656475726506536F7572636506B37072
        6F6365647572652046696E6973684E6272734F6E5072696E743B0D0A62656769
        6E0D0A0D0A202046696E6973684E6272732E466F6E742E426F6C64203A3D2046
        616C73653B0D0A0D0A0D0A2020696620706C5072657644617948485B2746696E
        697368506F73275D203D2031207468656E20626567696E0D0A20202020202020
        46696E6973684E6272732E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A46696E6973684E627273094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061554726966656374615061796F75744F6E5072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C60
        01000070726F6365647572652054726966656374615061796F75744F6E507269
        6E743B0D0A626567696E0D0A0D0A2054726966656374615061796F75742E466F
        6E742E426F6C64203A3D2046616C73653B0D0A20696620706C50726576446179
        52485B27497354726966656374614D617463686564275D203D20547275652074
        68656E20626567696E0D0A2020202054726966656374615061796F75742E466F
        6E742E426F6C64203A3D20547275653B0D0A20656E643B0D0A2020696620706C
        5072657644617952485B27497354726952616365275D203D2054727565207468
        656E20626567696E202020200D0A20202020202054726966656374615061796F
        75742E56697369626C65203A3D20547275653B0D0A202020656E6420656C7365
        20626567696E0D0A20202020202054726966656374615061796F75742E566973
        69626C65203A3D2046616C73653B0D0A202020656E643B0D0A0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060E54726966656374615061796F75
        74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061551
        75696E656C6C615061796F75744F6E5072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C6601000070726F63656475
        7265205175696E656C6C615061796F75744F6E5072696E743B0D0A626567696E
        0D0A0D0A20205175696E656C6C615061796F75742E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749735175
        696E656C6C614D617463686564275D203D2054727565207468656E2062656769
        6E0D0A20202020205175696E656C6C615061796F75742E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E643B0D0A20202020696620706C50726576
        44617952485B27497351756952616365275D203D2054727565207468656E2062
        6567696E202020200D0A2020202020205175696E656C6C615061796F75742E56
        697369626C65203A3D20547275653B0D0A202020656E6420656C736520626567
        696E0D0A2020202020205175696E656C6C615061796F75742E56697369626C65
        203A3D2046616C73653B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060E5175696E656C6C615061796F7574094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D6506175375706572
        66656374615061796F75744F6E5072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C7401000070726F636564757265
        20537570657266656374615061796F75744F6E5072696E743B0D0A626567696E
        0D0A0D0A2020537570657266656374615061796F75742E466F6E742E426F6C64
        203A3D2046616C73653B0D0A2020696620706C5072657644617952485B274973
        537570657266656374614D617463686564275D203D2054727565207468656E20
        626567696E0D0A2020202020537570657266656374615061796F75742E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20202020696620
        706C5072657644617952485B274973537570657252616365275D203D20547275
        65207468656E20626567696E202020200D0A2020202020205375706572666563
        74615061796F75742E56697369626C65203A3D20547275653B0D0A202020656E
        6420656C736520626567696E0D0A202020202020537570657266656374615061
        796F75742E56697369626C65203A3D2046616C73653B0D0A202020656E643B0D
        0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506105375706572
        66656374615061796F7574094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506125069636B345061796F75744F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C5D010000
        70726F636564757265205069636B345061796F75744F6E5072696E743B0D0A62
        6567696E0D0A0D0A20205069636B345061796F75742E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A2020696620706C5072657644617952485B27497350
        69636B344D617463686564466972737452616365275D203D2054727565207468
        656E20626567696E0D0A20202020205069636B345061796F75742E466F6E742E
        426F6C64203A3D20547275653B0D0A2020656E643B0D0A20202020696620706C
        5072657644617952485B274973506B3452616365275D203D2054727565207468
        656E20626567696E202020200D0A2020202020205069636B345061796F75742E
        56697369626C65203A3D20547275653B0D0A202020656E6420656C7365206265
        67696E0D0A2020202020205069636B345061796F75742E56697369626C65203A
        3D2046616C73653B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060B5069636B345061796F7574094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D6506214461696C79446F75626C
        655061796F75744669727374526163654F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650CB301000070726F63
        6564757265204461696C79446F75626C655061796F7574466972737452616365
        4F6E5072696E743B0D0A626567696E0D0A0D0A2020204461696C79446F75626C
        655061796F75744669727374526163652E466F6E742E426F6C64203A3D204661
        6C73653B0D0A202020696620706C5072657644617952485B2749734461696C79
        446F75626C654D617463686564466972737452616365275D203D205472756520
        7468656E20626567696E0D0A2020202020204461696C79446F75626C65506179
        6F75744669727374526163652E466F6E742E426F6C64203A3D20547275653B0D
        0A202020656E643B0D0A202020696620706C5072657644617952485B27497344
        4452616365275D203D2054727565207468656E20626567696E202020200D0A20
        20202020204461696C79446F75626C655061796F75744669727374526163652E
        56697369626C65203A3D20547275653B0D0A202020656E6420656C7365206265
        67696E0D0A2020202020204461696C79446F75626C655061796F757446697273
        74526163652E56697369626C65203A3D2046616C73653B0D0A202020656E643B
        0D0A20202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061A44
        61696C79446F75626C655061796F7574466972737452616365094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65061153686565744F726465
        724F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F7572636506EB70726F6365647572652053686565744F726465724F6E
        5072696E743B0D0A626567696E0D0A0D0A202053686565744F726465722E466F
        6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A202069662070
        6C5072657644617948485B2746696E697368506F73275D203D2031207468656E
        20626567696E0D0A202020202053686565744F726465722E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202053686565744F726465722E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060A53686565744F72646572094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65061057696E5061796F75744F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506E970
        726F6365647572652057696E5061796F75744F6E5072696E743B0D0A62656769
        6E0D0A0D0A20202057696E5061796F75742E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020200D0A202020696620706C5072657644617948485B
        2746696E697368506F73275D203D2031207468656E20626567696E0D0A202020
        202057696E5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E6420656C736520626567696E0D0A202020202057696E5061796F7574
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060957696E5061796F75
        74094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061150
        69636B3457616765724F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C5401000070726F6365647572652050
        69636B3457616765724F6E5072696E743B0D0A626567696E0D0A0D0A20205069
        636B3457616765722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        696620706C5072657644617952485B2749735069636B344D6174636865644669
        72737452616365275D203D2054727565207468656E20626567696E0D0A202020
        20205069636B3457616765722E466F6E742E426F6C64203A3D20547275653B0D
        0A2020656E643B0D0A20200D0A2020696620706C5072657644617952485B2749
        73506B3452616365275D203D2054727565207468656E20626567696E20202020
        0D0A20202020205069636B3457616765722E56697369626C65203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A20202020205069636B34
        57616765722E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A5069636B345761
        676572094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        115069636B3357616765724F6E5072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C5601000070726F636564757265
        205069636B3357616765724F6E5072696E743B0D0A626567696E0D0A0D0A2020
        5069636B3357616765722E466F6E742E426F6C64203A3D2046616C73653B0D0A
        2020696620706C5072657644617952485B2749735069636B334D617463686564
        466972737452616365275D203D2054727565207468656E20626567696E0D0A20
        202020205069636B3357616765722E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E643B0D0A20200D0A2020696620706C5072657644617952485B
        274973506B3352616365275D203D2054727565207468656E20626567696E2020
        20200D0A20202020205069636B3357616765722E56697369626C65203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A2020202020506963
        6B3357616765722E56697369626C65203A3D2046616C73653B0D0A2020656E64
        3B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A506963
        6B335761676572094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D6506174461696C79446F75626C6557616765724F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C770100
        0070726F636564757265204461696C79446F75626C6557616765724F6E507269
        6E743B0D0A626567696E0D0A0D0A20204461696C79446F75626C655761676572
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C507265
        7644617952485B2749734461696C79446F75626C654D61746368656446697273
        7452616365275D203D2054727565207468656E20626567696E0D0A2020202020
        4461696C79446F75626C6557616765722E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E643B0D0A20200D0A2020696620706C5072657644617952
        485B274973444452616365275D203D2054727565207468656E20626567696E20
        2020200D0A20202020204461696C79446F75626C6557616765722E5669736962
        6C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20
        202020204461696C79446F75626C6557616765722E56697369626C65203A3D20
        46616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506104461696C79446F75626C655761676572094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D6506145175696E656C6C615761
        6765724F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C5D01000070726F636564757265205175696E656C6C
        6157616765724F6E5072696E743B0D0A626567696E0D0A0D0A20205175696E65
        6C6C6157616765722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        696620706C5072657644617952485B2749735175696E656C6C614D6174636865
        64275D203D2054727565207468656E20626567696E0D0A20202020205175696E
        656C6C6157616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E643B0D0A200D0A2020696620706C5072657644617952485B274973517569
        52616365275D203D2054727565207468656E20626567696E202020200D0A2020
        2020205175696E656C6C6157616765722E56697369626C65203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A20202020205175696E656C
        6C6157616765722E56697369626C65203A3D2046616C73653B0D0A2020656E64
        3B0D0A200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E
        656C6C615761676572094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061245786163746157616765724F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C580100007072
        6F6365647572652045786163746157616765724F6E5072696E743B0D0A626567
        696E0D0A20200D0A202045786163746157616765722E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A2020696620706C5072657644617952485B27497345
        78616374614D617463686564275D203D2054727565207468656E20626567696E
        0D0A20202020202045786163746157616765722E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A20200D0A2020696620706C5072657644
        617952485B27497345786152616365275D203D2054727565207468656E206265
        67696E202020200D0A202020202045786163746157616765722E56697369626C
        65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202045786163746157616765722E56697369626C65203A3D2046616C73653B
        0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060B4578616374615761676572094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D650614547269666563746157616765724F6E5072
        696E740B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650C5D01000070726F63656475726520547269666563746157616765724F
        6E5072696E743B0D0A626567696E0D0A0D0A2020547269666563746157616765
        722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C5072
        657644617952485B27497354726966656374614D617463686564275D203D2054
        727565207468656E20626567696E0D0A20202020205472696665637461576167
        65722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20
        20696620706C5072657644617952485B27497354726952616365275D203D2054
        727565207468656E20626567696E202020200D0A202020202054726966656374
        6157616765722E56697369626C65203A3D20547275653B0D0A2020656E642065
        6C736520626567696E0D0A2020202020547269666563746157616765722E5669
        7369626C65203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060D5472696665637461576167
        6572094576656E744E616D6506074F6E5072696E74074576656E744944022000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650616
        5375706572666563746157616765724F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C6B01000070726F6365
        64757265205375706572666563746157616765724F6E5072696E743B0D0A6265
        67696E0D0A0D0A20205375706572666563746157616765722E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B27
        4973537570657266656374614D617463686564275D203D205472756520746865
        6E20626567696E0D0A20202020205375706572666563746157616765722E466F
        6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A2020
        696620706C5072657644617952485B274973537570657252616365275D203D20
        54727565207468656E20626567696E202020200D0A2020202020537570657266
        6563746157616765722E56697369626C65203A3D20547275653B0D0A2020656E
        6420656C736520626567696E0D0A202020202053757065726665637461576167
        65722E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060F53757065726665637461
        5761676572094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        6506134578616374615061796F75744F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C5801000070726F6365
        64757265204578616374615061796F75744F6E5072696E743B0D0A626567696E
        0D0A0D0A20204578616374615061796F75742E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020696620706C5072657644617952485B27497345786163
        74614D617463686564275D203D2054727565207468656E20626567696E0D0A20
        202020204578616374615061796F75742E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E643B0D0A2020696620706C5072657644617952485B2749
        7345786152616365275D203D2054727565207468656E20626567696E20202020
        0D0A2020202020204578616374615061796F75742E56697369626C65203A3D20
        547275653B0D0A202020656E6420656C736520626567696E0D0A202020202020
        4578616374615061796F75742E56697369626C65203A3D2046616C73653B0D0A
        202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060C4578616374615061796F7574094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060D7657696E5063744F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F757263650C3601000070
        726F636564757265207657696E5063744F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A6957696E5063743A696E74656765
        723B0D0A6657696E5063743A646F75626C653B0D0A626567696E202020202020
        20200D0A0D0A2020206957696E5063743A3D20303B0D0A2020206657696E5063
        743A3D20303B0D0A2020202020202020202020202020200D0A20202069662028
        765374617274732E4173496E7465676572203E203029207468656E2062656769
        6E0D0A2020202020206657696E506374203A3D20287657696E732E4173496E74
        6567657220202F20765374617274732E4173496E746567657229202A20313030
        3B0D0A202020656E643B2020200D0A2020200D0A20202056616C7565203A3D20
        6657696E5063743B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506077657696E506374094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506117657696E576167657265644F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F757263650C4701000070
        726F636564757265207657696E576167657265644F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A7661720D0A665374617274733A646F
        75626C653B0D0A6657696E576167657265643A646F75626C653B0D0A0D0A6265
        67696E0D0A2020206657696E576167657265643A3D303B0D0A20202066537461
        727473203A3D20303B0D0A2020200D0A20202066537461727473203A3D207653
        74617274732E4173496E74656765723B20202020202020202020202020200D0A
        2020202020200D0A2020206966202866537461727473203E203029207468656E
        20626567696E0D0A2020202020206657696E57616765726564203A3D20286653
        7461727473202A20322E3030293B0D0A202020656E643B2020200D0A2020200D
        0A20202056616C7565203A3D206657696E576167657265643B0D0A2020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060B7657696E576167657265
        64094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D7657
        696E576F6E4F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650CD601000070726F636564757265207657696E576F
        6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661
        720D0A6657696E733A20646F75626C653B0D0A66546F74616C4F6464733A2064
        6F75626C653B0D0A66576167657265643A646F75626C653B0D0A66546F74616C
        576F6E3A646F75626C653B0D0A0D0A626567696E0D0A0D0A20202066546F7461
        6C576F6E203A3D20303B0D0A2020206657616765726564203A3D20303B0D0A20
        20206657696E733A3D303B0D0A20202066546F74616C4F6464733A3D303B0D0A
        0D0A2020200D0A2020206657696E73203A3D207657696E732E4173496E746567
        65723B20202020202020202020202020200D0A20202066546F74616C4F646473
        203A3D2076546F74616C4F6464732E4173446F75626C653B0D0A2020200D0A20
        2020696620286657696E73203E203029207468656E20626567696E0D0A202020
        2020206657616765726564203A3D206657696E73202A20322E30303B0D0A2020
        2020202066546F74616C576F6E203A3D202866546F74616C4F646473202A2032
        2E303029202B2066576167657265643B0D0A202020656E643B2020200D0A2020
        200D0A20202056616C7565203A3D2066546F74616C576F6E3B0D0A2020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D6506077657696E576F6E094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060C7657696E504C
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F757263650C6D01000070726F636564757265207657696E504C4F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A7661720D0A66546F
        74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A646F
        75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D0A
        0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C576167
        657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A202020
        66546F74616C576F6E203A3D207657696E576F6E2E4173446F75626C653B2020
        2020202020202020202020200D0A20202066546F74616C57616765726564203A
        3D207657696E576167657265642E4173446F75626C653B202020202020202020
        20202020200D0A20202066546F74616C504C203A3D2066546F74616C576F6E20
        2D2066546F74616C576167657265643B20200D0A2020200D0A20202056616C75
        65203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506067657696E504C094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060B7653686F734F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F75726365068E70726F6365647572
        65207653686F734F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A2020696620706C5072657644617948485B2746
        696E697368506F73275D203D2033207468656E20626567696E0D0A2020202056
        616C7565203A3D2056616C7565202B20313B0D0A2020656E643B0D0A20200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D6506057653686F73094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506117645786157616765
        7265644F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650C6D01000070726F636564757265207645786157616765
        7265644F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A0D0A2020696620706C5072657644617952485B274973457861
        52616365275D203D2054727565207468656E20626567696E0D0A202020202069
        6620706C5072657644617948485B2746696E697368506F73275D203E20302074
        68656E20626567696E0D0A2020202020202020696620706C5072657644617948
        485B274F646473275D203E2030207468656E20626567696E0D0A202020202020
        202020202069662028706C5072657644617952485B274578616374615061796F
        7574275D203E2030297468656E20626567696E0D0A2020202020202020202020
        20202056616C756520203A3D202056616C7565202B20322E30303B0D0A202020
        2020202020202020656E643B0D0A2020202020202020656E643B0D0A20202020
        20656E643B0D0A2020656E643B0D0A202020200D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060B7645786157616765726564094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65061176547269576167657265644F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        757263650C2601000070726F6365647572652076547269576167657265644F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A626567696E
        0D0A0D0A2020696620706C5072657644617948485B2746696E697368506F7327
        5D203E2030207468656E20626567696E0D0A2020202020696620706C50726576
        44617948485B274F646473275D203E2030207468656E20626567696E0D0A2020
        2020202069662028706C5072657644617952485B275472696665637461506179
        6F7574275D203E2030297468656E20626567696E0D0A20202020202020202020
        20202056616C756520203A3D202056616C7565202B20322E30303B0D0A202020
        2020202020656E643B20202020200D0A2020202020656E643B0D0A2020656E64
        3B0D0A202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B76
        54726957616765726564094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061176517569576167657265644F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C7001000070726F
        6365647572652076517569576167657265644F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C50
        72657644617952485B27497351756952616365275D203D205472756520746865
        6E20626567696E0D0A2020202020696620706C5072657644617948485B274669
        6E697368506F73275D203E2030207468656E20626567696E0D0A202020202020
        2020696620706C5072657644617948485B274F646473275D203E203020746865
        6E20626567696E0D0A202020202020202020202069662028706C507265764461
        7952485B275175696E656C6C615061796F7574275D203E2030297468656E2062
        6567696E0D0A2020202020202020202020202056616C756520203A3D20205661
        6C7565202B20322E30303B0D0A2020202020202020202020656E643B0D0A2020
        202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B202020
        0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B765175
        6957616765726564094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65061176536663576167657265644F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C7201000070726F6365
        647572652076536663576167657265644F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C507265
        7644617952485B274973537570657252616365275D203D205472756520746865
        6E20626567696E0D0A2020202020696620706C5072657644617948485B274669
        6E697368506F73275D203E2030207468656E20626567696E0D0A202020202020
        2020696620706C5072657644617948485B274F646473275D203E203020746865
        6E20626567696E0D0A202020202020202020202069662028706C507265764461
        7952485B27537570657266656374615061796F7574275D203E2030297468656E
        20626567696E0D0A2020202020202020202020202056616C756520203A3D2020
        56616C7565202B20322E30303B0D0A092020202020656E643B20202020200D0A
        2020202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B20
        200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B765366
        6357616765726564094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65061176506C63576167657265644F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C4E01000070726F6365
        647572652076506C63576167657265644F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A665374617274733A646F75626C65
        3B0D0A66546F74616C576167657265643A646F75626C653B0D0A0D0A62656769
        6E0D0A0D0A2020665374617274733A3D303B0D0A202066546F74616C57616765
        7265643A3D303B0D0A20200D0A20202066537461727473203A3D207653746172
        74732E4173496E74656765723B20202020202020202020202020200D0A202020
        2020200D0A2020206966202866537461727473203E203029207468656E206265
        67696E0D0A20202020202066546F74616C57616765726564203A3D2028665374
        61727473202A20322E3030293B0D0A202020656E643B2020200D0A2020200D0A
        20202056616C7565203A3D2066546F74616C576167657265643B0D0A2020200D
        0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060B76506C63576167
        65726564094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0D76506C63576F6E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650CA001000070726F6365647572652076506C
        63576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A7661720D0A66506C635061796F75743A646F75626C653B0D0A0D0A62656769
        6E0D0A0D0A20202066506C635061796F75743A3D303B0D0A2020200D0A202020
        6966202828706C5072657644617948485B2746696E697368506F73275D203D20
        312929207468656E20626567696E0D0A20202020202066506C635061796F7574
        203A3D20706C5072657644617952485B2757696E506C635061796F7574275D3B
        0D0A20202020202056616C7565203A3D2056616C7565202B2066506C63506179
        6F75743B0D0A202020656E643B0D0A2020200D0A2020206966202828706C5072
        657644617948485B2746696E697368506F73275D203D20322929207468656E20
        626567696E0D0A20202020202066506C635061796F7574203A3D20706C507265
        7644617952485B27506C635061796F7574275D3B0D0A20202020202056616C75
        65203A3D2056616C7565202B2066506C635061796F75743B0D0A202020656E64
        3B0D0A2020200D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060776506C63576F6E094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060C76506C63504C4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C6D01000070726F6365647572
        652076506C63504C4F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F
        74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F75
        626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D
        0A20202066546F74616C576167657265643A3D303B0D0A20202066546F74616C
        504C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D2076506C63576F
        6E2E4173446F75626C653B20202020202020202020202020200D0A2020206654
        6F74616C57616765726564203A3D2076506C63576167657265642E4173446F75
        626C653B20202020202020202020202020200D0A20202066546F74616C504C20
        3A3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D
        0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060676506C63504C094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060C76536663504C4F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        757263650C7001000070726F6365647572652076536663504C4F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A7661720D0A66546F7461
        6C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A646F7562
        6C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A
        20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C5761676572
        65643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A2020200D0A2020
        2066546F74616C576F6E203A3D2076536663576F6E2E4173446F75626C653B20
        202020202020202020202020200D0A20202066546F74616C5761676572656420
        3A3D2076536663576167657265642E4173446F75626C653B2020202020202020
        2020202020200D0A20202066546F74616C504C203A3D2066546F74616C576F6E
        202D2066546F74616C576167657265643B20200D0A2020200D0A20202056616C
        7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060676536663504C094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060C76547269504C4F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C7001000070726F
        6365647572652076547269504C4F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B
        0D0A66546F74616C576167657265643A646F75626C653B0D0A66546F74616C50
        4C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E
        3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A20202066
        546F74616C504C3A3D303B0D0A2020200D0A20202066546F74616C576F6E203A
        3D2076547269576F6E2E4173446F75626C653B20202020202020202020202020
        200D0A20202066546F74616C57616765726564203A3D20765472695761676572
        65642E4173446F75626C653B20202020202020202020202020200D0A20202066
        546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C576167
        657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F74616C
        504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650606765472
        69504C094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C
        76457861504C4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C7201000070726F636564757265207645786150
        4C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661
        720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C57616765
        7265643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A62
        6567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F
        74616C576167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D
        0A2020200D0A20202066546F74616C576F6E203A3D2076457861576F6E2E4173
        446F75626C653B20202020202020202020202020200D0A20202066546F74616C
        57616765726564203A3D2076457861576167657265642E4173446F75626C653B
        20202020202020202020202020200D0A20202066546F74616C504C203A3D2066
        546F74616C576F6E202D2066546F74616C576167657265643B20200D0A202020
        0D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D
        0A0D0A0D436F6D706F6E656E744E616D65060676457861504C094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060C76517569504C4F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C7001000070726F6365647572652076517569504C4F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A7661720D0A66546F74616C57
        6F6E3A646F75626C653B0D0A66546F74616C576167657265643A646F75626C65
        3B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A2020
        2066546F74616C576F6E3A3D303B0D0A20202066546F74616C57616765726564
        3A3D303B0D0A20202066546F74616C504C3A3D303B0D0A2020200D0A20202066
        546F74616C576F6E203A3D2076517569576F6E2E4173446F75626C653B202020
        20202020202020202020200D0A20202066546F74616C57616765726564203A3D
        2076517569576167657265642E4173446F75626C653B20202020202020202020
        202020200D0A20202066546F74616C504C203A3D2066546F74616C576F6E202D
        2066546F74616C576167657265643B20200D0A2020200D0A20202056616C7565
        203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060676517569504C094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060D76457861576F6E4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C9C01000070726F63
        65647572652076457861576F6E4F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A0D0A2020696620706C507265764461
        7952485B27497345786152616365275D203D2054727565207468656E20626567
        696E0D0A2020202020696620706C5072657644617952485B2749734578616374
        614D617463686564275D203D2054727565207468656E20626567696E0D0A2020
        20202020202069662028706C5072657644617952485B27457861637461576167
        6572275D203D203129207468656E20626567696E0D0A20202020202020202020
        56616C7565203A3D202056616C7565202B202028706C5072657644617952485B
        274578616374615061796F7574275D202A2032293B0D0A202020202020202065
        6E6420656C736520626567696E0D0A2020202020202020202056616C7565203A
        3D202056616C7565202B2020706C5072657644617952485B2745786163746150
        61796F7574275D3B0D0A2020202020202020656E643B0D0A2020202020656E64
        3B20200D0A2020656E643B200D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060776457861576F6E094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060B764444504C4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C7101000070726F63
        656475726520764444504C4F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A
        66546F74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A
        646F75626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D
        303B0D0A20202066546F74616C576167657265643A3D303B0D0A20202066546F
        74616C504C3A3D303B0D0A2020200D0A20202066546F74616C576F6E203A3D20
        764444576F6E2E4173446F75626C653B20202020202020202020202020200D0A
        20202066546F74616C57616765726564203A3D20764444576167657265642E41
        73446F75626C653B20202020202020202020202020200D0A20202066546F7461
        6C504C203A3D2066546F74616C576F6E202D2066546F74616C57616765726564
        3B20200D0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D
        0A0D0A656E643B0D0A0D0A0D0A0D436F6D706F6E656E744E616D650605764444
        504C094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C76
        4444576F6E4F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650CE101000070726F63656475726520764444576F6E
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A2020696620706C5072657644617952485B274973444452616365
        275D203D2054727565207468656E20626567696E202020202020202020202020
        20200D0A2020202020696620706C5072657644617952485B2749734461696C79
        446F75626C654D617463686564466972737452616365275D203D205472756520
        7468656E20626567696E0D0A202020202020202069662028706C507265764461
        7952485B274461696C79446F75626C655761676572466972737452616365275D
        203D203129207468656E20626567696E0D0A202020202020202020202056616C
        756520203A3D202056616C7565202B202028706C5072657644617952485B2744
        61696C79446F75626C655061796F7574466972737452616365275D202A203229
        3B0D0A2020202020202020656E6420656C736520626567696E0D0A2020202020
        20202020202056616C756520203A3D202056616C7565202B2020706C50726576
        44617952485B274461696C79446F75626C655061796F75744669727374526163
        65275D3B0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A20
        20656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        06764444576F6E094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D650610764444576167657265644F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C8601000070726F63656475
        726520764444576167657265644F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A626567696E0D0A0D0A2020696620706C507265764461
        7952485B274973444452616365275D203D2054727565207468656E2062656769
        6E20202020202020202020202020200D0A2020202020696620706C5072657644
        617948485B2746696E697368506F73275D203E2030207468656E20626567696E
        0D0A2020202020202020696620706C5072657644617948485B274F646473275D
        203E2030207468656E20626567696E0D0A202020202020202020202069662028
        706C5072657644617952485B274461696C79446F75626C655061796F75744669
        72737452616365275D203E2030297468656E20626567696E0D0A202020202020
        2020202020202056616C756520203A3D202056616C7565202B20322E30303B0D
        0A2020202020202020202020656E643B0D0A2020202020202020656E643B0D0A
        2020202020656E643B0D0A2020656E643B20200D0A20200D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060A76444457616765726564094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060D76517569576F6E4F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        72636506FD70726F6365647572652076517569576F6E4F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20206966
        20706C5072657644617952485B27497351756952616365275D203D2054727565
        207468656E20626567696E0D0A2020202020696620706C507265764461795248
        5B2749735175696E656C6C614D617463686564275D203D205472756520746865
        6E20626567696E0D0A202020202020202056616C756520203A3D202056616C75
        65202B2020706C5072657644617952485B275175696E656C6C615061796F7574
        275D3B0D0A2020202020656E643B0D0A2020656E643B0D0A20200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060776517569576F6E094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060D76547269576F6E4F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650CA501000070726F6365647572652076547269576F6E4F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20
        20696620706C5072657644617952485B27497354726952616365275D203D2054
        727565207468656E20626567696E0D0A2020202020696620706C507265764461
        7952485B27497354726966656374614D617463686564275D203D205472756520
        7468656E20626567696E0D0A202020202020202069662028706C507265764461
        7952485B2754726966656374615761676572275D203D203129207468656E2062
        6567696E0D0A202020202020202020202056616C756520203A3D202056616C75
        65202B202028706C5072657644617952485B2754726966656374615061796F75
        74275D202A2032293B0D0A2020202020202020656E6420656C73652062656769
        6E0D0A202020202020202020202056616C756520203A3D202056616C7565202B
        2020706C5072657644617952485B2754726966656374615061796F7574275D3B
        0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A2020656E64
        3B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D650607765472
        69576F6E094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0D76536663576F6E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650CAF01000070726F63656475726520765366
        63576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A2020696620706C5072657644617952485B2749735375
        70657252616365275D203D2054727565207468656E20626567696E0D0A202020
        2020696620706C5072657644617952485B274973537570657266656374614D61
        7463686564275D203D2054727565207468656E20626567696E0D0A2020202020
        20202069662028706C5072657644617952485B27537570657266656374615761
        676572275D203D203129207468656E20626567696E0D0A202020202020202020
        202056616C756520203A3D202056616C7565202B202028706C50726576446179
        52485B27537570657266656374615061796F7574275D202A2032293B0D0A2020
        202020202020656E6420656C736520626567696E0D0A20202020202020202020
        2056616C756520203A3D202056616C7565202B2020706C507265764461795248
        5B27537570657266656374615061796F7574275D3B0D0A202020202020202065
        6E643B0D0A2020202020656E643B0D0A2020656E643B0D0A20200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060776536663576F6E094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D6506117653686F576167657265
        644F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C4D01000070726F636564757265207653686F576167657265
        644F6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661
        720D0A665374617274733A646F75626C653B0D0A66546F74616C576167657265
        643A646F75626C653B0D0A0D0A626567696E0D0A0D0A20202066537461727473
        3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A0D0A2020
        2066537461727473203A3D20765374617274732E4173496E74656765723B2020
        2020202020202020202020200D0A2020202020200D0A20202069662028665374
        61727473203E203029207468656E20626567696E0D0A20202020202066546F74
        616C57616765726564203A3D202866537461727473202A20322E3030293B0D0A
        202020656E643B2020200D0A2020200D0A20202056616C7565203A3D2066546F
        74616C576167657265643B0D0A0D0A656E643B0D0A0D0A0D0A0D436F6D706F6E
        656E744E616D65060B7653686F57616765726564094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060D7653686F576F6E4F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C18
        02000070726F636564757265207653686F576F6E4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A7661720D0A6653686F5061796F7574
        3A646F75626C653B0D0A0D0A626567696E0D0A2020206966202828706C507265
        7644617948485B2746696E697368506F73275D203D20312929207468656E2062
        6567696E0D0A2020202020206653686F5061796F7574203A3D20706C50726576
        44617952485B2757696E53686F5061796F7574275D3B0D0A2020202020205661
        6C7565203A3D2056616C7565202B206653686F5061796F75743B0D0A20202065
        6E643B0D0A2020200D0A2020206966202828706C5072657644617948485B2746
        696E697368506F73275D203D20322929207468656E20626567696E0D0A202020
        2020206653686F5061796F7574203A3D20706C5072657644617952485B27506C
        6353686F5061796F7574275D3B0D0A20202020202056616C7565203A3D205661
        6C7565202B206653686F5061796F75743B0D0A202020656E643B0D0A2020200D
        0A2020206966202828706C5072657644617948485B2746696E697368506F7327
        5D203D20332929207468656E20626567696E0D0A2020202020206653686F5061
        796F7574203A3D20706C5072657644617952485B2753686F5061796F7574275D
        3B0D0A20202020202056616C7565203A3D2056616C7565202B206653686F5061
        796F75743B0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D6506077653686F576F6E094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060C7653686F504C4F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C70010000
        70726F636564757265207653686F504C4F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F7562
        6C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A66546F74
        616C504C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F74616C
        576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A20
        202066546F74616C504C3A3D303B0D0A2020200D0A20202066546F74616C576F
        6E203A3D207653686F576F6E2E4173446F75626C653B20202020202020202020
        202020200D0A20202066546F74616C57616765726564203A3D207653686F5761
        67657265642E4173446F75626C653B20202020202020202020202020200D0A20
        202066546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C
        576167657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F
        74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650606
        7653686F504C094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061176506B33576167657265644F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C6C01000070726F63656475
        72652076506B33576167657265644F6E43616C63287661722056616C75653A20
        56617269616E74293B0D0A626567696E0D0A0D0A202020696620706C50726576
        44617952485B274973506B3352616365275D203D2054727565207468656E2062
        6567696E202020200D0A2020202020696620706C5072657644617948485B2746
        696E697368506F73275D203E2030207468656E20626567696E0D0A2020202020
        2020696620706C5072657644617948485B274F646473275D203E203020746865
        6E20626567696E0D0A20202020202020202069662028706C5072657644617952
        485B275069636B335061796F7574466972737452616365275D203E2030297468
        656E20626567696E0D0A2020202020202020202020202056616C756520203A3D
        202056616C7565202B20322E30303B0D0A09202020656E643B20202020200D0A
        09656E643B0D0A20202020656E643B0D0A2020656E643B20200D0A20200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060B76506B3357616765726564
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65061176506B
        34576167657265644F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C7101000070726F6365647572652076506B
        34576167657265644F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A2020696620706C5072657644617952485B27
        4973506B3452616365275D203D2054727565207468656E20626567696E200D0A
        2020202020696620706C5072657644617948485B2746696E697368506F73275D
        203E2030207468656E20626567696E0D0A2020202020202020696620706C5072
        657644617948485B274F646473275D203E2030207468656E20626567696E0D0A
        202020202020202020202069662028706C5072657644617952485B275069636B
        345061796F7574466972737452616365275D203E2030297468656E2062656769
        6E0D0A202020202020202020202020202056616C756520203A3D202056616C75
        65202B20322E30303B0D0A092020202020656E643B20202020200D0A09202065
        6E643B0D0A2020202020656E643B0D0A2020656E643B20200D0A20200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060B76506B345761676572656409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060D76506B34
        576F6E4F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650CBD01000070726F6365647572652076506B34576F6E4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A0D0A2020696620706C5072657644617952485B274973506B3452616365
        275D203D2054727565207468656E20626567696E200D0A20202020696620706C
        5072657644617952485B2749735069636B344D61746368656446697273745261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020202020
        69662028706C5072657644617952485B275069636B3457616765724669727374
        52616365275D203D203129207468656E20626567696E0D0A2020202020202020
        20202056616C756520203A3D202056616C7565202B202028706C507265764461
        7952485B275069636B345061796F7574466972737452616365275D202A203229
        3B0D0A2020202020202020656E6420656C736520626567696E0D0A2020202020
        20202020202056616C756520203A3D202056616C7565202B2020706C50726576
        44617952485B275069636B345061796F7574466972737452616365275D3B0D0A
        2020202020202020656E643B0D0A2020202020656E643B0D0A2020656E643B20
        200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776506B3457
        6F6E094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D76
        506B33576F6E4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F757263650CC001000070726F6365647572652076506B3357
        6F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A2020696620706C5072657644617952485B274973506B3352
        616365275D203D2054727565207468656E20626567696E202020200D0A202020
        2020696620706C5072657644617952485B2749735069636B334D617463686564
        466972737452616365275D203D2054727565207468656E20626567696E0D0A20
        2020202020202069662028706C5072657644617952485B275069636B33576167
        6572466972737452616365275D203D203129207468656E20626567696E0D0A20
        2020202020202020202056616C756520203A3D202056616C7565202B20202870
        6C5072657644617952485B275069636B335061796F7574466972737452616365
        275D202A2032293B0D0A2020202020202020656E6420656C736520626567696E
        0D0A2020202020202020202056616C756520203A3D202056616C7565202B2020
        706C5072657644617952485B275069636B335061796F75744669727374526163
        65275D3B0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A20
        20656E643B20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0776506B33576F6E094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060C76506B33504C4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C7201000070726F63656475726520
        76506B33504C4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F7461
        6C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F75626C
        653B0D0A626567696E0D0A20202066546F74616C576F6E3A3D303B0D0A202020
        66546F74616C576167657265643A3D303B0D0A20202066546F74616C504C3A3D
        303B0D0A2020200D0A20202066546F74616C576F6E203A3D2076506B33576F6E
        2E4173446F75626C653B20202020202020202020202020200D0A20202066546F
        74616C57616765726564203A3D2076506B33576167657265642E4173446F7562
        6C653B20202020202020202020202020200D0A20202066546F74616C504C203A
        3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D0A
        2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E
        643B0D0A0D0A0D0A0D436F6D706F6E656E744E616D65060676506B33504C0945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060C76506B3450
        4C4F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C7401000070726F6365647572652076506B34504C4F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A6654
        6F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A64
        6F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D
        0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C57616765
        7265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A2020200D0A20
        202066546F74616C576F6E203A3D2076506B34576F6E2E4173446F75626C653B
        20202020202020202020202020200D0A20202066546F74616C57616765726564
        203A3D2076506B34576167657265642E4173446F75626C653B20202020202020
        202020202020200D0A20202066546F74616C504C203A3D2066546F74616C576F
        6E202D2066546F74616C576167657265643B20200D0A2020200D0A2020205661
        6C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D0A0D0A0D0A
        0D436F6D706F6E656E744E616D65060676506B34504C094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D6506125069636B335061796F75744F6E
        5072696E740B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C5E01000070726F636564757265205069636B335061796F75744F
        6E5072696E743B0D0A626567696E0D0A20200D0A20205069636B335061796F75
        742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C5072
        657644617952485B2749735069636B334D617463686564466972737452616365
        275D203D2054727565207468656E20626567696E0D0A20202020205069636B33
        5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A202020696620706C5072657644617952485B274973506B335261636527
        5D203D2054727565207468656E20626567696E202020200D0A20202020202050
        69636B335061796F75742E56697369626C65203A3D20547275653B0D0A202020
        656E6420656C736520626567696E0D0A2020202020205069636B335061796F75
        742E56697369626C65203A3D2046616C73653B0D0A202020656E643B0D0A0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B5069636B33506179
        6F7574094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0E57696E4E6272734F6E5072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506DE70726F6365647572652057696E4E62
        72734F6E5072696E743B0D0A626567696E0D0A0D0A202057696E4E6272732E46
        6F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020206966
        20706C5072657644617948485B2746696E697368506F73275D203D2031207468
        656E20626567696E0D0A202020202057696E4E6272732E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        202057696E4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060757
        696E4E627273094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65061357696E506C635061796F75744F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506F470726F63656475
        72652057696E506C635061796F75744F6E5072696E743B0D0A626567696E0D0A
        0D0A202057696E506C635061796F75742E466F6E742E426F6C64203A3D204661
        6C73653B0D0A20202020200D0A202020696620706C5072657644617948485B27
        46696E697368506F73275D203D2031207468656E20626567696E0D0A20202020
        2057696E506C635061796F75742E466F6E742E426F6C64203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A202020202057696E506C6350
        61796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E64
        3B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C57696E
        506C635061796F7574094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061357696E53686F5061796F75744F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506F670726F63
        65647572652057696E53686F5061796F75744F6E5072696E743B0D0A62656769
        6E0D0A0D0A202057696E53686F5061796F75742E466F6E742E426F6C64203A3D
        2046616C73653B0D0A20202020200D0A202020696620706C5072657644617948
        485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A20
        2020202057696E53686F5061796F75742E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E53
        686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060C57696E53686F5061796F7574094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060E506C634E6272734F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506E370726F63
        656475726520506C634E6272734F6E5072696E743B0D0A626567696E0D0A0D0A
        202020506C634E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A
        20202020200D0A202020696620706C5072657644617948485B2746696E697368
        506F73275D203D2031207468656E20626567696E0D0A2020202020506C634E62
        72732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73
        6520626567696E0D0A2020202020506C634E6272732E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D650607506C634E627273094576656E744E616D65
        06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060E53686F4E6272734F6E507269
        6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
        636506DD70726F6365647572652053686F4E6272734F6E5072696E743B0D0A62
        6567696E0D0A20202053686F4E6272732E466F6E742E426F6C64203A3D204661
        6C73653B0D0A20202020200D0A202020696620706C5072657644617948485B27
        46696E697368506F73275D203D2031207468656E20626567696E0D0A20202020
        2053686F4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E6420656C736520626567696E0D0A202020202053686F4E6272732E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060753686F4E627273094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D650610506C635061796F75744F
        6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506E570726F63656475726520506C635061796F75744F6E507269
        6E743B0D0A626567696E0D0A202020506C635061796F75742E466F6E742E426F
        6C64203A3D2046616C73653B0D0A20202020200D0A202020696620706C507265
        7644617948485B2746696E697368506F73275D203D2031207468656E20626567
        696E0D0A2020202020506C635061796F75742E466F6E742E426F6C64203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A2020202020506C
        635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609506C63
        5061796F7574094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D650613506C6353686F5061796F75744F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506F370726F63656475
        726520506C6353686F5061796F75744F6E5072696E743B0D0A626567696E0D0A
        202020506C6353686F5061796F75742E466F6E742E426F6C64203A3D2046616C
        73653B0D0A20202020200D0A202020696620706C5072657644617948485B2746
        696E697368506F73275D203D2031207468656E20626567696E0D0A2020202020
        506C6353686F5061796F75742E466F6E742E426F6C64203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A2020202020506C6353686F5061
        796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B
        0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C506C6353
        686F5061796F7574094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65061053686F5061796F75744F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506E770726F6365647572
        652053686F5061796F75744F6E5072696E743B0D0A626567696E0D0A20202053
        686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        2020200D0A202020696620706C5072657644617948485B2746696E697368506F
        73275D203D2031207468656E20626567696E0D0A202020202053686F5061796F
        75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73
        6520626567696E0D0A202020202053686F5061796F75742E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060953686F5061796F7574094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65061076546F74616C4F646473
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506A670726F6365647572652076546F74616C4F6464734F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A
        0D0A2020696620706C5072657644617948485B2746696E697368506F73275D20
        3D2031207468656E20626567696E0D0A202020202056616C7565203A3D205661
        6C7565202B20706C5072657644617948485B274F646473275D3B0D0A2020656E
        643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A7654
        6F74616C4F646473094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060E764176674F6464734F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C9B01000070726F6365647572
        6520764176674F6464734F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A7661720D0A664176674F6464733A646F75626C653B0D0A6653
        74617274733A646F75626C653B0D0A6657696E733A646F75626C653B0D0A0D0A
        626567696E0D0A0D0A202020664176674F646473203A3D20303B0D0A20202066
        537461727473203A3D20303B0D0A2020206657696E73203A3D20303B0D0A2020
        20202020202020202020200D0A20202066537461727473203A3D207653746172
        74732E4173496E74656765723B20202020202020202020202020200D0A202020
        6657696E73203A3D207657696E732E4173496E74656765723B20202020202020
        202020202020200D0A2020202020200D0A202020696620286653746172747320
        3E203029207468656E20626567696E0D0A202020202020664176674F64647320
        3A3D202876546F74616C4F6464732E4173446F75626C65202F206657696E7329
        3B0D0A202020656E643B2020200D0A2020200D0A20202056616C7565203A3D20
        664176674F6464733B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        650608764176674F646473094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060C76575053504C4F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F75726365067F70726F63656475726520
        76575053504C4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A2056616C7565203A3D20207657696E504C2E4173446F
        75626C65202B2076506C63504C2E4173446F75626C65202B207653686F504C2E
        4173446F75626C653B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060676575053504C094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F76547269536663504C4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365067370726F63656475
        72652076547269536663504C4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A0D0A20202056616C7565203A3D20
        76547269504C2E4173446F75626C65202B2076536663504C2E4173446F75626C
        653B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060976547269
        536663504C094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F76457861517569504C4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365067570726F63656475726520764578
        61517569504C4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A0D0A20202056616C7565203A3D20207651756950
        4C2E4173446F75626C65202B2076457861504C2E4173446F75626C65203B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506097645786151756950
        4C094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E7644
        44506B33504C4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365067A70726F63656475726520764444506B33504C
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202020200D0A202056616C7565203A3D20764444504C2E417344
        6F75626C65202B2076506B33504C2E4173446F75626C653B0D0A0D0A0D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D650608764444506B33504C
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F76506B
        34506B36504C4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365066270726F6365647572652076506B34506B3650
        4C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A0D0A0D0A202056616C7565203A3D2076506B34504C2E4173446F75
        626C653B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
        76506B34506B36504C094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060944444F6E5072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C3301000070726F636564757265204444
        4F6E5072696E743B0D0A626567696E0D0A2044442E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749734461
        696C79446F75626C654D617463686564466972737452616365275D203D205472
        7565207468656E20626567696E0D0A202020202044442E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E643B0D0A0D0A0D0A202020696620706C50
        72657644617952485B274973444452616365275D203D2054727565207468656E
        20626567696E202020200D0A20202020202044442E56697369626C65203A3D20
        547275653B0D0A202020656E6420656C736520626567696E0D0A202020202020
        44442E56697369626C65203A3D2046616C73653B0D0A202020656E643B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D6506024444094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D6506164461696C79446F7562
        6C654E6272734F6E5072696E740B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C7B01000070726F636564757265204461696C
        79446F75626C654E6272734F6E5072696E743B0D0A626567696E0D0A4461696C
        79446F75626C654E6272732E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020696620706C5072657644617952485B2749734461696C79446F75626C65
        4D617463686564466972737452616365275D203D2054727565207468656E2062
        6567696E0D0A20202020204461696C79446F75626C654E6272732E466F6E742E
        426F6C64203A3D20547275653B0D0A2020656E643B0D0A202020200D0A202020
        200D0A202020696620706C5072657644617952485B274973444452616365275D
        203D2054727565207468656E20626567696E202020200D0A2020202020204461
        696C79446F75626C654E6272732E56697369626C65203A3D20547275653B0D0A
        202020656E6420656C736520626567696E0D0A2020202020204461696C79446F
        75626C654E6272732E56697369626C65203A3D2046616C73653B0D0A20202065
        6E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F446169
        6C79446F75626C654E627273094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060C5069636B334F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C3C01000070726F6365
        64757265205069636B334F6E5072696E743B0D0A626567696E0D0A5069636B33
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C507265
        7644617952485B2749735069636B334D61746368656446697273745261636527
        5D203D2054727565207468656E20626567696E0D0A20202020205069636B332E
        466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A
        202020696620706C5072657644617952485B274973506B3352616365275D203D
        2054727565207468656E20626567696E202020200D0A2020202020205069636B
        332E56697369626C65203A3D20547275653B0D0A202020656E6420656C736520
        626567696E0D0A2020202020205069636B332E56697369626C65203A3D204661
        6C73653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506055069636B33094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506105069636B334E6272734F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F757263650C5601000070
        726F636564757265205069636B334E6272734F6E5072696E743B0D0A62656769
        6E0D0A205069636B334E6272732E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020696620706C5072657644617952485B2749735069636B334D617463
        686564466972737452616365275D203D2054727565207468656E20626567696E
        0D0A20202020205069636B334E6272732E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E643B0D0A20200D0A202020696620706C50726576446179
        52485B274973506B3352616365275D203D2054727565207468656E2062656769
        6E202020200D0A2020202020205069636B334E6272732E56697369626C65203A
        3D20547275653B0D0A202020656E6420656C736520626567696E0D0A20202020
        20205069636B334E6272732E56697369626C65203A3D2046616C73653B0D0A20
        2020656E643B0D0A2020200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506095069636B334E627273094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061547726F757031416674657247726F757042726561
        6B0B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C0006000070726F6365647572652047726F757031416674657247726F7570
        427265616B3B0D0A626567696E0D0A0D0A202020765374617274732E4173496E
        7465676572203A3D20303B0D0A2020207657696E732E4173496E746567657220
        3A3D20303B0D0A20202076506C63732E4173496E7465676572203A3D20303B0D
        0A2020207653686F732E4173496E7465676572203A3D20303B0D0A2020200D0A
        202020764176674F6464732E4173446F75626C65203A3D20303B20200D0A2020
        2076546F74616C4F6464732E4173446F75626C65203A3D20303B20200D0A2020
        200D0A2020207657696E576167657265642E4173446F75626C65203A3D20303B
        0D0A2020207657696E504C2E4173446F75626C65203A3D20303B0D0A20202076
        57696E576F6E2E4173446F75626C65203A3D20303B0D0A2020207657696E504C
        5063742E4173446F75626C65203A3D20303B0D0A2020200D0A20202076506C63
        576167657265642E4173446F75626C65203A3D20303B0D0A20202076506C6350
        4C2E4173446F75626C65203A3D20303B0D0A20202076506C63576F6E2E417344
        6F75626C65203A3D20303B0D0A20202076506C63504C5063742E4173446F7562
        6C65203A3D20303B0D0A2020200D0A2020207653686F576167657265642E4173
        446F75626C65203A3D20303B0D0A2020207653686F504C2E4173446F75626C65
        203A3D20303B0D0A2020207653686F576F6E2E4173446F75626C65203A3D2030
        3B0D0A2020207653686F504C5063742E4173446F75626C65203A3D20303B0D0A
        0D0A202020764444576167657265642E4173446F75626C65203A3D20303B0D0A
        202020764444504C2E4173446F75626C65203A3D20303B0D0A20202076444457
        6F6E2E4173446F75626C65203A3D20303B0D0A202020764444504C5063742E41
        73446F75626C65203A3D20303B0D0A0D0A20202076536663576167657265642E
        4173446F75626C65203A3D20303B0D0A20202076536663504C2E4173446F7562
        6C65203A3D20303B0D0A20202076536663576F6E2E4173446F75626C65203A3D
        20303B0D0A20202076536663504C5063742E4173446F75626C65203A3D20303B
        0D0A0D0A20202076547269576167657265642E4173446F75626C65203A3D2030
        3B0D0A20202076547269504C2E4173446F75626C65203A3D20303B0D0A202020
        76547269576F6E2E4173446F75626C65203A3D20303B0D0A2020207654726950
        4C5063742E4173446F75626C65203A3D20303B0D0A0D0A20202076506B335761
        67657265642E4173446F75626C65203A3D20303B0D0A20202076506B33504C2E
        4173446F75626C65203A3D20303B0D0A20202076506B33576F6E2E4173446F75
        626C65203A3D20303B0D0A20202076506B33504C5063742E4173446F75626C65
        203A3D20303B0D0A0D0A20202076506B34576167657265642E4173446F75626C
        65203A3D20303B0D0A20202076506B34504C2E4173446F75626C65203A3D2030
        3B0D0A20202076506B34576F6E2E4173446F75626C65203A3D20303B0D0A2020
        2076506B34504C5063742E4173446F75626C65203A3D20303B0D0A0D0A202020
        76457861576167657265642E4173446F75626C65203A3D20303B0D0A20202076
        457861504C2E4173446F75626C65203A3D20303B0D0A20202076457861576F6E
        2E4173446F75626C65203A3D20303B0D0A20202076457861504C5063742E4173
        446F75626C65203A3D20303B0D0A2020202020200D0A20202076517569576167
        657265642E4173446F75626C65203A3D20303B0D0A20202076517569504C2E41
        73446F75626C65203A3D20303B0D0A20202076517569576F6E2E4173446F7562
        6C65203A3D20303B0D0A20202076517569504C5063742E4173446F75626C6520
        3A3D20303B0D0A0D0A20202076575053504C2E4173446F75626C65203A3D2030
        3B0D0A20202076547269536663504C2E4173446F75626C65203A3D20303B0D0A
        20202076457861517569504C2E4173446F75626C65203A3D20303B0D0A202020
        764444504B33504C2E4173446F75626C65203A3D20303B0D0A20202076506B34
        506B36504C2E4173446F75626C65203A3D20303B0D0A2020200D0A2020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060647726F75703109457665
        6E744E616D65060F416674657247726F7570427265616B074576656E74494402
        1B0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060C5069636B344F6E5072696E740B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C3C01000070726F63656475726520506963
        6B344F6E5072696E743B0D0A626567696E0D0A5069636B342E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B27
        49735069636B344D617463686564466972737452616365275D203D2054727565
        207468656E20626567696E0D0A20202020205069636B342E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E643B0D0A20200D0A20200D0A20696620
        706C5072657644617952485B274973506B3452616365275D203D205472756520
        7468656E20626567696E0D0A202020202020205069636B342E56697369626C65
        203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A202020
        202020205069636B342E56697369626C65203A3D2046616C73653B0D0A202065
        6E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060550
        69636B34094576656E744E616D6506074F6E5072696E74074576656E74494402
        200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        06105069636B344E6272734F6E5072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C4D01000070726F636564757265
        205069636B344E6272734F6E5072696E743B0D0A626567696E0D0A205069636B
        344E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620
        706C5072657644617952485B2749735069636B344D6174636865644669727374
        52616365275D203D2054727565207468656E20626567696E0D0A202020202050
        69636B344E6272732E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A20200D0A20696620706C5072657644617952485B274973506B3452
        616365275D203D2054727565207468656E20626567696E0D0A20202020202020
        5069636B344E6272732E56697369626C65203A3D20547275653B0D0A2020656E
        6420656C736520626567696E0D0A202020202020205069636B344E6272732E56
        697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D6506095069636B344E627273094576
        656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060F7657696E50
        4C5063744F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F75726365068470726F636564757265207657696E504C5063744F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A62656769
        6E0D0A0D0A202056616C7565203A3D20436F6D70757465504C50637420287657
        696E576F6E2E4173446F75626C652C7657696E576167657265642E4173446F75
        626C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609
        7657696E504C506374094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060F76506C63504C5063744F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F75726365068470726F636564757265
        2076506C63504C5063744F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20436F6D7075
        7465504C506374202876506C63576F6E2E4173446F75626C652C76506C635761
        67657265642E4173446F75626C65290D0A0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060976506C63504C506374094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060F7653686F504C5063744F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        068470726F636564757265207653686F504C5063744F6E43616C632876617220
        56616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C
        7565203A3D20436F6D70757465504C50637420287653686F576F6E2E4173446F
        75626C652C7653686F576167657265642E4173446F75626C65290D0A0D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D6506097653686F504C50637409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060F76536663
        504C5063744F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365068470726F6365647572652076536663504C506374
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202056616C7565203A3D20436F6D70757465504C506374202876
        536663576F6E2E4173446F75626C652C76536663576167657265642E4173446F
        75626C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0976536663504C506374094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060F76547269504C5063744F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F75726365068470726F6365647572
        652076547269504C5063744F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20436F6D70
        757465504C506374202876547269576F6E2E4173446F75626C652C7654726957
        6167657265642E4173446F75626C65290D0A0D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060976547269504C506374094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65060F76517569504C5063744F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        65068470726F6365647572652076517569504C5063744F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20205661
        6C7565203A3D20436F6D70757465504C506374202876517569576F6E2E417344
        6F75626C652C76517569576167657265642E4173446F75626C65290D0A0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060976517569504C506374
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F764578
        61504C5063744F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365068470726F6365647572652076457861504C5063
        744F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A0D0A202056616C7565203A3D20436F6D70757465504C5063742028
        76457861576F6E2E4173446F75626C652C76457861576167657265642E417344
        6F75626C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060976457861504C506374094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F76506B34504C5063744F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365068470726F63656475
        72652076506B34504C5063744F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D20436F6D
        70757465504C506374202876506B34576F6E2E4173446F75626C652C76506B34
        576167657265642E4173446F75626C65290D0A0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060976506B34504C506374094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060F76506B33504C5063744F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365068470726F6365647572652076506B33504C5063744F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056
        616C7565203A3D20436F6D70757465504C506374202876506B33576F6E2E4173
        446F75626C652C76506B33576167657265642E4173446F75626C65290D0A0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060976506B33504C5063
        74094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E7644
        44504C5063744F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365068170726F63656475726520764444504C506374
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202056616C7565203A3D20436F6D70757465504C506374202876
        4444576F6E2E4173446F75626C652C764444576167657265642E4173446F7562
        6C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060876
        4444504C506374094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060E76546F74616C504C4F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C2501000070726F636564757265
        2076546F74616C504C4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D207657696E504C
        2E4173446F75626C65202B2076506C63504C2E4173446F75626C65202B207653
        686F504C2E4173446F75626C65202B0D0A202020202020202020202076444450
        4C2E4173446F75626C65202B2076506B33504C2E4173446F75626C65202B2076
        506B34504C2E4173446F75626C65202B0D0A2020202020202020202020765175
        69504C2E4173446F75626C65202B2076457861504C2E4173446F75626C65202B
        200D0A202020202020202020202076547269504C2E4173446F75626C65202B20
        76536663504C2E4173446F75626C653B0D0A20200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060876546F74616C504C094576656E744E616D650606
        4F6E43616C63074576656E74494402210000}
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
    OnNewRecord = tblPrevDayRHNewRecord
    DatabaseName = 'dbPrevDayByDayReport'
    EngineVersion = '4.09'
    IndexName = 'ByActualPrimary'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    MasterSource = dsPrevDayHH
    TableName = 'PrevWeekRH'
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
      FieldAlias = 'IsEquibaseChartsProcessed'
      FieldName = 'IsEquibaseChartsProcessed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 3
    end
    object plPrevDayRHppField5: TppField
      FieldAlias = 'IsDRFChartsProcessed'
      FieldName = 'IsDRFChartsProcessed'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 4
    end
    object plPrevDayRHppField6: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object plPrevDayRHppField7: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object plPrevDayRHppField8: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object plPrevDayRHppField9: TppField
      FieldAlias = 'OrigSurface'
      FieldName = 'OrigSurface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object plPrevDayRHppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object plPrevDayRHppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object plPrevDayRHppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object plPrevDayRHppField13: TppField
      FieldAlias = 'IsPk3Race'
      FieldName = 'IsPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 12
    end
    object plPrevDayRHppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3RaceNbr'
      FieldName = 'Pk3RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object plPrevDayRHppField15: TppField
      FieldAlias = 'IsPk4Race'
      FieldName = 'IsPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 14
    end
    object plPrevDayRHppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk4RaceNbr'
      FieldName = 'Pk4RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object plPrevDayRHppField17: TppField
      FieldAlias = 'IsPk6Race'
      FieldName = 'IsPk6Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 16
    end
    object plPrevDayRHppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk6RaceNbr'
      FieldName = 'Pk6RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object plPrevDayRHppField19: TppField
      FieldAlias = 'IsTriRace'
      FieldName = 'IsTriRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 18
    end
    object plPrevDayRHppField20: TppField
      FieldAlias = 'IsSuperRace'
      FieldName = 'IsSuperRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 19
    end
    object plPrevDayRHppField21: TppField
      FieldAlias = 'IsPk9Place'
      FieldName = 'IsPk9Place'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 20
    end
    object plPrevDayRHppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk9RaceNbr'
      FieldName = 'Pk9RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object plPrevDayRHppField23: TppField
      FieldAlias = 'IsExaRace'
      FieldName = 'IsExaRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 22
    end
    object plPrevDayRHppField24: TppField
      FieldAlias = 'IsQuiRace'
      FieldName = 'IsQuiRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 23
    end
    object plPrevDayRHppField25: TppField
      FieldAlias = 'IsDDRace'
      FieldName = 'IsDDRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 24
    end
    object plPrevDayRHppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDRaceNbr'
      FieldName = 'DDRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 25
    end
    object plPrevDayRHppField27: TppField
      FieldAlias = 'IsPk3Leg1'
      FieldName = 'IsPk3Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 26
    end
    object plPrevDayRHppField28: TppField
      FieldAlias = 'IsPk4Leg1'
      FieldName = 'IsPk4Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 27
    end
    object plPrevDayRHppField29: TppField
      FieldAlias = 'IsPk6Leg1'
      FieldName = 'IsPk6Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 28
    end
    object plPrevDayRHppField30: TppField
      FieldAlias = 'IsPk9Leg1'
      FieldName = 'IsPk9Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 29
    end
    object plPrevDayRHppField31: TppField
      FieldAlias = 'IsDDLeg1'
      FieldName = 'IsDDLeg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 30
    end
    object plPrevDayRHppField32: TppField
      FieldAlias = 'RaceCondition1'
      FieldName = 'RaceCondition1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 31
    end
    object plPrevDayRHppField33: TppField
      FieldAlias = 'RaceCondition2'
      FieldName = 'RaceCondition2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 32
    end
    object plPrevDayRHppField34: TppField
      FieldAlias = 'RaceCondition3'
      FieldName = 'RaceCondition3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 33
    end
    object plPrevDayRHppField35: TppField
      FieldAlias = 'RaceCondition4'
      FieldName = 'RaceCondition4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 34
    end
    object plPrevDayRHppField36: TppField
      FieldAlias = 'RaceCondition5'
      FieldName = 'RaceCondition5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 35
    end
    object plPrevDayRHppField37: TppField
      FieldAlias = 'RaceCondition6'
      FieldName = 'RaceCondition6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 36
    end
    object plPrevDayRHppField38: TppField
      FieldAlias = 'RaceCondition7'
      FieldName = 'RaceCondition7'
      FieldLength = 40
      DisplayWidth = 40
      Position = 37
    end
    object plPrevDayRHppField39: TppField
      FieldAlias = 'RaceCondition8'
      FieldName = 'RaceCondition8'
      FieldLength = 40
      DisplayWidth = 40
      Position = 38
    end
    object plPrevDayRHppField40: TppField
      FieldAlias = 'RaceCondition9'
      FieldName = 'RaceCondition9'
      FieldLength = 40
      DisplayWidth = 40
      Position = 39
    end
    object plPrevDayRHppField41: TppField
      FieldAlias = 'RaceCondition10'
      FieldName = 'RaceCondition10'
      FieldLength = 40
      DisplayWidth = 40
      Position = 40
    end
    object plPrevDayRHppField42: TppField
      FieldAlias = 'BetLine'
      FieldName = 'BetLine'
      FieldLength = 120
      DisplayWidth = 120
      Position = 41
    end
    object plPrevDayRHppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 42
    end
    object plPrevDayRHppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 43
    end
    object plPrevDayRHppField45: TppField
      FieldAlias = 'RaceConditions'
      FieldName = 'RaceConditions'
      FieldLength = 15
      DisplayWidth = 15
      Position = 44
    end
    object plPrevDayRHppField46: TppField
      FieldAlias = 'TrkCond'
      FieldName = 'TrkCond'
      FieldLength = 3
      DisplayWidth = 3
      Position = 45
    end
    object plPrevDayRHppField47: TppField
      FieldAlias = 'DistanceDesc'
      FieldName = 'DistanceDesc'
      FieldLength = 5
      DisplayWidth = 5
      Position = 46
    end
    object plPrevDayRHppField48: TppField
      FieldAlias = 'OrigDistanceDesc'
      FieldName = 'OrigDistanceDesc'
      FieldLength = 20
      DisplayWidth = 20
      Position = 47
    end
    object plPrevDayRHppField49: TppField
      FieldAlias = 'LocalTimeOfRace'
      FieldName = 'LocalTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 48
    end
    object plPrevDayRHppField50: TppField
      FieldAlias = 'IsFinalValue'
      FieldName = 'IsFinalValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 49
    end
    object plPrevDayRHppField51: TppField
      FieldAlias = 'IsTrnValue'
      FieldName = 'IsTrnValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 50
    end
    object plPrevDayRHppField52: TppField
      FieldAlias = 'IsPPValue'
      FieldName = 'IsPPValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 51
    end
    object plPrevDayRHppField53: TppField
      FieldAlias = 'IsMLValue'
      FieldName = 'IsMLValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 52
    end
    object plPrevDayRHppField54: TppField
      FieldAlias = 'IsChalkValue'
      FieldName = 'IsChalkValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 53
    end
    object plPrevDayRHppField55: TppField
      FieldAlias = 'IsPlayableValue'
      FieldName = 'IsPlayableValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 54
    end
    object plPrevDayRHppField56: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 55
    end
    object plPrevDayRHppField57: TppField
      FieldAlias = 'IsPrintedOnAngleSheet'
      FieldName = 'IsPrintedOnAngleSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 56
    end
    object plPrevDayRHppField58: TppField
      FieldAlias = 'IsAngleSheetSelected'
      FieldName = 'IsAngleSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 57
    end
    object plPrevDayRHppField59: TppField
      FieldAlias = 'IsTipSheetSelected'
      FieldName = 'IsTipSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 58
    end
    object plPrevDayRHppField60: TppField
      FieldAlias = 'IsYouBetTrack'
      FieldName = 'IsYouBetTrack'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 59
    end
    object plPrevDayRHppField61: TppField
      FieldAlias = 'FootNotes'
      FieldName = 'FootNotes'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 60
      Searchable = False
      Sortable = False
    end
    object plPrevDayRHppField62: TppField
      FieldAlias = 'Trainers'
      FieldName = 'Trainers'
      FieldLength = 512
      DisplayWidth = 512
      Position = 61
    end
    object plPrevDayRHppField63: TppField
      FieldAlias = 'Owners'
      FieldName = 'Owners'
      FieldLength = 512
      DisplayWidth = 512
      Position = 62
    end
    object plPrevDayRHppField64: TppField
      FieldAlias = 'ScratchedHorses'
      FieldName = 'ScratchedHorses'
      FieldLength = 512
      DisplayWidth = 512
      Position = 63
    end
    object plPrevDayRHppField65: TppField
      FieldAlias = 'FractionalTimes'
      FieldName = 'FractionalTimes'
      FieldLength = 100
      DisplayWidth = 100
      Position = 64
    end
    object plPrevDayRHppField66: TppField
      FieldAlias = 'IsExactaMatched'
      FieldName = 'IsExactaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 65
    end
    object plPrevDayRHppField67: TppField
      FieldAlias = 'Exacta'
      FieldName = 'Exacta'
      FieldLength = 40
      DisplayWidth = 40
      Position = 66
    end
    object plPrevDayRHppField68: TppField
      FieldAlias = 'ExactaNbrs'
      FieldName = 'ExactaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 67
    end
    object plPrevDayRHppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaWager'
      FieldName = 'ExactaWager'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 68
    end
    object plPrevDayRHppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'ExactaPayout'
      FieldName = 'ExactaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 69
    end
    object plPrevDayRHppField71: TppField
      FieldAlias = 'IsTrifectaMatched'
      FieldName = 'IsTrifectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 70
    end
    object plPrevDayRHppField72: TppField
      FieldAlias = 'Tri'
      FieldName = 'Tri'
      FieldLength = 40
      DisplayWidth = 40
      Position = 71
    end
    object plPrevDayRHppField73: TppField
      FieldAlias = 'TrifectaNbrs'
      FieldName = 'TrifectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 72
    end
    object plPrevDayRHppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaWager'
      FieldName = 'TrifectaWager'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 73
    end
    object plPrevDayRHppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrifectaPayout'
      FieldName = 'TrifectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 74
    end
    object plPrevDayRHppField76: TppField
      FieldAlias = 'IsSuperfectaMatched'
      FieldName = 'IsSuperfectaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 75
    end
    object plPrevDayRHppField77: TppField
      FieldAlias = 'Super'
      FieldName = 'Super'
      FieldLength = 40
      DisplayWidth = 40
      Position = 76
    end
    object plPrevDayRHppField78: TppField
      FieldAlias = 'SuperfectaNbrs'
      FieldName = 'SuperfectaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 77
    end
    object plPrevDayRHppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaWager'
      FieldName = 'SuperfectaWager'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 78
    end
    object plPrevDayRHppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperfectaPayout'
      FieldName = 'SuperfectaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 79
    end
    object plPrevDayRHppField81: TppField
      FieldAlias = 'IsDailyDoubleMatchedFirstRace'
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 80
    end
    object plPrevDayRHppField82: TppField
      FieldAlias = 'IsDailyDoubleMatchedLastRace'
      FieldName = 'IsDailyDoubleMatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 81
    end
    object plPrevDayRHppField83: TppField
      FieldAlias = 'DDFirstRace'
      FieldName = 'DDFirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 82
    end
    object plPrevDayRHppField84: TppField
      FieldAlias = 'DDLastRace'
      FieldName = 'DDLastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 83
    end
    object plPrevDayRHppField85: TppField
      FieldAlias = 'DailyDoubleNbrsFirstRace'
      FieldName = 'DailyDoubleNbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 84
    end
    object plPrevDayRHppField86: TppField
      FieldAlias = 'DailyDoubleNbrsLastRace'
      FieldName = 'DailyDoubleNbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 85
    end
    object plPrevDayRHppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerFirstRace'
      FieldName = 'DailyDoubleWagerFirstRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 86
    end
    object plPrevDayRHppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoubleWagerLastRace'
      FieldName = 'DailyDoubleWagerLastRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 87
    end
    object plPrevDayRHppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutFirstRace'
      FieldName = 'DailyDoublePayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 88
    end
    object plPrevDayRHppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'DailyDoublePayoutLastRace'
      FieldName = 'DailyDoublePayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object plPrevDayRHppField91: TppField
      FieldAlias = 'IsQuinellaMatched'
      FieldName = 'IsQuinellaMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 90
    end
    object plPrevDayRHppField92: TppField
      FieldAlias = 'Quinella'
      FieldName = 'Quinella'
      FieldLength = 40
      DisplayWidth = 40
      Position = 91
    end
    object plPrevDayRHppField93: TppField
      FieldAlias = 'QuinellaNbrs'
      FieldName = 'QuinellaNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 92
    end
    object plPrevDayRHppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaWager'
      FieldName = 'QuinellaWager'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 93
    end
    object plPrevDayRHppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'QuinellaPayout'
      FieldName = 'QuinellaPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 94
    end
    object plPrevDayRHppField96: TppField
      FieldAlias = 'IsPick3MatchedFirstRace'
      FieldName = 'IsPick3MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 95
    end
    object plPrevDayRHppField97: TppField
      FieldAlias = 'IsPick3MatchedLastRace'
      FieldName = 'IsPick3MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 96
    end
    object plPrevDayRHppField98: TppField
      FieldAlias = 'Pick3FirstRace'
      FieldName = 'Pick3FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 97
    end
    object plPrevDayRHppField99: TppField
      FieldAlias = 'Pick3LastRace'
      FieldName = 'Pick3LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 98
    end
    object plPrevDayRHppField100: TppField
      FieldAlias = 'Pick3NbrsFirstRace'
      FieldName = 'Pick3NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 99
    end
    object plPrevDayRHppField101: TppField
      FieldAlias = 'Pick3NbrsLastRace'
      FieldName = 'Pick3NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 100
    end
    object plPrevDayRHppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerFirstRace'
      FieldName = 'Pick3WagerFirstRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 101
    end
    object plPrevDayRHppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3WagerLastRace'
      FieldName = 'Pick3WagerLastRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 102
    end
    object plPrevDayRHppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutFirstRace'
      FieldName = 'Pick3PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 103
    end
    object plPrevDayRHppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick3PayoutLastRace'
      FieldName = 'Pick3PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 104
    end
    object plPrevDayRHppField106: TppField
      FieldAlias = 'Pick3NbrsLeg1'
      FieldName = 'Pick3NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 105
    end
    object plPrevDayRHppField107: TppField
      FieldAlias = 'Pick3NbrsLeg2'
      FieldName = 'Pick3NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 106
    end
    object plPrevDayRHppField108: TppField
      FieldAlias = 'Pick3NbrsLeg3'
      FieldName = 'Pick3NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 107
    end
    object plPrevDayRHppField109: TppField
      FieldAlias = 'IsPick4MatchedFirstRace'
      FieldName = 'IsPick4MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 108
    end
    object plPrevDayRHppField110: TppField
      FieldAlias = 'IsPick4MatchedLastRace'
      FieldName = 'IsPick4MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 109
    end
    object plPrevDayRHppField111: TppField
      FieldAlias = 'Pick4FirstRace'
      FieldName = 'Pick4FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 110
    end
    object plPrevDayRHppField112: TppField
      FieldAlias = 'Pick4LastRace'
      FieldName = 'Pick4LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 111
    end
    object plPrevDayRHppField113: TppField
      FieldAlias = 'Pick4NbrsFirstRace'
      FieldName = 'Pick4NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 112
    end
    object plPrevDayRHppField114: TppField
      FieldAlias = 'Pick4NbrsLastRace'
      FieldName = 'Pick4NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 113
    end
    object plPrevDayRHppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerFirstRace'
      FieldName = 'Pick4WagerFirstRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 114
    end
    object plPrevDayRHppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4WagerLastRace'
      FieldName = 'Pick4WagerLastRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plPrevDayRHppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutFirstRace'
      FieldName = 'Pick4PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 116
    end
    object plPrevDayRHppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick4PayoutLastRace'
      FieldName = 'Pick4PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 117
    end
    object plPrevDayRHppField119: TppField
      FieldAlias = 'Pick4NbrsLeg1'
      FieldName = 'Pick4NbrsLeg1'
      FieldLength = 25
      DisplayWidth = 25
      Position = 118
    end
    object plPrevDayRHppField120: TppField
      FieldAlias = 'Pick4NbrsLeg2'
      FieldName = 'Pick4NbrsLeg2'
      FieldLength = 25
      DisplayWidth = 25
      Position = 119
    end
    object plPrevDayRHppField121: TppField
      FieldAlias = 'Pick4NbrsLeg3'
      FieldName = 'Pick4NbrsLeg3'
      FieldLength = 25
      DisplayWidth = 25
      Position = 120
    end
    object plPrevDayRHppField122: TppField
      FieldAlias = 'Pick4NbrsLeg4'
      FieldName = 'Pick4NbrsLeg4'
      FieldLength = 25
      DisplayWidth = 25
      Position = 121
    end
    object plPrevDayRHppField123: TppField
      FieldAlias = 'IsPick6MatchedFirstRace'
      FieldName = 'IsPick6MatchedFirstRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 122
    end
    object plPrevDayRHppField124: TppField
      FieldAlias = 'IsPick6MatchedLastRace'
      FieldName = 'IsPick6MatchedLastRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 123
    end
    object plPrevDayRHppField125: TppField
      FieldAlias = 'Pick6FirstRace'
      FieldName = 'Pick6FirstRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 124
    end
    object plPrevDayRHppField126: TppField
      FieldAlias = 'Pick6LastRace'
      FieldName = 'Pick6LastRace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 125
    end
    object plPrevDayRHppField127: TppField
      FieldAlias = 'Pick6NbrsFirstRace'
      FieldName = 'Pick6NbrsFirstRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 126
    end
    object plPrevDayRHppField128: TppField
      FieldAlias = 'Pick6NbrsLastRace'
      FieldName = 'Pick6NbrsLastRace'
      FieldLength = 50
      DisplayWidth = 50
      Position = 127
    end
    object plPrevDayRHppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerFirstRace'
      FieldName = 'Pick6WagerFirstRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 128
    end
    object plPrevDayRHppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6WagerLastRace'
      FieldName = 'Pick6WagerLastRace'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 129
    end
    object plPrevDayRHppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutFirstRace'
      FieldName = 'Pick6PayoutFirstRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 130
    end
    object plPrevDayRHppField132: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pick6PayoutLastRace'
      FieldName = 'Pick6PayoutLastRace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 131
    end
    object plPrevDayRHppField133: TppField
      FieldAlias = 'IsWinMatched'
      FieldName = 'IsWinMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 132
    end
    object plPrevDayRHppField134: TppField
      FieldAlias = 'WinNbrs'
      FieldName = 'WinNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 133
    end
    object plPrevDayRHppField135: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPayout'
      FieldName = 'WinPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 134
    end
    object plPrevDayRHppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinPlcPayout'
      FieldName = 'WinPlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 135
    end
    object plPrevDayRHppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'WinShoPayout'
      FieldName = 'WinShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 136
    end
    object plPrevDayRHppField138: TppField
      FieldAlias = 'IsPlcMatched'
      FieldName = 'IsPlcMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 137
    end
    object plPrevDayRHppField139: TppField
      FieldAlias = 'PlcNbrs'
      FieldName = 'PlcNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 138
    end
    object plPrevDayRHppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcPayout'
      FieldName = 'PlcPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 139
    end
    object plPrevDayRHppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'PlcShoPayout'
      FieldName = 'PlcShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 140
    end
    object plPrevDayRHppField142: TppField
      FieldAlias = 'IsShoMatched'
      FieldName = 'IsShoMatched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 141
    end
    object plPrevDayRHppField143: TppField
      FieldAlias = 'ShoNbrs'
      FieldName = 'ShoNbrs'
      FieldLength = 50
      DisplayWidth = 50
      Position = 142
    end
    object plPrevDayRHppField144: TppField
      Alignment = taRightJustify
      FieldAlias = 'ShoPayout'
      FieldName = 'ShoPayout'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 143
    end
    object plPrevDayRHppField145: TppField
      FieldAlias = 'Weather'
      FieldName = 'Weather'
      FieldLength = 100
      DisplayWidth = 100
      Position = 144
    end
    object plPrevDayRHppField146: TppField
      FieldAlias = 'Value'
      FieldName = 'Value'
      FieldLength = 10
      DisplayWidth = 10
      Position = 145
    end
    object plPrevDayRHppField147: TppField
      FieldAlias = 'Chalk'
      FieldName = 'Chalk'
      FieldLength = 10
      DisplayWidth = 10
      Position = 146
    end
    object plPrevDayRHppField148: TppField
      FieldAlias = 'Wager1'
      FieldName = 'Wager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 147
    end
    object plPrevDayRHppField149: TppField
      FieldAlias = 'Wager2'
      FieldName = 'Wager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 148
    end
    object plPrevDayRHppField150: TppField
      FieldAlias = 'Wager3'
      FieldName = 'Wager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 149
    end
    object plPrevDayRHppField151: TppField
      FieldAlias = 'Wager4'
      FieldName = 'Wager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 150
    end
    object plPrevDayRHppField152: TppField
      FieldAlias = 'Wager5'
      FieldName = 'Wager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 151
    end
    object plPrevDayRHppField153: TppField
      FieldAlias = 'Wager6'
      FieldName = 'Wager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 152
    end
    object plPrevDayRHppField154: TppField
      FieldAlias = 'AltWager1'
      FieldName = 'AltWager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 153
    end
    object plPrevDayRHppField155: TppField
      FieldAlias = 'AltWager2'
      FieldName = 'AltWager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 154
    end
    object plPrevDayRHppField156: TppField
      FieldAlias = 'AltWager3'
      FieldName = 'AltWager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 155
    end
    object plPrevDayRHppField157: TppField
      FieldAlias = 'AltWager4'
      FieldName = 'AltWager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 156
    end
    object plPrevDayRHppField158: TppField
      FieldAlias = 'AltWager5'
      FieldName = 'AltWager5'
      FieldLength = 40
      DisplayWidth = 40
      Position = 157
    end
    object plPrevDayRHppField159: TppField
      FieldAlias = 'AltWager6'
      FieldName = 'AltWager6'
      FieldLength = 40
      DisplayWidth = 40
      Position = 158
    end
    object plPrevDayRHppField160: TppField
      FieldAlias = 'WagerFinalOrder'
      FieldName = 'WagerFinalOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 159
    end
    object plPrevDayRHppField161: TppField
      FieldAlias = 'WagerSheetOrder'
      FieldName = 'WagerSheetOrder'
      FieldLength = 40
      DisplayWidth = 40
      Position = 160
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
