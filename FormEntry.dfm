object EntryForm: TEntryForm
  Left = -4
  Top = -4
  Width = 1444
  Height = 841
  Caption = 'Entries'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1436
    Height = 281
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 6
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object tvRaces: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.Insert.Visible = False
      NavigatorButtons.Delete.Enabled = False
      NavigatorButtons.Delete.Visible = False
      NavigatorButtons.Edit.Visible = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsRaces
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.PostponedSynchronization = False
      OptionsCustomize.ColumnHiding = True
      OptionsCustomize.ColumnsQuickCustomization = True
      OptionsCustomize.DataRowSizing = True
      OptionsCustomize.GroupBySorting = True
      OptionsCustomize.GroupRowSizing = True
      OptionsView.Navigator = True
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.Indicator = True
      object tvRacesTrkCode: TcxGridDBColumn
        Caption = 'Track'
        DataBinding.FieldName = 'TrkCode'
        Width = 42
      end
      object tvRacesRaceDate: TcxGridDBColumn
        DataBinding.FieldName = 'RaceDate'
      end
      object tvRacesRaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'RaceNbr'
        Width = 81
      end
      object tvRacesIsTSNProcessed: TcxGridDBColumn
        Caption = 'TSNProcessed'
        DataBinding.FieldName = 'IsTSNProcessed'
        Width = 81
      end
      object tvRacesSurface: TcxGridDBColumn
        DataBinding.FieldName = 'Surface'
      end
      object tvRacesTopEarlyPace: TcxGridDBColumn
        DataBinding.FieldName = 'TopEarlyPace'
      end
      object tvRacesTopMiddlePace: TcxGridDBColumn
        DataBinding.FieldName = 'TopMiddlePace'
      end
      object tvRacesTopLatePace: TcxGridDBColumn
        DataBinding.FieldName = 'TopLatePace'
      end
      object tvRacesTopEarlyPacePos: TcxGridDBColumn
        DataBinding.FieldName = 'TopEarlyPacePos'
      end
      object tvRacesTopMiddlePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'TopMiddlePacePos'
      end
      object tvRacesTopLatePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'TopLatePacePos'
      end
      object tvRacesSecondEarlyPace: TcxGridDBColumn
        DataBinding.FieldName = 'SecondEarlyPace'
      end
      object tvRacesSecondMiddlePace: TcxGridDBColumn
        DataBinding.FieldName = 'SecondMiddlePace'
      end
      object tvRacesSecondLatePace: TcxGridDBColumn
        DataBinding.FieldName = 'SecondLatePace'
      end
      object tvRacesSecondEarlyPacePos: TcxGridDBColumn
        DataBinding.FieldName = 'SecondEarlyPacePos'
      end
      object tvRacesSecondMiddlePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'SecondMiddlePacePos'
      end
      object tvRacesSecondLatePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'SecondLatePacePos'
      end
      object tvRacesDistanceInFeet: TcxGridDBColumn
        DataBinding.FieldName = 'DistanceInFeet'
      end
      object tvRacesDistanceInYards: TcxGridDBColumn
        DataBinding.FieldName = 'DistanceInYards'
      end
      object tvRacesDistanceInFurlongs: TcxGridDBColumn
        DataBinding.FieldName = 'DistanceInFurlongs'
        Width = 194
      end
      object tvRacesDistanceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'DistanceDesc'
      end
      object tvRacesRaceType: TcxGridDBColumn
        DataBinding.FieldName = 'RaceType'
      end
      object tvRacesTypeOfRace: TcxGridDBColumn
        DataBinding.FieldName = 'TypeOfRace'
      end
      object tvRacesRaceTypeDesc: TcxGridDBColumn
        DataBinding.FieldName = 'RaceTypeDesc'
      end
      object tvRacesRaceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'RaceDesc'
      end
      object tvRacesRaceCondition: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition'
      end
      object tvRacesIsTurfRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsTurfRace'
      end
      object tvRacesIsRouteRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsRouteRace'
      end
      object tvRacesIsMaidenSpecialRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsMaidenSpecialRace'
      end
      object tvRacesIsMaidenClaimingRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsMaidenClaimingRace'
      end
      object tvRacesIsMaidenOrTurfRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsMaidenOrTurfRace'
      end
      object tvRacesIsTwoYearOldRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsTwoYearOldRace'
      end
      object tvRacesIsClaimingRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsClaimingRace'
      end
      object tvRacesAgeSexRestriction: TcxGridDBColumn
        DataBinding.FieldName = 'AgeSexRestriction'
      end
      object tvRacesPurse: TcxGridDBColumn
        DataBinding.FieldName = 'Purse'
      end
      object tvRacesClaimingPrice: TcxGridDBColumn
        DataBinding.FieldName = 'ClaimingPrice'
      end
      object tvRacesSimulcastTrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'SimulcastTrkCode'
      end
      object tvRacesSimulcastRaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'SimulcastRaceNbr'
      end
      object tvRacesEstTimeOfRace: TcxGridDBColumn
        DataBinding.FieldName = 'EstTimeOfRace'
      end
      object tvRacesLocalTimeOfRace: TcxGridDBColumn
        DataBinding.FieldName = 'LocalTimeOfRace'
      end
      object tvRacesEstTimeOfFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'EstTimeOfFirstRace'
      end
      object tvRacesRaceAutoInc: TcxGridDBColumn
        DataBinding.FieldName = 'RaceAutoInc'
      end
      object tvRacesTimeDiff: TcxGridDBColumn
        DataBinding.FieldName = 'TimeDiff'
      end
      object tvRacesWagerType: TcxGridDBColumn
        DataBinding.FieldName = 'WagerType'
      end
      object tvRacesIsDDRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsDDRace'
      end
      object tvRacesDDRaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'DDRaceNbr'
      end
      object tvRacesIsPk3Race: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk3Race'
      end
      object tvRacesIs10CentSuperfectaRace: TcxGridDBColumn
        Caption = '.10 Super'
        DataBinding.FieldName = 'Is10CentSuperfectaRace'
        Width = 83
      end
      object tvRacesPk3RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'Pk3RaceNbr'
      end
      object tvRacesIsPk4Race: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk4Race'
      end
      object tvRacesPk4RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'Pk4RaceNbr'
      end
      object tvRacesIsPk6Race: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk6Race'
      end
      object tvRacesPK6RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'PK6RaceNbr'
      end
      object tvRacesIsTriRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsTriRace'
      end
      object tvRacesIsSuperRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperRace'
      end
      object tvRacesIsQuiRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsQuiRace'
      end
      object tvRacesIsExaRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsExaRace'
      end
      object tvRacesNbrTriKey: TcxGridDBColumn
        DataBinding.FieldName = 'NbrTriKey'
      end
      object tvRacesIsPk3Leg1: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk3Leg1'
      end
      object tvRacesIsPk4Leg1: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk4Leg1'
      end
      object tvRacesIsPk6Leg1: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk6Leg1'
      end
      object tvRacesIsPk9Leg1: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk9Leg1'
      end
      object tvRacesIsDDLeg1: TcxGridDBColumn
        DataBinding.FieldName = 'IsDDLeg1'
      end
      object tvRacesIsChalkValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsChalkValue'
      end
      object tvRacesIsPlayableValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsPlayableValue'
      end
      object tvRacesIsFinalValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsFinalValue'
      end
      object tvRacesTotalPk3Choices: TcxGridDBColumn
        DataBinding.FieldName = 'TotalPk3Choices'
      end
      object tvRacesPk3KeyType: TcxGridDBColumn
        DataBinding.FieldName = 'Pk3KeyType'
      end
      object tvRacesPk3Selected: TcxGridDBColumn
        DataBinding.FieldName = 'Pk3Selected'
      end
      object tvRacesTotalTriChoices: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTriChoices'
      end
      object tvRacesTotalSuperChoices: TcxGridDBColumn
        DataBinding.FieldName = 'TotalSuperChoices'
      end
      object tvRacesTotalDDChoices: TcxGridDBColumn
        DataBinding.FieldName = 'TotalDDChoices'
      end
      object tvRacesTopLastSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'TopLastSpeed'
      end
      object tvRacesTopBackSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'TopBackSpeed'
      end
      object tvRacesTopBackClass: TcxGridDBColumn
        DataBinding.FieldName = 'TopBackClass'
      end
      object tvRacesTopLastClass: TcxGridDBColumn
        DataBinding.FieldName = 'TopLastClass'
      end
      object tvRacesAltWager1: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager1'
      end
      object tvRacesAltWager2: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager2'
      end
      object tvRacesAltWager3: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager3'
      end
      object tvRacesAltWager4: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager4'
      end
      object tvRacesAltWager5: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager5'
      end
      object tvRacesAltWager6: TcxGridDBColumn
        DataBinding.FieldName = 'AltWager6'
      end
      object tvRacesWager1: TcxGridDBColumn
        DataBinding.FieldName = 'Wager1'
      end
      object tvRacesWager2: TcxGridDBColumn
        DataBinding.FieldName = 'Wager2'
      end
      object tvRacesWager3: TcxGridDBColumn
        DataBinding.FieldName = 'Wager3'
      end
      object tvRacesWager4: TcxGridDBColumn
        DataBinding.FieldName = 'Wager4'
      end
      object tvRacesWager5: TcxGridDBColumn
        DataBinding.FieldName = 'Wager5'
      end
      object tvRacesWager6: TcxGridDBColumn
        DataBinding.FieldName = 'Wager6'
      end
      object tvRacesWagerFinalOrder: TcxGridDBColumn
        DataBinding.FieldName = 'WagerFinalOrder'
      end
      object tvRacesWagerSheetOrder: TcxGridDBColumn
        DataBinding.FieldName = 'WagerSheetOrder'
      end
      object tvRacesTodaysWagerOrder: TcxGridDBColumn
        DataBinding.FieldName = 'TodaysWagerOrder'
      end
      object tvRacesChalk: TcxGridDBColumn
        DataBinding.FieldName = 'Chalk'
      end
      object tvRacesValue: TcxGridDBColumn
        DataBinding.FieldName = 'Value'
      end
      object tvRacesTri: TcxGridDBColumn
        DataBinding.FieldName = 'Tri'
      end
      object tvRacesDD: TcxGridDBColumn
        DataBinding.FieldName = 'DD'
      end
      object tvRacesSuper: TcxGridDBColumn
        DataBinding.FieldName = 'Super'
      end
      object tvRacesExacta: TcxGridDBColumn
        DataBinding.FieldName = 'Exacta'
      end
      object tvRacesQuinella: TcxGridDBColumn
        DataBinding.FieldName = 'Quinella'
      end
      object tvRacesPick3: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3'
      end
      object tvRacesPick4: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4'
      end
      object tvRacesPick6: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6'
      end
      object tvRacesParTime: TcxGridDBColumn
        DataBinding.FieldName = 'ParTime'
      end
      object tvRacesIsCreateAngle: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateAngle'
      end
      object tvRacesIsCreateValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateValue'
      end
      object tvRacesIsCreateTip: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateTip'
      end
      object tvRacesIsCreatePk3: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreatePk3'
      end
      object tvRacesIsCreateDetail: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateDetail'
      end
      object tvRacesIsCreateAlt: TcxGridDBColumn
        DataBinding.FieldName = 'IsCreateAlt'
      end
      object tvRacesIsPrintedOnValueSheet: TcxGridDBColumn
        DataBinding.FieldName = 'IsPrintedOnValueSheet'
      end
      object tvRacesIsLinerSheetSelected: TcxGridDBColumn
        DataBinding.FieldName = 'IsLinerSheetSelected'
      end
      object tvRacesIsOverlaySheetSelected: TcxGridDBColumn
        DataBinding.FieldName = 'IsOverlaySheetSelected'
      end
      object tvRacesIsWagerSheetSelected: TcxGridDBColumn
        DataBinding.FieldName = 'IsWagerSheetSelected'
      end
      object tvRacesIsYoubetTrack: TcxGridDBColumn
        DataBinding.FieldName = 'IsYoubetTrack'
      end
      object tvRacesRacePicks: TcxGridDBColumn
        DataBinding.FieldName = 'RacePicks'
      end
      object tvRacesIsRacePicksAvailable: TcxGridDBColumn
        DataBinding.FieldName = 'IsRacePicksAvailable'
      end
      object tvRacesWPSWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'WPSWagerAmt'
      end
      object tvRacesSfcWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'SfcWagerAmt'
      end
      object tvRacesTriWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'TriWagerAmt'
      end
      object tvRacesExaWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'ExaWagerAmt'
      end
      object tvRacesQuiWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'QuiWagerAmt'
      end
      object tvRacesDDWagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'DDWagerAmt'
      end
      object tvRacesPk3WagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'Pk3WagerAmt'
      end
      object tvRacesPk4WagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'Pk4WagerAmt'
      end
      object tvRacesPk6WagerAmt: TcxGridDBColumn
        DataBinding.FieldName = 'Pk6WagerAmt'
      end
      object tvRacesTotalMorningLineTo1Probability: TcxGridDBColumn
        DataBinding.FieldName = 'TotalMorningLineTo1Probability'
      end
      object tvRacesTotalFinalLineTo1Probability: TcxGridDBColumn
        DataBinding.FieldName = 'TotalFinalLineTo1Probability'
      end
      object tvRacesMaxWPSBet: TcxGridDBColumn
        DataBinding.FieldName = 'MaxWPSBet'
      end
      object tvRacesMaxGimmickBet: TcxGridDBColumn
        DataBinding.FieldName = 'MaxGimmickBet'
      end
      object tvRacesNbrStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrStarters'
      end
      object tvRacesNbrDebutStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrDebutStarters'
      end
      object tvRacesNbrDebutTwoStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrDebutTwoStarters'
      end
      object tvRacesNbrTurfDebutStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrTurfDebutStarters'
      end
      object tvRacesNbrRouteDebutStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrRouteDebutStarters'
      end
      object tvRacesNbrScratchedStarters: TcxGridDBColumn
        DataBinding.FieldName = 'NbrScratchedStarters'
      end
      object tvRacesNbrRunners: TcxGridDBColumn
        DataBinding.FieldName = 'NbrRunners'
      end
      object tvRacesIsEquibaseChartsProcessed: TcxGridDBColumn
        DataBinding.FieldName = 'IsEquibaseChartsProcessed'
      end
      object tvRacesIsDRFChartsProcessed: TcxGridDBColumn
        DataBinding.FieldName = 'IsDRFChartsProcessed'
      end
      object tvRacesOrigSurface: TcxGridDBColumn
        DataBinding.FieldName = 'OrigSurface'
      end
      object tvRacesIsPk9Place: TcxGridDBColumn
        DataBinding.FieldName = 'IsPk9Place'
      end
      object tvRacesPk9RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'Pk9RaceNbr'
      end
      object tvRacesRaceCondition1: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition1'
      end
      object tvRacesRaceCondition2: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition2'
      end
      object tvRacesRaceCondition3: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition3'
      end
      object tvRacesRaceCondition4: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition4'
      end
      object tvRacesRaceCondition5: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition5'
      end
      object tvRacesRaceCondition6: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition6'
      end
      object tvRacesRaceCondition7: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition7'
      end
      object tvRacesRaceCondition8: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition8'
      end
      object tvRacesRaceCondition9: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition9'
      end
      object tvRacesRaceCondition10: TcxGridDBColumn
        DataBinding.FieldName = 'RaceCondition10'
      end
      object tvRacesBetLine: TcxGridDBColumn
        DataBinding.FieldName = 'BetLine'
      end
      object tvRacesRaceConditions: TcxGridDBColumn
        DataBinding.FieldName = 'RaceConditions'
      end
      object tvRacesTrkCond: TcxGridDBColumn
        DataBinding.FieldName = 'TrkCond'
      end
      object tvRacesOrigDistanceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'OrigDistanceDesc'
      end
      object tvRacesIsPPValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsPPValue'
      end
      object tvRacesIsMLValue: TcxGridDBColumn
        DataBinding.FieldName = 'IsMLValue'
      end
      object tvRacesFootNotes: TcxGridDBColumn
        DataBinding.FieldName = 'FootNotes'
      end
      object tvRacesTrainers: TcxGridDBColumn
        DataBinding.FieldName = 'Trainers'
      end
      object tvRacesOwners: TcxGridDBColumn
        DataBinding.FieldName = 'Owners'
      end
      object tvRacesScratchedHorses: TcxGridDBColumn
        DataBinding.FieldName = 'ScratchedHorses'
      end
      object tvRacesFractionalTimes: TcxGridDBColumn
        DataBinding.FieldName = 'FractionalTimes'
      end
      object tvRacesIsExactaMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsExactaMatched'
      end
      object tvRacesExactaNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'ExactaNbrs'
      end
      object tvRacesExactaWager: TcxGridDBColumn
        DataBinding.FieldName = 'ExactaWager'
      end
      object tvRacesExactaPayout: TcxGridDBColumn
        DataBinding.FieldName = 'ExactaPayout'
      end
      object tvRacesIsTrifectaMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsTrifectaMatched'
      end
      object tvRacesTrifectaNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'TrifectaNbrs'
      end
      object tvRacesTrifectaWager: TcxGridDBColumn
        DataBinding.FieldName = 'TrifectaWager'
      end
      object tvRacesTrifectaPayout: TcxGridDBColumn
        DataBinding.FieldName = 'TrifectaPayout'
      end
      object tvRacesIsSuperfectaMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperfectaMatched'
      end
      object tvRacesSuperfectaNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'SuperfectaNbrs'
      end
      object tvRacesSuperfectaWager: TcxGridDBColumn
        DataBinding.FieldName = 'SuperfectaWager'
      end
      object tvRacesSuperfectaPayout: TcxGridDBColumn
        DataBinding.FieldName = 'SuperfectaPayout'
      end
      object tvRacesIsDailyDoubleMatchedFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsDailyDoubleMatchedFirstRace'
      end
      object tvRacesIsDailyDoubleMatchedLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsDailyDoubleMatchedLastRace'
      end
      object tvRacesDDFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'DDFirstRace'
      end
      object tvRacesDDLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'DDLastRace'
      end
      object tvRacesDailyDoubleNbrsFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoubleNbrsFirstRace'
      end
      object tvRacesDailyDoubleNbrsLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoubleNbrsLastRace'
      end
      object tvRacesDailyDoubleWagerFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoubleWagerFirstRace'
      end
      object tvRacesDailyDoubleWagerLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoubleWagerLastRace'
      end
      object tvRacesDailyDoublePayoutFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoublePayoutFirstRace'
      end
      object tvRacesDailyDoublePayoutLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'DailyDoublePayoutLastRace'
      end
      object tvRacesIsQuinellaMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsQuinellaMatched'
      end
      object tvRacesQuinellaNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'QuinellaNbrs'
      end
      object tvRacesQuinellaWager: TcxGridDBColumn
        DataBinding.FieldName = 'QuinellaWager'
      end
      object tvRacesQuinellaPayout: TcxGridDBColumn
        DataBinding.FieldName = 'QuinellaPayout'
      end
      object tvRacesIsPick3MatchedFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick3MatchedFirstRace'
      end
      object tvRacesIsPick3MatchedLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick3MatchedLastRace'
      end
      object tvRacesPick3FirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3FirstRace'
      end
      object tvRacesPick3LastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3LastRace'
      end
      object tvRacesPick3NbrsFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3NbrsFirstRace'
      end
      object tvRacesPick3NbrsLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3NbrsLastRace'
      end
      object tvRacesPick3WagerFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3WagerFirstRace'
      end
      object tvRacesPick3WagerLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3WagerLastRace'
      end
      object tvRacesPick3PayoutFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3PayoutFirstRace'
      end
      object tvRacesPick3PayoutLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3PayoutLastRace'
      end
      object tvRacesPick3NbrsLeg1: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3NbrsLeg1'
      end
      object tvRacesPick3NbrsLeg2: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3NbrsLeg2'
      end
      object tvRacesPick3NbrsLeg3: TcxGridDBColumn
        DataBinding.FieldName = 'Pick3NbrsLeg3'
      end
      object tvRacesIsPick4MatchedFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick4MatchedFirstRace'
      end
      object tvRacesIsPick4MatchedLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick4MatchedLastRace'
      end
      object tvRacesPick4FirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4FirstRace'
      end
      object tvRacesPick4LastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4LastRace'
      end
      object tvRacesPick4NbrsFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsFirstRace'
      end
      object tvRacesPick4NbrsLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsLastRace'
      end
      object tvRacesPick4WagerFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4WagerFirstRace'
      end
      object tvRacesPick4WagerLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4WagerLastRace'
      end
      object tvRacesPick4PayoutFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4PayoutFirstRace'
      end
      object tvRacesPick4PayoutLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4PayoutLastRace'
      end
      object tvRacesPick4NbrsLeg1: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsLeg1'
      end
      object tvRacesPick4NbrsLeg2: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsLeg2'
      end
      object tvRacesPick4NbrsLeg3: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsLeg3'
      end
      object tvRacesPick4NbrsLeg4: TcxGridDBColumn
        DataBinding.FieldName = 'Pick4NbrsLeg4'
      end
      object tvRacesIsPick6MatchedFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick6MatchedFirstRace'
      end
      object tvRacesIsPick6MatchedLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'IsPick6MatchedLastRace'
      end
      object tvRacesPick6FirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6FirstRace'
      end
      object tvRacesPick6LastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6LastRace'
      end
      object tvRacesPick6NbrsFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6NbrsFirstRace'
      end
      object tvRacesPick6NbrsLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6NbrsLastRace'
      end
      object tvRacesPick6WagerFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6WagerFirstRace'
      end
      object tvRacesPick6WagerLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6WagerLastRace'
      end
      object tvRacesPick6PayoutFirstRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6PayoutFirstRace'
      end
      object tvRacesPick6PayoutLastRace: TcxGridDBColumn
        DataBinding.FieldName = 'Pick6PayoutLastRace'
      end
      object tvRacesIsWinMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsWinMatched'
      end
      object tvRacesWinNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'WinNbrs'
      end
      object tvRacesWinPayout: TcxGridDBColumn
        DataBinding.FieldName = 'WinPayout'
      end
      object tvRacesWinPlcPayout: TcxGridDBColumn
        DataBinding.FieldName = 'WinPlcPayout'
      end
      object tvRacesWinShoPayout: TcxGridDBColumn
        DataBinding.FieldName = 'WinShoPayout'
      end
      object tvRacesIsPlcMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsPlcMatched'
      end
      object tvRacesPlcNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'PlcNbrs'
      end
      object tvRacesPlcPayout: TcxGridDBColumn
        DataBinding.FieldName = 'PlcPayout'
      end
      object tvRacesPlcShoPayout: TcxGridDBColumn
        DataBinding.FieldName = 'PlcShoPayout'
      end
      object tvRacesIsShoMatched: TcxGridDBColumn
        DataBinding.FieldName = 'IsShoMatched'
      end
      object tvRacesShoNbrs: TcxGridDBColumn
        DataBinding.FieldName = 'ShoNbrs'
      end
      object tvRacesShoPayout: TcxGridDBColumn
        DataBinding.FieldName = 'ShoPayout'
      end
      object tvRacesWeather: TcxGridDBColumn
        DataBinding.FieldName = 'Weather'
      end
      object tvRacesTopLastSRWinner: TcxGridDBColumn
        DataBinding.FieldName = 'TopLastSRWinner'
      end
      object tvRacesRaceShape: TcxGridDBColumn
        DataBinding.FieldName = 'RaceShape'
      end
      object tvRacesPostTimes: TcxGridDBColumn
        DataBinding.FieldName = 'PostTimes'
      end
      object tvRacesWagerTypes: TcxGridDBColumn
        DataBinding.FieldName = 'WagerTypes'
      end
      object tvRacesIs50CentTrifectaRace: TcxGridDBColumn
        DataBinding.FieldName = 'Is50CentTrifectaRace'
      end
      object tvRacesIs50CentPk3Race: TcxGridDBColumn
        DataBinding.FieldName = 'Is50CentPk3Race'
      end
      object tvRacesIs50CentPk4Race: TcxGridDBColumn
        DataBinding.FieldName = 'Is50CentPk4Race'
      end
      object tvRacesTotalFinalProbability: TcxGridDBColumn
        DataBinding.FieldName = 'TotalFinalProbability'
      end
      object tvRacesTotalMorningLineProbability: TcxGridDBColumn
        DataBinding.FieldName = 'TotalMorningLineProbability'
      end
      object tvRacesNormalTotalMorningLineProbabilitySquared: TcxGridDBColumn
        DataBinding.FieldName = 'NormalTotalMorningLineProbabilitySquared'
      end
      object tvRacesTotalTodaysWagerProbability: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTodaysWagerProbability'
      end
      object tvRacesNormalTotalTodaysWagerProbabilitySquared: TcxGridDBColumn
        DataBinding.FieldName = 'NormalTotalTodaysWagerProbabilitySquared'
      end
      object tvRacesTotalClassRating: TcxGridDBColumn
        DataBinding.FieldName = 'TotalClassRating'
      end
      object tvRacesTotalTurfRating: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTurfRating'
      end
      object tvRacesTotalMudRating: TcxGridDBColumn
        DataBinding.FieldName = 'TotalMudRating'
      end
      object tvRacesTotalPoints: TcxGridDBColumn
        DataBinding.FieldName = 'TotalPoints'
      end
    end
    object lvRace: TcxGridLevel
      GridView = tvRaces
    end
  end
  object cxGrid2: TcxGrid
    Left = 0
    Top = 281
    Width = 1436
    Height = 533
    Align = alClient
    TabOrder = 0
    RootLevelOptions.DetailTabsPosition = dtpLeft
    RootLevelStyles.TabsBackground = MainForm.cxStyle102
    object tvGeneral: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataModeController.GridMode = True
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Navigator = True
      object tvGeneralPostPos: TcxGridDBColumn
        DataBinding.FieldName = 'PostPos'
      end
      object tvGeneralProgramNbr: TcxGridDBColumn
        DataBinding.FieldName = 'ProgramNbr'
      end
      object tvGeneralHorseName: TcxGridDBColumn
        DataBinding.FieldName = 'HorseName'
        Width = 141
      end
      object tvGeneralColumn1: TcxGridDBColumn
        Caption = 'D'
        DataBinding.FieldName = 'DebutIndicator'
        Width = 35
      end
      object tvGeneralColumn2: TcxGridDBColumn
        Caption = 'T'
        DataBinding.FieldName = 'TurfIndicator'
        Width = 31
      end
      object tvGeneralColumn3: TcxGridDBColumn
        Caption = 'R'
        DataBinding.FieldName = 'RouteIndicator'
        Width = 33
      end
      object tvGeneralColumn4: TcxGridDBColumn
        Caption = 'M'
        DataBinding.FieldName = 'MudIndicator'
        Width = 33
      end
      object tvGeneralMed: TcxGridDBColumn
        DataBinding.FieldName = 'Med'
      end
      object tvGeneralAge: TcxGridDBColumn
        DataBinding.FieldName = 'Age'
      end
      object tvGeneralSex: TcxGridDBColumn
        DataBinding.FieldName = 'Sex'
      end
      object tvGeneralColor: TcxGridDBColumn
        DataBinding.FieldName = 'Color'
      end
      object tvGeneralWeight: TcxGridDBColumn
        DataBinding.FieldName = 'Weight'
      end
      object tvGeneralMorningLineDesc: TcxGridDBColumn
        DataBinding.FieldName = 'MorningLineDesc'
      end
      object tvGeneralTrainer: TcxGridDBColumn
        DataBinding.FieldName = 'Trainer'
      end
      object tvGeneralJockey: TcxGridDBColumn
        DataBinding.FieldName = 'Jockey'
      end
      object tvGeneralOwner: TcxGridDBColumn
        DataBinding.FieldName = 'Owner'
      end
      object tvGeneralBreeder: TcxGridDBColumn
        DataBinding.FieldName = 'Breeder'
      end
    end
    object tvTodaysWager: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object tvTodaysWagerTodaysWagerOrderKey: TcxGridDBColumn
        Caption = 'Key'
        DataBinding.FieldName = 'TodaysWagerOrderKey'
        Width = 177
      end
      object tvTodaysWagerTodaysWagerStarts: TcxGridDBColumn
        Caption = 'Starts'
        DataBinding.FieldName = 'TodaysWagerStarts'
      end
      object tvTodaysWagerTodaysWagerWinPct: TcxGridDBColumn
        Caption = 'WinPct'
        DataBinding.FieldName = 'TodaysWagerWinPct'
      end
      object tvTodaysWagerColumn15: TcxGridDBColumn
        Caption = 'MyOdds'
        DataBinding.FieldName = 'TodaysWagerOddsDesc'
      end
      object tvTodaysWagerColumn12: TcxGridDBColumn
        Caption = 'EP'
        DataBinding.FieldName = 'EarlyPace'
      end
      object tvTodaysWagerColumn7: TcxGridDBColumn
        Caption = 'EPA %'
        DataBinding.FieldName = 'EarlyPaceAdvantageWinPct'
      end
      object tvTodaysWagerColumn6: TcxGridDBColumn
        Caption = 'EPA'
        DataBinding.FieldName = 'EarlyPaceAdvantage'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '##.##'
      end
      object tvTodaysWagerColumn13: TcxGridDBColumn
        Caption = 'MP'
        DataBinding.FieldName = 'MiddlePace'
      end
      object tvTodaysWagerColumn4: TcxGridDBColumn
        Caption = 'MPA'
        DataBinding.FieldName = 'MiddlePaceAdvantage'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '##.##'
        Width = 64
      end
      object tvTodaysWagerColumn5: TcxGridDBColumn
        Caption = 'MPA %'
        DataBinding.FieldName = 'MiddlePaceAdvantageWinPct'
        Width = 54
      end
      object tvTodaysWagerColumn14: TcxGridDBColumn
        DataBinding.FieldName = 'LatePace'
      end
      object tvTodaysWagerColumn8: TcxGridDBColumn
        Caption = 'LPA'
        DataBinding.FieldName = 'LatePaceAdvantage'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '##.##'
      end
      object tvTodaysWagerColumn9: TcxGridDBColumn
        Caption = 'LPA %'
        DataBinding.FieldName = 'LatePaceAdvantageWinPct'
      end
      object tvTodaysWagerColumn10: TcxGridDBColumn
        Caption = 'PA'
        DataBinding.FieldName = 'PowerAdvantage'
        PropertiesClassName = 'TcxMaskEditProperties'
        Properties.EditMask = '##.##'
      end
      object tvTodaysWagerColumn11: TcxGridDBColumn
        Caption = 'PA %'
        DataBinding.FieldName = 'PowerAdvantageWinPct'
      end
      object tvTodaysWagerColumn16: TcxGridDBColumn
        Caption = 'E2'
        DataBinding.FieldName = 'Elim2WinPct'
      end
      object tvTodaysWagerColumn17: TcxGridDBColumn
        Caption = 'E1'
        DataBinding.FieldName = 'ElimWinPct'
      end
      object tvTodaysWagerTodaysWagerWinPctRank: TcxGridDBColumn
        Caption = 'Rank'
        DataBinding.FieldName = 'TodaysWagerWinPctRank'
      end
      object tvTodaysWagerTodaysWagerValueBet: TcxGridDBColumn
        Caption = 'Value'
        DataBinding.FieldName = 'TodaysWagerValueBet'
      end
      object tvTodaysWagerTodaysWagerAvgOdds: TcxGridDBColumn
        Caption = 'AvgOdds'
        DataBinding.FieldName = 'TodaysWagerAvgOdds'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '###.00'
        Properties.Precision = 15
        Width = 95
      end
      object tvTodaysWagerColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'ValueROI'
      end
      object tvTodaysWagerColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'ValueROICnt'
      end
      object tvTodaysWagerColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'DollarCnt'
      end
      object tvTodaysWagerTodaysWagerAvgWinOdds: TcxGridDBColumn
        Caption = 'AvgWinOdds'
        DataBinding.FieldName = 'TodaysWagerAvgWinOdds'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.DisplayFormat = '###.00'
      end
      object tvTodaysWagerTodaysWagerMinOdds: TcxGridDBColumn
        Caption = 'MinOdds'
        DataBinding.FieldName = 'TodaysWagerMinOdds'
        Width = 83
      end
      object tvTodaysWagerTodaysWagerMaxOdds: TcxGridDBColumn
        Caption = 'MaxOdds'
        DataBinding.FieldName = 'TodaysWagerMaxOdds'
        Width = 78
      end
      object tvTodaysWagerTodaysWagerMinWinOdds: TcxGridDBColumn
        Caption = 'MinWinOdds'
        DataBinding.FieldName = 'TodaysWagerMinWinOdds'
        Width = 85
      end
      object tvTodaysWagerTodaysWagerMaxWinOdds: TcxGridDBColumn
        Caption = 'MaxWinOdds'
        DataBinding.FieldName = 'TodaysWagerMaxWinOdds'
        Width = 98
      end
      object TcxGridDBColumn
      end
      object TcxGridDBColumn
      end
    end
    object cxGrid2DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView1BredIn: TcxGridDBColumn
        DataBinding.FieldName = 'BredIn'
      end
      object cxGrid2DBTableView1Sire: TcxGridDBColumn
        DataBinding.FieldName = 'Sire'
      end
      object cxGrid2DBTableView1SireTurfLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfLastYearRank'
        Width = 103
      end
      object cxGrid2DBTableView1SireTurfLastYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfLastYearStarts'
        Width = 49
      end
      object cxGrid2DBTableView1SireTurfLastYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfLastYearPctOfEarnings'
      end
      object cxGrid2DBTableView1SireGeneralLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireGeneralLastYearRank'
      end
      object cxGrid2DBTableView1SireGeneralLastYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'SireGeneralLastYearStudFee'
      end
      object cxGrid2DBTableView1SireJuvenileLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireJuvenileLastYearRank'
      end
      object cxGrid2DBTableView1SireJuvenileThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireJuvenileThisYearRank'
      end
      object cxGrid2DBTableView1SireTurfThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfThisYearRank'
      end
      object cxGrid2DBTableView1SireTurfThisYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfThisYearStarts'
      end
      object cxGrid2DBTableView1SireTurfThisYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'SireTurfThisYearPctOfEarnings'
      end
      object cxGrid2DBTableView1SireGeneralThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'SireGeneralThisYearRank'
      end
      object cxGrid2DBTableView1SireGeneralThisYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'SireGeneralThisYearStudFee'
      end
    end
    object cxGrid2DBTableView2: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView2DaysLast: TcxGridDBColumn
        DataBinding.FieldName = 'DaysLast'
      end
      object cxGrid2DBTableView2DaysLastWork: TcxGridDBColumn
        DataBinding.FieldName = 'DaysLastWork'
      end
      object cxGrid2DBTableView2LastTrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'LastTrkCode'
      end
      object cxGrid2DBTableView2LastRaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'LastRaceNbr'
      end
      object cxGrid2DBTableView2LastRaceDate: TcxGridDBColumn
        DataBinding.FieldName = 'LastRaceDate'
      end
      object cxGrid2DBTableView2LastPostPos: TcxGridDBColumn
        DataBinding.FieldName = 'LastPostPos'
      end
      object cxGrid2DBTableView2LastRaceType: TcxGridDBColumn
        DataBinding.FieldName = 'LastRaceType'
      end
      object cxGrid2DBTableView2LastSurf: TcxGridDBColumn
        DataBinding.FieldName = 'LastSurf'
      end
      object cxGrid2DBTableView2LastRaceConditions: TcxGridDBColumn
        DataBinding.FieldName = 'LastRaceConditions'
      end
      object cxGrid2DBTableView2LastDistanceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'LastDistanceDesc'
      end
      object cxGrid2DBTableView2LastDistance: TcxGridDBColumn
        DataBinding.FieldName = 'LastDistance'
      end
      object cxGrid2DBTableView2LastOdds: TcxGridDBColumn
        DataBinding.FieldName = 'LastOdds'
      end
      object cxGrid2DBTableView2LastFavoriteIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'LastFavoriteIndicator'
      end
      object cxGrid2DBTableView2LastDQIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'LastDQIndicator'
      end
      object cxGrid2DBTableView2LastJockey: TcxGridDBColumn
        DataBinding.FieldName = 'LastJockey'
      end
      object cxGrid2DBTableView2LastComment: TcxGridDBColumn
        DataBinding.FieldName = 'LastComment'
      end
      object cxGrid2DBTableView2LastComment2: TcxGridDBColumn
        DataBinding.FieldName = 'LastComment2'
      end
      object cxGrid2DBTableView2LastTrkCond: TcxGridDBColumn
        DataBinding.FieldName = 'LastTrkCond'
      end
      object cxGrid2DBTableView2LastClmPrice: TcxGridDBColumn
        DataBinding.FieldName = 'LastClmPrice'
      end
      object cxGrid2DBTableView2LastClaimed: TcxGridDBColumn
        DataBinding.FieldName = 'LastClaimed'
      end
      object cxGrid2DBTableView2LastPurse: TcxGridDBColumn
        DataBinding.FieldName = 'LastPurse'
      end
      object cxGrid2DBTableView2LastDay: TcxGridDBColumn
        DataBinding.FieldName = 'LastDay'
      end
      object cxGrid2DBTableView2LastMonthDesc: TcxGridDBColumn
        DataBinding.FieldName = 'LastMonthDesc'
      end
      object cxGrid2DBTableView2LastYear: TcxGridDBColumn
        DataBinding.FieldName = 'LastYear'
      end
      object cxGrid2DBTableView2LastGateBreak: TcxGridDBColumn
        DataBinding.FieldName = 'LastGateBreak'
      end
      object cxGrid2DBTableView2LastLen1Back: TcxGridDBColumn
        DataBinding.FieldName = 'LastLen1Back'
      end
      object cxGrid2DBTableView2LastLen2Back: TcxGridDBColumn
        DataBinding.FieldName = 'LastLen2Back'
      end
      object cxGrid2DBTableView2LastStLenBack: TcxGridDBColumn
        DataBinding.FieldName = 'LastStLenBack'
      end
      object cxGrid2DBTableView2LastFinishBeaten: TcxGridDBColumn
        DataBinding.FieldName = 'LastFinishBeaten'
      end
      object cxGrid2DBTableView2LastEquip: TcxGridDBColumn
        DataBinding.FieldName = 'LastEquip'
      end
      object cxGrid2DBTableView2LastWeight: TcxGridDBColumn
        DataBinding.FieldName = 'LastWeight'
      end
      object cxGrid2DBTableView2LastHorseTime: TcxGridDBColumn
        DataBinding.FieldName = 'LastHorseTime'
      end
      object cxGrid2DBTableView2LastRaceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'LastRaceDesc'
      end
      object cxGrid2DBTableView2LastSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'LastSpeed'
      end
      object cxGrid2DBTableView2LastSpeedRank: TcxGridDBColumn
        DataBinding.FieldName = 'LastSpeedRank'
      end
      object cxGrid2DBTableView2Last2TrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'Last2TrkCode'
      end
      object cxGrid2DBTableView2Last2RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'Last2RaceNbr'
      end
      object cxGrid2DBTableView2Last2RaceDate: TcxGridDBColumn
        DataBinding.FieldName = 'Last2RaceDate'
      end
      object cxGrid2DBTableView2Last2PostPos: TcxGridDBColumn
        DataBinding.FieldName = 'Last2PostPos'
      end
      object cxGrid2DBTableView2Last2RaceType: TcxGridDBColumn
        DataBinding.FieldName = 'Last2RaceType'
      end
      object cxGrid2DBTableView2Last2Surf: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Surf'
      end
      object cxGrid2DBTableView2Last2RaceConditions: TcxGridDBColumn
        DataBinding.FieldName = 'Last2RaceConditions'
      end
      object cxGrid2DBTableView2Last2DistanceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last2DistanceDesc'
      end
      object cxGrid2DBTableView2Last2Distance: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Distance'
      end
      object cxGrid2DBTableView2Last2Odds: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Odds'
      end
      object cxGrid2DBTableView2Last2FavoriteIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'Last2FavoriteIndicator'
      end
      object cxGrid2DBTableView2Last2DQIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'Last2DQIndicator'
      end
      object cxGrid2DBTableView2Last2Jockey: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Jockey'
      end
      object cxGrid2DBTableView2Last2Comment: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Comment'
      end
      object cxGrid2DBTableView2Last2Comment2: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Comment2'
      end
      object cxGrid2DBTableView2Last2TrkCond: TcxGridDBColumn
        DataBinding.FieldName = 'Last2TrkCond'
      end
      object cxGrid2DBTableView2Last2ClmPrice: TcxGridDBColumn
        DataBinding.FieldName = 'Last2ClmPrice'
      end
      object cxGrid2DBTableView2Last2Claimed: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Claimed'
      end
      object cxGrid2DBTableView2Last2Purse: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Purse'
      end
      object cxGrid2DBTableView2Last2Day: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Day'
      end
      object cxGrid2DBTableView2Last2MonthDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last2MonthDesc'
      end
      object cxGrid2DBTableView2Last2Year: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Year'
      end
      object cxGrid2DBTableView2Last2GateBreak: TcxGridDBColumn
        DataBinding.FieldName = 'Last2GateBreak'
      end
      object cxGrid2DBTableView2Last2Len1Back: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Len1Back'
      end
      object cxGrid2DBTableView2Last2Len2Back: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Len2Back'
      end
      object cxGrid2DBTableView2Last2StLenBack: TcxGridDBColumn
        DataBinding.FieldName = 'Last2StLenBack'
      end
      object cxGrid2DBTableView2Last2FinishBeaten: TcxGridDBColumn
        DataBinding.FieldName = 'Last2FinishBeaten'
      end
      object cxGrid2DBTableView2Last2Equip: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Equip'
      end
      object cxGrid2DBTableView2Last2Weight: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Weight'
      end
      object cxGrid2DBTableView2Last2Speed: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Speed'
      end
      object cxGrid2DBTableView2Last2HorseTime: TcxGridDBColumn
        DataBinding.FieldName = 'Last2HorseTime'
      end
      object cxGrid2DBTableView2Last2RaceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last2RaceDesc'
      end
      object cxGrid2DBTableView2Last3TrkCode: TcxGridDBColumn
        DataBinding.FieldName = 'Last3TrkCode'
      end
      object cxGrid2DBTableView2Last3RaceNbr: TcxGridDBColumn
        DataBinding.FieldName = 'Last3RaceNbr'
      end
      object cxGrid2DBTableView2Last3RaceDate: TcxGridDBColumn
        DataBinding.FieldName = 'Last3RaceDate'
      end
      object cxGrid2DBTableView2Last3PostPos: TcxGridDBColumn
        DataBinding.FieldName = 'Last3PostPos'
      end
      object cxGrid2DBTableView2Last3RaceType: TcxGridDBColumn
        DataBinding.FieldName = 'Last3RaceType'
      end
      object cxGrid2DBTableView2Last3Surf: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Surf'
      end
      object cxGrid2DBTableView2Last3RaceConditions: TcxGridDBColumn
        DataBinding.FieldName = 'Last3RaceConditions'
      end
      object cxGrid2DBTableView2Last3DistanceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last3DistanceDesc'
      end
      object cxGrid2DBTableView2Last3Distance: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Distance'
      end
      object cxGrid2DBTableView2Last3Odds: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Odds'
      end
      object cxGrid2DBTableView2Last3FavoriteIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'Last3FavoriteIndicator'
      end
      object cxGrid2DBTableView2Last3DQIndicator: TcxGridDBColumn
        DataBinding.FieldName = 'Last3DQIndicator'
      end
      object cxGrid2DBTableView2Last3Jockey: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Jockey'
      end
      object cxGrid2DBTableView2Last3Comment: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Comment'
      end
      object cxGrid2DBTableView2Last3Comment2: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Comment2'
      end
      object cxGrid2DBTableView2Last3TrkCond: TcxGridDBColumn
        DataBinding.FieldName = 'Last3TrkCond'
      end
      object cxGrid2DBTableView2Last3ClmPrice: TcxGridDBColumn
        DataBinding.FieldName = 'Last3ClmPrice'
      end
      object cxGrid2DBTableView2Last3Claimed: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Claimed'
      end
      object cxGrid2DBTableView2Last3Purse: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Purse'
      end
      object cxGrid2DBTableView2Last3Day: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Day'
      end
      object cxGrid2DBTableView2Last3MonthDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last3MonthDesc'
      end
      object cxGrid2DBTableView2Last3Year: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Year'
      end
      object cxGrid2DBTableView2Last3GateBreak: TcxGridDBColumn
        DataBinding.FieldName = 'Last3GateBreak'
      end
      object cxGrid2DBTableView2Last3Len1Back: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Len1Back'
      end
      object cxGrid2DBTableView2Last3Len2Back: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Len2Back'
      end
      object cxGrid2DBTableView2Last3StLenBack: TcxGridDBColumn
        DataBinding.FieldName = 'Last3StLenBack'
      end
      object cxGrid2DBTableView2Last3FinishBeaten: TcxGridDBColumn
        DataBinding.FieldName = 'Last3FinishBeaten'
      end
      object cxGrid2DBTableView2Last3Equip: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Equip'
      end
      object cxGrid2DBTableView2Last3Weight: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Weight'
      end
      object cxGrid2DBTableView2Last3Speed: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Speed'
      end
      object cxGrid2DBTableView2Last3HorseTime: TcxGridDBColumn
        DataBinding.FieldName = 'Last3HorseTime'
      end
      object cxGrid2DBTableView2Last3RaceDesc: TcxGridDBColumn
        DataBinding.FieldName = 'Last3RaceDesc'
      end
      object cxGrid2DBTableView2Odds: TcxGridDBColumn
        DataBinding.FieldName = 'Odds'
      end
      object cxGrid2DBTableView2FinishPos: TcxGridDBColumn
        DataBinding.FieldName = 'FinishPos'
      end
      object cxGrid2DBTableView2QSP1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'QSP1stCall'
      end
      object cxGrid2DBTableView2QSP1stCallRank: TcxGridDBColumn
        DataBinding.FieldName = 'QSP1stCallRank'
      end
      object cxGrid2DBTableView2QSP1stCallRunStyle: TcxGridDBColumn
        DataBinding.FieldName = 'QSP1stCallRunStyle'
      end
      object cxGrid2DBTableView2QSP2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'QSP2ndCall'
      end
      object cxGrid2DBTableView2QSP2ndCallRank: TcxGridDBColumn
        DataBinding.FieldName = 'QSP2ndCallRank'
      end
      object cxGrid2DBTableView2QSP2ndCallRunStyle: TcxGridDBColumn
        DataBinding.FieldName = 'QSP2ndCallRunStyle'
      end
      object cxGrid2DBTableView2KSP1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'KSP1stCall'
      end
      object cxGrid2DBTableView2KSP1stCallRank: TcxGridDBColumn
        DataBinding.FieldName = 'KSP1stCallRank'
      end
      object cxGrid2DBTableView2KSP2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'KSP2ndCall'
      end
      object cxGrid2DBTableView2KSP2ndCallRank: TcxGridDBColumn
        DataBinding.FieldName = 'KSP2ndCallRank'
      end
      object cxGrid2DBTableView2LastPos1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastPos1stCall'
      end
      object cxGrid2DBTableView2LastPos2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastPos2ndCall'
      end
      object cxGrid2DBTableView2LastPosStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastPosStrCall'
      end
      object cxGrid2DBTableView2Last2Pos1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Pos1stCall'
      end
      object cxGrid2DBTableView2Last2Pos2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Pos2ndCall'
      end
      object cxGrid2DBTableView2Last2PosStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2PosStrCall'
      end
      object cxGrid2DBTableView2Last3Pos1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Pos1stCall'
      end
      object cxGrid2DBTableView2Last3Pos2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Pos2ndCall'
      end
      object cxGrid2DBTableView2Last3PosStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3PosStrCall'
      end
      object cxGrid2DBTableView2LastTime1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastTime1stCall'
      end
      object cxGrid2DBTableView2LastTime2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastTime2ndCall'
      end
      object cxGrid2DBTableView2LastTimeStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastTimeStrCall'
      end
      object cxGrid2DBTableView2LastTimeFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastTimeFinCall'
      end
      object cxGrid2DBTableView2Last2Time1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Time1stCall'
      end
      object cxGrid2DBTableView2Last2Time2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2Time2ndCall'
      end
      object cxGrid2DBTableView2Last2TimeStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2TimeStrCall'
      end
      object cxGrid2DBTableView2Last2TimeFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2TimeFinCall'
      end
      object cxGrid2DBTableView2Last3Time1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Time1stCall'
      end
      object cxGrid2DBTableView2Last3Time2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3Time2ndCall'
      end
      object cxGrid2DBTableView2Last3TimeStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3TimeStrCall'
      end
      object cxGrid2DBTableView2Last3TimeFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3TimeFinCall'
      end
      object cxGrid2DBTableView2LastBL1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastBL1stCall'
      end
      object cxGrid2DBTableView2LastBL2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastBL2ndCall'
      end
      object cxGrid2DBTableView2LastBLStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastBLStrCall'
      end
      object cxGrid2DBTableView2LastBLFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastBLFinCall'
      end
      object cxGrid2DBTableView2Last2BL1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2BL1stCall'
      end
      object cxGrid2DBTableView2Last2BL2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2BL2ndCall'
      end
      object cxGrid2DBTableView2Last2BLStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2BLStrCall'
      end
      object cxGrid2DBTableView2Last2BLFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2BLFinCall'
      end
      object cxGrid2DBTableView2Last3BL1stCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3BL1stCall'
      end
      object cxGrid2DBTableView2Last3BL2ndCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3BL2ndCall'
      end
      object cxGrid2DBTableView2Last3BLStrCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3BLStrCall'
      end
      object cxGrid2DBTableView2Last3BLFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3BLFinCall'
      end
      object cxGrid2DBTableView2LastPosFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'LastPosFinCall'
      end
      object cxGrid2DBTableView2Last2PosFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last2PosFinCall'
      end
      object cxGrid2DBTableView2Last3PosFinCall: TcxGridDBColumn
        DataBinding.FieldName = 'Last3PosFinCall'
      end
    end
    object cxGrid2DBTableView3: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView3DamSire: TcxGridDBColumn
        DataBinding.FieldName = 'DamSire'
      end
      object cxGrid2DBTableView3DamSireTurfLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfLastYearRank'
      end
      object cxGrid2DBTableView3DamSireTurfLastYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfLastYearStarts'
      end
      object cxGrid2DBTableView3DamSireTurfLastYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfLastYearPctOfEarnings'
      end
      object cxGrid2DBTableView3DamSireGeneralLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireGeneralLastYearRank'
      end
      object cxGrid2DBTableView3DamSireGeneralLastYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireGeneralLastYearStudFee'
      end
      object cxGrid2DBTableView3DamSireJuvenileLastYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireJuvenileLastYearRank'
      end
      object cxGrid2DBTableView3DamSireJuvenileThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireJuvenileThisYearRank'
      end
      object cxGrid2DBTableView3DamSireTurfThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfThisYearRank'
      end
      object cxGrid2DBTableView3DamSireTurfThisYearStarts: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfThisYearStarts'
      end
      object cxGrid2DBTableView3DamSireTurfThisYearPctOfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireTurfThisYearPctOfEarnings'
      end
      object cxGrid2DBTableView3DamSireGeneralThisYearRank: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireGeneralThisYearRank'
      end
      object cxGrid2DBTableView3DamSireGeneralThisYearStudFee: TcxGridDBColumn
        DataBinding.FieldName = 'DamSireGeneralThisYearStudFee'
      end
    end
    object cxGrid2DBTableView4: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView4Trainer: TcxGridDBColumn
        DataBinding.FieldName = 'Trainer'
      end
      object cxGrid2DBTableView4IsSuperTrainer: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperTrainer'
      end
      object cxGrid2DBTableView4Column1: TcxGridDBColumn
        Caption = 'Debut'
        DataBinding.FieldName = 'DebutIndicator'
        Width = 54
      end
      object cxGrid2DBTableView4TrnWinsRank: TcxGridDBColumn
        DataBinding.FieldName = 'TrnWinsRank'
      end
      object cxGrid2DBTableView4TrnEarningsRank: TcxGridDBColumn
        DataBinding.FieldName = 'TrnEarningsRank'
      end
      object cxGrid2DBTableView4TrnTrackRank: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTrackRank'
      end
      object cxGrid2DBTableView4TotalTrnDebutStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutStarts'
      end
      object cxGrid2DBTableView4TotalTrnDebutWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutWins'
      end
      object cxGrid2DBTableView4TotalTrnDebutWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutWinPct'
      end
      object cxGrid2DBTableView4TotalTrnDebutTwoStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutTwoStarts'
      end
      object cxGrid2DBTableView4TotalTrnDebutTwoWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutTwoWins'
        Width = 111
      end
      object cxGrid2DBTableView4TotalTrnDebutTwoWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnDebutTwoWinPct'
        Width = 124
      end
      object cxGrid2DBTableView4TotalTrnStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnStarts'
        Width = 74
      end
      object cxGrid2DBTableView4TotalTrnWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWins'
      end
      object cxGrid2DBTableView4TotalTrnWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWinPct'
      end
      object cxGrid2DBTableView4TotalTrnWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWinPctRank'
      end
      object cxGrid2DBTableView4TotalTrn1To45Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1To45Starts'
      end
      object cxGrid2DBTableView4TotalTrn1To45Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1To45Wins'
      end
      object cxGrid2DBTableView4TotalTrn1To45WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1To45WinPct'
      end
      object cxGrid2DBTableView4TotalTrnWork1To45Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork1To45Starts'
      end
      object cxGrid2DBTableView4TotalTrnWork1To45Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork1To45Wins'
      end
      object cxGrid2DBTableView4TotalTrnWork1To45WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork1To45WinPct'
      end
      object cxGrid2DBTableView4TotalTrn46To120Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn46To120Starts'
      end
      object cxGrid2DBTableView4TotalTrn46To120Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn46To120Wins'
      end
      object cxGrid2DBTableView4TotalTrn46To120WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn46To120WinPct'
      end
      object cxGrid2DBTableView4TotalTrnWork46To120Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork46To120Starts'
      end
      object cxGrid2DBTableView4TotalTrnWork46To120Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork46To120Wins'
      end
      object cxGrid2DBTableView4TotalTrnWork46To120WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork46To120WinPct'
      end
      object cxGrid2DBTableView4TotalTrn120PlusStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn120PlusStarts'
      end
      object cxGrid2DBTableView4TotalTrn120PlusWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn120PlusWins'
      end
      object cxGrid2DBTableView4TotalTrn120PlusWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn120PlusWinPct'
      end
      object cxGrid2DBTableView4TotalTrnWork120PlusStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork120PlusStarts'
      end
      object cxGrid2DBTableView4TotalTrnWork120PlusWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork120PlusWins'
      end
      object cxGrid2DBTableView4TotalTrnWork120PlusWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnWork120PlusWinPct'
      end
      object cxGrid2DBTableView4TotalTrnFirstJuiceStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnFirstJuiceStarts'
      end
      object cxGrid2DBTableView4TotalTrnFirstJuiceWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnFirstJuiceWins'
      end
      object cxGrid2DBTableView4TotalTrnFirstJuiceWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnFirstJuiceWinPct'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOnStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOnStarts'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOnWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOnWins'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOnWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOnWinPct'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOffStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOffStarts'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOffWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOffWins'
      end
      object cxGrid2DBTableView4TotalTrnBlinkersOffWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnBlinkersOffWinPct'
      end
      object cxGrid2DBTableView4TotalTrnTurfStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnTurfStarts'
      end
      object cxGrid2DBTableView4TotalTrnTurfWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnTurfWins'
      end
      object cxGrid2DBTableView4TotalTrnTurfWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnTurfWinPct'
      end
      object cxGrid2DBTableView4TotalTrnTurfWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnTurfWinPctRank'
      end
      object cxGrid2DBTableView4TotalTrn30Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn30Starts'
      end
      object cxGrid2DBTableView4TotalTrn30Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn30Wins'
      end
      object cxGrid2DBTableView4TotalTrn30WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn30WinPct'
      end
      object cxGrid2DBTableView4TotalTrn30WinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn30WinPctRank'
      end
      object cxGrid2DBTableView4TotalTrnAftClmStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnAftClmStarts'
      end
      object cxGrid2DBTableView4TotalTrnAftClmWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnAftClmWins'
      end
      object cxGrid2DBTableView4TotalTrnAftClmWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnAftClmWinPct'
      end
      object cxGrid2DBTableView4TotalTrnOddsStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOddsStarts'
      end
      object cxGrid2DBTableView4TotalTrnOddsWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOddsWins'
      end
      object cxGrid2DBTableView4TotalTrnOddsWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOddsWinPct'
      end
      object cxGrid2DBTableView4TotalTrnOddsWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOddsWinPctRank'
      end
      object cxGrid2DBTableView4TotalTrn1stStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1stStarts'
      end
      object cxGrid2DBTableView4TotalTrn1stWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1stWins'
      end
      object cxGrid2DBTableView4TotalTrn1stWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn1stWinPct'
      end
      object cxGrid2DBTableView4TotalTrn2yoStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn2yoStarts'
      end
      object cxGrid2DBTableView4TotalTrn2yoWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn2yoWins'
      end
      object cxGrid2DBTableView4TotalTrn2yoWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn2yoWinPct'
      end
      object cxGrid2DBTableView4TotalTrn2oWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrn2oWinPctRank'
      end
      object cxGrid2DBTableView4TrnTodayStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTodayStarts'
      end
      object cxGrid2DBTableView4TrnTodayWins: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTodayWins'
      end
      object cxGrid2DBTableView4TrnTodayWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTodayWinPct'
      end
      object cxGrid2DBTableView4TrnTodayWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTodayWinPctRank'
      end
      object cxGrid2DBTableView4TrnDirtToTurfStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrnDirtToTurfStarts'
      end
      object cxGrid2DBTableView4TrnDirtToTurfWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnDirtToTurfWinPct'
      end
      object cxGrid2DBTableView4TrnTurfToDirtStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTurfToDirtStarts'
      end
      object cxGrid2DBTableView4TrnTurfToDirtWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnTurfToDirtWinPct'
      end
      object cxGrid2DBTableView4TrnRteToSprStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrnRteToSprStarts'
      end
      object cxGrid2DBTableView4TrnRteToSprWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnRteToSprWinPct'
      end
      object cxGrid2DBTableView4TrnSprToRteStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrnSprToRteStarts'
      end
      object cxGrid2DBTableView4TrnSprToRteWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnSprToRteWinPct'
      end
      object cxGrid2DBTableView4TrnStkWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnStkWinPct'
      end
      object cxGrid2DBTableView4TrnClmWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnClmWinPct'
      end
      object cxGrid2DBTableView4TrnMdnWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TrnMdnWinPct'
      end
    end
    object cxGrid2DBTableView5: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView5Jockey: TcxGridDBColumn
        DataBinding.FieldName = 'Jockey'
      end
      object cxGrid2DBTableView5IsSuperJockey: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperJockey'
      end
      object cxGrid2DBTableView5JkyWinsRank: TcxGridDBColumn
        DataBinding.FieldName = 'JkyWinsRank'
      end
      object cxGrid2DBTableView5JkyEarningsRank: TcxGridDBColumn
        DataBinding.FieldName = 'JkyEarningsRank'
      end
      object cxGrid2DBTableView5JkyTrackRank: TcxGridDBColumn
        DataBinding.FieldName = 'JkyTrackRank'
      end
      object cxGrid2DBTableView5TotalTrnJkyStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnJkyStarts'
      end
      object cxGrid2DBTableView5TotalTrnJkyWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnJkyWins'
      end
      object cxGrid2DBTableView5TotalTrnJkyWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnJkyWinPct'
      end
      object cxGrid2DBTableView5TotalTrnJkyWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnJkyWinPctRank'
      end
      object cxGrid2DBTableView5TotalJkyStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyStarts'
      end
      object cxGrid2DBTableView5TotalJkyWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyWins'
      end
      object cxGrid2DBTableView5TotalJkyWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyWinPct'
      end
      object cxGrid2DBTableView5TotalJkyWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyWinPctRank'
      end
      object cxGrid2DBTableView5TotalJkyDaysStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyDaysStarts'
      end
      object cxGrid2DBTableView5TotalJkyDaysWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyDaysWins'
      end
      object cxGrid2DBTableView5TotalJkyDaysWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyDaysWinPctRank'
      end
      object cxGrid2DBTableView5TotalJkyDaysWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyDaysWinPct'
      end
      object cxGrid2DBTableView5TotalJkyOddsStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyOddsStarts'
      end
      object cxGrid2DBTableView5TotalJkyOddsWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyOddsWins'
      end
      object cxGrid2DBTableView5TotalJkyOddsWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyOddsWinPct'
      end
      object cxGrid2DBTableView5TotalJkyOddsWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyOddsWinPctRank'
      end
      object cxGrid2DBTableView5TotalJkyTurfStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyTurfStarts'
      end
      object cxGrid2DBTableView5TotalJkyTurfWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyTurfWins'
      end
      object cxGrid2DBTableView5TotalJkyTurfWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJkyTurfWinPct'
      end
      object cxGrid2DBTableView5TotalJky10Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky10Starts'
      end
      object cxGrid2DBTableView5TotalJky10Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky10Wins'
      end
      object cxGrid2DBTableView5TotalJky10WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky10WinPct'
      end
      object cxGrid2DBTableView5TotalJky10WinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky10WinPctRank'
      end
      object cxGrid2DBTableView5TotalJky30Starts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky30Starts'
      end
      object cxGrid2DBTableView5TotalJky30Wins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky30Wins'
      end
      object cxGrid2DBTableView5TotalJky30WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky30WinPct'
      end
      object cxGrid2DBTableView5TotalJky30WinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky30WinPctRank'
      end
      object cxGrid2DBTableView5TotalJky2yoStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky2yoStarts'
      end
      object cxGrid2DBTableView5TotalJky2yoWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky2yoWins'
      end
      object cxGrid2DBTableView5TotalJky2yoWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalJky2yoWinPct'
      end
    end
    object cxGrid2DBTableView6: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView6Owner: TcxGridDBColumn
        DataBinding.FieldName = 'Owner'
      end
      object cxGrid2DBTableView6IsSuperOwner: TcxGridDBColumn
        DataBinding.FieldName = 'IsSuperOwner'
        Width = 128
      end
      object cxGrid2DBTableView6OwnWinsRank: TcxGridDBColumn
        DataBinding.FieldName = 'OwnWinsRank'
      end
      object cxGrid2DBTableView6OwnEarningsRank: TcxGridDBColumn
        DataBinding.FieldName = 'OwnEarningsRank'
      end
      object cxGrid2DBTableView6TotalTrnOwnStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOwnStarts'
      end
      object cxGrid2DBTableView6TotalTrnOwnWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOwnWins'
      end
      object cxGrid2DBTableView6TotalTrnOwnWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOwnWinPct'
      end
      object cxGrid2DBTableView6TotalTrnOwnWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalTrnOwnWinPctRank'
      end
      object cxGrid2DBTableView6TotalOwnStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOwnStarts'
      end
      object cxGrid2DBTableView6TotalOwnWins: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOwnWins'
      end
      object cxGrid2DBTableView6TotalOwnWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOwnWinPct'
      end
      object cxGrid2DBTableView6TotalOwnWinPctRank: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOwnWinPctRank'
      end
      object cxGrid2DBTableView6TotalOwnTop3WinPct: TcxGridDBColumn
        DataBinding.FieldName = 'TotalOwnTop3WinPct'
      end
    end
    object cxGrid2DBTableView7: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView7LastSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'LastSpeed'
      end
      object cxGrid2DBTableView7LastSpeedRank: TcxGridDBColumn
        DataBinding.FieldName = 'LastSpeedRank'
      end
      object cxGrid2DBTableView7Power: TcxGridDBColumn
        DataBinding.FieldName = 'Power'
      end
      object cxGrid2DBTableView7PowerRank: TcxGridDBColumn
        DataBinding.FieldName = 'PowerRank'
      end
      object cxGrid2DBTableView7BackSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'BackSpeed'
        Width = 102
      end
      object cxGrid2DBTableView7BackSpeedRank: TcxGridDBColumn
        DataBinding.FieldName = 'BackSpeedRank'
        Width = 110
      end
      object cxGrid2DBTableView7AvgClass: TcxGridDBColumn
        DataBinding.FieldName = 'AvgClass'
        Width = 109
      end
      object cxGrid2DBTableView7AvgClassRank: TcxGridDBColumn
        DataBinding.FieldName = 'AvgClassRank'
        Width = 120
      end
      object cxGrid2DBTableView7AvgSpeed: TcxGridDBColumn
        DataBinding.FieldName = 'AvgSpeed'
      end
      object cxGrid2DBTableView7AvgSpeedRank: TcxGridDBColumn
        DataBinding.FieldName = 'AvgSpeedRank'
      end
      object cxGrid2DBTableView7AvgClassRating: TcxGridDBColumn
        DataBinding.FieldName = 'AvgClassRating'
      end
      object cxGrid2DBTableView7AvgClassRatingRank: TcxGridDBColumn
        DataBinding.FieldName = 'AvgClassRatingRank'
      end
      object cxGrid2DBTableView7BackClass: TcxGridDBColumn
        DataBinding.FieldName = 'BackClass'
      end
      object cxGrid2DBTableView7BackClassRank: TcxGridDBColumn
        DataBinding.FieldName = 'BackClassRank'
      end
      object cxGrid2DBTableView7CurrClass: TcxGridDBColumn
        DataBinding.FieldName = 'CurrClass'
      end
      object cxGrid2DBTableView7CurrClassRank: TcxGridDBColumn
        DataBinding.FieldName = 'CurrClassRank'
      end
    end
    object cxGrid2DBTableView8: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView8EarlyPace: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPace'
      end
      object cxGrid2DBTableView8EarlyPaceRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPaceRank'
      end
      object cxGrid2DBTableView8EarlyPacePos: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPacePos'
      end
      object cxGrid2DBTableView8EarlyPacePosRank: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPacePosRank'
      end
      object cxGrid2DBTableView8MiddlePace: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePace'
      end
      object cxGrid2DBTableView8MiddlePaceRank: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePaceRank'
      end
      object cxGrid2DBTableView8MiddlePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePacePos'
      end
      object cxGrid2DBTableView8MiddlePacePosRank: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePacePosRank'
      end
      object cxGrid2DBTableView8LatePace: TcxGridDBColumn
        DataBinding.FieldName = 'LatePace'
      end
      object cxGrid2DBTableView8LatePaceRank: TcxGridDBColumn
        DataBinding.FieldName = 'LatePaceRank'
      end
      object cxGrid2DBTableView8LatePacePos: TcxGridDBColumn
        DataBinding.FieldName = 'LatePacePos'
      end
      object cxGrid2DBTableView8LatePacePosRank: TcxGridDBColumn
        DataBinding.FieldName = 'LatePacePosRank'
      end
      object cxGrid2DBTableView8FinishPacePos: TcxGridDBColumn
        DataBinding.FieldName = 'FinishPacePos'
      end
      object cxGrid2DBTableView8FinishPacePosRank: TcxGridDBColumn
        DataBinding.FieldName = 'FinishPacePosRank'
      end
      object cxGrid2DBTableView8EarlyPaceAdvantage: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPaceAdvantage'
      end
      object cxGrid2DBTableView8MiddlePaceAdvantage: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePaceAdvantage'
      end
      object cxGrid2DBTableView8LatePaceAdvantage: TcxGridDBColumn
        DataBinding.FieldName = 'LatePaceAdvantage'
      end
      object cxGrid2DBTableView8EarlyPaceAdvantageWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'EarlyPaceAdvantageWinPct'
      end
      object cxGrid2DBTableView8MiddlePaceAdvantageWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'MiddlePaceAdvantageWinPct'
      end
      object cxGrid2DBTableView8LatePaceAdvantageWinPct: TcxGridDBColumn
        DataBinding.FieldName = 'LatePaceAdvantageWinPct'
      end
    end
    object cxGrid2DBTableView9: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid2DBTableView9LifeStarts: TcxGridDBColumn
        DataBinding.FieldName = 'LifeStarts'
      end
      object cxGrid2DBTableView9LifeWins: TcxGridDBColumn
        DataBinding.FieldName = 'LifeWins'
      end
      object cxGrid2DBTableView9LifePlcs: TcxGridDBColumn
        DataBinding.FieldName = 'LifePlcs'
      end
      object cxGrid2DBTableView9LifeShos: TcxGridDBColumn
        DataBinding.FieldName = 'LifeShos'
      end
      object cxGrid2DBTableView9LifeEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'LifeEarnings'
      end
      object cxGrid2DBTableView9LifeEPS: TcxGridDBColumn
        DataBinding.FieldName = 'LifeEPS'
      end
      object cxGrid2DBTableView9TurfStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TurfStarts'
      end
      object cxGrid2DBTableView9TurfWins: TcxGridDBColumn
        DataBinding.FieldName = 'TurfWins'
      end
      object cxGrid2DBTableView9TurfPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'TurfPlcs'
      end
      object cxGrid2DBTableView9TurfShos: TcxGridDBColumn
        DataBinding.FieldName = 'TurfShos'
      end
      object cxGrid2DBTableView9TurfEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'TurfEarnings'
      end
      object cxGrid2DBTableView9TurfEPS: TcxGridDBColumn
        DataBinding.FieldName = 'TurfEPS'
      end
      object cxGrid2DBTableView9MudStarts: TcxGridDBColumn
        DataBinding.FieldName = 'MudStarts'
      end
      object cxGrid2DBTableView9MudWins: TcxGridDBColumn
        DataBinding.FieldName = 'MudWins'
      end
      object cxGrid2DBTableView9MudPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'MudPlcs'
      end
      object cxGrid2DBTableView9MudShos: TcxGridDBColumn
        DataBinding.FieldName = 'MudShos'
      end
      object cxGrid2DBTableView9MudEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'MudEarnings'
      end
      object cxGrid2DBTableView9MudEPS: TcxGridDBColumn
        DataBinding.FieldName = 'MudEPS'
      end
      object cxGrid2DBTableView9TrkStarts: TcxGridDBColumn
        DataBinding.FieldName = 'TrkStarts'
      end
      object cxGrid2DBTableView9TrkWins: TcxGridDBColumn
        DataBinding.FieldName = 'TrkWins'
      end
      object cxGrid2DBTableView9TrkPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'TrkPlcs'
      end
      object cxGrid2DBTableView9TrkShos: TcxGridDBColumn
        DataBinding.FieldName = 'TrkShos'
      end
      object cxGrid2DBTableView9TrkEarnings: TcxGridDBColumn
        DataBinding.FieldName = 'TrkEarnings'
      end
      object cxGrid2DBTableView9TrkEPS: TcxGridDBColumn
        DataBinding.FieldName = 'TrkEPS'
      end
      object cxGrid2DBTableView9RouteStarts: TcxGridDBColumn
        DataBinding.FieldName = 'RouteStarts'
      end
      object cxGrid2DBTableView9RouteWins: TcxGridDBColumn
        DataBinding.FieldName = 'RouteWins'
      end
      object cxGrid2DBTableView9RoutePlcs: TcxGridDBColumn
        DataBinding.FieldName = 'RoutePlcs'
      end
      object cxGrid2DBTableView9RouteShos: TcxGridDBColumn
        DataBinding.FieldName = 'RouteShos'
      end
      object cxGrid2DBTableView9SprintStarts: TcxGridDBColumn
        DataBinding.FieldName = 'SprintStarts'
      end
      object cxGrid2DBTableView9SprintWins: TcxGridDBColumn
        DataBinding.FieldName = 'SprintWins'
      end
      object cxGrid2DBTableView9SprintPlcs: TcxGridDBColumn
        DataBinding.FieldName = 'SprintPlcs'
      end
      object cxGrid2DBTableView9SprintShos: TcxGridDBColumn
        DataBinding.FieldName = 'SprintShos'
      end
      object cxGrid2DBTableView9AngleDesc: TcxGridDBColumn
        DataBinding.FieldName = 'AngleDesc'
      end
    end
    object lvGeneral: TcxGridLevel
      Caption = 'General'
      GridView = tvGeneral
    end
    object lvTodaysWager: TcxGridLevel
      Caption = 'Todays Wager'
      GridView = tvTodaysWager
    end
    object lvTrainer: TcxGridLevel
      Caption = 'Trainer'
      GridView = cxGrid2DBTableView4
    end
    object lvJockey: TcxGridLevel
      Caption = 'Jockey'
      GridView = cxGrid2DBTableView5
    end
    object lvOwner: TcxGridLevel
      Caption = 'Owner'
      GridView = cxGrid2DBTableView6
    end
    object lvSire: TcxGridLevel
      Caption = 'Sire'
      GridView = cxGrid2DBTableView1
    end
    object lvDamSire: TcxGridLevel
      Caption = 'Dam Sire'
      GridView = cxGrid2DBTableView3
    end
    object lvLast3: TcxGridLevel
      Caption = 'Last 3'
      GridView = cxGrid2DBTableView2
    end
    object lvRanks: TcxGridLevel
      Caption = 'Ranks'
      GridView = cxGrid2DBTableView7
    end
    object lvPace: TcxGridLevel
      Caption = 'Pace'
      GridView = cxGrid2DBTableView8
    end
    object lvRecords: TcxGridLevel
      Caption = 'Records'
      GridView = cxGrid2DBTableView9
    end
  end
  object tblEntries: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbEntry'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRaces
    TableName = 'Entry'
    Left = 40
    Top = 624
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 48
    Top = 552
  end
  object tblRaces: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbEntry'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race'
    Left = 24
    Top = 496
  end
  object dsRaces: TDataSource
    DataSet = tblRaces
    Top = 584
  end
  object dbEntry: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbEntry'
    Directory = 'c:\ratingsdata31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 144
    Top = 232
  end
end
