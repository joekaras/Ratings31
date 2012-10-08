object JoesValueReportForm: TJoesValueReportForm
  Left = 167
  Top = 292
  Width = 701
  Height = 300
  Caption = 'Joes Value Sheet Report'
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
    Width = 684
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
      Width = 663
      Height = 16
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 246
    Width = 693
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 4
    Top = 64
    Width = 684
    Height = 41
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbJoesValueReport: TDBISAMDatabase
    EngineVersion = '4.05'
    Connected = True
    DatabaseName = 'dbJoesValueReport'
    Directory = 'd:\RatingsData31'
    SessionName = 'Default'
    Left = 336
    Top = 16
  end
  object tblRacesMaster: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbJoesValueReport'
    EngineVersion = '4.05'
    IndexName = 'ByEstTimeOfRace'
    TableName = 'Race.DAT'
    Left = 50
    Top = 16
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 32
    Top = 216
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
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object plRacesReportppField4: TppField
      FieldAlias = 'Surface'
      FieldName = 'Surface'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object plRacesReportppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFeet'
      FieldName = 'DistanceInFeet'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object plRacesReportppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInYards'
      FieldName = 'DistanceInYards'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object plRacesReportppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DistanceInFurlongs'
      FieldName = 'DistanceInFurlongs'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object plRacesReportppField8: TppField
      FieldAlias = 'DistanceDesc'
      FieldName = 'DistanceDesc'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object plRacesReportppField9: TppField
      FieldAlias = 'RaceType'
      FieldName = 'RaceType'
      FieldLength = 4
      DisplayWidth = 4
      Position = 8
    end
    object plRacesReportppField10: TppField
      FieldAlias = 'TypeOfRace'
      FieldName = 'TypeOfRace'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
    object plRacesReportppField11: TppField
      FieldAlias = 'RaceTypeDesc'
      FieldName = 'RaceTypeDesc'
      FieldLength = 25
      DisplayWidth = 25
      Position = 10
    end
    object plRacesReportppField12: TppField
      FieldAlias = 'RaceDesc'
      FieldName = 'RaceDesc'
      FieldLength = 250
      DisplayWidth = 250
      Position = 11
    end
    object plRacesReportppField13: TppField
      FieldAlias = 'RaceCondition'
      FieldName = 'RaceCondition'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 12
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField14: TppField
      FieldAlias = 'IsTurfRace'
      FieldName = 'IsTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 13
    end
    object plRacesReportppField15: TppField
      FieldAlias = 'IsRouteRace'
      FieldName = 'IsRouteRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 14
    end
    object plRacesReportppField16: TppField
      FieldAlias = 'IsMaidenSpecialRace'
      FieldName = 'IsMaidenSpecialRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
    object plRacesReportppField17: TppField
      FieldAlias = 'IsMaidenClaimingRace'
      FieldName = 'IsMaidenClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 16
    end
    object plRacesReportppField18: TppField
      FieldAlias = 'IsMaidenOrTurfRace'
      FieldName = 'IsMaidenOrTurfRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 17
    end
    object plRacesReportppField19: TppField
      FieldAlias = 'IsTwoYearOldRace'
      FieldName = 'IsTwoYearOldRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 18
    end
    object plRacesReportppField20: TppField
      FieldAlias = 'IsClaimingRace'
      FieldName = 'IsClaimingRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 19
    end
    object plRacesReportppField21: TppField
      FieldAlias = 'AgeSexRestriction'
      FieldName = 'AgeSexRestriction'
      FieldLength = 3
      DisplayWidth = 3
      Position = 20
    end
    object plRacesReportppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'Purse'
      FieldName = 'Purse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object plRacesReportppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClaimingPrice'
      FieldName = 'ClaimingPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object plRacesReportppField24: TppField
      FieldAlias = 'SimulcastTrkCode'
      FieldName = 'SimulcastTrkCode'
      FieldLength = 3
      DisplayWidth = 3
      Position = 23
    end
    object plRacesReportppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'SimulcastRaceNbr'
      FieldName = 'SimulcastRaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object plRacesReportppField26: TppField
      FieldAlias = 'EstTimeOfRace'
      FieldName = 'EstTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 25
    end
    object plRacesReportppField27: TppField
      FieldAlias = 'LocalTimeOfRace'
      FieldName = 'LocalTimeOfRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 26
    end
    object plRacesReportppField28: TppField
      FieldAlias = 'EstTimeOfFirstRace'
      FieldName = 'EstTimeOfFirstRace'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 27
    end
    object plRacesReportppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'RaceAutoInc'
      FieldName = 'RaceAutoInc'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 28
    end
    object plRacesReportppField30: TppField
      FieldAlias = 'TimeDiff'
      FieldName = 'TimeDiff'
      FieldLength = 0
      DataType = dtTime
      DisplayWidth = 10
      Position = 29
    end
    object plRacesReportppField31: TppField
      FieldAlias = 'WagerType'
      FieldName = 'WagerType'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 30
      Searchable = False
      Sortable = False
    end
    object plRacesReportppField32: TppField
      FieldAlias = 'IsPk3Race'
      FieldName = 'IsPk3Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 31
    end
    object plRacesReportppField33: TppField
      FieldAlias = 'IsPk4Race'
      FieldName = 'IsPk4Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 32
    end
    object plRacesReportppField34: TppField
      FieldAlias = 'IsPk6Race'
      FieldName = 'IsPk6Race'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 33
    end
    object plRacesReportppField35: TppField
      FieldAlias = 'IsTriRace'
      FieldName = 'IsTriRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 34
    end
    object plRacesReportppField36: TppField
      FieldAlias = 'IsSuperRace'
      FieldName = 'IsSuperRace'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 35
    end
    object plRacesReportppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrTriKey'
      FieldName = 'NbrTriKey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 36
    end
    object plRacesReportppField38: TppField
      FieldAlias = 'IsPk3Leg1'
      FieldName = 'IsPk3Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 37
    end
    object plRacesReportppField39: TppField
      FieldAlias = 'IsPk4Leg1'
      FieldName = 'IsPk4Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 38
    end
    object plRacesReportppField40: TppField
      FieldAlias = 'IsPk6Leg1'
      FieldName = 'IsPk6Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 39
    end
    object plRacesReportppField41: TppField
      FieldAlias = 'IsPk9Leg1'
      FieldName = 'IsPk9Leg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 40
    end
    object plRacesReportppField42: TppField
      FieldAlias = 'IsDDLeg1'
      FieldName = 'IsDDLeg1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 41
    end
    object plRacesReportppField43: TppField
      FieldAlias = 'IsChalkValue'
      FieldName = 'IsChalkValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 42
    end
    object plRacesReportppField44: TppField
      FieldAlias = 'IsPlayableValue'
      FieldName = 'IsPlayableValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 43
    end
    object plRacesReportppField45: TppField
      FieldAlias = 'IsFinalValue'
      FieldName = 'IsFinalValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 44
    end
    object plRacesReportppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalPk3Choices'
      FieldName = 'TotalPk3Choices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 45
    end
    object plRacesReportppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3KeyType'
      FieldName = 'Pk3KeyType'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 46
    end
    object plRacesReportppField48: TppField
      FieldAlias = 'Pk3Selected'
      FieldName = 'Pk3Selected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 47
    end
    object plRacesReportppField49: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTriChoices'
      FieldName = 'TotalTriChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 48
    end
    object plRacesReportppField50: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalSuperChoices'
      FieldName = 'TotalSuperChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 49
    end
    object plRacesReportppField51: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalDDChoices'
      FieldName = 'TotalDDChoices'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 50
    end
    object plRacesReportppField52: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 51
    end
    object plRacesReportppField53: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopLastSpeed'
      FieldName = 'TopLastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
    object plRacesReportppField54: TppField
      Alignment = taRightJustify
      FieldAlias = 'TopBackSpeed'
      FieldName = 'TopBackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 53
    end
    object plRacesReportppField55: TppField
      FieldAlias = 'Wager1'
      FieldName = 'Wager1'
      FieldLength = 40
      DisplayWidth = 40
      Position = 54
    end
    object plRacesReportppField56: TppField
      FieldAlias = 'Wager2'
      FieldName = 'Wager2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 55
    end
    object plRacesReportppField57: TppField
      FieldAlias = 'Wager3'
      FieldName = 'Wager3'
      FieldLength = 40
      DisplayWidth = 40
      Position = 56
    end
    object plRacesReportppField58: TppField
      FieldAlias = 'Wager4'
      FieldName = 'Wager4'
      FieldLength = 40
      DisplayWidth = 40
      Position = 57
    end
    object plRacesReportppField59: TppField
      FieldAlias = 'Chalk'
      FieldName = 'Chalk'
      FieldLength = 25
      DisplayWidth = 25
      Position = 58
    end
    object plRacesReportppField60: TppField
      FieldAlias = 'Value'
      FieldName = 'Value'
      FieldLength = 25
      DisplayWidth = 25
      Position = 59
    end
    object plRacesReportppField61: TppField
      FieldAlias = 'Tri'
      FieldName = 'Tri'
      FieldLength = 40
      DisplayWidth = 40
      Position = 60
    end
    object plRacesReportppField62: TppField
      FieldAlias = 'DD'
      FieldName = 'DD'
      FieldLength = 40
      DisplayWidth = 40
      Position = 61
    end
    object plRacesReportppField63: TppField
      FieldAlias = 'Super'
      FieldName = 'Super'
      FieldLength = 40
      DisplayWidth = 40
      Position = 62
    end
    object plRacesReportppField64: TppField
      FieldAlias = 'Exacta'
      FieldName = 'Exacta'
      FieldLength = 40
      DisplayWidth = 40
      Position = 63
    end
    object plRacesReportppField65: TppField
      FieldAlias = 'ParTime'
      FieldName = 'ParTime'
      FieldLength = 10
      DisplayWidth = 10
      Position = 64
    end
    object plRacesReportppField66: TppField
      FieldAlias = 'IsCreateValue'
      FieldName = 'IsCreateValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 65
    end
    object plRacesReportppField67: TppField
      FieldAlias = 'IsCreateTip'
      FieldName = 'IsCreateTip'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 66
    end
    object plRacesReportppField68: TppField
      FieldAlias = 'IsCreatePk3'
      FieldName = 'IsCreatePk3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 67
    end
    object plRacesReportppField69: TppField
      FieldAlias = 'IsCreateDetail'
      FieldName = 'IsCreateDetail'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 68
    end
    object plRacesReportppField70: TppField
      FieldAlias = 'IsCreateAlt'
      FieldName = 'IsCreateAlt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 69
    end
    object plRacesReportppField71: TppField
      FieldAlias = 'IsTipSheetSelected'
      FieldName = 'IsTipSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 70
    end
  end
  object tblEntries: TDBISAMTable
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = '(IsTipSheetSelected = True)  '
    Filtered = True
    DatabaseName = 'dbJoesValueReport'
    EngineVersion = '4.05'
    IndexName = 'ByFinalSheetOrderRank'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'ENTRY.DAT'
    Left = 158
    Top = 95
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 118
    Top = 158
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    UserName = 'plEntries'
    OnRecordPositionChange = plEntriesRecordPositionChange
    Left = 318
    Top = 178
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
      Alignment = taRightJustify
      FieldAlias = 'RaceNbr'
      FieldName = 'RaceNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object plEntriesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PostPos'
      FieldName = 'PostPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object plEntriesppField5: TppField
      FieldAlias = 'Entry'
      FieldName = 'Entry'
      FieldLength = 5
      DisplayWidth = 5
      Position = 4
    end
    object plEntriesppField6: TppField
      FieldAlias = 'ProgramNbr'
      FieldName = 'ProgramNbr'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object plEntriesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'ProgramNbrSort'
      FieldName = 'ProgramNbrSort'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object plEntriesppField8: TppField
      FieldAlias = 'MorningLineDesc'
      FieldName = 'MorningLineDesc'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object plEntriesppField9: TppField
      FieldAlias = 'HorseName'
      FieldName = 'HorseName'
      FieldLength = 25
      DisplayWidth = 25
      Position = 8
    end
    object plEntriesppField10: TppField
      FieldAlias = 'Med'
      FieldName = 'Med'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object plEntriesppField11: TppField
      FieldAlias = 'IsDebut'
      FieldName = 'IsDebut'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 10
    end
    object plEntriesppField12: TppField
      FieldAlias = 'IsDebutTwo'
      FieldName = 'IsDebutTwo'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 11
    end
    object plEntriesppField13: TppField
      FieldAlias = 'TurfIndicator'
      FieldName = 'TurfIndicator'
      FieldLength = 13
      DisplayWidth = 13
      Position = 12
    end
    object plEntriesppField14: TppField
      FieldAlias = 'DebutIndicator'
      FieldName = 'DebutIndicator'
      FieldLength = 14
      DisplayWidth = 14
      Position = 13
    end
    object plEntriesppField15: TppField
      FieldAlias = 'RouteIndicator'
      FieldName = 'RouteIndicator'
      FieldLength = 14
      DisplayWidth = 14
      Position = 14
    end
    object plEntriesppField16: TppField
      FieldAlias = 'MudIndicator'
      FieldName = 'MudIndicator'
      FieldLength = 12
      DisplayWidth = 12
      Position = 15
    end
    object plEntriesppField17: TppField
      FieldAlias = 'IsScratched'
      FieldName = 'IsScratched'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 16
    end
    object plEntriesppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'Age'
      FieldName = 'Age'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object plEntriesppField19: TppField
      FieldAlias = 'Sex'
      FieldName = 'Sex'
      FieldLength = 3
      DisplayWidth = 3
      Position = 18
    end
    object plEntriesppField20: TppField
      FieldAlias = 'Color'
      FieldName = 'Color'
      FieldLength = 10
      DisplayWidth = 10
      Position = 19
    end
    object plEntriesppField21: TppField
      FieldAlias = 'Weight'
      FieldName = 'Weight'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object plEntriesppField22: TppField
      FieldAlias = 'Trainer'
      FieldName = 'Trainer'
      FieldLength = 30
      DisplayWidth = 30
      Position = 21
    end
    object plEntriesppField23: TppField
      FieldAlias = 'Jockey'
      FieldName = 'Jockey'
      FieldLength = 25
      DisplayWidth = 25
      Position = 22
    end
    object plEntriesppField24: TppField
      FieldAlias = 'Owner'
      FieldName = 'Owner'
      FieldLength = 45
      DisplayWidth = 45
      Position = 23
    end
    object plEntriesppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'OwnerSoundex'
      FieldName = 'OwnerSoundex'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object plEntriesppField26: TppField
      FieldAlias = 'Breeder'
      FieldName = 'Breeder'
      FieldLength = 67
      DisplayWidth = 67
      Position = 25
    end
    object plEntriesppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'BreederSoundex'
      FieldName = 'BreederSoundex'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object plEntriesppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds0To2Starts'
      FieldName = 'TotalTrnOdds0To2Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 27
    end
    object plEntriesppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds0To2Wins'
      FieldName = 'TotalTrnOdds0To2Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 28
    end
    object plEntriesppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds0To2WinPct'
      FieldName = 'TotalTrnOdds0To2WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object plEntriesppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds2To5Starts'
      FieldName = 'TotalTrnOdds2To5Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 30
    end
    object plEntriesppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds2To5Wins'
      FieldName = 'TotalTrnOdds2To5Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 31
    end
    object plEntriesppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds2To5WinPct'
      FieldName = 'TotalTrnOdds2To5WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object plEntriesppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds6To9Starts'
      FieldName = 'TotalTrnOdds6To9Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object plEntriesppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds6To9Wins'
      FieldName = 'TotalTrnOdds6To9Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 34
    end
    object plEntriesppField36: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds6To9WinPct'
      FieldName = 'TotalTrnOdds6To9WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 35
    end
    object plEntriesppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds10PlusStarts'
      FieldName = 'TotalTrnOdds10PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 36
    end
    object plEntriesppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds10PlusWins'
      FieldName = 'TotalTrnOdds10PlusWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object plEntriesppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOdds10PlusWinPct'
      FieldName = 'TotalTrnOdds10PlusWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object plEntriesppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnStarts'
      FieldName = 'TotalTrnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 39
    end
    object plEntriesppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWins'
      FieldName = 'TotalTrnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object plEntriesppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPct'
      FieldName = 'TotalTrnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 41
    end
    object plEntriesppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPctRank'
      FieldName = 'TotalTrnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 42
    end
    object plEntriesppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayStarts'
      FieldName = 'TrnTodayStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 43
    end
    object plEntriesppField45: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWins'
      FieldName = 'TrnTodayWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 44
    end
    object plEntriesppField46: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPct'
      FieldName = 'TrnTodayWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 45
    end
    object plEntriesppField47: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPctRank'
      FieldName = 'TrnTodayWinPctRank'
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
      FieldAlias = 'TotalTrnDaysStarts'
      FieldName = 'TotalTrnDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
    object plEntriesppField57: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWins'
      FieldName = 'TotalTrnDaysWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 56
    end
    object plEntriesppField58: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWinPct'
      FieldName = 'TotalTrnDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 57
    end
    object plEntriesppField59: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWinPctRank'
      FieldName = 'TotalTrnDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 58
    end
    object plEntriesppField60: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysStarts'
      FieldName = 'TotalTrnJkyDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 59
    end
    object plEntriesppField61: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWins'
      FieldName = 'TotalTrnJkyDaysWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 60
    end
    object plEntriesppField62: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWinPct'
      FieldName = 'TotalTrnJkyDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 61
    end
    object plEntriesppField63: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWinPctRank'
      FieldName = 'TotalTrnJkyDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 62
    end
    object plEntriesppField64: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn17Starts'
      FieldName = 'TotalTrn17Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 63
    end
    object plEntriesppField65: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn17Wins'
      FieldName = 'TotalTrn17Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 64
    end
    object plEntriesppField66: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn17WinPct'
      FieldName = 'TotalTrn17WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 65
    end
    object plEntriesppField67: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork17Starts'
      FieldName = 'TotalTrnWork17Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 66
    end
    object plEntriesppField68: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork17Wins'
      FieldName = 'TotalTrnWork17Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 67
    end
    object plEntriesppField69: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork17WinPct'
      FieldName = 'TotalTrnWork17WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 68
    end
    object plEntriesppField70: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn814Starts'
      FieldName = 'TotalTrn814Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 69
    end
    object plEntriesppField71: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn814Wins'
      FieldName = 'TotalTrn814Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 70
    end
    object plEntriesppField72: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn814WinPct'
      FieldName = 'TotalTrn814WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 71
    end
    object plEntriesppField73: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1521Starts'
      FieldName = 'TotalTrn1521Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 72
    end
    object plEntriesppField74: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1521Wins'
      FieldName = 'TotalTrn1521Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 73
    end
    object plEntriesppField75: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1521WinPct'
      FieldName = 'TotalTrn1521WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 74
    end
    object plEntriesppField76: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2230Starts'
      FieldName = 'TotalTrn2230Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 75
    end
    object plEntriesppField77: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2230Wins'
      FieldName = 'TotalTrn2230Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 76
    end
    object plEntriesppField78: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2230WinPct'
      FieldName = 'TotalTrn2230WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 77
    end
    object plEntriesppField79: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork814Starts'
      FieldName = 'TotalTrnWork814Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 78
    end
    object plEntriesppField80: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork814Wins'
      FieldName = 'TotalTrnWork814Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 79
    end
    object plEntriesppField81: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork814WinPct'
      FieldName = 'TotalTrnWork814WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 80
    end
    object plEntriesppField82: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1521Starts'
      FieldName = 'TotalTrnWork1521Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 81
    end
    object plEntriesppField83: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1521Wins'
      FieldName = 'TotalTrnWork1521Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 82
    end
    object plEntriesppField84: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork1521WinPct'
      FieldName = 'TotalTrnWork1521WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 83
    end
    object plEntriesppField85: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork2230Starts'
      FieldName = 'TotalTrnWork2230Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 84
    end
    object plEntriesppField86: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork2230Wins'
      FieldName = 'TotalTrnWork2230Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 85
    end
    object plEntriesppField87: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork2230WinPct'
      FieldName = 'TotalTrnWork2230WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 86
    end
    object plEntriesppField88: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn3160Starts'
      FieldName = 'TotalTrn3160Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 87
    end
    object plEntriesppField89: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn3160Wins'
      FieldName = 'TotalTrn3160Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 88
    end
    object plEntriesppField90: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn3160WinPct'
      FieldName = 'TotalTrn3160WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 89
    end
    object plEntriesppField91: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork3160Starts'
      FieldName = 'TotalTrnWork3160Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 90
    end
    object plEntriesppField92: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork3160Wins'
      FieldName = 'TotalTrnWork3160Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 91
    end
    object plEntriesppField93: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork3160WinPct'
      FieldName = 'TotalTrnWork3160WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 92
    end
    object plEntriesppField94: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn6190Starts'
      FieldName = 'TotalTrn6190Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 93
    end
    object plEntriesppField95: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn6190Wins'
      FieldName = 'TotalTrn6190Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 94
    end
    object plEntriesppField96: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn6190WinPct'
      FieldName = 'TotalTrn6190WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 95
    end
    object plEntriesppField97: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork6190Starts'
      FieldName = 'TotalTrnWork6190Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 96
    end
    object plEntriesppField98: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork6190Wins'
      FieldName = 'TotalTrnWork6190Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 97
    end
    object plEntriesppField99: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork6190WinPct'
      FieldName = 'TotalTrnWork6190WinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 98
    end
    object plEntriesppField100: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn91PlusStarts'
      FieldName = 'TotalTrn91PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 99
    end
    object plEntriesppField101: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn91PlusWins'
      FieldName = 'TotalTrn91PlusWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 100
    end
    object plEntriesppField102: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn91PlusWinPct'
      FieldName = 'TotalTrn91PlusWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 101
    end
    object plEntriesppField103: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork91PlusStarts'
      FieldName = 'TotalTrnWork91PlusStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 102
    end
    object plEntriesppField104: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork91PlusWins'
      FieldName = 'TotalTrnWork91PlusWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 103
    end
    object plEntriesppField105: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWork91PlusWinPct'
      FieldName = 'TotalTrnWork91PlusWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 104
    end
    object plEntriesppField106: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutStarts'
      FieldName = 'TotalTrnDebutStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 105
    end
    object plEntriesppField107: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutWins'
      FieldName = 'TotalTrnDebutWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 106
    end
    object plEntriesppField108: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutWinPct'
      FieldName = 'TotalTrnDebutWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 107
    end
    object plEntriesppField109: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoStarts'
      FieldName = 'TotalTrnDebutTwoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 108
    end
    object plEntriesppField110: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoWins'
      FieldName = 'TotalTrnDebutTwoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 109
    end
    object plEntriesppField111: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDebutTwoWinPct'
      FieldName = 'TotalTrnDebutTwoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 110
    end
    object plEntriesppField112: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyStarts'
      FieldName = 'TotalJkyStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 111
    end
    object plEntriesppField113: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWins'
      FieldName = 'TotalJkyWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 112
    end
    object plEntriesppField114: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPct'
      FieldName = 'TotalJkyWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 113
    end
    object plEntriesppField115: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPctRank'
      FieldName = 'TotalJkyWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 114
    end
    object plEntriesppField116: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysStarts'
      FieldName = 'TotalJkyDaysStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 115
    end
    object plEntriesppField117: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWins'
      FieldName = 'TotalJkyDaysWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 116
    end
    object plEntriesppField118: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPctRank'
      FieldName = 'TotalJkyDaysWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 117
    end
    object plEntriesppField119: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPct'
      FieldName = 'TotalJkyDaysWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 118
    end
    object plEntriesppField120: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsStarts'
      FieldName = 'TotalJkyOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 119
    end
    object plEntriesppField121: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWins'
      FieldName = 'TotalJkyOddsWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 120
    end
    object plEntriesppField122: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPct'
      FieldName = 'TotalJkyOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 121
    end
    object plEntriesppField123: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPctRank'
      FieldName = 'TotalJkyOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 122
    end
    object plEntriesppField124: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnStarts'
      FieldName = 'TotalOwnStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 123
    end
    object plEntriesppField125: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWins'
      FieldName = 'TotalOwnWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 124
    end
    object plEntriesppField126: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPct'
      FieldName = 'TotalOwnWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 125
    end
    object plEntriesppField127: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRank'
      FieldName = 'TotalOwnWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 126
    end
    object plEntriesppField128: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdStarts'
      FieldName = 'TotalBrdStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 127
    end
    object plEntriesppField129: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWins'
      FieldName = 'TotalBrdWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 128
    end
    object plEntriesppField130: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPct'
      FieldName = 'TotalBrdWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 129
    end
    object plEntriesppField131: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPctRank'
      FieldName = 'TotalBrdWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 130
    end
    object plEntriesppField132: TppField
      FieldAlias = 'BredIn'
      FieldName = 'BredIn'
      FieldLength = 6
      DisplayWidth = 6
      Position = 131
    end
    object plEntriesppField133: TppField
      FieldAlias = 'Sire'
      FieldName = 'Sire'
      FieldLength = 16
      DisplayWidth = 16
      Position = 132
    end
    object plEntriesppField134: TppField
      FieldAlias = 'Dam'
      FieldName = 'Dam'
      FieldLength = 16
      DisplayWidth = 16
      Position = 133
    end
    object plEntriesppField135: TppField
      FieldAlias = 'DamSire'
      FieldName = 'DamSire'
      FieldLength = 16
      DisplayWidth = 16
      Position = 134
    end
    object plEntriesppField136: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLast'
      FieldName = 'DaysLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 135
    end
    object plEntriesppField137: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork'
      FieldName = 'DaysLastWork'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 136
    end
    object plEntriesppField138: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork2'
      FieldName = 'DaysLastWork2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 137
    end
    object plEntriesppField139: TppField
      Alignment = taRightJustify
      FieldAlias = 'DaysLastWork3'
      FieldName = 'DaysLastWork3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 138
    end
    object plEntriesppField140: TppField
      Alignment = taRightJustify
      FieldAlias = 'NbrWorksLast'
      FieldName = 'NbrWorksLast'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 139
    end
    object plEntriesppField141: TppField
      Alignment = taRightJustify
      FieldAlias = 'StartsWorks21'
      FieldName = 'StartsWorks21'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 140
    end
    object plEntriesppField142: TppField
      FieldAlias = 'LastTrkCode'
      FieldName = 'LastTrkCode'
      FieldLength = 11
      DisplayWidth = 11
      Position = 141
    end
    object plEntriesppField143: TppField
      FieldAlias = 'LastRaceType'
      FieldName = 'LastRaceType'
      FieldLength = 12
      DisplayWidth = 12
      Position = 142
    end
    object plEntriesppField144: TppField
      FieldAlias = 'LastSurf'
      FieldName = 'LastSurf'
      FieldLength = 8
      DisplayWidth = 8
      Position = 143
    end
    object plEntriesppField145: TppField
      FieldAlias = 'LastRaceConditions'
      FieldName = 'LastRaceConditions'
      FieldLength = 20
      DisplayWidth = 20
      Position = 144
    end
    object plEntriesppField146: TppField
      FieldAlias = 'LastDistanceDesc'
      FieldName = 'LastDistanceDesc'
      FieldLength = 16
      DisplayWidth = 16
      Position = 145
    end
    object plEntriesppField147: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastDistance'
      FieldName = 'LastDistance'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 146
    end
    object plEntriesppField148: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastFinishPos'
      FieldName = 'LastFinishPos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 147
    end
    object plEntriesppField149: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastBL'
      FieldName = 'LastBL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 148
    end
    object plEntriesppField150: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastOdds'
      FieldName = 'LastOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 149
    end
    object plEntriesppField151: TppField
      FieldAlias = 'LastFavoriteIndicator'
      FieldName = 'LastFavoriteIndicator'
      FieldLength = 21
      DisplayWidth = 21
      Position = 150
    end
    object plEntriesppField152: TppField
      FieldAlias = 'LastDQIndicator'
      FieldName = 'LastDQIndicator'
      FieldLength = 15
      DisplayWidth = 15
      Position = 151
    end
    object plEntriesppField153: TppField
      FieldAlias = 'LastJockey'
      FieldName = 'LastJockey'
      FieldLength = 15
      DisplayWidth = 15
      Position = 152
    end
    object plEntriesppField154: TppField
      FieldAlias = 'LastComment'
      FieldName = 'LastComment'
      FieldLength = 22
      DisplayWidth = 22
      Position = 153
    end
    object plEntriesppField155: TppField
      FieldAlias = 'LastComment2'
      FieldName = 'LastComment2'
      FieldLength = 67
      DisplayWidth = 67
      Position = 154
    end
    object plEntriesppField156: TppField
      FieldAlias = 'LastTrkCond'
      FieldName = 'LastTrkCond'
      FieldLength = 11
      DisplayWidth = 11
      Position = 155
    end
    object plEntriesppField157: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClmPrice'
      FieldName = 'LastClmPrice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 156
    end
    object plEntriesppField158: TppField
      FieldAlias = 'LastClaimed'
      FieldName = 'LastClaimed'
      FieldLength = 1
      DisplayWidth = 1
      Position = 157
    end
    object plEntriesppField159: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPurse'
      FieldName = 'LastPurse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 158
    end
    object plEntriesppField160: TppField
      FieldAlias = 'LastTopFinish1'
      FieldName = 'LastTopFinish1'
      FieldLength = 30
      DisplayWidth = 30
      Position = 159
    end
    object plEntriesppField161: TppField
      FieldAlias = 'LastTopFinish2'
      FieldName = 'LastTopFinish2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 160
    end
    object plEntriesppField162: TppField
      FieldAlias = 'LastTopFinish3'
      FieldName = 'LastTopFinish3'
      FieldLength = 30
      DisplayWidth = 30
      Position = 161
    end
    object plEntriesppField163: TppField
      FieldAlias = 'LastRaceDesc'
      FieldName = 'LastRaceDesc'
      FieldLength = 75
      DisplayWidth = 75
      Position = 162
    end
    object plEntriesppField164: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastClassRating'
      FieldName = 'LastClassRating'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 163
    end
    object plEntriesppField165: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPace1'
      FieldName = 'LastPace1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 164
    end
    object plEntriesppField166: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastPace2'
      FieldName = 'LastPace2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 165
    end
    object plEntriesppField167: TppField
      FieldAlias = 'LastDay'
      FieldName = 'LastDay'
      FieldLength = 2
      DisplayWidth = 2
      Position = 166
    end
    object plEntriesppField168: TppField
      FieldAlias = 'LastMonthDesc'
      FieldName = 'LastMonthDesc'
      FieldLength = 3
      DisplayWidth = 3
      Position = 167
    end
    object plEntriesppField169: TppField
      FieldAlias = 'LastYear'
      FieldName = 'LastYear'
      FieldLength = 4
      DisplayWidth = 4
      Position = 168
    end
    object plEntriesppField170: TppField
      FieldAlias = 'LastRaceNbr'
      FieldName = 'LastRaceNbr'
      FieldLength = 2
      DisplayWidth = 2
      Position = 169
    end
    object plEntriesppField171: TppField
      FieldAlias = 'LastCall1st'
      FieldName = 'LastCall1st'
      FieldLength = 7
      DisplayWidth = 7
      Position = 170
    end
    object plEntriesppField172: TppField
      FieldAlias = 'LastCall2nd'
      FieldName = 'LastCall2nd'
      FieldLength = 7
      DisplayWidth = 7
      Position = 171
    end
    object plEntriesppField173: TppField
      FieldAlias = 'LastCall3rd'
      FieldName = 'LastCall3rd'
      FieldLength = 7
      DisplayWidth = 7
      Position = 172
    end
    object plEntriesppField174: TppField
      FieldAlias = 'LastFinCall'
      FieldName = 'LastFinCall'
      FieldLength = 7
      DisplayWidth = 7
      Position = 173
    end
    object plEntriesppField175: TppField
      FieldAlias = 'LastPostPos'
      FieldName = 'LastPostPos'
      FieldLength = 3
      DisplayWidth = 3
      Position = 174
    end
    object plEntriesppField176: TppField
      FieldAlias = 'LastGateBreak'
      FieldName = 'LastGateBreak'
      FieldLength = 2
      DisplayWidth = 2
      Position = 175
    end
    object plEntriesppField177: TppField
      FieldAlias = 'LastLen1Back'
      FieldName = 'LastLen1Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 176
    end
    object plEntriesppField178: TppField
      FieldAlias = 'LastLen2Back'
      FieldName = 'LastLen2Back'
      FieldLength = 7
      DisplayWidth = 7
      Position = 177
    end
    object plEntriesppField179: TppField
      FieldAlias = 'LastStLenBack'
      FieldName = 'LastStLenBack'
      FieldLength = 7
      DisplayWidth = 7
      Position = 178
    end
    object plEntriesppField180: TppField
      FieldAlias = 'LastFinishBeaten'
      FieldName = 'LastFinishBeaten'
      FieldLength = 7
      DisplayWidth = 7
      Position = 179
    end
    object plEntriesppField181: TppField
      FieldAlias = 'LastEquip'
      FieldName = 'LastEquip'
      FieldLength = 7
      DisplayWidth = 7
      Position = 180
    end
    object plEntriesppField182: TppField
      FieldAlias = 'LastWeight'
      FieldName = 'LastWeight'
      FieldLength = 3
      DisplayWidth = 3
      Position = 181
    end
    object plEntriesppField183: TppField
      FieldAlias = 'LastTrackVariant'
      FieldName = 'LastTrackVariant'
      FieldLength = 3
      DisplayWidth = 3
      Position = 182
    end
    object plEntriesppField184: TppField
      FieldAlias = 'LastClass'
      FieldName = 'LastClass'
      FieldLength = 3
      DisplayWidth = 3
      Position = 183
    end
    object plEntriesppField185: TppField
      FieldAlias = 'LastHorseTime'
      FieldName = 'LastHorseTime'
      FieldLength = 7
      DisplayWidth = 7
      Position = 184
    end
    object plEntriesppField186: TppField
      FieldAlias = 'LastWinTime'
      FieldName = 'LastWinTime'
      FieldLength = 7
      DisplayWidth = 7
      Position = 185
    end
    object plEntriesppField187: TppField
      FieldAlias = 'LastSRWinner'
      FieldName = 'LastSRWinner'
      FieldLength = 3
      DisplayWidth = 3
      Position = 186
    end
    object plEntriesppField188: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfStarts'
      FieldName = 'TotalTrnTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 187
    end
    object plEntriesppField189: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWins'
      FieldName = 'TotalTrnTurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 188
    end
    object plEntriesppField190: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPct'
      FieldName = 'TotalTrnTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 189
    end
    object plEntriesppField191: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPctRank'
      FieldName = 'TotalTrnTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 190
    end
    object plEntriesppField192: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10Starts'
      FieldName = 'TotalTrn10Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 191
    end
    object plEntriesppField193: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10Wins'
      FieldName = 'TotalTrn10Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 192
    end
    object plEntriesppField194: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10WinPct'
      FieldName = 'TotalTrn10WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 193
    end
    object plEntriesppField195: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10WinPctRank'
      FieldName = 'TotalTrn10WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 194
    end
    object plEntriesppField196: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30Starts'
      FieldName = 'TotalTrn30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 195
    end
    object plEntriesppField197: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30Wins'
      FieldName = 'TotalTrn30Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 196
    end
    object plEntriesppField198: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPct'
      FieldName = 'TotalTrn30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 197
    end
    object plEntriesppField199: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPctRank'
      FieldName = 'TotalTrn30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 198
    end
    object plEntriesppField200: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmStarts'
      FieldName = 'TotalTrnAftClmStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 199
    end
    object plEntriesppField201: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmWins'
      FieldName = 'TotalTrnAftClmWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 200
    end
    object plEntriesppField202: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnAftClmWinPct'
      FieldName = 'TotalTrnAftClmWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 201
    end
    object plEntriesppField203: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsStarts'
      FieldName = 'TotalTrnOddsStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 202
    end
    object plEntriesppField204: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWins'
      FieldName = 'TotalTrnOddsWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 203
    end
    object plEntriesppField205: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPct'
      FieldName = 'TotalTrnOddsWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 204
    end
    object plEntriesppField206: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPctRank'
      FieldName = 'TotalTrnOddsWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 205
    end
    object plEntriesppField207: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfStarts'
      FieldName = 'TotalJkyTurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 206
    end
    object plEntriesppField208: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfWins'
      FieldName = 'TotalJkyTurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 207
    end
    object plEntriesppField209: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyTurfWinPct'
      FieldName = 'TotalJkyTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 208
    end
    object plEntriesppField210: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10Starts'
      FieldName = 'TotalJky10Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 209
    end
    object plEntriesppField211: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10Wins'
      FieldName = 'TotalJky10Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 210
    end
    object plEntriesppField212: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPct'
      FieldName = 'TotalJky10WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 211
    end
    object plEntriesppField213: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPctRank'
      FieldName = 'TotalJky10WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 212
    end
    object plEntriesppField214: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30Starts'
      FieldName = 'TotalJky30Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 213
    end
    object plEntriesppField215: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30Wins'
      FieldName = 'TotalJky30Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 214
    end
    object plEntriesppField216: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPct'
      FieldName = 'TotalJky30WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 215
    end
    object plEntriesppField217: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPctRank'
      FieldName = 'TotalJky30WinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 216
    end
    object plEntriesppField218: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stStarts'
      FieldName = 'TotalTrn1stStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 217
    end
    object plEntriesppField219: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stWins'
      FieldName = 'TotalTrn1stWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 218
    end
    object plEntriesppField220: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn1stWinPct'
      FieldName = 'TotalTrn1stWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 219
    end
    object plEntriesppField221: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsLe5Starts'
      FieldName = 'TotalTrnOddsLe5Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 220
    end
    object plEntriesppField222: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsLe5Wins'
      FieldName = 'TotalTrnOddsLe5Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 221
    end
    object plEntriesppField223: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsLe5WinPct'
      FieldName = 'TotalTrnOddsLe5WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 222
    end
    object plEntriesppField224: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsGt5Starts'
      FieldName = 'TotalTrnOddsGt5Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 223
    end
    object plEntriesppField225: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsGt5Wins'
      FieldName = 'TotalTrnOddsGt5Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 224
    end
    object plEntriesppField226: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsGt5WinPct'
      FieldName = 'TotalTrnOddsGt5WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 225
    end
    object plEntriesppField227: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFavStarts'
      FieldName = 'TotalTrnFavStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 226
    end
    object plEntriesppField228: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFavWins'
      FieldName = 'TotalTrnFavWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 227
    end
    object plEntriesppField229: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnFavWinPct'
      FieldName = 'TotalTrnFavWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 228
    end
    object plEntriesppField230: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoStarts'
      FieldName = 'TotalTrn2yoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 229
    end
    object plEntriesppField231: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoWins'
      FieldName = 'TotalTrn2yoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 230
    end
    object plEntriesppField232: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn2yoWinPct'
      FieldName = 'TotalTrn2yoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 231
    end
    object plEntriesppField233: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsLe5Starts'
      FieldName = 'TotalJkyOddsLe5Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 232
    end
    object plEntriesppField234: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsLe5Wins'
      FieldName = 'TotalJkyOddsLe5Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 233
    end
    object plEntriesppField235: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsLe5WinPct'
      FieldName = 'TotalJkyOddsLe5WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 234
    end
    object plEntriesppField236: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsGt5Starts'
      FieldName = 'TotalJkyOddsGt5Starts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 235
    end
    object plEntriesppField237: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsGt5Wins'
      FieldName = 'TotalJkyOddsGt5Wins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 236
    end
    object plEntriesppField238: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsGt5WinPct'
      FieldName = 'TotalJkyOddsGt5WinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 237
    end
    object plEntriesppField239: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyFavStarts'
      FieldName = 'TotalJkyFavStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 238
    end
    object plEntriesppField240: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyFavWins'
      FieldName = 'TotalJkyFavWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 239
    end
    object plEntriesppField241: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyFavWinPct'
      FieldName = 'TotalJkyFavWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 240
    end
    object plEntriesppField242: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoStarts'
      FieldName = 'TotalJky2yoStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 241
    end
    object plEntriesppField243: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoWins'
      FieldName = 'TotalJky2yoWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 242
    end
    object plEntriesppField244: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky2yoWinPct'
      FieldName = 'TotalJky2yoWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 243
    end
    object plEntriesppField245: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnDirtToTurfWinPct'
      FieldName = 'TrnDirtToTurfWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 244
    end
    object plEntriesppField246: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTurfToDirtWinPct'
      FieldName = 'TrnTurfToDirtWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 245
    end
    object plEntriesppField247: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnRteToSprWinPct'
      FieldName = 'TrnRteToSprWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 246
    end
    object plEntriesppField248: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnSprToRteWinPct'
      FieldName = 'TrnSprToRteWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 247
    end
    object plEntriesppField249: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnStkWinPct'
      FieldName = 'TrnStkWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 248
    end
    object plEntriesppField250: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnClmWinPct'
      FieldName = 'TrnClmWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 249
    end
    object plEntriesppField251: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnMdnWinPct'
      FieldName = 'TrnMdnWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 250
    end
    object plEntriesppField252: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnAlwWinPct'
      FieldName = 'TrnAlwWinPct'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 251
    end
    object plEntriesppField253: TppField
      FieldAlias = 'FinalOrderKey'
      FieldName = 'FinalOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 252
    end
    object plEntriesppField254: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalStarts'
      FieldName = 'FinalStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 253
    end
    object plEntriesppField255: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWins'
      FieldName = 'FinalWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 254
    end
    object plEntriesppField256: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWinPct'
      FieldName = 'FinalWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 255
    end
    object plEntriesppField257: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalWinPctRank'
      FieldName = 'FinalWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 256
    end
    object plEntriesppField258: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalAvgOdds'
      FieldName = 'FinalAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 257
    end
    object plEntriesppField259: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalTotalProfitLoss'
      FieldName = 'FinalTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 258
    end
    object plEntriesppField260: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalValueBet'
      FieldName = 'FinalValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 259
    end
    object plEntriesppField261: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalValueBetRank'
      FieldName = 'FinalValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 260
    end
    object plEntriesppField262: TppField
      FieldAlias = 'PrimaryOrderKey'
      FieldName = 'PrimaryOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 261
    end
    object plEntriesppField263: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryStarts'
      FieldName = 'PrimaryStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 262
    end
    object plEntriesppField264: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWins'
      FieldName = 'PrimaryWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 263
    end
    object plEntriesppField265: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWinPct'
      FieldName = 'PrimaryWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 264
    end
    object plEntriesppField266: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryWinPctRank'
      FieldName = 'PrimaryWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 265
    end
    object plEntriesppField267: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryAvgOdds'
      FieldName = 'PrimaryAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 266
    end
    object plEntriesppField268: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryTotalProfitLoss'
      FieldName = 'PrimaryTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 267
    end
    object plEntriesppField269: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryValueBet'
      FieldName = 'PrimaryValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 268
    end
    object plEntriesppField270: TppField
      Alignment = taRightJustify
      FieldAlias = 'PrimaryValueBetRank'
      FieldName = 'PrimaryValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 269
    end
    object plEntriesppField271: TppField
      FieldAlias = 'SecondaryOrderKey'
      FieldName = 'SecondaryOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 270
    end
    object plEntriesppField272: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryStarts'
      FieldName = 'SecondaryStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 271
    end
    object plEntriesppField273: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWins'
      FieldName = 'SecondaryWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 272
    end
    object plEntriesppField274: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWinPct'
      FieldName = 'SecondaryWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 273
    end
    object plEntriesppField275: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryWinPctRank'
      FieldName = 'SecondaryWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 274
    end
    object plEntriesppField276: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryAvgOdds'
      FieldName = 'SecondaryAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 275
    end
    object plEntriesppField277: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryTotalProfitLoss'
      FieldName = 'SecondaryTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 276
    end
    object plEntriesppField278: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryValueBet'
      FieldName = 'SecondaryValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 277
    end
    object plEntriesppField279: TppField
      Alignment = taRightJustify
      FieldAlias = 'SecondaryValueBetRank'
      FieldName = 'SecondaryValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 278
    end
    object plEntriesppField280: TppField
      FieldAlias = 'DefaultOrderKey'
      FieldName = 'DefaultOrderKey'
      FieldLength = 50
      DisplayWidth = 50
      Position = 279
    end
    object plEntriesppField281: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultStarts'
      FieldName = 'DefaultStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 280
    end
    object plEntriesppField282: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWins'
      FieldName = 'DefaultWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 281
    end
    object plEntriesppField283: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWinPct'
      FieldName = 'DefaultWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 282
    end
    object plEntriesppField284: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultWinPctRank'
      FieldName = 'DefaultWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 283
    end
    object plEntriesppField285: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultAvgOdds'
      FieldName = 'DefaultAvgOdds'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 284
    end
    object plEntriesppField286: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultTotalProfitLoss'
      FieldName = 'DefaultTotalProfitLoss'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 285
    end
    object plEntriesppField287: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultValueBet'
      FieldName = 'DefaultValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 286
    end
    object plEntriesppField288: TppField
      Alignment = taRightJustify
      FieldAlias = 'DefaultValueBetRank'
      FieldName = 'DefaultValueBetRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 287
    end
    object plEntriesppField289: TppField
      FieldAlias = 'IsDirtToTurf'
      FieldName = 'IsDirtToTurf'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 288
    end
    object plEntriesppField290: TppField
      FieldAlias = 'IsTurfToDirt'
      FieldName = 'IsTurfToDirt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 289
    end
    object plEntriesppField291: TppField
      FieldAlias = 'IsSprToRte'
      FieldName = 'IsSprToRte'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 290
    end
    object plEntriesppField292: TppField
      FieldAlias = 'IsRteToSpr'
      FieldName = 'IsRteToSpr'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 291
    end
    object plEntriesppField293: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllWinPct'
      FieldName = 'DamAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 292
    end
    object plEntriesppField294: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllTurfWinPct'
      FieldName = 'DamAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 293
    end
    object plEntriesppField295: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllMudWinPct'
      FieldName = 'DamAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 294
    end
    object plEntriesppField296: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllWinPct'
      FieldName = 'DamSireAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 295
    end
    object plEntriesppField297: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllTurfWinPct'
      FieldName = 'DamSireAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 296
    end
    object plEntriesppField298: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllMudWinPct'
      FieldName = 'DamSireAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 297
    end
    object plEntriesppField299: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllWinPct'
      FieldName = 'SireAllWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 298
    end
    object plEntriesppField300: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllTurfWinPct'
      FieldName = 'SireAllTurfWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 299
    end
    object plEntriesppField301: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllMudWinPct'
      FieldName = 'SireAllMudWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 300
    end
    object plEntriesppField302: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRating'
      FieldName = 'ClassRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 301
    end
    object plEntriesppField303: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassRatingRank'
      FieldName = 'ClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 302
    end
    object plEntriesppField304: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRating'
      FieldName = 'TurfRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 303
    end
    object plEntriesppField305: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRatingRank'
      FieldName = 'TurfRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 304
    end
    object plEntriesppField306: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRating'
      FieldName = 'MudRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 305
    end
    object plEntriesppField307: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRatingRank'
      FieldName = 'MudRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 306
    end
    object plEntriesppField308: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeed'
      FieldName = 'LastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 307
    end
    object plEntriesppField309: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRank'
      FieldName = 'LastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 308
    end
    object plEntriesppField310: TppField
      Alignment = taRightJustify
      FieldAlias = 'Power'
      FieldName = 'Power'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 309
    end
    object plEntriesppField311: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRank'
      FieldName = 'PowerRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 310
    end
    object plEntriesppField312: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeed'
      FieldName = 'BackSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 311
    end
    object plEntriesppField313: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRank'
      FieldName = 'BackSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 312
    end
    object plEntriesppField314: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPace'
      FieldName = 'EarlyPace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 313
    end
    object plEntriesppField315: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRank'
      FieldName = 'EarlyPaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 314
    end
    object plEntriesppField316: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceO'
      FieldName = 'EarlyPaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 315
    end
    object plEntriesppField317: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceORank'
      FieldName = 'EarlyPaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 316
    end
    object plEntriesppField318: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceH'
      FieldName = 'EarlyPaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 317
    end
    object plEntriesppField319: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceHRank'
      FieldName = 'EarlyPaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 318
    end
    object plEntriesppField320: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePos'
      FieldName = 'EarlyPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 319
    end
    object plEntriesppField321: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRank'
      FieldName = 'EarlyPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 320
    end
    object plEntriesppField322: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosH'
      FieldName = 'EarlyPacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 321
    end
    object plEntriesppField323: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosHRank'
      FieldName = 'EarlyPacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 322
    end
    object plEntriesppField324: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosO'
      FieldName = 'EarlyPacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 323
    end
    object plEntriesppField325: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosORank'
      FieldName = 'EarlyPacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 324
    end
    object plEntriesppField326: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePace'
      FieldName = 'MiddlePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 325
    end
    object plEntriesppField327: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRank'
      FieldName = 'MiddlePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 326
    end
    object plEntriesppField328: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceO'
      FieldName = 'MiddlePaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 327
    end
    object plEntriesppField329: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceORank'
      FieldName = 'MiddlePaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 328
    end
    object plEntriesppField330: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceH'
      FieldName = 'MiddlePaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 329
    end
    object plEntriesppField331: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceHRank'
      FieldName = 'MiddlePaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 330
    end
    object plEntriesppField332: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePos'
      FieldName = 'MiddlePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 331
    end
    object plEntriesppField333: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRank'
      FieldName = 'MiddlePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 332
    end
    object plEntriesppField334: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosH'
      FieldName = 'MiddlePacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 333
    end
    object plEntriesppField335: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosHRank'
      FieldName = 'MiddlePacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 334
    end
    object plEntriesppField336: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosO'
      FieldName = 'MiddlePacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 335
    end
    object plEntriesppField337: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosORank'
      FieldName = 'MiddlePacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 336
    end
    object plEntriesppField338: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePace'
      FieldName = 'LatePace'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 337
    end
    object plEntriesppField339: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRank'
      FieldName = 'LatePaceRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 338
    end
    object plEntriesppField340: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceO'
      FieldName = 'LatePaceO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 339
    end
    object plEntriesppField341: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceORank'
      FieldName = 'LatePaceORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 340
    end
    object plEntriesppField342: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceH'
      FieldName = 'LatePaceH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 341
    end
    object plEntriesppField343: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceHRank'
      FieldName = 'LatePaceHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 342
    end
    object plEntriesppField344: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePos'
      FieldName = 'LatePacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 343
    end
    object plEntriesppField345: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRank'
      FieldName = 'LatePacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 344
    end
    object plEntriesppField346: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosH'
      FieldName = 'LatePacePosH'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 345
    end
    object plEntriesppField347: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosHRank'
      FieldName = 'LatePacePosHRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 346
    end
    object plEntriesppField348: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosO'
      FieldName = 'LatePacePosO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 347
    end
    object plEntriesppField349: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosORank'
      FieldName = 'LatePacePosORank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 348
    end
    object plEntriesppField350: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePos'
      FieldName = 'FinishPacePos'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 349
    end
    object plEntriesppField351: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinishPacePosRank'
      FieldName = 'FinishPacePosRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 350
    end
    object plEntriesppField352: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1'
      FieldName = 'MorningLineTo1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 351
    end
    object plEntriesppField353: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1Prob'
      FieldName = 'MorningLineTo1Prob'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 352
    end
    object plEntriesppField354: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1Rank'
      FieldName = 'MorningLineTo1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 353
    end
    object plEntriesppField355: TppField
      FieldAlias = 'IsPlayableValue'
      FieldName = 'IsPlayableValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 354
    end
    object plEntriesppField356: TppField
      FieldAlias = 'IsFinalValue'
      FieldName = 'IsFinalValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 355
    end
    object plEntriesppField357: TppField
      FieldAlias = 'IsChalkValue'
      FieldName = 'IsChalkValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 356
    end
    object plEntriesppField358: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed1Back'
      FieldName = 'Speed1Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 357
    end
    object plEntriesppField359: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed2Back'
      FieldName = 'Speed2Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 358
    end
    object plEntriesppField360: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed3Back'
      FieldName = 'Speed3Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 359
    end
    object plEntriesppField361: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed4Back'
      FieldName = 'Speed4Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 360
    end
    object plEntriesppField362: TppField
      Alignment = taRightJustify
      FieldAlias = 'Speed5Back'
      FieldName = 'Speed5Back'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 361
    end
    object plEntriesppField363: TppField
      Alignment = taRightJustify
      FieldAlias = 'TimesSpdDeclined'
      FieldName = 'TimesSpdDeclined'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 362
    end
    object plEntriesppField364: TppField
      FieldAlias = 'IsClaimed1Back'
      FieldName = 'IsClaimed1Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 363
    end
    object plEntriesppField365: TppField
      FieldAlias = 'IsClaimed2Back'
      FieldName = 'IsClaimed2Back'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 364
    end
    object plEntriesppField366: TppField
      FieldAlias = 'IsPrintedOnValueSheet'
      FieldName = 'IsPrintedOnValueSheet'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 365
    end
    object plEntriesppField367: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllWinPctRank'
      FieldName = 'DamAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 366
    end
    object plEntriesppField368: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllTurfWinPctRank'
      FieldName = 'DamAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 367
    end
    object plEntriesppField369: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllMudWinPctRank'
      FieldName = 'DamAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 368
    end
    object plEntriesppField370: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllWinPctRank'
      FieldName = 'SireAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 369
    end
    object plEntriesppField371: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllTurfWinPctRank'
      FieldName = 'SireAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 370
    end
    object plEntriesppField372: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllMudWinPctRank'
      FieldName = 'SireAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 371
    end
    object plEntriesppField373: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllWinPctRank'
      FieldName = 'DamSireAllWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 372
    end
    object plEntriesppField374: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllTurfWinPctRank'
      FieldName = 'DamSireAllTurfWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 373
    end
    object plEntriesppField375: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllMudWinPctRank'
      FieldName = 'DamSireAllMudWinPctRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 374
    end
    object plEntriesppField376: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeStarts'
      FieldName = 'LifeStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 375
    end
    object plEntriesppField377: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeWins'
      FieldName = 'LifeWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 376
    end
    object plEntriesppField378: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifePlcs'
      FieldName = 'LifePlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 377
    end
    object plEntriesppField379: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeShos'
      FieldName = 'LifeShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 378
    end
    object plEntriesppField380: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeEarnings'
      FieldName = 'LifeEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 379
    end
    object plEntriesppField381: TppField
      Alignment = taRightJustify
      FieldAlias = 'LifeEPS'
      FieldName = 'LifeEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 380
    end
    object plEntriesppField382: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfStarts'
      FieldName = 'TurfStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 381
    end
    object plEntriesppField383: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfWins'
      FieldName = 'TurfWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 382
    end
    object plEntriesppField384: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfPlcs'
      FieldName = 'TurfPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 383
    end
    object plEntriesppField385: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfShos'
      FieldName = 'TurfShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 384
    end
    object plEntriesppField386: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfEarnings'
      FieldName = 'TurfEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 385
    end
    object plEntriesppField387: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfEPS'
      FieldName = 'TurfEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 386
    end
    object plEntriesppField388: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudStarts'
      FieldName = 'MudStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 387
    end
    object plEntriesppField389: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudWins'
      FieldName = 'MudWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 388
    end
    object plEntriesppField390: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudPlcs'
      FieldName = 'MudPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 389
    end
    object plEntriesppField391: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudShos'
      FieldName = 'MudShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 390
    end
    object plEntriesppField392: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudEarnings'
      FieldName = 'MudEarnings'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 391
    end
    object plEntriesppField393: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudEPS'
      FieldName = 'MudEPS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 392
    end
    object plEntriesppField394: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgPurse'
      FieldName = 'AvgPurse'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 393
    end
    object plEntriesppField395: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkStarts'
      FieldName = 'TrkStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 394
    end
    object plEntriesppField396: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkWins'
      FieldName = 'TrkWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 395
    end
    object plEntriesppField397: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkPlcs'
      FieldName = 'TrkPlcs'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 396
    end
    object plEntriesppField398: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrkShos'
      FieldName = 'TrkShos'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 397
    end
    object plEntriesppField399: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClass'
      FieldName = 'AvgClass'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 398
    end
    object plEntriesppField400: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRank'
      FieldName = 'AvgClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 399
    end
    object plEntriesppField401: TppField
      Alignment = taRightJustify
      FieldAlias = 'Pk3Choice'
      FieldName = 'Pk3Choice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 400
    end
    object plEntriesppField402: TppField
      Alignment = taRightJustify
      FieldAlias = 'TriChoice'
      FieldName = 'TriChoice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 401
    end
    object plEntriesppField403: TppField
      Alignment = taRightJustify
      FieldAlias = 'SuperChoice'
      FieldName = 'SuperChoice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 402
    end
    object plEntriesppField404: TppField
      Alignment = taRightJustify
      FieldAlias = 'DDChoice'
      FieldName = 'DDChoice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 403
    end
    object plEntriesppField405: TppField
      Alignment = taRightJustify
      FieldAlias = 'ValueChoice'
      FieldName = 'ValueChoice'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 404
    end
    object plEntriesppField406: TppField
      FieldAlias = 'IsLayoffAndUp'
      FieldName = 'IsLayoffAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 405
    end
    object plEntriesppField407: TppField
      FieldAlias = 'IsClaimedAndUp'
      FieldName = 'IsClaimedAndUp'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 406
    end
    object plEntriesppField408: TppField
      FieldAlias = 'IsTipSheetSelected'
      FieldName = 'IsTipSheetSelected'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 407
    end
    object plEntriesppField409: TppField
      Alignment = taRightJustify
      FieldAlias = 'TodaysClass'
      FieldName = 'TodaysClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 408
    end
    object plEntriesppField410: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeed'
      FieldName = 'AvgSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 409
    end
    object plEntriesppField411: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeedRank'
      FieldName = 'AvgSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 410
    end
    object plEntriesppField412: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRating'
      FieldName = 'AvgClassRating'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 411
    end
    object plEntriesppField413: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRatingRank'
      FieldName = 'AvgClassRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 412
    end
    object plEntriesppField414: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClass'
      FieldName = 'BackClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 413
    end
    object plEntriesppField415: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClassRank'
      FieldName = 'BackClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 414
    end
    object plEntriesppField416: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace1'
      FieldName = 'BackPace1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 415
    end
    object plEntriesppField417: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace1Rank'
      FieldName = 'BackPace1Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 416
    end
    object plEntriesppField418: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace2'
      FieldName = 'BackPace2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 417
    end
    object plEntriesppField419: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace2Rank'
      FieldName = 'BackPace2Rank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 418
    end
    object plEntriesppField420: TppField
      Alignment = taRightJustify
      FieldAlias = 'PastSpeed'
      FieldName = 'PastSpeed'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 419
    end
    object plEntriesppField421: TppField
      Alignment = taRightJustify
      FieldAlias = 'PastSpeedRank'
      FieldName = 'PastSpeedRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 420
    end
    object plEntriesppField422: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClass'
      FieldName = 'CurrClass'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 421
    end
    object plEntriesppField423: TppField
      Alignment = taRightJustify
      FieldAlias = 'CurrClassRank'
      FieldName = 'CurrClassRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 422
    end
    object plEntriesppField424: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseRPI'
      FieldName = 'BaseRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 423
    end
    object plEntriesppField425: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseRPIRank'
      FieldName = 'BaseRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 424
    end
    object plEntriesppField426: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenRPI'
      FieldName = 'MaidenRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 425
    end
    object plEntriesppField427: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenRPIRank'
      FieldName = 'MaidenRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 426
    end
    object plEntriesppField428: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRPI'
      FieldName = 'TurfRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 427
    end
    object plEntriesppField429: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfRPIRank'
      FieldName = 'TurfRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 428
    end
    object plEntriesppField430: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRPI'
      FieldName = 'MudRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 429
    end
    object plEntriesppField431: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudRPIRank'
      FieldName = 'MudRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 430
    end
    object plEntriesppField432: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionRPI'
      FieldName = 'ConnectionRPI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 431
    end
    object plEntriesppField433: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionRPIRank'
      FieldName = 'ConnectionRPIRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 432
    end
    object plEntriesppField434: TppField
      Alignment = taRightJustify
      FieldAlias = 'HorseNbr'
      FieldName = 'HorseNbr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 433
    end
    object plEntriesppField435: TppField
      FieldAlias = 'WorkLine1'
      FieldName = 'WorkLine1'
      FieldLength = 250
      DisplayWidth = 250
      Position = 434
    end
    object plEntriesppField436: TppField
      FieldAlias = 'WorkLine2'
      FieldName = 'WorkLine2'
      FieldLength = 250
      DisplayWidth = 250
      Position = 435
    end
    object plEntriesppField437: TppField
      FieldAlias = 'Sire_Rec_Foal'
      FieldName = 'Sire_Rec_Foal'
      FieldLength = 9
      DisplayWidth = 9
      Position = 436
    end
    object plEntriesppField438: TppField
      FieldAlias = 'Sire_Rec_Turf'
      FieldName = 'Sire_Rec_Turf'
      FieldLength = 9
      DisplayWidth = 9
      Position = 437
    end
    object plEntriesppField439: TppField
      FieldAlias = 'Sire_Rec_2yr'
      FieldName = 'Sire_Rec_2yr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 438
    end
    object plEntriesppField440: TppField
      FieldAlias = 'Sire_Rec_Stk'
      FieldName = 'Sire_Rec_Stk'
      FieldLength = 9
      DisplayWidth = 9
      Position = 439
    end
    object plEntriesppField441: TppField
      FieldAlias = 'Sire_Rec_OffTrk'
      FieldName = 'Sire_Rec_OffTrk'
      FieldLength = 9
      DisplayWidth = 9
      Position = 440
    end
    object plEntriesppField442: TppField
      FieldAlias = 'Sire_Rec_Fts'
      FieldName = 'Sire_Rec_Fts'
      FieldLength = 9
      DisplayWidth = 9
      Position = 441
    end
    object plEntriesppField443: TppField
      FieldAlias = 'Sire_Rec_OfsTrk'
      FieldName = 'Sire_Rec_OfsTrk'
      FieldLength = 9
      DisplayWidth = 9
      Position = 442
    end
    object plEntriesppField444: TppField
      FieldAlias = 'Sire_Rec_Ds'
      FieldName = 'Sire_Rec_Ds'
      FieldLength = 9
      DisplayWidth = 9
      Position = 443
    end
    object plEntriesppField445: TppField
      FieldAlias = 'Sire_Rec_Dr'
      FieldName = 'Sire_Rec_Dr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 444
    end
    object plEntriesppField446: TppField
      FieldAlias = 'Sire_Rec_Ts'
      FieldName = 'Sire_Rec_Ts'
      FieldLength = 9
      DisplayWidth = 9
      Position = 445
    end
    object plEntriesppField447: TppField
      FieldAlias = 'Sire_Rec_Tr'
      FieldName = 'Sire_Rec_Tr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 446
    end
    object plEntriesppField448: TppField
      FieldAlias = 'Dam_Rec_Foal'
      FieldName = 'Dam_Rec_Foal'
      FieldLength = 9
      DisplayWidth = 9
      Position = 447
    end
    object plEntriesppField449: TppField
      FieldAlias = 'Dam_Rec_TurfSt'
      FieldName = 'Dam_Rec_TurfSt'
      FieldLength = 9
      DisplayWidth = 9
      Position = 448
    end
    object plEntriesppField450: TppField
      FieldAlias = 'Dam_Rec_2yr'
      FieldName = 'Dam_Rec_2yr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 449
    end
    object plEntriesppField451: TppField
      FieldAlias = 'Dam_Rec_StkSt'
      FieldName = 'Dam_Rec_StkSt'
      FieldLength = 9
      DisplayWidth = 9
      Position = 450
    end
    object plEntriesppField452: TppField
      FieldAlias = 'Dam_Rec_OffTrk'
      FieldName = 'Dam_Rec_OffTrk'
      FieldLength = 9
      DisplayWidth = 9
      Position = 451
    end
    object plEntriesppField453: TppField
      FieldAlias = 'Dam_Rec_Fts'
      FieldName = 'Dam_Rec_Fts'
      FieldLength = 9
      DisplayWidth = 9
      Position = 452
    end
    object plEntriesppField454: TppField
      FieldAlias = 'Dam_Rec_OfsTrk'
      FieldName = 'Dam_Rec_OfsTrk'
      FieldLength = 9
      DisplayWidth = 9
      Position = 453
    end
    object plEntriesppField455: TppField
      FieldAlias = 'Dam_Rec_Ds'
      FieldName = 'Dam_Rec_Ds'
      FieldLength = 9
      DisplayWidth = 9
      Position = 454
    end
    object plEntriesppField456: TppField
      FieldAlias = 'Dam_Rec_Dr'
      FieldName = 'Dam_Rec_Dr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 455
    end
    object plEntriesppField457: TppField
      FieldAlias = 'Dam_Rec_Ts'
      FieldName = 'Dam_Rec_Ts'
      FieldLength = 9
      DisplayWidth = 9
      Position = 456
    end
    object plEntriesppField458: TppField
      FieldAlias = 'Dam_Rec_Tr'
      FieldName = 'Dam_Rec_Tr'
      FieldLength = 9
      DisplayWidth = 9
      Position = 457
    end
    object plEntriesppField459: TppField
      FieldAlias = 'IsCreateTip'
      FieldName = 'IsCreateTip'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 458
    end
    object plEntriesppField460: TppField
      FieldAlias = 'IsCreateAlt'
      FieldName = 'IsCreateAlt'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 459
    end
    object plEntriesppField461: TppField
      FieldAlias = 'IsCreatePK3'
      FieldName = 'IsCreatePK3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 460
    end
    object plEntriesppField462: TppField
      FieldAlias = 'IsCreateDetail'
      FieldName = 'IsCreateDetail'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 461
    end
    object plEntriesppField463: TppField
      FieldAlias = 'IsCreateValue'
      FieldName = 'IsCreateValue'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 462
    end
    object plEntriesppField464: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseIV'
      FieldName = 'BaseIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 463
    end
    object plEntriesppField465: TppField
      Alignment = taRightJustify
      FieldAlias = 'BaseIVRank'
      FieldName = 'BaseIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 464
    end
    object plEntriesppField466: TppField
      Alignment = taRightJustify
      FieldAlias = 'MorningLineTo1RankIV'
      FieldName = 'MorningLineTo1RankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 465
    end
    object plEntriesppField467: TppField
      Alignment = taRightJustify
      FieldAlias = 'PowerRankIV'
      FieldName = 'PowerRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 466
    end
    object plEntriesppField468: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedIV'
      FieldName = 'SpeedIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 467
    end
    object plEntriesppField469: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedIVRank'
      FieldName = 'SpeedIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 468
    end
    object plEntriesppField470: TppField
      Alignment = taRightJustify
      FieldAlias = 'LastSpeedRankIV'
      FieldName = 'LastSpeedRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 469
    end
    object plEntriesppField471: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgSpeedRankIV'
      FieldName = 'AvgSpeedRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 470
    end
    object plEntriesppField472: TppField
      Alignment = taRightJustify
      FieldAlias = 'PastSpeedRankIV'
      FieldName = 'PastSpeedRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 471
    end
    object plEntriesppField473: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackSpeedRankIV'
      FieldName = 'BackSpeedRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 472
    end
    object plEntriesppField474: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassIV'
      FieldName = 'ClassIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 473
    end
    object plEntriesppField475: TppField
      Alignment = taRightJustify
      FieldAlias = 'ClassIVRank'
      FieldName = 'ClassIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 474
    end
    object plEntriesppField476: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackClassRankIV'
      FieldName = 'BackClassRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 475
    end
    object plEntriesppField477: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRankIV'
      FieldName = 'AvgClassRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 476
    end
    object plEntriesppField478: TppField
      Alignment = taRightJustify
      FieldAlias = 'AvgClassRatingRankIV'
      FieldName = 'AvgClassRatingRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 477
    end
    object plEntriesppField479: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIV'
      FieldName = 'PaceIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 478
    end
    object plEntriesppField480: TppField
      Alignment = taRightJustify
      FieldAlias = 'PaceIVRank'
      FieldName = 'PaceIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 479
    end
    object plEntriesppField481: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace2RankIV'
      FieldName = 'BackPace2RankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 480
    end
    object plEntriesppField482: TppField
      Alignment = taRightJustify
      FieldAlias = 'BackPace1RankIV'
      FieldName = 'BackPace1RankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 481
    end
    object plEntriesppField483: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPaceRankIV'
      FieldName = 'EarlyPaceRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 482
    end
    object plEntriesppField484: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePaceRankIV'
      FieldName = 'MiddlePaceRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 483
    end
    object plEntriesppField485: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePaceRankIV'
      FieldName = 'LatePaceRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 484
    end
    object plEntriesppField486: TppField
      Alignment = taRightJustify
      FieldAlias = 'PacePosIV'
      FieldName = 'PacePosIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 485
    end
    object plEntriesppField487: TppField
      Alignment = taRightJustify
      FieldAlias = 'PacePosIVRank'
      FieldName = 'PacePosIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 486
    end
    object plEntriesppField488: TppField
      Alignment = taRightJustify
      FieldAlias = 'EarlyPacePosRankIV'
      FieldName = 'EarlyPacePosRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 487
    end
    object plEntriesppField489: TppField
      Alignment = taRightJustify
      FieldAlias = 'MiddlePacePosRankIV'
      FieldName = 'MiddlePacePosRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 488
    end
    object plEntriesppField490: TppField
      Alignment = taRightJustify
      FieldAlias = 'LatePacePosRankIV'
      FieldName = 'LatePacePosRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 489
    end
    object plEntriesppField491: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenIV'
      FieldName = 'MaidenIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 490
    end
    object plEntriesppField492: TppField
      Alignment = taRightJustify
      FieldAlias = 'MaidenIVRank'
      FieldName = 'MaidenIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 491
    end
    object plEntriesppField493: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllWinPctRankIV'
      FieldName = 'DamAllWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 492
    end
    object plEntriesppField494: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllWinPctRankIV'
      FieldName = 'SireAllWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 493
    end
    object plEntriesppField495: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalBrdWinPctRankIV'
      FieldName = 'TotalBrdWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 494
    end
    object plEntriesppField496: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllWinPctRankIV'
      FieldName = 'DamSireAllWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 495
    end
    object plEntriesppField497: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudIV'
      FieldName = 'MudIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 496
    end
    object plEntriesppField498: TppField
      Alignment = taRightJustify
      FieldAlias = 'MudIVRank'
      FieldName = 'MudIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 497
    end
    object plEntriesppField499: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllMudWinPctRankIV'
      FieldName = 'DamAllMudWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 498
    end
    object plEntriesppField500: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllMudWinPctRankIV'
      FieldName = 'SireAllMudWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 499
    end
    object plEntriesppField501: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllMudWinPctRankIV'
      FieldName = 'DamSireAllMudWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 500
    end
    object plEntriesppField502: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfIV'
      FieldName = 'TurfIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 501
    end
    object plEntriesppField503: TppField
      Alignment = taRightJustify
      FieldAlias = 'TurfIVRank'
      FieldName = 'TurfIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 502
    end
    object plEntriesppField504: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamAllTurfWinPctRankIV'
      FieldName = 'DamAllTurfWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 503
    end
    object plEntriesppField505: TppField
      Alignment = taRightJustify
      FieldAlias = 'SireAllTurfWinPctRankIV'
      FieldName = 'SireAllTurfWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 504
    end
    object plEntriesppField506: TppField
      Alignment = taRightJustify
      FieldAlias = 'DamSireAllTurfWinPctRankIV'
      FieldName = 'DamSireAllTurfWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 505
    end
    object plEntriesppField507: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionIV'
      FieldName = 'ConnectionIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 506
    end
    object plEntriesppField508: TppField
      Alignment = taRightJustify
      FieldAlias = 'ConnectionIVRank'
      FieldName = 'ConnectionIVRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 507
    end
    object plEntriesppField509: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOddsWinPctRankIV'
      FieldName = 'TotalTrnOddsWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 508
    end
    object plEntriesppField510: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyOddsWinPctRankIV'
      FieldName = 'TotalJkyOddsWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 509
    end
    object plEntriesppField511: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnTurfWinPctRankIV'
      FieldName = 'TotalTrnTurfWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 510
    end
    object plEntriesppField512: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn10WinPctRankIV'
      FieldName = 'TotalTrn10WinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 511
    end
    object plEntriesppField513: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrn30WinPctRankIV'
      FieldName = 'TotalTrn30WinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 512
    end
    object plEntriesppField514: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky10WinPctRankIV'
      FieldName = 'TotalJky10WinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 513
    end
    object plEntriesppField515: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJky30WinPctRankIV'
      FieldName = 'TotalJky30WinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 514
    end
    object plEntriesppField516: TppField
      Alignment = taRightJustify
      FieldAlias = 'TrnTodayWinPctRankIV'
      FieldName = 'TrnTodayWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 515
    end
    object plEntriesppField517: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnWinPctRankIV'
      FieldName = 'TotalTrnWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 516
    end
    object plEntriesppField518: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnDaysWinPctRankIV'
      FieldName = 'TotalTrnDaysWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 517
    end
    object plEntriesppField519: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyWinPctRankIV'
      FieldName = 'TotalTrnJkyWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 518
    end
    object plEntriesppField520: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnJkyDaysWinPctRankIV'
      FieldName = 'TotalTrnJkyDaysWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 519
    end
    object plEntriesppField521: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyWinPctRankIV'
      FieldName = 'TotalJkyWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 520
    end
    object plEntriesppField522: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalJkyDaysWinPctRankIV'
      FieldName = 'TotalJkyDaysWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 521
    end
    object plEntriesppField523: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalTrnOwnWinPctRankIV'
      FieldName = 'TotalTrnOwnWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 522
    end
    object plEntriesppField524: TppField
      Alignment = taRightJustify
      FieldAlias = 'TotalOwnWinPctRankIV'
      FieldName = 'TotalOwnWinPctRankIV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 523
    end
    object plEntriesppField525: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedPoints'
      FieldName = 'SpeedPoints'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 524
    end
    object plEntriesppField526: TppField
      Alignment = taRightJustify
      FieldAlias = 'SpeedPointsRank'
      FieldName = 'SpeedPointsRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 525
    end
    object plEntriesppField527: TppField
      Alignment = taRightJustify
      FieldAlias = 'PDQPaceRating'
      FieldName = 'PDQPaceRating'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 526
    end
    object plEntriesppField528: TppField
      Alignment = taRightJustify
      FieldAlias = 'PDQPaceRatingRank'
      FieldName = 'PDQPaceRatingRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 527
    end
    object plEntriesppField529: TppField
      FieldAlias = 'Wager'
      FieldName = 'Wager'
      FieldLength = 10
      DisplayWidth = 10
      Position = 528
    end
    object plEntriesppField530: TppField
      Alignment = taRightJustify
      FieldAlias = 'WagerAmt'
      FieldName = 'WagerAmt'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 529
    end
    object plEntriesppField531: TppField
      FieldAlias = 'IsSuperTrainer'
      FieldName = 'IsSuperTrainer'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 530
    end
    object plEntriesppField532: TppField
      FieldAlias = 'IsSuperOwner'
      FieldName = 'IsSuperOwner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 531
    end
    object plEntriesppField533: TppField
      FieldAlias = 'IsSuperJockey'
      FieldName = 'IsSuperJockey'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 532
    end
    object plEntriesppField534: TppField
      FieldAlias = 'IsDollar'
      FieldName = 'IsDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 533
    end
    object plEntriesppField535: TppField
      FieldAlias = 'IsDoubleDollar'
      FieldName = 'IsDoubleDollar'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 534
    end
    object plEntriesppField536: TppField
      FieldAlias = 'IsFrontDoubleLiner'
      FieldName = 'IsFrontDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 535
    end
    object plEntriesppField537: TppField
      FieldAlias = 'IsBackDoubleLiner'
      FieldName = 'IsBackDoubleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 536
    end
    object plEntriesppField538: TppField
      FieldAlias = 'IsTripleLiner'
      FieldName = 'IsTripleLiner'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 537
    end
    object plEntriesppField539: TppField
      FieldAlias = 'IsFrontDoubleDot'
      FieldName = 'IsFrontDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 538
    end
    object plEntriesppField540: TppField
      FieldAlias = 'IsBackDoubleDot'
      FieldName = 'IsBackDoubleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 539
    end
    object plEntriesppField541: TppField
      FieldAlias = 'IsTripleDot'
      FieldName = 'IsTripleDot'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 540
    end
    object plEntriesppField542: TppField
      FieldAlias = 'IsFrontDoubleLiner0'
      FieldName = 'IsFrontDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 541
    end
    object plEntriesppField543: TppField
      FieldAlias = 'IsBackDoubleLiner0'
      FieldName = 'IsBackDoubleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 542
    end
    object plEntriesppField544: TppField
      FieldAlias = 'IsTripleLiner0'
      FieldName = 'IsTripleLiner0'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 543
    end
    object plEntriesppField545: TppField
      FieldAlias = 'IsFrontDoubleLiner1'
      FieldName = 'IsFrontDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 544
    end
    object plEntriesppField546: TppField
      FieldAlias = 'IsBackDoubleLiner1'
      FieldName = 'IsBackDoubleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 545
    end
    object plEntriesppField547: TppField
      FieldAlias = 'IsTripleLiner1'
      FieldName = 'IsTripleLiner1'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 546
    end
    object plEntriesppField548: TppField
      FieldAlias = 'IsFrontDoubleLiner2'
      FieldName = 'IsFrontDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 547
    end
    object plEntriesppField549: TppField
      FieldAlias = 'IsBackDoubleLiner2'
      FieldName = 'IsBackDoubleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 548
    end
    object plEntriesppField550: TppField
      FieldAlias = 'IsTripleLiner2'
      FieldName = 'IsTripleLiner2'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 549
    end
    object plEntriesppField551: TppField
      FieldAlias = 'IsFrontDoubleLiner3'
      FieldName = 'IsFrontDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 550
    end
    object plEntriesppField552: TppField
      FieldAlias = 'IsBackDoubleLiner3'
      FieldName = 'IsBackDoubleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 551
    end
    object plEntriesppField553: TppField
      FieldAlias = 'IsTripleLiner3'
      FieldName = 'IsTripleLiner3'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 552
    end
    object plEntriesppField554: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerStarts'
      FieldName = 'FrontDoubleLinerStarts'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 553
    end
    object plEntriesppField555: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWins'
      FieldName = 'FrontDoubleLinerWins'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 554
    end
    object plEntriesppField556: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinPct'
      FieldName = 'FrontDoubleLinerWinPct'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 555
    end
    object plEntriesppField557: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerValueBet'
      FieldName = 'FrontDoubleLinerValueBet'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 556
    end
    object plEntriesppField558: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerStartsByTrk'
      FieldName = 'FrontDoubleLinerStartsByTrk'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 557
    end
    object plEntriesppField559: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinsByTrk'
      FieldName = 'FrontDoubleLinerWinsByTrk'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 558
    end
    object plEntriesppField560: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerWinPctByTrk'
      FieldName = 'FrontDoubleLinerWinPctByTrk'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 559
    end
    object plEntriesppField561: TppField
      Alignment = taRightJustify
      FieldAlias = 'FrontDoubleLinerValueBetByTrk'
      FieldName = 'FrontDoubleLinerValueBetByTrk'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 560
    end
    object plEntriesppField562: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalSheetOrder'
      FieldName = 'FinalSheetOrder'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 561
    end
    object plEntriesppField563: TppField
      Alignment = taRightJustify
      FieldAlias = 'FinalSheetOrderRank'
      FieldName = 'FinalSheetOrderRank'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 562
    end
  end
  object ppJoesValueReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PassSetting = psTwoPass
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
    Template.FileName = 'D:\NewRatings\ValueSheet.rtm'
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
    Left = 256
    Top = 120
    Version = '7.03'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 6085
        mmLeft = 138642
        mmTop = 0
        mmWidth = 30956
        BandType = 0
      end
      object ppTitle: TppLabel
        UserName = 'Title'
        AutoSize = False
        Caption = 'JOE'#39'S SHEET FOR:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 44450
        mmTop = 0
        mmWidth = 90488
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'P#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 794
        mmTop = 13494
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'HORSE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 2381
        mmTop = 16669
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'JOCKEY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 38100
        mmTop = 13758
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'TRAINER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 25135
        mmTop = 13758
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = '------PACE-----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 68792
        mmTop = 13758
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'T/J'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 48683
        mmTop = 17198
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'ALL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 43656
        mmTop = 17198
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'L/R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 150019
        mmTop = 14288
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'L/W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 155575
        mmTop = 14288
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = 
          'TRK SURF CLS  PRICE  PURSE CONDITIONS   DISTANCE  FIN-  B/L   OD' +
          'DS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2117
        mmLeft = 160602
        mmTop = 17198
        mmWidth = 55827
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        ShiftWithParent = True
        AutoSize = False
        Caption = 
          '------------------------- LAST RACE INFORMATION-----------------' +
          '-----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 160602
        mmTop = 14288
        mmWidth = 55033
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        ShiftWithParent = True
        AutoSize = False
        Caption = '-DAYS-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 150019
        mmTop = 10848
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'MDN MUD TURF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 109538
        mmTop = 16933
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        ShiftWithParent = True
        AutoSize = False
        Caption = 'R A T I N G S  A N D  R A N K I N G S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 64294
        mmTop = 6615
        mmWidth = 84667
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label5'
        Caption = 'T/O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 54769
        mmTop = 17198
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'MD SEX AGE BRED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 6615
        mmTop = 13758
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'VALUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 142082
        mmTop = 16933
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'LAST JKY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 48683
        mmTop = 13758
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = '---------------TRAINER---------------'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2381
        mmLeft = 81756
        mmTop = 13758
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'TRN%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 150019
        mmTop = 16933
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'lblERL'
        Caption = 'ERL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 68527
        mmTop = 16933
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'lblSTR'
        Caption = 'STR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 76729
        mmTop = 16933
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 'NBR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 155311
        mmTop = 16933
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'ALL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 34131
        mmTop = 17198
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'L30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2381
        mmLeft = 25135
        mmTop = 17198
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lblMID'
        Caption = 'MID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 73025
        mmTop = 16933
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'OWN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 58738
        mmTop = 17198
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'TRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 92340
        mmTop = 16933
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'CLM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 87842
        mmTop = 16933
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = '2ND'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 84138
        mmTop = 16933
        mmWidth = 3704
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = '1ST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 80433
        mmTop = 16933
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = 'SC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 97102
        mmTop = 16933
        mmWidth = 2646
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'DC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 100806
        mmTop = 16933
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'L30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 38100
        mmTop = 17198
        mmWidth = 4763
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'LS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 63500
        mmTop = 17198
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = 'AS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 64558
        mmTop = 14023
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        AutoSize = False
        Caption = '2YO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2381
        mmLeft = 104511
        mmTop = 16933
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'CLS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2381
        mmLeft = 29369
        mmTop = 16933
        mmWidth = 3440
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 182827
        mmTop = 0
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label76'
        AutoSize = False
        Caption = 'TrnFav W%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 126736
        mmTop = 17727
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'M/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 136790
        mmTop = 17727
        mmWidth = 3704
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12965
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
        mmHeight = 12965
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
          Version = '7.03'
          mmColumnWidth = 266701
          DataPipelineName = 'plEntries'
          object ppTitleBand1: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4106
              mmLeft = 265
              mmTop = 0
              mmWidth = 6054
              BandType = 1
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'RaceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4106
              mmLeft = 7673
              mmTop = 0
              mmWidth = 184574
              BandType = 1
            end
          end
          object ppDetailBand13: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              ParentHeight = True
              ParentWidth = True
              mmHeight = 6350
              mmLeft = 0
              mmTop = 0
              mmWidth = 215900
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              ShiftWithParent = True
              DataField = 'ProgramNbr'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 11
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 6350
              mmLeft = 265
              mmTop = 0
              mmWidth = 4498
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              ShiftWithParent = True
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 4763
              mmTop = 265
              mmWidth = 16669
              BandType = 4
            end
            object TrnName: TppDBText
              UserName = 'TrnName'
              ShiftWithParent = True
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 22490
              mmTop = 0
              mmWidth = 12277
              BandType = 4
            end
            object JkyName: TppDBText
              UserName = 'JkyName'
              ShiftWithParent = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 35454
              mmTop = 0
              mmWidth = 9102
              BandType = 4
            end
            object ML: TppDBText
              UserName = 'ML'
              ShiftWithParent = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3704
              mmLeft = 134673
              mmTop = 0
              mmWidth = 5292
              BandType = 4
            end
            object SA: TppDBText
              UserName = 'Own'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalOwnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 56092
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object DaysLastRace: TppDBText
              UserName = 'DaysLastRace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'DaysLast'
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
              mmLeft = 146318
              mmTop = 0
              mmWidth = 8340
              BandType = 4
            end
            object DaysLastWork: TppDBText
              UserName = 'DaysLastWork'
              ShiftWithParent = True
              DataField = 'DaysLastWork'
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
              mmLeft = 155311
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 159809
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 149754
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object Pace: TppDBText
              UserName = 'ErlPace'
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
              mmHeight = 2963
              mmLeft = 68527
              mmTop = 0
              mmWidth = 3598
              BandType = 4
            end
            object TodayTrn: TppDBText
              UserName = 'TotalTrn'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnOddsWinPct'
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
              mmHeight = 2910
              mmLeft = 31485
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object TrnJky: TppDBText
              UserName = 'TrnJky'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnJkyWinPct'
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
              mmHeight = 2910
              mmLeft = 46038
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object TodayJky: TppDBText
              UserName = 'JkyL30'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJky30WinPct'
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
              mmHeight = 2910
              mmLeft = 35454
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 127265
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object Own: TppDBText
              UserName = 'TrnOwn'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnOwnWinPct'
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
              mmLeft = 51858
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 79904
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 107950
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 21696
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'ValueBet'
              ShiftWithParent = True
              DataField = 'FinalValueBet'
              DataPipeline = plEntries
              DisplayFormat = '#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 145257
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'LatePace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePace'
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
              mmHeight = 2836
              mmLeft = 71018
              mmTop = 0
              mmWidth = 8763
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText101'
              ShiftWithParent = True
              DataField = 'LastJockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2498
              mmLeft = 46038
              mmTop = 0
              mmWidth = 8996
              BandType = 4
            end
            object Trn1st: TppDBText
              UserName = 'Trn1st'
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
              mmLeft = 80169
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object varLay: TppVariable
              UserName = 'varLay'
              AutoSize = False
              CalcOrder = 0
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 150284
              mmTop = 3175
              mmWidth = 4233
              BandType = 4
            end
            object varValue: TppVariable
              UserName = 'varValue'
              AutoSize = False
              CalcOrder = 1
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2646
              mmLeft = 141288
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'Trn30'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn30WinPct'
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
              mmHeight = 2910
              mmLeft = 22490
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object varLayWo: TppVariable
              UserName = 'varLayWo'
              AutoSize = False
              CalcOrder = 2
              DataType = dtInteger
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 155046
              mmTop = 3175
              mmWidth = 4233
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'MudRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'MudRating'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 113506
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'ClsRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'ClassRating'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 108215
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'TrfRating'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TurfRating'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 118269
              mmTop = 0
              mmWidth = 4763
              BandType = 4
            end
            object MidPace: TppDBText
              UserName = 'MidPace'
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
              mmHeight = 2963
              mmLeft = 72761
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'JkyAll'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJkyOddsWinPct'
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
              mmHeight = 2910
              mmLeft = 41275
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 45244
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 34925
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 59796
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object TrnTrf: TppDBText
              UserName = 'TrnTrf'
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
              mmLeft = 92340
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object TrnClm: TppDBText
              UserName = 'TrnClm'
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
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 88636
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object Trn2nd: TppDBText
              UserName = 'Trn2nd'
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
              mmLeft = 84138
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppVariable1: TppVariable
              UserName = 'varSc'
              AutoSize = False
              CalcOrder = 3
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
              mmLeft = 96309
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppVariable2: TppVariable
              UserName = 'varDC'
              AutoSize = False
              CalcOrder = 4
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
              mmLeft = 100277
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 55563
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object LastClass: TppDBText
              UserName = 'LastClassRating'
              ShiftWithParent = True
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
              mmHeight = 2963
              mmLeft = 60590
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object AvgClass: TppDBText
              UserName = 'AvgClassRating'
              ShiftWithParent = True
              DataField = 'AvgSpeed'
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
              mmHeight = 2963
              mmLeft = 64029
              mmTop = 0
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
              mmHeight = 2540
              mmLeft = 70115
              mmTop = 3175
              mmWidth = 1058
              BandType = 4
            end
            object ppLabel91: TppLabel
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
              mmHeight = 2646
              mmLeft = 73819
              mmTop = 3175
              mmWidth = 1323
              BandType = 4
            end
            object ppLabel92: TppLabel
              UserName = 'lblLatePos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2646
              mmLeft = 77788
              mmTop = 3175
              mmWidth = 1323
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Pen.Width = 0
              ParentHeight = True
              Position = lpLeft
              Weight = 0.200000002980232200
              mmHeight = 6350
              mmLeft = 68263
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'LastRace1'
              ShiftWithParent = True
              DataField = 'LastComment2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 160602
              mmTop = 2910
              mmWidth = 55033
              BandType = 4
            end
            object TRN2YO: TppDBText
              UserName = 'Trn2Yo'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJky2yoWinPct'
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
              mmLeft = 104246
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object OddsGt: TppDBText
              UserName = 'OddsGt'
              ShiftWithParent = True
              DataField = 'TotalTrnFavWinPct'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 129382
              mmTop = 0
              mmWidth = 4022
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6350
              mmLeft = 140494
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              ShiftWithParent = True
              DataField = 'LastTrkCode'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2455
              mmLeft = 160338
              mmTop = 0
              mmWidth = 3598
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              ShiftWithParent = True
              DataField = 'LastSurf'
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
              mmLeft = 164307
              mmTop = 0
              mmWidth = 1905
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              ShiftWithParent = True
              DataField = 'LastTrkCond'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 166688
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              ShiftWithParent = True
              DataField = 'LastRaceType'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 169334
              mmTop = 0
              mmWidth = 4233
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'LastClmPrice'
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
              mmLeft = 173832
              mmTop = 0
              mmWidth = 4868
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              ShiftWithParent = True
              DataField = 'LastClaimed'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 178594
              mmTop = 0
              mmWidth = 1693
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'LastPurse'
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
              mmLeft = 180182
              mmTop = 0
              mmWidth = 6773
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              ShiftWithParent = True
              DataField = 'LastRaceConditions'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2469
              mmLeft = 187590
              mmTop = 0
              mmWidth = 5927
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText301'
              ShiftWithParent = True
              DataField = 'LastDistanceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2469
              mmLeft = 194205
              mmTop = 0
              mmWidth = 6138
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              ShiftWithParent = True
              DataField = 'LastFinishBeaten'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 201613
              mmTop = 265
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              ShiftWithParent = True
              DataField = 'LastOdds'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 207169
              mmTop = 0
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              ShiftWithParent = True
              DataField = 'LastFavoriteIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 212990
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'TrnCls'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TrnClmWinPct'
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
              mmHeight = 2910
              mmLeft = 26988
              mmTop = 2910
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              ShiftWithParent = True
              DataField = 'Wager4'
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
              mmLeft = 4763
              mmTop = 3440
              mmWidth = 15875
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'TrfIndicator'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TurfIndicator'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 123825
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object varLayOrClm: TppVariable
              UserName = 'varLayOrClm'
              AutoSize = False
              CalcOrder = 5
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2646
              mmLeft = 61119
              mmTop = 3175
              mmWidth = 5556
              BandType = 4
            end
            object varJoe: TppVariable
              UserName = 'varJoe'
              AutoSize = False
              CalcOrder = 6
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2910
              mmLeft = 141552
              mmTop = 3175
              mmWidth = 6615
              BandType = 4
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650609
              4D4C4F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F7572636506C870726F636564757265204D4C4F6E5072696E743B0D
              0A626567696E0D0A0D0A202020202020696620706C456E74726965735B274D6F
              726E696E674C696E65546F3152616E6B275D203D2031207468656E2062656769
              6E0D0A092020202020202020204D4C2E466F6E742E426F6C64203A3D20547275
              653B0D0A202020202020656E6420656C736520626567696E0D0A092020202020
              202020204D4C2E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020
              2020656E643B200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              6506024D4C094576656E744E616D6506074F6E5072696E74074576656E744944
              02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060A4F776E4F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650C7501000070726F636564757265204F776E4F
              6E5072696E743B0D0A626567696E0D0A2020204F776E2E466F6E742E426F6C64
              203A3D2046616C73653B0D0A2020204F776E2E466F6E742E556E6465726C696E
              65203A3D2046616C73653B0D0A2020202020202020200D0A202020696620706C
              456E74726965735B27497353757065724F776E6572275D207468656E20626567
              696E0D0A2020202020204F776E2E466F6E742E426F6C64203A3D20547275653B
              0D0A2020202020204F776E2E466F6E742E556E6465726C696E65203A3D205472
              75653B0D0A202020656E643B0D0A2020200D0A202020696620706C456E747269
              65735B27546F74616C4F776E57696E50637452616E6B275D203D203120746865
              6E20626567696E0D0A09204F776E2E466F6E742E426F6C64203A3D2054727565
              3B0D0A20202020656E6420656C736520626567696E0D0A09204F776E2E466F6E
              742E426F6C64203A3D2046616C73653B0D0A20202020656E643B200D0A0D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D6506034F776E094576656E74
              4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
              656E7448616E646C65720B50726F6772616D4E616D65060E45726C506163654F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F757263650C4901000070726F6365647572652045726C506163654F6E5072
              696E743B0D0A626567696E0D0A20202020202045726C506163652E466F6E742E
              426F6C64203A3D2046616C73653B0D0A20202020202045726C506163652E466F
              6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020202020200D0A
              09696620706C456E74726965735B274561726C795061636552616E6B275D203D
              2031207468656E20626567696E0D0A0920202045726C506163652E466F6E742E
              426F6C64203A3D20547275653B0D0A202020202020202020696620706C456E74
              726965735B27497346726F6E74446F75626C654C696E6572275D207468656E20
              626567696E0D0A0920202020202045726C506163652E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A202020202020202020656E643B200D0A20
              2020202020656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D65060745726C50616365094576656E744E616D6506074F6E5072696E740745
              76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D65060F546F74616C54726E4F6E5072696E740B50726F6772616D
              54797065070B747450726F63656475726506536F7572636506C870726F636564
              75726520546F74616C54726E4F6E5072696E743B0D0A626567696E0D0A696620
              706C456E74726965735B27546F74616C54726E4F64647357696E50637452616E
              6B275D203D2031207468656E20626567696E0D0A09202020546F74616C54726E
              2E466F6E742E426F6C64203A3D20547275653B0D0A202020202020656E642065
              6C736520626567696E0D0A09202020546F74616C54726E2E466F6E742E426F6C
              64203A3D2046616C73653B0D0A202020202020656E643B200D0A0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D650608546F74616C54726E094576656E74
              4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
              656E7448616E646C65720B50726F6772616D4E616D65060D54726E4A6B794F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F757263650C1E01000070726F6365647572652054726E4A6B794F6E5072696E
              743B0D0A626567696E0D0A696620706C456E74726965735B27546F74616C5472
              6E4A6B7957696E50637452616E6B275D203D2031207468656E20626567696E0D
              0A0920202054726E4A6B792E466F6E742E426F6C64203A3D20547275653B0D0A
              20202020202020202054726E4A6B792E466F6E742E4974616C6963203A3D2046
              616C73653B0D0A202020202020656E6420656C736520626567696E0D0A202020
              20202020202054726E4A6B792E466F6E742E426F6C64203A3D2046616C73653B
              0D0A20202020202020202054726E4A6B792E466F6E742E4974616C6963203A3D
              2046616C73653B0D0A2020202020202020200D0A202020202020656E643B0D0A
              0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060654726E4A6B790945
              76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
              72614576656E7448616E646C65720B50726F6772616D4E616D65060D4A6B794C
              33304F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F7572636506CD70726F636564757265204A6B794C33304F6E507269
              6E743B0D0A626567696E0D0A20696620706C456E74726965735B27546F74616C
              4A6B79333057696E50637452616E6B275D203D2031207468656E20626567696E
              0D0A092020202020202020204A6B794C33302E466F6E742E426F6C64203A3D20
              547275653B0D0A202020202020656E6420656C736520626567696E0D0A092020
              202020202020204A6B794C33302E466F6E742E426F6C64203A3D2046616C7365
              3B0D0A202020202020656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D6506064A6B794C3330094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D65060D54726E4F776E4F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506CE70726F6365
              647572652054726E4F776E4F6E5072696E743B0D0A626567696E0D0A20696620
              706C456E74726965735B27546F74616C54726E4F776E57696E50637452616E6B
              275D203D2031207468656E20626567696E0D0A0920202020202020202054726E
              4F776E2E466F6E742E426F6C64203A3D20547275653B0D0A202020202020656E
              6420656C736520626567696E0D0A0920202020202020202054726E4F776E2E46
              6F6E742E426F6C64203A3D2046616C73653B0D0A202020202020656E643B200D
              0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060654726E4F776E09
              4576656E744E616D6506074F6E5072696E74074576656E74494402200001060F
              5472614576656E7448616E646C65720B50726F6772616D4E616D65060F56616C
              75654265744F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650C6401000070726F6365647572652056616C7565
              4265744F6E5072696E743B0D0A626567696E0D0A0D0A202056616C7565426574
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A202020202020200D0A20
              2020696620706C456E74726965735B2746696E616C56616C7565426574275D20
              3E3D20312E3030207468656E20626567696E0D0A2020202020200D0A20202020
              20202020202020200D0A20202020202069662028706C456E74726965735B2749
              73446F6C6C6172275D29206F722028706C456E74726965735B274973446F7562
              6C65446F6C6C6172275D29207468656E20626567696E0D0A2020202020202020
              2056616C75654265742E466F6E742E426F6C64203A3D20547275653B0D0A2020
              2020202020202056616C75654265742E56697369626C65203A3D20547275653B
              0D0A202020202020656E643B20202020202020202020202020200D0A20202065
              6E643B200D0A2020200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
              616D65060856616C7565426574094576656E744E616D6506074F6E5072696E74
              074576656E74494402200001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D65060F4C617465506163654F6E5072696E740B50726F6772
              616D54797065070B747450726F63656475726506536F757263650CC601000070
              726F636564757265204C617465506163654F6E5072696E743B0D0A626567696E
              0D0A2020202020204C617465506163652E466F6E742E426F6C64203A3D204661
              6C73653B0D0A2020202020204C617465506163652E466F6E742E556E6465726C
              696E65203A3D2046616C73653B0D0A2020202020200D0A09696620706C456E74
              726965735B274C6174655061636552616E6B275D203D2031207468656E206265
              67696E0D0A202020202020202020696620706C456E74726965735B2749734261
              636B446F75626C654C696E6572275D207468656E20626567696E0D0A09202020
              2020204C617465506163652E466F6E742E556E6465726C696E65203A3D205472
              75653B0D0A202020202020202020656E643B200D0A202020202020656E643B20
              0D0A0D0A202020202020696620706C456E74726965735B274C61746550616365
              52616E6B275D203D2031207468656E20626567696E0D0A092020204C61746550
              6163652E466F6E742E426F6C64203A3D20547275653B0D0A202020202020656E
              6420656C736520626567696E0D0A092020204C617465506163652E466F6E742E
              426F6C64203A3D2046616C73653B0D0A202020202020656E643B200D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D6506084C61746550616365094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D65060D54726E3173
              744F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
              6506536F7572636506AF70726F6365647572652054726E3173744F6E5072696E
              743B0D0A626567696E0D0A2020696620706C456E74726965735B274465627574
              496E64696361746F72275D203D20272A27207468656E20626567696E0D0A0920
              202054726E3173742E56697369626C65203A3D20547275653B0D0A09656E6420
              656C736520626567696E0D0A0920202054726E3173742E56697369626C65203A
              3D2046616C73653B0D0A09656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D65060654726E317374094576656E744E616D6506074F6E507269
              6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
              50726F6772616D4E616D65060F7661724C61794F6E476574546578740B50726F
              6772616D54797065070B747450726F63656475726506536F757263650CA80400
              0070726F636564757265207661724C61794F6E47657454657874287661722054
              6578743A20537472696E67293B0D0A766172200D0A73506374203A2073747269
              6E673B0D0A626567696E0D0A20202073506374203A3D2027273B0D0A20202076
              61724C61792E466F6E742E426F6C64203A3D2046616C73653B0D0A0D0A202020
              6966202828706C456E74726965735B27446179734C617374275D203E3D203129
              20616E642028706C456E74726965735B27446179734C617374275D203C3D2037
              2929207468656E20626567696E0D0A2020200973506374203A3D20496E74546F
              53747228706C456E74726965735B27546F74616C54726E313757696E50637427
              5D293B0D0A202020656E643B0D0A0D0A2020206966202828706C456E74726965
              735B27446179734C617374275D203E3D20382920616E642028706C456E747269
              65735B27446179734C617374275D203C3D2031342929207468656E2062656769
              6E0D0A2020200973506374203A3D20496E74546F53747228706C456E74726965
              735B27546F74616C54726E38313457696E506374275D293B0D0A202020656E64
              3B0D0A0D0A2020206966202828706C456E74726965735B27446179734C617374
              275D203E3D2031352920616E642028706C456E74726965735B27446179734C61
              7374275D203C3D2032312929207468656E20626567696E0D0A20202009735063
              74203A3D20496E74546F53747228706C456E74726965735B27546F74616C5472
              6E3135323157696E506374275D293B0D0A202020656E643B0D0A0D0A20202069
              66202828706C456E74726965735B27446179734C617374275D203E3D20323229
              20616E642028706C456E74726965735B27446179734C617374275D203C3D2033
              302929207468656E20626567696E0D0A2020200973506374203A3D20496E7454
              6F53747228706C456E74726965735B27546F74616C54726E3232333057696E50
              6374275D293B0D0A202020656E643B0D0A2020202020202020202020200D0A20
              20206966202828706C456E74726965735B27446179734C617374275D203E3D20
              33312920616E642028706C456E74726965735B27446179734C617374275D203C
              3D2036302929207468656E20626567696E0D0A2020200973506374203A3D2049
              6E74546F53747228706C456E74726965735B27546F74616C54726E3331363057
              696E506374275D293B0D0A202020656E643B0D0A2020200D0A20202069662028
              28706C456E74726965735B27446179734C617374275D203E3D2036312920616E
              642028706C456E74726965735B27446179734C617374275D203C3D2039302929
              207468656E20626567696E0D0A20202020202073506374203A3D20496E74546F
              53747228706C456E74726965735B27546F74616C54726E3631393057696E5063
              74275D293B0D0A202020656E643B0D0A2020200D0A2020206966202828706C45
              6E74726965735B27446179734C617374275D203E3D20393129207468656E2062
              6567696E0D0A2020200973506374203A3D20496E74546F53747228706C456E74
              726965735B27546F74616C54726E3931506C757357696E506374275D293B0D0A
              202020656E643B0D0A2020200D0A20202054657874203A3D20735063740D0A20
              200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506067661724C617909
              4576656E744E616D6506094F6E47657454657874074576656E74494402350001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061176
              617256616C75654F6E476574546578740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C3601000070726F6365647572652076
              617256616C75654F6E476574546578742876617220546578743A20537472696E
              67293B0D0A766172200D0A73506374203A20737472696E673B0D0A0D0A626567
              696E0D0A20202020202054657874203A3D202720273B0D0A2020202020202020
              200D0A20202020202069662028706C456E74726965735B274973446F6C6C6172
              275D29207468656E20626567696E0D0A20202020202020202054657874203A3D
              202724273B0D0A202020202020656E643B200D0A2020202020200D0A20202020
              202069662028706C456E74726965735B274973446F75626C65446F6C6C617227
              5D2920207468656E20626567696E0D0A20202020202020202054657874203A3D
              20272424273B0D0A202020202020656E643B200D0A2020202020200D0A200D0A
              200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D6506087661725661
              6C7565094576656E744E616D6506094F6E47657454657874074576656E744944
              02350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              65060F76617256616C75654F6E5072696E740B50726F6772616D54797065070B
              747450726F63656475726506536F757263650C1801000070726F636564757265
              2076617256616C75654F6E5072696E743B0D0A626567696E0D0A202020766172
              56616C75652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020
              202020200D0A20202069662028706C456E74726965735B274973446F75626C65
              446F6C6C6172275D29207468656E20626567696E0D0A20202020202076617256
              616C75652E466F6E742E426F6C64203A3D20547275653B0D0A202020656E643B
              200D0A20202069662028706C456E74726965735B274973446F6C6C6172275D29
              207468656E20626567696E0D0A20202020202076617256616C75652E466F6E74
              2E426F6C64203A3D20547275653B0D0A202020656E643B200D0A202020202020
              0D0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060876
              617256616C7565094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D65060C54726E33304F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F7572636506C070726F6365647572652054726E
              33304F6E5072696E743B0D0A626567696E0D0A09696620706C456E7472696573
              5B27546F74616C54726E333057696E50637452616E6B275D203D203120746865
              6E20626567696E0D0A0920202054726E33302E466F6E742E426F6C64203A3D20
              547275653B0D0A202020202020656E6420656C736520626567696E0D0A092020
              2054726E33302E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020
              2020656E643B200D0A0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D
              65060554726E3330094576656E744E616D6506074F6E5072696E74074576656E
              74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
              4E616D6506117661724C6179576F4F6E476574546578740B50726F6772616D54
              797065070B747450726F63656475726506536F757263650C6A01000070726F63
              6564757265207661724C6179576F4F6E47657454657874287661722054657874
              3A20537472696E67293B0D0A5641520D0A73506374203A20737472696E673B0D
              0A626567696E0D0A20202073506374203A3D2027273B0D0A2020207661724C61
              792E466F6E742E426F6C64203A3D2046616C73653B0D0A2020200D0A20202069
              662028706C456E74726965735B274E6272576F726B734C617374275D203E2030
              29207468656E20626567696E0D0A200973506374203A3D20496E74546F537472
              28706C456E74726965735B274E6272576F726B734C617374275D293B0D0A0969
              662028706C456E74726965735B274E6272576F726B734C617374275D203E2031
              297468656E20626567696E0D0A092020207661724C61792E466F6E742E426F6C
              64203A3D20547275653B0D0A202020202009656E643B200D0A202020656E643B
              2020200D0A2020200D0A20202054657874203A3D20735063740D0A2020200D0A
              454E443B0D0A0D436F6D706F6E656E744E616D6506087661724C6179576F0945
              76656E744E616D6506094F6E47657454657874074576656E7449440235000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506104D75
              64526174696E674F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F757263650C1201000070726F636564757265204D7564
              526174696E674F6E5072696E743B0D0A626567696E0D0A09696620706C456E74
              726965735B274D7564526174696E6752616E6B275D203D2031207468656E2062
              6567696E0D0A092020204D7564526174696E672E466F6E742E426F6C64203A3D
              20547275653B0D0A092020204D7564526174696E672E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A202020202020656E6420656C7365206265
              67696E0D0A092020204D7564526174696E672E466F6E742E426F6C64203A3D20
              46616C73653B0D0A092020204D7564526174696E672E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A202020202020656E643B200D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D6506094D7564526174696E670945
              76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
              72614576656E7448616E646C65720B50726F6772616D4E616D650610436C7352
              6174696E674F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650CD601000070726F63656475726520436C735261
              74696E674F6E5072696E743B0D0A626567696E0D0A2069662028706C52616365
              735265706F72745B275261636554797065275D203D20274D53572729206F7220
              28706C52616365735265706F72745B275261636554797065275D203D20274D43
              4C272920207468656E20626567696E0D0A20202009436C73526174696E672E56
              697369626C65203A3D20547275653B0D0A20202020656E6420656C7365206265
              67696E0D0A202020202020436C73526174696E672E56697369626C65203A3D20
              46616C73653B0D0A20202020656E643B0D0A2020200D0A202020696620706C45
              6E74726965735B27436C617373526174696E6752616E6B275D203D2031207468
              656E20626567696E0D0A0920436C73526174696E672E466F6E742E426F6C6420
              3A3D20547275653B0D0A0920436C73526174696E672E466F6E742E556E646572
              6C696E65203A3D20547275653B0D0A0D0A202020656E6420656C736520626567
              696E0D0A20202020202020436C73526174696E672E466F6E742E426F6C64203A
              3D2046616C73653B0D0A20202020202020436C73526174696E672E466F6E742E
              556E6465726C696E65203A3D2046616C73653B0D0A202020656E643B200D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D650609436C73526174696E67
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506105472
              66526174696E674F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F757263650CA701000070726F63656475726520547266
              526174696E674F6E5072696E743B0D0A626567696E0D0A2020696620706C5261
              6365735265706F72745B2753757266616365275D203D20275427207468656E20
              626567696E0D0A20202009547266526174696E672E56697369626C65203A3D20
              547275653B0D0A202020656E6420656C736520626567696E0D0A202020095472
              66526174696E672E56697369626C65203A3D2046616C73653B0D0A202020656E
              643B0D0A2020200D0A09696620706C456E74726965735B275475726652617469
              6E6752616E6B275D203D2031207468656E20626567696E0D0A09202020547266
              526174696E672E466F6E742E426F6C64203A3D20547275653B0D0A0920202054
              7266526174696E672E466F6E742E556E6465726C696E65203A3D20547275653B
              0D0A202020202020656E6420656C736520626567696E0D0A0920202054726652
              6174696E672E466F6E742E426F6C64203A3D2046616C73653B0D0A0920202054
              7266526174696E672E466F6E742E556E6465726C696E65203A3D2046616C7365
              3B0D0A202020202020656E643B200D0A0D0A0D0A656E643B0D0A0D436F6D706F
              6E656E744E616D650609547266526174696E67094576656E744E616D6506074F
              6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
              6C65720B50726F6772616D4E616D65060E4D6964506163654F6E5072696E740B
              50726F6772616D54797065070B747450726F63656475726506536F757263650C
              F501000070726F636564757265204D6964506163654F6E5072696E743B0D0A62
              6567696E0D0A0D0A094D6964506163652E466F6E742E556E6465726C696E6520
              3A3D2046616C73653B0D0A2020202020204D6964506163652E466F6E742E426F
              6C64203A3D2046616C73653B0D0A0D0A09696620706C456E74726965735B274D
              6964646C655061636552616E6B275D203D2031207468656E20626567696E0D0A
              092020204D6964506163652E466F6E742E426F6C64203A3D20547275653B0D0A
              202020202020202020696620706C456E74726965735B274561726C7950616365
              52616E6B275D203D2031207468656E20626567696E0D0A092020202020204D69
              64506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A20
              2020202020202020656E643B200D0A202020202020656E643B200D0A0D0A0969
              6620706C456E74726965735B274D6964646C655061636552616E6B275D203D20
              31207468656E20626567696E0D0A202020202020202020696620706C456E7472
              6965735B274C6174655061636552616E6B275D203D2031207468656E20626567
              696E0D0A092020202020204D6964506163652E466F6E742E556E6465726C696E
              65203A3D20547275653B0D0A202020202020202020656E643B200D0A20202020
              2020656E643B200D0A2020202020200D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D6506074D696450616365094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D65060D4A6B79416C6C4F6E5072696E740B50726F67
              72616D54797065070B747450726F63656475726506536F7572636506C270726F
              636564757265204A6B79416C6C4F6E5072696E743B0D0A626567696E0D0A2069
              6620706C456E74726965735B27546F74616C4A6B794F64647357696E50637452
              616E6B275D203D2031207468656E20626567696E0D0A2020202020204A6B7941
              6C6C2E466F6E742E426F6C64203A3D20547275653B0D0A202020656E6420656C
              736520626567696E0D0A2020202020204A6B79416C6C2E466F6E742E426F6C64
              203A3D2046616C73653B0D0A20202020656E643B200D0A0D0A656E643B0D0A0D
              436F6D706F6E656E744E616D6506064A6B79416C6C094576656E744E616D6506
              074F6E5072696E74074576656E74494402200001060F5472614576656E744861
              6E646C65720B50726F6772616D4E616D65060D54726E5472664F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06B170726F6365647572652054726E5472664F6E5072696E743B0D0A62656769
              6E0D0A202020696620706C52616365735265706F72745B275375726661636527
              5D203D20275427207468656E20626567696E0D0A2020200954726E5472662E56
              697369626C65203A3D20547275653B0D0A202020656E6420656C736520626567
              696E0D0A2020200954726E5472662E56697369626C65203A3D2046616C73653B
              0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              65060654726E547266094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D65060D54726E436C6D4F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F7572636506AB70726F63656475726520
              54726E436C6D4F6E5072696E743B0D0A626567696E0D0A2020696620706C456E
              74726965735B274C617374436C61696D6564275D203D20274327207468656E20
              626567696E0D0A090954726E436C6D2E56697369626C65203A3D20547275653B
              0D0A09656E6420656C736520626567696E0D0A090954726E436C6D2E56697369
              626C65203A3D2046616C73653B0D0A09656E643B0D0A200D0A0D0A656E643B0D
              0A0D436F6D706F6E656E744E616D65060654726E436C6D094576656E744E616D
              6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D65060E76617253634F6E47657454
              6578740B50726F6772616D54797065070B747450726F63656475726506536F75
              7263650C3802000070726F6365647572652076617253634F6E47657454657874
              2876617220546578743A20537472696E67293B0D0A766172200D0A7350637420
              3A20737472696E673B0D0A626567696E0D0A20202073506374203A3D2027273B
              0D0A20202076617253632E466F6E742E426F6C64203A3D2046616C73653B0D0A
              2020202020202020202020200D0A202020696620202828706C456E7472696573
              5B27497354757266546F44697274275D203D205472756529207468656E206265
              67696E0D0A2020202020696620706C456E74726965735B2754726E5475726654
              6F4469727457696E506374275D207468656E20626567696E0D0A202020092020
              2073506374203A3D20496E74546F53747228706C456E74726965735B2754726E
              54757266546F4469727457696E506374275D293B0D0A2020202020656E643B20
              20202020202020200D0A202020656E643B0D0A2020200D0A2020206966202028
              28706C456E74726965735B27497344697274546F54757266275D203D20547275
              6529207468656E20626567696E0D0A2020202020696620706C456E7472696573
              5B2754726E44697274546F5475726657696E506374275D203E2030207468656E
              20626567696E0D0A2020200920202073506374203A3D20496E74546F53747228
              706C456E74726965735B2754726E44697274546F5475726657696E506374275D
              293B0D0A2020202020656E643B2020202020202020200D0A202020656E643B0D
              0A2020200D0A202054657874203A3D20535063740D0A0D0A656E643B0D0A0D0A
              0D436F6D706F6E656E744E616D6506057661725363094576656E744E616D6506
              094F6E47657454657874074576656E74494402350001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D65060E76617244434F6E47657454
              6578740B50726F6772616D54797065070B747450726F63656475726506536F75
              7263650C2602000070726F6365647572652076617244434F6E47657454657874
              2876617220546578743A20537472696E67293B0D0A766172200D0A7350637420
              3A20737472696E673B0D0A626567696E0D0A20202073506374203A3D2027273B
              0D0A20202076617244632E466F6E742E426F6C64203A3D2046616C73653B0D0A
              2020202020202020202020200D0A202020696620202828706C456E7472696573
              5B274973527465546F537072275D203D205472756529207468656E2062656769
              6E0D0A202020202020696620706C456E74726965735B2754726E527465546F53
              707257696E506374275D203E2030207468656E20626567696E0D0A2020202020
              2020202073506374203A3D20496E74546F53747228706C456E74726965735B27
              54726E527465546F53707257696E506374275D293B0D0A202020202020656E64
              3B200D0A202020656E643B0D0A2020200D0A2020206966202828706C456E7472
              6965735B274973537072546F527465275D203D205472756529207468656E2062
              6567696E0D0A202020202020696620706C456E74726965735B2754726E537072
              546F52746557696E506374275D203E2030207468656E20626567696E0D0A2020
              2020202020202073506374203A3D20496E74546F53747228706C456E74726965
              735B2754726E537072546F52746557696E506374275D293B0D0A202020202020
              656E643B2020200D0A202020656E643B0D0A202054657874203A3D2053506374
              0D0A0D0A656E643B0D0A0D0A0D0A0D436F6D706F6E656E744E616D6506057661
              724443094576656E744E616D6506094F6E47657454657874074576656E744944
              02350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
              6506164C617374436C617373526174696E674F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506D570726F6365
              64757265204C617374436C617373526174696E674F6E5072696E743B0D0A6265
              67696E0D0A20696620706C456E74726965735B274C617374537065656452616E
              6B275D203D2031207468656E20626567696E0D0A092020204C617374436C6173
              73526174696E672E466F6E742E426F6C64203A3D20547275653B0D0A20202020
              2020656E6420656C736520626567696E0D0A092020204C617374436C61737352
              6174696E672E466F6E742E426F6C64203A3D2046616C73653B0D0A2020202020
              20656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F
              4C617374436C617373526174696E67094576656E744E616D6506074F6E507269
              6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
              50726F6772616D4E616D650615417667436C617373526174696E674F6E507269
              6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
              636506CA70726F63656475726520417667436C617373526174696E674F6E5072
              696E743B0D0A626567696E0D0A20696620706C456E74726965735B2741766753
              7065656452616E6B275D203D2031207468656E20626567696E0D0A2020202020
              20417667436C617373526174696E672E466F6E742E426F6C64203A3D20547275
              653B0D0A202020656E6420656C736520626567696E0D0A09417667436C617373
              526174696E672E466F6E742E426F6C64203A3D2046616C73653B0D0A20202065
              6E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E4176
              67436C617373526174696E67094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D6506126C626C45726C506F734F6E476574546578740B50726F
              6772616D54797065070B747450726F63656475726506536F757263650C1A0100
              0070726F636564757265206C626C45726C506F734F6E47657454657874287661
              7220546578743A20537472696E67293B0D0A626567696E0D0A54657874203A3D
              202720273B0D0A20200D0A2020696620706C456E74726965735B274561726C79
              50616365506F73275D203C3E2039393939207468656E20626567696E0D0A2020
              2020696620706C456E74726965735B274561726C7950616365506F73275D203C
              3E2030207468656E20626567696E0D0A092020696620706C456E74726965735B
              274561726C7950616365506F7352616E6B275D203D2031207468656E20626567
              696E0D0A0909202054657874203A3D20272A273B0D0A092020656E643B0D0A20
              202020656E643B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D70
              6F6E656E744E616D6506096C626C45726C506F73094576656E744E616D650609
              4F6E47657454657874074576656E74494402350001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D6506126C626C4D6964506F734F6E47
              6574546578740B50726F6772616D54797065070B747450726F63656475726506
              536F757263650C3901000070726F636564757265206C626C4D6964506F734F6E
              476574546578742876617220546578743A20537472696E67293B0D0A62656769
              6E0D0A0D0A54657874203A3D202720273B0D0A0D0A2020696620706C456E7472
              6965735B274D6964646C6550616365506F73275D203C3E203939393920746865
              6E20626567696E0D0A2020202020696620706C456E74726965735B274D696464
              6C6550616365506F73275D203C3E2030207468656E20626567696E0D0A202020
              2020202020696620706C456E74726965735B274D6964646C6550616365506F73
              52616E6B275D203D2031207468656E20626567696E0D0A202020202020202020
              202054657874203A3D20272A273B0D0A2020202020202020656E643B0D0A2020
              202020656E643B0D0A2020656E643B202020202020200D0A0D0A0D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D6506096C626C4D6964506F73094576
              656E744E616D6506094F6E47657454657874074576656E74494402350001060F
              5472614576656E7448616E646C65720B50726F6772616D4E616D6506136C626C
              4C617465506F734F6E476574546578740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C2C01000070726F636564757265206C
              626C4C617465506F734F6E476574546578742876617220546578743A20537472
              696E67293B0D0A626567696E0D0A0D0A2054657874203A3D202720273B0D0A20
              200D0A2020696620706C456E74726965735B274C61746550616365506F73275D
              203C3E2039393939207468656E20626567696E0D0A2020202020696620706C45
              6E74726965735B274C61746550616365506F73275D203C3E2030207468656E20
              626567696E0D0A2020202020202020696620706C456E74726965735B274C6174
              6550616365506F7352616E6B275D203D2031207468656E20626567696E0D0A20
              09202020202054657874203A3D20272A273B0D0A2020202020202020656E643B
              0D0A2020202020656E643B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D
              0A0D436F6D706F6E656E744E616D65060A6C626C4C617465506F73094576656E
              744E616D6506094F6E47657454657874074576656E74494402350001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D65060D54726E3259
              6F4F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
              6506536F7572636506AA70726F6365647572652054726E32596F4F6E5072696E
              743B0D0A626567696E0D0A20696620706C456E74726965735B27416765275D20
              3D2032207468656E20626567696E0D0A2020200954726E32596F2E5669736962
              6C65203A3D20547275653B0D0A202020656E6420656C736520626567696E0D0A
              20202020202054726E32596F2E56697369626C65203A3D2046616C73653B0D0A
              202020656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D65060654726E32596F094576656E744E616D6506074F6E5072696E74074576
              656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
              616D4E616D65060F54726E436C734F6E476574546578740B50726F6772616D54
              797065070B747450726F63656475726506536F757263650C5F03000070726F63
              65647572652054726E436C734F6E476574546578742876617220546578743A20
              537472696E67293B0D0A7661720D0A73506374203A20737472696E673B0D0A62
              6567696E20202020202020202020202020202020202020202020202020202020
              20202020202020202020202020202020202020202020200D0A20202073506374
              203A3D2027273B0D0A0D0A20202069662028706C52616365735265706F72745B
              275261636554797065275D203D20274D53572729207468656E20626567696E0D
              0A20202020202073506374203A3D20496E74546F53747228706C456E74726965
              735B2754726E4D646E57696E506374275D293B0D0A202020656E643B0D0A0D0A
              20202069662028706C52616365735265706F72745B275261636554797065275D
              203D20274D434C2729207468656E20626567696E0D0A20202020202073506374
              203A3D20496E74546F53747228706C456E74726965735B2754726E4D646E5769
              6E506374275D293B0D0A202020656E643B0D0A2020200D0A2020206966202870
              6C52616365735265706F72745B275261636554797065275D203D2027434C4D27
              29207468656E20626567696E0D0A20202020202073506374203A3D20496E7454
              6F53747228706C456E74726965735B2754726E436C6D57696E506374275D293B
              0D0A202020656E643B0D0A0D0A20202069662028706C52616365735265706F72
              745B275261636554797065275D203D20274F434C4D2729207468656E20626567
              696E0D0A20202020202073506374203A3D20496E74546F53747228706C456E74
              726965735B2754726E436C6D57696E506374275D293B0D0A202020656E643B0D
              0A2020200D0A20202069662028706C52616365735265706F72745B2752616365
              54797065275D203D2027414C572729207468656E20626567696E0D0A20202020
              202073506374203A3D20496E74546F53747228706C456E74726965735B275472
              6E416C7757696E506374275D293B0D0A202020656E643B0D0A2020200D0A2020
              2069662073506374203D202727207468656E20626567696E0D0A202020202020
              73506374203A3D20496E74546F53747228706C456E74726965735B2754726E53
              746B57696E506374275D293B0D0A202020656E643B2020200D0A2020200D0A20
              202054657874203A3D20735063740D0A2020200D0A656E643B0D0A0D436F6D70
              6F6E656E744E616D65060654726E436C73094576656E744E616D6506094F6E47
              657454657874074576656E74494402350001060F5472614576656E7448616E64
              6C65720B50726F6772616D4E616D65060E54726E4E616D654F6E5072696E740B
              50726F6772616D54797065070B747450726F63656475726506536F7572636506
              FC70726F6365647572652054726E4E616D654F6E5072696E743B0D0A62656769
              6E0D0A0D0A20202054726E4E616D652E466F6E742E426F6C64203A3D2046616C
              73653B0D0A20202054726E4E616D652E466F6E742E556E6465726C696E65203A
              3D2046616C73653B0D0A2020202020202020200D0A202020696620706C456E74
              726965735B2749735375706572547261696E6572275D207468656E2062656769
              6E0D0A20202020202054726E4E616D652E466F6E742E426F6C64203A3D205472
              75653B0D0A20202020202054726E4E616D652E466F6E742E556E6465726C696E
              65203A3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D65060754726E4E616D65094576656E744E616D650607
              4F6E5072696E74074576656E74494402200001060F5472614576656E7448616E
              646C65720B50726F6772616D4E616D65060E4A6B794E616D654F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06F770726F636564757265204A6B794E616D654F6E5072696E743B0D0A626567
              696E0D0A2020204A6B794E616D652E466F6E742E426F6C64203A3D2046616C73
              653B0D0A2020204A6B794E616D652E466F6E742E556E6465726C696E65203A3D
              2046616C73653B0D0A2020202020202020200D0A202020696620706C456E7472
              6965735B27497353757065724A6F636B6579275D207468656E20626567696E0D
              0A2020202020204A6B794E616D652E466F6E742E426F6C64203A3D2054727565
              3B0D0A2020202020204A4B794E616D652E466F6E742E556E6465726C696E6520
              3A3D20547275653B0D0A202020656E643B0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D6506074A6B794E616D65094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D65060D54726E326E644F6E5072696E740B50726F67
              72616D54797065070B747450726F63656475726506536F7572636506B670726F
              6365647572652054726E326E644F6E5072696E743B0D0A626567696E0D0A0D0A
              202020202020696620706C456E74726965735B274465627574496E6469636174
              6F72275D203D20272A2A27207468656E20626567696E0D0A090954726E326E64
              2E56697369626C65203A3D20547275653B0D0A09656E6420656C736520626567
              696E0D0A090954726E326E642E56697369626C65203A3D2046616C73653B0D0A
              09656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              65060654726E326E64094576656E744E616D6506074F6E5072696E7407457665
              6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
              6D4E616D650618546F74616C526174696E675265706F72744F6E5072696E740B
              50726F6772616D54797065070B747450726F63656475726506536F7572636506
              3470726F63656475726520546F74616C526174696E675265706F72744F6E5072
              696E743B0D0A626567696E0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
              616D650611546F74616C526174696E675265706F7274094576656E744E616D65
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D6506147661724C61794F72436C6D4F
              6E476574546578740B50726F6772616D54797065070B747450726F6365647572
              6506536F757263650C9101000070726F636564757265207661724C61794F7243
              6C6D4F6E476574546578742876617220546578743A20537472696E67293B0D0A
              626567696E0D0A0D0A2020202054657874203A3D20202720273B0D0A20200D0A
              2020696620706C456E74726965735B274973436C61696D6564416E645570275D
              203D2054727565207468656E200D0A2020626567696E0D0A2020095465787420
              3A3D2027435E273B200D0A2020656E643B0D0A2020696620706C456E74726965
              735B2749734C61796F6666416E645570275D203D2054727565207468656E200D
              0A2020626567696E0D0A20202020202054657874203A3D20274C5E273B200D0A
              2020656E643B0D0A20200D0A202069662028706C456E74726965735B2749734C
              61796F6666416E645570275D203D20547275652920616E64200D0A2020202020
              28706C456E74726965735B274973436C61696D6564416E645570275D203D2054
              72756529207468656E200D0A2020626567696E0D0A20200954657874203A3D20
              274C5E435E273B200D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D65060B7661724C61794F72436C6D094576656E744E
              616D6506094F6E47657454657874074576656E74494402350001060F54726145
              76656E7448616E646C65720B50726F6772616D4E616D650613547266496E6469
              6361746F724F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F757263650CBE01000070726F63656475726520547266496E
              64696361746F724F6E5072696E743B0D0A626567696E0D0A0D0A202020206966
              20706C52616365735265706F72745B2753757266616365275D203D2027542720
              7468656E20626567696E0D0A20202009547266496E64696361746F722E566973
              69626C65203A3D20547275653B0D0A202020656E6420656C736520626567696E
              0D0A20202009547266496E64696361746F722E56697369626C65203A3D204661
              6C73653B0D0A202020656E643B0D0A2020200D0A09696620706C456E74726965
              735B2754757266526174696E6752616E6B275D203D2031207468656E20626567
              696E0D0A09202020547266496E64696361746F722E466F6E742E426F6C64203A
              3D20547275653B0D0A09202020547266496E64696361746F722E466F6E742E55
              6E6465726C696E65203A3D20547275653B0D0A202020202020656E6420656C73
              6520626567696E0D0A09202020547266496E64696361746F722E466F6E742E42
              6F6C64203A3D2046616C73653B0D0A09202020547266496E64696361746F722E
              466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A202020202020
              656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C54
              7266496E64696361746F72094576656E744E616D6506074F6E5072696E740745
              76656E74494402200000}
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 64
    Top = 115
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 408
    Top = 112
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbJoesValueReport'
    EngineVersion = '4.05'
    TableName = 'Race.DAT'
    Left = 496
    Top = 176
  end
end
