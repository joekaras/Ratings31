object QueryForm: TQueryForm
  Left = -4
  Top = -4
  Width = 1027
  Height = 653
  Caption = 'Query'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object KQueryPanel1: TKQueryPanel
    Left = 0
    Top = 42
    Width = 273
    Height = 564
    Align = alLeft
    TabOrder = 0
    TabStop = True
    Appearance.ActiveRowColor = clBtnHighlight
    Appearance.ControlBorderColor = clBlack
    Appearance.LinkTypes = [fltAll, fltAny, fltNone, fltNotAll]
    Appearance.Options = [aoFlatButtons, aoRoundButtons, aoNonEmptyBrackets, aoPopupField, aoPopupValue, aoAllowKeyboard, aoShowAddRow, aoShowCheckBoxes, aoAllowParams]
    Appearance.Style = psGroups
    Appearance.NameSeparator = '.'
    DbStruct = KDBStructureElevateDB
    Titles.Strings = (
      '[Query Panel]'
      'ttlFilter=Choose records where @ of the following apply'
      'ttlBracket=@ of the following apply'
      'ttlAll=all'
      'ttlAny=any'
      'ttlNone=none'
      'ttlNotAll=not all'
      'ttlAddCond=Add new &condition'
      'ttlAddBracket=Open new &bracket'
      'ttlAfterCurrent=after current'
      'ttlInsideCurrent=inside current'
      'ttlDelRow=&Delete row'
      'ttlEnableDisable=&Enable/Disable row'
      'ttlClickToAdd=Click here to add new condition'
      'ttlSubQueryCaption=Sub-query'
      'ttlResultField=Result field'
      'ttlAnd=and'
      'ttlOr=or'
      'ttlConstant=Constant value'
      'ttlParameter=Parameter'
      'ttlCustomCond=Add custom condition'
      'ttlTrue=True'
      'ttlFalse=False'
      ''
      '[Result Fields Editor]'
      'ttlRFETitle=Result Fields Editor'
      'ttlFields=&Available fields'
      'ttlResFields=Result fields'
      'ttlMakeFldHint=Create result field'
      'ttlDelFldHint=Delete result field'
      'ttlNewFldHint=New result field'
      'ttlAddRFldHint=Add to result field'
      'ttlSubRFldHint=Subtract from result field'
      'ttlMulRFldHint=Multiply by result field'
      'ttlDivRFldHint=Divide by result field'
      'ttlSortRFldHint=Sort result field'
      'ttlNotSorted=Not Sorted'
      'ttlAscending=Ascending'
      'ttlDescending=Descending'
      'ttlSortCaption=Sorted fields'
      'ttlSortingColName=Sorting type'
      'ttlFieldNmColName=Field Name'
      'ttlFieldExprColName=Expression'
      'ttlMgsDeleteField=Delete Field "%s"?'
      'ttlOkBtnCaption=OK'
      'ttlCancelBtnCaption=Cancel'
      'ttlAsIs=as is'
      'ttlJustSorting=just sorting'
      'ttlAddBtnCaption=&Add'
      'ttlAddBtnHint=Add result field'
      'ttlHelpBtnCaption=&Help'
      'ttlSUMCaption=Sum'
      'ttlCOUNTCaption=Count'
      'ttlMINCaption=Minimum'
      'ttlMAXCaption=Maximum'
      'ttlAVERAGECaption=Average'
      'ttlLISTCaption=List'
      'ttlCOUNTDISTINCTCaption=Distinct count'
      '')
    MaxPopupItemCount = 0
    RFEHelpContext = 0
    SQLOptions = [soASCIIRFields, soSelectDistinct]
    SQLSyntax = ssSQL1
    SubQueryAppearance.ActiveRowColor = clBtnHighlight
    SubQueryAppearance.ControlBorderColor = clBlack
    SubQueryAppearance.LinkTypes = [fltAll, fltAny, fltNone, fltNotAll]
    SubQueryAppearance.Options = [aoFlatButtons, aoRoundButtons, aoNonEmptyBrackets, aoPopupField, aoPopupValue, aoAllowKeyboard, aoShowAddRow, aoShowCheckBoxes, aoAllowParams]
    SubQueryAppearance.Style = psGroups
    SubQueryAppearance.NameSeparator = '.'
    SubQueryFont.Charset = DEFAULT_CHARSET
    SubQueryFont.Color = clWindowText
    SubQueryFont.Height = -11
    SubQueryFont.Name = 'MS Sans Serif'
    SubQueryFont.Style = []
    RFields = (
      '[RFields]'
      'Count=0'
      'Version=3.5'
      'JustSorting=1'
      '')
  end
  object cxPageControl1: TcxPageControl
    Left = 273
    Top = 42
    Width = 746
    Height = 564
    ActivePage = cxTabSheet2
    Align = alClient
    TabOrder = 1
    ClientRectBottom = 564
    ClientRectRight = 746
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'SQL'
      ImageIndex = 0
      object memSQL: TcxMemo
        Left = 0
        Top = 0
        Align = alClient
        Lines.Strings = (
          'memSQL')
        TabOrder = 0
        Height = 540
        Width = 746
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Results'
      ImageIndex = 1
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 746
        Height = 540
        Align = alClient
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        RootLevelOptions.DetailTabsPosition = dtpLeft
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAll
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1Column1: TcxGridDBColumn
          end
        end
        object cxGrid1DBBandedTableView1: TcxGridDBBandedTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAll
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          Bands = <
            item
            end
            item
            end>
          object cxGrid1DBBandedTableView1Column1: TcxGridDBBandedColumn
            DataBinding.FieldName = 'Age'
            Position.BandIndex = 0
            Position.ColIndex = 0
            Position.RowIndex = 0
          end
          object cxGrid1DBBandedTableView1Column2: TcxGridDBBandedColumn
            DataBinding.FieldName = 'AgeSexRestriction'
            Width = 154
            Position.BandIndex = 0
            Position.ColIndex = 1
            Position.RowIndex = 0
          end
        end
        object cxGrid1DBCardView1: TcxGridDBCardView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsAll
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          LayoutDirection = ldVertical
          object cxGrid1DBCardView1IsEquibaseChartsProcessed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsEquibaseChartsProcessed'
          end
          object cxGrid1DBCardView1IsDRFChartsProcessed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDRFChartsProcessed'
          end
          object cxGrid1DBCardView1OrigSurface: TcxGridDBCardViewRow
            DataBinding.FieldName = 'OrigSurface'
          end
          object cxGrid1DBCardView1DistanceInFeet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DistanceInFeet'
          end
          object cxGrid1DBCardView1DistanceInYards: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DistanceInYards'
          end
          object cxGrid1DBCardView1IsPk3Race: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk3Race'
          end
          object cxGrid1DBCardView1Pk3RaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk3RaceNbr'
          end
          object cxGrid1DBCardView1IsPk4Race: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk4Race'
          end
          object cxGrid1DBCardView1Pk4RaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk4RaceNbr'
          end
          object cxGrid1DBCardView1IsPk6Race: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk6Race'
          end
          object cxGrid1DBCardView1Pk6RaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk6RaceNbr'
          end
          object cxGrid1DBCardView1IsTriRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTriRace'
          end
          object cxGrid1DBCardView1IsSuperRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSuperRace'
          end
          object cxGrid1DBCardView1IsPk9Place: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk9Place'
          end
          object cxGrid1DBCardView1Pk9RaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk9RaceNbr'
          end
          object cxGrid1DBCardView1IsExaRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsExaRace'
          end
          object cxGrid1DBCardView1IsQuiRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsQuiRace'
          end
          object cxGrid1DBCardView1IsDDRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDDRace'
          end
          object cxGrid1DBCardView1DDRaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DDRaceNbr'
          end
          object cxGrid1DBCardView1IsPk3Leg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk3Leg1'
          end
          object cxGrid1DBCardView1IsPk4Leg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk4Leg1'
          end
          object cxGrid1DBCardView1IsPk6Leg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk6Leg1'
          end
          object cxGrid1DBCardView1IsPk9Leg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPk9Leg1'
          end
          object cxGrid1DBCardView1IsDDLeg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDDLeg1'
          end
          object cxGrid1DBCardView1RaceCondition1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition1'
          end
          object cxGrid1DBCardView1RaceCondition2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition2'
          end
          object cxGrid1DBCardView1RaceCondition3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition3'
          end
          object cxGrid1DBCardView1RaceCondition4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition4'
          end
          object cxGrid1DBCardView1RaceCondition5: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition5'
          end
          object cxGrid1DBCardView1RaceCondition6: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition6'
          end
          object cxGrid1DBCardView1RaceCondition7: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition7'
          end
          object cxGrid1DBCardView1RaceCondition8: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition8'
          end
          object cxGrid1DBCardView1RaceCondition9: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition9'
          end
          object cxGrid1DBCardView1RaceCondition10: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition10'
          end
          object cxGrid1DBCardView1BetLine: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BetLine'
          end
          object cxGrid1DBCardView1Purse: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Purse'
          end
          object cxGrid1DBCardView1ClaimingPrice: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ClaimingPrice'
          end
          object cxGrid1DBCardView1RaceConditions: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceConditions'
          end
          object cxGrid1DBCardView1TrkCond: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrkCond'
          end
          object cxGrid1DBCardView1DistanceDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DistanceDesc'
          end
          object cxGrid1DBCardView1OrigDistanceDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'OrigDistanceDesc'
          end
          object cxGrid1DBCardView1LocalTimeOfRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LocalTimeOfRace'
          end
          object cxGrid1DBCardView1EstTimeOfRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstTimeOfRace'
          end
          object cxGrid1DBCardView1EstTimeOfFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstTimeOfFirstRace'
          end
          object cxGrid1DBCardView1IsFinalValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFinalValue'
          end
          object cxGrid1DBCardView1IsActive: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsActive'
          end
          object cxGrid1DBCardView1IsPPValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPPValue'
          end
          object cxGrid1DBCardView1IsMLValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsMLValue'
          end
          object cxGrid1DBCardView1IsChalkValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsChalkValue'
          end
          object cxGrid1DBCardView1IsPlayableValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPlayableValue'
          end
          object cxGrid1DBCardView1IsPrintedOnValueSheet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPrintedOnValueSheet'
          end
          object cxGrid1DBCardView1IsLinerSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsLinerSheetSelected'
          end
          object cxGrid1DBCardView1IsOverlaySheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsOverlaySheetSelected'
          end
          object cxGrid1DBCardView1IsWagerSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsWagerSheetSelected'
          end
          object cxGrid1DBCardView1IsYouBetTrack: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsYouBetTrack'
          end
          object cxGrid1DBCardView1FootNotes: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FootNotes'
          end
          object cxGrid1DBCardView1Trainers: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Trainers'
          end
          object cxGrid1DBCardView1Owners: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Owners'
          end
          object cxGrid1DBCardView1ScratchedHorses: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ScratchedHorses'
          end
          object cxGrid1DBCardView1FractionalTimes: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FractionalTimes'
          end
          object cxGrid1DBCardView1IsExactaMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsExactaMatched'
          end
          object cxGrid1DBCardView1Exacta: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Exacta'
          end
          object cxGrid1DBCardView1ExactaNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ExactaNbrs'
          end
          object cxGrid1DBCardView1ExactaWager: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ExactaWager'
          end
          object cxGrid1DBCardView1ExactaPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ExactaPayout'
          end
          object cxGrid1DBCardView1IsTrifectaMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrifectaMatched'
          end
          object cxGrid1DBCardView1Tri: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Tri'
          end
          object cxGrid1DBCardView1TrifectaNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrifectaNbrs'
          end
          object cxGrid1DBCardView1TrifectaWager: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrifectaWager'
          end
          object cxGrid1DBCardView1TrifectaPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrifectaPayout'
          end
          object cxGrid1DBCardView1IsSuperfectaMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSuperfectaMatched'
          end
          object cxGrid1DBCardView1Super: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Super'
          end
          object cxGrid1DBCardView1SuperfectaNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SuperfectaNbrs'
          end
          object cxGrid1DBCardView1SuperfectaWager: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SuperfectaWager'
          end
          object cxGrid1DBCardView1SuperfectaPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SuperfectaPayout'
          end
          object cxGrid1DBCardView1IsDailyDoubleMatchedFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDailyDoubleMatchedFirstRace'
          end
          object cxGrid1DBCardView1IsDailyDoubleMatchedLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDailyDoubleMatchedLastRace'
          end
          object cxGrid1DBCardView1DDFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DDFirstRace'
          end
          object cxGrid1DBCardView1DDLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DDLastRace'
          end
          object cxGrid1DBCardView1DailyDoubleNbrsFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoubleNbrsFirstRace'
          end
          object cxGrid1DBCardView1DailyDoubleNbrsLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoubleNbrsLastRace'
          end
          object cxGrid1DBCardView1DailyDoubleWagerFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoubleWagerFirstRace'
          end
          object cxGrid1DBCardView1DailyDoubleWagerLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoubleWagerLastRace'
          end
          object cxGrid1DBCardView1DailyDoublePayoutFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoublePayoutFirstRace'
          end
          object cxGrid1DBCardView1DailyDoublePayoutLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DailyDoublePayoutLastRace'
          end
          object cxGrid1DBCardView1IsQuinellaMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsQuinellaMatched'
          end
          object cxGrid1DBCardView1Quinella: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Quinella'
          end
          object cxGrid1DBCardView1QuinellaNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QuinellaNbrs'
          end
          object cxGrid1DBCardView1QuinellaWager: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QuinellaWager'
          end
          object cxGrid1DBCardView1QuinellaPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QuinellaPayout'
          end
          object cxGrid1DBCardView1IsPick3MatchedFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick3MatchedFirstRace'
          end
          object cxGrid1DBCardView1IsPick3MatchedLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick3MatchedLastRace'
          end
          object cxGrid1DBCardView1Pick3FirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3FirstRace'
          end
          object cxGrid1DBCardView1Pick3LastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3LastRace'
          end
          object cxGrid1DBCardView1Pick3NbrsFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3NbrsFirstRace'
          end
          object cxGrid1DBCardView1Pick3NbrsLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3NbrsLastRace'
          end
          object cxGrid1DBCardView1Pick3WagerFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3WagerFirstRace'
          end
          object cxGrid1DBCardView1Pick3WagerLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3WagerLastRace'
          end
          object cxGrid1DBCardView1Pick3PayoutFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3PayoutFirstRace'
          end
          object cxGrid1DBCardView1Pick3PayoutLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3PayoutLastRace'
          end
          object cxGrid1DBCardView1Pick3NbrsLeg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3NbrsLeg1'
          end
          object cxGrid1DBCardView1Pick3NbrsLeg2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3NbrsLeg2'
          end
          object cxGrid1DBCardView1Pick3NbrsLeg3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3NbrsLeg3'
          end
          object cxGrid1DBCardView1IsPick4MatchedFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick4MatchedFirstRace'
          end
          object cxGrid1DBCardView1IsPick4MatchedLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick4MatchedLastRace'
          end
          object cxGrid1DBCardView1Pick4FirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4FirstRace'
          end
          object cxGrid1DBCardView1Pick4LastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4LastRace'
          end
          object cxGrid1DBCardView1Pick4NbrsFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsFirstRace'
          end
          object cxGrid1DBCardView1Pick4NbrsLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsLastRace'
          end
          object cxGrid1DBCardView1Pick4WagerFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4WagerFirstRace'
          end
          object cxGrid1DBCardView1Pick4WagerLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4WagerLastRace'
          end
          object cxGrid1DBCardView1Pick4PayoutFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4PayoutFirstRace'
          end
          object cxGrid1DBCardView1Pick4PayoutLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4PayoutLastRace'
          end
          object cxGrid1DBCardView1Pick4NbrsLeg1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsLeg1'
          end
          object cxGrid1DBCardView1Pick4NbrsLeg2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsLeg2'
          end
          object cxGrid1DBCardView1Pick4NbrsLeg3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsLeg3'
          end
          object cxGrid1DBCardView1Pick4NbrsLeg4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4NbrsLeg4'
          end
          object cxGrid1DBCardView1IsPick6MatchedFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick6MatchedFirstRace'
          end
          object cxGrid1DBCardView1IsPick6MatchedLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPick6MatchedLastRace'
          end
          object cxGrid1DBCardView1Pick6FirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6FirstRace'
          end
          object cxGrid1DBCardView1Pick6LastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6LastRace'
          end
          object cxGrid1DBCardView1Pick6NbrsFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6NbrsFirstRace'
          end
          object cxGrid1DBCardView1Pick6NbrsLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6NbrsLastRace'
          end
          object cxGrid1DBCardView1Pick6WagerFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6WagerFirstRace'
          end
          object cxGrid1DBCardView1Pick6WagerLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6WagerLastRace'
          end
          object cxGrid1DBCardView1Pick6PayoutFirstRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6PayoutFirstRace'
          end
          object cxGrid1DBCardView1Pick6PayoutLastRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6PayoutLastRace'
          end
          object cxGrid1DBCardView1IsWinMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsWinMatched'
          end
          object cxGrid1DBCardView1WinNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WinNbrs'
          end
          object cxGrid1DBCardView1WinPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WinPayout'
          end
          object cxGrid1DBCardView1WinPlcPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WinPlcPayout'
          end
          object cxGrid1DBCardView1WinShoPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WinShoPayout'
          end
          object cxGrid1DBCardView1IsPlcMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPlcMatched'
          end
          object cxGrid1DBCardView1PlcNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PlcNbrs'
          end
          object cxGrid1DBCardView1PlcPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PlcPayout'
          end
          object cxGrid1DBCardView1PlcShoPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PlcShoPayout'
          end
          object cxGrid1DBCardView1IsShoMatched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsShoMatched'
          end
          object cxGrid1DBCardView1ShoNbrs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ShoNbrs'
          end
          object cxGrid1DBCardView1ShoPayout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ShoPayout'
          end
          object cxGrid1DBCardView1Weather: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Weather'
          end
          object cxGrid1DBCardView1Value: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Value'
          end
          object cxGrid1DBCardView1Chalk: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Chalk'
          end
          object cxGrid1DBCardView1Wager1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager1'
          end
          object cxGrid1DBCardView1Wager2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager2'
          end
          object cxGrid1DBCardView1Wager3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager3'
          end
          object cxGrid1DBCardView1Wager4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager4'
          end
          object cxGrid1DBCardView1Wager5: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager5'
          end
          object cxGrid1DBCardView1Wager6: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Wager6'
          end
          object cxGrid1DBCardView1AltWager1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager1'
          end
          object cxGrid1DBCardView1AltWager2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager2'
          end
          object cxGrid1DBCardView1AltWager3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager3'
          end
          object cxGrid1DBCardView1AltWager4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager4'
          end
          object cxGrid1DBCardView1AltWager5: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager5'
          end
          object cxGrid1DBCardView1AltWager6: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AltWager6'
          end
          object cxGrid1DBCardView1WagerFinalOrder: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WagerFinalOrder'
          end
          object cxGrid1DBCardView1WagerSheetOrder: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WagerSheetOrder'
          end
          object cxGrid1DBCardView1TodaysWagerOrder: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerOrder'
          end
          object cxGrid1DBCardView1WPSWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WPSWagerAmt'
          end
          object cxGrid1DBCardView1ExaWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ExaWagerAmt'
          end
          object cxGrid1DBCardView1QuiWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QuiWagerAmt'
          end
          object cxGrid1DBCardView1DDWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DDWagerAmt'
          end
          object cxGrid1DBCardView1Pk3WagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk3WagerAmt'
          end
          object cxGrid1DBCardView1Pk4WagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk4WagerAmt'
          end
          object cxGrid1DBCardView1Pk6WagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk6WagerAmt'
          end
          object cxGrid1DBCardView1TriWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TriWagerAmt'
          end
          object cxGrid1DBCardView1SfcWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SfcWagerAmt'
          end
          object cxGrid1DBCardView1NbrStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrStarters'
          end
          object cxGrid1DBCardView1NbrDebutStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrDebutStarters'
          end
          object cxGrid1DBCardView1NbrDebutTwoStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrDebutTwoStarters'
          end
          object cxGrid1DBCardView1NbrTurfDebutStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrTurfDebutStarters'
          end
          object cxGrid1DBCardView1NbrRouteDebutStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrRouteDebutStarters'
          end
          object cxGrid1DBCardView1NbrScratchedStarters: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrScratchedStarters'
          end
          object cxGrid1DBCardView1NbrRunners: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrRunners'
          end
          object cxGrid1DBCardView1RaceTypeDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceTypeDesc'
          end
          object cxGrid1DBCardView1RaceDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceDesc'
          end
          object cxGrid1DBCardView1RaceCondition: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceCondition'
          end
          object cxGrid1DBCardView1IsTurfRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfRace'
          end
          object cxGrid1DBCardView1IsRouteRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsRouteRace'
          end
          object cxGrid1DBCardView1IsMaidenSpecialRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsMaidenSpecialRace'
          end
          object cxGrid1DBCardView1IsMaidenClaimingRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsMaidenClaimingRace'
          end
          object cxGrid1DBCardView1IsMaidenOrTurfRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsMaidenOrTurfRace'
          end
          object cxGrid1DBCardView1IsTwoYearOldRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTwoYearOldRace'
          end
          object cxGrid1DBCardView1IsClaimingRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsClaimingRace'
          end
          object cxGrid1DBCardView1AgeSexRestriction: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AgeSexRestriction'
          end
          object cxGrid1DBCardView1SimulcastTrkCode: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SimulcastTrkCode'
          end
          object cxGrid1DBCardView1SimulcastRaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SimulcastRaceNbr'
          end
          object cxGrid1DBCardView1RaceAutoInc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceAutoInc'
          end
          object cxGrid1DBCardView1TimeDiff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TimeDiff'
          end
          object cxGrid1DBCardView1WagerType: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WagerType'
          end
          object cxGrid1DBCardView1NbrTriKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrTriKey'
          end
          object cxGrid1DBCardView1TotalPk3Choices: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalPk3Choices'
          end
          object cxGrid1DBCardView1Pk3KeyType: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk3KeyType'
          end
          object cxGrid1DBCardView1Pk3Selected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pk3Selected'
          end
          object cxGrid1DBCardView1TotalTriChoices: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalTriChoices'
          end
          object cxGrid1DBCardView1TotalSuperChoices: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalSuperChoices'
          end
          object cxGrid1DBCardView1TotalDDChoices: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalDDChoices'
          end
          object cxGrid1DBCardView1TopLastSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopLastSpeed'
          end
          object cxGrid1DBCardView1TopBackSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopBackSpeed'
          end
          object cxGrid1DBCardView1DD: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DD'
          end
          object cxGrid1DBCardView1Pick3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick3'
          end
          object cxGrid1DBCardView1Pick4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick4'
          end
          object cxGrid1DBCardView1Pick6: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Pick6'
          end
          object cxGrid1DBCardView1ParTime: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ParTime'
          end
          object cxGrid1DBCardView1IsCreateAngle: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreateAngle'
          end
          object cxGrid1DBCardView1IsCreateValue: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreateValue'
          end
          object cxGrid1DBCardView1IsCreateTip: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreateTip'
          end
          object cxGrid1DBCardView1IsCreatePk3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreatePk3'
          end
          object cxGrid1DBCardView1IsCreateDetail: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreateDetail'
          end
          object cxGrid1DBCardView1IsCreateAlt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsCreateAlt'
          end
          object cxGrid1DBCardView1RacePicks: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RacePicks'
          end
          object cxGrid1DBCardView1IsRacePicksAvailable: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsRacePicksAvailable'
          end
          object cxGrid1DBCardView1TopEarlyPace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopEarlyPace'
          end
          object cxGrid1DBCardView1TopMiddlePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopMiddlePace'
          end
          object cxGrid1DBCardView1TopLatePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopLatePace'
          end
          object cxGrid1DBCardView1TopEarlyPacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopEarlyPacePos'
          end
          object cxGrid1DBCardView1TopMiddlePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopMiddlePacePos'
          end
          object cxGrid1DBCardView1TopLatePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TopLatePacePos'
          end
          object cxGrid1DBCardView1SecondEarlyPace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondEarlyPace'
          end
          object cxGrid1DBCardView1SecondMiddlePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondMiddlePace'
          end
          object cxGrid1DBCardView1SecondLatePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondLatePace'
          end
          object cxGrid1DBCardView1SecondEarlyPacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondEarlyPacePos'
          end
          object cxGrid1DBCardView1SecondMiddlePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondMiddlePacePos'
          end
          object cxGrid1DBCardView1SecondLatePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondLatePacePos'
          end
          object cxGrid1DBCardView1TotalMorningLineTo1Probability: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalMorningLineTo1Probability'
          end
          object cxGrid1DBCardView1TotalFinalLineTo1Probability: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TotalFinalLineTo1Probability'
          end
          object cxGrid1DBCardView1MaxWPSBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MaxWPSBet'
          end
          object cxGrid1DBCardView1MaxGimmickBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MaxGimmickBet'
          end
          object cxGrid1DBCardView1TrkCode: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrkCode'
          end
          object cxGrid1DBCardView1RaceDate: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceDate'
          end
          object cxGrid1DBCardView1RaceNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceNbr'
          end
          object cxGrid1DBCardView1RangeRaceDate: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RangeRaceDate'
          end
          object cxGrid1DBCardView1RaceType: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RaceType'
          end
          object cxGrid1DBCardView1TypeOfRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TypeOfRace'
          end
          object cxGrid1DBCardView1Surface: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Surface'
          end
          object cxGrid1DBCardView1DistanceInFurlongs: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DistanceInFurlongs'
          end
          object cxGrid1DBCardView1PostPos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PostPos'
          end
          object cxGrid1DBCardView1ProgramNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ProgramNbr'
          end
          object cxGrid1DBCardView1ProgNbrSort: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ProgNbrSort'
          end
          object cxGrid1DBCardView1MorningLineDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MorningLineDesc'
          end
          object cxGrid1DBCardView1MorningLineTo1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MorningLineTo1'
          end
          object cxGrid1DBCardView1MorningLineTo1Rank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MorningLineTo1Rank'
          end
          object cxGrid1DBCardView1FinishPos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinishPos'
          end
          object cxGrid1DBCardView1Odds: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Odds'
          end
          object cxGrid1DBCardView1IsFavorite: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFavorite'
          end
          object cxGrid1DBCardView1HorseName: TcxGridDBCardViewRow
            DataBinding.FieldName = 'HorseName'
          end
          object cxGrid1DBCardView1HorseNbr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'HorseNbr'
          end
          object cxGrid1DBCardView1Sex: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Sex'
          end
          object cxGrid1DBCardView1Age: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Age'
          end
          object cxGrid1DBCardView1Equip: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Equip'
          end
          object cxGrid1DBCardView1Med: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Med'
          end
          object cxGrid1DBCardView1IsFirstTimeJuice: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFirstTimeJuice'
          end
          object cxGrid1DBCardView1IsSecondTimeJuice: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSecondTimeJuice'
          end
          object cxGrid1DBCardView1IsDebut: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDebut'
          end
          object cxGrid1DBCardView1IsDebutTwo: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDebutTwo'
          end
          object cxGrid1DBCardView1IsTurfDebut: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfDebut'
          end
          object cxGrid1DBCardView1DebutIndicator: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DebutIndicator'
          end
          object cxGrid1DBCardView1TurfIndicator: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TurfIndicator'
          end
          object cxGrid1DBCardView1MudIndicator: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MudIndicator'
          end
          object cxGrid1DBCardView1RouteIndicator: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RouteIndicator'
          end
          object cxGrid1DBCardView1IsClaimed1Back: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsClaimed1Back'
          end
          object cxGrid1DBCardView1IsClaimed2Back: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsClaimed2Back'
          end
          object cxGrid1DBCardView1IsDirtToTurf: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDirtToTurf'
          end
          object cxGrid1DBCardView1IsTurfToDirt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfToDirt'
          end
          object cxGrid1DBCardView1IsSprToRte: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSprToRte'
          end
          object cxGrid1DBCardView1IsRteToSpr: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsRteToSpr'
          end
          object cxGrid1DBCardView1DaysLast: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DaysLast'
          end
          object cxGrid1DBCardView1DaysLastWork: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DaysLastWork'
          end
          object cxGrid1DBCardView1DaysLastWork2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DaysLastWork2'
          end
          object cxGrid1DBCardView1DaysLastWork3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DaysLastWork3'
          end
          object cxGrid1DBCardView1NbrWorksLast: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrWorksLast'
          end
          object cxGrid1DBCardView1StartsWorks21: TcxGridDBCardViewRow
            DataBinding.FieldName = 'StartsWorks21'
          end
          object cxGrid1DBCardView1JkyEquibaseKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'JkyEquibaseKey'
          end
          object cxGrid1DBCardView1TrnEquibaseKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrnEquibaseKey'
          end
          object cxGrid1DBCardView1SireName: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SireName'
          end
          object cxGrid1DBCardView1DamSireName: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DamSireName'
          end
          object cxGrid1DBCardView1DamName: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DamName'
          end
          object cxGrid1DBCardView1BredIn: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BredIn'
          end
          object cxGrid1DBCardView1Owner: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Owner'
          end
          object cxGrid1DBCardView1Breeder: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Breeder'
          end
          object cxGrid1DBCardView1LastSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LastSpeed'
          end
          object cxGrid1DBCardView1LastSpeedRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LastSpeedRank'
          end
          object cxGrid1DBCardView1Power: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Power'
          end
          object cxGrid1DBCardView1PowerRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PowerRank'
          end
          object cxGrid1DBCardView1BackSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BackSpeed'
          end
          object cxGrid1DBCardView1BackSpeedRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BackSpeedRank'
          end
          object cxGrid1DBCardView1EarlyPace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EarlyPace'
          end
          object cxGrid1DBCardView1EarlyPaceRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EarlyPaceRank'
          end
          object cxGrid1DBCardView1EarlyPacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EarlyPacePos'
          end
          object cxGrid1DBCardView1EarlyPacePosRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EarlyPacePosRank'
          end
          object cxGrid1DBCardView1MiddlePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MiddlePace'
          end
          object cxGrid1DBCardView1MiddlePaceRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MiddlePaceRank'
          end
          object cxGrid1DBCardView1MiddlePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MiddlePacePos'
          end
          object cxGrid1DBCardView1MiddlePacePosRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MiddlePacePosRank'
          end
          object cxGrid1DBCardView1LatePace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LatePace'
          end
          object cxGrid1DBCardView1LatePaceRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LatePaceRank'
          end
          object cxGrid1DBCardView1LatePacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LatePacePos'
          end
          object cxGrid1DBCardView1LatePacePosRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LatePacePosRank'
          end
          object cxGrid1DBCardView1FinishPacePos: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinishPacePos'
          end
          object cxGrid1DBCardView1FinishPacePosRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinishPacePosRank'
          end
          object cxGrid1DBCardView1AvgClass: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgClass'
          end
          object cxGrid1DBCardView1AvgClassRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgClassRank'
          end
          object cxGrid1DBCardView1FinalOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinalOrderKey'
          end
          object cxGrid1DBCardView1FinalWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinalWinPct'
          end
          object cxGrid1DBCardView1FinalWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinalWinPctRank'
          end
          object cxGrid1DBCardView1FinalValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'FinalValueBet'
          end
          object cxGrid1DBCardView1PrimaryOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PrimaryOrderKey'
          end
          object cxGrid1DBCardView1PrimaryWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PrimaryWinPct'
          end
          object cxGrid1DBCardView1PrimaryWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PrimaryWinPctRank'
          end
          object cxGrid1DBCardView1PrimaryValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PrimaryValueBet'
          end
          object cxGrid1DBCardView1SecondaryOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondaryOrderKey'
          end
          object cxGrid1DBCardView1SecondaryWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondaryWinPct'
          end
          object cxGrid1DBCardView1SecondaryWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondaryWinPctRank'
          end
          object cxGrid1DBCardView1SecondaryValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SecondaryValueBet'
          end
          object cxGrid1DBCardView1DefaultOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DefaultOrderKey'
          end
          object cxGrid1DBCardView1DefaultWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DefaultWinPct'
          end
          object cxGrid1DBCardView1DefaultWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DefaultWinPctRank'
          end
          object cxGrid1DBCardView1DefaultValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'DefaultValueBet'
          end
          object cxGrid1DBCardView1AvgSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgSpeed'
          end
          object cxGrid1DBCardView1AvgSpeedRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgSpeedRank'
          end
          object cxGrid1DBCardView1AvgClassRating: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgClassRating'
          end
          object cxGrid1DBCardView1AvgClassRatingRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgClassRatingRank'
          end
          object cxGrid1DBCardView1BackClass: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BackClass'
          end
          object cxGrid1DBCardView1BackClassRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'BackClassRank'
          end
          object cxGrid1DBCardView1LastClass: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LastClass'
          end
          object cxGrid1DBCardView1LastClassRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LastClassRank'
          end
          object cxGrid1DBCardView1IsDollar: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDollar'
          end
          object cxGrid1DBCardView1IsDoubleDollar: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDoubleDollar'
          end
          object cxGrid1DBCardView1IsFrontDoubleLiner0: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleLiner0'
          end
          object cxGrid1DBCardView1IsFrontDoubleLiner1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleLiner1'
          end
          object cxGrid1DBCardView1IsFrontDoubleLiner2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleLiner2'
          end
          object cxGrid1DBCardView1IsFrontDoubleLiner3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleLiner3'
          end
          object cxGrid1DBCardView1IsBackDoubleLiner0: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleLiner0'
          end
          object cxGrid1DBCardView1IsBackDoubleLiner1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleLiner1'
          end
          object cxGrid1DBCardView1IsBackDoubleLiner2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleLiner2'
          end
          object cxGrid1DBCardView1IsBackDoubleLiner3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleLiner3'
          end
          object cxGrid1DBCardView1IsTripleLiner0: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleLiner0'
          end
          object cxGrid1DBCardView1IsTripleLiner1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleLiner1'
          end
          object cxGrid1DBCardView1IsTripleLiner2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleLiner2'
          end
          object cxGrid1DBCardView1IsTripleLiner3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleLiner3'
          end
          object cxGrid1DBCardView1IsFrontDoubleLiner: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleLiner'
          end
          object cxGrid1DBCardView1IsBackDoubleLiner: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleLiner'
          end
          object cxGrid1DBCardView1IsTripleDot: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleDot'
          end
          object cxGrid1DBCardView1IsFrontDoubleDot: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFrontDoubleDot'
          end
          object cxGrid1DBCardView1IsBackDoubleDot: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBackDoubleDot'
          end
          object cxGrid1DBCardView1IsTripleLiner: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTripleLiner'
          end
          object cxGrid1DBCardView1IsLayoffAndUp: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsLayoffAndUp'
          end
          object cxGrid1DBCardView1IsClaimedAndUp: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsClaimedAndUp'
          end
          object cxGrid1DBCardView1IsClaimedAndDown: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsClaimedAndDown'
          end
          object cxGrid1DBCardView1IsFirstTimeClaiming: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFirstTimeClaiming'
          end
          object cxGrid1DBCardView1IsBelowClaimedPrice: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBelowClaimedPrice'
          end
          object cxGrid1DBCardView1AngleDesc: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AngleDesc'
          end
          object cxGrid1DBCardView1IsBlinkersOn: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBlinkersOn'
          end
          object cxGrid1DBCardView1IsBlinkersOff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBlinkersOff'
          end
          object cxGrid1DBCardView1LastEquip: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LastEquip'
          end
          object cxGrid1DBCardView1EstTimeOfRace_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstTimeOfRace_1'
          end
          object cxGrid1DBCardView1EstTimeOfFirstRace_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstTimeOfFirstRace_1'
          end
          object cxGrid1DBCardView1NbrDebutStarters_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'NbrDebutStarters_1'
          end
          object cxGrid1DBCardView1AvgPurse: TcxGridDBCardViewRow
            DataBinding.FieldName = 'AvgPurse'
          end
          object cxGrid1DBCardView1Entry: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Entry'
          end
          object cxGrid1DBCardView1ProgramNbrSort: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ProgramNbrSort'
          end
          object cxGrid1DBCardView1IsScratched: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsScratched'
          end
          object cxGrid1DBCardView1Color: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Color'
          end
          object cxGrid1DBCardView1Weight: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Weight'
          end
          object cxGrid1DBCardView1EstMorningLineOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstMorningLineOrderKey'
          end
          object cxGrid1DBCardView1EstMorningLineWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstMorningLineWinPct'
          end
          object cxGrid1DBCardView1EstMorningLineValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstMorningLineValueBet'
          end
          object cxGrid1DBCardView1EarlyPaceAdvantage: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EarlyPaceAdvantage'
          end
          object cxGrid1DBCardView1MiddlePaceAdvantage: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MiddlePaceAdvantage'
          end
          object cxGrid1DBCardView1LatePaceAdvantage: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LatePaceAdvantage'
          end
          object cxGrid1DBCardView1LifeStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LifeStarts'
          end
          object cxGrid1DBCardView1LifeWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'LifeWins'
          end
          object cxGrid1DBCardView1TurfStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TurfStarts'
          end
          object cxGrid1DBCardView1TurfWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TurfWins'
          end
          object cxGrid1DBCardView1MudStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MudStarts'
          end
          object cxGrid1DBCardView1MudWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'MudWins'
          end
          object cxGrid1DBCardView1TrkStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrkStarts'
          end
          object cxGrid1DBCardView1TrkWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrkWins'
          end
          object cxGrid1DBCardView1RouteStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RouteStarts'
          end
          object cxGrid1DBCardView1RouteWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'RouteWins'
          end
          object cxGrid1DBCardView1SprintStarts: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SprintStarts'
          end
          object cxGrid1DBCardView1SprintWins: TcxGridDBCardViewRow
            DataBinding.FieldName = 'SprintWins'
          end
          object cxGrid1DBCardView1QSP1stCall: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP1stCall'
          end
          object cxGrid1DBCardView1QSP1stCallRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP1stCallRank'
          end
          object cxGrid1DBCardView1QSP2ndCall: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP2ndCall'
          end
          object cxGrid1DBCardView1QSP2ndCallRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP2ndCallRank'
          end
          object cxGrid1DBCardView1KSP1stCall: TcxGridDBCardViewRow
            DataBinding.FieldName = 'KSP1stCall'
          end
          object cxGrid1DBCardView1KSP1stCallRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'KSP1stCallRank'
          end
          object cxGrid1DBCardView1KSP2ndCall: TcxGridDBCardViewRow
            DataBinding.FieldName = 'KSP2ndCall'
          end
          object cxGrid1DBCardView1KSP2ndCallRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'KSP2ndCallRank'
          end
          object cxGrid1DBCardView1QSP1stCallRunStyle: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP1stCallRunStyle'
          end
          object cxGrid1DBCardView1QSP2ndCallRunStyle: TcxGridDBCardViewRow
            DataBinding.FieldName = 'QSP2ndCallRunStyle'
          end
          object cxGrid1DBCardView1WagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WagerAmt'
          end
          object cxGrid1DBCardView1WinWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'WinWagerAmt'
          end
          object cxGrid1DBCardView1PlcWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'PlcWagerAmt'
          end
          object cxGrid1DBCardView1ShoWagerAmt: TcxGridDBCardViewRow
            DataBinding.FieldName = 'ShoWagerAmt'
          end
          object cxGrid1DBCardView1TodaysWagerOrderKey: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerOrderKey'
          end
          object cxGrid1DBCardView1IsUpInClass: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsUpInClass'
          end
          object cxGrid1DBCardView1IsDownInClass: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDownInClass'
          end
          object cxGrid1DBCardView1Is1stClaiming: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stClaiming'
          end
          object cxGrid1DBCardView1Is1stMCL: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stMCL'
          end
          object cxGrid1DBCardView1IsHiddenWorkout: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsHiddenWorkout'
          end
          object cxGrid1DBCardView1Is1stAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stAfterLayoff'
          end
          object cxGrid1DBCardView1Is2ndAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is2ndAfterLayoff'
          end
          object cxGrid1DBCardView1Is3rdAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is3rdAfterLayoff'
          end
          object cxGrid1DBCardView1IsDirtToTurfToDirtAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsDirtToTurfToDirtAfterLayoff'
          end
          object cxGrid1DBCardView1IsTurfToDirtToTurfAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfToDirtToTurfAfterLayoff'
          end
          object cxGrid1DBCardView1IsRouteToSprintToRouteAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsRouteToSprintToRouteAfterLayoff'
          end
          object cxGrid1DBCardView1IsSprintToRouteToSprintAfterLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSprintToRouteToSprintAfterLayoff'
          end
          object cxGrid1DBCardView1IsOnlySpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsOnlySpeed'
          end
          object cxGrid1DBCardView1IsProvenSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsProvenSpeed'
          end
          object cxGrid1DBCardView1IsProvenSpeedPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsProvenSpeedPlus'
          end
          object cxGrid1DBCardView1IsXtremeSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsXtremeSpeed'
          end
          object cxGrid1DBCardView1IsLastRaceTurnMove: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsLastRaceTurnMove'
          end
          object cxGrid1DBCardView1IsLastRaceFinalFurlongMove: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsLastRaceFinalFurlongMove'
          end
          object cxGrid1DBCardView1IsPrevToLastRaceTurnMove: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPrevToLastRaceTurnMove'
          end
          object cxGrid1DBCardView1IsPrevToLastRaceFinalFurlongMove: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPrevToLastRaceFinalFurlongMove'
          end
          object cxGrid1DBCardView1Is2yoBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is2yoBred'
          end
          object cxGrid1DBCardView1Is1stBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stBred'
          end
          object cxGrid1DBCardView1IsTurfBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfBred'
          end
          object cxGrid1DBCardView1IsQuirinSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsQuirinSpeed'
          end
          object cxGrid1DBCardView1IsKleinSpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsKleinSpeed'
          end
          object cxGrid1DBCardView1IsKeyRace: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsKeyRace'
          end
          object cxGrid1DBCardView1IsBouncyBouncy: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBouncyBouncy'
          end
          object cxGrid1DBCardView1IsBestEffortLast: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBestEffortLast'
          end
          object cxGrid1DBCardView1IsShipIn: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsShipIn'
          end
          object cxGrid1DBCardView1IsYouBetTrack_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsYouBetTrack_1'
          end
          object cxGrid1DBCardView1IsPrintedOnValueSheet_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsPrintedOnValueSheet_1'
          end
          object cxGrid1DBCardView1IsWagerSheetSelected_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsWagerSheetSelected_1'
          end
          object cxGrid1DBCardView1IsOverlaySheetSelected_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsOverlaySheetSelected_1'
          end
          object cxGrid1DBCardView1IsLinerSheetSelected_1: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsLinerSheetSelected_1'
          end
          object cxGrid1DBCardView1IsVerifiedClaim: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsVerifiedClaim'
          end
          object cxGrid1DBCardView1IsBetLast: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsBetLast'
          end
          object cxGrid1DBCardView1IsUltimateFormFactor: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsUltimateFormFactor'
          end
          object cxGrid1DBCardView1Is1stOffLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stOffLayoff'
          end
          object cxGrid1DBCardView1Is2ndOffLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is2ndOffLayoff'
          end
          object cxGrid1DBCardView1Is3rdOffLayoff: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is3rdOffLayoff'
          end
          object cxGrid1DBCardView1IsFormConsistent: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsFormConsistent'
          end
          object cxGrid1DBCardView1IsX1stBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsX1stBred'
          end
          object cxGrid1DBCardView1IsX2yoBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsX2yoBred'
          end
          object cxGrid1DBCardView1IsXTurfBred: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsXTurfBred'
          end
          object cxGrid1DBCardView1IsUnexpectedEarlySpeed: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsUnexpectedEarlySpeed'
          end
          object cxGrid1DBCardView1IsTrnDebutPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrnDebutPlus'
          end
          object cxGrid1DBCardView1IsTrnDebutTwoPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrnDebutTwoPlus'
          end
          object cxGrid1DBCardView1IsTrn2yoPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrn2yoPlus'
          end
          object cxGrid1DBCardView1IsTrnTurfPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrnTurfPlus'
          end
          object cxGrid1DBCardView1IsTrnTodayPlus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrnTodayPlus'
          end
          object cxGrid1DBCardView1IsTrnTodayMinus: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTrnTodayMinus'
          end
          object cxGrid1DBCardView1IsXtremeSpeed2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsXtremeSpeed2'
          end
          object cxGrid1DBCardView1IsQuirinSpeed2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsQuirinSpeed2'
          end
          object cxGrid1DBCardView1IsKleinSpeed2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsKleinSpeed2'
          end
          object cxGrid1DBCardView1Is2yoBredSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is2yoBredSheetSelected'
          end
          object cxGrid1DBCardView1IsTurfBredSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsTurfBredSheetSelected'
          end
          object cxGrid1DBCardView1Is1stBredSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'Is1stBredSheetSelected'
          end
          object cxGrid1DBCardView1IsSpeedSheetSelected: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsSpeedSheetSelected'
          end
          object cxGrid1DBCardView1EstMorningLineTo1Fair: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstMorningLineTo1Fair'
          end
          object cxGrid1DBCardView1TodaysWagerWinPct: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerWinPct'
          end
          object cxGrid1DBCardView1TodaysWagerValueBet: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerValueBet'
          end
          object cxGrid1DBCardView1TodaysWagerLineTo1Fair: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerLineTo1Fair'
          end
          object cxGrid1DBCardView1EstMorningLineWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'EstMorningLineWinPctRank'
          end
          object cxGrid1DBCardView1TodaysWagerWinPctRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TodaysWagerWinPctRank'
          end
          object cxGrid1DBCardView1TrnWinsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrnWinsRank'
          end
          object cxGrid1DBCardView1TrnEarningsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrnEarningsRank'
          end
          object cxGrid1DBCardView1TrnTrackRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'TrnTrackRank'
          end
          object cxGrid1DBCardView1JkyWinsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'JkyWinsRank'
          end
          object cxGrid1DBCardView1JkyEarningsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'JkyEarningsRank'
          end
          object cxGrid1DBCardView1JkyTrackRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'JkyTrackRank'
          end
          object cxGrid1DBCardView1OwnWinsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'OwnWinsRank'
          end
          object cxGrid1DBCardView1OwnEarningsRank: TcxGridDBCardViewRow
            DataBinding.FieldName = 'OwnEarningsRank'
          end
          object cxGrid1DBCardView1IsOnlySpeed2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsOnlySpeed2'
          end
          object cxGrid1DBCardView1IsOnStandingInList: TcxGridDBCardViewRow
            DataBinding.FieldName = 'IsOnStandingInList'
          end
          object cxGrid1DBCardView1b2: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b2'
          end
          object cxGrid1DBCardView1b3: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b3'
          end
          object cxGrid1DBCardView1b4: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b4'
          end
          object cxGrid1DBCardView1b5: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b5'
          end
          object cxGrid1DBCardView1b6: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b6'
          end
          object cxGrid1DBCardView1b7: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b7'
          end
          object cxGrid1DBCardView1b8: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b8'
          end
          object cxGrid1DBCardView1b9: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b9'
          end
          object cxGrid1DBCardView1b10: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b10'
          end
          object cxGrid1DBCardView1b11: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b11'
          end
          object cxGrid1DBCardView1b12: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b12'
          end
          object cxGrid1DBCardView1b13: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b13'
          end
          object cxGrid1DBCardView1b14: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b14'
          end
          object cxGrid1DBCardView1b15: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b15'
          end
          object cxGrid1DBCardView1b16: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b16'
          end
          object cxGrid1DBCardView1b17: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b17'
          end
          object cxGrid1DBCardView1b18: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b18'
          end
          object cxGrid1DBCardView1b19: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b19'
          end
          object cxGrid1DBCardView1b20: TcxGridDBCardViewRow
            DataBinding.FieldName = 'b20'
          end
        end
        object cxGrid1DBChartView1: TcxGridDBChartView
          DiagramColumn.Active = True
        end
        object cxGrid1Level2: TcxGridLevel
          Caption = 'Banded'
          GridView = cxGrid1DBBandedTableView1
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'cxTabSheet3'
      ImageIndex = 2
      object cxSpreadSheetBook1: TcxSpreadSheetBook
        Left = 0
        Top = 0
        Width = 746
        Height = 540
        Align = alClient
        DefaultStyle.Font.Name = 'MS Sans Serif'
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'MS Sans Serif'
        HeaderFont.Style = []
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'cxTabSheet4'
      ImageIndex = 3
      object cxDBVerticalGrid1: TcxDBVerticalGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 406
        LayoutStyle = lsBandsView
        OptionsView.RowHeaderWidth = 231
        TabOrder = 0
        DataController.DataSource = dsAll
        object cxDBVerticalGrid1CategoryRow1: TcxCategoryRow
        end
        object cxDBVerticalGrid1DBEditorRow1: TcxDBEditorRow
          Properties.DataBinding.FieldName = 'TrkCode'
        end
        object cxDBVerticalGrid1DBMultiEditorRow1: TcxDBMultiEditorRow
          Properties.Editors = <>
        end
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 606
    Width = 1019
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
  end
  object cxDBExtLookupComboBox1: TcxDBExtLookupComboBox
    Left = 304
    Top = 304
    DataBinding.DataField = 'Name'
    DataBinding.DataSource = dsSQLQuery
    TabOrder = 7
    Width = 145
  end
  object ElevateDBInfo: TDBISAMDBInfo
    DatabaseName = 'dbQuery'
    SessionName = 'Default'
    Left = 448
  end
  object dbQuery: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbQuery'
    Directory = 'C:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 696
  end
  object KDBStructureElevateDB: TKDBStructure
    DMEButtons = [dmbOpenSave]
    SEHelpContext = 0
    SQLFormats.Date = 'M/d/yyyy'
    SQLFormats.Time = 'h:mm AMPM'
    SQLFormats.DateTime = 'M/d/yyyy h:mm AMPM'
    SQLFormats.FalseValue = 'false'
    SQLFormats.TrueValue = 'true'
    SQLFormats.FullTableName = 'DB.OWNER.TABLE'
    DatabaseInfo = ElevateDBInfo
    DefOperators.Strings = (
      'Equal=is equal to'
      'NotEqual=is not equal to'
      'LessThan=is less than'
      'LessOrEqual=is less than or equal to'
      'GreaterThan=is greater than'
      'GreaterOrEqual=is greater than or equal to'
      'IsNull=is null'
      'InList=is in list'
      'NotInList=is not in list'
      'StartsWith=starts with'
      'NotStartsWith=does not start with'
      'Contains=contains'
      'NotContains=does not contain'
      'Between=is between'
      'NotBetween=is not between')
    ExOperators = [xoInList, xoBetween, xoStartsWith, xoContains]
    Left = 520
    Struct = (
      '[Main]'
      'Version=3.5'
      'OperatCount=15'
      'TableCount=3'
      'FieldCount=500'
      'CondCount=0'
      'FieldGroups=2'
      'DefaultMainTable='
      'RootFieldsFirst=1'
      ' '
      '[Operator:1]'
      'Name=Equal'
      'DisplayName=is equal to'
      'SQLName=@f = '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:2]'
      'Name=NotEqual'
      'DisplayName=is not equal to'
      'SQLName=@f <> '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:3]'
      'Name=LessThan'
      'DisplayName=is less than'
      'SQLName=@f < '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:4]'
      'Name=LessOrEqual'
      'DisplayName=is less than or equal to'
      'SQLName=@f <= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:5]'
      'Name=GreaterThan'
      'DisplayName=is greater than'
      'SQLName=@f >'#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:6]'
      'Name=GreaterOrEqual'
      'DisplayName=is greater than or equal to'
      'SQLName=@f >= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:7]'
      'Name=IsNull'
      'DisplayName=is null'
      'SQLName=@f is null'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftMemo,f' +
        'tFmtMemo,ftFixedChar,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:8]'
      'Name=InList'
      'DisplayName=is in list'
      'SQLName=@f in (@1)'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      ' '
      '[Operator:9]'
      'Name=NotInList'
      'DisplayName=is not in list'
      'SQLName=NOT (@f in (@1))'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      ' '
      '[Operator:10]'
      'Name=StartsWith'
      'DisplayName=starts with'
      'SQLName=@f like '#39'@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:11]'
      'Name=NotStartsWith'
      'DisplayName=does not start with'
      'SQLName=not(@f like '#39'@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:12]'
      'Name=Contains'
      'DisplayName=contains'
      'SQLName=@f like '#39'%@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:13]'
      'Name=NotContains'
      'DisplayName=does not contain'
      'SQLName=not(@f like '#39'%@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:14]'
      'Name=Between'
      'DisplayName=is between'
      'SQLName=@f between '#39'@1'#39' and '#39'@2'#39
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Operator:15]'
      'Name=NotBetween'
      'DisplayName=is not between'
      'SQLName=NOT (@f between '#39'@1'#39' and '#39'@2'#39')'
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      ' '
      '[Table:1]'
      'DBName=dbQuery'
      'Name=PrevDayHH'
      'DisplayName=PrevDayHH'
      'Alias=PrevDayHH'
      'Quoted=0'
      'Hints='
      'DsgnPos=362,81,110,160'
      'Links='
      ' '
      '[Table:2]'
      'DBName=dbQuery'
      'Name=PrevDayRH'
      'DisplayName=PrevDayRH'
      'Alias=PrevDayRH'
      'Quoted=0'
      'Hints='
      'DsgnPos=70,51,110,160'
      'Links=PrevDayHH'
      ' '
      '[Link:PrevDayRH-PrevDayHH]'
      'FldName1=TrkCode,fld:RaceDate,fld:RaceNbr'
      'FldName2=TrkCode,fld:RaceDate,fld:RaceNbr'
      'Operators==,=,='
      'QuoteFields=0'
      'LinkType=Inner'
      ' '
      '[Table:3]'
      'DBName=dbQuery'
      'Name=PrevDayRH'
      'DisplayName=PrevDayRH'
      'Alias=PrevDayRH'
      'Quoted=0'
      'Hints='
      'DsgnPos=12,550,110,160'
      'Links='
      ' '
      '[Field:1]'
      'ID=1'
      'Kind=kfkData'
      'FieldExpr=TrkCode'
      'DisplayName=TrkCode'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=3'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:2]'
      'ID=2'
      'Kind=kfkData'
      'FieldExpr=RaceDate'
      'DisplayName=RaceDate'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=9'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:3]'
      'ID=3'
      'Kind=kfkData'
      'FieldExpr=RaceNbr'
      'DisplayName=RaceNbr'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:4]'
      'ID=4'
      'Kind=kfkData'
      'FieldExpr=PostPos'
      'DisplayName=PostPos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:5]'
      'ID=5'
      'Kind=kfkData'
      'FieldExpr=RangeRaceDate'
      'DisplayName=RangeRaceDate'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=9'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:6]'
      'ID=6'
      'Kind=kfkData'
      'FieldExpr=RaceType'
      'DisplayName=RaceType'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:7]'
      'ID=7'
      'Kind=kfkData'
      'FieldExpr=TypeOfRace'
      'DisplayName=TypeOfRace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:8]'
      'ID=8'
      'Kind=kfkData'
      'FieldExpr=Surface'
      'DisplayName=Surface'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:9]'
      'ID=9'
      'Kind=kfkData'
      'FieldExpr=TrkCond'
      'DisplayName=TrkCond'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:10]'
      'ID=10'
      'Kind=kfkData'
      'FieldExpr=DistanceInFurlongs'
      'DisplayName=DistanceInFurlongs'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:11]'
      'ID=11'
      'Kind=kfkData'
      'FieldExpr=Purse'
      'DisplayName=Purse'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:12]'
      'ID=12'
      'Kind=kfkData'
      'FieldExpr=ClaimingPrice'
      'DisplayName=ClaimingPrice'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:13]'
      'ID=13'
      'Kind=kfkData'
      'FieldExpr=ProgramNbr'
      'DisplayName=ProgramNbr'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:14]'
      'ID=14'
      'Kind=kfkData'
      'FieldExpr=ProgNbrSort'
      'DisplayName=ProgNbrSort'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:15]'
      'ID=15'
      'Kind=kfkData'
      'FieldExpr=MorningLineDesc'
      'DisplayName=MorningLineDesc'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=6'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:16]'
      'ID=16'
      'Kind=kfkData'
      'FieldExpr=MorningLineTo1'
      'DisplayName=MorningLineTo1'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:17]'
      'ID=17'
      'Kind=kfkData'
      'FieldExpr=MorningLineTo1Rank'
      'DisplayName=MorningLineTo1Rank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:18]'
      'ID=18'
      'Kind=kfkData'
      'FieldExpr=FinishPos'
      'DisplayName=FinishPos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:19]'
      'ID=19'
      'Kind=kfkData'
      'FieldExpr=Odds'
      'DisplayName=Odds'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:20]'
      'ID=20'
      'Kind=kfkData'
      'FieldExpr=IsFavorite'
      'DisplayName=IsFavorite'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:21]'
      'ID=21'
      'Kind=kfkData'
      'FieldExpr=HorseName'
      'DisplayName=HorseName'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:22]'
      'ID=22'
      'Kind=kfkData'
      'FieldExpr=HorseNbr'
      'DisplayName=HorseNbr'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:23]'
      'ID=23'
      'Kind=kfkData'
      'FieldExpr=Sex'
      'DisplayName=Sex'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:24]'
      'ID=24'
      'Kind=kfkData'
      'FieldExpr=Age'
      'DisplayName=Age'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:25]'
      'ID=25'
      'Kind=kfkData'
      'FieldExpr=Equip'
      'DisplayName=Equip'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:26]'
      'ID=26'
      'Kind=kfkData'
      'FieldExpr=Med'
      'DisplayName=Med'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=5'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:27]'
      'ID=27'
      'Kind=kfkData'
      'FieldExpr=IsFirstTimeJuice'
      'DisplayName=IsFirstTimeJuice'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:28]'
      'ID=28'
      'Kind=kfkData'
      'FieldExpr=IsSecondTimeJuice'
      'DisplayName=IsSecondTimeJuice'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:29]'
      'ID=29'
      'Kind=kfkData'
      'FieldExpr=IsDebut'
      'DisplayName=IsDebut'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:30]'
      'ID=30'
      'Kind=kfkData'
      'FieldExpr=IsDebutTwo'
      'DisplayName=IsDebutTwo'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:31]'
      'ID=31'
      'Kind=kfkData'
      'FieldExpr=IsTurfDebut'
      'DisplayName=IsTurfDebut'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:32]'
      'ID=32'
      'Kind=kfkData'
      'FieldExpr=DebutIndicator'
      'DisplayName=DebutIndicator'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:33]'
      'ID=33'
      'Kind=kfkData'
      'FieldExpr=TurfIndicator'
      'DisplayName=TurfIndicator'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:34]'
      'ID=34'
      'Kind=kfkData'
      'FieldExpr=MudIndicator'
      'DisplayName=MudIndicator'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:35]'
      'ID=35'
      'Kind=kfkData'
      'FieldExpr=RouteIndicator'
      'DisplayName=RouteIndicator'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:36]'
      'ID=36'
      'Kind=kfkData'
      'FieldExpr=IsClaimed1Back'
      'DisplayName=IsClaimed1Back'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:37]'
      'ID=37'
      'Kind=kfkData'
      'FieldExpr=IsClaimed2Back'
      'DisplayName=IsClaimed2Back'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:38]'
      'ID=38'
      'Kind=kfkData'
      'FieldExpr=IsDirtToTurf'
      'DisplayName=IsDirtToTurf'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:39]'
      'ID=39'
      'Kind=kfkData'
      'FieldExpr=IsTurfToDirt'
      'DisplayName=IsTurfToDirt'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:40]'
      'ID=40'
      'Kind=kfkData'
      'FieldExpr=IsSprToRte'
      'DisplayName=IsSprToRte'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:41]'
      'ID=41'
      'Kind=kfkData'
      'FieldExpr=IsRteToSpr'
      'DisplayName=IsRteToSpr'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:42]'
      'ID=42'
      'Kind=kfkData'
      'FieldExpr=DaysLast'
      'DisplayName=DaysLast'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:43]'
      'ID=43'
      'Kind=kfkData'
      'FieldExpr=DaysLastWork'
      'DisplayName=DaysLastWork'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:44]'
      'ID=44'
      'Kind=kfkData'
      'FieldExpr=DaysLastWork2'
      'DisplayName=DaysLastWork2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:45]'
      'ID=45'
      'Kind=kfkData'
      'FieldExpr=DaysLastWork3'
      'DisplayName=DaysLastWork3'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:46]'
      'ID=46'
      'Kind=kfkData'
      'FieldExpr=NbrWorksLast'
      'DisplayName=NbrWorksLast'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:47]'
      'ID=47'
      'Kind=kfkData'
      'FieldExpr=StartsWorks21'
      'DisplayName=StartsWorks21'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:48]'
      'ID=48'
      'Kind=kfkData'
      'FieldExpr=JkyEquibaseKey'
      'DisplayName=JkyEquibaseKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:49]'
      'ID=49'
      'Kind=kfkData'
      'FieldExpr=TrnEquibaseKey'
      'DisplayName=TrnEquibaseKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:50]'
      'ID=50'
      'Kind=kfkData'
      'FieldExpr=SireName'
      'DisplayName=SireName'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=16'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:51]'
      'ID=51'
      'Kind=kfkData'
      'FieldExpr=DamSireName'
      'DisplayName=DamSireName'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=16'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:52]'
      'ID=52'
      'Kind=kfkData'
      'FieldExpr=DamName'
      'DisplayName=DamName'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:53]'
      'ID=53'
      'Kind=kfkData'
      'FieldExpr=BredIn'
      'DisplayName=BredIn'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=6'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:54]'
      'ID=54'
      'Kind=kfkData'
      'FieldExpr=Owner'
      'DisplayName=Owner'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=45'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:55]'
      'ID=55'
      'Kind=kfkData'
      'FieldExpr=Breeder'
      'DisplayName=Breeder'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=67'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:56]'
      'ID=56'
      'Kind=kfkData'
      'FieldExpr=LastSpeed'
      'DisplayName=LastSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:57]'
      'ID=57'
      'Kind=kfkData'
      'FieldExpr=LastSpeedRank'
      'DisplayName=LastSpeedRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:58]'
      'ID=58'
      'Kind=kfkData'
      'FieldExpr=Power'
      'DisplayName=Power'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:59]'
      'ID=59'
      'Kind=kfkData'
      'FieldExpr=PowerRank'
      'DisplayName=PowerRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:60]'
      'ID=60'
      'Kind=kfkData'
      'FieldExpr=BackSpeed'
      'DisplayName=BackSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:61]'
      'ID=61'
      'Kind=kfkData'
      'FieldExpr=BackSpeedRank'
      'DisplayName=BackSpeedRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:62]'
      'ID=62'
      'Kind=kfkData'
      'FieldExpr=EarlyPace'
      'DisplayName=EarlyPace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:63]'
      'ID=63'
      'Kind=kfkData'
      'FieldExpr=EarlyPaceRank'
      'DisplayName=EarlyPaceRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:64]'
      'ID=64'
      'Kind=kfkData'
      'FieldExpr=EarlyPacePos'
      'DisplayName=EarlyPacePos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:65]'
      'ID=65'
      'Kind=kfkData'
      'FieldExpr=EarlyPacePosRank'
      'DisplayName=EarlyPacePosRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:66]'
      'ID=66'
      'Kind=kfkData'
      'FieldExpr=MiddlePace'
      'DisplayName=MiddlePace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:67]'
      'ID=67'
      'Kind=kfkData'
      'FieldExpr=MiddlePaceRank'
      'DisplayName=MiddlePaceRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:68]'
      'ID=68'
      'Kind=kfkData'
      'FieldExpr=MiddlePacePos'
      'DisplayName=MiddlePacePos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:69]'
      'ID=69'
      'Kind=kfkData'
      'FieldExpr=MiddlePacePosRank'
      'DisplayName=MiddlePacePosRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:70]'
      'ID=70'
      'Kind=kfkData'
      'FieldExpr=LatePace'
      'DisplayName=LatePace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:71]'
      'ID=71'
      'Kind=kfkData'
      'FieldExpr=LatePaceRank'
      'DisplayName=LatePaceRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:72]'
      'ID=72'
      'Kind=kfkData'
      'FieldExpr=LatePacePos'
      'DisplayName=LatePacePos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:73]'
      'ID=73'
      'Kind=kfkData'
      'FieldExpr=LatePacePosRank'
      'DisplayName=LatePacePosRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:74]'
      'ID=74'
      'Kind=kfkData'
      'FieldExpr=FinishPacePos'
      'DisplayName=FinishPacePos'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:75]'
      'ID=75'
      'Kind=kfkData'
      'FieldExpr=FinishPacePosRank'
      'DisplayName=FinishPacePosRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:76]'
      'ID=76'
      'Kind=kfkData'
      'FieldExpr=AvgClass'
      'DisplayName=AvgClass'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:77]'
      'ID=77'
      'Kind=kfkData'
      'FieldExpr=AvgClassRank'
      'DisplayName=AvgClassRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:78]'
      'ID=78'
      'Kind=kfkData'
      'FieldExpr=FinalOrderKey'
      'DisplayName=FinalOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:79]'
      'ID=79'
      'Kind=kfkData'
      'FieldExpr=FinalWinPct'
      'DisplayName=FinalWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:80]'
      'ID=80'
      'Kind=kfkData'
      'FieldExpr=FinalWinPctRank'
      'DisplayName=FinalWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:81]'
      'ID=81'
      'Kind=kfkData'
      'FieldExpr=FinalValueBet'
      'DisplayName=FinalValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:82]'
      'ID=82'
      'Kind=kfkData'
      'FieldExpr=PrimaryOrderKey'
      'DisplayName=PrimaryOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:83]'
      'ID=83'
      'Kind=kfkData'
      'FieldExpr=PrimaryWinPct'
      'DisplayName=PrimaryWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:84]'
      'ID=84'
      'Kind=kfkData'
      'FieldExpr=PrimaryWinPctRank'
      'DisplayName=PrimaryWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:85]'
      'ID=85'
      'Kind=kfkData'
      'FieldExpr=PrimaryValueBet'
      'DisplayName=PrimaryValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:86]'
      'ID=86'
      'Kind=kfkData'
      'FieldExpr=SecondaryOrderKey'
      'DisplayName=SecondaryOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:87]'
      'ID=87'
      'Kind=kfkData'
      'FieldExpr=SecondaryWinPct'
      'DisplayName=SecondaryWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:88]'
      'ID=88'
      'Kind=kfkData'
      'FieldExpr=SecondaryWinPctRank'
      'DisplayName=SecondaryWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:89]'
      'ID=89'
      'Kind=kfkData'
      'FieldExpr=SecondaryValueBet'
      'DisplayName=SecondaryValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:90]'
      'ID=90'
      'Kind=kfkData'
      'FieldExpr=DefaultOrderKey'
      'DisplayName=DefaultOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:91]'
      'ID=91'
      'Kind=kfkData'
      'FieldExpr=DefaultWinPct'
      'DisplayName=DefaultWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:92]'
      'ID=92'
      'Kind=kfkData'
      'FieldExpr=DefaultWinPctRank'
      'DisplayName=DefaultWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:93]'
      'ID=93'
      'Kind=kfkData'
      'FieldExpr=DefaultValueBet'
      'DisplayName=DefaultValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:94]'
      'ID=94'
      'Kind=kfkData'
      'FieldExpr=AvgSpeed'
      'DisplayName=AvgSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:95]'
      'ID=95'
      'Kind=kfkData'
      'FieldExpr=AvgSpeedRank'
      'DisplayName=AvgSpeedRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:96]'
      'ID=96'
      'Kind=kfkData'
      'FieldExpr=AvgClassRating'
      'DisplayName=AvgClassRating'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:97]'
      'ID=97'
      'Kind=kfkData'
      'FieldExpr=AvgClassRatingRank'
      'DisplayName=AvgClassRatingRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:98]'
      'ID=98'
      'Kind=kfkData'
      'FieldExpr=BackClass'
      'DisplayName=BackClass'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:99]'
      'ID=99'
      'Kind=kfkData'
      'FieldExpr=BackClassRank'
      'DisplayName=BackClassRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:100]'
      'ID=100'
      'Kind=kfkData'
      'FieldExpr=LastClass'
      'DisplayName=LastClass'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:101]'
      'ID=101'
      'Kind=kfkData'
      'FieldExpr=LastClassRank'
      'DisplayName=LastClassRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:102]'
      'ID=102'
      'Kind=kfkData'
      'FieldExpr=IsDollar'
      'DisplayName=IsDollar'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:103]'
      'ID=103'
      'Kind=kfkData'
      'FieldExpr=IsDoubleDollar'
      'DisplayName=IsDoubleDollar'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:104]'
      'ID=104'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleLiner0'
      'DisplayName=IsFrontDoubleLiner0'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:105]'
      'ID=105'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleLiner1'
      'DisplayName=IsFrontDoubleLiner1'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:106]'
      'ID=106'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleLiner2'
      'DisplayName=IsFrontDoubleLiner2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:107]'
      'ID=107'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleLiner3'
      'DisplayName=IsFrontDoubleLiner3'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:108]'
      'ID=108'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleLiner0'
      'DisplayName=IsBackDoubleLiner0'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:109]'
      'ID=109'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleLiner1'
      'DisplayName=IsBackDoubleLiner1'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:110]'
      'ID=110'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleLiner2'
      'DisplayName=IsBackDoubleLiner2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:111]'
      'ID=111'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleLiner3'
      'DisplayName=IsBackDoubleLiner3'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:112]'
      'ID=112'
      'Kind=kfkData'
      'FieldExpr=IsTripleLiner0'
      'DisplayName=IsTripleLiner0'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:113]'
      'ID=113'
      'Kind=kfkData'
      'FieldExpr=IsTripleLiner1'
      'DisplayName=IsTripleLiner1'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:114]'
      'ID=114'
      'Kind=kfkData'
      'FieldExpr=IsTripleLiner2'
      'DisplayName=IsTripleLiner2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:115]'
      'ID=115'
      'Kind=kfkData'
      'FieldExpr=IsTripleLiner3'
      'DisplayName=IsTripleLiner3'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:116]'
      'ID=116'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleLiner'
      'DisplayName=IsFrontDoubleLiner'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:117]'
      'ID=117'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleLiner'
      'DisplayName=IsBackDoubleLiner'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:118]'
      'ID=118'
      'Kind=kfkData'
      'FieldExpr=IsTripleDot'
      'DisplayName=IsTripleDot'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:119]'
      'ID=119'
      'Kind=kfkData'
      'FieldExpr=IsFrontDoubleDot'
      'DisplayName=IsFrontDoubleDot'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:120]'
      'ID=120'
      'Kind=kfkData'
      'FieldExpr=IsBackDoubleDot'
      'DisplayName=IsBackDoubleDot'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:121]'
      'ID=121'
      'Kind=kfkData'
      'FieldExpr=IsTripleLiner'
      'DisplayName=IsTripleLiner'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:122]'
      'ID=122'
      'Kind=kfkData'
      'FieldExpr=IsLayoffAndUp'
      'DisplayName=IsLayoffAndUp'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:123]'
      'ID=123'
      'Kind=kfkData'
      'FieldExpr=IsClaimedAndUp'
      'DisplayName=IsClaimedAndUp'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:124]'
      'ID=124'
      'Kind=kfkData'
      'FieldExpr=IsClaimedAndDown'
      'DisplayName=IsClaimedAndDown'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:125]'
      'ID=125'
      'Kind=kfkData'
      'FieldExpr=IsFirstTimeClaiming'
      'DisplayName=IsFirstTimeClaiming'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:126]'
      'ID=126'
      'Kind=kfkData'
      'FieldExpr=IsBelowClaimedPrice'
      'DisplayName=IsBelowClaimedPrice'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:127]'
      'ID=127'
      'Kind=kfkData'
      'FieldExpr=AngleDesc'
      'DisplayName=AngleDesc'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:128]'
      'ID=128'
      'Kind=kfkData'
      'FieldExpr=IsBlinkersOn'
      'DisplayName=IsBlinkersOn'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:129]'
      'ID=129'
      'Kind=kfkData'
      'FieldExpr=IsBlinkersOff'
      'DisplayName=IsBlinkersOff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:130]'
      'ID=130'
      'Kind=kfkData'
      'FieldExpr=LastEquip'
      'DisplayName=LastEquip'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=7'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:131]'
      'ID=131'
      'Kind=kfkData'
      'FieldExpr=EstTimeOfRace'
      'DisplayName=EstTimeOfRace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:132]'
      'ID=132'
      'Kind=kfkData'
      'FieldExpr=EstTimeOfFirstRace'
      'DisplayName=EstTimeOfFirstRace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:133]'
      'ID=133'
      'Kind=kfkData'
      'FieldExpr=NbrDebutStarters'
      'DisplayName=NbrDebutStarters'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:134]'
      'ID=134'
      'Kind=kfkData'
      'FieldExpr=AvgPurse'
      'DisplayName=AvgPurse'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:135]'
      'ID=135'
      'Kind=kfkData'
      'FieldExpr=Entry'
      'DisplayName=Entry'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=5'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:136]'
      'ID=136'
      'Kind=kfkData'
      'FieldExpr=ProgramNbrSort'
      'DisplayName=ProgramNbrSort'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:137]'
      'ID=137'
      'Kind=kfkData'
      'FieldExpr=IsScratched'
      'DisplayName=IsScratched'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:138]'
      'ID=138'
      'Kind=kfkData'
      'FieldExpr=Color'
      'DisplayName=Color'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:139]'
      'ID=139'
      'Kind=kfkData'
      'FieldExpr=Weight'
      'DisplayName=Weight'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:140]'
      'ID=140'
      'Kind=kfkData'
      'FieldExpr=EstMorningLineOrderKey'
      'DisplayName=EstMorningLineOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:141]'
      'ID=141'
      'Kind=kfkData'
      'FieldExpr=EstMorningLineWinPct'
      'DisplayName=EstMorningLineWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:142]'
      'ID=142'
      'Kind=kfkData'
      'FieldExpr=EstMorningLineValueBet'
      'DisplayName=EstMorningLineValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:143]'
      'ID=143'
      'Kind=kfkData'
      'FieldExpr=EarlyPaceAdvantage'
      'DisplayName=EarlyPaceAdvantage'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:144]'
      'ID=144'
      'Kind=kfkData'
      'FieldExpr=MiddlePaceAdvantage'
      'DisplayName=MiddlePaceAdvantage'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:145]'
      'ID=145'
      'Kind=kfkData'
      'FieldExpr=LatePaceAdvantage'
      'DisplayName=LatePaceAdvantage'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:146]'
      'ID=146'
      'Kind=kfkData'
      'FieldExpr=LifeStarts'
      'DisplayName=LifeStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:147]'
      'ID=147'
      'Kind=kfkData'
      'FieldExpr=LifeWins'
      'DisplayName=LifeWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:148]'
      'ID=148'
      'Kind=kfkData'
      'FieldExpr=TurfStarts'
      'DisplayName=TurfStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:149]'
      'ID=149'
      'Kind=kfkData'
      'FieldExpr=TurfWins'
      'DisplayName=TurfWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:150]'
      'ID=150'
      'Kind=kfkData'
      'FieldExpr=MudStarts'
      'DisplayName=MudStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:151]'
      'ID=151'
      'Kind=kfkData'
      'FieldExpr=MudWins'
      'DisplayName=MudWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:152]'
      'ID=152'
      'Kind=kfkData'
      'FieldExpr=TrkStarts'
      'DisplayName=TrkStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:153]'
      'ID=153'
      'Kind=kfkData'
      'FieldExpr=TrkWins'
      'DisplayName=TrkWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:154]'
      'ID=154'
      'Kind=kfkData'
      'FieldExpr=RouteStarts'
      'DisplayName=RouteStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:155]'
      'ID=155'
      'Kind=kfkData'
      'FieldExpr=RouteWins'
      'DisplayName=RouteWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:156]'
      'ID=156'
      'Kind=kfkData'
      'FieldExpr=SprintStarts'
      'DisplayName=SprintStarts'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:157]'
      'ID=157'
      'Kind=kfkData'
      'FieldExpr=SprintWins'
      'DisplayName=SprintWins'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:158]'
      'ID=158'
      'Kind=kfkData'
      'FieldExpr=QSP1stCall'
      'DisplayName=QSP1stCall'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:159]'
      'ID=159'
      'Kind=kfkData'
      'FieldExpr=QSP1stCallRank'
      'DisplayName=QSP1stCallRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:160]'
      'ID=160'
      'Kind=kfkData'
      'FieldExpr=QSP2ndCall'
      'DisplayName=QSP2ndCall'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:161]'
      'ID=161'
      'Kind=kfkData'
      'FieldExpr=QSP2ndCallRank'
      'DisplayName=QSP2ndCallRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:162]'
      'ID=162'
      'Kind=kfkData'
      'FieldExpr=KSP1stCall'
      'DisplayName=KSP1stCall'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=3'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:163]'
      'ID=163'
      'Kind=kfkData'
      'FieldExpr=KSP1stCallRank'
      'DisplayName=KSP1stCallRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:164]'
      'ID=164'
      'Kind=kfkData'
      'FieldExpr=KSP2ndCall'
      'DisplayName=KSP2ndCall'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:165]'
      'ID=165'
      'Kind=kfkData'
      'FieldExpr=KSP2ndCallRank'
      'DisplayName=KSP2ndCallRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:166]'
      'ID=166'
      'Kind=kfkData'
      'FieldExpr=QSP1stCallRunStyle'
      'DisplayName=QSP1stCallRunStyle'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:167]'
      'ID=167'
      'Kind=kfkData'
      'FieldExpr=QSP2ndCallRunStyle'
      'DisplayName=QSP2ndCallRunStyle'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=2'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:168]'
      'ID=168'
      'Kind=kfkData'
      'FieldExpr=WagerAmt'
      'DisplayName=WagerAmt'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:169]'
      'ID=169'
      'Kind=kfkData'
      'FieldExpr=WinWagerAmt'
      'DisplayName=WinWagerAmt'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:170]'
      'ID=170'
      'Kind=kfkData'
      'FieldExpr=PlcWagerAmt'
      'DisplayName=PlcWagerAmt'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:171]'
      'ID=171'
      'Kind=kfkData'
      'FieldExpr=ShoWagerAmt'
      'DisplayName=ShoWagerAmt'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:172]'
      'ID=172'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerOrderKey'
      'DisplayName=TodaysWagerOrderKey'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:173]'
      'ID=173'
      'Kind=kfkData'
      'FieldExpr=IsUpInClass'
      'DisplayName=IsUpInClass'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:174]'
      'ID=174'
      'Kind=kfkData'
      'FieldExpr=IsDownInClass'
      'DisplayName=IsDownInClass'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:175]'
      'ID=175'
      'Kind=kfkData'
      'FieldExpr=Is1stClaiming'
      'DisplayName=Is1stClaiming'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:176]'
      'ID=176'
      'Kind=kfkData'
      'FieldExpr=Is1stMCL'
      'DisplayName=Is1stMCL'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:177]'
      'ID=177'
      'Kind=kfkData'
      'FieldExpr=IsHiddenWorkout'
      'DisplayName=IsHiddenWorkout'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:178]'
      'ID=178'
      'Kind=kfkData'
      'FieldExpr=Is1stAfterLayoff'
      'DisplayName=Is1stAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:179]'
      'ID=179'
      'Kind=kfkData'
      'FieldExpr=Is2ndAfterLayoff'
      'DisplayName=Is2ndAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:180]'
      'ID=180'
      'Kind=kfkData'
      'FieldExpr=Is3rdAfterLayoff'
      'DisplayName=Is3rdAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:181]'
      'ID=181'
      'Kind=kfkData'
      'FieldExpr=IsDirtToTurfToDirtAfterLayoff'
      'DisplayName=IsDirtToTurfToDirtAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:182]'
      'ID=182'
      'Kind=kfkData'
      'FieldExpr=IsTurfToDirtToTurfAfterLayoff'
      'DisplayName=IsTurfToDirtToTurfAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:183]'
      'ID=183'
      'Kind=kfkData'
      'FieldExpr=IsRouteToSprintToRouteAfterLayoff'
      'DisplayName=IsRouteToSprintToRouteAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:184]'
      'ID=184'
      'Kind=kfkData'
      'FieldExpr=IsSprintToRouteToSprintAfterLayoff'
      'DisplayName=IsSprintToRouteToSprintAfterLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:185]'
      'ID=185'
      'Kind=kfkData'
      'FieldExpr=IsOnlySpeed'
      'DisplayName=IsOnlySpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:186]'
      'ID=186'
      'Kind=kfkData'
      'FieldExpr=IsProvenSpeed'
      'DisplayName=IsProvenSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:187]'
      'ID=187'
      'Kind=kfkData'
      'FieldExpr=IsProvenSpeedPlus'
      'DisplayName=IsProvenSpeedPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:188]'
      'ID=188'
      'Kind=kfkData'
      'FieldExpr=IsXtremeSpeed'
      'DisplayName=IsXtremeSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:189]'
      'ID=189'
      'Kind=kfkData'
      'FieldExpr=IsLastRaceTurnMove'
      'DisplayName=IsLastRaceTurnMove'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:190]'
      'ID=190'
      'Kind=kfkData'
      'FieldExpr=IsLastRaceFinalFurlongMove'
      'DisplayName=IsLastRaceFinalFurlongMove'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:191]'
      'ID=191'
      'Kind=kfkData'
      'FieldExpr=IsPrevToLastRaceTurnMove'
      'DisplayName=IsPrevToLastRaceTurnMove'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:192]'
      'ID=192'
      'Kind=kfkData'
      'FieldExpr=IsPrevToLastRaceFinalFurlongMove'
      'DisplayName=IsPrevToLastRaceFinalFurlongMove'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:193]'
      'ID=193'
      'Kind=kfkData'
      'FieldExpr=Is2yoBred'
      'DisplayName=Is2yoBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:194]'
      'ID=194'
      'Kind=kfkData'
      'FieldExpr=Is1stBred'
      'DisplayName=Is1stBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:195]'
      'ID=195'
      'Kind=kfkData'
      'FieldExpr=IsTurfBred'
      'DisplayName=IsTurfBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:196]'
      'ID=196'
      'Kind=kfkData'
      'FieldExpr=IsQuirinSpeed'
      'DisplayName=IsQuirinSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:197]'
      'ID=197'
      'Kind=kfkData'
      'FieldExpr=IsKleinSpeed'
      'DisplayName=IsKleinSpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:198]'
      'ID=198'
      'Kind=kfkData'
      'FieldExpr=IsKeyRace'
      'DisplayName=IsKeyRace'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:199]'
      'ID=199'
      'Kind=kfkData'
      'FieldExpr=IsBouncyBouncy'
      'DisplayName=IsBouncyBouncy'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:200]'
      'ID=200'
      'Kind=kfkData'
      'FieldExpr=IsBestEffortLast'
      'DisplayName=IsBestEffortLast'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:201]'
      'ID=201'
      'Kind=kfkData'
      'FieldExpr=IsShipIn'
      'DisplayName=IsShipIn'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:202]'
      'ID=202'
      'Kind=kfkData'
      'FieldExpr=IsYouBetTrack'
      'DisplayName=IsYouBetTrack'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:203]'
      'ID=203'
      'Kind=kfkData'
      'FieldExpr=IsPrintedOnValueSheet'
      'DisplayName=IsPrintedOnValueSheet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:204]'
      'ID=204'
      'Kind=kfkData'
      'FieldExpr=IsWagerSheetSelected'
      'DisplayName=IsWagerSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:205]'
      'ID=205'
      'Kind=kfkData'
      'FieldExpr=IsOverlaySheetSelected'
      'DisplayName=IsOverlaySheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:206]'
      'ID=206'
      'Kind=kfkData'
      'FieldExpr=IsLinerSheetSelected'
      'DisplayName=IsLinerSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:207]'
      'ID=207'
      'Kind=kfkData'
      'FieldExpr=IsVerifiedClaim'
      'DisplayName=IsVerifiedClaim'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:208]'
      'ID=208'
      'Kind=kfkData'
      'FieldExpr=IsBetLast'
      'DisplayName=IsBetLast'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:209]'
      'ID=209'
      'Kind=kfkData'
      'FieldExpr=IsUltimateFormFactor'
      'DisplayName=IsUltimateFormFactor'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:210]'
      'ID=210'
      'Kind=kfkData'
      'FieldExpr=Is1stOffLayoff'
      'DisplayName=Is1stOffLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:211]'
      'ID=211'
      'Kind=kfkData'
      'FieldExpr=Is2ndOffLayoff'
      'DisplayName=Is2ndOffLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:212]'
      'ID=212'
      'Kind=kfkData'
      'FieldExpr=Is3rdOffLayoff'
      'DisplayName=Is3rdOffLayoff'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:213]'
      'ID=213'
      'Kind=kfkData'
      'FieldExpr=IsFormConsistent'
      'DisplayName=IsFormConsistent'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:214]'
      'ID=214'
      'Kind=kfkData'
      'FieldExpr=IsX1stBred'
      'DisplayName=IsX1stBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:215]'
      'ID=215'
      'Kind=kfkData'
      'FieldExpr=IsX2yoBred'
      'DisplayName=IsX2yoBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:216]'
      'ID=216'
      'Kind=kfkData'
      'FieldExpr=IsXTurfBred'
      'DisplayName=IsXTurfBred'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:217]'
      'ID=217'
      'Kind=kfkData'
      'FieldExpr=IsUnexpectedEarlySpeed'
      'DisplayName=IsUnexpectedEarlySpeed'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:218]'
      'ID=218'
      'Kind=kfkData'
      'FieldExpr=IsTrnDebutPlus'
      'DisplayName=IsTrnDebutPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:219]'
      'ID=219'
      'Kind=kfkData'
      'FieldExpr=IsTrnDebutTwoPlus'
      'DisplayName=IsTrnDebutTwoPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:220]'
      'ID=220'
      'Kind=kfkData'
      'FieldExpr=IsTrn2yoPlus'
      'DisplayName=IsTrn2yoPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:221]'
      'ID=221'
      'Kind=kfkData'
      'FieldExpr=IsTrnTurfPlus'
      'DisplayName=IsTrnTurfPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:222]'
      'ID=222'
      'Kind=kfkData'
      'FieldExpr=IsTrnTodayPlus'
      'DisplayName=IsTrnTodayPlus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:223]'
      'ID=223'
      'Kind=kfkData'
      'FieldExpr=IsTrnTodayMinus'
      'DisplayName=IsTrnTodayMinus'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:224]'
      'ID=224'
      'Kind=kfkData'
      'FieldExpr=IsXtremeSpeed2'
      'DisplayName=IsXtremeSpeed2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:225]'
      'ID=225'
      'Kind=kfkData'
      'FieldExpr=IsQuirinSpeed2'
      'DisplayName=IsQuirinSpeed2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:226]'
      'ID=226'
      'Kind=kfkData'
      'FieldExpr=IsKleinSpeed2'
      'DisplayName=IsKleinSpeed2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:227]'
      'ID=227'
      'Kind=kfkData'
      'FieldExpr=Is2yoBredSheetSelected'
      'DisplayName=Is2yoBredSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:228]'
      'ID=228'
      'Kind=kfkData'
      'FieldExpr=IsTurfBredSheetSelected'
      'DisplayName=IsTurfBredSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:229]'
      'ID=229'
      'Kind=kfkData'
      'FieldExpr=Is1stBredSheetSelected'
      'DisplayName=Is1stBredSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:230]'
      'ID=230'
      'Kind=kfkData'
      'FieldExpr=IsSpeedSheetSelected'
      'DisplayName=IsSpeedSheetSelected'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:231]'
      'ID=231'
      'Kind=kfkData'
      'FieldExpr=EstMorningLineTo1Fair'
      'DisplayName=EstMorningLineTo1Fair'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:232]'
      'ID=232'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerWinPct'
      'DisplayName=TodaysWagerWinPct'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:233]'
      'ID=233'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerValueBet'
      'DisplayName=TodaysWagerValueBet'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:234]'
      'ID=234'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerLineTo1Fair'
      'DisplayName=TodaysWagerLineTo1Fair'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:235]'
      'ID=235'
      'Kind=kfkData'
      'FieldExpr=EstMorningLineWinPctRank'
      'DisplayName=EstMorningLineWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:236]'
      'ID=236'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerWinPctRank'
      'DisplayName=TodaysWagerWinPctRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:237]'
      'ID=237'
      'Kind=kfkData'
      'FieldExpr=TrnWinsRank'
      'DisplayName=TrnWinsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:238]'
      'ID=238'
      'Kind=kfkData'
      'FieldExpr=TrnEarningsRank'
      'DisplayName=TrnEarningsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:239]'
      'ID=239'
      'Kind=kfkData'
      'FieldExpr=TrnTrackRank'
      'DisplayName=TrnTrackRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:240]'
      'ID=240'
      'Kind=kfkData'
      'FieldExpr=JkyWinsRank'
      'DisplayName=JkyWinsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:241]'
      'ID=241'
      'Kind=kfkData'
      'FieldExpr=JkyEarningsRank'
      'DisplayName=JkyEarningsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:242]'
      'ID=242'
      'Kind=kfkData'
      'FieldExpr=JkyTrackRank'
      'DisplayName=JkyTrackRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:243]'
      'ID=243'
      'Kind=kfkData'
      'FieldExpr=OwnWinsRank'
      'DisplayName=OwnWinsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:244]'
      'ID=244'
      'Kind=kfkData'
      'FieldExpr=OwnEarningsRank'
      'DisplayName=OwnEarningsRank'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:245]'
      'ID=245'
      'Kind=kfkData'
      'FieldExpr=IsOnlySpeed2'
      'DisplayName=IsOnlySpeed2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:246]'
      'ID=246'
      'Kind=kfkData'
      'FieldExpr=IsOnStandingInList'
      'DisplayName=IsOnStandingInList'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:247]'
      'ID=247'
      'Kind=kfkData'
      'FieldExpr=b2'
      'DisplayName=b2'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:248]'
      'ID=248'
      'Kind=kfkData'
      'FieldExpr=b3'
      'DisplayName=b3'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:249]'
      'ID=249'
      'Kind=kfkData'
      'FieldExpr=b4'
      'DisplayName=b4'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:250]'
      'ID=250'
      'Kind=kfkData'
      'FieldExpr=b5'
      'DisplayName=b5'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:251]'
      'ID=251'
      'Kind=kfkData'
      'FieldExpr=b6'
      'DisplayName=b6'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:252]'
      'ID=252'
      'Kind=kfkData'
      'FieldExpr=b7'
      'DisplayName=b7'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:253]'
      'ID=253'
      'Kind=kfkData'
      'FieldExpr=b8'
      'DisplayName=b8'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:254]'
      'ID=254'
      'Kind=kfkData'
      'FieldExpr=b9'
      'DisplayName=b9'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:255]'
      'ID=255'
      'Kind=kfkData'
      'FieldExpr=b10'
      'DisplayName=b10'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:256]'
      'ID=256'
      'Kind=kfkData'
      'FieldExpr=b11'
      'DisplayName=b11'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:257]'
      'ID=257'
      'Kind=kfkData'
      'FieldExpr=b12'
      'DisplayName=b12'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:258]'
      'ID=258'
      'Kind=kfkData'
      'FieldExpr=b13'
      'DisplayName=b13'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:259]'
      'ID=259'
      'Kind=kfkData'
      'FieldExpr=b14'
      'DisplayName=b14'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:260]'
      'ID=260'
      'Kind=kfkData'
      'FieldExpr=b15'
      'DisplayName=b15'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:261]'
      'ID=261'
      'Kind=kfkData'
      'FieldExpr=b16'
      'DisplayName=b16'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:262]'
      'ID=262'
      'Kind=kfkData'
      'FieldExpr=b17'
      'DisplayName=b17'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:263]'
      'ID=263'
      'Kind=kfkData'
      'FieldExpr=b18'
      'DisplayName=b18'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:264]'
      'ID=264'
      'Kind=kfkData'
      'FieldExpr=b19'
      'DisplayName=b19'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:265]'
      'ID=265'
      'Kind=kfkData'
      'FieldExpr=b20'
      'DisplayName=b20'
      'TableAlias=PrevDayHH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:266]'
      'ID=266'
      'Kind=kfkData'
      'FieldExpr=AgeSexRestriction'
      'DisplayName=AgeSexRestriction'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=3'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:267]'
      'ID=267'
      'Kind=kfkData'
      'FieldExpr=AltWager1'
      'DisplayName=AltWager1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:268]'
      'ID=268'
      'Kind=kfkData'
      'FieldExpr=AltWager2'
      'DisplayName=AltWager2'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:269]'
      'ID=269'
      'Kind=kfkData'
      'FieldExpr=AltWager3'
      'DisplayName=AltWager3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:270]'
      'ID=270'
      'Kind=kfkData'
      'FieldExpr=AltWager4'
      'DisplayName=AltWager4'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:271]'
      'ID=271'
      'Kind=kfkData'
      'FieldExpr=AltWager5'
      'DisplayName=AltWager5'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:272]'
      'ID=272'
      'Kind=kfkData'
      'FieldExpr=AltWager6'
      'DisplayName=AltWager6'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:273]'
      'ID=273'
      'Kind=kfkData'
      'FieldExpr=BetLine'
      'DisplayName=BetLine'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=255'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:274]'
      'ID=274'
      'Kind=kfkData'
      'FieldExpr=Chalk'
      'DisplayName=Chalk'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:275]'
      'ID=275'
      'Kind=kfkData'
      'FieldExpr=ClaimingPrice'
      'DisplayName=ClaimingPrice'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:276]'
      'ID=276'
      'Kind=kfkData'
      'FieldExpr=DailyDoubleNbrsFirstRace'
      'DisplayName=DailyDoubleNbrsFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:277]'
      'ID=277'
      'Kind=kfkData'
      'FieldExpr=DailyDoubleNbrsLastRace'
      'DisplayName=DailyDoubleNbrsLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:278]'
      'ID=278'
      'Kind=kfkData'
      'FieldExpr=DailyDoublePayoutFirstRace'
      'DisplayName=DailyDoublePayoutFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:279]'
      'ID=279'
      'Kind=kfkData'
      'FieldExpr=DailyDoublePayoutLastRace'
      'DisplayName=DailyDoublePayoutLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:280]'
      'ID=280'
      'Kind=kfkData'
      'FieldExpr=DailyDoubleWagerFirstRace'
      'DisplayName=DailyDoubleWagerFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:281]'
      'ID=281'
      'Kind=kfkData'
      'FieldExpr=DailyDoubleWagerLastRace'
      'DisplayName=DailyDoubleWagerLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:282]'
      'ID=282'
      'Kind=kfkData'
      'FieldExpr=DD'
      'DisplayName=DD'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:283]'
      'ID=283'
      'Kind=kfkData'
      'FieldExpr=DDFirstRace'
      'DisplayName=DDFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:284]'
      'ID=284'
      'Kind=kfkData'
      'FieldExpr=DDLastRace'
      'DisplayName=DDLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:285]'
      'ID=285'
      'Kind=kfkData'
      'FieldExpr=DDRaceNbr'
      'DisplayName=DDRaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:286]'
      'ID=286'
      'Kind=kfkData'
      'FieldExpr=DDWagerAmt'
      'DisplayName=DDWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:287]'
      'ID=287'
      'Kind=kfkData'
      'FieldExpr=DistanceDesc'
      'DisplayName=DistanceDesc'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=5'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:288]'
      'ID=288'
      'Kind=kfkData'
      'FieldExpr=DistanceInFeet'
      'DisplayName=DistanceInFeet'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:289]'
      'ID=289'
      'Kind=kfkData'
      'FieldExpr=DistanceInFurlongs'
      'DisplayName=DistanceInFurlongs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:290]'
      'ID=290'
      'Kind=kfkData'
      'FieldExpr=DistanceInYards'
      'DisplayName=DistanceInYards'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:291]'
      'ID=291'
      'Kind=kfkData'
      'FieldExpr=EstTimeOfFirstRace'
      'DisplayName=EstTimeOfFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:292]'
      'ID=292'
      'Kind=kfkData'
      'FieldExpr=EstTimeOfRace'
      'DisplayName=EstTimeOfRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:293]'
      'ID=293'
      'Kind=kfkData'
      'FieldExpr=Exacta'
      'DisplayName=Exacta'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:294]'
      'ID=294'
      'Kind=kfkData'
      'FieldExpr=ExactaNbrs'
      'DisplayName=ExactaNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:295]'
      'ID=295'
      'Kind=kfkData'
      'FieldExpr=ExactaPayout'
      'DisplayName=ExactaPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:296]'
      'ID=296'
      'Kind=kfkData'
      'FieldExpr=ExactaWager'
      'DisplayName=ExactaWager'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:297]'
      'ID=297'
      'Kind=kfkData'
      'FieldExpr=ExaWagerAmt'
      'DisplayName=ExaWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:298]'
      'ID=298'
      'Kind=kfkData'
      'FieldExpr=FootNotes'
      'DisplayName=FootNotes'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=16'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=IsNull,StartsWith,NotStartsWith,Contains,NotContains'
      ' '
      '[Field:299]'
      'ID=299'
      'Kind=kfkData'
      'FieldExpr=FractionalTimes'
      'DisplayName=FractionalTimes'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:300]'
      'ID=300'
      'Kind=kfkData'
      'FieldExpr=IsActive'
      'DisplayName=IsActive'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:301]'
      'ID=301'
      'Kind=kfkData'
      'FieldExpr=IsChalkValue'
      'DisplayName=IsChalkValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:302]'
      'ID=302'
      'Kind=kfkData'
      'FieldExpr=IsClaimingRace'
      'DisplayName=IsClaimingRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:303]'
      'ID=303'
      'Kind=kfkData'
      'FieldExpr=IsCreateAlt'
      'DisplayName=IsCreateAlt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:304]'
      'ID=304'
      'Kind=kfkData'
      'FieldExpr=IsCreateAngle'
      'DisplayName=IsCreateAngle'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:305]'
      'ID=305'
      'Kind=kfkData'
      'FieldExpr=IsCreateDetail'
      'DisplayName=IsCreateDetail'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:306]'
      'ID=306'
      'Kind=kfkData'
      'FieldExpr=IsCreatePk3'
      'DisplayName=IsCreatePk3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:307]'
      'ID=307'
      'Kind=kfkData'
      'FieldExpr=IsCreateTip'
      'DisplayName=IsCreateTip'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:308]'
      'ID=308'
      'Kind=kfkData'
      'FieldExpr=IsCreateValue'
      'DisplayName=IsCreateValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:309]'
      'ID=309'
      'Kind=kfkData'
      'FieldExpr=IsDailyDoubleMatchedFirstRace'
      'DisplayName=IsDailyDoubleMatchedFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:310]'
      'ID=310'
      'Kind=kfkData'
      'FieldExpr=IsDailyDoubleMatchedLastRace'
      'DisplayName=IsDailyDoubleMatchedLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:311]'
      'ID=311'
      'Kind=kfkData'
      'FieldExpr=IsDDLeg1'
      'DisplayName=IsDDLeg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:312]'
      'ID=312'
      'Kind=kfkData'
      'FieldExpr=IsDDRace'
      'DisplayName=IsDDRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:313]'
      'ID=313'
      'Kind=kfkData'
      'FieldExpr=IsDRFChartsProcessed'
      'DisplayName=IsDRFChartsProcessed'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:314]'
      'ID=314'
      'Kind=kfkData'
      'FieldExpr=IsEquibaseChartsProcessed'
      'DisplayName=IsEquibaseChartsProcessed'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:315]'
      'ID=315'
      'Kind=kfkData'
      'FieldExpr=IsExactaMatched'
      'DisplayName=IsExactaMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:316]'
      'ID=316'
      'Kind=kfkData'
      'FieldExpr=IsExaRace'
      'DisplayName=IsExaRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:317]'
      'ID=317'
      'Kind=kfkData'
      'FieldExpr=IsFinalValue'
      'DisplayName=IsFinalValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:318]'
      'ID=318'
      'Kind=kfkData'
      'FieldExpr=IsLinerSheetSelected'
      'DisplayName=IsLinerSheetSelected'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:319]'
      'ID=319'
      'Kind=kfkData'
      'FieldExpr=IsMaidenClaimingRace'
      'DisplayName=IsMaidenClaimingRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:320]'
      'ID=320'
      'Kind=kfkData'
      'FieldExpr=IsMaidenOrTurfRace'
      'DisplayName=IsMaidenOrTurfRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:321]'
      'ID=321'
      'Kind=kfkData'
      'FieldExpr=IsMaidenSpecialRace'
      'DisplayName=IsMaidenSpecialRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:322]'
      'ID=322'
      'Kind=kfkData'
      'FieldExpr=IsMLValue'
      'DisplayName=IsMLValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:323]'
      'ID=323'
      'Kind=kfkData'
      'FieldExpr=IsOverlaySheetSelected'
      'DisplayName=IsOverlaySheetSelected'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:324]'
      'ID=324'
      'Kind=kfkData'
      'FieldExpr=IsPick3MatchedFirstRace'
      'DisplayName=IsPick3MatchedFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:325]'
      'ID=325'
      'Kind=kfkData'
      'FieldExpr=IsPick3MatchedLastRace'
      'DisplayName=IsPick3MatchedLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:326]'
      'ID=326'
      'Kind=kfkData'
      'FieldExpr=IsPick4MatchedFirstRace'
      'DisplayName=IsPick4MatchedFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:327]'
      'ID=327'
      'Kind=kfkData'
      'FieldExpr=IsPick4MatchedLastRace'
      'DisplayName=IsPick4MatchedLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:328]'
      'ID=328'
      'Kind=kfkData'
      'FieldExpr=IsPick6MatchedFirstRace'
      'DisplayName=IsPick6MatchedFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:329]'
      'ID=329'
      'Kind=kfkData'
      'FieldExpr=IsPick6MatchedLastRace'
      'DisplayName=IsPick6MatchedLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:330]'
      'ID=330'
      'Kind=kfkData'
      'FieldExpr=IsPk3Leg1'
      'DisplayName=IsPk3Leg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:331]'
      'ID=331'
      'Kind=kfkData'
      'FieldExpr=IsPk3Race'
      'DisplayName=IsPk3Race'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:332]'
      'ID=332'
      'Kind=kfkData'
      'FieldExpr=IsPk4Leg1'
      'DisplayName=IsPk4Leg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:333]'
      'ID=333'
      'Kind=kfkData'
      'FieldExpr=IsPk4Race'
      'DisplayName=IsPk4Race'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:334]'
      'ID=334'
      'Kind=kfkData'
      'FieldExpr=IsPk6Leg1'
      'DisplayName=IsPk6Leg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:335]'
      'ID=335'
      'Kind=kfkData'
      'FieldExpr=IsPk6Race'
      'DisplayName=IsPk6Race'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:336]'
      'ID=336'
      'Kind=kfkData'
      'FieldExpr=IsPk9Leg1'
      'DisplayName=IsPk9Leg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:337]'
      'ID=337'
      'Kind=kfkData'
      'FieldExpr=IsPk9Place'
      'DisplayName=IsPk9Place'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:338]'
      'ID=338'
      'Kind=kfkData'
      'FieldExpr=IsPlayableValue'
      'DisplayName=IsPlayableValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:339]'
      'ID=339'
      'Kind=kfkData'
      'FieldExpr=IsPlcMatched'
      'DisplayName=IsPlcMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:340]'
      'ID=340'
      'Kind=kfkData'
      'FieldExpr=IsPPValue'
      'DisplayName=IsPPValue'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:341]'
      'ID=341'
      'Kind=kfkData'
      'FieldExpr=IsPrintedOnValueSheet'
      'DisplayName=IsPrintedOnValueSheet'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:342]'
      'ID=342'
      'Kind=kfkData'
      'FieldExpr=IsQuinellaMatched'
      'DisplayName=IsQuinellaMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:343]'
      'ID=343'
      'Kind=kfkData'
      'FieldExpr=IsQuiRace'
      'DisplayName=IsQuiRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:344]'
      'ID=344'
      'Kind=kfkData'
      'FieldExpr=IsRacePicksAvailable'
      'DisplayName=IsRacePicksAvailable'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:345]'
      'ID=345'
      'Kind=kfkData'
      'FieldExpr=IsRouteRace'
      'DisplayName=IsRouteRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:346]'
      'ID=346'
      'Kind=kfkData'
      'FieldExpr=IsShoMatched'
      'DisplayName=IsShoMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:347]'
      'ID=347'
      'Kind=kfkData'
      'FieldExpr=IsSuperfectaMatched'
      'DisplayName=IsSuperfectaMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:348]'
      'ID=348'
      'Kind=kfkData'
      'FieldExpr=IsSuperRace'
      'DisplayName=IsSuperRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:349]'
      'ID=349'
      'Kind=kfkData'
      'FieldExpr=IsTrifectaMatched'
      'DisplayName=IsTrifectaMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:350]'
      'ID=350'
      'Kind=kfkData'
      'FieldExpr=IsTriRace'
      'DisplayName=IsTriRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:351]'
      'ID=351'
      'Kind=kfkData'
      'FieldExpr=IsTurfRace'
      'DisplayName=IsTurfRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:352]'
      'ID=352'
      'Kind=kfkData'
      'FieldExpr=IsTwoYearOldRace'
      'DisplayName=IsTwoYearOldRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:353]'
      'ID=353'
      'Kind=kfkData'
      'FieldExpr=IsWagerSheetSelected'
      'DisplayName=IsWagerSheetSelected'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:354]'
      'ID=354'
      'Kind=kfkData'
      'FieldExpr=IsWinMatched'
      'DisplayName=IsWinMatched'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:355]'
      'ID=355'
      'Kind=kfkData'
      'FieldExpr=IsYouBetTrack'
      'DisplayName=IsYouBetTrack'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:356]'
      'ID=356'
      'Kind=kfkData'
      'FieldExpr=LocalTimeOfRace'
      'DisplayName=LocalTimeOfRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:357]'
      'ID=357'
      'Kind=kfkData'
      'FieldExpr=MaxGimmickBet'
      'DisplayName=MaxGimmickBet'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:358]'
      'ID=358'
      'Kind=kfkData'
      'FieldExpr=MaxWPSBet'
      'DisplayName=MaxWPSBet'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:359]'
      'ID=359'
      'Kind=kfkData'
      'FieldExpr=NbrDebutStarters'
      'DisplayName=NbrDebutStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:360]'
      'ID=360'
      'Kind=kfkData'
      'FieldExpr=NbrDebutTwoStarters'
      'DisplayName=NbrDebutTwoStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:361]'
      'ID=361'
      'Kind=kfkData'
      'FieldExpr=NbrRouteDebutStarters'
      'DisplayName=NbrRouteDebutStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:362]'
      'ID=362'
      'Kind=kfkData'
      'FieldExpr=NbrRunners'
      'DisplayName=NbrRunners'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:363]'
      'ID=363'
      'Kind=kfkData'
      'FieldExpr=NbrScratchedStarters'
      'DisplayName=NbrScratchedStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:364]'
      'ID=364'
      'Kind=kfkData'
      'FieldExpr=NbrStarters'
      'DisplayName=NbrStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:365]'
      'ID=365'
      'Kind=kfkData'
      'FieldExpr=NbrTriKey'
      'DisplayName=NbrTriKey'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=3'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:366]'
      'ID=366'
      'Kind=kfkData'
      'FieldExpr=NbrTurfDebutStarters'
      'DisplayName=NbrTurfDebutStarters'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:367]'
      'ID=367'
      'Kind=kfkData'
      'FieldExpr=OrigDistanceDesc'
      'DisplayName=OrigDistanceDesc'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=20'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:368]'
      'ID=368'
      'Kind=kfkData'
      'FieldExpr=OrigSurface'
      'DisplayName=OrigSurface'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:369]'
      'ID=369'
      'Kind=kfkData'
      'FieldExpr=Owners'
      'DisplayName=Owners'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=512'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:370]'
      'ID=370'
      'Kind=kfkData'
      'FieldExpr=ParTime'
      'DisplayName=ParTime'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:371]'
      'ID=371'
      'Kind=kfkData'
      'FieldExpr=Pick3'
      'DisplayName=Pick3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:372]'
      'ID=372'
      'Kind=kfkData'
      'FieldExpr=Pick3FirstRace'
      'DisplayName=Pick3FirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:373]'
      'ID=373'
      'Kind=kfkData'
      'FieldExpr=Pick3LastRace'
      'DisplayName=Pick3LastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:374]'
      'ID=374'
      'Kind=kfkData'
      'FieldExpr=Pick3NbrsFirstRace'
      'DisplayName=Pick3NbrsFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:375]'
      'ID=375'
      'Kind=kfkData'
      'FieldExpr=Pick3NbrsLastRace'
      'DisplayName=Pick3NbrsLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:376]'
      'ID=376'
      'Kind=kfkData'
      'FieldExpr=Pick3NbrsLeg1'
      'DisplayName=Pick3NbrsLeg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:377]'
      'ID=377'
      'Kind=kfkData'
      'FieldExpr=Pick3NbrsLeg2'
      'DisplayName=Pick3NbrsLeg2'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:378]'
      'ID=378'
      'Kind=kfkData'
      'FieldExpr=Pick3NbrsLeg3'
      'DisplayName=Pick3NbrsLeg3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:379]'
      'ID=379'
      'Kind=kfkData'
      'FieldExpr=Pick3PayoutFirstRace'
      'DisplayName=Pick3PayoutFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:380]'
      'ID=380'
      'Kind=kfkData'
      'FieldExpr=Pick3PayoutLastRace'
      'DisplayName=Pick3PayoutLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:381]'
      'ID=381'
      'Kind=kfkData'
      'FieldExpr=Pick3WagerFirstRace'
      'DisplayName=Pick3WagerFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:382]'
      'ID=382'
      'Kind=kfkData'
      'FieldExpr=Pick3WagerLastRace'
      'DisplayName=Pick3WagerLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:383]'
      'ID=383'
      'Kind=kfkData'
      'FieldExpr=Pick4'
      'DisplayName=Pick4'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:384]'
      'ID=384'
      'Kind=kfkData'
      'FieldExpr=Pick4FirstRace'
      'DisplayName=Pick4FirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:385]'
      'ID=385'
      'Kind=kfkData'
      'FieldExpr=Pick4LastRace'
      'DisplayName=Pick4LastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:386]'
      'ID=386'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsFirstRace'
      'DisplayName=Pick4NbrsFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:387]'
      'ID=387'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsLastRace'
      'DisplayName=Pick4NbrsLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:388]'
      'ID=388'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsLeg1'
      'DisplayName=Pick4NbrsLeg1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:389]'
      'ID=389'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsLeg2'
      'DisplayName=Pick4NbrsLeg2'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:390]'
      'ID=390'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsLeg3'
      'DisplayName=Pick4NbrsLeg3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:391]'
      'ID=391'
      'Kind=kfkData'
      'FieldExpr=Pick4NbrsLeg4'
      'DisplayName=Pick4NbrsLeg4'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:392]'
      'ID=392'
      'Kind=kfkData'
      'FieldExpr=Pick4PayoutFirstRace'
      'DisplayName=Pick4PayoutFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:393]'
      'ID=393'
      'Kind=kfkData'
      'FieldExpr=Pick4PayoutLastRace'
      'DisplayName=Pick4PayoutLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:394]'
      'ID=394'
      'Kind=kfkData'
      'FieldExpr=Pick4WagerFirstRace'
      'DisplayName=Pick4WagerFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:395]'
      'ID=395'
      'Kind=kfkData'
      'FieldExpr=Pick4WagerLastRace'
      'DisplayName=Pick4WagerLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:396]'
      'ID=396'
      'Kind=kfkData'
      'FieldExpr=Pick6'
      'DisplayName=Pick6'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:397]'
      'ID=397'
      'Kind=kfkData'
      'FieldExpr=Pick6FirstRace'
      'DisplayName=Pick6FirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:398]'
      'ID=398'
      'Kind=kfkData'
      'FieldExpr=Pick6LastRace'
      'DisplayName=Pick6LastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:399]'
      'ID=399'
      'Kind=kfkData'
      'FieldExpr=Pick6NbrsFirstRace'
      'DisplayName=Pick6NbrsFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:400]'
      'ID=400'
      'Kind=kfkData'
      'FieldExpr=Pick6NbrsLastRace'
      'DisplayName=Pick6NbrsLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:401]'
      'ID=401'
      'Kind=kfkData'
      'FieldExpr=Pick6PayoutFirstRace'
      'DisplayName=Pick6PayoutFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:402]'
      'ID=402'
      'Kind=kfkData'
      'FieldExpr=Pick6PayoutLastRace'
      'DisplayName=Pick6PayoutLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:403]'
      'ID=403'
      'Kind=kfkData'
      'FieldExpr=Pick6WagerFirstRace'
      'DisplayName=Pick6WagerFirstRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:404]'
      'ID=404'
      'Kind=kfkData'
      'FieldExpr=Pick6WagerLastRace'
      'DisplayName=Pick6WagerLastRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:405]'
      'ID=405'
      'Kind=kfkData'
      'FieldExpr=Pk3KeyType'
      'DisplayName=Pk3KeyType'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:406]'
      'ID=406'
      'Kind=kfkData'
      'FieldExpr=Pk3RaceNbr'
      'DisplayName=Pk3RaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:407]'
      'ID=407'
      'Kind=kfkData'
      'FieldExpr=Pk3Selected'
      'DisplayName=Pk3Selected'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=5'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=Equal,NotEqual,IsNull,InList,NotInList'
      ' '
      '[Field:408]'
      'ID=408'
      'Kind=kfkData'
      'FieldExpr=Pk3WagerAmt'
      'DisplayName=Pk3WagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:409]'
      'ID=409'
      'Kind=kfkData'
      'FieldExpr=Pk4RaceNbr'
      'DisplayName=Pk4RaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:410]'
      'ID=410'
      'Kind=kfkData'
      'FieldExpr=Pk4WagerAmt'
      'DisplayName=Pk4WagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:411]'
      'ID=411'
      'Kind=kfkData'
      'FieldExpr=Pk6RaceNbr'
      'DisplayName=Pk6RaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:412]'
      'ID=412'
      'Kind=kfkData'
      'FieldExpr=Pk6WagerAmt'
      'DisplayName=Pk6WagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:413]'
      'ID=413'
      'Kind=kfkData'
      'FieldExpr=Pk9RaceNbr'
      'DisplayName=Pk9RaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:414]'
      'ID=414'
      'Kind=kfkData'
      'FieldExpr=PlcNbrs'
      'DisplayName=PlcNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:415]'
      'ID=415'
      'Kind=kfkData'
      'FieldExpr=PlcPayout'
      'DisplayName=PlcPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:416]'
      'ID=416'
      'Kind=kfkData'
      'FieldExpr=PlcShoPayout'
      'DisplayName=PlcShoPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:417]'
      'ID=417'
      'Kind=kfkData'
      'FieldExpr=Purse'
      'DisplayName=Purse'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:418]'
      'ID=418'
      'Kind=kfkData'
      'FieldExpr=Quinella'
      'DisplayName=Quinella'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:419]'
      'ID=419'
      'Kind=kfkData'
      'FieldExpr=QuinellaNbrs'
      'DisplayName=QuinellaNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:420]'
      'ID=420'
      'Kind=kfkData'
      'FieldExpr=QuinellaPayout'
      'DisplayName=QuinellaPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:421]'
      'ID=421'
      'Kind=kfkData'
      'FieldExpr=QuinellaWager'
      'DisplayName=QuinellaWager'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:422]'
      'ID=422'
      'Kind=kfkData'
      'FieldExpr=QuiWagerAmt'
      'DisplayName=QuiWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:423]'
      'ID=423'
      'Kind=kfkData'
      'FieldExpr=RaceAutoInc'
      'DisplayName=RaceAutoInc'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=14'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:424]'
      'ID=424'
      'Kind=kfkData'
      'FieldExpr=RaceCondition'
      'DisplayName=RaceCondition'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=16'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=IsNull,StartsWith,NotStartsWith,Contains,NotContains'
      ' '
      '[Field:425]'
      'ID=425'
      'Kind=kfkData'
      'FieldExpr=RaceCondition1'
      'DisplayName=RaceCondition1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:426]'
      'ID=426'
      'Kind=kfkData'
      'FieldExpr=RaceCondition10'
      'DisplayName=RaceCondition10'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:427]'
      'ID=427'
      'Kind=kfkData'
      'FieldExpr=RaceCondition2'
      'DisplayName=RaceCondition2'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:428]'
      'ID=428'
      'Kind=kfkData'
      'FieldExpr=RaceCondition3'
      'DisplayName=RaceCondition3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:429]'
      'ID=429'
      'Kind=kfkData'
      'FieldExpr=RaceCondition4'
      'DisplayName=RaceCondition4'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:430]'
      'ID=430'
      'Kind=kfkData'
      'FieldExpr=RaceCondition5'
      'DisplayName=RaceCondition5'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:431]'
      'ID=431'
      'Kind=kfkData'
      'FieldExpr=RaceCondition6'
      'DisplayName=RaceCondition6'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:432]'
      'ID=432'
      'Kind=kfkData'
      'FieldExpr=RaceCondition7'
      'DisplayName=RaceCondition7'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:433]'
      'ID=433'
      'Kind=kfkData'
      'FieldExpr=RaceCondition8'
      'DisplayName=RaceCondition8'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:434]'
      'ID=434'
      'Kind=kfkData'
      'FieldExpr=RaceCondition9'
      'DisplayName=RaceCondition9'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:435]'
      'ID=435'
      'Kind=kfkData'
      'FieldExpr=RaceConditions'
      'DisplayName=RaceConditions'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=15'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:436]'
      'ID=436'
      'Kind=kfkData'
      'FieldExpr=RaceDate'
      'DisplayName=RaceDate'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=9'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:437]'
      'ID=437'
      'Kind=kfkData'
      'FieldExpr=RaceDesc'
      'DisplayName=RaceDesc'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=250'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:438]'
      'ID=438'
      'Kind=kfkData'
      'FieldExpr=RaceNbr'
      'DisplayName=RaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:439]'
      'ID=439'
      'Kind=kfkData'
      'FieldExpr=RacePicks'
      'DisplayName=RacePicks'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=16'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=IsNull,StartsWith,NotStartsWith,Contains,NotContains'
      ' '
      '[Field:440]'
      'ID=440'
      'Kind=kfkData'
      'FieldExpr=RaceType'
      'DisplayName=RaceType'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=5'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:441]'
      'ID=441'
      'Kind=kfkData'
      'FieldExpr=RaceTypeDesc'
      'DisplayName=RaceTypeDesc'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=25'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:442]'
      'ID=442'
      'Kind=kfkData'
      'FieldExpr=RangeRaceDate'
      'DisplayName=RangeRaceDate'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=9'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:443]'
      'ID=443'
      'Kind=kfkData'
      'FieldExpr=ScratchedHorses'
      'DisplayName=ScratchedHorses'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=512'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:444]'
      'ID=444'
      'Kind=kfkData'
      'FieldExpr=SecondEarlyPace'
      'DisplayName=SecondEarlyPace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:445]'
      'ID=445'
      'Kind=kfkData'
      'FieldExpr=SecondEarlyPacePos'
      'DisplayName=SecondEarlyPacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:446]'
      'ID=446'
      'Kind=kfkData'
      'FieldExpr=SecondLatePace'
      'DisplayName=SecondLatePace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:447]'
      'ID=447'
      'Kind=kfkData'
      'FieldExpr=SecondLatePacePos'
      'DisplayName=SecondLatePacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:448]'
      'ID=448'
      'Kind=kfkData'
      'FieldExpr=SecondMiddlePace'
      'DisplayName=SecondMiddlePace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:449]'
      'ID=449'
      'Kind=kfkData'
      'FieldExpr=SecondMiddlePacePos'
      'DisplayName=SecondMiddlePacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:450]'
      'ID=450'
      'Kind=kfkData'
      'FieldExpr=SfcWagerAmt'
      'DisplayName=SfcWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:451]'
      'ID=451'
      'Kind=kfkData'
      'FieldExpr=ShoNbrs'
      'DisplayName=ShoNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:452]'
      'ID=452'
      'Kind=kfkData'
      'FieldExpr=ShoPayout'
      'DisplayName=ShoPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:453]'
      'ID=453'
      'Kind=kfkData'
      'FieldExpr=SimulcastRaceNbr'
      'DisplayName=SimulcastRaceNbr'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:454]'
      'ID=454'
      'Kind=kfkData'
      'FieldExpr=SimulcastTrkCode'
      'DisplayName=SimulcastTrkCode'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=3'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:455]'
      'ID=455'
      'Kind=kfkData'
      'FieldExpr=Super'
      'DisplayName=Super'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:456]'
      'ID=456'
      'Kind=kfkData'
      'FieldExpr=SuperfectaNbrs'
      'DisplayName=SuperfectaNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:457]'
      'ID=457'
      'Kind=kfkData'
      'FieldExpr=SuperfectaPayout'
      'DisplayName=SuperfectaPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:458]'
      'ID=458'
      'Kind=kfkData'
      'FieldExpr=SuperfectaWager'
      'DisplayName=SuperfectaWager'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:459]'
      'ID=459'
      'Kind=kfkData'
      'FieldExpr=Surface'
      'DisplayName=Surface'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:460]'
      'ID=460'
      'Kind=kfkData'
      'FieldExpr=TimeDiff'
      'DisplayName=TimeDiff'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=10'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:461]'
      'ID=461'
      'Kind=kfkData'
      'FieldExpr=TodaysWagerOrder'
      'DisplayName=TodaysWagerOrder'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:462]'
      'ID=462'
      'Kind=kfkData'
      'FieldExpr=TopBackSpeed'
      'DisplayName=TopBackSpeed'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=3'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:463]'
      'ID=463'
      'Kind=kfkData'
      'FieldExpr=TopEarlyPace'
      'DisplayName=TopEarlyPace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:464]'
      'ID=464'
      'Kind=kfkData'
      'FieldExpr=TopEarlyPacePos'
      'DisplayName=TopEarlyPacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:465]'
      'ID=465'
      'Kind=kfkData'
      'FieldExpr=TopLastSpeed'
      'DisplayName=TopLastSpeed'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=3'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:466]'
      'ID=466'
      'Kind=kfkData'
      'FieldExpr=TopLatePace'
      'DisplayName=TopLatePace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:467]'
      'ID=467'
      'Kind=kfkData'
      'FieldExpr=TopLatePacePos'
      'DisplayName=TopLatePacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:468]'
      'ID=468'
      'Kind=kfkData'
      'FieldExpr=TopMiddlePace'
      'DisplayName=TopMiddlePace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:469]'
      'ID=469'
      'Kind=kfkData'
      'FieldExpr=TopMiddlePacePos'
      'DisplayName=TopMiddlePacePos'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:470]'
      'ID=470'
      'Kind=kfkData'
      'FieldExpr=TotalDDChoices'
      'DisplayName=TotalDDChoices'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:471]'
      'ID=471'
      'Kind=kfkData'
      'FieldExpr=TotalFinalLineTo1Probability'
      'DisplayName=TotalFinalLineTo1Probability'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:472]'
      'ID=472'
      'Kind=kfkData'
      'FieldExpr=TotalMorningLineTo1Probability'
      'DisplayName=TotalMorningLineTo1Probability'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:473]'
      'ID=473'
      'Kind=kfkData'
      'FieldExpr=TotalPk3Choices'
      'DisplayName=TotalPk3Choices'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:474]'
      'ID=474'
      'Kind=kfkData'
      'FieldExpr=TotalSuperChoices'
      'DisplayName=TotalSuperChoices'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:475]'
      'ID=475'
      'Kind=kfkData'
      'FieldExpr=TotalTriChoices'
      'DisplayName=TotalTriChoices'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=2'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:476]'
      'ID=476'
      'Kind=kfkData'
      'FieldExpr=Trainers'
      'DisplayName=Trainers'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=512'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:477]'
      'ID=477'
      'Kind=kfkData'
      'FieldExpr=Tri'
      'DisplayName=Tri'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:478]'
      'ID=478'
      'Kind=kfkData'
      'FieldExpr=TrifectaNbrs'
      'DisplayName=TrifectaNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:479]'
      'ID=479'
      'Kind=kfkData'
      'FieldExpr=TrifectaPayout'
      'DisplayName=TrifectaPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:480]'
      'ID=480'
      'Kind=kfkData'
      'FieldExpr=TrifectaWager'
      'DisplayName=TrifectaWager'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:481]'
      'ID=481'
      'Kind=kfkData'
      'FieldExpr=TriWagerAmt'
      'DisplayName=TriWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:482]'
      'ID=482'
      'Kind=kfkData'
      'FieldExpr=TrkCode'
      'DisplayName=TrkCode'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=3'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:483]'
      'ID=483'
      'Kind=kfkData'
      'FieldExpr=TrkCond'
      'DisplayName=TrkCond'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=3'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:484]'
      'ID=484'
      'Kind=kfkData'
      'FieldExpr=TypeOfRace'
      'DisplayName=TypeOfRace'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=1'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:485]'
      'ID=485'
      'Kind=kfkData'
      'FieldExpr=Value'
      'DisplayName=Value'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=10'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:486]'
      'ID=486'
      'Kind=kfkData'
      'FieldExpr=Wager1'
      'DisplayName=Wager1'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:487]'
      'ID=487'
      'Kind=kfkData'
      'FieldExpr=Wager2'
      'DisplayName=Wager2'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:488]'
      'ID=488'
      'Kind=kfkData'
      'FieldExpr=Wager3'
      'DisplayName=Wager3'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:489]'
      'ID=489'
      'Kind=kfkData'
      'FieldExpr=Wager4'
      'DisplayName=Wager4'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:490]'
      'ID=490'
      'Kind=kfkData'
      'FieldExpr=Wager5'
      'DisplayName=Wager5'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:491]'
      'ID=491'
      'Kind=kfkData'
      'FieldExpr=Wager6'
      'DisplayName=Wager6'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:492]'
      'ID=492'
      'Kind=kfkData'
      'FieldExpr=WagerFinalOrder'
      'DisplayName=WagerFinalOrder'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:493]'
      'ID=493'
      'Kind=kfkData'
      'FieldExpr=WagerSheetOrder'
      'DisplayName=WagerSheetOrder'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=40'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:494]'
      'ID=494'
      'Kind=kfkData'
      'FieldExpr=WagerType'
      'DisplayName=WagerType'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=16'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      'Operators=IsNull,StartsWith,NotStartsWith,Contains,NotContains'
      ' '
      '[Field:495]'
      'ID=495'
      'Kind=kfkData'
      'FieldExpr=Weather'
      'DisplayName=Weather'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:496]'
      'ID=496'
      'Kind=kfkData'
      'FieldExpr=WinNbrs'
      'DisplayName=WinNbrs'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=1'
      'FieldSize=50'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:497]'
      'ID=497'
      'Kind=kfkData'
      'FieldExpr=WinPayout'
      'DisplayName=WinPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:498]'
      'ID=498'
      'Kind=kfkData'
      'FieldExpr=WinPlcPayout'
      'DisplayName=WinPlcPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:499]'
      'ID=499'
      'Kind=kfkData'
      'FieldExpr=WinShoPayout'
      'DisplayName=WinShoPayout'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[Field:500]'
      'ID=500'
      'Kind=kfkData'
      'FieldExpr=WPSWagerAmt'
      'DisplayName=WPSWagerAmt'
      'TableAlias=PrevDayRH'
      'EditType=0'
      'FieldType=6'
      'FieldSize=0'
      'Quoted=0'
      'UIC=1'
      'UIR=1'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,Between,NotBetween'
      ' '
      '[FieldGroup1]'
      'GroupName=PrevDayHH'
      
        'Fields=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,' +
        '23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,4' +
        '4,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65' +
        ',66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,' +
        '87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,1' +
        '06,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,1' +
        '22,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,1' +
        '38,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,1' +
        '54,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,1' +
        '70,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,1' +
        '86,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,2' +
        '02,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,2' +
        '18,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,2' +
        '34,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,2' +
        '50,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265'
      ' '
      '[FieldGroup2]'
      'GroupName=PrevDayRH'
      
        'Fields=266,267,268,269,270,271,272,273,274,275,276,277,278,279,2' +
        '80,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,2' +
        '96,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,3' +
        '12,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,3' +
        '28,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,3' +
        '44,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,3' +
        '60,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,3' +
        '76,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,3' +
        '92,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,4' +
        '08,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,4' +
        '24,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,4' +
        '40,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,4' +
        '56,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,4' +
        '72,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,4' +
        '88,489,490,491,492,493,494,495,496,497,498,499,500'
      ' '
      '[RootGroup]'
      'Fields='
      ''
      '[DBSpecInfo]'
      'DatabaseName=dbQuery')
  end
  object dsAll: TDataSource
    DataSet = qryALL
    Left = 632
    Top = 8
  end
  object qryALL: TDBISAMQuery
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbQuery'
    EngineVersion = '4.24 Build 1'
    RequestLive = True
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT  '
      '  PrevDayRH.IsEquibaseChartsProcessed,'
      '   PrevDayRH.IsDRFChartsProcessed,'
      '   PrevDayRH.OrigSurface,'
      '   PrevDayRH.DistanceInFeet,'
      '   PrevDayRH.DistanceInYards,'
      '   PrevDayRH.IsPk3Race,'
      '   PrevDayRH.Pk3RaceNbr,'
      '   PrevDayRH.IsPk4Race,'
      '   PrevDayRH.Pk4RaceNbr,'
      '   PrevDayRH.IsPk6Race,'
      '   PrevDayRH.Pk6RaceNbr,'
      '   PrevDayRH.IsTriRace,'
      '   PrevDayRH.IsSuperRace,'
      '   PrevDayRH.IsPk9Place,'
      '   PrevDayRH.Pk9RaceNbr,'
      '   PrevDayRH.IsExaRace,'
      '   PrevDayRH.IsQuiRace,'
      '   PrevDayRH.IsDDRace,'
      '   PrevDayRH.DDRaceNbr,'
      '   PrevDayRH.IsPk3Leg1,'
      '   PrevDayRH.IsPk4Leg1,'
      '   PrevDayRH.IsPk6Leg1,'
      '   PrevDayRH.IsPk9Leg1,'
      '   PrevDayRH.IsDDLeg1,'
      '   PrevDayRH.RaceCondition1,'
      '   PrevDayRH.RaceCondition2,'
      '   PrevDayRH.RaceCondition3,'
      '   PrevDayRH.RaceCondition4,'
      '   PrevDayRH.RaceCondition5,'
      '   PrevDayRH.RaceCondition6,'
      '   PrevDayRH.RaceCondition7,'
      '   PrevDayRH.RaceCondition8,'
      '   PrevDayRH.RaceCondition9,'
      '   PrevDayRH.RaceCondition10,'
      '   PrevDayRH.BetLine,'
      '   PrevDayRH.Purse,'
      '   PrevDayRH.ClaimingPrice,'
      '   PrevDayRH.RaceConditions,'
      '   PrevDayRH.TrkCond,'
      '   PrevDayRH.DistanceDesc,'
      '   PrevDayRH.OrigDistanceDesc,'
      '   PrevDayRH.LocalTimeOfRace,'
      '   PrevDayRH.EstTimeOfRace,'
      '   PrevDayRH.EstTimeOfFirstRace,'
      '   PrevDayRH.IsFinalValue,'
      '   PrevDayRH.IsActive,'
      '   PrevDayRH.IsPPValue,'
      '   PrevDayRH.IsMLValue,'
      '   PrevDayRH.IsChalkValue,'
      '   PrevDayRH.IsPlayableValue,'
      '   PrevDayRH.IsPrintedOnValueSheet,'
      '   PrevDayRH.IsLinerSheetSelected,'
      '   PrevDayRH.IsOverlaySheetSelected,'
      '   PrevDayRH.IsWagerSheetSelected,'
      '   PrevDayRH.IsYouBetTrack,'
      '   PrevDayRH.FootNotes,'
      '   PrevDayRH.Trainers,'
      '   PrevDayRH.Owners,'
      '   PrevDayRH.ScratchedHorses,'
      '   PrevDayRH.FractionalTimes,'
      '   PrevDayRH.IsExactaMatched,'
      '   PrevDayRH.Exacta,'
      '   PrevDayRH.ExactaNbrs,'
      '   PrevDayRH.ExactaWager,'
      '   PrevDayRH.ExactaPayout,'
      '   PrevDayRH.IsTrifectaMatched,'
      '   PrevDayRH.Tri,'
      '   PrevDayRH.TrifectaNbrs,'
      '   PrevDayRH.TrifectaWager,'
      '   PrevDayRH.TrifectaPayout,'
      '   PrevDayRH.IsSuperfectaMatched,'
      '   PrevDayRH.Super,'
      '   PrevDayRH.SuperfectaNbrs,'
      '   PrevDayRH.SuperfectaWager,'
      '   PrevDayRH.SuperfectaPayout,'
      '   PrevDayRH.IsDailyDoubleMatchedFirstRace,'
      '   PrevDayRH.IsDailyDoubleMatchedLastRace,'
      '   PrevDayRH.DDFirstRace,'
      '   PrevDayRH.DDLastRace,'
      '   PrevDayRH.DailyDoubleNbrsFirstRace,'
      '   PrevDayRH.DailyDoubleNbrsLastRace,'
      '   PrevDayRH.DailyDoubleWagerFirstRace,'
      '   PrevDayRH.DailyDoubleWagerLastRace,'
      '   PrevDayRH.DailyDoublePayoutFirstRace,'
      '  PrevDayRH.DailyDoublePayoutLastRace,'
      '  PrevDayRH.IsQuinellaMatched,'
      '  PrevDayRH.Quinella,'
      '  PrevDayRH.QuinellaNbrs,'
      '  PrevDayRH.QuinellaWager,'
      '  PrevDayRH.QuinellaPayout,'
      '  PrevDayRH.IsPick3MatchedFirstRace,'
      '  PrevDayRH.IsPick3MatchedLastRace,'
      '  PrevDayRH.Pick3FirstRace,'
      '  PrevDayRH.Pick3LastRace,'
      '  PrevDayRH.Pick3NbrsFirstRace,'
      '  PrevDayRH.Pick3NbrsLastRace,'
      '  PrevDayRH.Pick3WagerFirstRace,'
      '  PrevDayRH.Pick3WagerLastRace,'
      '  PrevDayRH.Pick3PayoutFirstRace,'
      '  PrevDayRH.Pick3PayoutLastRace,'
      '  PrevDayRH.Pick3NbrsLeg1,'
      '  PrevDayRH.Pick3NbrsLeg2,'
      '  PrevDayRH.Pick3NbrsLeg3,'
      '  PrevDayRH.IsPick4MatchedFirstRace,'
      '  PrevDayRH.IsPick4MatchedLastRace,'
      '  PrevDayRH.Pick4FirstRace,'
      '  PrevDayRH.Pick4LastRace,'
      '  PrevDayRH.Pick4NbrsFirstRace,'
      '  PrevDayRH.Pick4NbrsLastRace,'
      '  PrevDayRH.Pick4WagerFirstRace,'
      '  PrevDayRH.Pick4WagerLastRace,'
      '  PrevDayRH.Pick4PayoutFirstRace,'
      '  PrevDayRH.Pick4PayoutLastRace,'
      '  PrevDayRH.Pick4NbrsLeg1,'
      '  PrevDayRH.Pick4NbrsLeg2,'
      '  PrevDayRH.Pick4NbrsLeg3,'
      '  PrevDayRH.Pick4NbrsLeg4,'
      '  PrevDayRH.IsPick6MatchedFirstRace,'
      '  PrevDayRH.IsPick6MatchedLastRace,'
      '  PrevDayRH.Pick6FirstRace,'
      '  PrevDayRH.Pick6LastRace,'
      '  PrevDayRH.Pick6NbrsFirstRace,'
      '  PrevDayRH.Pick6NbrsLastRace,'
      '  PrevDayRH.Pick6WagerFirstRace,'
      '  PrevDayRH.Pick6WagerLastRace,'
      '  PrevDayRH.Pick6PayoutFirstRace,'
      '  PrevDayRH.Pick6PayoutLastRace,'
      '  PrevDayRH.IsWinMatched,'
      '  PrevDayRH.WinNbrs,'
      '  PrevDayRH.WinPayout,'
      '  PrevDayRH.WinPlcPayout,'
      '  PrevDayRH.WinShoPayout,'
      '  PrevDayRH.IsPlcMatched,'
      '  PrevDayRH.PlcNbrs,'
      '  PrevDayRH.PlcPayout,'
      '  PrevDayRH.PlcShoPayout,'
      '  PrevDayRH.IsShoMatched,'
      '  PrevDayRH.ShoNbrs,'
      '  PrevDayRH.ShoPayout,'
      '  PrevDayRH.Weather,'
      '  PrevDayRH.Value,'
      '  PrevDayRH.Chalk,'
      '  PrevDayRH.Wager1,'
      '  PrevDayRH.Wager2,'
      '  PrevDayRH.Wager3,'
      '  PrevDayRH.Wager4,'
      '  PrevDayRH.Wager5,'
      '  PrevDayRH.Wager6,'
      '  PrevDayRH.AltWager1,'
      '  PrevDayRH.AltWager2,'
      '  PrevDayRH.AltWager3,'
      '  PrevDayRH.AltWager4,'
      '  PrevDayRH.AltWager5,'
      '  PrevDayRH.AltWager6,'
      '  PrevDayRH.WagerFinalOrder,'
      '  PrevDayRH.WagerSheetOrder,'
      '  PrevDayRH.TodaysWagerOrder,'
      '  PrevDayRH.WPSWagerAmt,'
      '  PrevDayRH.ExaWagerAmt,'
      '  PrevDayRH.QuiWagerAmt,'
      '  PrevDayRH.DDWagerAmt,'
      '  PrevDayRH.Pk3WagerAmt,'
      '  PrevDayRH.Pk4WagerAmt,'
      '  PrevDayRH.Pk6WagerAmt,'
      '  PrevDayRH.TriWagerAmt,'
      '  PrevDayRH.SfcWagerAmt,'
      '  PrevDayRH.NbrStarters,'
      '  PrevDayRH.NbrDebutStarters,'
      '  PrevDayRH.NbrDebutTwoStarters,'
      '  PrevDayRH.NbrTurfDebutStarters,'
      '  PrevDayRH.NbrRouteDebutStarters,'
      '  PrevDayRH.NbrScratchedStarters,'
      '  PrevDayRH.NbrRunners,'
      '  PrevDayRH.RaceTypeDesc,'
      '  PrevDayRH.RaceDesc,'
      '  PrevDayRH.RaceCondition,'
      '  PrevDayRH.IsTurfRace,'
      '  PrevDayRH.IsRouteRace,'
      '  PrevDayRH.IsMaidenSpecialRace,'
      '  PrevDayRH.IsMaidenClaimingRace,'
      '  PrevDayRH.IsMaidenOrTurfRace,'
      '  PrevDayRH.IsTwoYearOldRace,'
      '  PrevDayRH.IsClaimingRace,'
      '  PrevDayRH.AgeSexRestriction,'
      '  PrevDayRH.SimulcastTrkCode,'
      '  PrevDayRH.SimulcastRaceNbr,'
      '  PrevDayRH.RaceAutoInc,'
      '  PrevDayRH.TimeDiff,'
      '  PrevDayRH.WagerType,'
      '  PrevDayRH.NbrTriKey,'
      '  PrevDayRH.TotalPk3Choices,'
      '  PrevDayRH.Pk3KeyType,'
      '  PrevDayRH.Pk3Selected,'
      '  PrevDayRH.TotalTriChoices,'
      '  PrevDayRH.TotalSuperChoices,'
      '  PrevDayRH.TotalDDChoices,'
      '  PrevDayRH.TopLastSpeed,'
      '  PrevDayRH.TopBackSpeed,'
      '  PrevDayRH.DD,'
      '  PrevDayRH.Pick3,'
      '  PrevDayRH.Pick4,'
      '  PrevDayRH.Pick6,'
      '  PrevDayRH.ParTime,'
      '  PrevDayRH.IsCreateAngle,'
      '  PrevDayRH.IsCreateValue,'
      '  PrevDayRH.IsCreateTip,'
      '  PrevDayRH.IsCreatePk3,'
      '  PrevDayRH.IsCreateDetail,'
      '  PrevDayRH.IsCreateAlt,'
      '  PrevDayRH.RacePicks,'
      '  PrevDayRH.IsRacePicksAvailable,'
      '  PrevDayRH.TopEarlyPace,'
      '  PrevDayRH.TopMiddlePace,'
      '  PrevDayRH.TopLatePace,'
      '  PrevDayRH.TopEarlyPacePos,'
      '  PrevDayRH.TopMiddlePacePos,'
      '  PrevDayRH.TopLatePacePos,'
      '  PrevDayRH.SecondEarlyPace,'
      '  PrevDayRH.SecondMiddlePace,'
      '  PrevDayRH.SecondLatePace,'
      '  PrevDayRH.SecondEarlyPacePos,'
      '  PrevDayRH.SecondMiddlePacePos,'
      '  PrevDayRH.SecondLatePacePos,'
      '  PrevDayRH.TotalMorningLineTo1Probability,'
      '  PrevDayRH.TotalFinalLineTo1Probability,'
      '  PrevDayRH.MaxWPSBet,'
      '  PrevDayRH.MaxGimmickBet,'
      '  PrevDayRH.TrkCode,'
      '  PrevDayRH.RaceDate,'
      '  PrevDayRH.RaceNbr,'
      '  PrevDayRH.RangeRaceDate,'
      '  PrevDayRH.RaceType,'
      '  PrevDayRH.TypeOfRace,'
      '  PrevDayRH.Surface,'
      '  PrevDayRH.DistanceInFurlongs,'
      '  PrevDayHH.PostPos,'
      '  PrevDayHH.ProgramNbr,'
      '  PrevDayHH.ProgNbrSort,'
      '  PrevDayHH.MorningLineDesc,'
      '  PrevDayHH.MorningLineTo1,'
      '  PrevDayHH.MorningLineTo1Rank,'
      '  PrevDayHH.FinishPos,'
      '  PrevDayHH.Odds,'
      '  PrevDayHH.IsFavorite,'
      '  PrevDayHH.HorseName,'
      '  PrevDayHH.HorseNbr,'
      '  PrevDayHH.Sex,'
      '  PrevDayHH.Age,'
      '  PrevDayHH.Equip,'
      '  PrevDayHH.Med,'
      '  PrevDayHH.IsFirstTimeJuice,'
      '  PrevDayHH.IsSecondTimeJuice,'
      '  PrevDayHH.IsDebut,'
      '  PrevDayHH.IsDebutTwo,'
      '  PrevDayHH.IsTurfDebut,'
      '  PrevDayHH.DebutIndicator,'
      '  PrevDayHH.TurfIndicator,'
      '  PrevDayHH.MudIndicator,'
      '  PrevDayHH.RouteIndicator,'
      '  PrevDayHH.IsClaimed1Back,'
      '  PrevDayHH.IsClaimed2Back,'
      '  PrevDayHH.IsDirtToTurf,'
      '  PrevDayHH.IsTurfToDirt,'
      '  PrevDayHH.IsSprToRte,'
      '  PrevDayHH.IsRteToSpr,'
      '  PrevDayHH.DaysLast,'
      '  PrevDayHH.DaysLastWork,'
      '  PrevDayHH.DaysLastWork2,'
      '  PrevDayHH.DaysLastWork3,'
      '  PrevDayHH.NbrWorksLast,'
      '  PrevDayHH.StartsWorks21,'
      '  PrevDayHH.JkyEquibaseKey,'
      '  PrevDayHH.TrnEquibaseKey,'
      '  PrevDayHH.SireName,'
      '  PrevDayHH.DamSireName,'
      '  PrevDayHH.DamName,'
      '  PrevDayHH.BredIn,'
      '  PrevDayHH.Owner,'
      '  PrevDayHH.Breeder,'
      '  PrevDayHH.LastSpeed,'
      '  PrevDayHH.LastSpeedRank,'
      '  PrevDayHH."Power",'
      '  PrevDayHH.PowerRank,'
      '  PrevDayHH.BackSpeed,'
      '  PrevDayHH.BackSpeedRank,'
      '  PrevDayHH.EarlyPace,'
      '  PrevDayHH.EarlyPaceRank,'
      '  PrevDayHH.EarlyPacePos,'
      '  PrevDayHH.EarlyPacePosRank,'
      '  PrevDayHH.MiddlePace,'
      '  PrevDayHH.MiddlePaceRank,'
      '  PrevDayHH.MiddlePacePos,'
      '  PrevDayHH.MiddlePacePosRank,'
      '  PrevDayHH.LatePace,'
      '  PrevDayHH.LatePaceRank,'
      '  PrevDayHH.LatePacePos,'
      '  PrevDayHH.LatePacePosRank,'
      '  PrevDayHH.FinishPacePos,'
      '  PrevDayHH.FinishPacePosRank,'
      '  PrevDayHH.AvgClass,'
      '  PrevDayHH.AvgClassRank,'
      '  PrevDayHH.FinalOrderKey,'
      '  PrevDayHH.FinalWinPct,'
      '  PrevDayHH.FinalWinPctRank,'
      '  PrevDayHH.FinalValueBet,'
      '  PrevDayHH.PrimaryOrderKey,'
      '  PrevDayHH.PrimaryWinPct,'
      '  PrevDayHH.PrimaryWinPctRank,'
      '  PrevDayHH.PrimaryValueBet,'
      '  PrevDayHH.SecondaryOrderKey,'
      '  PrevDayHH.SecondaryWinPct,'
      '  PrevDayHH.SecondaryWinPctRank,'
      '  PrevDayHH.SecondaryValueBet,'
      '  PrevDayHH.DefaultOrderKey,'
      '  PrevDayHH.DefaultWinPct,'
      '  PrevDayHH.DefaultWinPctRank,'
      '  PrevDayHH.DefaultValueBet,'
      '  PrevDayHH.AvgSpeed,'
      '  PrevDayHH.AvgSpeedRank,'
      '  PrevDayHH.AvgClassRating,'
      '  PrevDayHH.AvgClassRatingRank,'
      '  PrevDayHH.BackClass,'
      '  PrevDayHH.BackClassRank,'
      '  PrevDayHH.LastClass,'
      '  PrevDayHH.LastClassRank,'
      '  PrevDayHH.IsDollar,'
      '  PrevDayHH.IsDoubleDollar,'
      '  PrevDayHH.IsFrontDoubleLiner0,'
      '  PrevDayHH.IsFrontDoubleLiner1,'
      '  PrevDayHH.IsFrontDoubleLiner2,'
      '  PrevDayHH.IsFrontDoubleLiner3,'
      '  PrevDayHH.IsBackDoubleLiner0,'
      '  PrevDayHH.IsBackDoubleLiner1,'
      '  PrevDayHH.IsBackDoubleLiner2,'
      '  PrevDayHH.IsBackDoubleLiner3,'
      '  PrevDayHH.IsTripleLiner0,'
      '  PrevDayHH.IsTripleLiner1,'
      '  PrevDayHH.IsTripleLiner2,'
      '  PrevDayHH.IsTripleLiner3,'
      '  PrevDayHH.IsFrontDoubleLiner,'
      '  PrevDayHH.IsBackDoubleLiner,'
      '  PrevDayHH.IsTripleDot,'
      '  PrevDayHH.IsFrontDoubleDot,'
      '  PrevDayHH.IsBackDoubleDot,'
      '  PrevDayHH.IsTripleLiner,'
      '  PrevDayHH.IsLayoffAndUp,'
      '  PrevDayHH.IsClaimedAndUp,'
      '  PrevDayHH.IsClaimedAndDown,'
      '  PrevDayHH.IsFirstTimeClaiming,'
      '  PrevDayHH.IsBelowClaimedPrice,'
      '  PrevDayHH.AngleDesc,'
      '  PrevDayHH.IsBlinkersOn,'
      '  PrevDayHH.IsBlinkersOff,'
      '  PrevDayHH.LastEquip,'
      '  PrevDayHH.EstTimeOfRace,'
      '  PrevDayHH.EstTimeOfFirstRace,'
      '  PrevDayHH.NbrDebutStarters,'
      '  PrevDayHH.AvgPurse,'
      '  PrevDayHH.Entry,'
      '  PrevDayHH.ProgramNbrSort,'
      '  PrevDayHH.IsScratched,'
      '  PrevDayHH.Color,'
      '  PrevDayHH.Weight,'
      '  PrevDayHH.EstMorningLineOrderKey,'
      '  PrevDayHH.EstMorningLineWinPct,'
      '  PrevDayHH.EstMorningLineValueBet,'
      '  PrevDayHH.EarlyPaceAdvantage,'
      '  PrevDayHH.MiddlePaceAdvantage,'
      '  PrevDayHH.LatePaceAdvantage,'
      '  PrevDayHH.LifeStarts,'
      '  PrevDayHH.LifeWins,'
      '  PrevDayHH.TurfStarts,'
      '  PrevDayHH.TurfWins,'
      '  PrevDayHH.MudStarts,'
      '  PrevDayHH.MudWins,'
      '  PrevDayHH.TrkStarts,'
      '  PrevDayHH.TrkWins,'
      '  PrevDayHH.RouteStarts,'
      '  PrevDayHH.RouteWins,'
      '  PrevDayHH.SprintStarts,'
      '  PrevDayHH.SprintWins,'
      '  PrevDayHH.QSP1stCall,'
      '  PrevDayHH.QSP1stCallRank,'
      '  PrevDayHH.QSP2ndCall,'
      '  PrevDayHH.QSP2ndCallRank,'
      '  PrevDayHH.KSP1stCall,'
      '  PrevDayHH.KSP1stCallRank,'
      '  PrevDayHH.KSP2ndCall,'
      '  PrevDayHH.KSP2ndCallRank,'
      '  PrevDayHH.QSP1stCallRunStyle,'
      '  PrevDayHH.QSP2ndCallRunStyle,'
      '  PrevDayHH.WagerAmt,'
      '  PrevDayHH.WinWagerAmt,'
      '  PrevDayHH.PlcWagerAmt,'
      '  PrevDayHH.ShoWagerAmt,'
      '  PrevDayHH.TodaysWagerOrderKey,'
      '  PrevDayHH.IsUpInClass,'
      '  PrevDayHH.IsDownInClass,'
      '  PrevDayHH.Is1stClaiming,'
      '  PrevDayHH.Is1stMCL,'
      '  PrevDayHH.IsHiddenWorkout,'
      '  PrevDayHH.Is1stAfterLayoff,'
      '  PrevDayHH.Is2ndAfterLayoff,'
      '  PrevDayHH.Is3rdAfterLayoff,'
      '  PrevDayHH.IsDirtToTurfToDirtAfterLayoff,'
      '  PrevDayHH.IsTurfToDirtToTurfAfterLayoff,'
      '  PrevDayHH.IsRouteToSprintToRouteAfterLayoff,'
      '  PrevDayHH.IsSprintToRouteToSprintAfterLayoff,'
      '  PrevDayHH.IsOnlySpeed,'
      '  PrevDayHH.IsProvenSpeed,'
      '  PrevDayHH.IsProvenSpeedPlus,'
      '  PrevDayHH.IsXtremeSpeed,'
      '  PrevDayHH.IsLastRaceTurnMove,'
      '  PrevDayHH.IsLastRaceFinalFurlongMove,'
      '  PrevDayHH.IsPrevToLastRaceTurnMove,'
      '  PrevDayHH.IsPrevToLastRaceFinalFurlongMove,'
      '  PrevDayHH.Is2yoBred,'
      '  PrevDayHH.Is1stBred,'
      '  PrevDayHH.IsTurfBred,'
      '  PrevDayHH.IsQuirinSpeed,'
      '  PrevDayHH.IsKleinSpeed,'
      '  PrevDayHH.IsKeyRace,'
      '  PrevDayHH.IsBouncyBouncy,'
      '  PrevDayHH.IsBestEffortLast,'
      '  PrevDayHH.IsShipIn,'
      '  PrevDayHH.IsYouBetTrack,'
      '  PrevDayHH.IsPrintedOnValueSheet,'
      '  PrevDayHH.IsWagerSheetSelected,'
      '  PrevDayHH.IsOverlaySheetSelected,'
      '  PrevDayHH.IsLinerSheetSelected,'
      '  PrevDayHH.IsVerifiedClaim,'
      '  PrevDayHH.IsBetLast,'
      '  PrevDayHH.IsUltimateFormFactor,'
      '  PrevDayHH.Is1stOffLayoff,'
      '  PrevDayHH.Is2ndOffLayoff,'
      '  PrevDayHH.Is3rdOffLayoff,'
      '  PrevDayHH.IsFormConsistent,'
      '  PrevDayHH.IsX1stBred,'
      '  PrevDayHH.IsX2yoBred,'
      '  PrevDayHH.IsXTurfBred,'
      '  PrevDayHH.IsUnexpectedEarlySpeed,'
      '  PrevDayHH.IsTrnDebutPlus,'
      '  PrevDayHH.IsTrnDebutTwoPlus,'
      '  PrevDayHH.IsTrn2yoPlus,'
      '  PrevDayHH.IsTrnTurfPlus,'
      '  PrevDayHH.IsTrnTodayPlus,'
      '  PrevDayHH.IsTrnTodayMinus,'
      '  PrevDayHH.IsXtremeSpeed2,'
      '  PrevDayHH.IsQuirinSpeed2,'
      '  PrevDayHH.IsKleinSpeed2,'
      '  PrevDayHH.Is2yoBredSheetSelected,'
      '  PrevDayHH.IsTurfBredSheetSelected,'
      '  PrevDayHH.Is1stBredSheetSelected,'
      '  PrevDayHH.IsSpeedSheetSelected,'
      '  PrevDayHH.EstMorningLineTo1Fair,'
      '  PrevDayHH.TodaysWagerWinPct,'
      '  PrevDayHH.TodaysWagerValueBet,'
      '  PrevDayHH.TodaysWagerLineTo1Fair,'
      '  PrevDayHH.EstMorningLineWinPctRank,'
      '  PrevDayHH.TodaysWagerWinPctRank,'
      '  PrevDayHH.TrnWinsRank,'
      '  PrevDayHH.TrnEarningsRank,'
      '  PrevDayHH.TrnTrackRank,'
      '  PrevDayHH.JkyWinsRank,'
      '  PrevDayHH.JkyEarningsRank,'
      '  PrevDayHH.JkyTrackRank,'
      '  PrevDayHH.OwnWinsRank,'
      '  PrevDayHH.OwnEarningsRank,'
      '  PrevDayHH.IsOnlySpeed2,'
      '  PrevDayHH.IsOnStandingInList,'
      '  PrevDayHH.b2,'
      '  PrevDayHH.b3,'
      '  PrevDayHH.b4,'
      '  PrevDayHH.b5,'
      '  PrevDayHH.b6,'
      '  PrevDayHH.b7,'
      '  PrevDayHH.b8,'
      '  PrevDayHH.b9,'
      '  PrevDayHH.b10,'
      '  PrevDayHH.b11,'
      '  PrevDayHH.b12,'
      '  PrevDayHH.b13,'
      '  PrevDayHH.b14,'
      '  PrevDayHH.b15,'
      '  PrevDayHH.b16,'
      '  PrevDayHH.b17,'
      '  PrevDayHH.b18,'
      '  PrevDayHH.b19,'
      '  PrevDayHH.b20'
      'FROM'
      '  PrevDayHH'
      
        '  LEFT OUTER JOIN PrevDayRH ON (PrevDayHH.TrkCode = PrevDayRH.Tr' +
        'kCode) AND (PrevDayHH.RaceDate = PrevDayRH.RaceDate) AND (PrevDa' +
        'yHH.RaceNbr = PrevDayRH.RaceNbr)'
      'where PREVDayHH.TrkCode = '#39'CRC'#39)
    Params = <>
    Left = 592
    Top = 65528
  end
  object ppQueryReport: TppReport
    AutoStop = False
    DataPipeline = plQuery
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
    Template.FileName = 'c:\ratings31\QueryPrevious.rtm'
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
    Left = 760
    Top = 152
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plQuery'
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
        Caption = 'Liner Results'
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
    end
    object DetailBand: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 18785
        mmLeft = 0
        mmTop = 0
        mmWidth = 266701
        BandType = 4
      end
      object dbRaceNbr: TppDBText
        UserName = 'RaceNbr'
        DataField = 'RaceNbr'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2836
        mmLeft = 7144
        mmTop = 0
        mmWidth = 4233
        BandType = 4
      end
      object dbHorseName: TppDBText
        UserName = 'HorseName'
        DataField = 'HorseName'
        DataPipeline = WagerResultsReportForm.plPrevDayHH
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2836
        mmLeft = 265
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object dbProgramNbr: TppDBText
        UserName = 'ProgramNbr'
        DataField = 'ProgramNbr'
        DataPipeline = WagerResultsReportForm.plPrevDayHH
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 3260
        mmLeft = 51076
        mmTop = 0
        mmWidth = 1312
        BandType = 4
      end
      object MorningLineDesc: TppDBText
        UserName = 'MorningLineDesc'
        AutoSize = True
        DataField = 'MorningLineDesc'
        DataPipeline = WagerResultsReportForm.plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2455
        mmLeft = 43180
        mmTop = 0
        mmWidth = 3387
        BandType = 4
      end
      object dbExactaPayout: TppDBText
        UserName = 'ExactaPayout'
        BlankWhenZero = True
        DataField = 'ExactaPayout'
        DataPipeline = plQuery
        DisplayFormat = '####0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2910
        mmLeft = 172773
        mmTop = 3440
        mmWidth = 10319
        BandType = 4
      end
      object FinishNbrs: TppDBText
        UserName = 'FinishNbrs'
        DataField = 'WagerSheetOrder'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '####0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
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
        mmHeight = 18785
        mmLeft = 47096
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object DailyDoublePayoutLastRace: TppDBText
        UserName = 'DailyDoublePayoutLastRace'
        BlankWhenZero = True
        DataField = 'DailyDoublePayoutLastRace'
        DataPipeline = plQuery
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 197380
        mmTop = 3440
        mmWidth = 17198
        BandType = 4
      end
      object Pick4PayoutLastRace: TppDBText
        UserName = 'Pick4PayoutLastRace'
        BlankWhenZero = True
        DataField = 'Pick4PayoutLastRace'
        DataPipeline = plQuery
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2667
        mmLeft = 253736
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 18785
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
        mmHeight = 18785
        mmLeft = 243417
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbSuperfectaPayout: TppDBText
        UserName = 'SuperfectaPayout'
        BlankWhenZero = True
        DataField = 'SuperfectaPayout'
        DataPipeline = plQuery
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2646
        mmLeft = 144727
        mmTop = 3440
        mmWidth = 12435
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 18785
        mmLeft = 104775
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbWinPayout: TppDBText
        UserName = 'WinPayout'
        BlankWhenZero = True
        DataField = 'WinPayout'
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 3175
        mmLeft = 81227
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object dbSheetOrder: TppDBText
        UserName = 'SheetOrder'
        DataField = 'WagerFinalOrder'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        mmHeight = 18785
        mmLeft = 61648
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object dbWinNbrs: TppDBText
        UserName = 'WinNbrs'
        BlankWhenZero = True
        DataField = 'WinNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 0
        mmWidth = 6879
        BandType = 4
      end
      object Pick3PayoutLastRace: TppDBText
        UserName = 'Pick3PayoutLastRace'
        BlankWhenZero = True
        DataField = 'Pick3PayoutLastRace'
        DataPipeline = plQuery
        DisplayFormat = '######0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 3440
        mmLeft = 230188
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object DDLastRace: TppDBText
        UserName = 'DDLastRace'
        BlankWhenZero = True
        DataField = 'DDLastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 197380
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object Pick3LastRace: TppDBText
        UserName = 'Pick3LastRace'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3LastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 222790
        mmTop = 11906
        mmWidth = 19304
        BandType = 4
      end
      object Pick4LastRace: TppDBText
        UserName = 'Pick4LastRace'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4LastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2498
        mmLeft = 254138
        mmTop = 12171
        mmWidth = 11769
        BandType = 4
      end
      object DailyDoubleNbrsLastRace: TppDBText
        UserName = 'DailyDoubleNbrsLastRace'
        BlankWhenZero = True
        DataField = 'DailyDoubleNbrsLastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 197380
        mmTop = 7408
        mmWidth = 17198
        BandType = 4
      end
      object Pick3NbrsLastRace: TppDBText
        UserName = 'Pick3NbrsLastRace'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3NbrsLastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 4
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 224579
        mmTop = 7408
        mmWidth = 17780
        BandType = 4
      end
      object Pick4NbrsLastRace: TppDBText
        UserName = 'Pick4NbrsLastRace'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4NbrsLastRace'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 4
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2498
        mmLeft = 250413
        mmTop = 7408
        mmWidth = 15494
        BandType = 4
      end
      object dbPlcNbrs: TppDBText
        UserName = 'PlcNbrs'
        BlankWhenZero = True
        DataField = 'PlcNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 3175
        mmLeft = 97102
        mmTop = 7408
        mmWidth = 6879
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'TrkCode1'
        DataField = 'RaceDate'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2455
        mmLeft = 265
        mmTop = 3175
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'TrkCode2'
        DataField = 'RaceType'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2836
        mmLeft = 529
        mmTop = 6085
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'RaceNbr1'
        DataField = 'DaysLast'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 29369
        mmTop = 3175
        mmWidth = 4498
        BandType = 4
      end
      object WagerAmt: TppDBText
        UserName = 'WagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'WagerAmt'
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2498
        mmLeft = 38354
        mmTop = 3704
        mmWidth = 8213
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
        mmLeft = 49381
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
        mmHeight = 2498
        mmLeft = 51076
        mmTop = 6350
        mmWidth = 10837
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
        mmHeight = 2498
        mmLeft = 51668
        mmTop = 8996
        mmWidth = 10245
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
        mmHeight = 2498
        mmLeft = 50990
        mmTop = 11906
        mmWidth = 10922
        BandType = 4
      end
      object Super: TppDBText
        UserName = 'Super'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Super'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 147723
        mmTop = 11642
        mmWidth = 9440
        BandType = 4
      end
      object Tri: TppDBText
        UserName = 'Tri'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Tri'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 164773
        mmTop = 12171
        mmWidth = 5884
        BandType = 4
      end
      object Exacta: TppDBText
        UserName = 'Exacta'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Exacta'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 179949
        mmTop = 12171
        mmWidth = 2879
        BandType = 4
      end
      object Quinella: TppDBText
        UserName = 'Quinella'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Quinella'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 188691
        mmTop = 12171
        mmWidth = 7366
        BandType = 4
      end
      object SuperfectaNbrs: TppDBText
        UserName = 'SuperfectaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'SuperfectaNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 150727
        mmTop = 7408
        mmWidth = 6435
        BandType = 4
      end
      object TrifectaNbrs: TppDBText
        UserName = 'TrifectaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'TrifectaNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 165999
        mmTop = 7408
        mmWidth = 4657
        BandType = 4
      end
      object ExactaNbrs: TppDBText
        UserName = 'ExactaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'ExactaNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 180213
        mmTop = 7408
        mmWidth = 2879
        BandType = 4
      end
      object QuinellaNbrs: TppDBText
        UserName = 'QuinellaNbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'QuinellaNbrs'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2879
        mmLeft = 184458
        mmTop = 7408
        mmWidth = 11599
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2455
        mmLeft = 2667
        mmTop = 9790
        mmWidth = 10202
        BandType = 4
      end
      object TriWagerAmt: TppDBText
        UserName = 'TriWagerAmt'
        BlankWhenZero = True
        DataField = 'TriWagerAmt'
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
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
        DataPipeline = plQuery
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2646
        mmLeft = 207169
        mmTop = 0
        mmWidth = 7938
        BandType = 4
      end
      object PlcWagerAmt: TppDBText
        UserName = 'PlcWagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'PlcWagerAmt'
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2498
        mmLeft = 35941
        mmTop = 6350
        mmWidth = 10626
        BandType = 4
      end
      object ShoWagerAmt: TppDBText
        UserName = 'ShoWagerAmt'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'ShoWagerAmt'
        DataPipeline = plQuery
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2498
        mmLeft = 35264
        mmTop = 9260
        mmWidth = 11303
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'Odds1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Odds'
        DataPipeline = plQuery
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plQuery'
        mmHeight = 2836
        mmLeft = 57003
        mmTop = 265
        mmWidth = 3852
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 116152
      mmPrintPosition = 0
      object imgPk4: TppShape
        UserName = 'imgDD2'
        mmHeight = 21960
        mmLeft = 185473
        mmTop = 47361
        mmWidth = 61913
        BandType = 7
      end
      object imgTri: TppShape
        UserName = 'imgTri'
        mmHeight = 21960
        mmLeft = 120915
        mmTop = 24606
        mmWidth = 61913
        BandType = 7
      end
      object imgSfc: TppShape
        UserName = 'imgSfc'
        mmHeight = 21960
        mmLeft = 120915
        mmTop = 794
        mmWidth = 61913
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
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 37571
        mmLeft = 0
        mmTop = 40746
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
        mmLeft = 56356
        mmTop = 24606
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 25929
        mmWidth = 19939
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 30692
        mmWidth = 19177
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 35719
        mmWidth = 13674
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
        mmHeight = 3302
        mmLeft = 102797
        mmTop = 25929
        mmWidth = 13885
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
        mmHeight = 3302
        mmLeft = 107495
        mmTop = 30692
        mmWidth = 9186
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
        mmHeight = 3260
        mmLeft = 108849
        mmTop = 35719
        mmWidth = 7832
        BandType = 7
      end
      object lblSfcWagered: TppLabel
        UserName = 'lblSfcWagered'
        Caption = '$2 Superfecta Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 1852
        mmWidth = 25908
        BandType = 7
      end
      object lblSfcPayout: TppLabel
        UserName = 'lblSfcPayout'
        Caption = '$2 Superfecta Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 6615
        mmWidth = 25146
        BandType = 7
      end
      object lblSfcPL: TppLabel
        UserName = 'Label301'
        Caption = '$2 Superfecta P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 11642
        mmWidth = 19643
        BandType = 7
      end
      object varSfcPL: TppVariable
        UserName = 'vSfcPL'
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
        mmHeight = 3260
        mmLeft = 173016
        mmTop = 11906
        mmWidth = 7959
        BandType = 7
      end
      object varSfcPayout: TppVariable
        UserName = 'vSfcWon'
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
        mmHeight = 3302
        mmLeft = 171662
        mmTop = 6879
        mmWidth = 9313
        BandType = 7
      end
      object varSfcWagered: TppVariable
        UserName = 'vSfcWagered'
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
        mmHeight = 3302
        mmLeft = 166963
        mmTop = 1852
        mmWidth = 14012
        BandType = 7
      end
      object lblTriWagered: TppLabel
        UserName = 'lblTriWagered'
        Caption = '$2 Trifecta Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 26723
        mmWidth = 22225
        BandType = 7
      end
      object lblTriPayout: TppLabel
        UserName = 'lblTriPayout'
        Caption = '$2 Trifecta Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 31221
        mmWidth = 21463
        BandType = 7
      end
      object lblTriPL: TppLabel
        UserName = 'lblTriPL'
        Caption = '$2 Trifecta P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 35719
        mmWidth = 15960
        BandType = 7
      end
      object varTriPL: TppVariable
        UserName = 'vTriPL'
        CalcOrder = 18
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
        mmLeft = 173694
        mmTop = 35983
        mmWidth = 7281
        BandType = 7
      end
      object varTriPayout: TppVariable
        UserName = 'vTriWon'
        CalcOrder = 17
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
        mmLeft = 172297
        mmTop = 31485
        mmWidth = 8678
        BandType = 7
      end
      object varTriWagered: TppVariable
        UserName = 'vTriWagered'
        CalcOrder = 16
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
        mmLeft = 167598
        mmTop = 26988
        mmWidth = 13377
        BandType = 7
      end
      object imgExa: TppShape
        UserName = 'imgExa'
        mmHeight = 21960
        mmLeft = 120915
        mmTop = 70115
        mmWidth = 61913
        BandType = 7
      end
      object imgQui: TppShape
        UserName = 'imgQui'
        mmHeight = 21960
        mmLeft = 120915
        mmTop = 47361
        mmWidth = 61913
        BandType = 7
      end
      object lblQuiWagered: TppLabel
        UserName = 'lblQuiWagered'
        Caption = '$2 Quinella Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 49742
        mmWidth = 23029
        BandType = 7
      end
      object lblQuiPayout: TppLabel
        UserName = 'lblQuiPayout'
        Caption = '$2 Quinella Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 55033
        mmWidth = 22267
        BandType = 7
      end
      object lblQuiPL: TppLabel
        UserName = 'lblQuiPL'
        Caption = '$2 Quinella P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 59531
        mmWidth = 16764
        BandType = 7
      end
      object varQuiPL: TppVariable
        UserName = 'vQuiPL'
        CalcOrder = 21
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
        mmLeft = 173027
        mmTop = 59796
        mmWidth = 8213
        BandType = 7
      end
      object varQuiPayout: TppVariable
        UserName = 'vQuiWon'
        CalcOrder = 20
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
        mmLeft = 171630
        mmTop = 55298
        mmWidth = 9610
        BandType = 7
      end
      object varQuiWagered: TppVariable
        UserName = 'vQuiWagered'
        CalcOrder = 19
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
        mmLeft = 166931
        mmTop = 50271
        mmWidth = 14309
        BandType = 7
      end
      object lblExaWagered: TppLabel
        UserName = 'lblExaWagered'
        Caption = '$2 Exacta Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 71173
        mmWidth = 21378
        BandType = 7
      end
      object lblExaPayout: TppLabel
        UserName = 'lblExaPayout'
        Caption = '$2 Exacta Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 75936
        mmWidth = 20616
        BandType = 7
      end
      object lblExaPL: TppLabel
        UserName = 'lblExaPL'
        Caption = '$2 Exacta P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 80963
        mmWidth = 15113
        BandType = 7
      end
      object varExaPL: TppVariable
        UserName = 'vExaPL'
        CalcOrder = 24
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
        mmLeft = 172731
        mmTop = 80963
        mmWidth = 8509
        BandType = 7
      end
      object varExaPayout: TppVariable
        UserName = 'vExaWon'
        CalcOrder = 23
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
        mmLeft = 171249
        mmTop = 76200
        mmWidth = 9991
        BandType = 7
      end
      object varExaWagered: TppVariable
        UserName = 'vExaWagered'
        CalcOrder = 22
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
        mmLeft = 166550
        mmTop = 71438
        mmWidth = 14690
        BandType = 7
      end
      object imgDD: TppShape
        UserName = 'imgDD'
        mmHeight = 21960
        mmLeft = 185473
        mmTop = 794
        mmWidth = 61913
        BandType = 7
      end
      object lblDDWagered: TppLabel
        UserName = 'Label401'
        Caption = '$2 Double Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 1323
        mmWidth = 21759
        BandType = 7
      end
      object lblDDPayout: TppLabel
        UserName = 'lblDDPayout'
        Caption = '$2 Double Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 6085
        mmWidth = 20997
        BandType = 7
      end
      object lblDDPL: TppLabel
        UserName = 'lblDDPL'
        Caption = '$2 Double P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 11113
        mmWidth = 15494
        BandType = 7
      end
      object varDDPL: TppVariable
        UserName = 'vDDPL'
        CalcOrder = 27
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
        mmLeft = 238623
        mmTop = 11113
        mmWidth = 7705
        BandType = 7
      end
      object varDDPayout: TppVariable
        UserName = 'vDDWon'
        CalcOrder = 26
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
        mmLeft = 236971
        mmTop = 6085
        mmWidth = 9356
        BandType = 7
      end
      object varDDWagered: TppVariable
        UserName = 'vDDWagered'
        CalcOrder = 25
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
        mmLeft = 232272
        mmTop = 1323
        mmWidth = 14055
        BandType = 7
      end
      object imgSho: TppShape
        UserName = 'imgSho'
        mmHeight = 21960
        mmLeft = 56356
        mmTop = 47361
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 48683
        mmWidth = 20066
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 53446
        mmWidth = 19304
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 58473
        mmWidth = 13801
        BandType = 7
      end
      object varShoWagered: TppVariable
        UserName = 'vShoWagered'
        CalcOrder = 34
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
        mmLeft = 101558
        mmTop = 48683
        mmWidth = 14859
        BandType = 7
      end
      object varShoWon: TppVariable
        UserName = 'vShoWon'
        CalcOrder = 35
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
        mmLeft = 106257
        mmTop = 53446
        mmWidth = 10160
        BandType = 7
      end
      object ppVariable25: TppVariable
        UserName = 'vShoPL'
        CalcOrder = 36
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
        mmLeft = 107654
        mmTop = 58473
        mmWidth = 8763
        BandType = 7
      end
      object imgPk3: TppShape
        UserName = 'imgDD1'
        mmHeight = 21960
        mmLeft = 185473
        mmTop = 24606
        mmWidth = 61913
        BandType = 7
      end
      object lblPk3Wagered: TppLabel
        UserName = 'lblPk3Wagered'
        Caption = '$2 Pick 3 Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 26988
        mmWidth = 20574
        BandType = 7
      end
      object lblPk3Payout: TppLabel
        UserName = 'lblPk3Payout'
        Caption = '$2 Pick 3 Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 32015
        mmWidth = 19812
        BandType = 7
      end
      object lblPk3PL: TppLabel
        UserName = 'lblPk3PL'
        Caption = '$2 Pick 3 P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 37042
        mmWidth = 14309
        BandType = 7
      end
      object varPk3PL: TppVariable
        UserName = 'vPk3PL'
        CalcOrder = 30
        DataType = dtDouble
        DisplayFormat = '#######.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 237818
        mmTop = 36777
        mmWidth = 8509
        BandType = 7
      end
      object varPk3Payout: TppVariable
        UserName = 'vPk3Won'
        CalcOrder = 29
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
        mmLeft = 236336
        mmTop = 31750
        mmWidth = 9991
        BandType = 7
      end
      object varPk3Wagered: TppVariable
        UserName = 'vPk3Wagered'
        CalcOrder = 28
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
        mmLeft = 231638
        mmTop = 26988
        mmWidth = 14690
        BandType = 7
      end
      object lblPk4Wagered: TppLabel
        UserName = 'lblPk4Wagered'
        Caption = '$2 Pick 4 Wagered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 186796
        mmTop = 49213
        mmWidth = 20574
        BandType = 7
      end
      object lblPk4Payout: TppLabel
        UserName = 'lblPk4Payout'
        Caption = '$2 Pick 4 Payouts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 186796
        mmTop = 53975
        mmWidth = 19812
        BandType = 7
      end
      object lblPk4PL: TppLabel
        UserName = 'lblPk4PL'
        Caption = '$2 Pick 4 P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 186796
        mmTop = 58738
        mmWidth = 14309
        BandType = 7
      end
      object varPk4PL: TppVariable
        UserName = 'vPk4PL'
        CalcOrder = 33
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
        mmLeft = 237818
        mmTop = 59531
        mmWidth = 8509
        BandType = 7
      end
      object varPk4Payout: TppVariable
        UserName = 'vPk4Won'
        CalcOrder = 32
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
        mmLeft = 236336
        mmTop = 54240
        mmWidth = 9991
        BandType = 7
      end
      object varPk4Wagered: TppVariable
        UserName = 'vPk4Wagered'
        CalcOrder = 31
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
        mmLeft = 231638
        mmTop = 49213
        mmWidth = 14690
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
        mmLeft = 1323
        mmTop = 94456
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
        mmHeight = 3260
        mmLeft = 2381
        mmTop = 42069
        mmWidth = 9610
        BandType = 7
      end
      object vWPSPL: TppVariable
        UserName = 'vWPSPL'
        CalcOrder = 37
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 43825
        mmTop = 42333
        mmWidth = 9356
        BandType = 7
      end
      object vTriSfcPL: TppVariable
        UserName = 'vTriSfcPL'
        CalcOrder = 38
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 43106
        mmTop = 47625
        mmWidth = 10075
        BandType = 7
      end
      object lblTriSfcPL: TppLabel
        UserName = 'lblTriSfcPL'
        Caption = 'Tri/Sfc P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 2117
        mmTop = 47361
        mmWidth = 11515
        BandType = 7
      end
      object lblExaQuiPL: TppLabel
        UserName = 'lblExaQuiPL'
        Caption = 'Exa/Qui P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 2381
        mmTop = 52652
        mmWidth = 12996
        BandType = 7
      end
      object lblDDPk3PL: TppLabel
        UserName = 'lblDDPk3PL'
        Caption = 'DD/Pk3 P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 57944
        mmWidth = 12488
        BandType = 7
      end
      object vExaQuiPL: TppVariable
        UserName = 'vExaQuiPL'
        CalcOrder = 39
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 41497
        mmTop = 52917
        mmWidth = 11684
        BandType = 7
      end
      object vDDPk3PL: TppVariable
        UserName = 'vDDPk3PL'
        CalcOrder = 40
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 41751
        mmTop = 58208
        mmWidth = 11430
        BandType = 7
      end
      object lblPk4Pk6PL: TppLabel
        UserName = 'lblPk4Pk6PL'
        Caption = 'Pk4 P/L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 2646
        mmTop = 64029
        mmWidth = 8467
        BandType = 7
      end
      object vPk4Pk6PL: TppVariable
        UserName = 'vPk4Pk6PL'
        CalcOrder = 41
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 41116
        mmTop = 64294
        mmWidth = 12065
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
        CalcOrder = 42
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
        CalcOrder = 43
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
        mmLeft = 105834
        mmTop = 41540
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 41275
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
        mmHeight = 3260
        mmLeft = 57679
        mmTop = 63765
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable9: TppVariable
        UserName = 'vShoPLPct'
        CalcOrder = 44
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
        mmLeft = 104860
        mmTop = 64029
        mmWidth = 11557
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'lblDDPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 15875
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable10: TppVariable
        UserName = 'vDDPLPct'
        CalcOrder = 45
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
        mmLeft = 235575
        mmTop = 16140
        mmWidth = 10753
        BandType = 7
      end
      object ppLabel37: TppLabel
        UserName = 'lblPk3PLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 187061
        mmTop = 41275
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable11: TppVariable
        UserName = 'vPk3PLPct'
        CalcOrder = 46
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
        mmLeft = 234940
        mmTop = 41540
        mmWidth = 11388
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'lblPk4PLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 186796
        mmTop = 64029
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable12: TppVariable
        UserName = 'vPk4PLPct'
        CalcOrder = 47
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
        mmLeft = 234940
        mmTop = 64294
        mmWidth = 11388
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'lblSfcPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 15875
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable13: TppVariable
        UserName = 'vSfcPLPct'
        CalcOrder = 48
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
        mmLeft = 171059
        mmTop = 16140
        mmWidth = 10710
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'lblTriPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 41010
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable14: TppVariable
        UserName = 'vTriPLPct'
        CalcOrder = 49
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
        mmLeft = 171165
        mmTop = 41275
        mmWidth = 10075
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'lblQuiPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 64294
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable15: TppVariable
        UserName = 'vQuiPLPct'
        CalcOrder = 50
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
        mmLeft = 170233
        mmTop = 64558
        mmWidth = 11007
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'lblExaPLPct'
        Caption = 'P/L %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3260
        mmLeft = 121973
        mmTop = 84667
        mmWidth = 6350
        BandType = 7
      end
      object ppVariable16: TppVariable
        UserName = 'vExaPLPct'
        CalcOrder = 51
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
        mmLeft = 169852
        mmTop = 84931
        mmWidth = 11388
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
        mmHeight = 3260
        mmLeft = 2117
        mmTop = 69850
        mmWidth = 9864
        BandType = 7
      end
      object varTotalPL: TppVariable
        UserName = 'vTotalPL'
        CalcOrder = 52
        DataType = dtDouble
        DisplayFormat = '$#,0.00;($#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3302
        mmLeft = 43423
        mmTop = 70115
        mmWidth = 9229
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
        B901000070726F6365647572652046696E6973684E6272734F6E476574546578
        742876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A20
        2054657874203A3D2027273B0D0A20200D0A20206966205472696D28706C5175
        6572795B27537570657266656374614E627273275D29203C3E20272720746865
        6E20626567696E0D0A202020202054657874203A3D2020706C51756572795B27
        537570657266656374614E627273275D3B0D0A2020656E643B0D0A2020200D0A
        20206966205472696D285465787429203D202727207468656E20626567696E0D
        0A20200954657874203A3D2020706C51756572795B2754726966656374614E62
        7273275D3B0D0A2020656E643B0D0A20200D0A20206966205472696D28546578
        7429203D202727207468656E20626567696E0D0A20200954657874203A3D2020
        706C51756572795B274578616374614E627273275D3B0D0A2020656E643B0D0A
        0D0A20206966205472696D285465787429203D202727207468656E2062656769
        6E0D0A20200954657874203A3D2020706C51756572795B275175696E656C6C61
        4E627273275D3B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060A46696E6973684E627273094576656E744E616D
        6506094F6E47657454657874074576656E74494402350001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060B7657696E734F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365068A70726F636564757265207657696E734F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C
        51756572795B2746696E697368506F73275D203D2031207468656E2062656769
        6E0D0A2020202056616C7565203A3D2056616C7565202B20313B0D0A2020656E
        643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057657
        696E73094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650616
        4D6F726E696E674C696E65446573634F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F7572636506D270726F6365647572
        65204D6F726E696E674C696E65446573634F6E5072696E743B0D0A626567696E
        0D0A2020696620706C51756572795B274D6F726E696E674C696E65546F315261
        6E6B275D203D2031207468656E20626567696E0D0A20202020204D6F726E696E
        674C696E65446573632E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E6420656C736520626567696E0D0A20202020204D6F726E696E674C696E65
        446573632E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F4D6F726E696E
        674C696E6544657363094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060D765374617274734F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F7572636506C370726F63656475726520
        765374617274734F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A2020696620706C51756572795B2746696E6973
        68506F73275D203E2030207468656E20626567696E0D0A202020202069662070
        6C51756572795B274F646473275D203E2030207468656E20626567696E0D0A09
        202056616C7565203A3D2056616C7565202B20313B0D0A2020202020656E643B
        0D0A2020656E643B20202020200D0A20200D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060776537461727473094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060B76506C63734F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F75726365068A70726F636564
        7572652076506C63734F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A2020696620706C51756572795B2746696E
        697368506F73275D203D2032207468656E20626567696E0D0A2020202056616C
        7565203A3D2056616C7565202B20313B0D0A2020656E643B0D0A20200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060576506C6373094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65061153686565744F72646572
        4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
        06536F7572636506E770726F6365647572652053686565744F726465724F6E50
        72696E743B0D0A626567696E0D0A0D0A202053686565744F726465722E466F6E
        742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020696620706C
        51756572795B2746696E697368506F73275D203D2031207468656E2062656769
        6E0D0A202020202053686565744F726465722E466F6E742E426F6C64203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A20202020205368
        6565744F726465722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A
        53686565744F72646572094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65061057696E5061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506E570726F636564
        7572652057696E5061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A
        20202057696E5061796F75742E466F6E742E426F6C64203A3D2046616C73653B
        0D0A20202020200D0A202020696620706C51756572795B2746696E697368506F
        73275D203D2031207468656E20626567696E0D0A202020202057696E5061796F
        75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73
        6520626567696E0D0A202020202057696E5061796F75742E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060957696E5061796F7574094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060D7657696E5063744F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650C3401000070726F636564757265207657696E5063744F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A7661720D0A6957696E50
        63743A696E74656765723B0D0A6657696E5063743A646F75626C653B0D0A6265
        67696E20202020202020200D0A0D0A2020206957696E5063743A3D303B0D0A20
        20206657696E5063743A3D303B0D0A2020202020202020202020202020200D0A
        20202069662028765374617274732E4173496E7465676572203E203029207468
        656E20626567696E0D0A2020202020206657696E506374203A3D20287657696E
        732E4173496E746567657220202F20765374617274732E4173496E7465676572
        29202A203130303B0D0A202020656E643B2020200D0A2020200D0A2020205661
        6C7565203A3D206657696E5063743B0D0A2020200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506077657696E506374094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65061076546F74616C4F6464734F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        069F70726F6365647572652076546F74616C4F6464734F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20206966
        20706C51756572795B2746696E697368506F73275D203D2031207468656E2062
        6567696E0D0A2020202056616C7565203A3D2056616C7565202B20706C517565
        72795B274F646473275D3B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060A76546F74616C4F646473094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060E764176674F646473
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F757263650C9601000070726F63656475726520764176674F6464734F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A66
        4176674F6464733A646F75626C653B0D0A665374617274733A646F75626C653B
        0D0A6657696E733A646F75626C653B0D0A0D0A626567696E0D0A202020202020
        20202020202020200D0A202020664176674F6464733A3D303B0D0A2020206653
        74617274733A3D303B0D0A2020206657696E733A3D303B0D0A0D0A2020206653
        7461727473203A3D20765374617274732E4173496E74656765723B2020202020
        2020202020202020200D0A2020206657696E73203A3D207657696E732E417349
        6E74656765723B20202020202020202020202020200D0A2020202020200D0A20
        20206966202866537461727473203E203029207468656E20626567696E0D0A20
        2020202020664176674F646473203A3D202876546F74616C4F6464732E417344
        6F75626C65202F206657696E73293B0D0A202020656E643B2020200D0A202020
        0D0A20202056616C7565203A3D20664176674F6464733B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D650608764176674F646473094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D6506117657696E576167657265
        644F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C0001000070726F636564757265207657696E576167657265
        644F6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661
        720D0A6657696E5761676572416D743A646F75626C653B0D0A626567696E0D0A
        2020200D0A2020200D0A202020696620706C51756572795B274F646473275D20
        3E2030207468656E20626567696E0D0A096657696E5761676572416D74203A3D
        20322E30303B200D0A202020656E6420656C736520626567696E0D0A20202009
        6657696E5761676572416D74203A3D20303B0D0A202020656E643B0D0A0D0A20
        2076616C7565203A3D206657696E5761676572416D74202B2056616C75653B0D
        0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B7657696E
        57616765726564094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060D7657696E576F6E4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C9A01000070726F63656475726520
        7657696E576F6E4F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A207661720D0A664F6464733A20646F75626C653B0D0A665061796F75
        743A646F75626C653B0D0A665761676572416D743A646F75626C653B0D0A0D0A
        626567696E0D0A0D0A202020202020665761676572416D74203A3D2020323B0D
        0A202020202020664F646473203A3D20706C51756572795B274F646473275D3B
        0D0A202020202020665061796F7574203A3D20303B0D0A2020200D0A09696620
        664F646473203E2030207468656E20626567696E0D0A090969662028706C5175
        6572795B2746696E697368506F73275D203D203129207468656E20626567696E
        0D0A090909665061796F7574203A3D2028664F646473202A2066576167657241
        6D7429202B20665761676572416D743B0D0A0909656E643B0D0A090956616C75
        65203A3D2056616C7565202B20665061796F75743B0D0A09656E6420656C7365
        20626567696E0D0A090956616C7565203A3D2056616C75653B0D0A2020200965
        6E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D650607
        7657696E576F6E094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060C7657696E504C4F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C6D01000070726F6365647572652076
        57696E504C4F6E43616C63287661722056616C75653A2056617269616E74293B
        0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C
        576167657265643A646F75626C653B0D0A66546F74616C504C3A646F75626C65
        3B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A2020
        2066546F74616C576167657265643A3D303B0D0A20202066546F74616C504C3A
        3D303B0D0A0D0A20202066546F74616C576F6E203A3D207657696E576F6E2E41
        73446F75626C653B20202020202020202020202020200D0A20202066546F7461
        6C57616765726564203A3D207657696E576167657265642E4173446F75626C65
        3B20202020202020202020202020200D0A20202066546F74616C504C203A3D20
        66546F74616C576F6E202D2066546F74616C576167657265643B20200D0A2020
        200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D6506067657696E504C094576656E744E61
        6D6506064F6E43616C63074576656E74494402210001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65060B7653686F734F6E43616C63
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        068A70726F636564757265207653686F734F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620706C5175
        6572795B2746696E697368506F73275D203D2033207468656E20626567696E0D
        0A2020202056616C7565203A3D2056616C7565202B20313B0D0A2020656E643B
        0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057653686F
        73094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506117645
        7861576167657265644F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C7301000070726F636564757265207645
        7861576167657265644F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A202020696620706C51756572795B274973
        45786152616365275D203D2054727565207468656E20626567696E0D0A202020
        202020696620706C51756572795B2746696E697368506F73275D203E20302074
        68656E20626567696E0D0A202020202020202020696620706C51756572795B27
        4F646473275D203E2030207468656E20626567696E0D0A202020202020202020
        20202069662028706C51756572795B274578616374615061796F7574275D203E
        2030297468656E20626567696E0D0A202020202020200920202056616C756520
        3A3D202056616C7565202B20706C51756572795B274578615761676572416D74
        275D3B0D0A202020202020202020202020656E643B0D0A202020202020202020
        656E643B0D0A202020202020656E643B0D0A202020656E643B2020200D0A200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060B764578615761676572
        6564094576656E744E616D6506064F6E43616C63074576656E74494402210001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061176
        547269576167657265644F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C5B01000070726F6365647572652076
        547269576167657265644F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A696620706C51756572795B2749735472
        6952616365275D203D2054727565207468656E20626567696E0D0A2020696620
        706C51756572795B2746696E697368506F73275D203E2030207468656E206265
        67696E0D0A2020202020696620706C51756572795B274F646473275D203E2030
        207468656E20626567696E0D0A202020202009202069662028706C5175657279
        5B2754726966656374615061796F7574275D203E2030297468656E2062656769
        6E0D0A202020202020202020202020202056616C7565203A3D202056616C7565
        202B20706C51756572795B275472695761676572416D74275D3B0D0A20202020
        20202020656E643B20202020200D0A2020202020656E643B0D0A2020656E643B
        0D0A656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B
        7654726957616765726564094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65061176517569576167657265644F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C570100007072
        6F6365647572652076517569576167657265644F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A696620706C5175
        6572795B27497351756952616365275D203D2054727565207468656E20626567
        696E0D0A202020696620706C51756572795B2746696E697368506F73275D203E
        2030207468656E20626567696E0D0A2020202020696620706C51756572795B27
        4F646473275D203E2030207468656E20626567696E0D0A202020202020202069
        662028706C51756572795B275175696E656C6C615061796F7574275D203E2030
        297468656E20626567696E0D0A09202020202020202056616C7565203A3D2020
        56616C7565202B20706C51756572795B275175695761676572416D74275D3B0D
        0A2020202020202020656E643B0D0A202020202020656E643B0D0A202020656E
        643B0D0A656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060B7651756957616765726564094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65061176536663576167657265644F6E43616C630B50
        726F6772616D54797065070B747450726F63656475726506536F757263650C57
        01000070726F6365647572652076536663576167657265644F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A6966
        20706C51756572795B274973537570657252616365275D203D20547275652074
        68656E20626567696E0D0A2020696620706C51756572795B2746696E69736850
        6F73275D203E2030207468656E20626567696E0D0A2020202020696620706C51
        756572795B274F646473275D203E2030207468656E20626567696E0D0A202020
        20202020202069662028706C51756572795B2753757065726665637461506179
        6F7574275D203E2030297468656E20626567696E0D0A20202020202020202020
        20202056616C756520203A3D202056616C7565202B20706C51756572795B2753
        66635761676572416D74275D3B0D0A092020656E643B20202020200D0A09656E
        643B0D0A2020656E643B0D0A656E643B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060B7653666357616765726564094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65061176506C63576167657265644F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        72636506ED70726F6365647572652076506C63576167657265644F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A7661720D0A66576167
        6572416D743A646F75626C653B0D0A626567696E0D0A2020202020200D0A2020
        696620706C51756572795B274F646473275D203E2030207468656E2062656769
        6E0D0A202009665761676572416D74203A3D20323B0D0A2020656E6420656C73
        6520626567696E0D0A20202009665761676572416D74203A3D20303B0D0A2020
        656E643B0D0A0D0A202056616C7565203A3D20665761676572416D74202B2056
        616C75653B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060B76506C6357616765726564094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060D76506C63576F6E4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C7002000070726F63
        65647572652076506C63576F6E4F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A7661720D0A664F6464733A646F75626C653B0D0A6657
        61676572416D743A646F75626C653B0D0A665061794F75743A646F75626C653B
        0D0A626567696E0D0A202020664F6464733A3D303B0D0A2020200D0A20202069
        66202828706C51756572795B2746696E697368506F73275D203E3D203129616E
        642028706C51756572795B2746696E697368506F73275D203C3D203229292074
        68656E20626567696E0D0A20202009696620706C51756572795B2757696E506C
        635061796F7574275D203E2030207468656E20626567696E0D0A092020202020
        20664F646473203A3D2028706C51756572795B2757696E506C635061796F7574
        275D202D20322E303029202F20323B0D0A202020202020656E643B0D0A202020
        656E643B0D0A2020200D0A202020665761676572416D74203A3D2020323B0D0A
        202020665061796F7574203A3D20303B0D0A2020200D0A202020696620664F64
        6473203E2030207468656E20626567696E0D0A096966202828706C5175657279
        5B2746696E697368506F73275D203E3D20312920616E642028706C5175657279
        5B2746696E697368506F73275D203C3D20322929207468656E20626567696E0D
        0A0909665061796F7574203A3D2028664F646473202A20665761676572416D74
        29202B20665761676572416D743B0D0A09656E643B0D0A0956616C7565203A3D
        2056616C7565202B20665061796F75743B0D0A202020656E6420656C73652062
        6567696E0D0A0956616C7565203A3D2056616C75653B0D0A202020656E643B0D
        0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776506C63
        576F6E094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C
        76506C63504C4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C6D01000070726F6365647572652076506C6350
        4C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661
        720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C57616765
        7265643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A62
        6567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F
        74616C576167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D
        0A0D0A20202066546F74616C576F6E203A3D2076506C63576F6E2E4173446F75
        626C653B20202020202020202020202020200D0A20202066546F74616C576167
        65726564203A3D2076506C63576167657265642E4173446F75626C653B202020
        20202020202020202020200D0A20202066546F74616C504C203A3D2066546F74
        616C576F6E202D2066546F74616C576167657265643B20200D0A2020200D0A20
        202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060676506C63504C094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060C76536663504C4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C6D01
        000070726F6365647572652076536663504C4F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F
        75626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A6654
        6F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F74
        616C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D
        0A20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E
        203A3D2076536663576F6E2E4173446F75626C653B2020202020202020202020
        2020200D0A20202066546F74616C57616765726564203A3D2076536663576167
        657265642E4173446F75626C653B20202020202020202020202020200D0A2020
        2066546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C57
        6167657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F74
        616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060676
        536663504C094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060C76547269504C4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C6D01000070726F63656475726520765472
        69504C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C5761
        67657265643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D
        0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066
        546F74616C576167657265643A3D303B0D0A20202066546F74616C504C3A3D30
        3B0D0A0D0A20202066546F74616C576F6E203A3D2076547269576F6E2E417344
        6F75626C653B20202020202020202020202020200D0A20202066546F74616C57
        616765726564203A3D2076547269576167657265642E4173446F75626C653B20
        202020202020202020202020200D0A20202066546F74616C504C203A3D206654
        6F74616C576F6E202D2066546F74616C576167657265643B20200D0A2020200D
        0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060676547269504C094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D65060C76457861504C4F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        6F01000070726F6365647572652076457861504C4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A
        646F75626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A
        66546F74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A2020206654
        6F74616C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D30
        3B0D0A20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C57
        6F6E203A3D2076457861576F6E2E4173446F75626C653B202020202020202020
        20202020200D0A20202066546F74616C57616765726564203A3D207645786157
        6167657265642E4173446F75626C653B20202020202020202020202020200D0A
        20202066546F74616C504C203A3D2066546F74616C576F6E202D2066546F7461
        6C576167657265643B20200D0A2020200D0A20202056616C7565203A3D206654
        6F74616C504C3B0D0A0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D
        65060676457861504C094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060C76517569504C4F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C6D01000070726F636564757265
        2076517569504C4F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74
        616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F7562
        6C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A
        20202066546F74616C576167657265643A3D303B0D0A20202066546F74616C50
        4C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D2076517569576F6E
        2E4173446F75626C653B20202020202020202020202020200D0A20202066546F
        74616C57616765726564203A3D2076517569576167657265642E4173446F7562
        6C653B20202020202020202020202020200D0A20202066546F74616C504C203A
        3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D0A
        2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060676517569504C094576656E74
        4E616D6506064F6E43616C63074576656E74494402210001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060D76457861576F6E4F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        757263650C6D01000070726F6365647572652076457861576F6E4F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A6966
        20706C51756572795B27497345786152616365275D203D205472756520746865
        6E20626567696E0D0A2020696620706C51756572795B2749734578616374614D
        617463686564275D203D2054727565207468656E20626567696E0D0A20202020
        2069662028706C51756572795B274578616374615761676572275D203D203129
        207468656E20626567696E0D0A202020202020202056616C7565203A3D202056
        616C7565202B202028706C51756572795B274578616374615061796F7574275D
        202A2032293B0D0A2020202020656E6420656C736520626567696E0D0A202020
        202020202056616C7565203A3D202056616C7565202B2020706C51756572795B
        274578616374615061796F7574275D3B0D0A2020202020656E643B0D0A202065
        6E643B20200D0A656E643B2020200D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060776457861576F6E094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060B764444504C4F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F757263650C6E01000070726F636564
        75726520764444504C4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A6654
        6F74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F
        75626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B
        0D0A20202066546F74616C576167657265643A3D303B0D0A20202066546F7461
        6C504C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D20764444576F
        6E2E4173446F75626C653B20202020202020202020202020200D0A2020206654
        6F74616C57616765726564203A3D20764444576167657265642E4173446F7562
        6C653B20202020202020202020202020200D0A20202066546F74616C504C203A
        3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D0A
        2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E
        643B0D0A0D0A0D0A0D436F6D706F6E656E744E616D650605764444504C094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060C764444576F6E
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F757263650C9101000070726F63656475726520764444576F6E4F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A2020202020696620706C51756572795B2749734461696C79446F75626C654D
        6174636865644C61737452616365275D203D2054727565207468656E20626567
        696E0D0A202020202020202069662028706C51756572795B274461696C79446F
        75626C6557616765724C61737452616365275D203D203129207468656E206265
        67696E0D0A202020202020202020202056616C756520203A3D202056616C7565
        202B202028706C51756572795B274461696C79446F75626C655061796F75744C
        61737452616365275D202A2032293B0D0A2020202020202020656E6420656C73
        6520626567696E0D0A202020202020202020202056616C756520203A3D202056
        616C7565202B2020706C51756572795B274461696C79446F75626C655061796F
        75744C61737452616365275D3B0D0A2020202020202020656E643B0D0A202020
        2020656E643B0D0A2020656E643B20200D0A20200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D650606764444576F6E094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D650610764444576167657265644F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        8F01000070726F63656475726520764444576167657265644F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A0969
        6620706C51756572795B274973444452616365275D203D205472756520746865
        6E20626567696E0D0A20202020202009696620706C51756572795B2746696E69
        7368506F73275D203E2030207468656E20626567696E0D0A2020202020202020
        0909696620706C51756572795B274F646473275D203E2030207468656E206265
        67696E0D0A09092020202020200969662028706C51756572795B274461696C79
        446F75626C655061796F75744C61737452616365275D203E2030297468656E20
        626567696E0D0A202020202020202020202020202020202020090956616C7565
        203A3D202056616C7565202B20706C51756572795B2744445761676572416D74
        275D3B0D0A202020202020202020202020202020202020202020202020656E64
        3B0D0A0909202020202020656E643B0D0A0909656E643B0D0A20202020202065
        6E643B202020200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060A76444457616765726564094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060D76517569576F6E4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506F170726F63656475
        72652076517569576F6E4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A2020696620706C51756572795B274973
        51756952616365275D203D2054727565207468656E20626567696E0D0A202020
        2020696620706C51756572795B2749735175696E656C6C614D61746368656427
        5D203D2054727565207468656E20626567696E0D0A202020202020202056616C
        756520203A3D202056616C7565202B2020706C51756572795B275175696E656C
        6C615061796F7574275D3B0D0A2020202020656E643B0D0A2020656E643B0D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776517569576F
        6E094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D7654
        7269576F6E4F6E43616C630B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650C8501000070726F6365647572652076547269576F
        6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A2020696620706C51756572795B27497354726952616365275D203D
        2054727565207468656E20626567696E0D0A2020202020696620706C51756572
        795B27497354726966656374614D617463686564275D203D2054727565207468
        656E20626567696E0D0A2020202020202069662028706C51756572795B275472
        6966656374615761676572275D203D203129207468656E20626567696E0D0A20
        20202020202020202056616C756520203A3D202056616C7565202B202028706C
        51756572795B2754726966656374615061796F7574275D202A2032293B0D0A20
        202020202020656E6420656C736520626567696E0D0A20202020202020202020
        56616C756520203A3D202056616C7565202B2020706C51756572795B27547269
        66656374615061796F7574275D3B0D0A20202020202020656E643B0D0A202020
        20656E643B0D0A2020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060776547269576F6E094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060D76536663576F6E4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C9901000070726F6365
        647572652076536663576F6E4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A2020696620706C51756572795B27
        4973537570657252616365275D203D2054727565207468656E20626567696E0D
        0A2020202020696620706C51756572795B274973537570657266656374614D61
        7463686564275D203D2054727565207468656E20626567696E0D0A2020202020
        20202069662028706C51756572795B2753757065726665637461576167657227
        5D203D203129207468656E20626567696E0D0A20202020202020202020205661
        6C756520203A3D202056616C7565202B202028706C51756572795B2753757065
        7266656374615061796F7574275D202A2032293B0D0A2020202020202020656E
        6420656C736520626567696E0D0A202020202020202020202056616C75652020
        3A3D202056616C7565202B2020706C51756572795B2753757065726665637461
        5061796F7574275D3B0D0A2020202020202020656E643B0D0A2020202020656E
        643B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060776536663576F6E094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D6506117653686F576167657265644F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506ED70726F6365
        64757265207653686F576167657265644F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A665761676572416D743A646F7562
        6C653B0D0A626567696E0D0A2020200D0A202020696620706C51756572795B27
        4F646473275D203E2030207468656E20626567696E0D0A09665761676572416D
        74203A3D20323B0D0A202020656E6420656C736520626567696E0D0A20202009
        665761676572416D74203A3D20303B0D0A202020656E643B0D0A0D0A20205661
        6C7565203A3D20665761676572416D74202B2056616C75653B0D0A2020200D0A
        656E643B0D0A0D0A0D436F6D706F6E656E744E616D65060B7653686F57616765
        726564094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        7653686F576F6E4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C7802000070726F636564757265207653686F
        576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        7661720D0A664F6464733A646F75626C653B0D0A665761676572416D743A646F
        75626C653B0D0A665061794F75743A646F75626C653B0D0A626567696E0D0A20
        2020664F6464733A3D303B0D0A2020200D0A2020206966202828706C51756572
        795B2746696E697368506F73275D203E3D20312920616E642028706C51756572
        795B2746696E697368506F73275D203C3D20332929207468656E20626567696E
        0D0A20202009696620706C51756572795B2757696E53686F5061796F7574275D
        203E2030207468656E20626567696E0D0A09202020202020664F646473203A3D
        2028706C51756572795B2757696E53686F5061796F7574275D202D20322E3030
        29202F20323B0D0A202020202020656E643B0D0A202020656E643B0D0A202020
        0D0A2020200D0A202020665761676572416D74203A3D2020323B0D0A20202066
        5061796F7574203A3D20303B0D0A2020200D0A202020696620664F646473203E
        2030207468656E20626567696E0D0A096966202828706C51756572795B274669
        6E697368506F73275D203E3D20312920616E642028706C51756572795B274669
        6E697368506F73275D203C3D20332929207468656E20626567696E0D0A090966
        5061796F7574203A3D2028664F646473202A20665761676572416D7429202B20
        665761676572416D743B0D0A09656E643B0D0A0956616C7565203A3D2056616C
        7565202B20665061796F75743B0D0A202020656E6420656C736520626567696E
        0D0A0956616C7565203A3D2056616C75653B0D0A202020656E643B0D0A202020
        0D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D6506077653686F576F
        6E094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C7653
        686F504C4F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C6F01000070726F636564757265207653686F504C4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D
        0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265
        643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567
        696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F7461
        6C576167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D
        0A0D0A20202066546F74616C576F6E203A3D207653686F576F6E2E4173446F75
        626C653B20202020202020202020202020200D0A20202066546F74616C576167
        65726564203A3D207653686F576167657265642E4173446F75626C653B202020
        20202020202020202020200D0A20202066546F74616C504C203A3D2066546F74
        616C576F6E202D2066546F74616C576167657265643B20200D0A2020200D0A20
        202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D6506067653686F504C094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060C76575053504C4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068770
        726F6365647572652076575053504C4F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A626567696E0D0A2020200D0A20202056616C7565
        203A3D20207657696E504C2E4173446F75626C65202B2076506C63504C2E4173
        446F75626C65202B207653686F504C2E4173446F75626C653B0D0A2020200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060676575053504C09457665
        6E744E616D6506064F6E43616C63074576656E74494402210001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65061176506B33576167
        657265644F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C6B01000070726F6365647572652076506B33576167
        657265644F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A2020696620706C51756572795B274973506B33526163
        65275D203D2054727565207468656E20626567696E0D0A202020202069662070
        6C51756572795B2746696E697368506F73275D203E2030207468656E20626567
        696E0D0A20202020202020696620706C51756572795B274F646473275D203E20
        30207468656E20626567696E0D0A20202020202020202069662028706C517565
        72795B275069636B335061796F75744C61737452616365275D203E2030297468
        656E20626567696E0D0A202020202020202020202020202020090956616C7565
        203A3D202056616C7565202B20706C51756572795B27506B335761676572416D
        74275D3B0D0A09202020656E643B20202020200D0A0920656E643B0D0A202020
        2020656E643B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F
        6E656E744E616D65060B76506B3357616765726564094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65061176506B34576167657265644F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650C3001000070726F6365647572652076506B34576167657265644F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D
        0A0D0A20202020696620706C51756572795B2746696E697368506F73275D203E
        2030207468656E20626567696E0D0A202020202020696620706C51756572795B
        274F646473275D203E2030207468656E20626567696E0D0A2020202020202020
        69662028706C51756572795B275069636B345061796F75744C61737452616365
        275D203E2030297468656E20626567696E0D0A20202020202020202020202020
        2020090956616C7565203A3D202056616C7565202B20706C51756572795B2750
        6B345761676572416D74275D3B0D0A092020656E643B20202020200D0A09656E
        643B0D0A20202020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060B76506B3457616765726564094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060D76506B34576F6E4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C6201
        000070726F6365647572652076506B34576F6E4F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202020696620
        706C51756572795B2749735069636B344D6174636865644C6173745261636527
        5D203D2054727565207468656E20626567696E0D0A2020202020206966202870
        6C51756572795B275069636B3457616765724C61737452616365275D203D2031
        29207468656E20626567696E0D0A202020202020202056616C756520203A3D20
        2056616C7565202B202028706C51756572795B275069636B345061796F75744C
        61737452616365275D202A2032293B0D0A202020202020656E6420656C736520
        626567696E0D0A202020202020202056616C756520203A3D202056616C756520
        2B2020706C51756572795B275069636B345061796F75744C6173745261636527
        5D3B0D0A202020202020656E643B0D0A20202020656E643B0D0A20200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060776506B34576F6E094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060D76506B33576F6E4F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C9701000070726F6365647572652076506B33576F6E4F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A2020696620706C51756572795B274973506B3352616365275D203D20547275
        65207468656E20626567696E0D0A20202020696620706C51756572795B274973
        5069636B334D6174636865644C61737452616365275D203D2054727565207468
        656E20626567696E0D0A20202020202069662028706C51756572795B27506963
        6B3357616765724C61737452616365275D203D203129207468656E2062656769
        6E0D0A202020202020202056616C756520203A3D202056616C7565202B202028
        706C51756572795B275069636B335061796F75744C61737452616365275D202A
        2032293B0D0A202020202020656E6420656C736520626567696E0D0A20202020
        2020202056616C756520203A3D202056616C7565202B2020706C51756572795B
        275069636B335061796F75744C61737452616365275D3B0D0A20202020202065
        6E643B0D0A20202020656E643B0D0A2020656E643B0D0A20200D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060776506B33576F6E094576656E744E61
        6D6506064F6E43616C63074576656E74494402210001060F5472614576656E74
        48616E646C65720B50726F6772616D4E616D65060C76506B33504C4F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C6F01000070726F6365647572652076506B33504C4F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F
        6E3A646F75626C653B0D0A66546F74616C576167657265643A646F75626C653B
        0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D0A2020206654
        6F74616C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D30
        3B0D0A20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C57
        6F6E203A3D2076506B33576F6E2E4173446F75626C653B202020202020202020
        20202020200D0A20202066546F74616C57616765726564203A3D2076506B3357
        6167657265642E4173446F75626C653B20202020202020202020202020200D0A
        20202066546F74616C504C203A3D2066546F74616C576F6E202D2066546F7461
        6C576167657265643B20200D0A2020200D0A20202056616C7565203A3D206654
        6F74616C504C3B0D0A0D0A656E643B0D0A0D0A0D0A0D436F6D706F6E656E744E
        616D65060676506B33504C094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060C76506B34504C4F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C7101000070726F63656475
        72652076506B34504C4F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A6654
        6F74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F
        75626C653B0D0A626567696E0D0A20202066546F74616C576F6E3A3D303B0D0A
        20202066546F74616C576167657265643A3D303B0D0A20202066546F74616C50
        4C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D2076506B34576F6E
        2E4173446F75626C653B20202020202020202020202020200D0A20202066546F
        74616C57616765726564203A3D2076506B34576167657265642E4173446F7562
        6C653B20202020202020202020202020200D0A20202066546F74616C504C203A
        3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D0A
        2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E
        643B0D0A0D0A0D0A0D0A0D436F6D706F6E656E744E616D65060676506B34504C
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060F765472
        69536663504C4F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F75726365067370726F636564757265207654726953666350
        4C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A0D0A20202056616C7565203A3D2076547269504C2E4173446F7562
        6C65202B2076536663504C2E4173446F75626C653B0D0A0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060976547269536663504C094576656E74
        4E616D6506064F6E43616C63074576656E74494402210001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D65060F76457861517569504C
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F75726365067370726F6365647572652076457861517569504C4F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A20202056616C7565203A3D202076517569504C2E4173446F75626C65202B20
        76457861504C2E4173446F75626C65203B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060976457861517569504C094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060E764444506B33504C4F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F7572636506
        7070726F63656475726520764444506B33504C4F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A626567696E0D0A20200D0A202056616C
        7565203A3D20764444504C2E4173446F75626C65202B2076506B33504C2E4173
        446F75626C653B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        08764444506B33504C094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060F76506B34506B36504C4F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F75726365065E70726F636564757265
        2076506B34506B36504C4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2076506B3450
        4C2E4173446F75626C653B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060976506B34506B36504C094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060E57696E4E6272734F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506DA70726F6365
        647572652057696E4E6272734F6E5072696E743B0D0A626567696E0D0A0D0A20
        2057696E4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        2020200D0A202020696620706C51756572795B2746696E697368506F73275D20
        3D2031207468656E20626567696E0D0A202020202057696E4E6272732E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A202020202057696E4E6272732E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060757696E4E627273094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65061357696E506C635061796F75744F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506F070
        726F6365647572652057696E506C635061796F75744F6E5072696E743B0D0A62
        6567696E0D0A0D0A202057696E506C635061796F75742E466F6E742E426F6C64
        203A3D2046616C73653B0D0A20202020200D0A202020696620706C5175657279
        5B2746696E697368506F73275D203D2031207468656E20626567696E0D0A2020
        20202057696E506C635061796F75742E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E506C
        635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C57
        696E506C635061796F7574094576656E744E616D6506074F6E5072696E740745
        76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061357696E53686F5061796F75744F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506F27072
        6F6365647572652057696E53686F5061796F75744F6E5072696E743B0D0A6265
        67696E0D0A0D0A202057696E53686F5061796F75742E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A20202020200D0A202020696620706C51756572795B
        2746696E697368506F73275D203D2031207468656E20626567696E0D0A202020
        202057696E53686F5061796F75742E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A202020202057696E53686F
        5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C
        57696E53686F5061796F7574094576656E744E616D6506074F6E5072696E7407
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
        4E616D65060E764444504C5063744F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F75726365068370726F63656475726520
        764444504C5063744F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A2020202056616C7565203A3D20436F6D7075
        7465504C5063742028764444576F6E2E4173446F75626C652C76444457616765
        7265642E4173446F75626C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D650608764444504C506374094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060F76506B33504C5063744F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068370
        726F6365647572652076506B33504C5063744F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202056616C7565
        203A3D20436F6D70757465504C506374202876506B33576F6E2E4173446F7562
        6C652C76506B33576167657265642E4173446F75626C65290D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060976506B33504C506374094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060F76506B34504C5063
        744F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F75726365068370726F6365647572652076506B34504C5063744F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A
        0D0A20202056616C7565203A3D20436F6D70757465504C506374202876506B34
        576F6E2E4173446F75626C652C76506B34576167657265642E4173446F75626C
        65290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060976506B34
        504C506374094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F76536663504C5063744F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365068370726F63656475726520765366
        63504C5063744F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A20202056616C7565203A3D20436F6D7075746550
        4C506374202876536663576F6E2E4173446F75626C652C765366635761676572
        65642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060976536663504C506374094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060F76547269504C5063744F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F75726365068370726F
        6365647572652076547269504C5063744F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A20202056616C7565203A
        3D20436F6D70757465504C506374202876547269576F6E2E4173446F75626C65
        2C76547269576167657265642E4173446F75626C65290D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060976547269504C506374094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060F76517569504C5063744F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F75726365068370726F6365647572652076517569504C5063744F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        20202056616C7565203A3D20436F6D70757465504C506374202876517569576F
        6E2E4173446F75626C652C76517569576167657265642E4173446F75626C6529
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060976517569504C
        506374094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        76457861504C5063744F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365068670726F636564757265207645786150
        4C5063744F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A20202056616C7565203A3D20436F6D70757465504C50
        6374202876457861576F6E2E4173446F75626C652C7645786157616765726564
        2E4173446F75626C65290D0A2020200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060976457861504C506374094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060E76546F74616C504C4F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C27010000
        70726F6365647572652076546F74616C504C4F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A20200D0A202056616C75
        65203A3D207657696E504C2E4173446F75626C65202B2076506C63504C2E4173
        446F75626C65202B207653686F504C2E4173446F75626C65202B0D0A20202020
        20202020202020764444504C2E4173446F75626C65202B2076506B33504C2E41
        73446F75626C65202B2076506B34504C2E4173446F75626C65202B0D0A202020
        202020202020202076517569504C2E4173446F75626C65202B2076457861504C
        2E4173446F75626C65202B200D0A202020202020202020202076547269504C2E
        4173446F75626C65202B2076536663504C2E4173446F75626C653B0D0A20200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060876546F74616C504C09
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060E45726C50
        6163654F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C4701000070726F6365647572652045726C50616365
        4F6E5072696E743B0D0A626567696E0D0A0D0A20202020202045726C50616365
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020202045726C50
        6163652E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020
        202020200D0A09696620706C51756572795B274561726C795061636552616E6B
        275D203D2031207468656E20626567696E0D0A0920202045726C506163652E46
        6F6E742E426F6C64203A3D20547275653B0D0A20202020202020202069662070
        6C51756572795B27497346726F6E74446F75626C654C696E6572275D20746865
        6E20626567696E0D0A0920202020202045726C506163652E466F6E742E556E64
        65726C696E65203A3D20547275653B0D0A202020202020202020656E643B200D
        0A202020202020656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060745726C50616365094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506126C626C45726C506F734F6E476574546578740B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C1501
        000070726F636564757265206C626C45726C506F734F6E476574546578742876
        617220546578743A20537472696E67293B0D0A626567696E0D0A205465787420
        3A3D202720273B0D0A20200D0A2020696620706C51756572795B274561726C79
        50616365506F73275D203C3E2039393939207468656E20626567696E0D0A2020
        2020696620706C51756572795B274561726C7950616365506F73275D203C3E20
        30207468656E20626567696E0D0A092020696620706C51756572795B27456172
        6C7950616365506F7352616E6B275D203D2031207468656E20626567696E0D0A
        0909202054657874203A3D20272A273B0D0A092020656E643B0D0A2020202065
        6E643B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506096C626C45726C506F73094576656E744E616D6506094F6E4765
        7454657874074576656E74494402350001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D6506126C626C4D6964506F734F6E4765745465
        78740B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C3201000070726F636564757265206C626C4D6964506F734F6E47657454
        6578742876617220546578743A20537472696E67293B0D0A626567696E0D0A54
        657874203A3D202720273B0D0A0D0A2020696620706C51756572795B274D6964
        646C6550616365506F73275D203C3E2039393939207468656E20626567696E0D
        0A2020202020696620706C51756572795B274D6964646C6550616365506F7327
        5D203C3E2030207468656E20626567696E0D0A2020202020202020696620706C
        51756572795B274D6964646C6550616365506F7352616E6B275D203D20312074
        68656E20626567696E0D0A202020202020202020202054657874203A3D20272A
        273B0D0A2020202020202020656E643B0D0A2020202020656E643B0D0A202065
        6E643B202020202020200D0A0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506096C626C4D6964506F73094576656E744E616D6506094F6E
        47657454657874074576656E74494402350001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D6506136C626C4C617465506F734F6E4765
        74546578740B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C2B01000070726F636564757265206C626C4C617465506F734F6E
        476574546578742876617220546578743A20537472696E67293B0D0A62656769
        6E0D0A0D0A20200D0A202054657874203A3D202720273B0D0A20200D0A202069
        6620706C51756572795B274C61746550616365506F73275D203C3E2039393939
        207468656E20626567696E0D0A2020202020696620706C51756572795B274C61
        746550616365506F73275D203C3E2030207468656E20626567696E0D0A202020
        2020202020696620706C51756572795B274C61746550616365506F7352616E6B
        275D203D2031207468656E20626567696E0D0A2009202020202054657874203A
        3D20272A273B0D0A2020202020202020656E643B0D0A2020202020656E643B0D
        0A2020656E643B0D0A0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060A6C626C4C617465506F73094576656E744E616D6506094F6E476574
        54657874074576656E74494402350001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061364657457696E576167657265644F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        636506AB70726F6365647572652064657457696E576167657265644F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A09
        696620706C51756572795B274F646473275D203E2030207468656E2062656769
        6E0D0A090956616C7565203A3D2056616C7565202B2020322E30303B0D0A0965
        6E6420656C736520626567696E0D0A090956616C7565203A3D2056616C75653B
        0D0A09656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D64
        657457696E57616765726564094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65061264657457696E5061796F75744F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F757263650CA1010000
        70726F6365647572652064657457696E5061796F75744F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A7661720D0A664F6464733A2064
        6F75626C653B0D0A665061796F75743A646F75626C653B0D0A66576167657241
        6D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A202020202020665761
        676572416D74203A3D2020322E30303B0D0A202020202020664F646473203A3D
        20706C51756572795B274F646473275D3B0D0A202020202020665061796F7574
        203A3D20303B0D0A2020200D0A09696620664F646473203E2030207468656E20
        626567696E0D0A090969662028706C51756572795B2746696E697368506F7327
        5D203D203129207468656E20626567696E0D0A090909665061796F7574203A3D
        2028664F646473202A20665761676572416D7429202B20665761676572416D74
        3B0D0A0909656E643B0D0A090956616C7565203A3D2056616C7565202B206650
        61796F75743B0D0A09656E6420656C736520626567696E0D0A090956616C7565
        203A3D2056616C75653B0D0A20202009656E643B0D0A2020200D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060C64657457696E5061796F7574094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D650612646574506C63
        5061796F75744F6E43616C630B50726F6772616D54797065070B747450726F63
        656475726506536F757263650CE101000070726F63656475726520646574506C
        635061796F75744F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A7661720D0A664F6464733A20646F75626C653B0D0A665061796F7574
        3A646F75626C653B0D0A665761676572416D743A646F75626C653B0D0A0D0A62
        6567696E0D0A0D0A202020202020665761676572416D74203A3D2020322E3030
        3B0D0A202020202020664F646473203A3D2028706C51756572795B2757696E50
        6C635061796F7574275D202D20322E303029202F20323B0D0A2020202020200D
        0A202020202020665061796F7574203A3D20303B0D0A2020200D0A0969662066
        4F646473203E2030207468656E20626567696E0D0A09096966202828706C5175
        6572795B2746696E697368506F73275D203E3D20312920616E642028706C5175
        6572795B2746696E697368506F73275D203C3D20322929207468656E20626567
        696E0D0A090909665061796F7574203A3D2028664F646473202A206657616765
        72416D7429202B20665761676572416D743B0D0A0909656E643B0D0A09095661
        6C7565203A3D2056616C7565202B20665061796F75743B0D0A09656E6420656C
        736520626567696E0D0A090956616C7565203A3D2056616C75653B0D0A202020
        09656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060C646574506C635061796F7574094576656E744E616D6506064F6E43616C63
        074576656E74494402210001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061264657453686F5061796F75744F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650CE101
        000070726F6365647572652064657453686F5061796F75744F6E43616C632876
        61722056616C75653A2056617269616E74293B0D0A7661720D0A664F6464733A
        20646F75626C653B0D0A665061796F75743A646F75626C653B0D0A6657616765
        72416D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A20202020202066
        5761676572416D74203A3D2020322E30303B0D0A202020202020664F64647320
        3A3D2028706C51756572795B2757696E53686F5061796F7574275D202D20322E
        303029202F20323B0D0A2020202020200D0A202020202020665061796F757420
        3A3D20303B0D0A2020200D0A09696620664F646473203E2030207468656E2062
        6567696E0D0A09096966202828706C51756572795B2746696E697368506F7327
        5D203E3D20312920616E642028706C51756572795B2746696E697368506F7327
        5D203C3D20332929207468656E20626567696E0D0A090909665061796F757420
        3A3D2028664F646473202A20665761676572416D7429202B2066576167657241
        6D743B0D0A0909656E643B0D0A090956616C7565203A3D2056616C7565202B20
        665061796F75743B0D0A09656E6420656C736520626567696E0D0A090956616C
        7565203A3D2056616C75653B0D0A20202009656E643B0D0A2020200D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060C64657453686F5061796F757409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65061157616765
        72416D744F6E476574546578740B50726F6772616D54797065070B747450726F
        63656475726506536F75726365065470726F636564757265205761676572416D
        744F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A0D0A202054657874203A3D2027322E3030273B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D6506085761676572416D74094576656E
        744E616D6506094F6E47657454657874074576656E74494402350001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D650614506C635761
        676572416D744F6E476574546578740B50726F6772616D54797065070B747450
        726F63656475726506536F75726365065770726F63656475726520506C635761
        676572416D744F6E476574546578742876617220546578743A20537472696E67
        293B0D0A626567696E0D0A0D0A202054657874203A3D2027322E3030273B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B506C635761676572
        416D74094576656E744E616D6506094F6E47657454657874074576656E744944
        02350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061453686F5761676572416D744F6E476574546578740B50726F6772616D54
        797065070B747450726F63656475726506536F75726365065770726F63656475
        72652053686F5761676572416D744F6E47657454657874287661722054657874
        3A20537472696E67293B0D0A626567696E0D0A0D0A202054657874203A3D2027
        322E3030273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B
        53686F5761676572416D74094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65061144657461696C4265666F72655072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C4E1200
        0070726F6365647572652044657461696C4265666F72655072696E743B0D0A62
        6567696E0D0A0D0A2020696620706C51756572795B2746696E697368506F7327
        5D203D2031207468656E20626567696E0D0A2020202020526163654E62722E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020202020486F7273654E616D
        652E466F6E742E426F6C64203A3D20547275653B0D0A20202020200D0A202065
        6E6420656C736520626567696E0D0A2020202020526163654E62722E466F6E74
        2E426F6C64203A3D2046616C73653B0D0A2020202020486F7273654E616D652E
        466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020656E
        643B0D0A20202020696620706C51756572795B274D6F726E696E674C696E6554
        6F3152616E6B275D203D2031207468656E20626567696E0D0A20202020204D6F
        726E696E674C696E65446573632E466F6E742E426F6C64203A3D20547275653B
        0D0A2020656E6420656C736520626567696E0D0A20202020204D6F726E696E67
        4C696E65446573632E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A0D0A0D0A20200D0A20205069636B334E6272734C617374526163
        652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C5175
        6572795B2749735069636B334D6174636865644C61737452616365275D203D20
        54727565207468656E20626567696E0D0A20202020205069636B334E6272734C
        617374526163652E466F6E742E426F6C64203A3D20547275653B0D0A2020656E
        643B0D0A0D0A7B20204461696C79446F75626C655061796F75744C6173745261
        63652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C51
        756572795B2749734461696C79446F75626C654D6174636865644C6173745261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020446169
        6C79446F75626C655061796F75744C617374526163652E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E643B0D0A0D0A2044442E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C51756572795B2749734461
        696C79446F75626C654D6174636865644C61737452616365275D203D20547275
        65207468656E20626567696E0D0A202020202044442E466F6E742E426F6C6420
        3A3D20547275653B0D0A2020656E643B0D0A0D0A7D20202020200D0A20202069
        6620706C51756572795B2746696E697368506F73275D203D2032207468656E20
        626567696E0D0A2020202020506C634E6272732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A202020202050
        6C634E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A20200D0A0D0A202053686F4E6272732E466F6E742E426F6C64203A3D
        2046616C73653B0D0A2020696620706C51756572795B2746696E697368506F73
        275D203D2033207468656E20626567696E0D0A202020202053686F4E6272732E
        466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062
        6567696E0D0A202020202053686F4E6272732E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020656E643B0D0A0D0A202020506C635061796F75742E46
        6F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A2020206966
        20706C51756572795B2746696E697368506F73275D203D2032207468656E2062
        6567696E0D0A2020202020506C635061796F75742E466F6E742E426F6C64203A
        3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020202020
        506C635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A202020506C6353686F5061796F75742E466F6E742E426F
        6C64203A3D2046616C73653B0D0A20202020200D0A202020696620706C517565
        72795B2746696E697368506F73275D203D2032207468656E20626567696E0D0A
        2020202020506C6353686F5061796F75742E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A2020202020506C63
        53686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A202053686F5061796F75742E466F6E742E426F6C64203A
        3D2046616C73653B0D0A20202020200D0A202020696620706C51756572795B27
        46696E697368506F73275D203D2033207468656E20626567696E0D0A20202020
        2053686F5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202053686F5061796F75742E
        466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A09
        4D6964506163652E466F6E742E556E6465726C696E65203A3D2046616C73653B
        0D0A2020202020204D6964506163652E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020202020200D0A09696620706C51756572795B274D6964646C65
        5061636552616E6B275D203D2031207468656E20626567696E0D0A092020204D
        6964506163652E466F6E742E426F6C64203A3D20547275653B0D0A2020202020
        20202020696620706C51756572795B27497346726F6E74446F75626C654C696E
        6572275D207468656E20626567696E0D0A092020202020204D6964506163652E
        466F6E742E556E6465726C696E65203A3D20547275653B0D0A20202020202020
        2020656E643B200D0A202020202020656E643B200D0A0D0A09696620706C5175
        6572795B274D6964646C655061636552616E6B275D203D2031207468656E2062
        6567696E0D0A092020204D6964506163652E466F6E742E426F6C64203A3D2054
        7275653B0D0A202020202020202020696620706C51756572795B274973426163
        6B446F75626C654C696E6572275D207468656E20626567696E0D0A0920202020
        20204D6964506163652E466F6E742E556E6465726C696E65203A3D2054727565
        3B0D0A202020202020202020656E643B200D0A202020202020656E643B200D0A
        0D0A4D6964506163652E466F6E742E556E6465726C696E65203A3D2046616C73
        653B0D0A2020202020204D6964506163652E466F6E742E426F6C64203A3D2046
        616C73653B0D0A2020202020200D0A09696620706C51756572795B274D696464
        6C655061636552616E6B275D203D2031207468656E20626567696E0D0A092020
        204D6964506163652E466F6E742E426F6C64203A3D20547275653B0D0A202020
        202020202020696620706C51756572795B27497346726F6E74446F75626C654C
        696E6572275D207468656E20626567696E0D0A092020202020204D6964506163
        652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A2020202020
        20202020656E643B200D0A202020202020656E643B200D0A0D0A09696620706C
        51756572795B274D6964646C655061636552616E6B275D203D2031207468656E
        20626567696E0D0A092020204D6964506163652E466F6E742E426F6C64203A3D
        20547275653B0D0A202020202020202020696620706C51756572795B27497342
        61636B446F75626C654C696E6572275D207468656E20626567696E0D0A092020
        202020204D6964506163652E466F6E742E556E6465726C696E65203A3D205472
        75653B0D0A202020202020202020656E643B200D0A202020202020656E643B20
        0D0A2020204C617465506163652E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020202020204C617465506163652E466F6E742E556E6465726C696E65
        203A3D2046616C73653B0D0A2020202020200D0A09696620706C51756572795B
        274C6174655061636552616E6B275D203D2031207468656E20626567696E0D0A
        2020200920204C617465506163652E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020202020202020696620706C51756572795B2749734261636B446F75
        626C654C696E6572275D207468656E20626567696E0D0A092020202020204C61
        7465506163652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
        202020202020202020656E643B200D0A202020202020656E643B200D0A0D0A53
        757065722E466F6E742E426F6C64203A3D2046616C73653B0D0A202069662070
        6C51756572795B27497353757065724D617463686564275D203D205472756520
        7468656E20626567696E0D0A202020202053757065722E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E643B0D0A20205472692E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C51756572795B2749735472
        694D617463686564275D203D2054727565207468656E20626567696E0D0A2020
        2020205472692E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A20204578616374612E466F6E742E426F6C64203A3D2046616C73653B0D
        0A2020696620706C51756572795B2749734578614D617463686564275D203D20
        54727565207468656E20626567696E0D0A20202020204578616374612E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20205175696E65
        6C6C612E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C
        51756572795B2749735175694D617463686564275D203D205472756520746865
        6E20626567696E0D0A20202020205175696E656C6C612E466F6E742E426F6C64
        203A3D20547275653B0D0A2020656E643B0D0A0D0A2020537570657266656374
        614E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620
        706C51756572795B274973537570657266656374614D617463686564275D203D
        2054727565207468656E20626567696E0D0A2020202020537570657266656374
        614E6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B
        0D0A202020200D0A2054726966656374614E6272732E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A2020696620706C51756572795B2749735472696665
        6374614D617463686564275D203D2054727565207468656E20626567696E0D0A
        202020202054726966656374614E6272732E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E643B0D0A202020200D0A0D0A20204578616374614E62
        72732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C51
        756572795B2749734578616374614D617463686564275D203D20547275652074
        68656E20626567696E0D0A20202020204578616374614E6272732E466F6E742E
        426F6C64203A3D20547275653B0D0A2020656E643B0D0A202020200D0A0D0A20
        205175696E656C6C614E6272732E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A2020696620706C51756572795B2749735175696E656C6C614D61746368
        6564275D203D2054727565207468656E20626567696E0D0A2020202020517569
        6E656C6C614E6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E643B0D0A202020200D0A0D0A20200D0A0D0A0D0A20205069636B334C6173
        74526163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620
        706C51756572795B2749735069636B334D6174636865644C6173745261636527
        5D203D2054727565207468656E20626567696E0D0A20202020205069636B334C
        617374526163652E466F6E742E426F6C64203A3D20547275653B0D0A2020656E
        643B0D0A0D0A205069636B334E6272734C617374526163652E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020696620706C51756572795B2749735069
        636B334D6174636865644C61737452616365275D203D2054727565207468656E
        20626567696E0D0A20202020205069636B334E6272734C617374526163652E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A0D
        0A205069636B344C617374526163652E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020696620706C51756572795B2749735069636B344D6174636865
        644C61737452616365275D203D2054727565207468656E20626567696E0D0A20
        202020205069636B344C617374526163652E466F6E742E426F6C64203A3D2054
        7275653B0D0A2020656E643B0D0A0D0A20205069636B344E6272734C61737452
        6163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C
        51756572795B2749735069636B344D6174636865644C61737452616365275D20
        3D2054727565207468656E20626567696E0D0A20202020205069636B344E6272
        734C617374526163652E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E643B0D0A2020506C634E6272732E466F6E742E426F6C64203A3D2046616C
        73653B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060644
        657461696C094576656E744E616D65060B4265666F72655072696E7407457665
        6E74494402180001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061344445761676572416D744F6E476574546578740B50726F6772
        616D54797065070B747450726F63656475726506536F75726365065570726F63
        65647572652044445761676572416D744F6E4765745465787428766172205465
        78743A20537472696E67293B0D0A626567696E0D0A2054657874203A3D202732
        2E3030273B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A44445761676572416D74094576656E744E616D6506094F6E47657454657874
        074576656E74494402350000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object plQuery: TppDBPipeline
    DataSource = dsAll
    CloseDataSource = True
    UserName = 'plQuery'
    Left = 742
    Top = 10
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 105
        FloatTop = 165
        FloatClientWidth = 0
        FloatClientHeight = 0
        IsMainMenu = True
        ItemLinks = <
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end
          item
            Item = btnNewSQL
            Visible = True
          end
          item
            Item = btnSaveSQL
            Visible = True
          end
          item
            Item = btnDeleteSQL
            Visible = True
          end
          item
            Item = btnExecuteSQL
            Visible = True
          end>
        MultiLine = True
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
      end>
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    LargeIcons = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 408
    Top = 248
    DockControlHeights = (
      0
      0
      42
      0)
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = cxDBExtLookupComboBox1
    end
    object btnSaveSQL: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnNewSQL: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnDeleteSQL: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object btnExecuteSQL: TdxBarButton
      Caption = 'Execute '
      Category = 0
      Description = 'Execute SQL'
      Hint = 'Execute '
      Visible = ivAlways
      PaintStyle = psCaptionInMenu
    end
  end
  object tblSQLQuery: TDBISAMTable
    Active = True
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbQuery'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'SQLQuery'
    Left = 416
    Top = 344
  end
  object dsSQLQuery: TDataSource
    DataSet = tblSQLQuery
    Left = 376
    Top = 320
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
    end
  end
end
