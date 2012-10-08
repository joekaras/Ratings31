object PreviousDaysByDayReportForm: TPreviousDaysByDayReportForm
  Left = -4
  Top = -4
  Width = 805
  Height = 608
  Caption = 'Last 90 Days Results Report'
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
    Top = 547
    Width = 797
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
  object dbLast90DaysReport: TDBISAMDatabase
    EngineVersion = '4.21 Build 10'
    Connected = True
    DatabaseName = 'dbLast90DaysReport'
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
    Filter = '((FinalWinPctRank=1) and (FinishPos > 0) and (Odds > 0))'
    Filtered = True
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbLast90DaysReport'
    SessionName = 'Default'
    EngineVersion = '4.21 Build 10'
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
    Left = 158
    Top = 226
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
  object ppLast90DaysReport: TppReport
    AutoStop = False
    DataPipeline = plPrevDayHH
    PassSetting = psTwoPass
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
        mmWidth = 149225
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
        mmHeight = 5842
        mmLeft = 149183
        mmTop = 0
        mmWidth = 9567
        BandType = 0
      end
    end
    object DetailBand: TppDetailBand
      Visible = False
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
        OnPrint = dbRaceNbrPrint
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
        OnPrint = dbHorseNamePrint
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
        OnPrint = dbTrkCodePrint
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
        OnPrint = dbProgramNbrPrint
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
        OnPrint = dbFinishPosPrint
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
        OnPrint = dbOddsPrint
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
        OnPrint = dbMLPrint
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
        OnPrint = dbExactaPayoutPrint
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
        mmLeft = 173038
        mmTop = 3440
        mmWidth = 10319
        BandType = 4
      end
      object FinishNbrs: TppDBText
        OnPrint = FinishNbrsPrint
        UserName = 'FinishNbrs'
        OnGetText = FinishNbrsGetText
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
        OnPrint = dbTrifectaPayoutPrint
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
        mmHeight = 2646
        mmLeft = 158750
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object dbQuinellaPayout: TppDBText
        OnPrint = dbQuinellaPayoutPrint
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
        mmLeft = 185209
        mmTop = 3440
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
        mmLeft = 196057
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
        mmHeight = 9260
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
        mmHeight = 9260
        mmLeft = 184150
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
        OnPrint = dbDailyDoublePayoutPrint
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
        mmLeft = 201877
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
      object dbPick4Payout: TppDBText
        OnPrint = dbPick4PayoutPrint
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
        mmLeft = 249503
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
        mmLeft = 217223
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
        mmLeft = 243682
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbSuperfectaPayout: TppDBText
        OnPrint = dbSuperfectaPayoutPrint
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
        mmHeight = 2646
        mmLeft = 144198
        mmTop = 3440
        mmWidth = 12435
        BandType = 4
      end
      object dbPick4Wager: TppDBText
        OnPrint = dbPick4WagerPrint
        UserName = 'Pick4Wager'
        OnGetText = dbPick4WagerGetText
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
        mmHeight = 2646
        mmLeft = 244475
        mmTop = 265
        mmWidth = 2646
        BandType = 4
      end
      object dbPick3Wager: TppDBText
        OnPrint = dbPick3WagerPrint
        UserName = 'Pick3Wager'
        OnGetText = dbPick3WagerGetText
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
        mmHeight = 2646
        mmLeft = 218017
        mmTop = 265
        mmWidth = 2910
        BandType = 4
      end
      object dbDailyDoubleWager: TppDBText
        OnPrint = dbDailyDoubleWagerPrint
        UserName = 'DailyDoubleWager'
        OnGetText = dbDailyDoubleWagerGetText
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
        mmLeft = 196586
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbQuinellaWager: TppDBText
        OnPrint = dbQuinellaWagerPrint
        UserName = 'QuinellaWager'
        OnGetText = dbQuinellaWagerGetText
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
        mmHeight = 2646
        mmLeft = 185209
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbExactaWager: TppDBText
        OnPrint = dbExactaWagerPrint
        UserName = 'ExactaWager'
        OnGetText = dbExactaWagerGetText
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
        mmLeft = 173038
        mmTop = 529
        mmWidth = 3175
        BandType = 4
      end
      object dbTrifectaWager: TppDBText
        OnPrint = dbTrifectaWagerPrint
        UserName = 'TrifectaWager'
        OnGetText = dbTrifectaWagerGetText
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
        mmHeight = 2646
        mmLeft = 159015
        mmTop = 0
        mmWidth = 2910
        BandType = 4
      end
      object dbSuperfectaWager: TppDBText
        OnPrint = dbSuperfectaWagerPrint
        UserName = 'SuperfectaWager'
        OnGetText = dbSuperfectaWagerGetText
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
        OnPrint = dbWinPayoutPrint
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
        OnPrint = dbSheetOrderPrint
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
        OnPrint = dbWinNbrsPrint
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
        OnPrint = dbWinPlcPayoutPrint
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
        OnPrint = dbWinShoPayoutPrint
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
        OnPrint = dbPick3PayoutPrint
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
        mmLeft = 222515
        mmTop = 265
        mmWidth = 12171
        BandType = 4
      end
      object dbDDFirstRace: TppDBText
        OnPrint = dbDDFirstRacePrint
        UserName = 'dbDDFirstRace'
        BlankWhenZero = True
        DataField = 'DDFirstRace'
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
        mmHeight = 2117
        mmLeft = 201613
        mmTop = 3440
        mmWidth = 14288
        BandType = 4
      end
      object dbPick3: TppDBText
        OnPrint = dbPick3Print
        UserName = 'Pick3'
        BlankWhenZero = True
        DataField = 'Pick3FirstRace'
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
        mmHeight = 2117
        mmLeft = 218017
        mmTop = 3440
        mmWidth = 24606
        BandType = 4
      end
      object dbPick4: TppDBText
        OnPrint = dbPick4Print
        UserName = 'Pick4'
        BlankWhenZero = True
        DataField = 'Pick4FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 5
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 244475
        mmTop = 3175
        mmWidth = 21167
        BandType = 4
      end
      object dbDailyDoubleNbrsFirstRace: TppDBText
        OnPrint = dbDailyDoubleNbrsFirstRacePrint
        UserName = 'dbDailyDoubleNbrsFirstRace'
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
        mmLeft = 201613
        mmTop = 6350
        mmWidth = 14288
        BandType = 4
      end
      object dbPick3Nbrs: TppDBText
        OnPrint = dbPick3NbrsPrint
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
        mmLeft = 218017
        mmTop = 6350
        mmWidth = 16404
        BandType = 4
      end
      object dbPick4Nbrs: TppDBText
        OnPrint = dbPick4NbrsPrint
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
        mmLeft = 244475
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 196586
        mmTop = 3175
        mmWidth = 2646
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 196586
        mmTop = 5821
        mmWidth = 3704
        BandType = 4
      end
      object dbPlcNbrs: TppDBText
        OnPrint = dbPlcNbrsPrint
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
        OnPrint = dbShoNbrsPrint
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
        OnPrint = dbPlcPayoutPrint
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
        OnPrint = dbPlcShoPayoutPrint
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
        OnPrint = dbShoPayoutPrint
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
        OnPrint = dbRaceDatePrint
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
      object dbRaceType: TppDBText
        OnPrint = dbRaceTypePrint
        UserName = 'RaceType'
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
      object dbDaysLast: TppDBText
        OnPrint = dbDaysLastPrint
        UserName = 'DaysLast'
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
      object dbMorningLineTo1: TppDBText
        OnPrint = dbMLPrint
        UserName = 'ML1'
        DataField = 'MorningLineTo1'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2381
        mmLeft = 37571
        mmTop = 3175
        mmWidth = 7408
        BandType = 4
      end
    end
    object grp2: TppGroup
      AfterGroupBreak = grp2AfterGroupBreak
      BreakName = 'MorningLineTo1'
      DataPipeline = plPrevDayHH
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'grp2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plPrevDayHH'
      object grp2Header: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 2646
        mmPrintPosition = 0
      end
      object grp0Footer: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 165629
        mmPrintPosition = 0
        object imgPk3: TppShape
          UserName = 'imgDD1'
          mmHeight = 32808
          mmLeft = 191294
          mmTop = 36248
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 33338
          mmLeft = 265
          mmTop = 1852
          mmWidth = 61648
          BandType = 5
          GroupNo = 1
        end
        object varWins: TppVariable
          UserName = 'vWins'
          CalcOrder = 0
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWinsCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 52917
          mmTop = 7673
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varStarts: TppVariable
          UserName = 'vStarts'
          CalcOrder = 1
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varStartsCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 49477
          mmTop = 2646
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1852
          mmTop = 2646
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1852
          mmTop = 7408
          mmWidth = 6879
          BandType = 5
          GroupNo = 1
        end
        object varPlcs: TppVariable
          UserName = 'vPlcs'
          CalcOrder = 2
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPlcsCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 52917
          mmTop = 12435
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1852
          mmTop = 12171
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varWinPct: TppVariable
          UserName = 'vWinPct'
          CalcOrder = 3
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWinPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 49477
          mmTop = 21960
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object lblWinPct: TppLabel
          UserName = 'lblWinPct'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 21696
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varShos: TppVariable
          UserName = 'vShos'
          CalcOrder = 4
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 52917
          mmTop = 17198
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object lblShos: TppLabel
          UserName = 'lblShos'
          Caption = 'Shows'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 16933
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          mmHeight = 40746
          mmLeft = 265
          mmTop = 107950
          mmWidth = 61648
          BandType = 5
          GroupNo = 1
        end
        object lblAvgOdds: TppLabel
          UserName = 'lblAvgOdds'
          Caption = 'Avg Win Odds To $1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 26458
          mmWidth = 33073
          BandType = 5
          GroupNo = 1
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
          OnCalc = varAvgOddsCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 47890
          mmTop = 26988
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
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
          OnCalc = varTotalOddsCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 44450
          mmTop = 31485
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object lblTotalOdds: TppLabel
          UserName = 'lblTotalOdds'
          Caption = 'Total Odds To 1$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 31221
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 110067
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varWPSPL: TppVariable
          UserName = 'varWPSPL'
          CalcOrder = 7
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWPSPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 46302
          mmTop = 110331
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
        end
        object varTriSfcPL: TppVariable
          UserName = 'varTriSfcPL'
          CalcOrder = 8
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varTriSfcPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 41275
          mmTop = 115623
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 115359
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 120650
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 125942
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object varExaQuiPL: TppVariable
          UserName = 'varExaQuiPL'
          CalcOrder = 9
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varExaQuiPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 41275
          mmTop = 120915
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varDDPk3PL: TppVariable
          UserName = 'varDDPk3PL'
          CalcOrder = 10
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDPk3PLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 42863
          mmTop = 126207
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 132027
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varPk4Pk6PL: TppVariable
          UserName = 'varPk4Pk6PL'
          CalcOrder = 11
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk4Pk6PLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 41275
          mmTop = 132292
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object imgTri: TppShape
          UserName = 'imgTri'
          mmHeight = 32808
          mmLeft = 125413
          mmTop = 36248
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
        end
        object imgSfc: TppShape
          UserName = 'imgSfc'
          mmHeight = 32808
          mmLeft = 125413
          mmTop = 1852
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
        end
        object imgWin: TppShape
          UserName = 'imgWin'
          mmHeight = 20108
          mmLeft = 265
          mmTop = 36777
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 2117
          mmTop = 38629
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
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
          mmLeft = 2117
          mmTop = 43656
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
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
          mmLeft = 2117
          mmTop = 48419
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object varWinWagered: TppVariable
          UserName = 'vWinWagered'
          CalcOrder = 12
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWinWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 42863
          mmTop = 38629
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varWinPayout: TppVariable
          UserName = 'vWinPayout'
          CalcOrder = 13
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWinPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 48948
          mmTop = 43392
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varWinPL: TppVariable
          UserName = 'vWinPL'
          CalcOrder = 14
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varWinPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 51329
          mmTop = 48419
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object imgPlc: TppShape
          UserName = 'imgPlc'
          mmHeight = 20108
          mmLeft = 265
          mmTop = 59267
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1323
          mmTop = 60590
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1323
          mmTop = 65352
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1323
          mmTop = 70115
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object varPlcWagered: TppVariable
          UserName = 'vPlcWagered'
          CalcOrder = 15
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPlcWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 42069
          mmTop = 60590
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varPlcPayout: TppVariable
          UserName = 'vPlcPayout'
          CalcOrder = 16
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPlcPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 48683
          mmTop = 65352
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varPlcPL: TppVariable
          UserName = 'vPlcPL'
          CalcOrder = 17
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varPlcPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 50536
          mmTop = 70115
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 3704
          mmWidth = 35454
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 7938
          mmWidth = 37042
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 12171
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
        end
        object varSfcPL: TppVariable
          UserName = 'vSfcPL'
          CalcOrder = 18
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varSfcPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 13494
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varSfcPayout: TppVariable
          UserName = 'vSfcPayout'
          CalcOrder = 19
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varSfcPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 9260
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varSfcWagered: TppVariable
          UserName = 'vSfcWagered'
          CalcOrder = 20
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varSfcWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167746
          mmTop = 3969
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 37571
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 41804
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 46038
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object varTriPL: TppVariable
          UserName = 'vTriPL'
          CalcOrder = 21
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varTriPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 46567
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varTriPayout: TppVariable
          UserName = 'vTriPayout'
          CalcOrder = 22
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varTriPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 41804
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varTriWagered: TppVariable
          UserName = 'vTriWagered'
          CalcOrder = 23
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varTriWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167746
          mmTop = 37042
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object imgExa: TppShape
          UserName = 'imgExa'
          mmHeight = 32808
          mmLeft = 125413
          mmTop = 70115
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
        end
        object imgQui: TppShape
          UserName = 'imgQui'
          mmHeight = 32808
          mmLeft = 124884
          mmTop = 105304
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 126471
          mmTop = 106363
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
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
          mmLeft = 126471
          mmTop = 110596
          mmWidth = 32279
          BandType = 5
          GroupNo = 1
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
          mmLeft = 125942
          mmTop = 114829
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object varQuiPL: TppVariable
          UserName = 'vQuiPL'
          CalcOrder = 24
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varQuiPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 175684
          mmTop = 115359
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varQuiPayout: TppVariable
          UserName = 'vQuiPayout'
          CalcOrder = 25
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varQuiPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 173832
          mmTop = 111125
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varQuiWagered: TppVariable
          UserName = 'vQuiWagered'
          CalcOrder = 26
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varQuiWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167217
          mmTop = 106892
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object imgDD: TppShape
          UserName = 'imgDD'
          mmHeight = 33073
          mmLeft = 191294
          mmTop = 1852
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193411
          mmTop = 3440
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193411
          mmTop = 8731
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193411
          mmTop = 13229
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object varDDPL: TppVariable
          UserName = 'vDDPL'
          CalcOrder = 27
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varDDPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 243946
          mmTop = 13229
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varDDPayout: TppVariable
          UserName = 'vDDPayout'
          CalcOrder = 28
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 242359
          mmTop = 8996
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varDDWagered: TppVariable
          UserName = 'vDDWagered'
          CalcOrder = 29
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 235480
          mmTop = 3969
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
        end
        object imgSho: TppShape
          UserName = 'imgSho'
          mmHeight = 20108
          mmLeft = 265
          mmTop = 80433
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1058
          mmTop = 81756
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1058
          mmTop = 86519
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1058
          mmTop = 91546
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varShoWagered: TppVariable
          UserName = 'vShoWagered'
          CalcOrder = 30
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varShoWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 41804
          mmTop = 81756
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object varShoPayout: TppVariable
          UserName = 'vShoPayout'
          CalcOrder = 31
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varShoPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 48419
          mmTop = 86519
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varShoPL: TppVariable
          UserName = 'vShoPL'
          CalcOrder = 32
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varShoPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 50271
          mmTop = 91546
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 37306
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 41540
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 46567
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object varPk3PL: TppVariable
          UserName = 'vPk3PL'
          CalcOrder = 33
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varPk3PLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 242359
          mmTop = 46302
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varPk3Payout: TppVariable
          UserName = 'vPk3Payout'
          CalcOrder = 34
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk3PayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 240507
          mmTop = 41804
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varPk3Wagered: TppVariable
          UserName = 'vPk3Wagered'
          CalcOrder = 35
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk3WageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 233892
          mmTop = 37835
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
        end
        object imgPk4: TppShape
          UserName = 'imgDD2'
          mmHeight = 32808
          mmLeft = 191294
          mmTop = 70115
          mmWidth = 61913
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 70908
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
        end
        object varPk4Wagered: TppVariable
          UserName = 'vPk4Wagered'
          CalcOrder = 36
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk4WageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 233892
          mmTop = 71173
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 2117
          mmTop = 53711
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varWinPLPct: TppVariable
          UserName = 'vWinPLPct'
          CalcOrder = 37
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varWinPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 45773
          mmTop = 53975
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 1323
          mmTop = 74877
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varPlcPLPct: TppVariable
          UserName = 'vPlcPLPct'
          CalcOrder = 38
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPlcPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 44979
          mmTop = 75142
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 794
          mmTop = 96044
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varShoPLPct: TppVariable
          UserName = 'vShoPLPct'
          CalcOrder = 39
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varShoPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 44450
          mmTop = 96309
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 16404
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varSfcPLPct: TppVariable
          UserName = 'vSfcPLPct'
          CalcOrder = 40
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varSfcPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170921
          mmTop = 17727
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object varTriPLPct: TppVariable
          UserName = 'vTriPLPct'
          CalcOrder = 41
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varTriPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170921
          mmTop = 51065
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 127265
          mmTop = 50271
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
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
          mmLeft = 126471
          mmTop = 119063
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varQuiPLPct: TppVariable
          UserName = 'vQuiPLPct'
          CalcOrder = 42
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varQuiPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170392
          mmTop = 119592
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 51065
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varPk3PLPct: TppVariable
          UserName = 'vPk3PLPct'
          CalcOrder = 43
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk3PLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 51329
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193411
          mmTop = 17727
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varDDPLPct: TppVariable
          UserName = 'vDDPLPct'
          CalcOrder = 44
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239184
          mmTop = 17992
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
        end
        object varTotalPL: TppVariable
          UserName = 'vTotalPL'
          CalcOrder = 45
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varTotalPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 46302
          mmTop = 137584
          mmWidth = 13494
          BandType = 5
          GroupNo = 1
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
          mmHeight = 3175
          mmLeft = 794
          mmTop = 137584
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object lblDDAvgPayout: TppLabel
          UserName = 'lblDDPLPct1'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193146
          mmTop = 30692
          mmWidth = 16933
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193411
          mmTop = 22225
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
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
          mmLeft = 193146
          mmTop = 26723
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varDDNbrWagers: TppVariable
          UserName = 'vDDNbrWagers'
          CalcOrder = 46
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDNbrWagersCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 232040
          mmTop = 22490
          mmWidth = 20373
          BandType = 5
          GroupNo = 1
        end
        object varDDWinPct: TppVariable
          UserName = 'vDDWinPct'
          CalcOrder = 47
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDWinPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 26723
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object varDDAvgPayout: TppVariable
          UserName = 'varDDAvgPayout'
          CalcOrder = 48
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varDDAvgPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 228706
          mmTop = 30956
          mmWidth = 23707
          BandType = 5
          GroupNo = 1
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
          mmTop = 70908
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmTop = 75406
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmTop = 79904
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object varExaPL: TppVariable
          UserName = 'vExaPL'
          CalcOrder = 49
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varExaPLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 176213
          mmTop = 80698
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varExaPayout: TppVariable
          UserName = 'vExaPayout'
          CalcOrder = 50
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varExaPayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 174361
          mmTop = 75936
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object varExaWagered: TppVariable
          UserName = 'vExaWagered'
          CalcOrder = 51
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varExaWageredCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 167746
          mmTop = 71173
          mmWidth = 18521
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 75142
          mmWidth = 28840
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 79375
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object varPk4PL: TppVariable
          UserName = 'vPk4PL'
          CalcOrder = 52
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varPk4PLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 242359
          mmTop = 79375
          mmWidth = 10054
          BandType = 5
          GroupNo = 1
        end
        object varPk4Payout: TppVariable
          UserName = 'vPk4Payout'
          CalcOrder = 53
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk4PayoutCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 240507
          mmTop = 75406
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
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
          mmTop = 84402
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varExaPLPct: TppVariable
          UserName = 'vExaPLPct'
          CalcOrder = 54
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varExaPLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 170921
          mmTop = 85461
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          mmLeft = 192882
          mmTop = 83608
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object varPk4PLPct: TppVariable
          UserName = 'vPk4PLPct'
          CalcOrder = 55
          DataType = dtDouble
          DisplayFormat = '0 %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          OnCalc = varPk4PLPctCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 84138
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
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
          WordWrap = True
          mmHeight = 10319
          mmLeft = 1323
          mmTop = 152136
          mmWidth = 262996
          BandType = 5
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 192882
          mmTop = 55827
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label501'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 192882
          mmTop = 60325
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 192882
          mmTop = 64823
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varPk3NbrWagers: TppVariable
          UserName = 'vDDNbrWagers1'
          CalcOrder = 56
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 232040
          mmTop = 56092
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object varPk3WinPct: TppVariable
          UserName = 'vPk3WinPct'
          CalcOrder = 57
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 235480
          mmTop = 60325
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varPk3AvgPayout: TppVariable
          UserName = 'vPk3AvgPayout'
          CalcOrder = 58
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 230400
          mmTop = 64823
          mmWidth = 22013
          BandType = 5
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 193146
          mmTop = 92075
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label43'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 193146
          mmTop = 96573
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varPk4NbrWagers: TppVariable
          UserName = 'varPk4NbrWagers'
          CalcOrder = 59
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 227013
          mmTop = 88106
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varPk4WinPct: TppVariable
          UserName = 'varPk4WinPct'
          CalcOrder = 60
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
          mmLeft = 232040
          mmTop = 92340
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object varPk4AvgPayout: TppVariable
          UserName = 'varPk4AvgPayout'
          CalcOrder = 61
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 227013
          mmTop = 97367
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 192882
          mmTop = 87842
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'Label51'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 88900
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'Label52'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 93398
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'Label53'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 127529
          mmTop = 98161
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varExaNbrWagers: TppVariable
          UserName = 'varExaNbrWagers'
          CalcOrder = 62
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 89959
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varExaWinPct: TppVariable
          UserName = 'varExaWinPct'
          CalcOrder = 63
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 165947
          mmTop = 94721
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object varExaAvgPayout: TppVariable
          UserName = 'varExaAvgPayout'
          CalcOrder = 64
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 98954
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label54'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 126471
          mmTop = 123296
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'Label55'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 126471
          mmTop = 127529
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'Label56'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 126207
          mmTop = 132821
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varQuiAvgPayout: TppVariable
          UserName = 'varQuiAvgPayout'
          CalcOrder = 65
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160602
          mmTop = 133615
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varQuiWinPct: TppVariable
          UserName = 'varQuiWinPct'
          CalcOrder = 66
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 165153
          mmTop = 128852
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object varQuiNbrWagers: TppVariable
          UserName = 'varQuiNbrWagers'
          CalcOrder = 67
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160338
          mmTop = 123825
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel57: TppLabel
          UserName = 'Label57'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 54504
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel58: TppLabel
          UserName = 'Label58'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 59796
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 64294
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varTriAvgPayout: TppVariable
          UserName = 'varTriAvgPayout'
          CalcOrder = 68
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 65088
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varTriWinPct: TppVariable
          UserName = 'varTriWinPct'
          CalcOrder = 69
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 165947
          mmTop = 60061
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object varTriNbrWagers: TppVariable
          UserName = 'varTriNbrWagers'
          CalcOrder = 70
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 55563
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'Number Of Wagers'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 20638
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          Caption = 'Win Pct'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 127265
          mmTop = 24871
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label61'
          Caption = 'Avg Payout'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 127265
          mmTop = 29898
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object varSfcAvgPayout: TppVariable
          UserName = 'varSfcAvgPayout'
          CalcOrder = 71
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 30692
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object varSfcWinPct: TppVariable
          UserName = 'varSfcWinPct'
          CalcOrder = 72
          DataType = dtDouble
          DisplayFormat = '#######.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 165947
          mmTop = 25929
          mmWidth = 20320
          BandType = 5
          GroupNo = 0
        end
        object varSfcNbrWagers: TppVariable
          UserName = 'varSfcNbrWagers'
          CalcOrder = 73
          DataType = dtInteger
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2999
          mmLeft = 160867
          mmTop = 21167
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object W: TppLabel
          UserName = 'lblTotalPL1'
          Caption = 'W/DD/PK3 P/L'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 143140
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
        end
        object varWinDDPk3PL: TppVariable
          UserName = 'vWinDDPk3PL'
          CalcOrder = 74
          DataType = dtDouble
          DisplayFormat = '$#,0.00;($#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 8
          Font.Style = [fsBold]
          OnCalc = varWinDDPk3PLCalc
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 41275
          mmTop = 142875
          mmWidth = 18521
          BandType = 5
          GroupNo = 0
        end
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
        2020200D0A656E643B0D0A0D0A0000}
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
    DatabaseName = 'dbLast90DaysReport'
    EngineVersion = '4.21 Build 10'
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
    Left = 32
    Top = 216
    MasterDataPipelineName = 'plPrevDayHH'
    object plPrevDayRHppField1: TppField
      FieldAlias = 'TrkCode'
      FieldName = 'TrkCode'
      FieldLength = 0
      DisplayWidth = 0
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
    Top = 193
  end
  object tblWagersByML: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbLast90DaysReport'
    SessionName = 'Default'
    EngineVersion = '4.21 Build 10'
    TableName = 'WagersByML'
    Left = 422
    Top = 200
  end
end
