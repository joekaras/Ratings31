object HospitalReport2Form: THospitalReport2Form
  Left = 83
  Top = 178
  Width = 576
  Height = 333
  Caption = 'Hospital Report 2'
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
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHospitalReport2'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTrkCodeRaceNbr'
    TableName = 'Race.DAT'
    Left = 32
    Top = 112
    object tblRacesMasterTrkCode: TStringField
      FieldName = 'TrkCode'
      Origin = 'Race.TrkCode'
      Required = True
      Size = 3
    end
    object tblRacesMasterRaceDate: TDateField
      FieldName = 'RaceDate'
      Origin = 'Race.RaceDate'
      Required = True
    end
    object tblRacesMasterRangeRaceDate: TDateField
      FieldName = 'RangeRaceDate'
      Origin = 'Race.RangeRaceDate'
    end
    object tblRacesMasterRaceNbr: TSmallintField
      FieldName = 'RaceNbr'
      Origin = 'Race.RaceNbr'
      Required = True
    end
    object tblRacesMasterEstTimeOfRace: TTimeField
      FieldName = 'EstTimeOfRace'
      Origin = 'Race.EstTimeOfRace'
    end
    object tblRacesMasterEstTimeOfFirstRace: TTimeField
      FieldName = 'EstTimeOfFirstRace'
      Origin = 'Race.EstTimeOfFirstRace'
    end
    object tblRacesMasterLocalTimeOfRace: TTimeField
      FieldName = 'LocalTimeOfRace'
      Origin = 'Race.LocalTimeOfRace'
    end
    object tblRacesMasterCT: TStringField
      FieldName = 'CT'
      Origin = 'Race.CT'
      Size = 10
    end
    object tblRacesMasterSurface: TStringField
      FieldName = 'Surface'
      Origin = 'Race.Surface'
      Size = 1
    end
    object tblRacesMasterActualSurface: TStringField
      FieldName = 'ActualSurface'
      Origin = 'Race.ActualSurface'
      Size = 1
    end
    object tblRacesMasterAltSurface: TStringField
      FieldName = 'AltSurface'
      Origin = 'Race.AltSurface'
      Size = 10
    end
    object tblRacesMasterDistanceInFeet: TSmallintField
      FieldName = 'DistanceInFeet'
      Origin = 'Race.DistanceInFeet'
    end
    object tblRacesMasterDistanceInYards: TSmallintField
      FieldName = 'DistanceInYards'
      Origin = 'Race.DistanceInYards'
    end
    object tblRacesMasterDistanceInFurlongs: TFloatField
      FieldName = 'DistanceInFurlongs'
      Origin = 'Race.DistanceInFurlongs'
    end
    object tblRacesMasterDistanceDesc: TStringField
      FieldName = 'DistanceDesc'
      Origin = 'Race.DistanceDesc'
      Size = 15
    end
    object tblRacesMasterRaceType: TStringField
      FieldName = 'RaceType'
      Origin = 'Race.RaceType'
      Size = 4
    end
    object tblRacesMasterTypeOfRace: TStringField
      FieldName = 'TypeOfRace'
      Origin = 'Race.TypeOfRace'
      Size = 1
    end
    object tblRacesMasterRaceTypeDesc: TStringField
      FieldName = 'RaceTypeDesc'
      Origin = 'Race.RaceTypeDesc'
      Size = 25
    end
    object tblRacesMasterRaceDesc: TStringField
      FieldName = 'RaceDesc'
      Origin = 'Race.RaceDesc'
      Size = 250
    end
    object tblRacesMasterRaceCondition: TMemoField
      FieldName = 'RaceCondition'
      Origin = 'Race.RaceCondition'
      BlobType = ftMemo
    end
    object tblRacesMasterIsTurfRace: TBooleanField
      FieldName = 'IsTurfRace'
      Origin = 'Race.IsTurfRace'
    end
    object tblRacesMasterIsRouteRace: TBooleanField
      FieldName = 'IsRouteRace'
      Origin = 'Race.IsRouteRace'
    end
    object tblRacesMasterIsMaidenSpecialRace: TBooleanField
      FieldName = 'IsMaidenSpecialRace'
      Origin = 'Race.IsMaidenSpecialRace'
    end
    object tblRacesMasterIsMaidenClaimingRace: TBooleanField
      FieldName = 'IsMaidenClaimingRace'
      Origin = 'Race.IsMaidenClaimingRace'
    end
    object tblRacesMasterIsMaidenOrTurfRace: TBooleanField
      FieldName = 'IsMaidenOrTurfRace'
      Origin = 'Race.IsMaidenOrTurfRace'
    end
    object tblRacesMasterIsTwoYearOldRace: TBooleanField
      FieldName = 'IsTwoYearOldRace'
      Origin = 'Race.IsTwoYearOldRace'
    end
    object tblRacesMasterIsClaimingRace: TBooleanField
      FieldName = 'IsClaimingRace'
      Origin = 'Race.IsClaimingRace'
    end
    object tblRacesMasterAgeSexRestriction: TStringField
      FieldName = 'AgeSexRestriction'
      Origin = 'Race.AgeSexRestriction'
      Size = 3
    end
    object tblRacesMasterPurse: TFloatField
      FieldName = 'Purse'
      Origin = 'Race.Purse'
    end
    object tblRacesMasterClaimingPrice: TFloatField
      FieldName = 'ClaimingPrice'
      Origin = 'Race.ClaimingPrice'
    end
    object tblRacesMasterSimulcastTrkCode: TStringField
      FieldName = 'SimulcastTrkCode'
      Origin = 'Race.SimulcastTrkCode'
      Size = 3
    end
    object tblRacesMasterSimulcastRaceNbr: TSmallintField
      FieldName = 'SimulcastRaceNbr'
      Origin = 'Race.SimulcastRaceNbr'
    end
    object tblRacesMasterRaceAutoInc: TAutoIncField
      FieldName = 'RaceAutoInc'
      Origin = 'Race.RaceAutoInc'
    end
    object tblRacesMasterTimeDiff: TTimeField
      FieldName = 'TimeDiff'
      Origin = 'Race.TimeDiff'
    end
    object tblRacesMasterIsDDRace: TBooleanField
      FieldName = 'IsDDRace'
      Origin = 'Race.IsDDRace'
    end
    object tblRacesMasterDDRaceNbr: TStringField
      FieldName = 'DDRaceNbr'
      Origin = 'Race.DDRaceNbr'
      Size = 10
    end
    object tblRacesMasterIsPk3Race: TBooleanField
      FieldName = 'IsPk3Race'
      Origin = 'Race.IsPk3Race'
    end
    object tblRacesMasterPk3RaceNbr: TStringField
      FieldName = 'Pk3RaceNbr'
      Origin = 'Race.Pk3RaceNbr'
      Size = 10
    end
    object tblRacesMasterIsPk4Race: TBooleanField
      FieldName = 'IsPk4Race'
      Origin = 'Race.IsPk4Race'
    end
    object tblRacesMasterPk4RaceNbr: TSmallintField
      FieldName = 'Pk4RaceNbr'
      Origin = 'Race.Pk4RaceNbr'
    end
    object tblRacesMasterIsPk6Race: TBooleanField
      FieldName = 'IsPk6Race'
      Origin = 'Race.IsPk6Race'
    end
    object tblRacesMasterPK6RaceNbr: TSmallintField
      FieldName = 'PK6RaceNbr'
      Origin = 'Race.PK6RaceNbr'
    end
    object tblRacesMasterIsTriRace: TBooleanField
      FieldName = 'IsTriRace'
      Origin = 'Race.IsTriRace'
    end
    object tblRacesMasterIsSuperRace: TBooleanField
      FieldName = 'IsSuperRace'
      Origin = 'Race.IsSuperRace'
    end
    object tblRacesMasterIsQuiRace: TBooleanField
      FieldName = 'IsQuiRace'
      Origin = 'Race.IsQuiRace'
    end
    object tblRacesMasterIsExaRace: TBooleanField
      FieldName = 'IsExaRace'
      Origin = 'Race.IsExaRace'
    end
    object tblRacesMasterNbrTriKey: TIntegerField
      FieldName = 'NbrTriKey'
      Origin = 'Race.NbrTriKey'
    end
    object tblRacesMasterIsPk3Leg1: TBooleanField
      FieldName = 'IsPk3Leg1'
      Origin = 'Race.IsPk3Leg1'
    end
    object tblRacesMasterIsPk4Leg1: TBooleanField
      FieldName = 'IsPk4Leg1'
      Origin = 'Race.IsPk4Leg1'
    end
    object tblRacesMasterIsPk6Leg1: TBooleanField
      FieldName = 'IsPk6Leg1'
      Origin = 'Race.IsPk6Leg1'
    end
    object tblRacesMasterIsPk9Leg1: TBooleanField
      FieldName = 'IsPk9Leg1'
      Origin = 'Race.IsPk9Leg1'
    end
    object tblRacesMasterIsDDLeg1: TBooleanField
      FieldName = 'IsDDLeg1'
      Origin = 'Race.IsDDLeg1'
    end
    object tblRacesMasterTotalPk3Choices: TSmallintField
      FieldName = 'TotalPk3Choices'
      Origin = 'Race.TotalPk3Choices'
    end
    object tblRacesMasterPk3KeyType: TSmallintField
      FieldName = 'Pk3KeyType'
      Origin = 'Race.Pk3KeyType'
    end
    object tblRacesMasterPk3Selected: TBooleanField
      FieldName = 'Pk3Selected'
      Origin = 'Race.Pk3Selected'
    end
    object tblRacesMasterTotalTriChoices: TSmallintField
      FieldName = 'TotalTriChoices'
      Origin = 'Race.TotalTriChoices'
    end
    object tblRacesMasterTotalSuperChoices: TSmallintField
      FieldName = 'TotalSuperChoices'
      Origin = 'Race.TotalSuperChoices'
    end
    object tblRacesMasterTotalDDChoices: TSmallintField
      FieldName = 'TotalDDChoices'
      Origin = 'Race.TotalDDChoices'
    end
    object tblRacesMasterTopLastSpeed: TSmallintField
      FieldName = 'TopLastSpeed'
      Origin = 'Race.TopLastSpeed'
    end
    object tblRacesMasterTopBackSpeed: TSmallintField
      FieldName = 'TopBackSpeed'
      Origin = 'Race.TopBackSpeed'
    end
    object tblRacesMasterTopLastClass: TFloatField
      FieldName = 'TopLastClass'
      Origin = 'Race.TopLastClass'
    end
    object tblRacesMasterAltWager1: TStringField
      FieldName = 'AltWager1'
      Origin = 'Race.AltWager1'
      Size = 40
    end
    object tblRacesMasterAltWager2: TStringField
      FieldName = 'AltWager2'
      Origin = 'Race.AltWager2'
      Size = 40
    end
    object tblRacesMasterAltWager3: TStringField
      FieldName = 'AltWager3'
      Origin = 'Race.AltWager3'
      Size = 40
    end
    object tblRacesMasterAltWager4: TStringField
      FieldName = 'AltWager4'
      Origin = 'Race.AltWager4'
      Size = 40
    end
    object tblRacesMasterAltWager5: TStringField
      FieldName = 'AltWager5'
      Origin = 'Race.AltWager5'
      Size = 40
    end
    object tblRacesMasterAltWager6: TStringField
      FieldName = 'AltWager6'
      Origin = 'Race.AltWager6'
      Size = 40
    end
    object tblRacesMasterWager1: TStringField
      FieldName = 'Wager1'
      Origin = 'Race.Wager1'
      Size = 40
    end
    object tblRacesMasterWager2: TStringField
      FieldName = 'Wager2'
      Origin = 'Race.Wager2'
      Size = 40
    end
    object tblRacesMasterWager3: TStringField
      FieldName = 'Wager3'
      Origin = 'Race.Wager3'
      Size = 40
    end
    object tblRacesMasterWager4: TStringField
      FieldName = 'Wager4'
      Origin = 'Race.Wager4'
      Size = 40
    end
    object tblRacesMasterWager5: TStringField
      FieldName = 'Wager5'
      Origin = 'Race.Wager5'
      Size = 40
    end
    object tblRacesMasterWager6: TStringField
      FieldName = 'Wager6'
      Origin = 'Race.Wager6'
      Size = 40
    end
    object tblRacesMasterWagerFinalOrder: TStringField
      FieldName = 'WagerFinalOrder'
      Origin = 'Race.WagerFinalOrder'
      Size = 40
    end
    object tblRacesMasterWagerSheetOrder: TStringField
      FieldName = 'WagerSheetOrder'
      Origin = 'Race.WagerSheetOrder'
      Size = 40
    end
    object tblRacesMasterTodaysWagerOrder: TStringField
      FieldName = 'TodaysWagerOrder'
      Origin = 'Race.TodaysWagerOrder'
      Size = 40
    end
    object tblRacesMasterTri: TStringField
      FieldName = 'Tri'
      Origin = 'Race.Tri'
      Size = 40
    end
    object tblRacesMasterDD: TStringField
      FieldName = 'DD'
      Origin = 'Race.DD'
      Size = 40
    end
    object tblRacesMasterSuper: TStringField
      FieldName = 'Super'
      Origin = 'Race.Super'
      Size = 40
    end
    object tblRacesMasterExacta: TStringField
      FieldName = 'Exacta'
      Origin = 'Race.Exacta'
      Size = 40
    end
    object tblRacesMasterQuinella: TStringField
      FieldName = 'Quinella'
      Origin = 'Race.Quinella'
      Size = 40
    end
    object tblRacesMasterPick3: TStringField
      FieldName = 'Pick3'
      Origin = 'Race.Pick3'
      Size = 40
    end
    object tblRacesMasterPick4: TStringField
      FieldName = 'Pick4'
      Origin = 'Race.Pick4'
      Size = 40
    end
    object tblRacesMasterPick6: TStringField
      FieldName = 'Pick6'
      Origin = 'Race.Pick6'
      Size = 40
    end
    object tblRacesMasterIsPrintedOnValueSheet: TBooleanField
      FieldName = 'IsPrintedOnValueSheet'
      Origin = 'Race.IsPrintedOnValueSheet'
    end
    object tblRacesMasterIsYoubetTrack: TBooleanField
      FieldName = 'IsYoubetTrack'
      Origin = 'Race.IsYoubetTrack'
    end
    object tblRacesMasterWPSWagerAmt: TFloatField
      FieldName = 'WPSWagerAmt'
      Origin = 'Race.WPSWagerAmt'
    end
    object tblRacesMasterSfcWagerAmt: TFloatField
      FieldName = 'SfcWagerAmt'
      Origin = 'Race.SfcWagerAmt'
    end
    object tblRacesMasterTriWagerAmt: TFloatField
      FieldName = 'TriWagerAmt'
      Origin = 'Race.TriWagerAmt'
    end
    object tblRacesMasterExaWagerAmt: TFloatField
      FieldName = 'ExaWagerAmt'
      Origin = 'Race.ExaWagerAmt'
    end
    object tblRacesMasterQuiWagerAmt: TFloatField
      FieldName = 'QuiWagerAmt'
      Origin = 'Race.QuiWagerAmt'
    end
    object tblRacesMasterDDWagerAmt: TFloatField
      FieldName = 'DDWagerAmt'
      Origin = 'Race.DDWagerAmt'
    end
    object tblRacesMasterPk3WagerAmt: TFloatField
      FieldName = 'Pk3WagerAmt'
      Origin = 'Race.Pk3WagerAmt'
    end
    object tblRacesMasterPk4WagerAmt: TFloatField
      FieldName = 'Pk4WagerAmt'
      Origin = 'Race.Pk4WagerAmt'
    end
    object tblRacesMasterPk6WagerAmt: TFloatField
      FieldName = 'Pk6WagerAmt'
      Origin = 'Race.Pk6WagerAmt'
    end
    object tblRacesMasterTopEarlyPace: TFloatField
      FieldName = 'TopEarlyPace'
      Origin = 'Race.TopEarlyPace'
    end
    object tblRacesMasterTopMiddlePace: TFloatField
      FieldName = 'TopMiddlePace'
      Origin = 'Race.TopMiddlePace'
    end
    object tblRacesMasterTopLatePace: TFloatField
      FieldName = 'TopLatePace'
      Origin = 'Race.TopLatePace'
    end
    object tblRacesMasterTopEarlyPacePos: TFloatField
      FieldName = 'TopEarlyPacePos'
      Origin = 'Race.TopEarlyPacePos'
    end
    object tblRacesMasterTopMiddlePacePos: TFloatField
      FieldName = 'TopMiddlePacePos'
      Origin = 'Race.TopMiddlePacePos'
    end
    object tblRacesMasterTopLatePacePos: TFloatField
      FieldName = 'TopLatePacePos'
      Origin = 'Race.TopLatePacePos'
    end
    object tblRacesMasterSecondEarlyPace: TFloatField
      FieldName = 'SecondEarlyPace'
      Origin = 'Race.SecondEarlyPace'
    end
    object tblRacesMasterSecondMiddlePace: TFloatField
      FieldName = 'SecondMiddlePace'
      Origin = 'Race.SecondMiddlePace'
    end
    object tblRacesMasterSecondLatePace: TFloatField
      FieldName = 'SecondLatePace'
      Origin = 'Race.SecondLatePace'
    end
    object tblRacesMasterSecondEarlyPacePos: TFloatField
      FieldName = 'SecondEarlyPacePos'
      Origin = 'Race.SecondEarlyPacePos'
    end
    object tblRacesMasterSecondMiddlePacePos: TFloatField
      FieldName = 'SecondMiddlePacePos'
      Origin = 'Race.SecondMiddlePacePos'
    end
    object tblRacesMasterSecondLatePacePos: TFloatField
      FieldName = 'SecondLatePacePos'
      Origin = 'Race.SecondLatePacePos'
    end
    object tblRacesMasterTopPower: TFloatField
      FieldName = 'TopPower'
      Origin = 'Race.TopPower'
    end
    object tblRacesMasterSecondTopPower: TFloatField
      FieldName = 'SecondTopPower'
      Origin = 'Race.SecondTopPower'
    end
    object tblRacesMasterThirdTopPower: TFloatField
      FieldName = 'ThirdTopPower'
      Origin = 'Race.ThirdTopPower'
    end
    object tblRacesMasterFourthTopPower: TFloatField
      FieldName = 'FourthTopPower'
      Origin = 'Race.FourthTopPower'
    end
    object tblRacesMasterMaxWPSBet: TFloatField
      FieldName = 'MaxWPSBet'
      Origin = 'Race.MaxWPSBet'
    end
    object tblRacesMasterMaxGimmickBet: TFloatField
      FieldName = 'MaxGimmickBet'
      Origin = 'Race.MaxGimmickBet'
    end
    object tblRacesMasterNbrStarters: TSmallintField
      FieldName = 'NbrStarters'
      Origin = 'Race.NbrStarters'
    end
    object tblRacesMasterNbrDebutStarters: TSmallintField
      FieldName = 'NbrDebutStarters'
      Origin = 'Race.NbrDebutStarters'
    end
    object tblRacesMasterNbrDebutTwoStarters: TSmallintField
      FieldName = 'NbrDebutTwoStarters'
      Origin = 'Race.NbrDebutTwoStarters'
    end
    object tblRacesMasterNbrTurfDebutStarters: TSmallintField
      FieldName = 'NbrTurfDebutStarters'
      Origin = 'Race.NbrTurfDebutStarters'
    end
    object tblRacesMasterNbrRouteDebutStarters: TSmallintField
      FieldName = 'NbrRouteDebutStarters'
      Origin = 'Race.NbrRouteDebutStarters'
    end
    object tblRacesMasterNbrScratchedStarters: TSmallintField
      FieldName = 'NbrScratchedStarters'
      Origin = 'Race.NbrScratchedStarters'
    end
    object tblRacesMasterNbrRunners: TSmallintField
      FieldName = 'NbrRunners'
      Origin = 'Race.NbrRunners'
    end
    object tblRacesMasterOrigSurface: TStringField
      FieldName = 'OrigSurface'
      Origin = 'Race.OrigSurface'
      Size = 1
    end
    object tblRacesMasterIsPk9Place: TBooleanField
      FieldName = 'IsPk9Place'
      Origin = 'Race.IsPk9Place'
    end
    object tblRacesMasterPk9RaceNbr: TSmallintField
      FieldName = 'Pk9RaceNbr'
      Origin = 'Race.Pk9RaceNbr'
    end
    object tblRacesMasterRaceCondition1: TStringField
      FieldName = 'RaceCondition1'
      Origin = 'Race.RaceCondition1'
      Size = 40
    end
    object tblRacesMasterRaceCondition2: TStringField
      FieldName = 'RaceCondition2'
      Origin = 'Race.RaceCondition2'
      Size = 40
    end
    object tblRacesMasterRaceCondition3: TStringField
      FieldName = 'RaceCondition3'
      Origin = 'Race.RaceCondition3'
      Size = 40
    end
    object tblRacesMasterRaceCondition4: TStringField
      FieldName = 'RaceCondition4'
      Origin = 'Race.RaceCondition4'
      Size = 40
    end
    object tblRacesMasterRaceCondition5: TStringField
      FieldName = 'RaceCondition5'
      Origin = 'Race.RaceCondition5'
      Size = 40
    end
    object tblRacesMasterRaceCondition6: TStringField
      FieldName = 'RaceCondition6'
      Origin = 'Race.RaceCondition6'
      Size = 40
    end
    object tblRacesMasterBetLine: TStringField
      FieldName = 'BetLine'
      Origin = 'Race.BetLine'
      Size = 500
    end
    object tblRacesMasterRaceConditions: TStringField
      FieldName = 'RaceConditions'
      Origin = 'Race.RaceConditions'
      Size = 15
    end
    object tblRacesMasterTrkCond: TStringField
      FieldName = 'TrkCond'
      Origin = 'Race.TrkCond'
      Size = 3
    end
    object tblRacesMasterOrigDistanceDesc: TStringField
      FieldName = 'OrigDistanceDesc'
      Origin = 'Race.OrigDistanceDesc'
    end
    object tblRacesMasterIsExactaMatched: TBooleanField
      FieldName = 'IsExactaMatched'
      Origin = 'Race.IsExactaMatched'
    end
    object tblRacesMasterExactaNbrs: TStringField
      FieldName = 'ExactaNbrs'
      Origin = 'Race.ExactaNbrs'
      Size = 50
    end
    object tblRacesMasterExactaWager: TFloatField
      FieldName = 'ExactaWager'
      Origin = 'Race.ExactaWager'
    end
    object tblRacesMasterExactaPayout: TFloatField
      FieldName = 'ExactaPayout'
      Origin = 'Race.ExactaPayout'
    end
    object tblRacesMasterIsTrifectaMatched: TBooleanField
      FieldName = 'IsTrifectaMatched'
      Origin = 'Race.IsTrifectaMatched'
    end
    object tblRacesMasterTrifectaNbrs: TStringField
      FieldName = 'TrifectaNbrs'
      Origin = 'Race.TrifectaNbrs'
      Size = 50
    end
    object tblRacesMasterTrifectaWager: TFloatField
      FieldName = 'TrifectaWager'
      Origin = 'Race.TrifectaWager'
    end
    object tblRacesMasterTrifectaPayout: TFloatField
      FieldName = 'TrifectaPayout'
      Origin = 'Race.TrifectaPayout'
    end
    object tblRacesMasterIsSuperfectaMatched: TBooleanField
      FieldName = 'IsSuperfectaMatched'
      Origin = 'Race.IsSuperfectaMatched'
    end
    object tblRacesMasterSuperfectaNbrs: TStringField
      FieldName = 'SuperfectaNbrs'
      Origin = 'Race.SuperfectaNbrs'
      Size = 50
    end
    object tblRacesMasterSuperfectaWager: TFloatField
      FieldName = 'SuperfectaWager'
      Origin = 'Race.SuperfectaWager'
    end
    object tblRacesMasterSuperfectaPayout: TFloatField
      FieldName = 'SuperfectaPayout'
      Origin = 'Race.SuperfectaPayout'
    end
    object tblRacesMasterIsDailyDoubleMatchedFirstRace: TBooleanField
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      Origin = 'Race.IsDailyDoubleMatchedFirstRace'
    end
    object tblRacesMasterIsDailyDoubleMatchedLastRace: TBooleanField
      FieldName = 'IsDailyDoubleMatchedLastRace'
      Origin = 'Race.IsDailyDoubleMatchedLastRace'
    end
    object tblRacesMasterDDFirstRace: TStringField
      FieldName = 'DDFirstRace'
      Origin = 'Race.DDFirstRace'
      Size = 40
    end
    object tblRacesMasterDDLastRace: TStringField
      FieldName = 'DDLastRace'
      Origin = 'Race.DDLastRace'
      Size = 40
    end
    object tblRacesMasterDailyDoubleNbrsFirstRace: TStringField
      FieldName = 'DailyDoubleNbrsFirstRace'
      Origin = 'Race.DailyDoubleNbrsFirstRace'
      Size = 50
    end
    object tblRacesMasterDailyDoubleNbrsLastRace: TStringField
      FieldName = 'DailyDoubleNbrsLastRace'
      Origin = 'Race.DailyDoubleNbrsLastRace'
      Size = 50
    end
    object tblRacesMasterDailyDoubleWagerFirstRace: TFloatField
      FieldName = 'DailyDoubleWagerFirstRace'
      Origin = 'Race.DailyDoubleWagerFirstRace'
    end
    object tblRacesMasterDailyDoubleWagerLastRace: TFloatField
      FieldName = 'DailyDoubleWagerLastRace'
      Origin = 'Race.DailyDoubleWagerLastRace'
    end
    object tblRacesMasterDailyDoublePayoutFirstRace: TFloatField
      FieldName = 'DailyDoublePayoutFirstRace'
      Origin = 'Race.DailyDoublePayoutFirstRace'
    end
    object tblRacesMasterDailyDoublePayoutLastRace: TFloatField
      FieldName = 'DailyDoublePayoutLastRace'
      Origin = 'Race.DailyDoublePayoutLastRace'
    end
    object tblRacesMasterIsQuinellaMatched: TBooleanField
      FieldName = 'IsQuinellaMatched'
      Origin = 'Race.IsQuinellaMatched'
    end
    object tblRacesMasterQuinellaNbrs: TStringField
      FieldName = 'QuinellaNbrs'
      Origin = 'Race.QuinellaNbrs'
      Size = 50
    end
    object tblRacesMasterQuinellaWager: TFloatField
      FieldName = 'QuinellaWager'
      Origin = 'Race.QuinellaWager'
    end
    object tblRacesMasterQuinellaPayout: TFloatField
      FieldName = 'QuinellaPayout'
      Origin = 'Race.QuinellaPayout'
    end
    object tblRacesMasterIsPick3MatchedFirstRace: TBooleanField
      FieldName = 'IsPick3MatchedFirstRace'
      Origin = 'Race.IsPick3MatchedFirstRace'
    end
    object tblRacesMasterIsPick3MatchedLastRace: TBooleanField
      FieldName = 'IsPick3MatchedLastRace'
      Origin = 'Race.IsPick3MatchedLastRace'
    end
    object tblRacesMasterPick3FirstRace: TStringField
      FieldName = 'Pick3FirstRace'
      Origin = 'Race.Pick3FirstRace'
      Size = 40
    end
    object tblRacesMasterPick3LastRace: TStringField
      FieldName = 'Pick3LastRace'
      Origin = 'Race.Pick3LastRace'
      Size = 40
    end
    object tblRacesMasterPick3NbrsFirstRace: TStringField
      FieldName = 'Pick3NbrsFirstRace'
      Origin = 'Race.Pick3NbrsFirstRace'
      Size = 50
    end
    object tblRacesMasterPick3NbrsLastRace: TStringField
      FieldName = 'Pick3NbrsLastRace'
      Origin = 'Race.Pick3NbrsLastRace'
      Size = 50
    end
    object tblRacesMasterPick3WagerFirstRace: TFloatField
      FieldName = 'Pick3WagerFirstRace'
      Origin = 'Race.Pick3WagerFirstRace'
    end
    object tblRacesMasterPick3WagerLastRace: TFloatField
      FieldName = 'Pick3WagerLastRace'
      Origin = 'Race.Pick3WagerLastRace'
    end
    object tblRacesMasterPick3PayoutFirstRace: TFloatField
      FieldName = 'Pick3PayoutFirstRace'
      Origin = 'Race.Pick3PayoutFirstRace'
    end
    object tblRacesMasterPick3PayoutLastRace: TFloatField
      FieldName = 'Pick3PayoutLastRace'
      Origin = 'Race.Pick3PayoutLastRace'
    end
    object tblRacesMasterPick3NbrsLeg1: TStringField
      FieldName = 'Pick3NbrsLeg1'
      Origin = 'Race.Pick3NbrsLeg1'
      Size = 25
    end
    object tblRacesMasterPick3NbrsLeg2: TStringField
      FieldName = 'Pick3NbrsLeg2'
      Origin = 'Race.Pick3NbrsLeg2'
      Size = 25
    end
    object tblRacesMasterPick3NbrsLeg3: TStringField
      FieldName = 'Pick3NbrsLeg3'
      Origin = 'Race.Pick3NbrsLeg3'
      Size = 25
    end
    object tblRacesMasterIsPick4MatchedFirstRace: TBooleanField
      FieldName = 'IsPick4MatchedFirstRace'
      Origin = 'Race.IsPick4MatchedFirstRace'
    end
    object tblRacesMasterIsPick4MatchedLastRace: TBooleanField
      FieldName = 'IsPick4MatchedLastRace'
      Origin = 'Race.IsPick4MatchedLastRace'
    end
    object tblRacesMasterPick4FirstRace: TStringField
      FieldName = 'Pick4FirstRace'
      Origin = 'Race.Pick4FirstRace'
      Size = 40
    end
    object tblRacesMasterPick4LastRace: TStringField
      FieldName = 'Pick4LastRace'
      Origin = 'Race.Pick4LastRace'
      Size = 40
    end
    object tblRacesMasterPick4NbrsFirstRace: TStringField
      FieldName = 'Pick4NbrsFirstRace'
      Origin = 'Race.Pick4NbrsFirstRace'
      Size = 50
    end
    object tblRacesMasterPick4NbrsLastRace: TStringField
      FieldName = 'Pick4NbrsLastRace'
      Origin = 'Race.Pick4NbrsLastRace'
      Size = 50
    end
    object tblRacesMasterPick4WagerFirstRace: TFloatField
      FieldName = 'Pick4WagerFirstRace'
      Origin = 'Race.Pick4WagerFirstRace'
    end
    object tblRacesMasterPick4WagerLastRace: TFloatField
      FieldName = 'Pick4WagerLastRace'
      Origin = 'Race.Pick4WagerLastRace'
    end
    object tblRacesMasterPick4PayoutFirstRace: TFloatField
      FieldName = 'Pick4PayoutFirstRace'
      Origin = 'Race.Pick4PayoutFirstRace'
    end
    object tblRacesMasterPick4PayoutLastRace: TFloatField
      FieldName = 'Pick4PayoutLastRace'
      Origin = 'Race.Pick4PayoutLastRace'
    end
    object tblRacesMasterPick4NbrsLeg1: TStringField
      FieldName = 'Pick4NbrsLeg1'
      Origin = 'Race.Pick4NbrsLeg1'
      Size = 25
    end
    object tblRacesMasterPick4NbrsLeg2: TStringField
      FieldName = 'Pick4NbrsLeg2'
      Origin = 'Race.Pick4NbrsLeg2'
      Size = 25
    end
    object tblRacesMasterPick4NbrsLeg3: TStringField
      FieldName = 'Pick4NbrsLeg3'
      Origin = 'Race.Pick4NbrsLeg3'
      Size = 25
    end
    object tblRacesMasterPick4NbrsLeg4: TStringField
      FieldName = 'Pick4NbrsLeg4'
      Origin = 'Race.Pick4NbrsLeg4'
      Size = 25
    end
    object tblRacesMasterIsPick6MatchedFirstRace: TBooleanField
      FieldName = 'IsPick6MatchedFirstRace'
      Origin = 'Race.IsPick6MatchedFirstRace'
    end
    object tblRacesMasterIsPick6MatchedLastRace: TBooleanField
      FieldName = 'IsPick6MatchedLastRace'
      Origin = 'Race.IsPick6MatchedLastRace'
    end
    object tblRacesMasterPick6FirstRace: TStringField
      FieldName = 'Pick6FirstRace'
      Origin = 'Race.Pick6FirstRace'
      Size = 40
    end
    object tblRacesMasterPick6LastRace: TStringField
      FieldName = 'Pick6LastRace'
      Origin = 'Race.Pick6LastRace'
      Size = 40
    end
    object tblRacesMasterPick6NbrsFirstRace: TStringField
      FieldName = 'Pick6NbrsFirstRace'
      Origin = 'Race.Pick6NbrsFirstRace'
      Size = 50
    end
    object tblRacesMasterPick6NbrsLastRace: TStringField
      FieldName = 'Pick6NbrsLastRace'
      Origin = 'Race.Pick6NbrsLastRace'
      Size = 50
    end
    object tblRacesMasterPick6WagerFirstRace: TFloatField
      FieldName = 'Pick6WagerFirstRace'
      Origin = 'Race.Pick6WagerFirstRace'
    end
    object tblRacesMasterPick6WagerLastRace: TFloatField
      FieldName = 'Pick6WagerLastRace'
      Origin = 'Race.Pick6WagerLastRace'
    end
    object tblRacesMasterPick6PayoutFirstRace: TFloatField
      FieldName = 'Pick6PayoutFirstRace'
      Origin = 'Race.Pick6PayoutFirstRace'
    end
    object tblRacesMasterPick6PayoutLastRace: TFloatField
      FieldName = 'Pick6PayoutLastRace'
      Origin = 'Race.Pick6PayoutLastRace'
    end
    object tblRacesMasterIsWinMatched: TBooleanField
      FieldName = 'IsWinMatched'
      Origin = 'Race.IsWinMatched'
    end
    object tblRacesMasterWinNbrs: TStringField
      FieldName = 'WinNbrs'
      Origin = 'Race.WinNbrs'
      Size = 50
    end
    object tblRacesMasterWinPayout: TFloatField
      FieldName = 'WinPayout'
      Origin = 'Race.WinPayout'
    end
    object tblRacesMasterWinPlcPayout: TFloatField
      FieldName = 'WinPlcPayout'
      Origin = 'Race.WinPlcPayout'
    end
    object tblRacesMasterWinShoPayout: TFloatField
      FieldName = 'WinShoPayout'
      Origin = 'Race.WinShoPayout'
    end
    object tblRacesMasterIsPlcMatched: TBooleanField
      FieldName = 'IsPlcMatched'
      Origin = 'Race.IsPlcMatched'
    end
    object tblRacesMasterPlcNbrs: TStringField
      FieldName = 'PlcNbrs'
      Origin = 'Race.PlcNbrs'
      Size = 50
    end
    object tblRacesMasterPlcPayout: TFloatField
      FieldName = 'PlcPayout'
      Origin = 'Race.PlcPayout'
    end
    object tblRacesMasterPlcShoPayout: TFloatField
      FieldName = 'PlcShoPayout'
      Origin = 'Race.PlcShoPayout'
    end
    object tblRacesMasterIsShoMatched: TBooleanField
      FieldName = 'IsShoMatched'
      Origin = 'Race.IsShoMatched'
    end
    object tblRacesMasterShoNbrs: TStringField
      FieldName = 'ShoNbrs'
      Origin = 'Race.ShoNbrs'
      Size = 50
    end
    object tblRacesMasterShoPayout: TFloatField
      FieldName = 'ShoPayout'
      Origin = 'Race.ShoPayout'
    end
    object tblRacesMasterRaceShape: TStringField
      FieldName = 'RaceShape'
      Origin = 'Race.RaceShape'
      Size = 50
    end
    object tblRacesMasterPostTimes: TStringField
      FieldName = 'PostTimes'
      Origin = 'Race.PostTimes'
      Size = 50
    end
    object tblRacesMasterIs10CentSuperfectaRace: TBooleanField
      FieldName = 'Is10CentSuperfectaRace'
      Origin = 'Race.Is10CentSuperfectaRace'
    end
    object tblRacesMasterIs50CentTrifectaRace: TBooleanField
      FieldName = 'Is50CentTrifectaRace'
      Origin = 'Race.Is50CentTrifectaRace'
    end
    object tblRacesMasterIs50CentPk3Race: TBooleanField
      FieldName = 'Is50CentPk3Race'
      Origin = 'Race.Is50CentPk3Race'
    end
    object tblRacesMasterIs50CentPk4Race: TBooleanField
      FieldName = 'Is50CentPk4Race'
      Origin = 'Race.Is50CentPk4Race'
    end
    object tblRacesMasterET: TStringField
      FieldName = 'ET'
      Origin = 'Race.ET'
      Size = 10
    end
    object tblRacesMasterMT: TStringField
      FieldName = 'MT'
      Origin = 'Race.MT'
      Size = 10
    end
    object tblRacesMasterPT: TStringField
      FieldName = 'PT'
      Origin = 'Race.PT'
      Size = 10
    end
    object tblRacesMasterIsWagerSheetSelected: TBooleanField
      FieldName = 'IsWagerSheetSelected'
      Origin = 'Race.IsWagerSheetSelected'
    end
    object tblRacesMasterValue: TStringField
      FieldName = 'Value'
      Origin = 'Race.Value'
      Size = 10
    end
    object tblRacesMasterIsPTCTrack: TBooleanField
      FieldName = 'IsPTCTrack'
      Origin = 'Race.IsPTCTrack'
    end
    object tblRacesMasterIsTwinSpiresTrack: TBooleanField
      FieldName = 'IsTwinSpiresTrack'
      Origin = 'Race.IsTwinSpiresTrack'
    end
    object tblRacesMasterTodaysAltWagerWinPct: TFloatField
      FieldName = 'TodaysAltWagerWinPct'
      Origin = 'Race.TodaysAltWagerWinPct'
    end
    object tblRacesMasterTodaysAltWagerWinPctRank: TSmallintField
      FieldName = 'TodaysAltWagerWinPctRank'
      Origin = 'Race.TodaysAltWagerWinPctRank'
    end
    object tblRacesMasterMudSheetOrder: TStringField
      FieldName = 'MudSheetOrder'
      Origin = 'Race.MudSheetOrder'
      Size = 50
    end
    object tblRacesMasterTurfSheetOrder: TStringField
      FieldName = 'TurfSheetOrder'
      Origin = 'Race.TurfSheetOrder'
      Size = 50
    end
    object tblRacesMasterMaidenSheetOrder: TStringField
      FieldName = 'MaidenSheetOrder'
      Origin = 'Race.MaidenSheetOrder'
      Size = 50
    end
    object tblRacesMasterDistanceSheetOrder: TStringField
      FieldName = 'DistanceSheetOrder'
      Origin = 'Race.DistanceSheetOrder'
      Size = 50
    end
    object tblRacesMasterAWSheetOrder: TStringField
      FieldName = 'AWSheetOrder'
      Origin = 'Race.AWSheetOrder'
      Size = 50
    end
    object tblRacesMasterTrainerSheetOrder: TStringField
      FieldName = 'TrainerSheetOrder'
      Origin = 'Race.TrainerSheetOrder'
      Size = 50
    end
    object tblRacesMasterJockeySheetOrder: TStringField
      FieldName = 'JockeySheetOrder'
      Origin = 'Race.JockeySheetOrder'
      Size = 50
    end
    object tblRacesMasterOwnerSheetOrder: TStringField
      FieldName = 'OwnerSheetOrder'
      Origin = 'Race.OwnerSheetOrder'
      Size = 50
    end
    object tblRacesMasterTrainerJockeySheetOrder: TStringField
      FieldName = 'TrainerJockeySheetOrder'
      Origin = 'Race.TrainerJockeySheetOrder'
      Size = 50
    end
    object tblRacesMasterErlPaceSheetOrder: TStringField
      FieldName = 'ErlPaceSheetOrder'
      Origin = 'Race.ErlPaceSheetOrder'
      Size = 50
    end
    object tblRacesMasterMidPaceSheetOrder: TStringField
      FieldName = 'MidPaceSheetOrder'
      Origin = 'Race.MidPaceSheetOrder'
      Size = 50
    end
    object tblRacesMasterLatePaceSheetOrder: TStringField
      FieldName = 'LatePaceSheetOrder'
      Origin = 'Race.LatePaceSheetOrder'
      Size = 50
    end
    object tblRacesMasterErlPacePosSheetOrder: TStringField
      FieldName = 'ErlPacePosSheetOrder'
      Origin = 'Race.ErlPacePosSheetOrder'
      Size = 50
    end
    object tblRacesMasterMidPacePosSheetOrder: TStringField
      FieldName = 'MidPacePosSheetOrder'
      Origin = 'Race.MidPacePosSheetOrder'
      Size = 50
    end
    object tblRacesMasterLatePacePosSheetOrder: TStringField
      FieldName = 'LatePacePosSheetOrder'
      Origin = 'Race.LatePacePosSheetOrder'
      Size = 50
    end
    object tblRacesMasterPacificTime: TStringField
      FieldName = 'PacificTime'
      Origin = 'Race.PacificTime'
      Size = 50
    end
    object tblRacesMasterPowerGapOrder: TStringField
      FieldName = 'PowerGapOrder'
      Origin = 'Race.PowerGapOrder'
      Size = 100
    end
    object tblRacesMasterErlPaceGapOrder: TStringField
      FieldName = 'ErlPaceGapOrder'
      Origin = 'Race.ErlPaceGapOrder'
      Size = 100
    end
    object tblRacesMasterMidPaceGapOrder: TStringField
      FieldName = 'MidPaceGapOrder'
      Origin = 'Race.MidPaceGapOrder'
      Size = 100
    end
    object tblRacesMasterLatePaceGapOrder: TStringField
      FieldName = 'LatePaceGapOrder'
      Origin = 'Race.LatePaceGapOrder'
      Size = 100
    end
    object tblRacesMasterErlPacePosGapOrder: TStringField
      FieldName = 'ErlPacePosGapOrder'
      Origin = 'Race.ErlPacePosGapOrder'
      Size = 100
    end
    object tblRacesMasterMidPacePosGapOrder: TStringField
      FieldName = 'MidPacePosGapOrder'
      Origin = 'Race.MidPacePosGapOrder'
      Size = 100
    end
    object tblRacesMasterLatePacePosGapOrder: TStringField
      FieldName = 'LatePacePosGapOrder'
      Origin = 'Race.LatePacePosGapOrder'
      Size = 100
    end
    object tblRacesMasterEarlyPacePar: TIntegerField
      FieldName = 'EarlyPacePar'
      Origin = 'Race.EarlyPacePar'
    end
    object tblRacesMasterMiddlePacePar: TIntegerField
      FieldName = 'MiddlePacePar'
      Origin = 'Race.MiddlePacePar'
    end
    object tblRacesMasterLatePacePar: TIntegerField
      FieldName = 'LatePacePar'
      Origin = 'Race.LatePacePar'
    end
    object tblRacesMasterSpeedPacePar: TIntegerField
      FieldName = 'SpeedPacePar'
      Origin = 'Race.SpeedPacePar'
    end
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    OnNext = plRacesReportNext
    OnTraversal = plRacesReportTraversal
    Left = 24
    Top = 200
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    OnDataChange = dsEntriesDataChange
    Left = 102
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
  object ppHospitalReport2: TppReport
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
    Template.FileName = 'C:\Ratings31\HospitalSheet2.rtm'
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
    Left = 240
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
        TraverseAllData = False
        DataPipelineName = 'plEntries'
        mmHeight = 6350
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
          Template.FileName = 'C:\Ratings31\HospitalSheetSub.rtm'
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
            mmHeight = 37465
            mmPrintPosition = 0
            object RaceDesc: TppDBText
              UserName = 'RaceDesc'
              AutoSize = True
              DataField = 'RaceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 89112
              mmTop = 0
              mmWidth = 15240
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label2'
              Caption = 'P#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2709
              mmLeft = 1270
              mmTop = 21590
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'HORSE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 5503
              mmTop = 22225
              mmWidth = 5292
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'JOCKEY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 44238
              mmTop = 23072
              mmWidth = 6350
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'M/L'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 126788
              mmTop = 22860
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'TRAINER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 22437
              mmTop = 23072
              mmWidth = 7408
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              AutoSize = False
              Caption = '------PACE-----'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2371
              mmLeft = 54187
              mmTop = 26882
              mmWidth = 11430
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'T/J'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 27517
              mmTop = 26247
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = '365'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 47413
              mmTop = 26247
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'DAYS LAST RACE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 423
              mmTop = 27728
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'BRED SEX AGE WGT EQ'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 423
              mmTop = 25612
              mmWidth = 20108
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = '--------TRAINER--------'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2371
              mmLeft = 67522
              mmTop = 21590
              mmWidth = 19050
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'lblERL'
              Caption = 'ERL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 54399
              mmTop = 29845
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'lblSTR'
              Caption = 'STR'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 62231
              mmTop = 29845
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = '365'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 36618
              mmTop = 26247
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = '90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 23918
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'lblMID'
              Caption = 'MID'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 57997
              mmTop = 29845
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'CLM'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 82762
              mmTop = 24553
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = '2ND'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 71226
              mmTop = 24553
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = '1ST'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 67734
              mmTop = 24553
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'SC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 79163
              mmTop = 24553
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'DC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 75565
              mmTop = 24553
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              AutoSize = False
              Caption = '90'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2117
              mmLeft = 42545
              mmTop = 26247
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              Caption = 'AGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 70908
              mmTop = 34290
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              AutoSize = False
              Caption = 'ON'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 82973
              mmTop = 27305
              mmWidth = 2963
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              Caption = 'OFF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 82762
              mmTop = 30480
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel57: TppLabel
              UserName = 'Label57'
              Caption = 'OWN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 31750
              mmTop = 30057
              mmWidth = 3387
              BandType = 1
            end
            object RaceCondition: TppDBMemo
              UserName = 'RaceConditions'
              CharWrap = True
              DataField = 'RaceCondition'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 6138
              mmLeft = 0
              mmTop = 4022
              mmWidth = 214419
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLabel61: TppLabel
              UserName = 'Label503'
              Caption = 'DAM SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 87207
              mmTop = 27517
              mmWidth = 8467
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'RT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 75565
              mmTop = 27517
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              AutoSize = False
              Caption = 'POWER'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 16298
              mmTop = 31115
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText6: TppDBText
              UserName = 'RaceDesc1'
              AutoSize = True
              DataField = 'RaceNbr'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 22490
              mmTop = 0
              mmWidth = 13335
              BandType = 1
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              AutoSize = True
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 592
              mmTop = 0
              mmWidth = 13335
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label3'
              Caption = 'RACE#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3598
              mmLeft = 11906
              mmTop = 0
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'lblTURF'
              Caption = 'All Weather'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3598
              mmLeft = 27940
              mmTop = 0
              mmWidth = 20955
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'SIRE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 87207
              mmTop = 24765
              mmWidth = 4233
              BandType = 1
            end
            object lblSireTurf: TppLabel
              UserName = 'lblSireTurf'
              Caption = 'Trf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 102024
              mmTop = 30692
              mmWidth = 3175
              BandType = 1
            end
            object lblSire2yo: TppLabel
              UserName = 'lblSire2yo'
              Caption = 'Dist'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 110702
              mmTop = 30692
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'HORSE RECORDS  STARTS / WINS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 87630
              mmTop = 34290
              mmWidth = 33655
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label7'
              Caption = 'PEDIGREE RATINGS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 104352
              mmTop = 24765
              mmWidth = 16933
              BandType = 1
            end
            object ppDBText11: TppDBText
              UserName = 'RaceDesc3'
              AutoSize = True
              DataField = 'Purse'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 121455
              mmTop = 0
              mmWidth = 9525
              BandType = 1
            end
            object ppDBText16: TppDBText
              UserName = 'RaceDesc4'
              AutoSize = True
              DataField = 'DistanceDesc'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 51858
              mmTop = 0
              mmWidth = 22860
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label501'
              Caption = 'POWER ADVANTAGE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 5821
              mmTop = 34290
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 'LS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124248
              mmTop = 22860
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              Caption = 'LAY'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2117
              mmLeft = 67733
              mmTop = 34290
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'T/O'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 31962
              mmTop = 26247
              mmWidth = 3387
              BandType = 1
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'TrkCode'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3598
              mmLeft = 203200
              mmTop = 0
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'lblSireTurf1'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 106469
              mmTop = 30692
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel63: TppLabel
              UserName = 'lblSire2yo1'
              Caption = 'All'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2074
              mmLeft = 117052
              mmTop = 30692
              mmWidth = 3175
              BandType = 1
            end
            object lblPowerOrder: TppLabel
              UserName = 'lblPowerOrder'
              ShiftWithParent = True
              Caption = 'Power:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 847
              mmTop = 11642
              mmWidth = 10160
              BandType = 1
            end
            object WagerSheetOrder: TppDBText
              UserName = 'WagerSheetOrder'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WagerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 12065
              mmTop = 11642
              mmWidth = 25400
              BandType = 1
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 20320
              mmWidth = 214630
              BandType = 1
            end
            object lblErlPace: TppLabel
              UserName = 'lblPowerOrder2'
              ShiftWithParent = True
              Caption = 'Early:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 33867
              mmTop = 11642
              mmWidth = 10160
              BandType = 1
            end
            object lblMidPace: TppLabel
              UserName = 'lblMidPace'
              ShiftWithParent = True
              Caption = 'Middle:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 91440
              mmTop = 11642
              mmWidth = 11853
              BandType = 1
            end
            object lblLatePace: TppLabel
              UserName = 'lblLatePace'
              ShiftWithParent = True
              Caption = 'Late:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 154729
              mmTop = 11642
              mmWidth = 8467
              BandType = 1
            end
            object ErlPaceSheetOrder: TppDBText
              UserName = 'ErlPaceSheetOrder'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'ErlPaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 46143
              mmTop = 11642
              mmWidth = 28787
              BandType = 1
            end
            object MidPaceSheetOrder: TppDBText
              UserName = 'MidPaceSheetOrder'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MidPaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 105622
              mmTop = 11642
              mmWidth = 28787
              BandType = 1
            end
            object LatePaceSheetOrder: TppDBText
              UserName = 'LatePaceSheetOrder'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePaceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 164677
              mmTop = 11642
              mmWidth = 30480
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 423
              mmLeft = 0
              mmTop = 37042
              mmWidth = 214630
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label13'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 33867
              mmTop = 15875
              mmWidth = 5080
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label16'
              ShiftWithParent = True
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 847
              mmTop = 15875
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText25: TppDBText
              UserName = 'WagerSheetOrder2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'PowerGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 1905
              mmLeft = 7408
              mmTop = 16933
              mmWidth = 13758
              BandType = 1
            end
            object ppDBText26: TppDBText
              UserName = 'ErlPaceSheetOrder1'
              AutoSize = True
              DataField = 'ErlPaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 1905
              mmLeft = 39793
              mmTop = 16933
              mmWidth = 15875
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label17'
              ShiftWithParent = True
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 91440
              mmTop = 15875
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MidPaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 1905
              mmLeft = 97790
              mmTop = 16933
              mmWidth = 15875
              BandType = 1
            end
            object TrainerJockeySheetOrder: TppDBText
              UserName = 'TrainerJockeySheetOrder'
              AutoSize = True
              DataField = 'TrainerJockeySheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 157269
              mmTop = 21590
              mmWidth = 38947
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label23'
              Caption = 'T/J'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3387
              mmLeft = 149225
              mmTop = 21167
              mmWidth = 5715
              BandType = 1
            end
            object ppDBText29: TppDBText
              UserName = 'DBText10'
              AutoSize = True
              DataField = 'TrainerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 156845
              mmTop = 26035
              mmWidth = 28787
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'lblT'
              Caption = 'Trn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3387
              mmLeft = 149225
              mmTop = 25612
              mmWidth = 5715
              BandType = 1
            end
            object ppLabel42: TppLabel
              UserName = 'lblMaidenSheetOrder'
              Caption = 'Mdn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Visible = False
              mmHeight = 3387
              mmLeft = 175472
              mmTop = 21167
              mmWidth = 5715
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'lblTurfSheetOrder'
              Caption = 'Turf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Visible = False
              mmHeight = 3387
              mmLeft = 175472
              mmTop = 25612
              mmWidth = 7620
              BandType = 1
            end
            object MaidenSheetOrder: TppDBText
              UserName = 'MaidenSheetOrder'
              AutoSize = True
              DataField = 'MaidenSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 185844
              mmTop = 21590
              mmWidth = 27093
              BandType = 1
            end
            object TurfSheetOrder: TppDBText
              UserName = 'TurfSheetOrder'
              AutoSize = True
              DataField = 'TurfSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 185844
              mmTop = 26035
              mmWidth = 23707
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label21'
              Caption = 'Gap'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 154729
              mmTop = 15875
              mmWidth = 5080
              BandType = 1
            end
            object ppDBText32: TppDBText
              UserName = 'EarlyPace1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'EarlyPacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2371
              mmLeft = 40005
              mmTop = 34078
              mmWidth = 15240
              BandType = 1
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MiddlePacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2371
              mmLeft = 44662
              mmTop = 34078
              mmWidth = 16510
              BandType = 1
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2371
              mmLeft = 51858
              mmTop = 34078
              mmWidth = 13970
              BandType = 1
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'SpeedPacePar'
              DataPipeline = plRacesReport
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2371
              mmLeft = 111760
              mmTop = 34078
              mmWidth = 15240
              BandType = 1
            end
            object ppDBText36: TppDBText
              UserName = 'MidPaceSheetOrder1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MidPacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 135255
              mmTop = 11642
              mmWidth = 33867
              BandType = 1
            end
            object ppDBText37: TppDBText
              UserName = 'LatePaceSheetOrder1'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 194945
              mmTop = 11642
              mmWidth = 35560
              BandType = 1
            end
            object ppDBText38: TppDBText
              UserName = 'ErlPaceSheetOrder2'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'ErlPacePosSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 73237
              mmTop = 11642
              mmWidth = 33867
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label401'
              Caption = 'BS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124206
              mmTop = 25400
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              Caption = 'AC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124248
              mmTop = 28363
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'BC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 124248
              mmTop = 30903
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'lblLatePace1'
              ShiftWithParent = True
              Caption = 'L Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 183304
              mmTop = 11642
              mmWidth = 10160
              BandType = 1
            end
            object ppDBText10: TppDBText
              UserName = 'DBText1'
              AutoSize = True
              DataField = 'LatePaceGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2074
              mmLeft = 160867
              mmTop = 16933
              mmWidth = 16933
              BandType = 1
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 1905
              mmLeft = 191982
              mmTop = 16933
              mmWidth = 20108
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              ShiftWithParent = True
              Caption = 'E Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 62018
              mmTop = 11642
              mmWidth = 10160
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              ShiftWithParent = True
              Caption = 'M Pos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 123402
              mmTop = 11642
              mmWidth = 10160
              BandType = 1
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              AutoSize = True
              DataField = 'MidPacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2074
              mmLeft = 131869
              mmTop = 16933
              mmWidth = 19050
              BandType = 1
            end
            object ppDBText39: TppDBText
              UserName = 'DBText39'
              AutoSize = True
              DataField = 'ErlPacePosGapOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 1905
              mmLeft = 72178
              mmTop = 16933
              mmWidth = 19050
              BandType = 1
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 7408
              mmLeft = 32173
              mmTop = 11218
              mmWidth = 212
              BandType = 1
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 6562
              mmLeft = 89535
              mmTop = 11853
              mmWidth = 212
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'lblT1'
              Caption = 'Own'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3387
              mmLeft = 149225
              mmTop = 30692
              mmWidth = 5715
              BandType = 1
            end
            object ppDBText40: TppDBText
              UserName = 'DBText101'
              AutoSize = True
              DataField = 'OwnerSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 156845
              mmTop = 31115
              mmWidth = 25400
              BandType = 1
            end
            object ppDBText42: TppDBText
              UserName = 'TurfSheetOrder1'
              AutoSize = True
              DataField = 'DistanceSheetOrder'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3006
              mmLeft = 186055
              mmTop = 31115
              mmWidth = 30480
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'lblTurfSheetOrder1'
              Caption = 'Dist'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              mmHeight = 3387
              mmLeft = 175472
              mmTop = 30692
              mmWidth = 7620
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 63923
              mmTop = 15875
              mmWidth = 6773
              BandType = 1
            end
            object ppLabel58: TppLabel
              UserName = 'Label58'
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 123825
              mmTop = 15875
              mmWidth = 6773
              BandType = 1
            end
            object ppLine34: TppLine
              UserName = 'Line34'
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 7620
              mmLeft = 151977
              mmTop = 11218
              mmWidth = 212
              BandType = 1
            end
            object ppLabel62: TppLabel
              UserName = 'Label62'
              ShiftWithParent = True
              Caption = 'Avg:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              mmHeight = 3006
              mmLeft = 183304
              mmTop = 15875
              mmWidth = 6773
              BandType = 1
            end
            object ppLine33: TppLine
              UserName = 'Line33'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 10372
              mmWidth = 214630
              BandType = 1
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 3810
              mmWidth = 214630
              BandType = 1
            end
            object ppLabel64: TppLabel
              UserName = 'Label64'
              Caption = 'TRK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2074
              mmLeft = 75565
              mmTop = 34290
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel65: TppLabel
              UserName = 'Label65'
              Caption = 'ODDS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 81703
              mmTop = 34078
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label11'
              Caption = 'Trf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2117
              mmLeft = 41487
              mmTop = 28998
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'Dist'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2117
              mmLeft = 46355
              mmTop = 28998
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              Caption = 'TF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 79163
              mmTop = 27517
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel68: TppLabel
              UserName = 'Label68'
              Caption = 'UP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 75565
              mmTop = 30480
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel69: TppLabel
              UserName = 'Label69'
              Caption = 'DN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2117
              mmLeft = 79163
              mmTop = 30480
              mmWidth = 2117
              BandType = 1
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              Caption = 'Lsx'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2074
              mmLeft = 67733
              mmTop = 30692
              mmWidth = 3175
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
            PrintCount = 12
            PrintHeight = phDynamic
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
              mmLeft = 51065
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 21167
              mmTop = 0
              mmWidth = 794
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
              mmLeft = 120650
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
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3217
              mmLeft = 265
              mmTop = 0
              mmWidth = 3969
              BandType = 4
            end
            object Trainer: TppDBText
              UserName = 'Trainer'
              ShiftWithParent = True
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 22648
              mmTop = 0
              mmWidth = 17145
              BandType = 4
            end
            object Jockey: TppDBText
              UserName = 'Jockey'
              ShiftWithParent = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 41275
              mmTop = 0
              mmWidth = 9102
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 18203
              mmTop = 423
              mmWidth = 3175
              BandType = 4
            end
            object Pace: TppDBText
              UserName = 'EarlyPace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'EarlyPace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 44662
              mmTop = 0
              mmWidth = 11430
              BandType = 4
            end
            object TotalTrnWinPct: TppDBText
              UserName = 'TotalTrnWinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 22013
              mmTop = 3175
              mmWidth = 17780
              BandType = 4
            end
            object TotalTrnJkyWinPct: TppDBText
              UserName = 'TotalTrnJkyWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TJ365WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 26882
              mmTop = 3175
              mmWidth = 3387
              BandType = 4
            end
            object TotalJky30WinPct: TppDBText
              UserName = 'TotalJky30WinPct'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TotalJkyDaysWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 21802
              mmTop = 3175
              mmWidth = 22860
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 3598
              mmTop = 3598
              mmWidth = 3810
              BandType = 4
            end
            object Age: TppDBText
              UserName = 'Age'
              ShiftWithParent = True
              DataField = 'Age'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 5927
              mmTop = 3598
              mmWidth = 2752
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'LatePace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'LatePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 55711
              mmTop = 0
              mmWidth = 10160
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 265
              mmTop = 3704
              mmWidth = 7620
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 67310
              mmTop = 0
              mmWidth = 3387
              BandType = 4
            end
            object MidPace: TppDBText
              UserName = 'MiddlePace'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MiddlePace'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 48144
              mmTop = 0
              mmWidth = 12700
              BandType = 4
            end
            object TotalJkyWinPct: TppDBText
              UserName = 'TotalJkyWinPct'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJkyWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 46778
              mmTop = 3175
              mmWidth = 3810
              BandType = 4
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8255
              mmLeft = 40481
              mmTop = 847
              mmWidth = 265
              BandType = 4
            end
            object TotalTrnTurfWinPct: TppDBText
              UserName = 'TotalTrnTurfWinPct'
              ShiftWithParent = True
              DataField = 'TotalJkyTurfWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 41487
              mmTop = 6562
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 71332
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2328
              mmLeft = 78952
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2540
              mmLeft = 75353
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object lblErlPos: TppLabel
              UserName = 'lblErlPos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2709
              mmLeft = 53897
              mmTop = 3704
              mmWidth = 1482
              BandType = 4
            end
            object lblMidPos: TppLabel
              UserName = 'lblMidPos'
              Caption = '*'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 2709
              mmLeft = 58658
              mmTop = 3704
              mmWidth = 1482
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
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 2117
              mmWidth = 12700
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 71332
              mmTop = 12065
              mmWidth = 3175
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 15240
              mmLeft = 130175
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object Equip: TppDBText
              UserName = 'Equip'
              ShiftWithParent = True
              DataField = 'Equip'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 17145
              mmTop = 3387
              mmWidth = 3175
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 8255
              mmTop = 3387
              mmWidth = 7620
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 67310
              mmTop = 8043
              mmWidth = 3387
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 82762
              mmTop = 4233
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 82762
              mmTop = 8255
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 78952
              mmTop = 4233
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 75353
              mmTop = 4233
              mmWidth = 3175
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 66940
              mmTop = 3440
              mmWidth = 19315
              BandType = 4
            end
            object TurfRating: TppDBText
              UserName = 'TurfRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TurfRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 94827
              mmTop = 0
              mmWidth = 10583
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
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 7673
              mmWidth = 13758
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 51594
              mmTop = 7408
              mmWidth = 14552
              BandType = 4
            end
            object layoffline1: TppLine
              UserName = 'layoffline1'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 529
              mmLeft = 131234
              mmTop = 4233
              mmWidth = 82550
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Pen.Style = psInsideFrame
              ParentWidth = True
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 15028
              mmWidth = 214630
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
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 0
              mmWidth = 12700
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
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 5080
              mmWidth = 13758
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 111760
              mmTop = 9737
              mmWidth = 8467
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 97367
              mmTop = 9737
              mmWidth = 9525
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 102235
              mmTop = 9737
              mmWidth = 7408
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 85514
              mmTop = 9737
              mmWidth = 9525
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 90012
              mmTop = 9737
              mmWidth = 7408
              BandType = 4
            end
            object lblTrack: TppLabel
              UserName = 'Label203'
              Caption = 'Trk'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 86995
              mmTop = 9313
              mmWidth = 3810
              BandType = 4
            end
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = 'Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 99484
              mmTop = 9313
              mmWidth = 3810
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 86995
              mmTop = 5503
              mmWidth = 32808
              BandType = 4
            end
            object DaysLast: TppDBText
              UserName = 'DaysLast'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'DaysLast'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 0
              mmTop = 6985
              mmWidth = 11853
              BandType = 4
            end
            object lblOnTurf: TppLabel
              UserName = 'lblOnTurf'
              Caption = 'Turf '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              mmHeight = 1905
              mmLeft = 110914
              mmTop = 9737
              mmWidth = 5292
              BandType = 4
            end
            object Power: TppDBText
              UserName = 'Power'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'Power'
              DataPipeline = plEntries
              DisplayFormat = '#0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 3006
              mmLeft = 12276
              mmTop = 6773
              mmWidth = 8467
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'SireName1'
              ShiftWithParent = True
              DataField = 'DamSire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 86995
              mmTop = 2910
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 86995
              mmTop = 0
              mmWidth = 13123
              BandType = 4
            end
            object ML: TppDBText
              UserName = 'MorningLineDesc'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 110914
              mmTop = 0
              mmWidth = 19050
              BandType = 4
            end
            object lblRoute: TppLabel
              UserName = 'lblRoute'
              Caption = 'Rte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 99484
              mmTop = 6138
              mmWidth = 3810
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 95250
              mmTop = 6562
              mmWidth = 11642
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 100118
              mmTop = 6562
              mmWidth = 9525
              BandType = 4
            end
            object QSP1stCallRunStyle: TppDBText
              UserName = 'QSP1stCallRunStyle'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'QSP1stCallRunStyle'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3006
              mmLeft = 52705
              mmTop = 11218
              mmWidth = 30480
              BandType = 4
            end
            object lblSprint: TppLabel
              UserName = 'Label4'
              Caption = 'Spr'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2328
              mmLeft = 111125
              mmTop = 6138
              mmWidth = 3810
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 105410
              mmTop = 6562
              mmWidth = 12700
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 109644
              mmTop = 6562
              mmWidth = 10583
              BandType = 4
            end
            object lblLife: TppLabel
              UserName = 'Label5'
              Caption = 'Life'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              mmHeight = 2244
              mmLeft = 87048
              mmTop = 6085
              mmWidth = 5080
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 84456
              mmTop = 6562
              mmWidth = 10583
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 88900
              mmTop = 6562
              mmWidth = 8467
              BandType = 4
            end
            object HorseName: TppDBText
              UserName = 'HorseName'
              ShiftWithParent = True
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 5556
              mmTop = 0
              mmWidth = 11906
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
            object ppLine19: TppLine
              UserName = 'Line19'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 97631
              mmTop = 5556
              mmWidth = 265
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 6615
              mmLeft = 110596
              mmTop = 5556
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
              BlankWhenZero = True
              DataField = 'TotalTrnOwnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 31327
              mmTop = 3175
              mmWidth = 4022
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
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 107527
              mmTop = 9737
              mmWidth = 10583
              BandType = 4
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WorkLine1'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 10372
              mmWidth = 9525
              BandType = 4
            end
            object OwnerName: TppDBText
              UserName = 'OwnerName'
              ShiftWithParent = True
              DataField = 'Owner'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 22860
              mmTop = 11853
              mmWidth = 27252
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 130704
              mmTop = 10054
              mmWidth = 82550
              BandType = 4
            end
            object PowerAdvantage: TppDBText
              UserName = 'Power1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PowerAdvantage'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 2540
              mmTop = 10372
              mmWidth = 17780
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 0
              mmTop = 0
              mmWidth = 214630
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'WorkLine2'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 131234
              mmTop = 12700
              mmWidth = 9525
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 121285
              mmTop = 2752
              mmWidth = 8255
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 66887
              mmTop = 7408
              mmWidth = 19050
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 21960
              mmTop = 9525
              mmWidth = 28840
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 67310
              mmTop = 12065
              mmWidth = 3387
              BandType = 4
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'PP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2371
              mmLeft = 1270
              mmTop = 9525
              mmWidth = 2540
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 212
              mmTop = 12065
              mmWidth = 3387
              BandType = 4
            end
            object TotalTrn30WinPct: TppDBText
              UserName = 'TotalTrn30WinPct'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalTrn1To45WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 1905
              mmTop = 3175
              mmWidth = 24130
              BandType = 4
            end
            object ppLine25: TppLine
              UserName = 'Line25'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 26458
              mmTop = 3598
              mmWidth = 212
              BandType = 4
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 30480
              mmTop = 3598
              mmWidth = 212
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 35560
              mmTop = 3598
              mmWidth = 212
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 5503
              mmLeft = 45297
              mmTop = 3598
              mmWidth = 212
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 22860
              mmTop = 5927
              mmWidth = 27728
              BandType = 4
            end
            object ClassRating: TppDBText
              UserName = 'ClassRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'ClassRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 108585
              mmTop = 0
              mmWidth = 11642
              BandType = 4
            end
            object DistanceRating: TppDBText
              UserName = 'DistanceRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'DistanceRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 100118
              mmTop = 0
              mmWidth = 14817
              BandType = 4
            end
            object MudRating: TppDBText
              UserName = 'MudRating'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MudRating'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 100119
              mmTop = 0
              mmWidth = 9525
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
              mmLeft = 115782
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object LastSpeed: TppDBText
              UserName = 'LastSpeed'
              AutoSize = True
              DataField = 'LastSpeed'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113877
              mmTop = 3387
              mmWidth = 11430
              BandType = 4
            end
            object BackSpeed: TppDBText
              UserName = 'BackSpeed'
              AutoSize = True
              DataField = 'BackSpeed'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113665
              mmTop = 6350
              mmWidth = 11430
              BandType = 4
            end
            object LastSpeedRank: TppDBText
              UserName = 'LastSpeedRank'
              AutoSize = True
              DataField = 'LastSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113030
              mmTop = 3387
              mmWidth = 16510
              BandType = 4
            end
            object BackSpeedRank: TppDBText
              UserName = 'BackSpeedRank'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'BackSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113030
              mmTop = 6350
              mmWidth = 16510
              BandType = 4
            end
            object AvgClass: TppDBText
              UserName = 'AvgClass'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'AvgClass'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 114935
              mmTop = 9313
              mmWidth = 10160
              BandType = 4
            end
            object BackClass: TppDBText
              UserName = 'BackClass'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'BackClass'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113665
              mmTop = 12277
              mmWidth = 11430
              BandType = 4
            end
            object AvgClassRank: TppDBText
              UserName = 'AvgClassRank'
              AutoSize = True
              DataField = 'AvgClassRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 114300
              mmTop = 9313
              mmWidth = 15240
              BandType = 4
            end
            object BackClassRank: TppDBText
              UserName = 'BackClassRank'
              AutoSize = True
              DataField = 'BackClassRank'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 113030
              mmTop = 12277
              mmWidth = 16510
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'OwnerName1'
              ShiftWithParent = True
              DataField = 'TodaysWagerOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 86784
              mmTop = 12700
              mmWidth = 18838
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              ShiftWithParent = True
              DataField = 'TodaysWagerWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##.#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 114089
              mmTop = 12700
              mmWidth = 5503
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              ShiftWithParent = True
              DataField = 'TodaysWagerStarts'
              DataPipeline = plEntries
              DisplayFormat = '#####'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              TextAlignment = taRightJustified
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 106892
              mmTop = 12700
              mmWidth = 5503
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'TotalTrn30WinPct1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'PostPosWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 5715
              mmTop = 12065
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText43: TppDBText
              UserName = 'TotalTrnBlinkersOffWinPct1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrn30WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 75353
              mmTop = 12065
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalTrnOddsWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 82762
              mmTop = 12065
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText45: TppDBText
              UserName = 'DBText45'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TotalOwnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2244
              mmLeft = 17568
              mmTop = 6562
              mmWidth = 17780
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
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 67310
              mmTop = 4445
              mmWidth = 3387
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'TotalTrnTurfWinPct1'
              ShiftWithParent = True
              DataField = 'TotalJky2yoWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 47413
              mmTop = 6562
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText46: TppDBText
              UserName = 'DBText46'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalBrdWinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2540
              mmLeft = 75353
              mmTop = 8255
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText47: TppDBText
              UserName = 'DBText47'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'TotalJky10WinPct'
              DataPipeline = plEntries
              DisplayFormat = '###'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 6
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2328
              mmLeft = 78952
              mmTop = 8255
              mmWidth = 3175
              BandType = 4
            end
            object ppLine24: TppLine
              UserName = 'Line24'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 66675
              mmTop = 11218
              mmWidth = 19050
              BandType = 4
            end
            object ppLine36: TppLine
              UserName = 'Line36'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 14393
              mmLeft = 70908
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine37: TppLine
              UserName = 'Line37'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 14393
              mmLeft = 74718
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine38: TppLine
              UserName = 'Line38'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 14393
              mmLeft = 78740
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine39: TppLine
              UserName = 'Line39'
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 14393
              mmLeft = 82338
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
          end
          object ppFooterBand1: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryWagerTypeBand: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3598
            mmPrintPosition = 0
            object dbWagerType: TppDBMemo
              UserName = 'dbWagerType'
              CharWrap = False
              DataField = 'BetLine'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Stretch = True
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3387
              mmLeft = 0
              mmTop = 0
              mmWidth = 212990
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
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
              636506DD70726F63656475726520546F74616C54726E32796F57696E5063744F
              6E5072696E743B0D0A626567696E0D0A202020696620706C456E74726965735B
              27416765275D203E3D2032207468656E20626567696E0D0A20202009546F7461
              6C54726E32596F57696E5063742E56697369626C65203A3D20547275653B0D0A
              202020656E6420656C736520626567696E0D0A202020202020546F74616C5472
              6E32596F57696E5063742E56697369626C65203A3D2046616C73653B0D0A2020
              20656E643B0D0A2020200D0A2020200D0A2020202020200D0A0D0A656E643B0D
              0A0D436F6D706F6E656E744E616D650611546F74616C54726E32796F57696E50
              6374094576656E744E616D6506074F6E5072696E74074576656E744944022000
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E
              547261696E65724F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F757263650C0D01000070726F63656475726520547261
              696E65724F6E5072696E743B0D0A626567696E0D0A202020202020202020200D
              0A202020547261696E65722E466F6E742E426F6C64203A3D2046616C73653B0D
              0A202020547261696E65722E466F6E742E556E6465726C696E65203A3D204661
              6C73653B0D0A20202020696620706C456E74726965735B27546F74616C54726E
              57696E506374275D203E203234207468656E20626567696E0D0A202020202020
              20547261696E65722E466F6E742E426F6C64203A3D20547275653B0D0A202020
              20202020547261696E65722E466F6E742E556E6465726C696E65203A3D205472
              75653B2020202020200D0A202020656E643B0D0A0D0A20200D0A656E643B0D0A
              0D436F6D706F6E656E744E616D650607547261696E6572094576656E744E616D
              6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D65060D4A6F636B65794F6E507269
              6E740B50726F6772616D54797065070B747450726F63656475726506536F7572
              63650C0301000070726F636564757265204A6F636B65794F6E5072696E743B0D
              0A626567696E0D0A2020204A6F636B65792E466F6E742E426F6C64203A3D2046
              616C73653B0D0A2020204A6F636B65792E466F6E742E556E6465726C696E6520
              3A3D2046616C73653B0D0A2020200D0A2020202020696620706C456E74726965
              735B27546F74616C4A6B7957696E506374275D203E203234207468656E206265
              67696E0D0A202020202020204A6F636B65792E466F6E742E426F6C64203A3D20
              547275653B0D0A202020202020204A6F636B65792E466F6E742E556E6465726C
              696E65203A3D20547275653B2020202020200D0A202020656E643B0D0A202020
              0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506064A6F636B6579
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506164D6F
              726E696E674C696E65446573634F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F7572636506C970726F63656475726520
              4D6F726E696E674C696E65446573634F6E5072696E743B0D0A626567696E0D0A
              0D0A2020204D6F726E696E674C696E65446573632E466F6E742E426F6C64203A
              3D2046616C73653B0D0A20202069662020706C456E74726965735B274D6F726E
              696E674C696E65546F3152616E6B275D203D2031207468656E20626567696E0D
              0A2020202020204D6F726E696E674C696E65446573632E466F6E742E426F6C64
              203A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D
              436F6D706F6E656E744E616D65060F4D6F726E696E674C696E65446573630945
              76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
              72614576656E7448616E646C65720B50726F6772616D4E616D65061253756D6D
              6172794265666F72655072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F75726365063670726F6365647572652053756D6D6172
              794265666F72655072696E743B0D0A626567696E0D0A0D0A2020200D0A200D0A
              656E643B0D0A0D436F6D706F6E656E744E616D65060753756D6D617279094576
              656E744E616D65060B4265666F72655072696E74074576656E74494402180001
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
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D65061A6C626C4D616964656E536865
              65744F726465724F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F757263650C2201000070726F636564757265206C626C
              4D616964656E53686565744F726465724F6E5072696E743B0D0A626567696E0D
              0A0D0A20200D0A2020202069662028706C52616365735265706F72745B275261
              636554797065275D203D20274D5357272920206F720D0A20202020202028706C
              52616365735265706F72745B275261636554797065275D203D20274D434C2729
              207468656E20626567696E0D0A202020202020206C626C4D616964656E536865
              65744F726465722E56697369626C65203A3D20547275653B0D0A20202020656E
              6420656C736520626567696E0D0A202020202020206C626C4D616964656E5368
              6565744F726465722E56697369626C65203A3D2046616C73653B2020200D0A0D
              0A20202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
              616D6506136C626C4D616964656E53686565744F72646572094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D6506174D616964656E53686565
              744F726465724F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F757263650C0B01000070726F636564757265204D616964
              656E53686565744F726465724F6E5072696E743B0D0A626567696E0D0A202069
              662028706C52616365735265706F72745B275261636554797065275D203D2027
              4D5357272920206F720D0A20202020202028706C52616365735265706F72745B
              275261636554797065275D203D20274D434C2729207468656E20626567696E0D
              0A202020202020204D616964656E53686565744F726465722E56697369626C65
              203A3D20547275653B0D0A20202020656E6420656C736520626567696E0D0A20
              2020202020204D616964656E53686565744F726465722E56697369626C65203A
              3D2046616C73653B2020200D0A20202020656E643B0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D6506104D616964656E53686565744F72646572094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D6506186C626C5475
              726653686565744F726465724F6E5072696E740B50726F6772616D5479706507
              0B747450726F63656475726506536F7572636506E470726F636564757265206C
              626C5475726653686565744F726465724F6E5072696E743B0D0A626567696E0D
              0A69662028706C52616365735265706F72745B2753757266616365275D203D20
              27542729202020202020207468656E20626567696E0D0A202020202020206C62
              6C5475726653686565744F726465722E56697369626C65203A3D20547275653B
              0D0A20202020656E6420656C736520626567696E0D0A202020202020206C626C
              5475726653686565744F726465722E56697369626C65203A3D2046616C73653B
              2020200D0A0D0A20202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D6506116C626C5475726653686565744F72646572094576656E74
              4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
              656E7448616E646C65720B50726F6772616D4E616D6506155475726653686565
              744F726465724F6E5072696E740B50726F6772616D54797065070B747450726F
              63656475726506536F7572636506D970726F6365647572652054757266536865
              65744F726465724F6E5072696E743B0D0A626567696E0D0A2069662028706C52
              616365735265706F72745B2753757266616365275D203D202754272920202020
              2020207468656E20626567696E0D0A2020202020205475726653686565744F72
              6465722E56697369626C65203A3D20547275653B0D0A20202020656E6420656C
              736520626567696E0D0A202020202020205475726653686565744F726465722E
              56697369626C65203A3D2046616C73653B2020200D0A20202020656E643B0D0A
              0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E5475726653686565
              744F72646572094576656E744E616D6506074F6E5072696E74074576656E7449
              4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
              6D6506104C61737453706565644F6E5072696E740B50726F6772616D54797065
              070B747450726F63656475726506536F7572636506AE70726F63656475726520
              4C61737453706565644F6E5072696E743B0D0A626567696E0D0A2020204C6173
              7453706565642E466F6E742E426F6C64203A3D2046616C73653B0D0A20202069
              662028706C456E74726965735B274C617374537065656452616E6B275D203D20
              3129207468656E20626567696E0D0A2020202020204C61737453706565642E46
              6F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D6506094C6173745370656564094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D65060F417667436C
              6173734F6E5072696E740B50726F6772616D54797065070B747450726F636564
              75726506536F7572636506AC70726F63656475726520417667436C6173734F6E
              5072696E743B0D0A626567696E0D0A202020417667436C6173732E466F6E742E
              426F6C64203A3D2046616C73653B0D0A20202069662028706C456E7472696573
              5B27417667436C61737352616E6B275D203D203129207468656E20626567696E
              0D0A202020202020417667436C6173732E466F6E742E426F6C64203A3D205472
              75653B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D650608417667436C617373094576656E744E616D6506074F6E5072
              696E74074576656E74494402200001060F5472614576656E7448616E646C6572
              0B50726F6772616D4E616D6506104261636B436C6173734F6E5072696E740B50
              726F6772616D54797065070B747450726F63656475726506536F7572636506AE
              70726F636564757265204261636B436C6173734F6E5072696E743B0D0A626567
              696E0D0A2020204261636B436C6173732E466F6E742E426F6C64203A3D204661
              6C73653B0D0A20202069662028706C456E74726965735B274261636B436C6173
              7352616E6B275D203D203129207468656E20626567696E0D0A20202020202042
              61636B436C6173732E466F6E742E426F6C64203A3D20547275653B0D0A202020
              656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506094261
              636B436C617373094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D650613417667436C61737352616E6B4F6E5072696E740B50726F6772616D
              54797065070B747450726F63656475726506536F7572636506B670726F636564
              75726520417667436C61737352616E6B4F6E5072696E743B0D0A626567696E0D
              0A202020417667436C61737352616E6B2E466F6E742E426F6C64203A3D204661
              6C73653B0D0A20202069662028706C456E74726965735B27417667436C617373
              52616E6B275D203D203129207468656E20626567696E0D0A2020202020204176
              67436C61737352616E6B2E466F6E742E426F6C64203A3D20547275653B0D0A20
              2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C
              417667436C61737352616E6B094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D6506144261636B436C61737352616E6B4F6E5072696E740B50
              726F6772616D54797065070B747450726F63656475726506536F7572636506BA
              70726F636564757265204261636B436C61737352616E6B4F6E5072696E743B0D
              0A626567696E0D0A2020204261636B436C61737352616E6B2E466F6E742E426F
              6C64203A3D2046616C73653B0D0A20202069662028706C456E74726965735B27
              4261636B436C61737352616E6B275D203D203129207468656E20626567696E0D
              0A2020202020204261636B436C61737352616E6B2E466F6E742E426F6C64203A
              3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F
              6E656E744E616D65060D4261636B436C61737352616E6B094576656E744E616D
              6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D6506144261636B53706565645261
              6E6B4F6E5072696E740B50726F6772616D54797065070B747450726F63656475
              726506536F7572636506B970726F636564757265204261636B53706565645261
              6E6B4F6E5072696E743B0D0A626567696E0D0A20204261636B53706565645261
              6E6B2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020206966202870
              6C456E74726965735B274261636B537065656452616E6B275D203D2031292074
              68656E20626567696E0D0A2020202020204261636B537065656452616E6B2E46
              6F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D65060D4261636B537065656452616E
              6B094576656E744E616D6506074F6E5072696E74074576656E74494402200001
              060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061B54
              6F74616C54726E416674436C6D57696E5063744F6E5072696E740B50726F6772
              616D54797065070B747450726F63656475726506536F75726365063770726F63
              656475726520546F74616C54726E416674436C6D57696E5063744F6E5072696E
              743B0D0A626567696E0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              650614546F74616C54726E416674436C6D57696E506374094576656E744E616D
              6506074F6E5072696E74074576656E74494402200001060F5472614576656E74
              48616E646C65720B50726F6772616D4E616D6506104261636B53706565644F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F7572636506AE70726F636564757265204261636B53706565644F6E5072696E
              743B0D0A626567696E0D0A2020204261636B53706565642E466F6E742E426F6C
              64203A3D2046616C73653B0D0A20202069662028706C456E74726965735B2742
              61636B537065656452616E6B275D203D203129207468656E20626567696E0D0A
              2020202020204261636B53706565642E466F6E742E426F6C64203A3D20547275
              653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
              616D6506094261636B5370656564094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D6506144C617374537065656452616E6B4F6E5072696E74
              0B50726F6772616D54797065070B747450726F63656475726506536F75726365
              06BA70726F636564757265204C617374537065656452616E6B4F6E5072696E74
              3B0D0A626567696E0D0A2020204C617374537065656452616E6B2E466F6E742E
              426F6C64203A3D2046616C73653B0D0A20202069662028706C456E7472696573
              5B274C617374537065656452616E6B275D203D203129207468656E2062656769
              6E0D0A2020202020204C617374537065656452616E6B2E466F6E742E426F6C64
              203A3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D
              706F6E656E744E616D65060D4C617374537065656452616E6B094576656E744E
              616D6506074F6E5072696E74074576656E74494402200000}
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
    Active = True
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHospitalReport2'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race.DAT'
    Left = 384
    Top = 168
    object tblRacesLoopTrkCode: TStringField
      FieldName = 'TrkCode'
      Origin = 'Race.TrkCode'
      Required = True
      Size = 3
    end
    object tblRacesLoopRaceDate: TDateField
      FieldName = 'RaceDate'
      Origin = 'Race.RaceDate'
      Required = True
    end
    object tblRacesLoopRangeRaceDate: TDateField
      FieldName = 'RangeRaceDate'
      Origin = 'Race.RangeRaceDate'
    end
    object tblRacesLoopRaceNbr: TSmallintField
      FieldName = 'RaceNbr'
      Origin = 'Race.RaceNbr'
      Required = True
    end
    object tblRacesLoopEstTimeOfRace: TTimeField
      FieldName = 'EstTimeOfRace'
      Origin = 'Race.EstTimeOfRace'
    end
    object tblRacesLoopEstTimeOfFirstRace: TTimeField
      FieldName = 'EstTimeOfFirstRace'
      Origin = 'Race.EstTimeOfFirstRace'
    end
    object tblRacesLoopLocalTimeOfRace: TTimeField
      FieldName = 'LocalTimeOfRace'
      Origin = 'Race.LocalTimeOfRace'
    end
    object tblRacesLoopCT: TStringField
      FieldName = 'CT'
      Origin = 'Race.CT'
      Size = 10
    end
    object tblRacesLoopSurface: TStringField
      FieldName = 'Surface'
      Origin = 'Race.Surface'
      Size = 1
    end
    object tblRacesLoopActualSurface: TStringField
      FieldName = 'ActualSurface'
      Origin = 'Race.ActualSurface'
      Size = 1
    end
    object tblRacesLoopAltSurface: TStringField
      FieldName = 'AltSurface'
      Origin = 'Race.AltSurface'
      Size = 10
    end
    object tblRacesLoopDistanceInFeet: TSmallintField
      FieldName = 'DistanceInFeet'
      Origin = 'Race.DistanceInFeet'
    end
    object tblRacesLoopDistanceInYards: TSmallintField
      FieldName = 'DistanceInYards'
      Origin = 'Race.DistanceInYards'
    end
    object tblRacesLoopDistanceInFurlongs: TFloatField
      FieldName = 'DistanceInFurlongs'
      Origin = 'Race.DistanceInFurlongs'
    end
    object tblRacesLoopDistanceDesc: TStringField
      FieldName = 'DistanceDesc'
      Origin = 'Race.DistanceDesc'
      Size = 15
    end
    object tblRacesLoopRaceType: TStringField
      FieldName = 'RaceType'
      Origin = 'Race.RaceType'
      Size = 4
    end
    object tblRacesLoopTypeOfRace: TStringField
      FieldName = 'TypeOfRace'
      Origin = 'Race.TypeOfRace'
      Size = 1
    end
    object tblRacesLoopRaceTypeDesc: TStringField
      FieldName = 'RaceTypeDesc'
      Origin = 'Race.RaceTypeDesc'
      Size = 25
    end
    object tblRacesLoopRaceDesc: TStringField
      FieldName = 'RaceDesc'
      Origin = 'Race.RaceDesc'
      Size = 250
    end
    object tblRacesLoopRaceCondition: TMemoField
      FieldName = 'RaceCondition'
      Origin = 'Race.RaceCondition'
      BlobType = ftMemo
    end
    object tblRacesLoopIsTurfRace: TBooleanField
      FieldName = 'IsTurfRace'
      Origin = 'Race.IsTurfRace'
    end
    object tblRacesLoopIsRouteRace: TBooleanField
      FieldName = 'IsRouteRace'
      Origin = 'Race.IsRouteRace'
    end
    object tblRacesLoopIsMaidenSpecialRace: TBooleanField
      FieldName = 'IsMaidenSpecialRace'
      Origin = 'Race.IsMaidenSpecialRace'
    end
    object tblRacesLoopIsMaidenClaimingRace: TBooleanField
      FieldName = 'IsMaidenClaimingRace'
      Origin = 'Race.IsMaidenClaimingRace'
    end
    object tblRacesLoopIsMaidenOrTurfRace: TBooleanField
      FieldName = 'IsMaidenOrTurfRace'
      Origin = 'Race.IsMaidenOrTurfRace'
    end
    object tblRacesLoopIsTwoYearOldRace: TBooleanField
      FieldName = 'IsTwoYearOldRace'
      Origin = 'Race.IsTwoYearOldRace'
    end
    object tblRacesLoopIsClaimingRace: TBooleanField
      FieldName = 'IsClaimingRace'
      Origin = 'Race.IsClaimingRace'
    end
    object tblRacesLoopAgeSexRestriction: TStringField
      FieldName = 'AgeSexRestriction'
      Origin = 'Race.AgeSexRestriction'
      Size = 3
    end
    object tblRacesLoopPurse: TFloatField
      FieldName = 'Purse'
      Origin = 'Race.Purse'
    end
    object tblRacesLoopClaimingPrice: TFloatField
      FieldName = 'ClaimingPrice'
      Origin = 'Race.ClaimingPrice'
    end
    object tblRacesLoopSimulcastTrkCode: TStringField
      FieldName = 'SimulcastTrkCode'
      Origin = 'Race.SimulcastTrkCode'
      Size = 3
    end
    object tblRacesLoopSimulcastRaceNbr: TSmallintField
      FieldName = 'SimulcastRaceNbr'
      Origin = 'Race.SimulcastRaceNbr'
    end
    object tblRacesLoopRaceAutoInc: TAutoIncField
      FieldName = 'RaceAutoInc'
      Origin = 'Race.RaceAutoInc'
    end
    object tblRacesLoopTimeDiff: TTimeField
      FieldName = 'TimeDiff'
      Origin = 'Race.TimeDiff'
    end
    object tblRacesLoopIsDDRace: TBooleanField
      FieldName = 'IsDDRace'
      Origin = 'Race.IsDDRace'
    end
    object tblRacesLoopDDRaceNbr: TStringField
      FieldName = 'DDRaceNbr'
      Origin = 'Race.DDRaceNbr'
      Size = 10
    end
    object tblRacesLoopIsPk3Race: TBooleanField
      FieldName = 'IsPk3Race'
      Origin = 'Race.IsPk3Race'
    end
    object tblRacesLoopPk3RaceNbr: TStringField
      FieldName = 'Pk3RaceNbr'
      Origin = 'Race.Pk3RaceNbr'
      Size = 10
    end
    object tblRacesLoopIsPk4Race: TBooleanField
      FieldName = 'IsPk4Race'
      Origin = 'Race.IsPk4Race'
    end
    object tblRacesLoopPk4RaceNbr: TSmallintField
      FieldName = 'Pk4RaceNbr'
      Origin = 'Race.Pk4RaceNbr'
    end
    object tblRacesLoopIsPk6Race: TBooleanField
      FieldName = 'IsPk6Race'
      Origin = 'Race.IsPk6Race'
    end
    object tblRacesLoopPK6RaceNbr: TSmallintField
      FieldName = 'PK6RaceNbr'
      Origin = 'Race.PK6RaceNbr'
    end
    object tblRacesLoopIsTriRace: TBooleanField
      FieldName = 'IsTriRace'
      Origin = 'Race.IsTriRace'
    end
    object tblRacesLoopIsSuperRace: TBooleanField
      FieldName = 'IsSuperRace'
      Origin = 'Race.IsSuperRace'
    end
    object tblRacesLoopIsQuiRace: TBooleanField
      FieldName = 'IsQuiRace'
      Origin = 'Race.IsQuiRace'
    end
    object tblRacesLoopIsExaRace: TBooleanField
      FieldName = 'IsExaRace'
      Origin = 'Race.IsExaRace'
    end
    object tblRacesLoopNbrTriKey: TIntegerField
      FieldName = 'NbrTriKey'
      Origin = 'Race.NbrTriKey'
    end
    object tblRacesLoopIsPk3Leg1: TBooleanField
      FieldName = 'IsPk3Leg1'
      Origin = 'Race.IsPk3Leg1'
    end
    object tblRacesLoopIsPk4Leg1: TBooleanField
      FieldName = 'IsPk4Leg1'
      Origin = 'Race.IsPk4Leg1'
    end
    object tblRacesLoopIsPk6Leg1: TBooleanField
      FieldName = 'IsPk6Leg1'
      Origin = 'Race.IsPk6Leg1'
    end
    object tblRacesLoopIsPk9Leg1: TBooleanField
      FieldName = 'IsPk9Leg1'
      Origin = 'Race.IsPk9Leg1'
    end
    object tblRacesLoopIsDDLeg1: TBooleanField
      FieldName = 'IsDDLeg1'
      Origin = 'Race.IsDDLeg1'
    end
    object tblRacesLoopTotalPk3Choices: TSmallintField
      FieldName = 'TotalPk3Choices'
      Origin = 'Race.TotalPk3Choices'
    end
    object tblRacesLoopPk3KeyType: TSmallintField
      FieldName = 'Pk3KeyType'
      Origin = 'Race.Pk3KeyType'
    end
    object tblRacesLoopPk3Selected: TBooleanField
      FieldName = 'Pk3Selected'
      Origin = 'Race.Pk3Selected'
    end
    object tblRacesLoopTotalTriChoices: TSmallintField
      FieldName = 'TotalTriChoices'
      Origin = 'Race.TotalTriChoices'
    end
    object tblRacesLoopTotalSuperChoices: TSmallintField
      FieldName = 'TotalSuperChoices'
      Origin = 'Race.TotalSuperChoices'
    end
    object tblRacesLoopTotalDDChoices: TSmallintField
      FieldName = 'TotalDDChoices'
      Origin = 'Race.TotalDDChoices'
    end
    object tblRacesLoopTopLastSpeed: TSmallintField
      FieldName = 'TopLastSpeed'
      Origin = 'Race.TopLastSpeed'
    end
    object tblRacesLoopTopBackSpeed: TSmallintField
      FieldName = 'TopBackSpeed'
      Origin = 'Race.TopBackSpeed'
    end
    object tblRacesLoopTopLastClass: TFloatField
      FieldName = 'TopLastClass'
      Origin = 'Race.TopLastClass'
    end
    object tblRacesLoopAltWager1: TStringField
      FieldName = 'AltWager1'
      Origin = 'Race.AltWager1'
      Size = 40
    end
    object tblRacesLoopAltWager2: TStringField
      FieldName = 'AltWager2'
      Origin = 'Race.AltWager2'
      Size = 40
    end
    object tblRacesLoopAltWager3: TStringField
      FieldName = 'AltWager3'
      Origin = 'Race.AltWager3'
      Size = 40
    end
    object tblRacesLoopAltWager4: TStringField
      FieldName = 'AltWager4'
      Origin = 'Race.AltWager4'
      Size = 40
    end
    object tblRacesLoopAltWager5: TStringField
      FieldName = 'AltWager5'
      Origin = 'Race.AltWager5'
      Size = 40
    end
    object tblRacesLoopAltWager6: TStringField
      FieldName = 'AltWager6'
      Origin = 'Race.AltWager6'
      Size = 40
    end
    object tblRacesLoopWager1: TStringField
      FieldName = 'Wager1'
      Origin = 'Race.Wager1'
      Size = 40
    end
    object tblRacesLoopWager2: TStringField
      FieldName = 'Wager2'
      Origin = 'Race.Wager2'
      Size = 40
    end
    object tblRacesLoopWager3: TStringField
      FieldName = 'Wager3'
      Origin = 'Race.Wager3'
      Size = 40
    end
    object tblRacesLoopWager4: TStringField
      FieldName = 'Wager4'
      Origin = 'Race.Wager4'
      Size = 40
    end
    object tblRacesLoopWager5: TStringField
      FieldName = 'Wager5'
      Origin = 'Race.Wager5'
      Size = 40
    end
    object tblRacesLoopWager6: TStringField
      FieldName = 'Wager6'
      Origin = 'Race.Wager6'
      Size = 40
    end
    object tblRacesLoopWagerFinalOrder: TStringField
      FieldName = 'WagerFinalOrder'
      Origin = 'Race.WagerFinalOrder'
      Size = 40
    end
    object tblRacesLoopWagerSheetOrder: TStringField
      FieldName = 'WagerSheetOrder'
      Origin = 'Race.WagerSheetOrder'
      Size = 40
    end
    object tblRacesLoopTodaysWagerOrder: TStringField
      FieldName = 'TodaysWagerOrder'
      Origin = 'Race.TodaysWagerOrder'
      Size = 40
    end
    object tblRacesLoopTri: TStringField
      FieldName = 'Tri'
      Origin = 'Race.Tri'
      Size = 40
    end
    object tblRacesLoopDD: TStringField
      FieldName = 'DD'
      Origin = 'Race.DD'
      Size = 40
    end
    object tblRacesLoopSuper: TStringField
      FieldName = 'Super'
      Origin = 'Race.Super'
      Size = 40
    end
    object tblRacesLoopExacta: TStringField
      FieldName = 'Exacta'
      Origin = 'Race.Exacta'
      Size = 40
    end
    object tblRacesLoopQuinella: TStringField
      FieldName = 'Quinella'
      Origin = 'Race.Quinella'
      Size = 40
    end
    object tblRacesLoopPick3: TStringField
      FieldName = 'Pick3'
      Origin = 'Race.Pick3'
      Size = 40
    end
    object tblRacesLoopPick4: TStringField
      FieldName = 'Pick4'
      Origin = 'Race.Pick4'
      Size = 40
    end
    object tblRacesLoopPick6: TStringField
      FieldName = 'Pick6'
      Origin = 'Race.Pick6'
      Size = 40
    end
    object tblRacesLoopIsPrintedOnValueSheet: TBooleanField
      FieldName = 'IsPrintedOnValueSheet'
      Origin = 'Race.IsPrintedOnValueSheet'
    end
    object tblRacesLoopIsYoubetTrack: TBooleanField
      FieldName = 'IsYoubetTrack'
      Origin = 'Race.IsYoubetTrack'
    end
    object tblRacesLoopWPSWagerAmt: TFloatField
      FieldName = 'WPSWagerAmt'
      Origin = 'Race.WPSWagerAmt'
    end
    object tblRacesLoopSfcWagerAmt: TFloatField
      FieldName = 'SfcWagerAmt'
      Origin = 'Race.SfcWagerAmt'
    end
    object tblRacesLoopTriWagerAmt: TFloatField
      FieldName = 'TriWagerAmt'
      Origin = 'Race.TriWagerAmt'
    end
    object tblRacesLoopExaWagerAmt: TFloatField
      FieldName = 'ExaWagerAmt'
      Origin = 'Race.ExaWagerAmt'
    end
    object tblRacesLoopQuiWagerAmt: TFloatField
      FieldName = 'QuiWagerAmt'
      Origin = 'Race.QuiWagerAmt'
    end
    object tblRacesLoopDDWagerAmt: TFloatField
      FieldName = 'DDWagerAmt'
      Origin = 'Race.DDWagerAmt'
    end
    object tblRacesLoopPk3WagerAmt: TFloatField
      FieldName = 'Pk3WagerAmt'
      Origin = 'Race.Pk3WagerAmt'
    end
    object tblRacesLoopPk4WagerAmt: TFloatField
      FieldName = 'Pk4WagerAmt'
      Origin = 'Race.Pk4WagerAmt'
    end
    object tblRacesLoopPk6WagerAmt: TFloatField
      FieldName = 'Pk6WagerAmt'
      Origin = 'Race.Pk6WagerAmt'
    end
    object tblRacesLoopTopEarlyPace: TFloatField
      FieldName = 'TopEarlyPace'
      Origin = 'Race.TopEarlyPace'
    end
    object tblRacesLoopTopMiddlePace: TFloatField
      FieldName = 'TopMiddlePace'
      Origin = 'Race.TopMiddlePace'
    end
    object tblRacesLoopTopLatePace: TFloatField
      FieldName = 'TopLatePace'
      Origin = 'Race.TopLatePace'
    end
    object tblRacesLoopTopEarlyPacePos: TFloatField
      FieldName = 'TopEarlyPacePos'
      Origin = 'Race.TopEarlyPacePos'
    end
    object tblRacesLoopTopMiddlePacePos: TFloatField
      FieldName = 'TopMiddlePacePos'
      Origin = 'Race.TopMiddlePacePos'
    end
    object tblRacesLoopTopLatePacePos: TFloatField
      FieldName = 'TopLatePacePos'
      Origin = 'Race.TopLatePacePos'
    end
    object tblRacesLoopSecondEarlyPace: TFloatField
      FieldName = 'SecondEarlyPace'
      Origin = 'Race.SecondEarlyPace'
    end
    object tblRacesLoopSecondMiddlePace: TFloatField
      FieldName = 'SecondMiddlePace'
      Origin = 'Race.SecondMiddlePace'
    end
    object tblRacesLoopSecondLatePace: TFloatField
      FieldName = 'SecondLatePace'
      Origin = 'Race.SecondLatePace'
    end
    object tblRacesLoopSecondEarlyPacePos: TFloatField
      FieldName = 'SecondEarlyPacePos'
      Origin = 'Race.SecondEarlyPacePos'
    end
    object tblRacesLoopSecondMiddlePacePos: TFloatField
      FieldName = 'SecondMiddlePacePos'
      Origin = 'Race.SecondMiddlePacePos'
    end
    object tblRacesLoopSecondLatePacePos: TFloatField
      FieldName = 'SecondLatePacePos'
      Origin = 'Race.SecondLatePacePos'
    end
    object tblRacesLoopTopPower: TFloatField
      FieldName = 'TopPower'
      Origin = 'Race.TopPower'
    end
    object tblRacesLoopSecondTopPower: TFloatField
      FieldName = 'SecondTopPower'
      Origin = 'Race.SecondTopPower'
    end
    object tblRacesLoopThirdTopPower: TFloatField
      FieldName = 'ThirdTopPower'
      Origin = 'Race.ThirdTopPower'
    end
    object tblRacesLoopFourthTopPower: TFloatField
      FieldName = 'FourthTopPower'
      Origin = 'Race.FourthTopPower'
    end
    object tblRacesLoopMaxWPSBet: TFloatField
      FieldName = 'MaxWPSBet'
      Origin = 'Race.MaxWPSBet'
    end
    object tblRacesLoopMaxGimmickBet: TFloatField
      FieldName = 'MaxGimmickBet'
      Origin = 'Race.MaxGimmickBet'
    end
    object tblRacesLoopNbrStarters: TSmallintField
      FieldName = 'NbrStarters'
      Origin = 'Race.NbrStarters'
    end
    object tblRacesLoopNbrDebutStarters: TSmallintField
      FieldName = 'NbrDebutStarters'
      Origin = 'Race.NbrDebutStarters'
    end
    object tblRacesLoopNbrDebutTwoStarters: TSmallintField
      FieldName = 'NbrDebutTwoStarters'
      Origin = 'Race.NbrDebutTwoStarters'
    end
    object tblRacesLoopNbrTurfDebutStarters: TSmallintField
      FieldName = 'NbrTurfDebutStarters'
      Origin = 'Race.NbrTurfDebutStarters'
    end
    object tblRacesLoopNbrRouteDebutStarters: TSmallintField
      FieldName = 'NbrRouteDebutStarters'
      Origin = 'Race.NbrRouteDebutStarters'
    end
    object tblRacesLoopNbrScratchedStarters: TSmallintField
      FieldName = 'NbrScratchedStarters'
      Origin = 'Race.NbrScratchedStarters'
    end
    object tblRacesLoopNbrRunners: TSmallintField
      FieldName = 'NbrRunners'
      Origin = 'Race.NbrRunners'
    end
    object tblRacesLoopOrigSurface: TStringField
      FieldName = 'OrigSurface'
      Origin = 'Race.OrigSurface'
      Size = 1
    end
    object tblRacesLoopIsPk9Place: TBooleanField
      FieldName = 'IsPk9Place'
      Origin = 'Race.IsPk9Place'
    end
    object tblRacesLoopPk9RaceNbr: TSmallintField
      FieldName = 'Pk9RaceNbr'
      Origin = 'Race.Pk9RaceNbr'
    end
    object tblRacesLoopRaceCondition1: TStringField
      FieldName = 'RaceCondition1'
      Origin = 'Race.RaceCondition1'
      Size = 40
    end
    object tblRacesLoopRaceCondition2: TStringField
      FieldName = 'RaceCondition2'
      Origin = 'Race.RaceCondition2'
      Size = 40
    end
    object tblRacesLoopRaceCondition3: TStringField
      FieldName = 'RaceCondition3'
      Origin = 'Race.RaceCondition3'
      Size = 40
    end
    object tblRacesLoopRaceCondition4: TStringField
      FieldName = 'RaceCondition4'
      Origin = 'Race.RaceCondition4'
      Size = 40
    end
    object tblRacesLoopRaceCondition5: TStringField
      FieldName = 'RaceCondition5'
      Origin = 'Race.RaceCondition5'
      Size = 40
    end
    object tblRacesLoopRaceCondition6: TStringField
      FieldName = 'RaceCondition6'
      Origin = 'Race.RaceCondition6'
      Size = 40
    end
    object tblRacesLoopBetLine: TStringField
      FieldName = 'BetLine'
      Origin = 'Race.BetLine'
      Size = 500
    end
    object tblRacesLoopRaceConditions: TStringField
      FieldName = 'RaceConditions'
      Origin = 'Race.RaceConditions'
      Size = 15
    end
    object tblRacesLoopTrkCond: TStringField
      FieldName = 'TrkCond'
      Origin = 'Race.TrkCond'
      Size = 3
    end
    object tblRacesLoopOrigDistanceDesc: TStringField
      FieldName = 'OrigDistanceDesc'
      Origin = 'Race.OrigDistanceDesc'
    end
    object tblRacesLoopIsExactaMatched: TBooleanField
      FieldName = 'IsExactaMatched'
      Origin = 'Race.IsExactaMatched'
    end
    object tblRacesLoopExactaNbrs: TStringField
      FieldName = 'ExactaNbrs'
      Origin = 'Race.ExactaNbrs'
      Size = 50
    end
    object tblRacesLoopExactaWager: TFloatField
      FieldName = 'ExactaWager'
      Origin = 'Race.ExactaWager'
    end
    object tblRacesLoopExactaPayout: TFloatField
      FieldName = 'ExactaPayout'
      Origin = 'Race.ExactaPayout'
    end
    object tblRacesLoopIsTrifectaMatched: TBooleanField
      FieldName = 'IsTrifectaMatched'
      Origin = 'Race.IsTrifectaMatched'
    end
    object tblRacesLoopTrifectaNbrs: TStringField
      FieldName = 'TrifectaNbrs'
      Origin = 'Race.TrifectaNbrs'
      Size = 50
    end
    object tblRacesLoopTrifectaWager: TFloatField
      FieldName = 'TrifectaWager'
      Origin = 'Race.TrifectaWager'
    end
    object tblRacesLoopTrifectaPayout: TFloatField
      FieldName = 'TrifectaPayout'
      Origin = 'Race.TrifectaPayout'
    end
    object tblRacesLoopIsSuperfectaMatched: TBooleanField
      FieldName = 'IsSuperfectaMatched'
      Origin = 'Race.IsSuperfectaMatched'
    end
    object tblRacesLoopSuperfectaNbrs: TStringField
      FieldName = 'SuperfectaNbrs'
      Origin = 'Race.SuperfectaNbrs'
      Size = 50
    end
    object tblRacesLoopSuperfectaWager: TFloatField
      FieldName = 'SuperfectaWager'
      Origin = 'Race.SuperfectaWager'
    end
    object tblRacesLoopSuperfectaPayout: TFloatField
      FieldName = 'SuperfectaPayout'
      Origin = 'Race.SuperfectaPayout'
    end
    object tblRacesLoopIsDailyDoubleMatchedFirstRace: TBooleanField
      FieldName = 'IsDailyDoubleMatchedFirstRace'
      Origin = 'Race.IsDailyDoubleMatchedFirstRace'
    end
    object tblRacesLoopIsDailyDoubleMatchedLastRace: TBooleanField
      FieldName = 'IsDailyDoubleMatchedLastRace'
      Origin = 'Race.IsDailyDoubleMatchedLastRace'
    end
    object tblRacesLoopDDFirstRace: TStringField
      FieldName = 'DDFirstRace'
      Origin = 'Race.DDFirstRace'
      Size = 40
    end
    object tblRacesLoopDDLastRace: TStringField
      FieldName = 'DDLastRace'
      Origin = 'Race.DDLastRace'
      Size = 40
    end
    object tblRacesLoopDailyDoubleNbrsFirstRace: TStringField
      FieldName = 'DailyDoubleNbrsFirstRace'
      Origin = 'Race.DailyDoubleNbrsFirstRace'
      Size = 50
    end
    object tblRacesLoopDailyDoubleNbrsLastRace: TStringField
      FieldName = 'DailyDoubleNbrsLastRace'
      Origin = 'Race.DailyDoubleNbrsLastRace'
      Size = 50
    end
    object tblRacesLoopDailyDoubleWagerFirstRace: TFloatField
      FieldName = 'DailyDoubleWagerFirstRace'
      Origin = 'Race.DailyDoubleWagerFirstRace'
    end
    object tblRacesLoopDailyDoubleWagerLastRace: TFloatField
      FieldName = 'DailyDoubleWagerLastRace'
      Origin = 'Race.DailyDoubleWagerLastRace'
    end
    object tblRacesLoopDailyDoublePayoutFirstRace: TFloatField
      FieldName = 'DailyDoublePayoutFirstRace'
      Origin = 'Race.DailyDoublePayoutFirstRace'
    end
    object tblRacesLoopDailyDoublePayoutLastRace: TFloatField
      FieldName = 'DailyDoublePayoutLastRace'
      Origin = 'Race.DailyDoublePayoutLastRace'
    end
    object tblRacesLoopIsQuinellaMatched: TBooleanField
      FieldName = 'IsQuinellaMatched'
      Origin = 'Race.IsQuinellaMatched'
    end
    object tblRacesLoopQuinellaNbrs: TStringField
      FieldName = 'QuinellaNbrs'
      Origin = 'Race.QuinellaNbrs'
      Size = 50
    end
    object tblRacesLoopQuinellaWager: TFloatField
      FieldName = 'QuinellaWager'
      Origin = 'Race.QuinellaWager'
    end
    object tblRacesLoopQuinellaPayout: TFloatField
      FieldName = 'QuinellaPayout'
      Origin = 'Race.QuinellaPayout'
    end
    object tblRacesLoopIsPick3MatchedFirstRace: TBooleanField
      FieldName = 'IsPick3MatchedFirstRace'
      Origin = 'Race.IsPick3MatchedFirstRace'
    end
    object tblRacesLoopIsPick3MatchedLastRace: TBooleanField
      FieldName = 'IsPick3MatchedLastRace'
      Origin = 'Race.IsPick3MatchedLastRace'
    end
    object tblRacesLoopPick3FirstRace: TStringField
      FieldName = 'Pick3FirstRace'
      Origin = 'Race.Pick3FirstRace'
      Size = 40
    end
    object tblRacesLoopPick3LastRace: TStringField
      FieldName = 'Pick3LastRace'
      Origin = 'Race.Pick3LastRace'
      Size = 40
    end
    object tblRacesLoopPick3NbrsFirstRace: TStringField
      FieldName = 'Pick3NbrsFirstRace'
      Origin = 'Race.Pick3NbrsFirstRace'
      Size = 50
    end
    object tblRacesLoopPick3NbrsLastRace: TStringField
      FieldName = 'Pick3NbrsLastRace'
      Origin = 'Race.Pick3NbrsLastRace'
      Size = 50
    end
    object tblRacesLoopPick3WagerFirstRace: TFloatField
      FieldName = 'Pick3WagerFirstRace'
      Origin = 'Race.Pick3WagerFirstRace'
    end
    object tblRacesLoopPick3WagerLastRace: TFloatField
      FieldName = 'Pick3WagerLastRace'
      Origin = 'Race.Pick3WagerLastRace'
    end
    object tblRacesLoopPick3PayoutFirstRace: TFloatField
      FieldName = 'Pick3PayoutFirstRace'
      Origin = 'Race.Pick3PayoutFirstRace'
    end
    object tblRacesLoopPick3PayoutLastRace: TFloatField
      FieldName = 'Pick3PayoutLastRace'
      Origin = 'Race.Pick3PayoutLastRace'
    end
    object tblRacesLoopPick3NbrsLeg1: TStringField
      FieldName = 'Pick3NbrsLeg1'
      Origin = 'Race.Pick3NbrsLeg1'
      Size = 25
    end
    object tblRacesLoopPick3NbrsLeg2: TStringField
      FieldName = 'Pick3NbrsLeg2'
      Origin = 'Race.Pick3NbrsLeg2'
      Size = 25
    end
    object tblRacesLoopPick3NbrsLeg3: TStringField
      FieldName = 'Pick3NbrsLeg3'
      Origin = 'Race.Pick3NbrsLeg3'
      Size = 25
    end
    object tblRacesLoopIsPick4MatchedFirstRace: TBooleanField
      FieldName = 'IsPick4MatchedFirstRace'
      Origin = 'Race.IsPick4MatchedFirstRace'
    end
    object tblRacesLoopIsPick4MatchedLastRace: TBooleanField
      FieldName = 'IsPick4MatchedLastRace'
      Origin = 'Race.IsPick4MatchedLastRace'
    end
    object tblRacesLoopPick4FirstRace: TStringField
      FieldName = 'Pick4FirstRace'
      Origin = 'Race.Pick4FirstRace'
      Size = 40
    end
    object tblRacesLoopPick4LastRace: TStringField
      FieldName = 'Pick4LastRace'
      Origin = 'Race.Pick4LastRace'
      Size = 40
    end
    object tblRacesLoopPick4NbrsFirstRace: TStringField
      FieldName = 'Pick4NbrsFirstRace'
      Origin = 'Race.Pick4NbrsFirstRace'
      Size = 50
    end
    object tblRacesLoopPick4NbrsLastRace: TStringField
      FieldName = 'Pick4NbrsLastRace'
      Origin = 'Race.Pick4NbrsLastRace'
      Size = 50
    end
    object tblRacesLoopPick4WagerFirstRace: TFloatField
      FieldName = 'Pick4WagerFirstRace'
      Origin = 'Race.Pick4WagerFirstRace'
    end
    object tblRacesLoopPick4WagerLastRace: TFloatField
      FieldName = 'Pick4WagerLastRace'
      Origin = 'Race.Pick4WagerLastRace'
    end
    object tblRacesLoopPick4PayoutFirstRace: TFloatField
      FieldName = 'Pick4PayoutFirstRace'
      Origin = 'Race.Pick4PayoutFirstRace'
    end
    object tblRacesLoopPick4PayoutLastRace: TFloatField
      FieldName = 'Pick4PayoutLastRace'
      Origin = 'Race.Pick4PayoutLastRace'
    end
    object tblRacesLoopPick4NbrsLeg1: TStringField
      FieldName = 'Pick4NbrsLeg1'
      Origin = 'Race.Pick4NbrsLeg1'
      Size = 25
    end
    object tblRacesLoopPick4NbrsLeg2: TStringField
      FieldName = 'Pick4NbrsLeg2'
      Origin = 'Race.Pick4NbrsLeg2'
      Size = 25
    end
    object tblRacesLoopPick4NbrsLeg3: TStringField
      FieldName = 'Pick4NbrsLeg3'
      Origin = 'Race.Pick4NbrsLeg3'
      Size = 25
    end
    object tblRacesLoopPick4NbrsLeg4: TStringField
      FieldName = 'Pick4NbrsLeg4'
      Origin = 'Race.Pick4NbrsLeg4'
      Size = 25
    end
    object tblRacesLoopIsPick6MatchedFirstRace: TBooleanField
      FieldName = 'IsPick6MatchedFirstRace'
      Origin = 'Race.IsPick6MatchedFirstRace'
    end
    object tblRacesLoopIsPick6MatchedLastRace: TBooleanField
      FieldName = 'IsPick6MatchedLastRace'
      Origin = 'Race.IsPick6MatchedLastRace'
    end
    object tblRacesLoopPick6FirstRace: TStringField
      FieldName = 'Pick6FirstRace'
      Origin = 'Race.Pick6FirstRace'
      Size = 40
    end
    object tblRacesLoopPick6LastRace: TStringField
      FieldName = 'Pick6LastRace'
      Origin = 'Race.Pick6LastRace'
      Size = 40
    end
    object tblRacesLoopPick6NbrsFirstRace: TStringField
      FieldName = 'Pick6NbrsFirstRace'
      Origin = 'Race.Pick6NbrsFirstRace'
      Size = 50
    end
    object tblRacesLoopPick6NbrsLastRace: TStringField
      FieldName = 'Pick6NbrsLastRace'
      Origin = 'Race.Pick6NbrsLastRace'
      Size = 50
    end
    object tblRacesLoopPick6WagerFirstRace: TFloatField
      FieldName = 'Pick6WagerFirstRace'
      Origin = 'Race.Pick6WagerFirstRace'
    end
    object tblRacesLoopPick6WagerLastRace: TFloatField
      FieldName = 'Pick6WagerLastRace'
      Origin = 'Race.Pick6WagerLastRace'
    end
    object tblRacesLoopPick6PayoutFirstRace: TFloatField
      FieldName = 'Pick6PayoutFirstRace'
      Origin = 'Race.Pick6PayoutFirstRace'
    end
    object tblRacesLoopPick6PayoutLastRace: TFloatField
      FieldName = 'Pick6PayoutLastRace'
      Origin = 'Race.Pick6PayoutLastRace'
    end
    object tblRacesLoopIsWinMatched: TBooleanField
      FieldName = 'IsWinMatched'
      Origin = 'Race.IsWinMatched'
    end
    object tblRacesLoopWinNbrs: TStringField
      FieldName = 'WinNbrs'
      Origin = 'Race.WinNbrs'
      Size = 50
    end
    object tblRacesLoopWinPayout: TFloatField
      FieldName = 'WinPayout'
      Origin = 'Race.WinPayout'
    end
    object tblRacesLoopWinPlcPayout: TFloatField
      FieldName = 'WinPlcPayout'
      Origin = 'Race.WinPlcPayout'
    end
    object tblRacesLoopWinShoPayout: TFloatField
      FieldName = 'WinShoPayout'
      Origin = 'Race.WinShoPayout'
    end
    object tblRacesLoopIsPlcMatched: TBooleanField
      FieldName = 'IsPlcMatched'
      Origin = 'Race.IsPlcMatched'
    end
    object tblRacesLoopPlcNbrs: TStringField
      FieldName = 'PlcNbrs'
      Origin = 'Race.PlcNbrs'
      Size = 50
    end
    object tblRacesLoopPlcPayout: TFloatField
      FieldName = 'PlcPayout'
      Origin = 'Race.PlcPayout'
    end
    object tblRacesLoopPlcShoPayout: TFloatField
      FieldName = 'PlcShoPayout'
      Origin = 'Race.PlcShoPayout'
    end
    object tblRacesLoopIsShoMatched: TBooleanField
      FieldName = 'IsShoMatched'
      Origin = 'Race.IsShoMatched'
    end
    object tblRacesLoopShoNbrs: TStringField
      FieldName = 'ShoNbrs'
      Origin = 'Race.ShoNbrs'
      Size = 50
    end
    object tblRacesLoopShoPayout: TFloatField
      FieldName = 'ShoPayout'
      Origin = 'Race.ShoPayout'
    end
    object tblRacesLoopRaceShape: TStringField
      FieldName = 'RaceShape'
      Origin = 'Race.RaceShape'
      Size = 50
    end
    object tblRacesLoopPostTimes: TStringField
      FieldName = 'PostTimes'
      Origin = 'Race.PostTimes'
      Size = 50
    end
    object tblRacesLoopIs10CentSuperfectaRace: TBooleanField
      FieldName = 'Is10CentSuperfectaRace'
      Origin = 'Race.Is10CentSuperfectaRace'
    end
    object tblRacesLoopIs50CentTrifectaRace: TBooleanField
      FieldName = 'Is50CentTrifectaRace'
      Origin = 'Race.Is50CentTrifectaRace'
    end
    object tblRacesLoopIs50CentPk3Race: TBooleanField
      FieldName = 'Is50CentPk3Race'
      Origin = 'Race.Is50CentPk3Race'
    end
    object tblRacesLoopIs50CentPk4Race: TBooleanField
      FieldName = 'Is50CentPk4Race'
      Origin = 'Race.Is50CentPk4Race'
    end
    object tblRacesLoopET: TStringField
      FieldName = 'ET'
      Origin = 'Race.ET'
      Size = 10
    end
    object tblRacesLoopMT: TStringField
      FieldName = 'MT'
      Origin = 'Race.MT'
      Size = 10
    end
    object tblRacesLoopPT: TStringField
      FieldName = 'PT'
      Origin = 'Race.PT'
      Size = 10
    end
    object tblRacesLoopIsWagerSheetSelected: TBooleanField
      FieldName = 'IsWagerSheetSelected'
      Origin = 'Race.IsWagerSheetSelected'
    end
    object tblRacesLoopValue: TStringField
      FieldName = 'Value'
      Origin = 'Race.Value'
      Size = 10
    end
    object tblRacesLoopIsPTCTrack: TBooleanField
      FieldName = 'IsPTCTrack'
      Origin = 'Race.IsPTCTrack'
    end
    object tblRacesLoopIsTwinSpiresTrack: TBooleanField
      FieldName = 'IsTwinSpiresTrack'
      Origin = 'Race.IsTwinSpiresTrack'
    end
    object tblRacesLoopTodaysAltWagerWinPct: TFloatField
      FieldName = 'TodaysAltWagerWinPct'
      Origin = 'Race.TodaysAltWagerWinPct'
    end
    object tblRacesLoopTodaysAltWagerWinPctRank: TSmallintField
      FieldName = 'TodaysAltWagerWinPctRank'
      Origin = 'Race.TodaysAltWagerWinPctRank'
    end
    object tblRacesLoopMudSheetOrder: TStringField
      FieldName = 'MudSheetOrder'
      Origin = 'Race.MudSheetOrder'
      Size = 50
    end
    object tblRacesLoopTurfSheetOrder: TStringField
      FieldName = 'TurfSheetOrder'
      Origin = 'Race.TurfSheetOrder'
      Size = 50
    end
    object tblRacesLoopMaidenSheetOrder: TStringField
      FieldName = 'MaidenSheetOrder'
      Origin = 'Race.MaidenSheetOrder'
      Size = 50
    end
    object tblRacesLoopDistanceSheetOrder: TStringField
      FieldName = 'DistanceSheetOrder'
      Origin = 'Race.DistanceSheetOrder'
      Size = 50
    end
    object tblRacesLoopAWSheetOrder: TStringField
      FieldName = 'AWSheetOrder'
      Origin = 'Race.AWSheetOrder'
      Size = 50
    end
    object tblRacesLoopTrainerSheetOrder: TStringField
      FieldName = 'TrainerSheetOrder'
      Origin = 'Race.TrainerSheetOrder'
      Size = 50
    end
    object tblRacesLoopJockeySheetOrder: TStringField
      FieldName = 'JockeySheetOrder'
      Origin = 'Race.JockeySheetOrder'
      Size = 50
    end
    object tblRacesLoopOwnerSheetOrder: TStringField
      FieldName = 'OwnerSheetOrder'
      Origin = 'Race.OwnerSheetOrder'
      Size = 50
    end
    object tblRacesLoopTrainerJockeySheetOrder: TStringField
      FieldName = 'TrainerJockeySheetOrder'
      Origin = 'Race.TrainerJockeySheetOrder'
      Size = 50
    end
    object tblRacesLoopErlPaceSheetOrder: TStringField
      FieldName = 'ErlPaceSheetOrder'
      Origin = 'Race.ErlPaceSheetOrder'
      Size = 50
    end
    object tblRacesLoopMidPaceSheetOrder: TStringField
      FieldName = 'MidPaceSheetOrder'
      Origin = 'Race.MidPaceSheetOrder'
      Size = 50
    end
    object tblRacesLoopLatePaceSheetOrder: TStringField
      FieldName = 'LatePaceSheetOrder'
      Origin = 'Race.LatePaceSheetOrder'
      Size = 50
    end
    object tblRacesLoopErlPacePosSheetOrder: TStringField
      FieldName = 'ErlPacePosSheetOrder'
      Origin = 'Race.ErlPacePosSheetOrder'
      Size = 50
    end
    object tblRacesLoopMidPacePosSheetOrder: TStringField
      FieldName = 'MidPacePosSheetOrder'
      Origin = 'Race.MidPacePosSheetOrder'
      Size = 50
    end
    object tblRacesLoopLatePacePosSheetOrder: TStringField
      FieldName = 'LatePacePosSheetOrder'
      Origin = 'Race.LatePacePosSheetOrder'
      Size = 50
    end
    object tblRacesLoopPacificTime: TStringField
      FieldName = 'PacificTime'
      Origin = 'Race.PacificTime'
      Size = 50
    end
    object tblRacesLoopPowerGapOrder: TStringField
      FieldName = 'PowerGapOrder'
      Origin = 'Race.PowerGapOrder'
      Size = 100
    end
    object tblRacesLoopErlPaceGapOrder: TStringField
      FieldName = 'ErlPaceGapOrder'
      Origin = 'Race.ErlPaceGapOrder'
      Size = 100
    end
    object tblRacesLoopMidPaceGapOrder: TStringField
      FieldName = 'MidPaceGapOrder'
      Origin = 'Race.MidPaceGapOrder'
      Size = 100
    end
    object tblRacesLoopLatePaceGapOrder: TStringField
      FieldName = 'LatePaceGapOrder'
      Origin = 'Race.LatePaceGapOrder'
      Size = 100
    end
    object tblRacesLoopErlPacePosGapOrder: TStringField
      FieldName = 'ErlPacePosGapOrder'
      Origin = 'Race.ErlPacePosGapOrder'
      Size = 100
    end
    object tblRacesLoopMidPacePosGapOrder: TStringField
      FieldName = 'MidPacePosGapOrder'
      Origin = 'Race.MidPacePosGapOrder'
      Size = 100
    end
    object tblRacesLoopLatePacePosGapOrder: TStringField
      FieldName = 'LatePacePosGapOrder'
      Origin = 'Race.LatePacePosGapOrder'
      Size = 100
    end
    object tblRacesLoopEarlyPacePar: TIntegerField
      FieldName = 'EarlyPacePar'
      Origin = 'Race.EarlyPacePar'
    end
    object tblRacesLoopMiddlePacePar: TIntegerField
      FieldName = 'MiddlePacePar'
      Origin = 'Race.MiddlePacePar'
    end
    object tblRacesLoopLatePacePar: TIntegerField
      FieldName = 'LatePacePar'
      Origin = 'Race.LatePacePar'
    end
    object tblRacesLoopSpeedPacePar: TIntegerField
      FieldName = 'SpeedPacePar'
      Origin = 'Race.SpeedPacePar'
    end
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
    IndexName = 'ByTodaysWagerWinPctRank'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'ENTRY.DAT'
    Left = 112
    Top = 106
    object tblEntriesTrkCode: TStringField
      FieldName = 'TrkCode'
      Origin = 'ENTRY.TrkCode'
      Required = True
      Size = 3
    end
    object tblEntriesRaceDate: TDateField
      FieldName = 'RaceDate'
      Origin = 'ENTRY.RaceDate'
      Required = True
    end
    object tblEntriesRangeRaceDate: TDateField
      FieldName = 'RangeRaceDate'
      Origin = 'ENTRY.RangeRaceDate'
    end
    object tblEntriesRaceNbr: TSmallintField
      FieldName = 'RaceNbr'
      Origin = 'ENTRY.RaceNbr'
      Required = True
    end
    object tblEntriesPostPos: TSmallintField
      FieldName = 'PostPos'
      Origin = 'ENTRY.PostPos'
      Required = True
    end
    object tblEntriesRaceType: TStringField
      FieldName = 'RaceType'
      Origin = 'ENTRY.RaceType'
      Size = 4
    end
    object tblEntriesSurface: TStringField
      FieldName = 'Surface'
      Origin = 'ENTRY.Surface'
      Size = 1
    end
    object tblEntriesEstTimeOfRace: TTimeField
      FieldName = 'EstTimeOfRace'
      Origin = 'ENTRY.EstTimeOfRace'
    end
    object tblEntriesDistanceInFurlongs: TFloatField
      FieldName = 'DistanceInFurlongs'
      Origin = 'ENTRY.DistanceInFurlongs'
    end
    object tblEntriesEntry: TStringField
      FieldName = 'Entry'
      Origin = 'ENTRY.Entry'
      Size = 5
    end
    object tblEntriesProgramNbr: TStringField
      FieldName = 'ProgramNbr'
      Origin = 'ENTRY.ProgramNbr'
      Size = 10
    end
    object tblEntriesProgramNbrSort: TSmallintField
      FieldName = 'ProgramNbrSort'
      Origin = 'ENTRY.ProgramNbrSort'
    end
    object tblEntriesMorningLineDesc: TStringField
      FieldName = 'MorningLineDesc'
      Origin = 'ENTRY.MorningLineDesc'
      Size = 15
    end
    object tblEntriesHorseName: TStringField
      FieldName = 'HorseName'
      Origin = 'ENTRY.HorseName'
      Size = 25
    end
    object tblEntriesMed: TStringField
      FieldName = 'Med'
      Origin = 'ENTRY.Med'
      Size = 5
    end
    object tblEntriesEquip: TStringField
      FieldName = 'Equip'
      Origin = 'ENTRY.Equip'
      Size = 6
    end
    object tblEntriesIsFirstTimeJuice: TBooleanField
      FieldName = 'IsFirstTimeJuice'
      Origin = 'ENTRY.IsFirstTimeJuice'
    end
    object tblEntriesIsBlinkersOn: TBooleanField
      FieldName = 'IsBlinkersOn'
      Origin = 'ENTRY.IsBlinkersOn'
    end
    object tblEntriesIsBlinkersOff: TBooleanField
      FieldName = 'IsBlinkersOff'
      Origin = 'ENTRY.IsBlinkersOff'
    end
    object tblEntriesTurfIndicator: TStringField
      FieldName = 'TurfIndicator'
      Origin = 'ENTRY.TurfIndicator'
      Size = 2
    end
    object tblEntriesDebutIndicator: TStringField
      FieldName = 'DebutIndicator'
      Origin = 'ENTRY.DebutIndicator'
      Size = 2
    end
    object tblEntriesRouteIndicator: TStringField
      FieldName = 'RouteIndicator'
      Origin = 'ENTRY.RouteIndicator'
      Size = 2
    end
    object tblEntriesMudIndicator: TStringField
      FieldName = 'MudIndicator'
      Origin = 'ENTRY.MudIndicator'
      Size = 2
    end
    object tblEntriesIsScratched: TBooleanField
      FieldName = 'IsScratched'
      Origin = 'ENTRY.IsScratched'
    end
    object tblEntriesAge: TSmallintField
      FieldName = 'Age'
      Origin = 'ENTRY.Age'
    end
    object tblEntriesSex: TStringField
      FieldName = 'Sex'
      Origin = 'ENTRY.Sex'
      Size = 3
    end
    object tblEntriesColor: TStringField
      FieldName = 'Color'
      Origin = 'ENTRY.Color'
      Size = 10
    end
    object tblEntriesWeight: TStringField
      FieldName = 'Weight'
      Origin = 'ENTRY.Weight'
      Size = 10
    end
    object tblEntriesIsSuperTrainer: TBooleanField
      FieldName = 'IsSuperTrainer'
      Origin = 'ENTRY.IsSuperTrainer'
    end
    object tblEntriesTrainer: TStringField
      FieldName = 'Trainer'
      Origin = 'ENTRY.Trainer'
      Size = 30
    end
    object tblEntriesTrnWinsRank: TSmallintField
      FieldName = 'TrnWinsRank'
      Origin = 'ENTRY.TrnWinsRank'
    end
    object tblEntriesTrnEarningsRank: TSmallintField
      FieldName = 'TrnEarningsRank'
      Origin = 'ENTRY.TrnEarningsRank'
    end
    object tblEntriesTrnTrackRank: TSmallintField
      FieldName = 'TrnTrackRank'
      Origin = 'ENTRY.TrnTrackRank'
    end
    object tblEntriesIsSuperJockey: TBooleanField
      FieldName = 'IsSuperJockey'
      Origin = 'ENTRY.IsSuperJockey'
    end
    object tblEntriesJockey: TStringField
      FieldName = 'Jockey'
      Origin = 'ENTRY.Jockey'
      Size = 25
    end
    object tblEntriesJkyWinsRank: TSmallintField
      FieldName = 'JkyWinsRank'
      Origin = 'ENTRY.JkyWinsRank'
    end
    object tblEntriesJkyEarningsRank: TSmallintField
      FieldName = 'JkyEarningsRank'
      Origin = 'ENTRY.JkyEarningsRank'
    end
    object tblEntriesJkyTrackRank: TSmallintField
      FieldName = 'JkyTrackRank'
      Origin = 'ENTRY.JkyTrackRank'
    end
    object tblEntriesIsSuperOwner: TBooleanField
      FieldName = 'IsSuperOwner'
      Origin = 'ENTRY.IsSuperOwner'
    end
    object tblEntriesOwner: TStringField
      FieldName = 'Owner'
      Origin = 'ENTRY.Owner'
      Size = 45
    end
    object tblEntriesOwnWinsRank: TSmallintField
      FieldName = 'OwnWinsRank'
      Origin = 'ENTRY.OwnWinsRank'
    end
    object tblEntriesOwnEarningsRank: TSmallintField
      FieldName = 'OwnEarningsRank'
      Origin = 'ENTRY.OwnEarningsRank'
    end
    object tblEntriesBreeder: TStringField
      FieldName = 'Breeder'
      Origin = 'ENTRY.Breeder'
      Size = 67
    end
    object tblEntriesTotalTrnStarts: TSmallintField
      FieldName = 'TotalTrnStarts'
      Origin = 'ENTRY.TotalTrnStarts'
    end
    object tblEntriesTotalTrnWins: TSmallintField
      FieldName = 'TotalTrnWins'
      Origin = 'ENTRY.TotalTrnWins'
    end
    object tblEntriesTotalTrnWinPct: TFloatField
      FieldName = 'TotalTrnWinPct'
      Origin = 'ENTRY.TotalTrnWinPct'
    end
    object tblEntriesTotalTrnWinPctRank: TSmallintField
      FieldName = 'TotalTrnWinPctRank'
      Origin = 'ENTRY.TotalTrnWinPctRank'
    end
    object tblEntriesTotalTrnJkyStarts: TSmallintField
      FieldName = 'TotalTrnJkyStarts'
      Origin = 'ENTRY.TotalTrnJkyStarts'
    end
    object tblEntriesTotalTrnJkyWins: TSmallintField
      FieldName = 'TotalTrnJkyWins'
      Origin = 'ENTRY.TotalTrnJkyWins'
    end
    object tblEntriesTotalTrnJkyWinPct: TFloatField
      FieldName = 'TotalTrnJkyWinPct'
      Origin = 'ENTRY.TotalTrnJkyWinPct'
    end
    object tblEntriesTotalTrnJkyWinPctRank: TSmallintField
      FieldName = 'TotalTrnJkyWinPctRank'
      Origin = 'ENTRY.TotalTrnJkyWinPctRank'
    end
    object tblEntriesTotalTrnOwnStarts: TSmallintField
      FieldName = 'TotalTrnOwnStarts'
      Origin = 'ENTRY.TotalTrnOwnStarts'
    end
    object tblEntriesTotalTrnOwnWins: TSmallintField
      FieldName = 'TotalTrnOwnWins'
      Origin = 'ENTRY.TotalTrnOwnWins'
    end
    object tblEntriesTotalTrnOwnWinPct: TFloatField
      FieldName = 'TotalTrnOwnWinPct'
      Origin = 'ENTRY.TotalTrnOwnWinPct'
    end
    object tblEntriesTotalTrnOwnWinPctRank: TSmallintField
      FieldName = 'TotalTrnOwnWinPctRank'
      Origin = 'ENTRY.TotalTrnOwnWinPctRank'
    end
    object tblEntriesTotalTrn1To45Starts: TSmallintField
      FieldName = 'TotalTrn1To45Starts'
      Origin = 'ENTRY.TotalTrn1To45Starts'
    end
    object tblEntriesTotalTrn1To45Wins: TSmallintField
      FieldName = 'TotalTrn1To45Wins'
      Origin = 'ENTRY.TotalTrn1To45Wins'
    end
    object tblEntriesTotalTrn1To45WinPct: TFloatField
      FieldName = 'TotalTrn1To45WinPct'
      Origin = 'ENTRY.TotalTrn1To45WinPct'
    end
    object tblEntriesTotalTrnWork1To45Starts: TSmallintField
      FieldName = 'TotalTrnWork1To45Starts'
      Origin = 'ENTRY.TotalTrnWork1To45Starts'
    end
    object tblEntriesTotalTrnWork1To45Wins: TSmallintField
      FieldName = 'TotalTrnWork1To45Wins'
      Origin = 'ENTRY.TotalTrnWork1To45Wins'
    end
    object tblEntriesTotalTrnWork1To45WinPct: TFloatField
      FieldName = 'TotalTrnWork1To45WinPct'
      Origin = 'ENTRY.TotalTrnWork1To45WinPct'
    end
    object tblEntriesTotalTrn46To120Starts: TSmallintField
      FieldName = 'TotalTrn46To120Starts'
      Origin = 'ENTRY.TotalTrn46To120Starts'
    end
    object tblEntriesTotalTrn46To120Wins: TSmallintField
      FieldName = 'TotalTrn46To120Wins'
      Origin = 'ENTRY.TotalTrn46To120Wins'
    end
    object tblEntriesTotalTrn46To120WinPct: TFloatField
      FieldName = 'TotalTrn46To120WinPct'
      Origin = 'ENTRY.TotalTrn46To120WinPct'
    end
    object tblEntriesTotalTrnWork46To120Starts: TSmallintField
      FieldName = 'TotalTrnWork46To120Starts'
      Origin = 'ENTRY.TotalTrnWork46To120Starts'
    end
    object tblEntriesTotalTrnWork46To120Wins: TSmallintField
      FieldName = 'TotalTrnWork46To120Wins'
      Origin = 'ENTRY.TotalTrnWork46To120Wins'
    end
    object tblEntriesTotalTrnWork46To120WinPct: TFloatField
      FieldName = 'TotalTrnWork46To120WinPct'
      Origin = 'ENTRY.TotalTrnWork46To120WinPct'
    end
    object tblEntriesTotalTrn120PlusStarts: TSmallintField
      FieldName = 'TotalTrn120PlusStarts'
      Origin = 'ENTRY.TotalTrn120PlusStarts'
    end
    object tblEntriesTotalTrn120PlusWins: TSmallintField
      FieldName = 'TotalTrn120PlusWins'
      Origin = 'ENTRY.TotalTrn120PlusWins'
    end
    object tblEntriesTotalTrn120PlusWinPct: TFloatField
      FieldName = 'TotalTrn120PlusWinPct'
      Origin = 'ENTRY.TotalTrn120PlusWinPct'
    end
    object tblEntriesTotalTrnWork120PlusStarts: TSmallintField
      FieldName = 'TotalTrnWork120PlusStarts'
      Origin = 'ENTRY.TotalTrnWork120PlusStarts'
    end
    object tblEntriesTotalTrnWork120PlusWins: TSmallintField
      FieldName = 'TotalTrnWork120PlusWins'
      Origin = 'ENTRY.TotalTrnWork120PlusWins'
    end
    object tblEntriesTotalTrnWork120PlusWinPct: TFloatField
      FieldName = 'TotalTrnWork120PlusWinPct'
      Origin = 'ENTRY.TotalTrnWork120PlusWinPct'
    end
    object tblEntriesTotalTrnDebutStarts: TSmallintField
      FieldName = 'TotalTrnDebutStarts'
      Origin = 'ENTRY.TotalTrnDebutStarts'
    end
    object tblEntriesTotalTrnDebutWins: TSmallintField
      FieldName = 'TotalTrnDebutWins'
      Origin = 'ENTRY.TotalTrnDebutWins'
    end
    object tblEntriesTotalTrnDebutWinPct: TFloatField
      FieldName = 'TotalTrnDebutWinPct'
      Origin = 'ENTRY.TotalTrnDebutWinPct'
    end
    object tblEntriesTotalTrnDebutTwoStarts: TSmallintField
      FieldName = 'TotalTrnDebutTwoStarts'
      Origin = 'ENTRY.TotalTrnDebutTwoStarts'
    end
    object tblEntriesTotalTrnDebutTwoWins: TSmallintField
      FieldName = 'TotalTrnDebutTwoWins'
      Origin = 'ENTRY.TotalTrnDebutTwoWins'
    end
    object tblEntriesTotalTrnDebutTwoWinPct: TFloatField
      FieldName = 'TotalTrnDebutTwoWinPct'
      Origin = 'ENTRY.TotalTrnDebutTwoWinPct'
    end
    object tblEntriesTotalTrnFirstJuiceStarts: TSmallintField
      FieldName = 'TotalTrnFirstJuiceStarts'
      Origin = 'ENTRY.TotalTrnFirstJuiceStarts'
    end
    object tblEntriesTotalTrnFirstJuiceWins: TSmallintField
      FieldName = 'TotalTrnFirstJuiceWins'
      Origin = 'ENTRY.TotalTrnFirstJuiceWins'
    end
    object tblEntriesTotalTrnFirstJuiceWinPct: TFloatField
      FieldName = 'TotalTrnFirstJuiceWinPct'
      Origin = 'ENTRY.TotalTrnFirstJuiceWinPct'
    end
    object tblEntriesTotalTrnBlinkersOnStarts: TSmallintField
      FieldName = 'TotalTrnBlinkersOnStarts'
      Origin = 'ENTRY.TotalTrnBlinkersOnStarts'
    end
    object tblEntriesTotalTrnBlinkersOnWins: TSmallintField
      FieldName = 'TotalTrnBlinkersOnWins'
      Origin = 'ENTRY.TotalTrnBlinkersOnWins'
    end
    object tblEntriesTotalTrnBlinkersOnWinPct: TFloatField
      FieldName = 'TotalTrnBlinkersOnWinPct'
      Origin = 'ENTRY.TotalTrnBlinkersOnWinPct'
    end
    object tblEntriesTotalTrnBlinkersOffStarts: TSmallintField
      FieldName = 'TotalTrnBlinkersOffStarts'
      Origin = 'ENTRY.TotalTrnBlinkersOffStarts'
    end
    object tblEntriesTotalTrnBlinkersOffWins: TSmallintField
      FieldName = 'TotalTrnBlinkersOffWins'
      Origin = 'ENTRY.TotalTrnBlinkersOffWins'
    end
    object tblEntriesTotalTrnBlinkersOffWinPct: TFloatField
      FieldName = 'TotalTrnBlinkersOffWinPct'
      Origin = 'ENTRY.TotalTrnBlinkersOffWinPct'
    end
    object tblEntriesTotalTrnTurfStarts: TSmallintField
      FieldName = 'TotalTrnTurfStarts'
      Origin = 'ENTRY.TotalTrnTurfStarts'
    end
    object tblEntriesTotalTrnTurfWins: TSmallintField
      FieldName = 'TotalTrnTurfWins'
      Origin = 'ENTRY.TotalTrnTurfWins'
    end
    object tblEntriesTotalTrnTurfWinPct: TFloatField
      FieldName = 'TotalTrnTurfWinPct'
      Origin = 'ENTRY.TotalTrnTurfWinPct'
    end
    object tblEntriesTotalTrnTurfWinPctRank: TSmallintField
      FieldName = 'TotalTrnTurfWinPctRank'
      Origin = 'ENTRY.TotalTrnTurfWinPctRank'
    end
    object tblEntriesTotalTrn30Starts: TSmallintField
      FieldName = 'TotalTrn30Starts'
      Origin = 'ENTRY.TotalTrn30Starts'
    end
    object tblEntriesTotalTrn30Wins: TSmallintField
      FieldName = 'TotalTrn30Wins'
      Origin = 'ENTRY.TotalTrn30Wins'
    end
    object tblEntriesTotalTrn30WinPct: TFloatField
      FieldName = 'TotalTrn30WinPct'
      Origin = 'ENTRY.TotalTrn30WinPct'
    end
    object tblEntriesTotalTrn30WinPctRank: TSmallintField
      FieldName = 'TotalTrn30WinPctRank'
      Origin = 'ENTRY.TotalTrn30WinPctRank'
    end
    object tblEntriesTotalTrnAftClmStarts: TSmallintField
      FieldName = 'TotalTrnAftClmStarts'
      Origin = 'ENTRY.TotalTrnAftClmStarts'
    end
    object tblEntriesTotalTrnAftClmWins: TSmallintField
      FieldName = 'TotalTrnAftClmWins'
      Origin = 'ENTRY.TotalTrnAftClmWins'
    end
    object tblEntriesTotalTrnAftClmWinPct: TFloatField
      FieldName = 'TotalTrnAftClmWinPct'
      Origin = 'ENTRY.TotalTrnAftClmWinPct'
    end
    object tblEntriesTotalTrnOddsStarts: TSmallintField
      FieldName = 'TotalTrnOddsStarts'
      Origin = 'ENTRY.TotalTrnOddsStarts'
    end
    object tblEntriesTotalTrnOddsWins: TSmallintField
      FieldName = 'TotalTrnOddsWins'
      Origin = 'ENTRY.TotalTrnOddsWins'
    end
    object tblEntriesTotalTrnOddsWinPct: TFloatField
      FieldName = 'TotalTrnOddsWinPct'
      Origin = 'ENTRY.TotalTrnOddsWinPct'
    end
    object tblEntriesTotalTrnOddsWinPctRank: TSmallintField
      FieldName = 'TotalTrnOddsWinPctRank'
      Origin = 'ENTRY.TotalTrnOddsWinPctRank'
    end
    object tblEntriesTotalTrn1stStarts: TSmallintField
      FieldName = 'TotalTrn1stStarts'
      Origin = 'ENTRY.TotalTrn1stStarts'
    end
    object tblEntriesTotalTrn1stWins: TSmallintField
      FieldName = 'TotalTrn1stWins'
      Origin = 'ENTRY.TotalTrn1stWins'
    end
    object tblEntriesTotalTrn1stWinPct: TFloatField
      FieldName = 'TotalTrn1stWinPct'
      Origin = 'ENTRY.TotalTrn1stWinPct'
    end
    object tblEntriesTotalTrn2yoStarts: TSmallintField
      FieldName = 'TotalTrn2yoStarts'
      Origin = 'ENTRY.TotalTrn2yoStarts'
    end
    object tblEntriesTotalTrn2yoWins: TSmallintField
      FieldName = 'TotalTrn2yoWins'
      Origin = 'ENTRY.TotalTrn2yoWins'
    end
    object tblEntriesTotalTrn2yoWinPct: TFloatField
      FieldName = 'TotalTrn2yoWinPct'
      Origin = 'ENTRY.TotalTrn2yoWinPct'
    end
    object tblEntriesTotalTrn2oWinPctRank: TSmallintField
      FieldName = 'TotalTrn2oWinPctRank'
      Origin = 'ENTRY.TotalTrn2oWinPctRank'
    end
    object tblEntriesTrnTodayStarts: TSmallintField
      FieldName = 'TrnTodayStarts'
      Origin = 'ENTRY.TrnTodayStarts'
    end
    object tblEntriesTrnTodayWins: TSmallintField
      FieldName = 'TrnTodayWins'
      Origin = 'ENTRY.TrnTodayWins'
    end
    object tblEntriesTrnTodayWinPct: TFloatField
      FieldName = 'TrnTodayWinPct'
      Origin = 'ENTRY.TrnTodayWinPct'
    end
    object tblEntriesTrnTodayWinPctRank: TSmallintField
      FieldName = 'TrnTodayWinPctRank'
      Origin = 'ENTRY.TrnTodayWinPctRank'
    end
    object tblEntriesTrnDirtToTurfStarts: TSmallintField
      FieldName = 'TrnDirtToTurfStarts'
      Origin = 'ENTRY.TrnDirtToTurfStarts'
    end
    object tblEntriesTrnDirtToTurfWinPct: TSmallintField
      FieldName = 'TrnDirtToTurfWinPct'
      Origin = 'ENTRY.TrnDirtToTurfWinPct'
    end
    object tblEntriesTrnTurfToDirtStarts: TSmallintField
      FieldName = 'TrnTurfToDirtStarts'
      Origin = 'ENTRY.TrnTurfToDirtStarts'
    end
    object tblEntriesTrnTurfToDirtWinPct: TSmallintField
      FieldName = 'TrnTurfToDirtWinPct'
      Origin = 'ENTRY.TrnTurfToDirtWinPct'
    end
    object tblEntriesTrnRteToSprStarts: TSmallintField
      FieldName = 'TrnRteToSprStarts'
      Origin = 'ENTRY.TrnRteToSprStarts'
    end
    object tblEntriesTrnRteToSprWinPct: TSmallintField
      FieldName = 'TrnRteToSprWinPct'
      Origin = 'ENTRY.TrnRteToSprWinPct'
    end
    object tblEntriesTrnSprToRteStarts: TSmallintField
      FieldName = 'TrnSprToRteStarts'
      Origin = 'ENTRY.TrnSprToRteStarts'
    end
    object tblEntriesTrnSprToRteWinPct: TSmallintField
      FieldName = 'TrnSprToRteWinPct'
      Origin = 'ENTRY.TrnSprToRteWinPct'
    end
    object tblEntriesTrnStkWinPct: TSmallintField
      FieldName = 'TrnStkWinPct'
      Origin = 'ENTRY.TrnStkWinPct'
    end
    object tblEntriesTrnClmWinPct: TSmallintField
      FieldName = 'TrnClmWinPct'
      Origin = 'ENTRY.TrnClmWinPct'
    end
    object tblEntriesTrnMdnWinPct: TSmallintField
      FieldName = 'TrnMdnWinPct'
      Origin = 'ENTRY.TrnMdnWinPct'
    end
    object tblEntriesTrnAlwWinPct: TSmallintField
      FieldName = 'TrnAlwWinPct'
      Origin = 'ENTRY.TrnAlwWinPct'
    end
    object tblEntriesTotalJkyStarts: TSmallintField
      FieldName = 'TotalJkyStarts'
      Origin = 'ENTRY.TotalJkyStarts'
    end
    object tblEntriesTotalJkyWins: TSmallintField
      FieldName = 'TotalJkyWins'
      Origin = 'ENTRY.TotalJkyWins'
    end
    object tblEntriesTotalJkyWinPct: TFloatField
      FieldName = 'TotalJkyWinPct'
      Origin = 'ENTRY.TotalJkyWinPct'
    end
    object tblEntriesTotalJkyWinPctRank: TSmallintField
      FieldName = 'TotalJkyWinPctRank'
      Origin = 'ENTRY.TotalJkyWinPctRank'
    end
    object tblEntriesTotalJkyDaysStarts: TSmallintField
      FieldName = 'TotalJkyDaysStarts'
      Origin = 'ENTRY.TotalJkyDaysStarts'
    end
    object tblEntriesTotalJkyDaysWins: TSmallintField
      FieldName = 'TotalJkyDaysWins'
      Origin = 'ENTRY.TotalJkyDaysWins'
    end
    object tblEntriesTotalJkyDaysWinPctRank: TSmallintField
      FieldName = 'TotalJkyDaysWinPctRank'
      Origin = 'ENTRY.TotalJkyDaysWinPctRank'
    end
    object tblEntriesTotalJkyDaysWinPct: TFloatField
      FieldName = 'TotalJkyDaysWinPct'
      Origin = 'ENTRY.TotalJkyDaysWinPct'
    end
    object tblEntriesTotalJkyOddsStarts: TSmallintField
      FieldName = 'TotalJkyOddsStarts'
      Origin = 'ENTRY.TotalJkyOddsStarts'
    end
    object tblEntriesTotalJkyOddsWins: TSmallintField
      FieldName = 'TotalJkyOddsWins'
      Origin = 'ENTRY.TotalJkyOddsWins'
    end
    object tblEntriesTotalJkyOddsWinPct: TFloatField
      FieldName = 'TotalJkyOddsWinPct'
      Origin = 'ENTRY.TotalJkyOddsWinPct'
    end
    object tblEntriesTotalJkyOddsWinPctRank: TSmallintField
      FieldName = 'TotalJkyOddsWinPctRank'
      Origin = 'ENTRY.TotalJkyOddsWinPctRank'
    end
    object tblEntriesTotalJkyTurfStarts: TSmallintField
      FieldName = 'TotalJkyTurfStarts'
      Origin = 'ENTRY.TotalJkyTurfStarts'
    end
    object tblEntriesTotalJkyTurfWins: TSmallintField
      FieldName = 'TotalJkyTurfWins'
      Origin = 'ENTRY.TotalJkyTurfWins'
    end
    object tblEntriesTotalJkyTurfWinPct: TFloatField
      FieldName = 'TotalJkyTurfWinPct'
      Origin = 'ENTRY.TotalJkyTurfWinPct'
    end
    object tblEntriesTotalJky10Starts: TSmallintField
      FieldName = 'TotalJky10Starts'
      Origin = 'ENTRY.TotalJky10Starts'
    end
    object tblEntriesTotalJky10Wins: TSmallintField
      FieldName = 'TotalJky10Wins'
      Origin = 'ENTRY.TotalJky10Wins'
    end
    object tblEntriesTotalJky10WinPct: TFloatField
      FieldName = 'TotalJky10WinPct'
      Origin = 'ENTRY.TotalJky10WinPct'
    end
    object tblEntriesTotalJky10WinPctRank: TSmallintField
      FieldName = 'TotalJky10WinPctRank'
      Origin = 'ENTRY.TotalJky10WinPctRank'
    end
    object tblEntriesTotalJky30Starts: TSmallintField
      FieldName = 'TotalJky30Starts'
      Origin = 'ENTRY.TotalJky30Starts'
    end
    object tblEntriesTotalJky30Wins: TSmallintField
      FieldName = 'TotalJky30Wins'
      Origin = 'ENTRY.TotalJky30Wins'
    end
    object tblEntriesTotalJky30WinPct: TFloatField
      FieldName = 'TotalJky30WinPct'
      Origin = 'ENTRY.TotalJky30WinPct'
    end
    object tblEntriesTotalJky30WinPctRank: TSmallintField
      FieldName = 'TotalJky30WinPctRank'
      Origin = 'ENTRY.TotalJky30WinPctRank'
    end
    object tblEntriesTotalJky2yoStarts: TSmallintField
      FieldName = 'TotalJky2yoStarts'
      Origin = 'ENTRY.TotalJky2yoStarts'
    end
    object tblEntriesTotalJky2yoWins: TSmallintField
      FieldName = 'TotalJky2yoWins'
      Origin = 'ENTRY.TotalJky2yoWins'
    end
    object tblEntriesTotalJky2yoWinPct: TFloatField
      FieldName = 'TotalJky2yoWinPct'
      Origin = 'ENTRY.TotalJky2yoWinPct'
    end
    object tblEntriesTotalOwnStarts: TSmallintField
      FieldName = 'TotalOwnStarts'
      Origin = 'ENTRY.TotalOwnStarts'
    end
    object tblEntriesTotalOwnWins: TSmallintField
      FieldName = 'TotalOwnWins'
      Origin = 'ENTRY.TotalOwnWins'
    end
    object tblEntriesTotalOwnWinPct: TFloatField
      FieldName = 'TotalOwnWinPct'
      Origin = 'ENTRY.TotalOwnWinPct'
    end
    object tblEntriesTotalOwnWinPctRank: TSmallintField
      FieldName = 'TotalOwnWinPctRank'
      Origin = 'ENTRY.TotalOwnWinPctRank'
    end
    object tblEntriesTotalOwnTop3WinPct: TSmallintField
      FieldName = 'TotalOwnTop3WinPct'
      Origin = 'ENTRY.TotalOwnTop3WinPct'
    end
    object tblEntriesTotalBrdStarts: TSmallintField
      FieldName = 'TotalBrdStarts'
      Origin = 'ENTRY.TotalBrdStarts'
    end
    object tblEntriesTotalBrdWins: TSmallintField
      FieldName = 'TotalBrdWins'
      Origin = 'ENTRY.TotalBrdWins'
    end
    object tblEntriesTotalBrdWinPct: TFloatField
      FieldName = 'TotalBrdWinPct'
      Origin = 'ENTRY.TotalBrdWinPct'
    end
    object tblEntriesTotalBrdWinPctRank: TSmallintField
      FieldName = 'TotalBrdWinPctRank'
      Origin = 'ENTRY.TotalBrdWinPctRank'
    end
    object tblEntriesBredIn: TStringField
      FieldName = 'BredIn'
      Origin = 'ENTRY.BredIn'
      Size = 6
    end
    object tblEntriesSire: TStringField
      FieldName = 'Sire'
      Origin = 'ENTRY.Sire'
      Size = 25
    end
    object tblEntriesSireTurfLastYearRank: TSmallintField
      FieldName = 'SireTurfLastYearRank'
      Origin = 'ENTRY.SireTurfLastYearRank'
    end
    object tblEntriesSireTurfLastYearStarts: TIntegerField
      FieldName = 'SireTurfLastYearStarts'
      Origin = 'ENTRY.SireTurfLastYearStarts'
    end
    object tblEntriesSireTurfLastYearPctOfEarnings: TSmallintField
      FieldName = 'SireTurfLastYearPctOfEarnings'
      Origin = 'ENTRY.SireTurfLastYearPctOfEarnings'
    end
    object tblEntriesSireGeneralLastYearRank: TSmallintField
      FieldName = 'SireGeneralLastYearRank'
      Origin = 'ENTRY.SireGeneralLastYearRank'
    end
    object tblEntriesSireGeneralLastYearStudFee: TFloatField
      FieldName = 'SireGeneralLastYearStudFee'
      Origin = 'ENTRY.SireGeneralLastYearStudFee'
    end
    object tblEntriesSireJuvenileLastYearRank: TSmallintField
      FieldName = 'SireJuvenileLastYearRank'
      Origin = 'ENTRY.SireJuvenileLastYearRank'
    end
    object tblEntriesSireJuvenileThisYearRank: TSmallintField
      FieldName = 'SireJuvenileThisYearRank'
      Origin = 'ENTRY.SireJuvenileThisYearRank'
    end
    object tblEntriesSireTurfThisYearRank: TSmallintField
      FieldName = 'SireTurfThisYearRank'
      Origin = 'ENTRY.SireTurfThisYearRank'
    end
    object tblEntriesSireTurfThisYearStarts: TIntegerField
      FieldName = 'SireTurfThisYearStarts'
      Origin = 'ENTRY.SireTurfThisYearStarts'
    end
    object tblEntriesSireTurfThisYearPctOfEarnings: TSmallintField
      FieldName = 'SireTurfThisYearPctOfEarnings'
      Origin = 'ENTRY.SireTurfThisYearPctOfEarnings'
    end
    object tblEntriesSireGeneralThisYearRank: TSmallintField
      FieldName = 'SireGeneralThisYearRank'
      Origin = 'ENTRY.SireGeneralThisYearRank'
    end
    object tblEntriesSireGeneralThisYearStudFee: TFloatField
      FieldName = 'SireGeneralThisYearStudFee'
      Origin = 'ENTRY.SireGeneralThisYearStudFee'
    end
    object tblEntriesSireAEI: TFloatField
      FieldName = 'SireAEI'
      Origin = 'ENTRY.SireAEI'
    end
    object tblEntriesSireAWThisYearRank: TSmallintField
      FieldName = 'SireAWThisYearRank'
      Origin = 'ENTRY.SireAWThisYearRank'
    end
    object tblEntriesSireAWLastYearRank: TSmallintField
      FieldName = 'SireAWLastYearRank'
      Origin = 'ENTRY.SireAWLastYearRank'
    end
    object tblEntriesDam: TStringField
      FieldName = 'Dam'
      Origin = 'ENTRY.Dam'
      Size = 25
    end
    object tblEntriesDamSire: TStringField
      FieldName = 'DamSire'
      Origin = 'ENTRY.DamSire'
      Size = 25
    end
    object tblEntriesDamSireTurfLastYearRank: TSmallintField
      FieldName = 'DamSireTurfLastYearRank'
      Origin = 'ENTRY.DamSireTurfLastYearRank'
    end
    object tblEntriesDamSireTurfLastYearStarts: TIntegerField
      FieldName = 'DamSireTurfLastYearStarts'
      Origin = 'ENTRY.DamSireTurfLastYearStarts'
    end
    object tblEntriesDamSireTurfLastYearPctOfEarnings: TSmallintField
      FieldName = 'DamSireTurfLastYearPctOfEarnings'
      Origin = 'ENTRY.DamSireTurfLastYearPctOfEarnings'
    end
    object tblEntriesDamSireGeneralLastYearRank: TSmallintField
      FieldName = 'DamSireGeneralLastYearRank'
      Origin = 'ENTRY.DamSireGeneralLastYearRank'
    end
    object tblEntriesDamSireGeneralLastYearStudFee: TFloatField
      FieldName = 'DamSireGeneralLastYearStudFee'
      Origin = 'ENTRY.DamSireGeneralLastYearStudFee'
    end
    object tblEntriesDamSireJuvenileLastYearRank: TSmallintField
      FieldName = 'DamSireJuvenileLastYearRank'
      Origin = 'ENTRY.DamSireJuvenileLastYearRank'
    end
    object tblEntriesDamSireJuvenileThisYearRank: TSmallintField
      FieldName = 'DamSireJuvenileThisYearRank'
      Origin = 'ENTRY.DamSireJuvenileThisYearRank'
    end
    object tblEntriesDamSireTurfThisYearRank: TSmallintField
      FieldName = 'DamSireTurfThisYearRank'
      Origin = 'ENTRY.DamSireTurfThisYearRank'
    end
    object tblEntriesDamSireTurfThisYearStarts: TIntegerField
      FieldName = 'DamSireTurfThisYearStarts'
      Origin = 'ENTRY.DamSireTurfThisYearStarts'
    end
    object tblEntriesDamSireTurfThisYearPctOfEarnings: TSmallintField
      FieldName = 'DamSireTurfThisYearPctOfEarnings'
      Origin = 'ENTRY.DamSireTurfThisYearPctOfEarnings'
    end
    object tblEntriesDamSireGeneralThisYearRank: TSmallintField
      FieldName = 'DamSireGeneralThisYearRank'
      Origin = 'ENTRY.DamSireGeneralThisYearRank'
    end
    object tblEntriesDamSireGeneralThisYearStudFee: TFloatField
      FieldName = 'DamSireGeneralThisYearStudFee'
      Origin = 'ENTRY.DamSireGeneralThisYearStudFee'
    end
    object tblEntriesDamSireAEI: TFloatField
      FieldName = 'DamSireAEI'
      Origin = 'ENTRY.DamSireAEI'
    end
    object tblEntriesDamSireAWThisYearRank: TSmallintField
      FieldName = 'DamSireAWThisYearRank'
      Origin = 'ENTRY.DamSireAWThisYearRank'
    end
    object tblEntriesDamSireAWLastYearRank: TSmallintField
      FieldName = 'DamSireAWLastYearRank'
      Origin = 'ENTRY.DamSireAWLastYearRank'
    end
    object tblEntriesDaysLast: TSmallintField
      FieldName = 'DaysLast'
      Origin = 'ENTRY.DaysLast'
    end
    object tblEntriesDaysLastWork: TSmallintField
      FieldName = 'DaysLastWork'
      Origin = 'ENTRY.DaysLastWork'
    end
    object tblEntriesLastTrkCode: TStringField
      FieldName = 'LastTrkCode'
      Origin = 'ENTRY.LastTrkCode'
      Size = 3
    end
    object tblEntriesLastRaceNbr: TIntegerField
      FieldName = 'LastRaceNbr'
      Origin = 'ENTRY.LastRaceNbr'
    end
    object tblEntriesLastRaceDate: TDateField
      FieldName = 'LastRaceDate'
      Origin = 'ENTRY.LastRaceDate'
    end
    object tblEntriesLastPostPos: TSmallintField
      FieldName = 'LastPostPos'
      Origin = 'ENTRY.LastPostPos'
    end
    object tblEntriesLastRaceType: TStringField
      FieldName = 'LastRaceType'
      Origin = 'ENTRY.LastRaceType'
      Size = 6
    end
    object tblEntriesLastSurf: TStringField
      FieldName = 'LastSurf'
      Origin = 'ENTRY.LastSurf'
      Size = 1
    end
    object tblEntriesLastRaceConditions: TStringField
      FieldName = 'LastRaceConditions'
      Origin = 'ENTRY.LastRaceConditions'
    end
    object tblEntriesLastDistanceDesc: TStringField
      FieldName = 'LastDistanceDesc'
      Origin = 'ENTRY.LastDistanceDesc'
      Size = 16
    end
    object tblEntriesLastDistance: TFloatField
      FieldName = 'LastDistance'
      Origin = 'ENTRY.LastDistance'
    end
    object tblEntriesLastOdds: TFloatField
      FieldName = 'LastOdds'
      Origin = 'ENTRY.LastOdds'
    end
    object tblEntriesLastFavoriteIndicator: TStringField
      FieldName = 'LastFavoriteIndicator'
      Origin = 'ENTRY.LastFavoriteIndicator'
      Size = 1
    end
    object tblEntriesLastDQIndicator: TStringField
      FieldName = 'LastDQIndicator'
      Origin = 'ENTRY.LastDQIndicator'
      Size = 2
    end
    object tblEntriesLastJockey: TStringField
      FieldName = 'LastJockey'
      Origin = 'ENTRY.LastJockey'
      Size = 15
    end
    object tblEntriesLastComment: TStringField
      FieldName = 'LastComment'
      Origin = 'ENTRY.LastComment'
      Size = 100
    end
    object tblEntriesLastComment2: TStringField
      FieldName = 'LastComment2'
      Origin = 'ENTRY.LastComment2'
      Size = 200
    end
    object tblEntriesLastTrkCond: TStringField
      FieldName = 'LastTrkCond'
      Origin = 'ENTRY.LastTrkCond'
      Size = 3
    end
    object tblEntriesLastClmPrice: TFloatField
      FieldName = 'LastClmPrice'
      Origin = 'ENTRY.LastClmPrice'
    end
    object tblEntriesLastClaimed: TStringField
      FieldName = 'LastClaimed'
      Origin = 'ENTRY.LastClaimed'
      Size = 1
    end
    object tblEntriesLastPurse: TFloatField
      FieldName = 'LastPurse'
      Origin = 'ENTRY.LastPurse'
    end
    object tblEntriesLastDay: TStringField
      FieldName = 'LastDay'
      Origin = 'ENTRY.LastDay'
      Size = 2
    end
    object tblEntriesLastMonthDesc: TStringField
      FieldName = 'LastMonthDesc'
      Origin = 'ENTRY.LastMonthDesc'
      Size = 3
    end
    object tblEntriesLastYear: TStringField
      FieldName = 'LastYear'
      Origin = 'ENTRY.LastYear'
      Size = 4
    end
    object tblEntriesLastGateBreak: TStringField
      FieldName = 'LastGateBreak'
      Origin = 'ENTRY.LastGateBreak'
      Size = 2
    end
    object tblEntriesLastLen1Back: TStringField
      FieldName = 'LastLen1Back'
      Origin = 'ENTRY.LastLen1Back'
      Size = 7
    end
    object tblEntriesLastLen2Back: TStringField
      FieldName = 'LastLen2Back'
      Origin = 'ENTRY.LastLen2Back'
      Size = 7
    end
    object tblEntriesLastStLenBack: TStringField
      FieldName = 'LastStLenBack'
      Origin = 'ENTRY.LastStLenBack'
      Size = 7
    end
    object tblEntriesLastFinishBeaten: TStringField
      FieldName = 'LastFinishBeaten'
      Origin = 'ENTRY.LastFinishBeaten'
      Size = 7
    end
    object tblEntriesLastEquip: TStringField
      FieldName = 'LastEquip'
      Origin = 'ENTRY.LastEquip'
      Size = 7
    end
    object tblEntriesLastWeight: TIntegerField
      FieldName = 'LastWeight'
      Origin = 'ENTRY.LastWeight'
    end
    object tblEntriesLastHorseTime: TFloatField
      FieldName = 'LastHorseTime'
      Origin = 'ENTRY.LastHorseTime'
    end
    object tblEntriesLastRaceDesc: TStringField
      FieldName = 'LastRaceDesc'
      Origin = 'ENTRY.LastRaceDesc'
      Size = 150
    end
    object tblEntriesMorningLineTo1: TFloatField
      FieldName = 'MorningLineTo1'
      Origin = 'ENTRY.MorningLineTo1'
    end
    object tblEntriesMorningLineTo1Rank: TSmallintField
      FieldName = 'MorningLineTo1Rank'
      Origin = 'ENTRY.MorningLineTo1Rank'
    end
    object tblEntriesIsDirtToTurf: TBooleanField
      FieldName = 'IsDirtToTurf'
      Origin = 'ENTRY.IsDirtToTurf'
    end
    object tblEntriesIsTurfToDirt: TBooleanField
      FieldName = 'IsTurfToDirt'
      Origin = 'ENTRY.IsTurfToDirt'
    end
    object tblEntriesIsSprToRte: TBooleanField
      FieldName = 'IsSprToRte'
      Origin = 'ENTRY.IsSprToRte'
    end
    object tblEntriesIsRteToSpr: TBooleanField
      FieldName = 'IsRteToSpr'
      Origin = 'ENTRY.IsRteToSpr'
    end
    object tblEntriesLastSpeed: TSmallintField
      FieldName = 'LastSpeed'
      Origin = 'ENTRY.LastSpeed'
    end
    object tblEntriesLastSpeedRank: TSmallintField
      FieldName = 'LastSpeedRank'
      Origin = 'ENTRY.LastSpeedRank'
    end
    object tblEntriesPower: TFloatField
      FieldName = 'Power'
      Origin = 'ENTRY.Power'
    end
    object tblEntriesPowerRank: TSmallintField
      FieldName = 'PowerRank'
      Origin = 'ENTRY.PowerRank'
    end
    object tblEntriesBackSpeed: TSmallintField
      FieldName = 'BackSpeed'
      Origin = 'ENTRY.BackSpeed'
    end
    object tblEntriesBackSpeedRank: TSmallintField
      FieldName = 'BackSpeedRank'
      Origin = 'ENTRY.BackSpeedRank'
    end
    object tblEntriesAvgClass: TFloatField
      FieldName = 'AvgClass'
      Origin = 'ENTRY.AvgClass'
    end
    object tblEntriesAvgClassRank: TSmallintField
      FieldName = 'AvgClassRank'
      Origin = 'ENTRY.AvgClassRank'
    end
    object tblEntriesAvgSpeed: TSmallintField
      FieldName = 'AvgSpeed'
      Origin = 'ENTRY.AvgSpeed'
    end
    object tblEntriesAvgSpeedRank: TSmallintField
      FieldName = 'AvgSpeedRank'
      Origin = 'ENTRY.AvgSpeedRank'
    end
    object tblEntriesAvgClassRating: TFloatField
      FieldName = 'AvgClassRating'
      Origin = 'ENTRY.AvgClassRating'
    end
    object tblEntriesAvgClassRatingRank: TSmallintField
      FieldName = 'AvgClassRatingRank'
      Origin = 'ENTRY.AvgClassRatingRank'
    end
    object tblEntriesBackClass: TFloatField
      FieldName = 'BackClass'
      Origin = 'ENTRY.BackClass'
    end
    object tblEntriesBackClassRank: TSmallintField
      FieldName = 'BackClassRank'
      Origin = 'ENTRY.BackClassRank'
    end
    object tblEntriesCurrClass: TFloatField
      FieldName = 'CurrClass'
      Origin = 'ENTRY.CurrClass'
    end
    object tblEntriesCurrClassRank: TSmallintField
      FieldName = 'CurrClassRank'
      Origin = 'ENTRY.CurrClassRank'
    end
    object tblEntriesEarlyPace: TFloatField
      FieldName = 'EarlyPace'
      Origin = 'ENTRY.EarlyPace'
    end
    object tblEntriesEarlyPaceRank: TSmallintField
      FieldName = 'EarlyPaceRank'
      Origin = 'ENTRY.EarlyPaceRank'
    end
    object tblEntriesEarlyPacePos: TFloatField
      FieldName = 'EarlyPacePos'
      Origin = 'ENTRY.EarlyPacePos'
    end
    object tblEntriesEarlyPacePosRank: TSmallintField
      FieldName = 'EarlyPacePosRank'
      Origin = 'ENTRY.EarlyPacePosRank'
    end
    object tblEntriesMiddlePace: TFloatField
      FieldName = 'MiddlePace'
      Origin = 'ENTRY.MiddlePace'
    end
    object tblEntriesMiddlePaceRank: TSmallintField
      FieldName = 'MiddlePaceRank'
      Origin = 'ENTRY.MiddlePaceRank'
    end
    object tblEntriesMiddlePacePos: TFloatField
      FieldName = 'MiddlePacePos'
      Origin = 'ENTRY.MiddlePacePos'
    end
    object tblEntriesMiddlePacePosRank: TSmallintField
      FieldName = 'MiddlePacePosRank'
      Origin = 'ENTRY.MiddlePacePosRank'
    end
    object tblEntriesLatePace: TFloatField
      FieldName = 'LatePace'
      Origin = 'ENTRY.LatePace'
    end
    object tblEntriesLatePaceRank: TSmallintField
      FieldName = 'LatePaceRank'
      Origin = 'ENTRY.LatePaceRank'
    end
    object tblEntriesLatePacePos: TFloatField
      FieldName = 'LatePacePos'
      Origin = 'ENTRY.LatePacePos'
    end
    object tblEntriesLatePacePosRank: TSmallintField
      FieldName = 'LatePacePosRank'
      Origin = 'ENTRY.LatePacePosRank'
    end
    object tblEntriesFinishPacePos: TFloatField
      FieldName = 'FinishPacePos'
      Origin = 'ENTRY.FinishPacePos'
    end
    object tblEntriesFinishPacePosRank: TSmallintField
      FieldName = 'FinishPacePosRank'
      Origin = 'ENTRY.FinishPacePosRank'
    end
    object tblEntriesEarlyPaceAdvantage: TFloatField
      FieldName = 'EarlyPaceAdvantage'
      Origin = 'ENTRY.EarlyPaceAdvantage'
    end
    object tblEntriesMiddlePaceAdvantage: TFloatField
      FieldName = 'MiddlePaceAdvantage'
      Origin = 'ENTRY.MiddlePaceAdvantage'
    end
    object tblEntriesLatePaceAdvantage: TFloatField
      FieldName = 'LatePaceAdvantage'
      Origin = 'ENTRY.LatePaceAdvantage'
    end
    object tblEntriesIsClaimed1Back: TBooleanField
      FieldName = 'IsClaimed1Back'
      Origin = 'ENTRY.IsClaimed1Back'
    end
    object tblEntriesIsClaimed2Back: TBooleanField
      FieldName = 'IsClaimed2Back'
      Origin = 'ENTRY.IsClaimed2Back'
    end
    object tblEntriesIsLayoffAndUp: TBooleanField
      FieldName = 'IsLayoffAndUp'
      Origin = 'ENTRY.IsLayoffAndUp'
    end
    object tblEntriesIsClaimedAndUp: TBooleanField
      FieldName = 'IsClaimedAndUp'
      Origin = 'ENTRY.IsClaimedAndUp'
    end
    object tblEntriesIsClaimedAndDown: TBooleanField
      FieldName = 'IsClaimedAndDown'
      Origin = 'ENTRY.IsClaimedAndDown'
    end
    object tblEntriesIsFirstTimeClaiming: TBooleanField
      FieldName = 'IsFirstTimeClaiming'
      Origin = 'ENTRY.IsFirstTimeClaiming'
    end
    object tblEntriesIsBelowClaimedPrice: TBooleanField
      FieldName = 'IsBelowClaimedPrice'
      Origin = 'ENTRY.IsBelowClaimedPrice'
    end
    object tblEntriesLifeStarts: TSmallintField
      FieldName = 'LifeStarts'
      Origin = 'ENTRY.LifeStarts'
    end
    object tblEntriesLifeWins: TSmallintField
      FieldName = 'LifeWins'
      Origin = 'ENTRY.LifeWins'
    end
    object tblEntriesLifePlcs: TSmallintField
      FieldName = 'LifePlcs'
      Origin = 'ENTRY.LifePlcs'
    end
    object tblEntriesLifeShos: TSmallintField
      FieldName = 'LifeShos'
      Origin = 'ENTRY.LifeShos'
    end
    object tblEntriesLifeEarnings: TIntegerField
      FieldName = 'LifeEarnings'
      Origin = 'ENTRY.LifeEarnings'
    end
    object tblEntriesLifeEPS: TIntegerField
      FieldName = 'LifeEPS'
      Origin = 'ENTRY.LifeEPS'
    end
    object tblEntriesTurfStarts: TSmallintField
      FieldName = 'TurfStarts'
      Origin = 'ENTRY.TurfStarts'
    end
    object tblEntriesTurfWins: TSmallintField
      FieldName = 'TurfWins'
      Origin = 'ENTRY.TurfWins'
    end
    object tblEntriesTurfPlcs: TSmallintField
      FieldName = 'TurfPlcs'
      Origin = 'ENTRY.TurfPlcs'
    end
    object tblEntriesTurfShos: TSmallintField
      FieldName = 'TurfShos'
      Origin = 'ENTRY.TurfShos'
    end
    object tblEntriesTurfEarnings: TIntegerField
      FieldName = 'TurfEarnings'
      Origin = 'ENTRY.TurfEarnings'
    end
    object tblEntriesTurfEPS: TIntegerField
      FieldName = 'TurfEPS'
      Origin = 'ENTRY.TurfEPS'
    end
    object tblEntriesMudStarts: TSmallintField
      FieldName = 'MudStarts'
      Origin = 'ENTRY.MudStarts'
    end
    object tblEntriesMudWins: TSmallintField
      FieldName = 'MudWins'
      Origin = 'ENTRY.MudWins'
    end
    object tblEntriesMudPlcs: TSmallintField
      FieldName = 'MudPlcs'
      Origin = 'ENTRY.MudPlcs'
    end
    object tblEntriesMudShos: TSmallintField
      FieldName = 'MudShos'
      Origin = 'ENTRY.MudShos'
    end
    object tblEntriesMudEarnings: TIntegerField
      FieldName = 'MudEarnings'
      Origin = 'ENTRY.MudEarnings'
    end
    object tblEntriesMudEPS: TIntegerField
      FieldName = 'MudEPS'
      Origin = 'ENTRY.MudEPS'
    end
    object tblEntriesTrkStarts: TSmallintField
      FieldName = 'TrkStarts'
      Origin = 'ENTRY.TrkStarts'
    end
    object tblEntriesTrkWins: TSmallintField
      FieldName = 'TrkWins'
      Origin = 'ENTRY.TrkWins'
    end
    object tblEntriesTrkPlcs: TSmallintField
      FieldName = 'TrkPlcs'
      Origin = 'ENTRY.TrkPlcs'
    end
    object tblEntriesTrkShos: TSmallintField
      FieldName = 'TrkShos'
      Origin = 'ENTRY.TrkShos'
    end
    object tblEntriesTrkEarnings: TIntegerField
      FieldName = 'TrkEarnings'
      Origin = 'ENTRY.TrkEarnings'
    end
    object tblEntriesTrkEPS: TIntegerField
      FieldName = 'TrkEPS'
      Origin = 'ENTRY.TrkEPS'
    end
    object tblEntriesRouteStarts: TSmallintField
      FieldName = 'RouteStarts'
      Origin = 'ENTRY.RouteStarts'
    end
    object tblEntriesRouteWins: TSmallintField
      FieldName = 'RouteWins'
      Origin = 'ENTRY.RouteWins'
    end
    object tblEntriesRoutePlcs: TSmallintField
      FieldName = 'RoutePlcs'
      Origin = 'ENTRY.RoutePlcs'
    end
    object tblEntriesRouteShos: TSmallintField
      FieldName = 'RouteShos'
      Origin = 'ENTRY.RouteShos'
    end
    object tblEntriesSprintStarts: TSmallintField
      FieldName = 'SprintStarts'
      Origin = 'ENTRY.SprintStarts'
    end
    object tblEntriesSprintWins: TSmallintField
      FieldName = 'SprintWins'
      Origin = 'ENTRY.SprintWins'
    end
    object tblEntriesSprintPlcs: TSmallintField
      FieldName = 'SprintPlcs'
      Origin = 'ENTRY.SprintPlcs'
    end
    object tblEntriesSprintShos: TSmallintField
      FieldName = 'SprintShos'
      Origin = 'ENTRY.SprintShos'
    end
    object tblEntriesAngleDesc: TStringField
      FieldName = 'AngleDesc'
      Origin = 'ENTRY.AngleDesc'
      Size = 200
    end
    object tblEntriesIsWagerSheetSelected: TBooleanField
      FieldName = 'IsWagerSheetSelected'
      Origin = 'ENTRY.IsWagerSheetSelected'
    end
    object tblEntriesIsYouBetTrack: TBooleanField
      FieldName = 'IsYouBetTrack'
      Origin = 'ENTRY.IsYouBetTrack'
    end
    object tblEntriesIsPrintedOnValueSheet: TBooleanField
      FieldName = 'IsPrintedOnValueSheet'
      Origin = 'ENTRY.IsPrintedOnValueSheet'
    end
    object tblEntriesHorseNbr: TSmallintField
      FieldName = 'HorseNbr'
      Origin = 'ENTRY.HorseNbr'
    end
    object tblEntriesWorkLine1: TStringField
      FieldName = 'WorkLine1'
      Origin = 'ENTRY.WorkLine1'
      Size = 250
    end
    object tblEntriesWorkLine2: TStringField
      FieldName = 'WorkLine2'
      Origin = 'ENTRY.WorkLine2'
      Size = 250
    end
    object tblEntriesIsFrontDoubleLiner: TBooleanField
      FieldName = 'IsFrontDoubleLiner'
      Origin = 'ENTRY.IsFrontDoubleLiner'
    end
    object tblEntriesIsBackDoubleLiner: TBooleanField
      FieldName = 'IsBackDoubleLiner'
      Origin = 'ENTRY.IsBackDoubleLiner'
    end
    object tblEntriesIsTripleLiner: TBooleanField
      FieldName = 'IsTripleLiner'
      Origin = 'ENTRY.IsTripleLiner'
    end
    object tblEntriesIsFrontDoubleDot: TBooleanField
      FieldName = 'IsFrontDoubleDot'
      Origin = 'ENTRY.IsFrontDoubleDot'
    end
    object tblEntriesIsBackDoubleDot: TBooleanField
      FieldName = 'IsBackDoubleDot'
      Origin = 'ENTRY.IsBackDoubleDot'
    end
    object tblEntriesIsTripleDot: TBooleanField
      FieldName = 'IsTripleDot'
      Origin = 'ENTRY.IsTripleDot'
    end
    object tblEntriesIsFrontDoubleLiner0: TBooleanField
      FieldName = 'IsFrontDoubleLiner0'
      Origin = 'ENTRY.IsFrontDoubleLiner0'
    end
    object tblEntriesIsBackDoubleLiner0: TBooleanField
      FieldName = 'IsBackDoubleLiner0'
      Origin = 'ENTRY.IsBackDoubleLiner0'
    end
    object tblEntriesIsTripleLiner0: TBooleanField
      FieldName = 'IsTripleLiner0'
      Origin = 'ENTRY.IsTripleLiner0'
    end
    object tblEntriesIsFrontDoubleLiner1: TBooleanField
      FieldName = 'IsFrontDoubleLiner1'
      Origin = 'ENTRY.IsFrontDoubleLiner1'
    end
    object tblEntriesIsBackDoubleLiner1: TBooleanField
      FieldName = 'IsBackDoubleLiner1'
      Origin = 'ENTRY.IsBackDoubleLiner1'
    end
    object tblEntriesIsTripleLiner1: TBooleanField
      FieldName = 'IsTripleLiner1'
      Origin = 'ENTRY.IsTripleLiner1'
    end
    object tblEntriesIsFrontDoubleLiner2: TBooleanField
      FieldName = 'IsFrontDoubleLiner2'
      Origin = 'ENTRY.IsFrontDoubleLiner2'
    end
    object tblEntriesIsBackDoubleLiner2: TBooleanField
      FieldName = 'IsBackDoubleLiner2'
      Origin = 'ENTRY.IsBackDoubleLiner2'
    end
    object tblEntriesIsTripleLiner2: TBooleanField
      FieldName = 'IsTripleLiner2'
      Origin = 'ENTRY.IsTripleLiner2'
    end
    object tblEntriesIsFrontDoubleLiner3: TBooleanField
      FieldName = 'IsFrontDoubleLiner3'
      Origin = 'ENTRY.IsFrontDoubleLiner3'
    end
    object tblEntriesIsBackDoubleLiner3: TBooleanField
      FieldName = 'IsBackDoubleLiner3'
      Origin = 'ENTRY.IsBackDoubleLiner3'
    end
    object tblEntriesIsTripleLiner3: TBooleanField
      FieldName = 'IsTripleLiner3'
      Origin = 'ENTRY.IsTripleLiner3'
    end
    object tblEntriesTodaysWagerOrderKey: TStringField
      FieldName = 'TodaysWagerOrderKey'
      Origin = 'ENTRY.TodaysWagerOrderKey'
      Size = 50
    end
    object tblEntriesTodaysWagerStarts: TIntegerField
      FieldName = 'TodaysWagerStarts'
      Origin = 'ENTRY.TodaysWagerStarts'
    end
    object tblEntriesTodaysWagerWins: TIntegerField
      FieldName = 'TodaysWagerWins'
      Origin = 'ENTRY.TodaysWagerWins'
    end
    object tblEntriesTodaysWagerWinPct: TFloatField
      FieldName = 'TodaysWagerWinPct'
      Origin = 'ENTRY.TodaysWagerWinPct'
    end
    object tblEntriesTodaysWagerWinPctRank: TSmallintField
      FieldName = 'TodaysWagerWinPctRank'
      Origin = 'ENTRY.TodaysWagerWinPctRank'
    end
    object tblEntriesTodaysWagerAvgOdds: TFloatField
      FieldName = 'TodaysWagerAvgOdds'
      Origin = 'ENTRY.TodaysWagerAvgOdds'
    end
    object tblEntriesTodaysWagerMinOdds: TFloatField
      FieldName = 'TodaysWagerMinOdds'
      Origin = 'ENTRY.TodaysWagerMinOdds'
    end
    object tblEntriesTodaysWagerMaxOdds: TFloatField
      FieldName = 'TodaysWagerMaxOdds'
      Origin = 'ENTRY.TodaysWagerMaxOdds'
    end
    object tblEntriesTodaysWagerAvgWinOdds: TFloatField
      FieldName = 'TodaysWagerAvgWinOdds'
      Origin = 'ENTRY.TodaysWagerAvgWinOdds'
    end
    object tblEntriesTodaysWagerMinWinOdds: TFloatField
      FieldName = 'TodaysWagerMinWinOdds'
      Origin = 'ENTRY.TodaysWagerMinWinOdds'
    end
    object tblEntriesTodaysWagerMaxWinOdds: TFloatField
      FieldName = 'TodaysWagerMaxWinOdds'
      Origin = 'ENTRY.TodaysWagerMaxWinOdds'
    end
    object tblEntriesTodaysWagerValueBet: TFloatField
      FieldName = 'TodaysWagerValueBet'
      Origin = 'ENTRY.TodaysWagerValueBet'
    end
    object tblEntriesLast2TrkCode: TStringField
      FieldName = 'Last2TrkCode'
      Origin = 'ENTRY.Last2TrkCode'
      Size = 3
    end
    object tblEntriesLast2RaceNbr: TIntegerField
      FieldName = 'Last2RaceNbr'
      Origin = 'ENTRY.Last2RaceNbr'
    end
    object tblEntriesLast2RaceDate: TDateField
      FieldName = 'Last2RaceDate'
      Origin = 'ENTRY.Last2RaceDate'
    end
    object tblEntriesLast2PostPos: TSmallintField
      FieldName = 'Last2PostPos'
      Origin = 'ENTRY.Last2PostPos'
    end
    object tblEntriesLast2RaceType: TStringField
      FieldName = 'Last2RaceType'
      Origin = 'ENTRY.Last2RaceType'
      Size = 6
    end
    object tblEntriesLast2Surf: TStringField
      FieldName = 'Last2Surf'
      Origin = 'ENTRY.Last2Surf'
      Size = 1
    end
    object tblEntriesLast2RaceConditions: TStringField
      FieldName = 'Last2RaceConditions'
      Origin = 'ENTRY.Last2RaceConditions'
      Size = 3
    end
    object tblEntriesLast2DistanceDesc: TStringField
      FieldName = 'Last2DistanceDesc'
      Origin = 'ENTRY.Last2DistanceDesc'
      Size = 16
    end
    object tblEntriesLast2Distance: TFloatField
      FieldName = 'Last2Distance'
      Origin = 'ENTRY.Last2Distance'
    end
    object tblEntriesLast2Odds: TFloatField
      FieldName = 'Last2Odds'
      Origin = 'ENTRY.Last2Odds'
    end
    object tblEntriesLast2FavoriteIndicator: TStringField
      FieldName = 'Last2FavoriteIndicator'
      Origin = 'ENTRY.Last2FavoriteIndicator'
      Size = 1
    end
    object tblEntriesLast2DQIndicator: TStringField
      FieldName = 'Last2DQIndicator'
      Origin = 'ENTRY.Last2DQIndicator'
      Size = 2
    end
    object tblEntriesLast2Jockey: TStringField
      FieldName = 'Last2Jockey'
      Origin = 'ENTRY.Last2Jockey'
      Size = 15
    end
    object tblEntriesLast2Comment: TStringField
      FieldName = 'Last2Comment'
      Origin = 'ENTRY.Last2Comment'
      Size = 100
    end
    object tblEntriesLast2Comment2: TStringField
      FieldName = 'Last2Comment2'
      Origin = 'ENTRY.Last2Comment2'
      Size = 200
    end
    object tblEntriesLast2TrkCond: TStringField
      FieldName = 'Last2TrkCond'
      Origin = 'ENTRY.Last2TrkCond'
      Size = 2
    end
    object tblEntriesLast2ClmPrice: TFloatField
      FieldName = 'Last2ClmPrice'
      Origin = 'ENTRY.Last2ClmPrice'
    end
    object tblEntriesLast2Claimed: TStringField
      FieldName = 'Last2Claimed'
      Origin = 'ENTRY.Last2Claimed'
      Size = 1
    end
    object tblEntriesLast2Purse: TFloatField
      FieldName = 'Last2Purse'
      Origin = 'ENTRY.Last2Purse'
    end
    object tblEntriesLast2Day: TStringField
      FieldName = 'Last2Day'
      Origin = 'ENTRY.Last2Day'
      Size = 2
    end
    object tblEntriesLast2MonthDesc: TStringField
      FieldName = 'Last2MonthDesc'
      Origin = 'ENTRY.Last2MonthDesc'
      Size = 3
    end
    object tblEntriesLast2Year: TStringField
      FieldName = 'Last2Year'
      Origin = 'ENTRY.Last2Year'
      Size = 4
    end
    object tblEntriesLast2GateBreak: TStringField
      FieldName = 'Last2GateBreak'
      Origin = 'ENTRY.Last2GateBreak'
      Size = 2
    end
    object tblEntriesLast2Len1Back: TStringField
      FieldName = 'Last2Len1Back'
      Origin = 'ENTRY.Last2Len1Back'
      Size = 7
    end
    object tblEntriesLast2Len2Back: TStringField
      FieldName = 'Last2Len2Back'
      Origin = 'ENTRY.Last2Len2Back'
      Size = 7
    end
    object tblEntriesLast2StLenBack: TStringField
      FieldName = 'Last2StLenBack'
      Origin = 'ENTRY.Last2StLenBack'
      Size = 7
    end
    object tblEntriesLast2FinishBeaten: TStringField
      FieldName = 'Last2FinishBeaten'
      Origin = 'ENTRY.Last2FinishBeaten'
      Size = 7
    end
    object tblEntriesLast2Equip: TStringField
      FieldName = 'Last2Equip'
      Origin = 'ENTRY.Last2Equip'
      Size = 2
    end
    object tblEntriesLast2Weight: TIntegerField
      FieldName = 'Last2Weight'
      Origin = 'ENTRY.Last2Weight'
    end
    object tblEntriesLast2Speed: TIntegerField
      FieldName = 'Last2Speed'
      Origin = 'ENTRY.Last2Speed'
    end
    object tblEntriesLast2HorseTime: TFloatField
      FieldName = 'Last2HorseTime'
      Origin = 'ENTRY.Last2HorseTime'
    end
    object tblEntriesLast2RaceDesc: TStringField
      FieldName = 'Last2RaceDesc'
      Origin = 'ENTRY.Last2RaceDesc'
      Size = 150
    end
    object tblEntriesLast3TrkCode: TStringField
      FieldName = 'Last3TrkCode'
      Origin = 'ENTRY.Last3TrkCode'
      Size = 3
    end
    object tblEntriesLast3RaceNbr: TIntegerField
      FieldName = 'Last3RaceNbr'
      Origin = 'ENTRY.Last3RaceNbr'
    end
    object tblEntriesLast3RaceDate: TDateField
      FieldName = 'Last3RaceDate'
      Origin = 'ENTRY.Last3RaceDate'
    end
    object tblEntriesLast3PostPos: TSmallintField
      FieldName = 'Last3PostPos'
      Origin = 'ENTRY.Last3PostPos'
    end
    object tblEntriesLast3RaceType: TStringField
      FieldName = 'Last3RaceType'
      Origin = 'ENTRY.Last3RaceType'
      Size = 6
    end
    object tblEntriesLast3Surf: TStringField
      FieldName = 'Last3Surf'
      Origin = 'ENTRY.Last3Surf'
      Size = 1
    end
    object tblEntriesLast3RaceConditions: TStringField
      FieldName = 'Last3RaceConditions'
      Origin = 'ENTRY.Last3RaceConditions'
    end
    object tblEntriesLast3DistanceDesc: TStringField
      FieldName = 'Last3DistanceDesc'
      Origin = 'ENTRY.Last3DistanceDesc'
      Size = 16
    end
    object tblEntriesLast3Distance: TFloatField
      FieldName = 'Last3Distance'
      Origin = 'ENTRY.Last3Distance'
    end
    object tblEntriesLast3Odds: TFloatField
      FieldName = 'Last3Odds'
      Origin = 'ENTRY.Last3Odds'
    end
    object tblEntriesLast3FavoriteIndicator: TStringField
      FieldName = 'Last3FavoriteIndicator'
      Origin = 'ENTRY.Last3FavoriteIndicator'
      Size = 1
    end
    object tblEntriesLast3DQIndicator: TStringField
      FieldName = 'Last3DQIndicator'
      Origin = 'ENTRY.Last3DQIndicator'
      Size = 2
    end
    object tblEntriesLast3Jockey: TStringField
      FieldName = 'Last3Jockey'
      Origin = 'ENTRY.Last3Jockey'
      Size = 15
    end
    object tblEntriesLast3Comment: TStringField
      FieldName = 'Last3Comment'
      Origin = 'ENTRY.Last3Comment'
      Size = 100
    end
    object tblEntriesLast3Comment2: TStringField
      FieldName = 'Last3Comment2'
      Origin = 'ENTRY.Last3Comment2'
      Size = 200
    end
    object tblEntriesLast3TrkCond: TStringField
      FieldName = 'Last3TrkCond'
      Origin = 'ENTRY.Last3TrkCond'
      Size = 2
    end
    object tblEntriesLast3ClmPrice: TFloatField
      FieldName = 'Last3ClmPrice'
      Origin = 'ENTRY.Last3ClmPrice'
    end
    object tblEntriesLast3Claimed: TStringField
      FieldName = 'Last3Claimed'
      Origin = 'ENTRY.Last3Claimed'
      Size = 1
    end
    object tblEntriesLast3Purse: TFloatField
      FieldName = 'Last3Purse'
      Origin = 'ENTRY.Last3Purse'
    end
    object tblEntriesLast3Day: TStringField
      FieldName = 'Last3Day'
      Origin = 'ENTRY.Last3Day'
      Size = 2
    end
    object tblEntriesLast3MonthDesc: TStringField
      FieldName = 'Last3MonthDesc'
      Origin = 'ENTRY.Last3MonthDesc'
      Size = 3
    end
    object tblEntriesLast3Year: TStringField
      FieldName = 'Last3Year'
      Origin = 'ENTRY.Last3Year'
      Size = 4
    end
    object tblEntriesLast3GateBreak: TStringField
      FieldName = 'Last3GateBreak'
      Origin = 'ENTRY.Last3GateBreak'
      Size = 2
    end
    object tblEntriesLast3Len1Back: TStringField
      FieldName = 'Last3Len1Back'
      Origin = 'ENTRY.Last3Len1Back'
      Size = 7
    end
    object tblEntriesLast3Len2Back: TStringField
      FieldName = 'Last3Len2Back'
      Origin = 'ENTRY.Last3Len2Back'
      Size = 7
    end
    object tblEntriesLast3StLenBack: TStringField
      FieldName = 'Last3StLenBack'
      Origin = 'ENTRY.Last3StLenBack'
      Size = 7
    end
    object tblEntriesLast3FinishBeaten: TStringField
      FieldName = 'Last3FinishBeaten'
      Origin = 'ENTRY.Last3FinishBeaten'
      Size = 7
    end
    object tblEntriesLast3Equip: TStringField
      FieldName = 'Last3Equip'
      Origin = 'ENTRY.Last3Equip'
      Size = 7
    end
    object tblEntriesLast3Weight: TIntegerField
      FieldName = 'Last3Weight'
      Origin = 'ENTRY.Last3Weight'
    end
    object tblEntriesLast3Speed: TIntegerField
      FieldName = 'Last3Speed'
      Origin = 'ENTRY.Last3Speed'
    end
    object tblEntriesLast3HorseTime: TFloatField
      FieldName = 'Last3HorseTime'
      Origin = 'ENTRY.Last3HorseTime'
    end
    object tblEntriesLast3RaceDesc: TStringField
      FieldName = 'Last3RaceDesc'
      Origin = 'ENTRY.Last3RaceDesc'
      Size = 150
    end
    object tblEntriesOdds: TFloatField
      FieldName = 'Odds'
      Origin = 'ENTRY.Odds'
    end
    object tblEntriesFinishPos: TFloatField
      FieldName = 'FinishPos'
      Origin = 'ENTRY.FinishPos'
    end
    object tblEntriesQSP1stCall: TSmallintField
      FieldName = 'QSP1stCall'
      Origin = 'ENTRY.QSP1stCall'
    end
    object tblEntriesQSP1stCallRank: TSmallintField
      FieldName = 'QSP1stCallRank'
      Origin = 'ENTRY.QSP1stCallRank'
    end
    object tblEntriesQSP1stCallRunStyle: TStringField
      FieldName = 'QSP1stCallRunStyle'
      Origin = 'ENTRY.QSP1stCallRunStyle'
      Size = 5
    end
    object tblEntriesQSP2ndCall: TSmallintField
      FieldName = 'QSP2ndCall'
      Origin = 'ENTRY.QSP2ndCall'
    end
    object tblEntriesQSP2ndCallRank: TSmallintField
      FieldName = 'QSP2ndCallRank'
      Origin = 'ENTRY.QSP2ndCallRank'
    end
    object tblEntriesQSP2ndCallRunStyle: TStringField
      FieldName = 'QSP2ndCallRunStyle'
      Origin = 'ENTRY.QSP2ndCallRunStyle'
      Size = 5
    end
    object tblEntriesKSP1stCall: TSmallintField
      FieldName = 'KSP1stCall'
      Origin = 'ENTRY.KSP1stCall'
    end
    object tblEntriesKSP1stCallRank: TSmallintField
      FieldName = 'KSP1stCallRank'
      Origin = 'ENTRY.KSP1stCallRank'
    end
    object tblEntriesKSP2ndCall: TSmallintField
      FieldName = 'KSP2ndCall'
      Origin = 'ENTRY.KSP2ndCall'
    end
    object tblEntriesKSP2ndCallRank: TSmallintField
      FieldName = 'KSP2ndCallRank'
      Origin = 'ENTRY.KSP2ndCallRank'
    end
    object tblEntriesLastPos1stCall: TFloatField
      FieldName = 'LastPos1stCall'
      Origin = 'ENTRY.LastPos1stCall'
    end
    object tblEntriesLastPos2ndCall: TFloatField
      FieldName = 'LastPos2ndCall'
      Origin = 'ENTRY.LastPos2ndCall'
    end
    object tblEntriesLastPosStrCall: TFloatField
      FieldName = 'LastPosStrCall'
      Origin = 'ENTRY.LastPosStrCall'
    end
    object tblEntriesLast2Pos1stCall: TFloatField
      FieldName = 'Last2Pos1stCall'
      Origin = 'ENTRY.Last2Pos1stCall'
    end
    object tblEntriesLast2Pos2ndCall: TFloatField
      FieldName = 'Last2Pos2ndCall'
      Origin = 'ENTRY.Last2Pos2ndCall'
    end
    object tblEntriesLast2PosStrCall: TFloatField
      FieldName = 'Last2PosStrCall'
      Origin = 'ENTRY.Last2PosStrCall'
    end
    object tblEntriesLast3Pos1stCall: TFloatField
      FieldName = 'Last3Pos1stCall'
      Origin = 'ENTRY.Last3Pos1stCall'
    end
    object tblEntriesLast3Pos2ndCall: TFloatField
      FieldName = 'Last3Pos2ndCall'
      Origin = 'ENTRY.Last3Pos2ndCall'
    end
    object tblEntriesLast3PosStrCall: TFloatField
      FieldName = 'Last3PosStrCall'
      Origin = 'ENTRY.Last3PosStrCall'
    end
    object tblEntriesLastTime1stCall: TFloatField
      FieldName = 'LastTime1stCall'
      Origin = 'ENTRY.LastTime1stCall'
    end
    object tblEntriesLastTime2ndCall: TFloatField
      FieldName = 'LastTime2ndCall'
      Origin = 'ENTRY.LastTime2ndCall'
    end
    object tblEntriesLastTimeStrCall: TFloatField
      FieldName = 'LastTimeStrCall'
      Origin = 'ENTRY.LastTimeStrCall'
    end
    object tblEntriesLastTimeFinCall: TFloatField
      FieldName = 'LastTimeFinCall'
      Origin = 'ENTRY.LastTimeFinCall'
    end
    object tblEntriesLast2Time1stCall: TFloatField
      FieldName = 'Last2Time1stCall'
      Origin = 'ENTRY.Last2Time1stCall'
    end
    object tblEntriesLast2Time2ndCall: TFloatField
      FieldName = 'Last2Time2ndCall'
      Origin = 'ENTRY.Last2Time2ndCall'
    end
    object tblEntriesLast2TimeStrCall: TFloatField
      FieldName = 'Last2TimeStrCall'
      Origin = 'ENTRY.Last2TimeStrCall'
    end
    object tblEntriesLast2TimeFinCall: TFloatField
      FieldName = 'Last2TimeFinCall'
      Origin = 'ENTRY.Last2TimeFinCall'
    end
    object tblEntriesLast3Time1stCall: TFloatField
      FieldName = 'Last3Time1stCall'
      Origin = 'ENTRY.Last3Time1stCall'
    end
    object tblEntriesLast3Time2ndCall: TFloatField
      FieldName = 'Last3Time2ndCall'
      Origin = 'ENTRY.Last3Time2ndCall'
    end
    object tblEntriesLast3TimeStrCall: TFloatField
      FieldName = 'Last3TimeStrCall'
      Origin = 'ENTRY.Last3TimeStrCall'
    end
    object tblEntriesLast3TimeFinCall: TFloatField
      FieldName = 'Last3TimeFinCall'
      Origin = 'ENTRY.Last3TimeFinCall'
    end
    object tblEntriesLastBL1stCall: TFloatField
      FieldName = 'LastBL1stCall'
      Origin = 'ENTRY.LastBL1stCall'
    end
    object tblEntriesLastBL2ndCall: TFloatField
      FieldName = 'LastBL2ndCall'
      Origin = 'ENTRY.LastBL2ndCall'
    end
    object tblEntriesLastBLStrCall: TFloatField
      FieldName = 'LastBLStrCall'
      Origin = 'ENTRY.LastBLStrCall'
    end
    object tblEntriesLastBLFinCall: TFloatField
      FieldName = 'LastBLFinCall'
      Origin = 'ENTRY.LastBLFinCall'
    end
    object tblEntriesLast2BL1stCall: TFloatField
      FieldName = 'Last2BL1stCall'
      Origin = 'ENTRY.Last2BL1stCall'
    end
    object tblEntriesLast2BL2ndCall: TFloatField
      FieldName = 'Last2BL2ndCall'
      Origin = 'ENTRY.Last2BL2ndCall'
    end
    object tblEntriesLast2BLStrCall: TFloatField
      FieldName = 'Last2BLStrCall'
      Origin = 'ENTRY.Last2BLStrCall'
    end
    object tblEntriesLast2BLFinCall: TFloatField
      FieldName = 'Last2BLFinCall'
      Origin = 'ENTRY.Last2BLFinCall'
    end
    object tblEntriesLast3BL1stCall: TFloatField
      FieldName = 'Last3BL1stCall'
      Origin = 'ENTRY.Last3BL1stCall'
    end
    object tblEntriesLast3BL2ndCall: TFloatField
      FieldName = 'Last3BL2ndCall'
      Origin = 'ENTRY.Last3BL2ndCall'
    end
    object tblEntriesLast3BLStrCall: TFloatField
      FieldName = 'Last3BLStrCall'
      Origin = 'ENTRY.Last3BLStrCall'
    end
    object tblEntriesLast3BLFinCall: TFloatField
      FieldName = 'Last3BLFinCall'
      Origin = 'ENTRY.Last3BLFinCall'
    end
    object tblEntriesLastPosFinCall: TFloatField
      FieldName = 'LastPosFinCall'
      Origin = 'ENTRY.LastPosFinCall'
    end
    object tblEntriesLast2PosFinCall: TFloatField
      FieldName = 'Last2PosFinCall'
      Origin = 'ENTRY.Last2PosFinCall'
    end
    object tblEntriesLast3PosFinCall: TFloatField
      FieldName = 'Last3PosFinCall'
      Origin = 'ENTRY.Last3PosFinCall'
    end
    object tblEntriesIs1stClaiming: TBooleanField
      FieldName = 'Is1stClaiming'
      Origin = 'ENTRY.Is1stClaiming'
    end
    object tblEntriesIs1stMCL: TBooleanField
      FieldName = 'Is1stMCL'
      Origin = 'ENTRY.Is1stMCL'
    end
    object tblEntriesIs1stAfterLayoff: TBooleanField
      FieldName = 'Is1stAfterLayoff'
      Origin = 'ENTRY.Is1stAfterLayoff'
    end
    object tblEntriesIs2ndAfterLayoff: TBooleanField
      FieldName = 'Is2ndAfterLayoff'
      Origin = 'ENTRY.Is2ndAfterLayoff'
    end
    object tblEntriesIs3rdAfterLayoff: TBooleanField
      FieldName = 'Is3rdAfterLayoff'
      Origin = 'ENTRY.Is3rdAfterLayoff'
    end
    object tblEntriesIsDirtToTurfToDirtAfterLayoff: TBooleanField
      FieldName = 'IsDirtToTurfToDirtAfterLayoff'
      Origin = 'ENTRY.IsDirtToTurfToDirtAfterLayoff'
    end
    object tblEntriesIsTurfToDirtToTurfAfterLayoff: TBooleanField
      FieldName = 'IsTurfToDirtToTurfAfterLayoff'
      Origin = 'ENTRY.IsTurfToDirtToTurfAfterLayoff'
    end
    object tblEntriesIsRouteToSprintToRouteAfterLayoff: TBooleanField
      FieldName = 'IsRouteToSprintToRouteAfterLayoff'
      Origin = 'ENTRY.IsRouteToSprintToRouteAfterLayoff'
    end
    object tblEntriesIsSprintToRouteToSprintAfterLayoff: TBooleanField
      FieldName = 'IsSprintToRouteToSprintAfterLayoff'
      Origin = 'ENTRY.IsSprintToRouteToSprintAfterLayoff'
    end
    object tblEntriesIs2yoBred: TBooleanField
      FieldName = 'Is2yoBred'
      Origin = 'ENTRY.Is2yoBred'
    end
    object tblEntriesIs1stBred: TBooleanField
      FieldName = 'Is1stBred'
      Origin = 'ENTRY.Is1stBred'
    end
    object tblEntriesIsTurfBred: TBooleanField
      FieldName = 'IsTurfBred'
      Origin = 'ENTRY.IsTurfBred'
    end
    object tblEntriesIs1stOffLayoff: TBooleanField
      FieldName = 'Is1stOffLayoff'
      Origin = 'ENTRY.Is1stOffLayoff'
    end
    object tblEntriesIs2ndOffLayoff: TBooleanField
      FieldName = 'Is2ndOffLayoff'
      Origin = 'ENTRY.Is2ndOffLayoff'
    end
    object tblEntriesIs3rdOffLayoff: TBooleanField
      FieldName = 'Is3rdOffLayoff'
      Origin = 'ENTRY.Is3rdOffLayoff'
    end
    object tblEntriesStandingIn: TStringField
      FieldName = 'StandingIn'
      Origin = 'ENTRY.StandingIn'
      Size = 5
    end
    object tblEntriesStandingInRank: TSmallintField
      FieldName = 'StandingInRank'
      Origin = 'ENTRY.StandingInRank'
    end
    object tblEntriesIsOnStandingInList: TBooleanField
      FieldName = 'IsOnStandingInList'
      Origin = 'ENTRY.IsOnStandingInList'
    end
    object tblEntriesValueROI: TFloatField
      FieldName = 'ValueROI'
      Origin = 'ENTRY.ValueROI'
    end
    object tblEntriesValueROICnt: TSmallintField
      FieldName = 'ValueROICnt'
      Origin = 'ENTRY.ValueROICnt'
    end
    object tblEntriesValueDesc: TStringField
      FieldName = 'ValueDesc'
      Origin = 'ENTRY.ValueDesc'
      Size = 255
    end
    object tblEntriesDollarCnt: TSmallintField
      FieldName = 'DollarCnt'
      Origin = 'ENTRY.DollarCnt'
    end
    object tblEntriesListType: TStringField
      FieldName = 'ListType'
      Origin = 'ENTRY.ListType'
      Size = 1
    end
    object tblEntriesPowerAdvantage: TFloatField
      FieldName = 'PowerAdvantage'
      Origin = 'ENTRY.PowerAdvantage'
    end
    object tblEntriesPowerAdvantageKey: TIntegerField
      FieldName = 'PowerAdvantageKey'
      Origin = 'ENTRY.PowerAdvantageKey'
    end
    object tblEntriesPostPosWinPct: TSmallintField
      FieldName = 'PostPosWinPct'
      Origin = 'ENTRY.PostPosWinPct'
    end
    object tblEntriesPostPosStarts: TIntegerField
      FieldName = 'PostPosStarts'
      Origin = 'ENTRY.PostPosStarts'
    end
    object tblEntriesPostPosWinPctRank: TFloatField
      FieldName = 'PostPosWinPctRank'
      Origin = 'ENTRY.PostPosWinPctRank'
    end
    object tblEntriesPaceIndicatorWinPct: TFloatField
      FieldName = 'PaceIndicatorWinPct'
      Origin = 'ENTRY.PaceIndicatorWinPct'
    end
    object tblEntriesPaceIndicatorWinPctRank: TSmallintField
      FieldName = 'PaceIndicatorWinPctRank'
      Origin = 'ENTRY.PaceIndicatorWinPctRank'
    end
    object tblEntriesElimWinPct: TFloatField
      FieldName = 'ElimWinPct'
      Origin = 'ENTRY.ElimWinPct'
    end
    object tblEntriesElim2WinPct: TFloatField
      FieldName = 'Elim2WinPct'
      Origin = 'ENTRY.Elim2WinPct'
    end
    object tblEntriesTodaysWagerOddsDesc: TStringField
      FieldName = 'TodaysWagerOddsDesc'
      Origin = 'ENTRY.TodaysWagerOddsDesc'
      Size = 10
    end
    object tblEntriesPowerAdvantageWinPct: TFloatField
      FieldName = 'PowerAdvantageWinPct'
      Origin = 'ENTRY.PowerAdvantageWinPct'
    end
    object tblEntriesEarlyPaceAdvantageWinPct: TFloatField
      FieldName = 'EarlyPaceAdvantageWinPct'
      Origin = 'ENTRY.EarlyPaceAdvantageWinPct'
    end
    object tblEntriesEarlyPaceAdvantageWinPctRank: TSmallintField
      FieldName = 'EarlyPaceAdvantageWinPctRank'
      Origin = 'ENTRY.EarlyPaceAdvantageWinPctRank'
    end
    object tblEntriesEarlyPaceAdvantageValueBet: TFloatField
      FieldName = 'EarlyPaceAdvantageValueBet'
      Origin = 'ENTRY.EarlyPaceAdvantageValueBet'
    end
    object tblEntriesMiddlePaceAdvantageWinPct: TFloatField
      FieldName = 'MiddlePaceAdvantageWinPct'
      Origin = 'ENTRY.MiddlePaceAdvantageWinPct'
    end
    object tblEntriesMiddlePaceAdvantageWinPctRank: TSmallintField
      FieldName = 'MiddlePaceAdvantageWinPctRank'
      Origin = 'ENTRY.MiddlePaceAdvantageWinPctRank'
    end
    object tblEntriesMiddlePaceAdvantageValueBet: TFloatField
      FieldName = 'MiddlePaceAdvantageValueBet'
      Origin = 'ENTRY.MiddlePaceAdvantageValueBet'
    end
    object tblEntriesLatePaceAdvantageWinPct: TFloatField
      FieldName = 'LatePaceAdvantageWinPct'
      Origin = 'ENTRY.LatePaceAdvantageWinPct'
    end
    object tblEntriesLatePaceAdvantageWinPctRank: TSmallintField
      FieldName = 'LatePaceAdvantageWinPctRank'
      Origin = 'ENTRY.LatePaceAdvantageWinPctRank'
    end
    object tblEntriesIsHeavyChalk: TBooleanField
      FieldName = 'IsHeavyChalk'
      Origin = 'ENTRY.IsHeavyChalk'
    end
    object tblEntriesMorningLineWinPct: TFloatField
      FieldName = 'MorningLineWinPct'
      Origin = 'ENTRY.MorningLineWinPct'
    end
    object tblEntriesIsEliminated: TBooleanField
      FieldName = 'IsEliminated'
      Origin = 'ENTRY.IsEliminated'
    end
    object tblEntriesIsValueDebutSelected: TBooleanField
      FieldName = 'IsValueDebutSelected'
      Origin = 'ENTRY.IsValueDebutSelected'
    end
    object tblEntriesIsValueDebutTwoSelected: TBooleanField
      FieldName = 'IsValueDebutTwoSelected'
      Origin = 'ENTRY.IsValueDebutTwoSelected'
    end
    object tblEntriesIsValueWagerSelected: TBooleanField
      FieldName = 'IsValueWagerSelected'
      Origin = 'ENTRY.IsValueWagerSelected'
    end
    object tblEntriesIsPTCTrack: TBooleanField
      FieldName = 'IsPTCTrack'
      Origin = 'ENTRY.IsPTCTrack'
    end
    object tblEntriesIsTwinSpiresTrack: TBooleanField
      FieldName = 'IsTwinSpiresTrack'
      Origin = 'ENTRY.IsTwinSpiresTrack'
    end
    object tblEntriesTodaysAltWagerWinPct: TFloatField
      FieldName = 'TodaysAltWagerWinPct'
      Origin = 'ENTRY.TodaysAltWagerWinPct'
    end
    object tblEntriesTodaysAltWagerWinPctRank: TSmallintField
      FieldName = 'TodaysAltWagerWinPctRank'
      Origin = 'ENTRY.TodaysAltWagerWinPctRank'
    end
    object tblEntriesSelectorChoice: TSmallintField
      FieldName = 'SelectorChoice'
      Origin = 'ENTRY.SelectorChoice'
    end
    object tblEntriesIsSpeedSheetSelected: TBooleanField
      FieldName = 'IsSpeedSheetSelected'
      Origin = 'ENTRY.IsSpeedSheetSelected'
    end
    object tblEntriesClassRating: TFloatField
      FieldName = 'ClassRating'
      Origin = 'ENTRY.ClassRating'
    end
    object tblEntriesClassRatingRank: TSmallintField
      FieldName = 'ClassRatingRank'
      Origin = 'ENTRY.ClassRatingRank'
    end
    object tblEntriesTurfRating: TFloatField
      FieldName = 'TurfRating'
      Origin = 'ENTRY.TurfRating'
    end
    object tblEntriesTurfRatingRank: TSmallintField
      FieldName = 'TurfRatingRank'
      Origin = 'ENTRY.TurfRatingRank'
    end
    object tblEntriesMudRating: TFloatField
      FieldName = 'MudRating'
      Origin = 'ENTRY.MudRating'
    end
    object tblEntriesMudRatingRank: TSmallintField
      FieldName = 'MudRatingRank'
      Origin = 'ENTRY.MudRatingRank'
    end
    object tblEntriesDistanceRating: TFloatField
      FieldName = 'DistanceRating'
      Origin = 'ENTRY.DistanceRating'
    end
    object tblEntriesDistanceRatingRank: TSmallintField
      FieldName = 'DistanceRatingRank'
      Origin = 'ENTRY.DistanceRatingRank'
    end
    object tblEntriesAWRating: TFloatField
      FieldName = 'AWRating'
      Origin = 'ENTRY.AWRating'
    end
    object tblEntriesAWRatingRank: TSmallintField
      FieldName = 'AWRatingRank'
      Origin = 'ENTRY.AWRatingRank'
    end
    object tblEntriesSireClassRating: TFloatField
      FieldName = 'SireClassRating'
      Origin = 'ENTRY.SireClassRating'
    end
    object tblEntriesSireClassRatingRank: TSmallintField
      FieldName = 'SireClassRatingRank'
      Origin = 'ENTRY.SireClassRatingRank'
    end
    object tblEntriesDamSireClassRating: TFloatField
      FieldName = 'DamSireClassRating'
      Origin = 'ENTRY.DamSireClassRating'
    end
    object tblEntriesDamSireClassRatingRank: TSmallintField
      FieldName = 'DamSireClassRatingRank'
      Origin = 'ENTRY.DamSireClassRatingRank'
    end
    object tblEntriesSireTurfRating: TFloatField
      FieldName = 'SireTurfRating'
      Origin = 'ENTRY.SireTurfRating'
    end
    object tblEntriesSireTurfRatingRank: TSmallintField
      FieldName = 'SireTurfRatingRank'
      Origin = 'ENTRY.SireTurfRatingRank'
    end
    object tblEntriesDamSireTurfRating: TFloatField
      FieldName = 'DamSireTurfRating'
      Origin = 'ENTRY.DamSireTurfRating'
    end
    object tblEntriesDamSireTurfRatingRank: TSmallintField
      FieldName = 'DamSireTurfRatingRank'
      Origin = 'ENTRY.DamSireTurfRatingRank'
    end
    object tblEntriesSireMudRatingRank: TSmallintField
      FieldName = 'SireMudRatingRank'
      Origin = 'ENTRY.SireMudRatingRank'
    end
    object tblEntriesSireMudRating: TFloatField
      FieldName = 'SireMudRating'
      Origin = 'ENTRY.SireMudRating'
    end
    object tblEntriesDamSireMudRating: TFloatField
      FieldName = 'DamSireMudRating'
      Origin = 'ENTRY.DamSireMudRating'
    end
    object tblEntriesDamSireMudRatingRank: TSmallintField
      FieldName = 'DamSireMudRatingRank'
      Origin = 'ENTRY.DamSireMudRatingRank'
    end
    object tblEntriesSireSprintRating: TFloatField
      FieldName = 'SireSprintRating'
      Origin = 'ENTRY.SireSprintRating'
    end
    object tblEntriesSireSprintRatingRank: TSmallintField
      FieldName = 'SireSprintRatingRank'
      Origin = 'ENTRY.SireSprintRatingRank'
    end
    object tblEntriesDamSireSprintRating: TFloatField
      FieldName = 'DamSireSprintRating'
      Origin = 'ENTRY.DamSireSprintRating'
    end
    object tblEntriesDamSireSprintRatingRank: TSmallintField
      FieldName = 'DamSireSprintRatingRank'
      Origin = 'ENTRY.DamSireSprintRatingRank'
    end
    object tblEntriesSireRouteRating: TFloatField
      FieldName = 'SireRouteRating'
      Origin = 'ENTRY.SireRouteRating'
    end
    object tblEntriesSireRouteRatingRank: TSmallintField
      FieldName = 'SireRouteRatingRank'
      Origin = 'ENTRY.SireRouteRatingRank'
    end
    object tblEntriesDamSireRouteRating: TFloatField
      FieldName = 'DamSireRouteRating'
      Origin = 'ENTRY.DamSireRouteRating'
    end
    object tblEntriesDamSireRouteRatingRank: TSmallintField
      FieldName = 'DamSireRouteRatingRank'
      Origin = 'ENTRY.DamSireRouteRatingRank'
    end
    object tblEntriesSireAWRating: TFloatField
      FieldName = 'SireAWRating'
      Origin = 'ENTRY.SireAWRating'
    end
    object tblEntriesSireAWRatingRank: TSmallintField
      FieldName = 'SireAWRatingRank'
      Origin = 'ENTRY.SireAWRatingRank'
    end
    object tblEntriesDamSireAWRating: TFloatField
      FieldName = 'DamSireAWRating'
      Origin = 'ENTRY.DamSireAWRating'
    end
    object tblEntriesDamSireAWRatingRank: TSmallintField
      FieldName = 'DamSireAWRatingRank'
      Origin = 'ENTRY.DamSireAWRatingRank'
    end
    object tblEntriesTrainerRating: TFloatField
      FieldName = 'TrainerRating'
      Origin = 'ENTRY.TrainerRating'
    end
    object tblEntriesTrainerRatingRank: TSmallintField
      FieldName = 'TrainerRatingRank'
      Origin = 'ENTRY.TrainerRatingRank'
    end
    object tblEntriesTrainerOwnerRating: TFloatField
      FieldName = 'TrainerOwnerRating'
      Origin = 'ENTRY.TrainerOwnerRating'
    end
    object tblEntriesTrainerOwnerRatingRank: TSmallintField
      FieldName = 'TrainerOwnerRatingRank'
      Origin = 'ENTRY.TrainerOwnerRatingRank'
    end
    object tblEntriesTrainerJockeyRating: TFloatField
      FieldName = 'TrainerJockeyRating'
      Origin = 'ENTRY.TrainerJockeyRating'
    end
    object tblEntriesTrainerJockeyRatingRank: TSmallintField
      FieldName = 'TrainerJockeyRatingRank'
      Origin = 'ENTRY.TrainerJockeyRatingRank'
    end
    object tblEntriesTrainerTrackRating: TFloatField
      FieldName = 'TrainerTrackRating'
      Origin = 'ENTRY.TrainerTrackRating'
    end
    object tblEntriesTrainerTrackRatingRank: TSmallintField
      FieldName = 'TrainerTrackRatingRank'
      Origin = 'ENTRY.TrainerTrackRatingRank'
    end
    object tblEntriesJockeyRating: TFloatField
      FieldName = 'JockeyRating'
      Origin = 'ENTRY.JockeyRating'
    end
    object tblEntriesJockeyRatingRank: TSmallintField
      FieldName = 'JockeyRatingRank'
      Origin = 'ENTRY.JockeyRatingRank'
    end
    object tblEntriesJockeyOwnerRating: TFloatField
      FieldName = 'JockeyOwnerRating'
      Origin = 'ENTRY.JockeyOwnerRating'
    end
    object tblEntriesJockeyOwnerRatingRank: TSmallintField
      FieldName = 'JockeyOwnerRatingRank'
      Origin = 'ENTRY.JockeyOwnerRatingRank'
    end
    object tblEntriesJockeyTrackRating: TFloatField
      FieldName = 'JockeyTrackRating'
      Origin = 'ENTRY.JockeyTrackRating'
    end
    object tblEntriesJockeyTrackRatingRank: TSmallintField
      FieldName = 'JockeyTrackRatingRank'
      Origin = 'ENTRY.JockeyTrackRatingRank'
    end
    object tblEntriesOwnerRating: TFloatField
      FieldName = 'OwnerRating'
      Origin = 'ENTRY.OwnerRating'
    end
    object tblEntriesOwnerRatingRank: TSmallintField
      FieldName = 'OwnerRatingRank'
      Origin = 'ENTRY.OwnerRatingRank'
    end
    object tblEntriesTurfOrder: TStringField
      FieldName = 'TurfOrder'
      Origin = 'ENTRY.TurfOrder'
      Size = 25
    end
    object tblEntriesMaidenOrder: TStringField
      FieldName = 'MaidenOrder'
      Origin = 'ENTRY.MaidenOrder'
      Size = 25
    end
    object tblEntriesMudOrder: TStringField
      FieldName = 'MudOrder'
      Origin = 'ENTRY.MudOrder'
      Size = 25
    end
    object tblEntriesAWOrder: TStringField
      FieldName = 'AWOrder'
      Origin = 'ENTRY.AWOrder'
      Size = 25
    end
    object tblEntriesDistanceOrder: TStringField
      FieldName = 'DistanceOrder'
      Origin = 'ENTRY.DistanceOrder'
      Size = 25
    end
    object tblEntriesFinalOrderWinPct: TFloatField
      FieldName = 'FinalOrderWinPct'
      Origin = 'ENTRY.FinalOrderWinPct'
    end
    object tblEntriesFinalOrderWinPctRank: TSmallintField
      FieldName = 'FinalOrderWinPctRank'
      Origin = 'ENTRY.FinalOrderWinPctRank'
    end
    object tblEntriesFinalOrderKey: TStringField
      FieldName = 'FinalOrderKey'
      Origin = 'ENTRY.FinalOrderKey'
      Size = 25
    end
    object tblEntriesIsTrainerSheetSelected: TBooleanField
      FieldName = 'IsTrainerSheetSelected'
      Origin = 'ENTRY.IsTrainerSheetSelected'
    end
    object tblEntriesTCPlusMinus: TIntegerField
      FieldName = 'TCPlusMinus'
      Origin = 'ENTRY.TCPlusMinus'
    end
    object tblEntriesTJMeetWinPct: TIntegerField
      FieldName = 'TJMeetWinPct'
      Origin = 'ENTRY.TJMeetWinPct'
    end
    object tblEntriesTJMeetStarts: TIntegerField
      FieldName = 'TJMeetStarts'
      Origin = 'ENTRY.TJMeetStarts'
    end
    object tblEntriesTJ365WinPct: TIntegerField
      FieldName = 'TJ365WinPct'
      Origin = 'ENTRY.TJ365WinPct'
    end
    object tblEntriesTJ365Starts: TIntegerField
      FieldName = 'TJ365Starts'
      Origin = 'ENTRY.TJ365Starts'
    end
    object tblEntriesPacificTime: TStringField
      FieldName = 'PacificTime'
      Origin = 'ENTRY.PacificTime'
    end
    object tblEntriesFinalWinPct: TFloatField
      FieldName = 'FinalWinPct'
      Origin = 'ENTRY.FinalWinPct'
    end
    object tblEntriesFinalOrderValueBet: TFloatField
      FieldName = 'FinalOrderValueBet'
      Origin = 'ENTRY.FinalOrderValueBet'
    end
  end
end