object LinerResultsReportForm: TLinerResultsReportForm
  Left = 313
  Top = 216
  Width = 568
  Height = 356
  Caption = 'Liner Wager Results Report'
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
  object dbLinerWagerResultsReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbLinerWagerResultsReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    BeforeConnect = dbLinerWagerResultsReportBeforeConnect
    Left = 424
    Top = 120
  end
  object tblPrevDayHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'IsLinerSheetSelected=True and IsYouBetTrack =True'
    Filtered = True
    OnNewRecord = tblPrevDayHHNewRecord
    DatabaseName = 'dbLinerWagerResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByEstTimeOfRace'
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
  end
  object ppWagerResultsReport: TppReport
    AutoStop = False
    DataPipeline = plPrevDayHH
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 215900
    PrinterSetup.mmPaperWidth = 279401
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\Ratings31\LinerResults.rtm'
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
        Caption = 'Liner'
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
      mmHeight = 20638
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 20638
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
        mmHeight = 3302
        mmLeft = 43730
        mmTop = 0
        mmWidth = 10245
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
        mmHeight = 2498
        mmLeft = 32936
        mmTop = 0
        mmWidth = 13631
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
        mmTop = 3440
        mmWidth = 10319
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
        mmTop = 3440
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
        Visible = False
        DataPipelineName = 'plPrevDayRH'
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 3440
        mmWidth = 17198
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2646
        mmLeft = 254001
        mmTop = 3440
        mmWidth = 12171
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 20638
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
        mmHeight = 20638
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
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 143934
        mmTop = 3440
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 244475
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 219340
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 197380
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2667
        mmLeft = 184680
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 172509
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 158750
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
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
        mmHeight = 20638
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
        mmHeight = 20638
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
        DataField = 'Pick3PayoutFirstRace'
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
        mmTop = 3440
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
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object dbPick3: TppDBText
        UserName = 'Pick3'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3FirstRace'
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
        mmLeft = 229161
        mmTop = 11906
        mmWidth = 13547
        BandType = 4
      end
      object dbPick4: TppDBText
        UserName = 'Pick4'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4FirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2498
        mmLeft = 254403
        mmTop = 12171
        mmWidth = 11769
        BandType = 4
      end
      object dbDailyDoubleNbrs: TppDBText
        UserName = 'DailyDoubleNbrs'
        BlankWhenZero = True
        DataField = 'DailyDoubleNbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 7408
        mmWidth = 17198
        BandType = 4
      end
      object dbPick3Nbrs: TppDBText
        UserName = 'Pick3Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick3NbrsFirstRace'
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
        mmLeft = 224844
        mmTop = 7408
        mmWidth = 17780
        BandType = 4
      end
      object dbPick4Nbrs: TppDBText
        UserName = 'Pick4Nbrs'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Pick4NbrsFirstRace'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2498
        mmLeft = 250677
        mmTop = 7408
        mmWidth = 15494
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
      object Pace: TppDBText
        UserName = 'ErlPace'
        ShiftWithParent = True
        DataField = 'EarlyPace'
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
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
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
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
        DataPipeline = plPrevDayHH
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
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
        mmHeight = 2498
        mmLeft = 38090
        mmTop = 7938
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
        mmLeft = 48419
        mmTop = 6350
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
        mmTop = 8996
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
        mmTop = 11642
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
        mmTop = 14552
        mmWidth = 10848
        BandType = 4
      end
      object Super: TppDBText
        UserName = 'Super'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Super'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 151035
        mmTop = 12171
        mmWidth = 5334
        BandType = 4
      end
      object Tri: TppDBText
        UserName = 'Tri'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Tri'
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
        mmLeft = 168286
        mmTop = 12171
        mmWidth = 2371
        BandType = 4
      end
      object Exacta: TppDBText
        UserName = 'Exacta'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Exacta'
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
        mmLeft = 176690
        mmTop = 12171
        mmWidth = 6138
        BandType = 4
      end
      object Quinella: TppDBText
        UserName = 'Quinella'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'Quinella'
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
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
        DataPipeline = plPrevDayRH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'plPrevDayRH'
        mmHeight = 2879
        mmLeft = 142484
        mmTop = 7408
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
        mmLeft = 159734
        mmTop = 7408
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
        mmTop = 7408
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
        Visible = False
        DataPipelineName = 'plPrevDayRH'
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
      object TriWagerAmt: TppDBText
        UserName = 'TriWagerAmt'
        BlankWhenZero = True
        DataField = 'TriWagerAmt'
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
        mmLeft = 163248
        mmTop = 265
        mmWidth = 7938
        BandType = 4
      end
      object QuiWagerAmt: TppDBText
        UserName = 'QuiWagerAmt'
        BlankWhenZero = True
        DataField = 'QuiWagerAmt'
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
        mmHeight = 2498
        mmLeft = 35677
        mmTop = 10583
        mmWidth = 10626
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
        mmHeight = 2498
        mmLeft = 35000
        mmTop = 13494
        mmWidth = 11303
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
        mmHeight = 2836
        mmLeft = 55732
        mmTop = 265
        mmWidth = 5122
        BandType = 4
      end
      object StartsWorks21: TppDBText
        UserName = 'StartsWorks21'
        ShiftWithParent = True
        DataField = 'StartsWorks21'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 15610
        mmWidth = 4233
        BandType = 4
      end
      object NbrWorksLast: TppDBText
        UserName = 'NbrWorksLast'
        ShiftWithParent = True
        DataField = 'NbrWorksLast'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2910
        mmLeft = 6350
        mmTop = 15610
        mmWidth = 4233
        BandType = 4
      end
      object LinerWinPctByTrk: TppDBText
        UserName = 'LinerWinPctByTrk'
        ShiftWithParent = True
        DataField = 'AngleDesc'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold]
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2910
        mmLeft = 48154
        mmTop = 17198
        mmWidth = 94192
        BandType = 4
      end
      object KSP1stCall: TppDBText
        UserName = 'KSP1stCall'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'KSP1stCall'
        DataPipeline = plPrevDayHH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2879
        mmLeft = 19961
        mmTop = 10848
        mmWidth = 10202
        BandType = 4
      end
      object varEPS: TppVariable
        UserName = 'varEPS'
        CalcOrder = 4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        mmHeight = 2910
        mmLeft = 20108
        mmTop = 10848
        mmWidth = 3440
        BandType = 4
      end
      object DaysLast: TppDBText
        UserName = 'DaysLast'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'DaysLast'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2836
        mmLeft = 0
        mmTop = 12171
        mmWidth = 8848
        BandType = 4
      end
      object DaysLastWork: TppDBText
        UserName = 'DaysLastWork'
        ShiftWithParent = True
        AutoSize = True
        DataField = 'DaysLastWork'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2498
        mmLeft = 0
        mmTop = 12171
        mmWidth = 11430
        BandType = 4
      end
      object TrnWinsRank: TppDBText
        UserName = 'TrnWinsRank'
        ShiftWithParent = True
        BlankWhenZero = True
        DataField = 'TrnWinsRank'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2117
        mmLeft = 13229
        mmTop = 16140
        mmWidth = 3175
        BandType = 4
      end
      object TrnTrackRank: TppDBText
        UserName = 'TrnTrackRank'
        ShiftWithParent = True
        BlankWhenZero = True
        DataField = 'TrnTrackRank'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2117
        mmLeft = 17727
        mmTop = 16140
        mmWidth = 3175
        BandType = 4
      end
      object TrnEarningsRank: TppDBText
        UserName = 'TrnEarningsRank'
        ShiftWithParent = True
        BlankWhenZero = True
        DataField = 'TrnEarningsRank'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2117
        mmLeft = 22225
        mmTop = 16140
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'TrnEarningsRank1'
        ShiftWithParent = True
        BlankWhenZero = True
        DataField = 'TodaysWagerLineTo1Fair'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2117
        mmLeft = 49213
        mmTop = 3969
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        ShiftWithParent = True
        BlankWhenZero = True
        DataField = 'EstMorningLineTo1Fair'
        DataPipeline = plPrevDayHH
        DisplayFormat = '###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 5
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPrevDayHH'
        mmHeight = 2117
        mmLeft = 57679
        mmTop = 3969
        mmWidth = 3175
        BandType = 4
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 23548
        mmLeft = 122502
        mmTop = 10054
        mmWidth = 48948
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 23548
        mmLeft = 121709
        mmTop = 10319
        mmWidth = 48948
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        6F6772616D4E616D6506135069636B3457616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506F1
        70726F636564757265205069636B3457616765724F6E47657454657874287661
        7220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617952485B275069636B345761676572466972737452616365
        275D203D2031207468656E20626567696E0D0A2020202054657874203A3D2027
        2431273B0D0A2020656E643B20200D0A2020696620706C507265764461795248
        5B275069636B345761676572466972737452616365275D203D2032207468656E
        20626567696E0D0A2020202054657874203A3D20272432273B0D0A2020656E64
        3B20200D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0A5069636B345761676572094576656E744E616D6506094F6E47657454657874
        074576656E74494402350001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506135069636B3357616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506EF
        70726F636564757265205069636B3357616765724F6E47657454657874287661
        7220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020696620
        706C5072657644617952485B275069636B335761676572466972737452616365
        275D203D2031207468656E20626567696E0D0A2020202054657874203A3D2027
        2431273B0D0A2020656E643B20200D0A2020696620706C507265764461795248
        5B275069636B335761676572466972737452616365275D203D2032207468656E
        20626567696E0D0A2020202054657874203A3D20272432273B0D0A2020656E64
        3B20200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A50
        69636B335761676572094576656E744E616D6506094F6E476574546578740745
        76656E74494402350001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D6506194461696C79446F75626C6557616765724F6E4765745465
        78740B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C0101000070726F636564757265204461696C79446F75626C6557616765
        724F6E476574546578742876617220546578743A20537472696E67293B0D0A62
        6567696E0D0A0D0A2020696620706C5072657644617952485B274461696C7944
        6F75626C655761676572466972737452616365275D203D2031207468656E2062
        6567696E0D0A2020202054657874203A3D20272431273B0D0A2020656E643B20
        200D0A2020696620706C5072657644617952485B274461696C79446F75626C65
        5761676572466972737452616365275D203D2032207468656E20626567696E0D
        0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506104461696C79446F75
        626C655761676572094576656E744E616D6506094F6E47657454657874074576
        656E74494402350001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D6506165175696E656C6C6157616765724F6E476574546578740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506E6
        70726F636564757265205175696E656C6C6157616765724F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020
        696620706C5072657644617952485B275175696E656C6C615761676572275D20
        3D2031207468656E20626567696E0D0A2020202054657874203A3D2027243127
        3B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B2751
        75696E656C6C615761676572275D203D2032207468656E20626567696E0D0A20
        20202054657874203A3D20272432273B0D0A2020656E643B20200D0A20200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E656C6C615761
        676572094576656E744E616D6506094F6E47657454657874074576656E744944
        02350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061445786163746157616765724F6E476574546578740B50726F6772616D54
        797065070B747450726F63656475726506536F757263650C1001000070726F63
        65647572652045786163746157616765724F6E47657454657874287661722054
        6578743A20537472696E67293B0D0A626567696E0D0A20202020202020202020
        2020202020202020202020202020202020202020202020202020202020202020
        2020202020200D0A2020696620706C5072657644617952485B27457861637461
        5761676572275D203D2031207468656E20626567696E0D0A2020202054657874
        203A3D20272431273B0D0A2020656E643B20200D0A2020696620706C50726576
        44617952485B274578616374615761676572275D203D2032207468656E206265
        67696E0D0A2020202054657874203A3D20272432273B0D0A2020656E643B2020
        0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B45786163
        74615761676572094576656E744E616D6506094F6E4765745465787407457665
        6E74494402350001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D650616547269666563746157616765724F6E476574546578740B5072
        6F6772616D54797065070B747450726F63656475726506536F7572636506E670
        726F63656475726520547269666563746157616765724F6E4765745465787428
        76617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B2754726966656374615761676572275D203D
        2031207468656E20626567696E0D0A2020202054657874203A3D20272431273B
        0D0A2020656E643B20200D0A2020696620706C5072657644617952485B275472
        6966656374615761676572275D203D2032207468656E20626567696E0D0A2020
        202054657874203A3D20272432273B0D0A2020656E643B20200D0A20200D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060D5472696665637461576167
        6572094576656E744E616D6506094F6E47657454657874074576656E74494402
        350001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        06185375706572666563746157616765724F6E476574546578740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506EC70726F63
        6564757265205375706572666563746157616765724F6E476574546578742876
        617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A20206966
        20706C5072657644617952485B27537570657266656374615761676572275D20
        3D2031207468656E20626567696E0D0A2020202054657874203A3D2027243127
        3B0D0A2020656E643B20200D0A2020696620706C5072657644617952485B2753
        7570657266656374615761676572275D203D2032207468656E20626567696E0D
        0A2020202054657874203A3D20272432273B0D0A2020656E643B20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F5375706572666563
        74615761676572094576656E744E616D6506094F6E4765745465787407457665
        6E74494402350001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061046696E697368506F734F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506BF70726F63656475
        72652046696E697368506F734F6E5072696E743B0D0A626567696E0D0A0D0A20
        20696620706C5072657644617948485B2746696E697368506F73275D203D2031
        207468656E20626567696E0D0A202020202046696E697368506F732E466F6E74
        2E426F6C64203A3D20547275653B0D0A2020656E6420656C736520626567696E
        0D0A202020202046696E697368506F732E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060946696E697368506F73094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060B7657696E734F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F75726365068E70726F63
        6564757265207657696E734F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A0D0A2020696620706C5072657644617948
        485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A20
        20202056616C7565203A3D2056616C7565202B20313B0D0A2020656E643B0D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057657696E7309
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060E54726B43
        6F64654F6E5072696E740B50726F6772616D54797065070B747450726F636564
        75726506536F7572636506B770726F6365647572652054726B436F64654F6E50
        72696E743B0D0A626567696E0D0A0D0A2020696620706C507265764461794848
        5B2746696E697368506F73275D203D2031207468656E20626567696E0D0A2020
        20202054726B436F64652E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202054726B436F64652E466F
        6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060754726B436F6465094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65061150726F6772616D4E
        62724F6E5072696E740B50726F6772616D54797065070B747450726F63656475
        726506536F7572636506BC70726F6365647572652050726F6772616D4E62724F
        6E5072696E743B0D0A626567696E0D0A696620706C5072657644617948485B27
        46696E697368506F73275D203D2031207468656E20626567696E0D0A20202020
        2050726F6772616D4E62722E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E6420656C736520626567696E0D0A202020202050726F6772616D4E62
        722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060A50726F6772616D4E62
        72094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061048
        6F7273654E616D654F6E5072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F7572636506BD70726F63656475726520486F727365
        4E616D654F6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C5072
        657644617948485B2746696E697368506F73275D203D2031207468656E206265
        67696E0D0A2020202020486F7273654E616D652E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A202020202048
        6F7273654E616D652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609486F
        7273654E616D65094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060E526163654E62724F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506B770726F6365647572652052
        6163654E62724F6E5072696E743B0D0A626567696E0D0A0D0A2020696620706C
        5072657644617948485B2746696E697368506F73275D203D2031207468656E20
        626567696E0D0A2020202020526163654E62722E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A202020202052
        6163654E62722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E
        643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060752616365
        4E6272094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        164D6F726E696E674C696E65446573634F6E5072696E740B50726F6772616D54
        797065070B747450726F63656475726506536F7572636506D670726F63656475
        7265204D6F726E696E674C696E65446573634F6E5072696E743B0D0A62656769
        6E0D0A2020696620706C5072657644617948485B274D6F726E696E674C696E65
        546F3152616E6B275D203D2031207468656E20626567696E0D0A20202020204D
        6F726E696E674C696E65446573632E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E6420656C736520626567696E0D0A20202020204D6F726E696E
        674C696E65446573632E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F4D
        6F726E696E674C696E6544657363094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060D765374617274734F6E43616C630B50726F677261
        6D54797065070B747450726F63656475726506536F7572636506CB70726F6365
        6475726520765374617274734F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A2020696620706C50726576446179
        48485B2746696E697368506F73275D203E2030207468656E20626567696E0D0A
        2020202020696620706C5072657644617948485B274F646473275D203E203020
        7468656E20626567696E0D0A09202056616C7565203A3D2056616C7565202B20
        313B0D0A2020202020656E643B0D0A2020656E643B20202020200D0A20200D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060776537461727473094576
        656E744E616D6506064F6E43616C63074576656E74494402210001060F547261
        4576656E7448616E646C65720B50726F6772616D4E616D65060B76506C63734F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F75726365068E70726F6365647572652076506C63734F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20206966
        20706C5072657644617948485B2746696E697368506F73275D203D2032207468
        656E20626567696E0D0A2020202056616C7565203A3D2056616C7565202B2031
        3B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060576506C6373094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061146696E6973684E6272734F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F7572636506B170726F636564
        7572652046696E6973684E6272734F6E5072696E743B0D0A626567696E0D0A0D
        0A202046696E6973684E6272732E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A0D0A2020696620706C5072657644617948485B2746696E697368506F73
        275D203D2031207468656E20626567696E0D0A2020202020202046696E697368
        4E6272732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D
        0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A46696E6973
        684E627273094576656E744E616D6506074F6E5072696E74074576656E744944
        02200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65061554726966656374615061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C5A01000070726F
        6365647572652054726966656374615061796F75744F6E5072696E743B0D0A62
        6567696E0D0A0D0A2054726966656374615061796F75742E466F6E742E426F6C
        64203A3D2046616C73653B0D0A20696620706C5072657644617952485B274973
        54726966656374614D617463686564275D203D2054727565207468656E206265
        67696E0D0A2020202054726966656374615061796F75742E466F6E742E426F6C
        64203A3D20547275653B0D0A20656E643B0D0A2020696620706C507265764461
        7952485B27497354726952616365275D203D2054727565207468656E20626567
        696E0D0A2020202020202054726966656374615061796F75742E56697369626C
        65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        202020202054726966656374615061796F75742E56697369626C65203A3D2046
        616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D65060E54726966656374615061796F7574094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D6506155175696E656C6C615061796F75
        744F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C5E01000070726F636564757265205175696E656C6C6150
        61796F75744F6E5072696E743B0D0A626567696E0D0A0D0A20205175696E656C
        6C615061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        696620706C5072657644617952485B2749735175696E656C6C614D6174636865
        64275D203D2054727565207468656E20626567696E0D0A20202020205175696E
        656C6C615061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E643B0D0A2020696620706C5072657644617952485B2749735175695261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020202051
        75696E656C6C615061796F75742E56697369626C65203A3D20547275653B0D0A
        2020656E6420656C736520626567696E0D0A202020202020205175696E656C6C
        615061796F75742E56697369626C65203A3D2046616C73653B0D0A2020656E64
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060E5175696E65
        6C6C615061796F7574094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D650617537570657266656374615061796F75744F6E5072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F757263650CA5
        01000070726F63656475726520537570657266656374615061796F75744F6E50
        72696E743B0D0A626567696E0D0A0D0A2020537570657266656374615061796F
        75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C50
        72657644617952485B274973537570657266656374614D617463686564275D20
        3D2054727565207468656E20626567696E0D0A20202020205375706572666563
        74615061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A20200D0A20206966202828706C5072657644617952485B27497353
        7570657252616365275D203D20547275652920616E642028706C507265764461
        7952485B27537570657266656374615761676572416D74275D203E2030292974
        68656E20626567696E0D0A20202020202020537570657266656374615061796F
        75742E56697369626C65203A3D20547275653B0D0A2020656E6420656C736520
        626567696E0D0A20202020202020537570657266656374615061796F75742E56
        697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A2020
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506105375706572666563
        74615061796F7574094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D6506125069636B345061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C5501000070726F
        636564757265205069636B345061796F75744F6E5072696E743B0D0A62656769
        6E0D0A0D0A20205069636B345061796F75742E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020696620706C5072657644617952485B2749735069636B
        344D617463686564466972737452616365275D203D2054727565207468656E20
        626567696E0D0A20202020205069636B345061796F75742E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E643B0D0A2020696620706C5072657644
        617952485B274973506B3452616365275D203D2054727565207468656E206265
        67696E0D0A202020202020205069636B345061796F75742E56697369626C6520
        3A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A20202020
        2020205069636B345061796F75742E56697369626C65203A3D2046616C73653B
        0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        060B5069636B345061796F7574094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506214461696C79446F75626C655061796F757446697273
        74526163654F6E5072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F757263650CB601000070726F636564757265204461696C79
        446F75626C655061796F75744669727374526163654F6E5072696E743B0D0A62
        6567696E0D0A0D0A2020204461696C79446F75626C655061796F757446697273
        74526163652E466F6E742E426F6C64203A3D2046616C73653B0D0A2020206966
        20706C5072657644617952485B2749734461696C79446F75626C654D61746368
        6564466972737452616365275D203D2054727565207468656E20626567696E0D
        0A2020202020204461696C79446F75626C655061796F75744669727374526163
        652E466F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A20
        20200D0A202020696620706C5072657644617952485B27497344445261636527
        5D203D2054727565207468656E20626567696E0D0A202020202020204461696C
        79446F75626C655061796F75744669727374526163652E56697369626C65203A
        3D20547275653B0D0A202020656E6420656C736520626567696E0D0A20202020
        2020204461696C79446F75626C655061796F75744669727374526163652E5669
        7369626C65203A3D2046616C73653B0D0A202020656E643B0D0A20202020200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65061A4461696C79446F7562
        6C655061796F7574466972737452616365094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061153686565744F726465724F6E5072696E74
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06EB70726F6365647572652053686565744F726465724F6E5072696E743B0D0A
        626567696E0D0A0D0A202053686565744F726465722E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A20202020200D0A2020696620706C50726576446179
        48485B2746696E697368506F73275D203D2031207468656E20626567696E0D0A
        202020202053686565744F726465722E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A20202020205368656574
        4F726465722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E64
        3B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A536865
        65744F72646572094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65061057696E5061796F75744F6E5072696E740B50726F6772616D547970
        65070B747450726F63656475726506536F7572636506E970726F636564757265
        2057696E5061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A202020
        57696E5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        202020200D0A202020696620706C5072657644617948485B2746696E69736850
        6F73275D203D2031207468656E20626567696E0D0A202020202057696E506179
        6F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202057696E5061796F75742E466F6E742E426F
        6C64203A3D2046616C73653B0D0A2020656E643B0D0A20200D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060957696E5061796F7574094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D6506115069636B3457616765
        724F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C5201000070726F636564757265205069636B3457616765
        724F6E5072696E743B0D0A626567696E0D0A0D0A20205069636B345761676572
        2E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C507265
        7644617952485B2749735069636B344D61746368656446697273745261636527
        5D203D2054727565207468656E20626567696E0D0A20202020205069636B3457
        616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D
        0A2020696620706C5072657644617952485B274973506B3452616365275D203D
        2054727565207468656E20626567696E0D0A202020202020205069636B345761
        6765722E56697369626C65203A3D20547275653B0D0A2020656E6420656C7365
        20626567696E0D0A202020202020205069636B3457616765722E56697369626C
        65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060A5069636B345761676572094576656E744E
        616D6506074F6E5072696E74074576656E74494402200001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D6506115069636B3357616765
        724F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C5401000070726F636564757265205069636B3357616765
        724F6E5072696E743B0D0A626567696E0D0A20200D0A20205069636B33576167
        65722E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C50
        72657644617952485B2749735069636B334D6174636865644669727374526163
        65275D203D2054727565207468656E20626567696E0D0A20202020205069636B
        3357616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A2020696620706C5072657644617952485B274973506B3352616365275D
        203D2054727565207468656E20626567696E0D0A202020202020205069636B33
        57616765722E56697369626C65203A3D20547275653B0D0A2020656E6420656C
        736520626567696E0D0A202020202020205069636B3357616765722E56697369
        626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060A5069636B335761676572094576656E
        744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D6506174461696C79446F
        75626C6557616765724F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F757263650C7E01000070726F6365647572652044
        61696C79446F75626C6557616765724F6E5072696E743B0D0A626567696E0D0A
        0D0A20204461696C79446F75626C6557616765722E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749734461
        696C79446F75626C654D617463686564466972737452616365275D203D205472
        7565207468656E20626567696E0D0A20202020204461696C79446F75626C6557
        616765722E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D
        0A20200D0A2020696620706C5072657644617952485B27497344445261636527
        5D203D2054727565207468656E20626567696E0D0A202020202020204461696C
        79446F75626C6557616765722E56697369626C65203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202020204461696C79446F75
        626C6557616765722E56697369626C65203A3D2046616C73653B0D0A2020656E
        643B0D0A2020200D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D
        6506104461696C79446F75626C655761676572094576656E744E616D6506074F
        6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D6506145175696E656C6C6157616765724F6E
        5072696E740B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C5F01000070726F636564757265205175696E656C6C6157616765
        724F6E5072696E743B0D0A626567696E0D0A0D0A20205175696E656C6C615761
        6765722E466F6E742E426F6C64203A3D2046616C73653B0D0A20200D0A202069
        6620706C5072657644617952485B2749735175696E656C6C614D617463686564
        275D203D2054727565207468656E20626567696E0D0A20202020205175696E65
        6C6C6157616765722E466F6E742E426F6C64203A3D20547275653B0D0A202065
        6E643B0D0A2020696620706C5072657644617952485B27497351756952616365
        275D203D2054727565207468656E20626567696E0D0A20202020202020517569
        6E656C6C6157616765722E56697369626C65203A3D20547275653B0D0A202065
        6E6420656C736520626567696E0D0A202020202020205175696E656C6C615761
        6765722E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D5175696E656C6C
        615761676572094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65061245786163746157616765724F6E5072696E740B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C5301000070726F6365
        647572652045786163746157616765724F6E5072696E743B0D0A626567696E0D
        0A200D0A202045786163746157616765722E466F6E742E426F6C64203A3D2046
        616C73653B0D0A2020696620706C5072657644617952485B2749734578616374
        614D617463686564275D203D2054727565207468656E20626567696E0D0A2020
        2020202045786163746157616765722E466F6E742E426F6C64203A3D20547275
        653B0D0A2020656E643B0D0A20202020696620706C5072657644617952485B27
        497345786152616365275D203D2054727565207468656E20626567696E0D0A20
        20202020202045786163746157616765722E56697369626C65203A3D20547275
        653B0D0A2020656E6420656C736520626567696E0D0A20202020202020457861
        63746157616765722E56697369626C65203A3D2046616C73653B0D0A2020656E
        643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B4578
        616374615761676572094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D650614547269666563746157616765724F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C5B010000
        70726F63656475726520547269666563746157616765724F6E5072696E743B0D
        0A626567696E0D0A0D0A2020547269666563746157616765722E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B
        27497354726966656374614D617463686564275D203D2054727565207468656E
        20626567696E0D0A2020202020547269666563746157616765722E466F6E742E
        426F6C64203A3D20547275653B0D0A2020656E643B0D0A2020696620706C5072
        657644617952485B27497354726952616365275D203D2054727565207468656E
        20626567696E0D0A20202020202020547269666563746157616765722E566973
        69626C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D
        0A20202020202020547269666563746157616765722E56697369626C65203A3D
        2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060D54726966656374615761676572094576656E744E61
        6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65061653757065726665637461
        57616765724F6E5072696E740B50726F6772616D54797065070B747450726F63
        656475726506536F757263650C9C01000070726F636564757265205375706572
        666563746157616765724F6E5072696E743B0D0A626567696E0D0A0D0A202053
        75706572666563746157616765722E466F6E742E426F6C64203A3D2046616C73
        653B0D0A2020696620706C5072657644617952485B2749735375706572666563
        74614D617463686564275D203D2054727565207468656E20626567696E0D0A20
        202020205375706572666563746157616765722E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A20200D0A20206966202828706C507265
        7644617952485B274973537570657252616365275D203D20547275652920616E
        642028706C5072657644617952485B2753757065726665637461576167657241
        6D74275D203E203029297468656E20626567696E0D0A20202020202020537570
        6572666563746157616765722E56697369626C65203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202020205375706572666563
        746157616765722E56697369626C65203A3D2046616C73653B0D0A2020656E64
        3B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F537570
        657266656374615761676572094576656E744E616D6506074F6E5072696E7407
        4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D6506134578616374615061796F75744F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C6001
        000070726F636564757265204578616374615061796F75744F6E5072696E743B
        0D0A626567696E0D0A0D0A20204578616374615061796F75742E466F6E742E42
        6F6C64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B
        2749734578616374614D617463686564275D203D2054727565207468656E2062
        6567696E0D0A20202020204578616374615061796F75742E466F6E742E426F6C
        64203A3D20547275653B0D0A2020656E643B0D0A202020200D0A202069662070
        6C5072657644617952485B27497345786152616365275D203D20547275652074
        68656E20626567696E0D0A202020202020204578616374615061796F75742E56
        697369626C65203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A202020202020204578616374615061796F75742E56697369626C65203A
        3D2046616C73653B0D0A2020656E643B0D0A20200D0A0D0A0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060C4578616374615061796F75740945
        76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060D7657696E
        5063744F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650C3401000070726F636564757265207657696E5063744F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D
        0A6957696E5063743A696E74656765723B0D0A6657696E5063743A646F75626C
        653B0D0A626567696E20202020202020200D0A0D0A2020206957696E5063743A
        3D303B0D0A2020206657696E5063743A3D303B0D0A2020202020202020202020
        202020200D0A20202069662028765374617274732E4173496E7465676572203E
        203029207468656E20626567696E0D0A2020202020206657696E506374203A3D
        20287657696E732E4173496E746567657220202F20765374617274732E417349
        6E746567657229202A203130303B0D0A202020656E643B2020200D0A2020200D
        0A20202056616C7565203A3D206657696E5063743B0D0A2020200D0A656E643B
        0D0A0D436F6D706F6E656E744E616D6506077657696E506374094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65061076546F74616C4F646473
        4F6E43616C630B50726F6772616D54797065070B747450726F63656475726506
        536F7572636506A770726F6365647572652076546F74616C4F6464734F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A
        0D0A2020696620706C5072657644617948485B2746696E697368506F73275D20
        3D2031207468656E20626567696E0D0A2020202056616C7565203A3D2056616C
        7565202B20706C5072657644617948485B274F646473275D3B0D0A2020656E64
        3B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A76
        546F74616C4F646473094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060E764176674F6464734F6E43616C630B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C9601000070726F63656475
        726520764176674F6464734F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A7661720D0A664176674F6464733A646F75626C653B0D0A66
        5374617274733A646F75626C653B0D0A6657696E733A646F75626C653B0D0A0D
        0A626567696E0D0A20202020202020202020202020200D0A202020664176674F
        6464733A3D303B0D0A202020665374617274733A3D303B0D0A2020206657696E
        733A3D303B0D0A0D0A20202066537461727473203A3D20765374617274732E41
        73496E74656765723B20202020202020202020202020200D0A2020206657696E
        73203A3D207657696E732E4173496E74656765723B2020202020202020202020
        2020200D0A2020202020200D0A2020206966202866537461727473203E203029
        207468656E20626567696E0D0A202020202020664176674F646473203A3D2028
        76546F74616C4F6464732E4173446F75626C65202F206657696E73293B0D0A20
        2020656E643B2020200D0A2020200D0A20202056616C7565203A3D2066417667
        4F6464733B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060876
        4176674F646473094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D6506117657696E576167657265644F6E43616C630B50726F6772616D547970
        65070B747450726F63656475726506536F757263650C0401000070726F636564
        757265207657696E576167657265644F6E43616C63287661722056616C75653A
        2056617269616E74293B0D0A7661720D0A6657696E5761676572416D743A646F
        75626C653B0D0A626567696E0D0A2020200D0A2020200D0A202020696620706C
        5072657644617948485B274F646473275D203E2030207468656E20626567696E
        0D0A096657696E5761676572416D74203A3D20322E30303B200D0A202020656E
        6420656C736520626567696E0D0A202020096657696E5761676572416D74203A
        3D20303B0D0A202020656E643B0D0A0D0A202076616C7565203A3D206657696E
        5761676572416D74202B2056616C75653B0D0A2020200D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D65060B7657696E57616765726564094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060D7657696E576F6E4F6E43
        616C630B50726F6772616D54797065070B747450726F63656475726506536F75
        7263650CA201000070726F636564757265207657696E576F6E4F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A207661720D0A664F6464
        733A20646F75626C653B0D0A665061796F75743A646F75626C653B0D0A665761
        676572416D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A2020202020
        20665761676572416D74203A3D2020323B0D0A202020202020664F646473203A
        3D20706C5072657644617948485B274F646473275D3B0D0A2020202020206650
        61796F7574203A3D20303B0D0A2020200D0A09696620664F646473203E203020
        7468656E20626567696E0D0A090969662028706C5072657644617948485B2746
        696E697368506F73275D203D203129207468656E20626567696E0D0A09090966
        5061796F7574203A3D2028664F646473202A20665761676572416D7429202B20
        665761676572416D743B0D0A0909656E643B0D0A090956616C7565203A3D2056
        616C7565202B20665061796F75743B0D0A09656E6420656C736520626567696E
        0D0A090956616C7565203A3D2056616C75653B0D0A20202009656E643B0D0A20
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506077657696E576F
        6E094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C7657
        696E504C4F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C6D01000070726F636564757265207657696E504C4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D
        0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265
        643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567
        696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F7461
        6C576167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D
        0A20202066546F74616C576F6E203A3D207657696E576F6E2E4173446F75626C
        653B20202020202020202020202020200D0A20202066546F74616C5761676572
        6564203A3D207657696E576167657265642E4173446F75626C653B2020202020
        2020202020202020200D0A20202066546F74616C504C203A3D2066546F74616C
        576F6E202D2066546F74616C576167657265643B20200D0A2020200D0A202020
        56616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D6506067657696E504C094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060B7653686F734F6E43616C630B50726F6772
        616D54797065070B747450726F63656475726506536F75726365068E70726F63
        6564757265207653686F734F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A0D0A2020696620706C5072657644617948
        485B2746696E697368506F73275D203D2033207468656E20626567696E0D0A20
        20202056616C7565203A3D2056616C7565202B20313B0D0A2020656E643B0D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506057653686F7309
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65061176457861
        576167657265644F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650C8701000070726F6365647572652076457861
        576167657265644F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A202020696620706C5072657644617952485B27
        497345786152616365275D203D2054727565207468656E20626567696E0D0A20
        2020202020696620706C5072657644617948485B2746696E697368506F73275D
        203E2030207468656E20626567696E0D0A202020202020202020696620706C50
        72657644617948485B274F646473275D203E2030207468656E20626567696E0D
        0A20202020202020202020202069662028706C5072657644617952485B274578
        616374615061796F7574275D203E2030297468656E20626567696E0D0A202020
        202020200920202056616C7565203A3D202056616C7565202B20706C50726576
        44617952485B274578615761676572416D74275D3B0D0A202020202020202020
        202020656E643B0D0A202020202020202020656E643B0D0A202020202020656E
        643B0D0A202020656E643B2020200D0A200D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060B7645786157616765726564094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65061176547269576167657265644F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        63650C6F01000070726F6365647572652076547269576167657265644F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A
        0D0A696620706C5072657644617952485B27497354726952616365275D203D20
        54727565207468656E20626567696E0D0A2020696620706C5072657644617948
        485B2746696E697368506F73275D203E2030207468656E20626567696E0D0A20
        20202020696620706C5072657644617948485B274F646473275D203E20302074
        68656E20626567696E0D0A202020202009202069662028706C50726576446179
        52485B2754726966656374615061796F7574275D203E2030297468656E206265
        67696E0D0A202020202020202020202020202056616C7565203A3D202056616C
        7565202B20706C5072657644617952485B275472695761676572416D74275D3B
        0D0A2020202020202020656E643B20202020200D0A2020202020656E643B0D0A
        2020656E643B0D0A656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060B7654726957616765726564094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65061176517569576167657265644F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        6B01000070726F6365647572652076517569576167657265644F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A69
        6620706C5072657644617952485B27497351756952616365275D203D20547275
        65207468656E20626567696E0D0A202020696620706C5072657644617948485B
        2746696E697368506F73275D203E2030207468656E20626567696E0D0A202020
        2020696620706C5072657644617948485B274F646473275D203E203020746865
        6E20626567696E0D0A202020202020202069662028706C507265764461795248
        5B275175696E656C6C615061796F7574275D203E2030297468656E2062656769
        6E0D0A09202020202020202056616C7565203A3D202056616C7565202B20706C
        5072657644617952485B275175695761676572416D74275D3B0D0A2020202020
        202020656E643B0D0A202020202020656E643B0D0A202020656E643B0D0A656E
        643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B76
        51756957616765726564094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061176536663576167657265644F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C6B01000070726F
        6365647572652076536663576167657265644F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A0D0A696620706C507265
        7644617952485B274973537570657252616365275D203D205472756520746865
        6E20626567696E0D0A2020696620706C5072657644617948485B2746696E6973
        68506F73275D203E2030207468656E20626567696E0D0A202020202069662070
        6C5072657644617948485B274F646473275D203E2030207468656E2062656769
        6E0D0A20202020202020202069662028706C5072657644617952485B27537570
        657266656374615061796F7574275D203E2030297468656E20626567696E0D0A
        2020202020202020202020202056616C756520203A3D202056616C7565202B20
        706C5072657644617952485B275366635761676572416D74275D3B0D0A092020
        656E643B20202020200D0A09656E643B0D0A2020656E643B0D0A656E643B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B7653666357616765
        726564094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
        76506C63576167657265644F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506F170726F6365647572652076506C
        63576167657265644F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A7661720D0A665761676572416D743A646F75626C653B0D0A626567
        696E0D0A2020202020200D0A2020696620706C5072657644617948485B274F64
        6473275D203E2030207468656E20626567696E0D0A202009665761676572416D
        74203A3D20323B0D0A2020656E6420656C736520626567696E0D0A2020200966
        5761676572416D74203A3D20303B0D0A2020656E643B0D0A0D0A202056616C75
        65203A3D20665761676572416D74202B2056616C75653B0D0A2020200D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060B76506C635761676572656409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060D76506C63
        576F6E4F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650C8802000070726F6365647572652076506C63576F6E4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D
        0A664F6464733A646F75626C653B0D0A665761676572416D743A646F75626C65
        3B0D0A665061794F75743A646F75626C653B0D0A626567696E0D0A202020664F
        6464733A3D303B0D0A2020200D0A2020206966202828706C5072657644617948
        485B2746696E697368506F73275D203E3D203129616E642028706C5072657644
        617948485B2746696E697368506F73275D203C3D20322929207468656E206265
        67696E0D0A20202009696620706C5072657644617952485B2757696E506C6350
        61796F7574275D203E2030207468656E20626567696E0D0A0920202020202066
        4F646473203A3D2028706C5072657644617952485B2757696E506C635061796F
        7574275D202D20322E303029202F20323B0D0A202020202020656E643B0D0A20
        2020656E643B0D0A2020200D0A202020665761676572416D74203A3D2020323B
        0D0A202020665061796F7574203A3D20303B0D0A2020200D0A20202069662066
        4F646473203E2030207468656E20626567696E0D0A096966202828706C507265
        7644617948485B2746696E697368506F73275D203E3D20312920616E64202870
        6C5072657644617948485B2746696E697368506F73275D203C3D203229292074
        68656E20626567696E0D0A0909665061796F7574203A3D2028664F646473202A
        20665761676572416D7429202B20665761676572416D743B0D0A09656E643B0D
        0A0956616C7565203A3D2056616C7565202B20665061796F75743B0D0A202020
        656E6420656C736520626567696E0D0A0956616C7565203A3D2056616C75653B
        0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060776506C63576F6E094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65060C76506C63504C4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650C6D01000070726F6365
        647572652076506C63504C4F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A
        66546F74616C576167657265643A646F75626C653B0D0A66546F74616C504C3A
        646F75626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D
        303B0D0A20202066546F74616C576167657265643A3D303B0D0A20202066546F
        74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D2076506C
        63576F6E2E4173446F75626C653B20202020202020202020202020200D0A2020
        2066546F74616C57616765726564203A3D2076506C63576167657265642E4173
        446F75626C653B20202020202020202020202020200D0A20202066546F74616C
        504C203A3D2066546F74616C576F6E202D2066546F74616C576167657265643B
        20200D0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060676506C63504C0945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060C7653666350
        4C4F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F757263650C6D01000070726F6365647572652076536663504C4F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A6654
        6F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265643A64
        6F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567696E0D
        0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C5761
        67657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A2020
        2066546F74616C576F6E203A3D2076536663576F6E2E4173446F75626C653B20
        202020202020202020202020200D0A20202066546F74616C5761676572656420
        3A3D2076536663576167657265642E4173446F75626C653B2020202020202020
        2020202020200D0A20202066546F74616C504C203A3D2066546F74616C576F6E
        202D2066546F74616C576167657265643B20200D0A2020200D0A20202056616C
        7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060676536663504C094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060C76547269504C4F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C6D01000070726F
        6365647572652076547269504C4F6E43616C63287661722056616C75653A2056
        617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B
        0D0A66546F74616C576167657265643A646F75626C653B0D0A66546F74616C50
        4C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E
        3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A20202066
        546F74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D2076
        547269576F6E2E4173446F75626C653B20202020202020202020202020200D0A
        20202066546F74616C57616765726564203A3D2076547269576167657265642E
        4173446F75626C653B20202020202020202020202020200D0A20202066546F74
        616C504C203A3D2066546F74616C576F6E202D2066546F74616C576167657265
        643B20200D0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060676547269504C
        094576656E744E616D6506064F6E43616C63074576656E74494402210001060F
        5472614576656E7448616E646C65720B50726F6772616D4E616D65060C764578
        61504C4F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F757263650C6F01000070726F6365647572652076457861504C4F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D0A
        66546F74616C576F6E3A646F75626C653B0D0A66546F74616C57616765726564
        3A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A62656769
        6E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C
        576167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A
        20202066546F74616C576F6E203A3D2076457861576F6E2E4173446F75626C65
        3B20202020202020202020202020200D0A20202066546F74616C576167657265
        64203A3D2076457861576167657265642E4173446F75626C653B202020202020
        20202020202020200D0A20202066546F74616C504C203A3D2066546F74616C57
        6F6E202D2066546F74616C576167657265643B20200D0A2020200D0A20202056
        616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D0A0D436F
        6D706F6E656E744E616D65060676457861504C094576656E744E616D6506064F
        6E43616C63074576656E74494402210001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060C76517569504C4F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C6D0100
        0070726F6365647572652076517569504C4F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F75
        626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A66546F
        74616C504C3A646F75626C653B0D0A626567696E0D0A0D0A20202066546F7461
        6C576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A
        20202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E20
        3A3D2076517569576F6E2E4173446F75626C653B202020202020202020202020
        20200D0A20202066546F74616C57616765726564203A3D207651756957616765
        7265642E4173446F75626C653B20202020202020202020202020200D0A202020
        66546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C5761
        67657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F7461
        6C504C3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506067651
        7569504C094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0D76457861576F6E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C8101000070726F63656475726520764578
        61576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A696620706C5072657644617952485B274973457861526163
        65275D203D2054727565207468656E20626567696E0D0A2020696620706C5072
        657644617952485B2749734578616374614D617463686564275D203D20547275
        65207468656E20626567696E0D0A202020202069662028706C50726576446179
        52485B274578616374615761676572275D203D203129207468656E2062656769
        6E0D0A202020202020202056616C7565203A3D202056616C7565202B20202870
        6C5072657644617952485B274578616374615061796F7574275D202A2032293B
        0D0A2020202020656E6420656C736520626567696E0D0A202020202020202056
        616C7565203A3D202056616C7565202B2020706C5072657644617952485B2745
        78616374615061796F7574275D3B0D0A2020202020656E643B0D0A2020656E64
        3B20200D0A656E643B2020200D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060776457861576F6E094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060B764444504C4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C6E01000070726F6365647572
        6520764444504C4F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F74
        616C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F7562
        6C653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A
        20202066546F74616C576167657265643A3D303B0D0A20202066546F74616C50
        4C3A3D303B0D0A0D0A20202066546F74616C576F6E203A3D20764444576F6E2E
        4173446F75626C653B20202020202020202020202020200D0A20202066546F74
        616C57616765726564203A3D20764444576167657265642E4173446F75626C65
        3B20202020202020202020202020200D0A20202066546F74616C504C203A3D20
        66546F74616C576F6E202D2066546F74616C576167657265643B20200D0A2020
        200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B
        0D0A0D0A0D0A0D436F6D706F6E656E744E616D650605764444504C094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060C764444576F6E4F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        757263650CD501000070726F63656475726520764444576F6E4F6E43616C6328
        7661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20
        20696620706C5072657644617952485B274973444452616365275D203D205472
        7565207468656E20626567696E0D0A2020202020696620706C50726576446179
        52485B2749734461696C79446F75626C654D6174636865644669727374526163
        65275D203D2054727565207468656E20626567696E0D0A202020202020202069
        662028706C5072657644617952485B274461696C79446F75626C655761676572
        466972737452616365275D203D203129207468656E20626567696E0D0A202020
        202020202020202056616C756520203A3D202056616C7565202B202028706C50
        72657644617952485B274461696C79446F75626C655061796F75744669727374
        52616365275D202A2032293B0D0A2020202020202020656E6420656C73652062
        6567696E0D0A202020202020202020202056616C756520203A3D202056616C75
        65202B2020706C5072657644617952485B274461696C79446F75626C65506179
        6F7574466972737452616365275D3B0D0A2020202020202020656E643B0D0A20
        20202020656E643B0D0A2020656E643B20200D0A20200D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D650606764444576F6E094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D650610764444576167657265644F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        650CA401000070726F63656475726520764444576167657265644F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        09696620706C5072657644617952485B274973444452616365275D203D205472
        7565207468656E20626567696E0D0A20202020202009696620706C5072657644
        617948485B2746696E697368506F73275D203E2030207468656E20626567696E
        0D0A20202020202020200909696620706C5072657644617948485B274F646473
        275D203E2030207468656E20626567696E0D0A09092020202020200969662028
        706C5072657644617952485B274461696C79446F75626C655061796F75744669
        72737452616365275D203E2030297468656E20626567696E0D0A202020202020
        202020202020202020202020090956616C7565203A3D202056616C7565202B20
        706C5072657644617952485B2744445761676572416D74275D3B0D0A20202020
        2020202020202020202020202020202020202020656E643B0D0A090920202020
        2020656E643B0D0A0909656E643B0D0A202020202020656E643B202020200D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A764444576167
        65726564094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0D76517569576F6E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F7572636506FD70726F6365647572652076517569576F
        6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A6265
        67696E0D0A0D0A2020696620706C5072657644617952485B2749735175695261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020696620
        706C5072657644617952485B2749735175696E656C6C614D617463686564275D
        203D2054727565207468656E20626567696E0D0A202020202020202056616C75
        6520203A3D202056616C7565202B2020706C5072657644617952485B27517569
        6E656C6C615061796F7574275D3B0D0A2020202020656E643B0D0A2020656E64
        3B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E616D650607765175
        69576F6E094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0D76547269576F6E4F6E43616C630B50726F6772616D54797065070B74745072
        6F63656475726506536F757263650C9901000070726F63656475726520765472
        69576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A2020696620706C5072657644617952485B27497354726952
        616365275D203D2054727565207468656E20626567696E0D0A20202020206966
        20706C5072657644617952485B27497354726966656374614D61746368656427
        5D203D2054727565207468656E20626567696E0D0A2020202020202069662028
        706C5072657644617952485B2754726966656374615761676572275D203D2031
        29207468656E20626567696E0D0A2020202020202020202056616C756520203A
        3D202056616C7565202B202028706C5072657644617952485B27547269666563
        74615061796F7574275D202A2032293B0D0A20202020202020656E6420656C73
        6520626567696E0D0A2020202020202020202056616C756520203A3D20205661
        6C7565202B2020706C5072657644617952485B2754726966656374615061796F
        7574275D3B0D0A20202020202020656E643B0D0A20202020656E643B0D0A2020
        656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776547269
        576F6E094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D
        76536663576F6E4F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F757263650CAD01000070726F6365647572652076536663
        576F6E4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A0D0A2020696620706C5072657644617952485B274973537570
        657252616365275D203D2054727565207468656E20626567696E0D0A20202020
        20696620706C5072657644617952485B274973537570657266656374614D6174
        63686564275D203D2054727565207468656E20626567696E0D0A202020202020
        202069662028706C5072657644617952485B2753757065726665637461576167
        6572275D203D203129207468656E20626567696E0D0A20202020202020202020
        2056616C756520203A3D202056616C7565202B202028706C5072657644617952
        485B27537570657266656374615061796F7574275D202A2032293B0D0A202020
        2020202020656E6420656C736520626567696E0D0A2020202020202020202020
        56616C756520203A3D202056616C7565202B2020706C5072657644617952485B
        27537570657266656374615061796F7574275D3B0D0A2020202020202020656E
        643B0D0A2020202020656E643B0D0A2020656E643B0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D65060776536663576F6E094576656E744E616D65
        06064F6E43616C63074576656E74494402210001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D6506117653686F576167657265644F6E
        43616C630B50726F6772616D54797065070B747450726F63656475726506536F
        7572636506F170726F636564757265207653686F576167657265644F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A7661720D0A665761
        676572416D743A646F75626C653B0D0A626567696E0D0A2020200D0A20202069
        6620706C5072657644617948485B274F646473275D203E2030207468656E2062
        6567696E0D0A09665761676572416D74203A3D20323B0D0A202020656E642065
        6C736520626567696E0D0A20202009665761676572416D74203A3D20303B0D0A
        202020656E643B0D0A0D0A202056616C7565203A3D20665761676572416D7420
        2B2056616C75653B0D0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E
        744E616D65060B7653686F57616765726564094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060D7653686F576F6E4F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C900200
        0070726F636564757265207653686F576F6E4F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A664F6464733A646F75626C65
        3B0D0A665761676572416D743A646F75626C653B0D0A665061794F75743A646F
        75626C653B0D0A626567696E0D0A202020664F6464733A3D303B0D0A2020200D
        0A2020206966202828706C5072657644617948485B2746696E697368506F7327
        5D203E3D20312920616E642028706C5072657644617948485B2746696E697368
        506F73275D203C3D20332929207468656E20626567696E0D0A20202009696620
        706C5072657644617952485B2757696E53686F5061796F7574275D203E203020
        7468656E20626567696E0D0A09202020202020664F646473203A3D2028706C50
        72657644617952485B2757696E53686F5061796F7574275D202D20322E303029
        202F20323B0D0A202020202020656E643B0D0A202020656E643B0D0A2020200D
        0A2020200D0A202020665761676572416D74203A3D2020323B0D0A2020206650
        61796F7574203A3D20303B0D0A2020200D0A202020696620664F646473203E20
        30207468656E20626567696E0D0A096966202828706C5072657644617948485B
        2746696E697368506F73275D203E3D20312920616E642028706C507265764461
        7948485B2746696E697368506F73275D203C3D20332929207468656E20626567
        696E0D0A0909665061796F7574203A3D2028664F646473202A20665761676572
        416D7429202B20665761676572416D743B0D0A09656E643B0D0A0956616C7565
        203A3D2056616C7565202B20665061796F75743B0D0A202020656E6420656C73
        6520626567696E0D0A0956616C7565203A3D2056616C75653B0D0A202020656E
        643B0D0A2020200D0A656E643B0D0A0D0A0D436F6D706F6E656E744E616D6506
        077653686F576F6E094576656E744E616D6506064F6E43616C63074576656E74
        494402210001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060C7653686F504C4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C6F01000070726F63656475726520
        7653686F504C4F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A7661720D0A66546F74616C576F6E3A646F75626C653B0D0A66546F7461
        6C576167657265643A646F75626C653B0D0A66546F74616C504C3A646F75626C
        653B0D0A626567696E0D0A0D0A20202066546F74616C576F6E3A3D303B0D0A20
        202066546F74616C576167657265643A3D303B0D0A20202066546F74616C504C
        3A3D303B0D0A0D0A0D0A20202066546F74616C576F6E203A3D207653686F576F
        6E2E4173446F75626C653B20202020202020202020202020200D0A2020206654
        6F74616C57616765726564203A3D207653686F576167657265642E4173446F75
        626C653B20202020202020202020202020200D0A20202066546F74616C504C20
        3A3D2066546F74616C576F6E202D2066546F74616C576167657265643B20200D
        0A2020200D0A20202056616C7565203A3D2066546F74616C504C3B0D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D6506067653686F504C094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65061344657461696C4166
        74657247656E65726174650B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365062F70726F6365647572652044657461696C416674
        657247656E65726174653B0D0A626567696E0D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060644657461696C094576656E744E616D65060D4166
        74657247656E6572617465074576656E74494402190001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060C76575053504C4F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365068770726F6365647572652076575053504C4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A626567696E0D0A2020200D0A202020
        56616C7565203A3D20207657696E504C2E4173446F75626C65202B2076506C63
        504C2E4173446F75626C65202B207653686F504C2E4173446F75626C653B0D0A
        2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D6506067657505350
        4C094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506117650
        6B33576167657265644F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C8001000070726F636564757265207650
        6B33576167657265644F6E43616C63287661722056616C75653A205661726961
        6E74293B0D0A626567696E0D0A0D0A2020696620706C5072657644617952485B
        274973506B3352616365275D203D2054727565207468656E20626567696E0D0A
        2020202020696620706C5072657644617948485B2746696E697368506F73275D
        203E2030207468656E20626567696E0D0A20202020202020696620706C507265
        7644617948485B274F646473275D203E2030207468656E20626567696E0D0A20
        202020202020202069662028706C5072657644617952485B275069636B335061
        796F7574466972737452616365275D203E2030297468656E20626567696E0D0A
        202020202020202020202020202020090956616C7565203A3D202056616C7565
        202B20706C5072657644617952485B27506B335761676572416D74275D3B0D0A
        09202020656E643B20202020200D0A0920656E643B0D0A2020202020656E643B
        0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060B76506B3357616765726564094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65061176506B34576167657265644F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C7A01
        000070726F6365647572652076506B34576167657265644F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B274973506B3452616365275D203D20547275
        65207468656E20626567696E0D0A20202020696620706C507265764461794848
        5B2746696E697368506F73275D203E2030207468656E20626567696E0D0A2020
        20202020696620706C5072657644617948485B274F646473275D203E20302074
        68656E20626567696E0D0A202020202020202069662028706C50726576446179
        52485B275069636B345061796F7574466972737452616365275D203E20302974
        68656E20626567696E0D0A202020202020202020202020202020090956616C75
        65203A3D202056616C7565202B20706C5072657644617952485B27506B345761
        676572416D74275D3B0D0A092020656E643B20202020200D0A09656E643B0D0A
        20202020656E643B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060B76506B3457616765726564094576656E744E616D
        6506064F6E43616C63074576656E74494402210001060F5472614576656E7448
        616E646C65720B50726F6772616D4E616D65060D76506B34576F6E4F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        650CAF01000070726F6365647572652076506B34576F6E4F6E43616C63287661
        722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202069
        6620706C5072657644617952485B274973506B3452616365275D203D20547275
        65207468656E20626567696E0D0A20202020696620706C507265764461795248
        5B2749735069636B344D617463686564466972737452616365275D203D205472
        7565207468656E20626567696E0D0A20202020202069662028706C5072657644
        617952485B275069636B345761676572466972737452616365275D203D203129
        207468656E20626567696E0D0A202020202020202056616C756520203A3D2020
        56616C7565202B202028706C5072657644617952485B275069636B345061796F
        7574466972737452616365275D202A2032293B0D0A202020202020656E642065
        6C736520626567696E0D0A202020202020202056616C756520203A3D20205661
        6C7565202B2020706C5072657644617952485B275069636B345061796F757446
        6972737452616365275D3B0D0A202020202020656E643B0D0A20202020656E64
        3B0D0A2020656E643B0D0A20200D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060776506B34576F6E094576656E744E616D6506064F6E43616C630745
        76656E74494402210001060F5472614576656E7448616E646C65720B50726F67
        72616D4E616D65060D76506B33576F6E4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F757263650CAF01000070726F6365
        647572652076506B33576F6E4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A2020696620706C50726576446179
        52485B274973506B3352616365275D203D2054727565207468656E2062656769
        6E0D0A20202020696620706C5072657644617952485B2749735069636B334D61
        7463686564466972737452616365275D203D2054727565207468656E20626567
        696E0D0A20202020202069662028706C5072657644617952485B275069636B33
        5761676572466972737452616365275D203D203129207468656E20626567696E
        0D0A202020202020202056616C756520203A3D202056616C7565202B20202870
        6C5072657644617952485B275069636B335061796F7574466972737452616365
        275D202A2032293B0D0A202020202020656E6420656C736520626567696E0D0A
        202020202020202056616C756520203A3D202056616C7565202B2020706C5072
        657644617952485B275069636B335061796F7574466972737452616365275D3B
        0D0A202020202020656E643B0D0A20202020656E643B0D0A2020656E643B0D0A
        20200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060776506B33576F
        6E094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C7650
        6B33504C4F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C6F01000070726F6365647572652076506B33504C4F
        6E43616C63287661722056616C75653A2056617269616E74293B0D0A7661720D
        0A66546F74616C576F6E3A646F75626C653B0D0A66546F74616C576167657265
        643A646F75626C653B0D0A66546F74616C504C3A646F75626C653B0D0A626567
        696E0D0A20202066546F74616C576F6E3A3D303B0D0A20202066546F74616C57
        6167657265643A3D303B0D0A20202066546F74616C504C3A3D303B0D0A0D0A20
        202066546F74616C576F6E203A3D2076506B33576F6E2E4173446F75626C653B
        20202020202020202020202020200D0A20202066546F74616C57616765726564
        203A3D2076506B33576167657265642E4173446F75626C653B20202020202020
        202020202020200D0A20202066546F74616C504C203A3D2066546F74616C576F
        6E202D2066546F74616C576167657265643B20200D0A2020200D0A2020205661
        6C7565203A3D2066546F74616C504C3B0D0A0D0A656E643B0D0A0D0A0D0A0D43
        6F6D706F6E656E744E616D65060676506B33504C094576656E744E616D650606
        4F6E43616C63074576656E74494402210001060F5472614576656E7448616E64
        6C65720B50726F6772616D4E616D65060C76506B34504C4F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C7101
        000070726F6365647572652076506B34504C4F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A7661720D0A66546F74616C576F6E3A646F
        75626C653B0D0A66546F74616C576167657265643A646F75626C653B0D0A6654
        6F74616C504C3A646F75626C653B0D0A626567696E0D0A20202066546F74616C
        576F6E3A3D303B0D0A20202066546F74616C576167657265643A3D303B0D0A20
        202066546F74616C504C3A3D303B0D0A0D0A20202066546F74616C576F6E203A
        3D2076506B34576F6E2E4173446F75626C653B20202020202020202020202020
        200D0A20202066546F74616C57616765726564203A3D2076506B345761676572
        65642E4173446F75626C653B20202020202020202020202020200D0A20202066
        546F74616C504C203A3D2066546F74616C576F6E202D2066546F74616C576167
        657265643B20200D0A2020200D0A20202056616C7565203A3D2066546F74616C
        504C3B0D0A0D0A656E643B0D0A0D0A0D0A0D0A0D436F6D706F6E656E744E616D
        65060676506B34504C094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D6506125069636B335061796F75744F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650C5701000070726F
        636564757265205069636B335061796F75744F6E5072696E743B0D0A62656769
        6E0D0A20200D0A20205069636B335061796F75742E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749735069
        636B334D617463686564466972737452616365275D203D205472756520746865
        6E20626567696E0D0A20202020205069636B335061796F75742E466F6E742E42
        6F6C64203A3D20547275653B0D0A2020656E643B0D0A2020696620706C507265
        7644617952485B274973506B3352616365275D203D2054727565207468656E20
        626567696E0D0A202020202020205069636B335061796F75742E56697369626C
        65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202020205069636B335061796F75742E56697369626C65203A3D2046616C73
        653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060B5069636B335061796F7574094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060F76547269536663504C4F6E43616C630B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506737072
        6F6365647572652076547269536663504C4F6E43616C63287661722056616C75
        653A2056617269616E74293B0D0A626567696E0D0A0D0A20202056616C756520
        3A3D2076547269504C2E4173446F75626C65202B2076536663504C2E4173446F
        75626C653B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0976547269536663504C094576656E744E616D6506064F6E43616C6307457665
        6E74494402210001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060F76457861517569504C4F6E43616C630B50726F6772616D5479
        7065070B747450726F63656475726506536F75726365067370726F6365647572
        652076457861517569504C4F6E43616C63287661722056616C75653A20566172
        69616E74293B0D0A626567696E0D0A0D0A20202056616C7565203A3D20207651
        7569504C2E4173446F75626C65202B2076457861504C2E4173446F75626C6520
        3B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506097645786151
        7569504C094576656E744E616D6506064F6E43616C63074576656E7449440221
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        0E764444506B33504C4F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365067070726F63656475726520764444506B
        33504C4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A
        626567696E0D0A20200D0A202056616C7565203A3D20764444504C2E4173446F
        75626C65202B2076506B33504C2E4173446F75626C653B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D650608764444506B33504C094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060F76506B34506B36504C4F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F75726365065E70726F6365647572652076506B34506B36504C4F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        202056616C7565203A3D2076506B34504C2E4173446F75626C653B0D0A0D0A65
        6E643B0D0A0D436F6D706F6E656E744E616D65060976506B34506B36504C0945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060E57696E4E62
        72734F6E5072696E740B50726F6772616D54797065070B747450726F63656475
        726506536F7572636506DE70726F6365647572652057696E4E6272734F6E5072
        696E743B0D0A626567696E0D0A0D0A202057696E4E6272732E466F6E742E426F
        6C64203A3D2046616C73653B0D0A20202020200D0A202020696620706C507265
        7644617948485B2746696E697368506F73275D203D2031207468656E20626567
        696E0D0A202020202057696E4E6272732E466F6E742E426F6C64203A3D205472
        75653B0D0A2020656E6420656C736520626567696E0D0A202020202057696E4E
        6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060757696E4E627273
        094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506135769
        6E506C635061796F75744F6E5072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506F470726F6365647572652057696E
        506C635061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A20205769
        6E506C635061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A
        20202020200D0A202020696620706C5072657644617948485B2746696E697368
        506F73275D203D2031207468656E20626567696E0D0A202020202057696E506C
        635061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E
        6420656C736520626567696E0D0A202020202057696E506C635061796F75742E
        466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060C57696E506C63506179
        6F7574094576656E744E616D6506074F6E5072696E74074576656E7449440220
        0001060F5472614576656E7448616E646C65720B50726F6772616D4E616D6506
        1357696E53686F5061796F75744F6E5072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F7572636506F670726F63656475726520
        57696E53686F5061796F75744F6E5072696E743B0D0A626567696E0D0A0D0A20
        2057696E53686F5061796F75742E466F6E742E426F6C64203A3D2046616C7365
        3B0D0A20202020200D0A202020696620706C5072657644617948485B2746696E
        697368506F73275D203D2031207468656E20626567696E0D0A20202020205769
        6E53686F5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202057696E53686F5061796F
        75742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A
        20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C57696E53
        686F5061796F7574094576656E744E616D6506074F6E5072696E74074576656E
        74494402200001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D65060E506C634E6272734F6E5072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F7572636506E370726F63656475726520
        506C634E6272734F6E5072696E743B0D0A626567696E0D0A0D0A202020506C63
        4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D
        0A202020696620706C5072657644617948485B2746696E697368506F73275D20
        3D2032207468656E20626567696E0D0A2020202020506C634E6272732E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A2020202020506C634E6272732E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020656E643B0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D650607506C634E627273094576656E744E616D6506074F6E5072
        696E74074576656E74494402200001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060E53686F4E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F7572636506DD7072
        6F6365647572652053686F4E6272734F6E5072696E743B0D0A626567696E0D0A
        20202053686F4E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A
        20202020200D0A202020696620706C5072657644617948485B2746696E697368
        506F73275D203D2033207468656E20626567696E0D0A202020202053686F4E62
        72732E466F6E742E426F6C64203A3D20547275653B0D0A2020656E6420656C73
        6520626567696E0D0A202020202053686F4E6272732E466F6E742E426F6C6420
        3A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D70
        6F6E656E744E616D65060753686F4E627273094576656E744E616D6506074F6E
        5072696E74074576656E74494402200001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D650610506C635061796F75744F6E5072696E74
        0B50726F6772616D54797065070B747450726F63656475726506536F75726365
        06E570726F63656475726520506C635061796F75744F6E5072696E743B0D0A62
        6567696E0D0A202020506C635061796F75742E466F6E742E426F6C64203A3D20
        46616C73653B0D0A20202020200D0A202020696620706C507265764461794848
        5B2746696E697368506F73275D203D2032207468656E20626567696E0D0A2020
        202020506C635061796F75742E466F6E742E426F6C64203A3D20547275653B0D
        0A2020656E6420656C736520626567696E0D0A2020202020506C635061796F75
        742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D650609506C635061796F7574
        094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D650613506C
        6353686F5061796F75744F6E5072696E740B50726F6772616D54797065070B74
        7450726F63656475726506536F7572636506F370726F63656475726520506C63
        53686F5061796F75744F6E5072696E743B0D0A626567696E0D0A202020506C63
        53686F5061796F75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        202020200D0A202020696620706C5072657644617948485B2746696E69736850
        6F73275D203D2032207468656E20626567696E0D0A2020202020506C6353686F
        5061796F75742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A2020202020506C6353686F5061796F75742E46
        6F6E742E426F6C64203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D65060C506C6353686F5061796F
        7574094576656E744E616D6506074F6E5072696E74074576656E744944022000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        53686F5061796F75744F6E5072696E740B50726F6772616D54797065070B7474
        50726F63656475726506536F7572636506E770726F6365647572652053686F50
        61796F75744F6E5072696E743B0D0A626567696E0D0A20202053686F5061796F
        75742E466F6E742E426F6C64203A3D2046616C73653B0D0A20202020200D0A20
        2020696620706C5072657644617948485B2746696E697368506F73275D203D20
        33207468656E20626567696E0D0A202020202053686F5061796F75742E466F6E
        742E426F6C64203A3D20547275653B0D0A2020656E6420656C73652062656769
        6E0D0A202020202053686F5061796F75742E466F6E742E426F6C64203A3D2046
        616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060953686F5061796F7574094576656E744E616D6506074F6E
        5072696E74074576656E74494402200001060F5472614576656E7448616E646C
        65720B50726F6772616D4E616D65060944444F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C2B0100007072
        6F6365647572652044444F6E5072696E743B0D0A626567696E0D0A0D0A202044
        442E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C5072
        657644617952485B2749734461696C79446F75626C654D617463686564466972
        737452616365275D203D2054727565207468656E20626567696E0D0A20202020
        2044442E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A
        0D0A2020696620706C5072657644617952485B274973444452616365275D203D
        2054727565207468656E20626567696E0D0A202020202044442E56697369626C
        65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A2020
        20202044442E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506024444094576656E
        744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D6506164461696C79446F
        75626C654E6272734F6E5072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C7601000070726F636564757265204461
        696C79446F75626C654E6272734F6E5072696E743B0D0A626567696E0D0A0D0A
        20204461696C79446F75626C654E6272732E466F6E742E426F6C64203A3D2046
        616C73653B0D0A2020696620706C5072657644617952485B2749734461696C79
        446F75626C654D617463686564466972737452616365275D203D205472756520
        7468656E20626567696E0D0A20202020204461696C79446F75626C654E627273
        2E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A202020
        200D0A2020696620706C5072657644617952485B274973444452616365275D20
        3D2054727565207468656E20626567696E0D0A202020202020204461696C7944
        6F75626C654E6272732E56697369626C65203A3D20547275653B0D0A2020656E
        6420656C736520626567696E0D0A202020202020204461696C79446F75626C65
        4E6272732E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A
        0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060F4461696C7944
        6F75626C654E627273094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65060C5069636B334F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C4201000070726F6365647572
        65205069636B334F6E5072696E743B0D0A626567696E0D0A20205069636B332E
        466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620706C50726576
        44617952485B2749735069636B334D617463686564466972737452616365275D
        203D2054727565207468656E20626567696E0D0A20202020205069636B332E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A20
        2020696620706C5072657644617952485B274973506B3352616365275D203D20
        54727565207468656E20626567696E0D0A202020202020205069636B332E5669
        7369626C65203A3D20547275653B0D0A2020656E6420656C736520626567696E
        0D0A202020202020205069636B332E56697369626C65203A3D2046616C73653B
        0D0A2020656E643B0D0A20200D0A20200D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506055069636B33094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060C5069636B344F6E5072696E740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C3B0100007072
        6F636564757265205069636B344F6E5072696E743B0D0A626567696E0D0A2050
        69636B342E466F6E742E426F6C64203A3D2046616C73653B0D0A202069662070
        6C5072657644617952485B2749735069636B344D617463686564466972737452
        616365275D203D2054727565207468656E20626567696E0D0A20202020205069
        636B342E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A
        20200D0A20200D0A20696620706C5072657644617952485B274973506B345261
        6365275D203D2054727565207468656E20626567696E0D0A2020202020202050
        69636B342E56697369626C65203A3D20547275653B0D0A2020656E6420656C73
        6520626567696E0D0A202020202020205069636B342E56697369626C65203A3D
        2046616C73653B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D6506055069636B34094576656E744E616D6506074F6E5072696E
        74074576656E74494402200001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D6506105069636B334E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C4C0100
        0070726F636564757265205069636B334E6272734F6E5072696E743B0D0A6265
        67696E0D0A20205069636B334E6272732E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020696620706C5072657644617952485B2749735069636B334D
        617463686564466972737452616365275D203D2054727565207468656E206265
        67696E0D0A20202020205069636B334E6272732E466F6E742E426F6C64203A3D
        20547275653B0D0A2020656E643B0D0A20200D0A20696620706C507265764461
        7952485B274973506B3352616365275D203D2054727565207468656E20626567
        696E0D0A202020202020205069636B334E6272732E56697369626C65203A3D20
        547275653B0D0A2020656E6420656C736520626567696E0D0A20202020202020
        5069636B334E6272732E56697369626C65203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609506963
        6B334E627273094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D6506105069636B344E6272734F6E5072696E740B50726F6772616D54797065
        070B747450726F63656475726506536F757263650C5001000070726F63656475
        7265205069636B344E6272734F6E5072696E743B0D0A626567696E0D0A202050
        69636B344E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A2020
        696620706C5072657644617952485B2749735069636B344D6174636865644669
        72737452616365275D203D2054727565207468656E20626567696E0D0A202020
        20205069636B344E6272732E466F6E742E426F6C64203A3D20547275653B0D0A
        2020656E643B0D0A20200D0A20696620706C5072657644617952485B27497350
        6B3452616365275D203D2054727565207468656E20626567696E0D0A20202020
        2020205069636B344E6272732E56697369626C65203A3D20547275653B0D0A20
        20656E6420656C736520626567696E0D0A202020202020205069636B344E6272
        732E56697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A20200D
        0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095069636B344E62
        7273094576656E744E616D6506074F6E5072696E74074576656E744944022000
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        7657696E504C5063744F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365068170726F636564757265207657696E50
        4C5063744F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A20202056616C7565203A3D20436F6D70757465504C506374
        20287657696E576F6E2E4173446F75626C652C7657696E576167657265642E41
        73446F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06097657696E504C506374094576656E744E616D6506064F6E43616C63074576
        656E74494402210001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D65060F76506C63504C5063744F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365068370726F63656475
        72652076506C63504C5063744F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A20202056616C7565203A3D20436F
        6D70757465504C506374202876506C63576F6E2E4173446F75626C652C76506C
        63576167657265642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D
        706F6E656E744E616D65060976506C63504C506374094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65060F7653686F504C5063744F6E43616C
        630B50726F6772616D54797065070B747450726F63656475726506536F757263
        65068370726F636564757265207653686F504C5063744F6E43616C6328766172
        2056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202056
        616C7565203A3D20436F6D70757465504C50637420287653686F576F6E2E4173
        446F75626C652C7653686F576167657265642E4173446F75626C65290D0A0D0A
        656E643B0D0A0D436F6D706F6E656E744E616D6506097653686F504C50637409
        4576656E744E616D6506064F6E43616C63074576656E74494402210001060F54
        72614576656E7448616E646C65720B50726F6772616D4E616D65060E76444450
        4C5063744F6E43616C630B50726F6772616D54797065070B747450726F636564
        75726506536F75726365068370726F63656475726520764444504C5063744F6E
        43616C63287661722056616C75653A2056617269616E74293B0D0A626567696E
        0D0A0D0A2020202056616C7565203A3D20436F6D70757465504C506374202876
        4444576F6E2E4173446F75626C652C764444576167657265642E4173446F7562
        6C65290D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060876
        4444504C506374094576656E744E616D6506064F6E43616C63074576656E7449
        4402210001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060F76506B33504C5063744F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365068370726F6365647572652076
        506B33504C5063744F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A0D0A20202056616C7565203A3D20436F6D707574
        65504C506374202876506B33576F6E2E4173446F75626C652C76506B33576167
        657265642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D65060976506B33504C506374094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060F76506B34504C5063744F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F75726365068370
        726F6365647572652076506B34504C5063744F6E43616C63287661722056616C
        75653A2056617269616E74293B0D0A626567696E0D0A0D0A20202056616C7565
        203A3D20436F6D70757465504C506374202876506B34576F6E2E4173446F7562
        6C652C76506B34576167657265642E4173446F75626C65290D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D65060976506B34504C506374094576656E
        744E616D6506064F6E43616C63074576656E74494402210001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060F76536663504C5063
        744F6E43616C630B50726F6772616D54797065070B747450726F636564757265
        06536F75726365068370726F6365647572652076536663504C5063744F6E4361
        6C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A
        0D0A20202056616C7565203A3D20436F6D70757465504C506374202876536663
        576F6E2E4173446F75626C652C76536663576167657265642E4173446F75626C
        65290D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060976536663
        504C506374094576656E744E616D6506064F6E43616C63074576656E74494402
        210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
        060F76547269504C5063744F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F75726365068370726F63656475726520765472
        69504C5063744F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A20202056616C7565203A3D20436F6D7075746550
        4C506374202876547269576F6E2E4173446F75626C652C765472695761676572
        65642E4173446F75626C65290D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060976547269504C506374094576656E744E616D6506064F6E43616C
        63074576656E74494402210001060F5472614576656E7448616E646C65720B50
        726F6772616D4E616D65060F76517569504C5063744F6E43616C630B50726F67
        72616D54797065070B747450726F63656475726506536F75726365068370726F
        6365647572652076517569504C5063744F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A626567696E0D0A0D0A20202056616C7565203A
        3D20436F6D70757465504C506374202876517569576F6E2E4173446F75626C65
        2C76517569576167657265642E4173446F75626C65290D0A0D0A656E643B0D0A
        0D436F6D706F6E656E744E616D65060976517569504C506374094576656E744E
        616D6506064F6E43616C63074576656E74494402210001060F5472614576656E
        7448616E646C65720B50726F6772616D4E616D65060F76457861504C5063744F
        6E43616C630B50726F6772616D54797065070B747450726F6365647572650653
        6F75726365068670726F6365647572652076457861504C5063744F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A
        20202056616C7565203A3D20436F6D70757465504C506374202876457861576F
        6E2E4173446F75626C652C76457861576167657265642E4173446F75626C6529
        0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D650609764578
        61504C506374094576656E744E616D6506064F6E43616C63074576656E744944
        02210001060F5472614576656E7448616E646C65720B50726F6772616D4E616D
        65060E76546F74616C504C4F6E43616C630B50726F6772616D54797065070B74
        7450726F63656475726506536F757263650C2701000070726F63656475726520
        76546F74616C504C4F6E43616C63287661722056616C75653A2056617269616E
        74293B0D0A626567696E0D0A20200D0A202056616C7565203A3D207657696E50
        4C2E4173446F75626C65202B2076506C63504C2E4173446F75626C65202B2076
        53686F504C2E4173446F75626C65202B0D0A2020202020202020202020764444
        504C2E4173446F75626C65202B2076506B33504C2E4173446F75626C65202B20
        76506B34504C2E4173446F75626C65202B0D0A20202020202020202020207651
        7569504C2E4173446F75626C65202B2076457861504C2E4173446F75626C6520
        2B200D0A202020202020202020202076547269504C2E4173446F75626C65202B
        2076536663504C2E4173446F75626C653B0D0A20200D0A656E643B0D0A0D436F
        6D706F6E656E744E616D65060876546F74616C504C094576656E744E616D6506
        064F6E43616C63074576656E74494402210001060F5472614576656E7448616E
        646C65720B50726F6772616D4E616D65060F4C617465506163654F6E5072696E
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        650C5101000070726F636564757265204C617465506163654F6E5072696E743B
        0D0A626567696E0D0A2020202020204C617465506163652E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020202020204C617465506163652E466F6E74
        2E556E6465726C696E65203A3D2046616C73653B0D0A2020202020200D0A0969
        6620706C5072657644617948485B274C6174655061636552616E6B275D203D20
        31207468656E20626567696E0D0A2020200920204C617465506163652E466F6E
        742E426F6C64203A3D20547275653B0D0A2020202020202020696620706C5072
        657644617948485B2749734261636B446F75626C654C696E6572275D20746865
        6E20626567696E0D0A092020202020204C617465506163652E466F6E742E556E
        6465726C696E65203A3D20547275653B0D0A202020202020202020656E643B20
        0D0A202020202020656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506084C61746550616365094576656E744E616D6506074F6E507269
        6E74074576656E74494402200001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65060E45726C506163654F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C4F010000
        70726F6365647572652045726C506163654F6E5072696E743B0D0A626567696E
        0D0A0D0A20202020202045726C506163652E466F6E742E426F6C64203A3D2046
        616C73653B0D0A20202020202045726C506163652E466F6E742E556E6465726C
        696E65203A3D2046616C73653B0D0A2020202020200D0A09696620706C507265
        7644617948485B274561726C795061636552616E6B275D203D2031207468656E
        20626567696E0D0A0920202045726C506163652E466F6E742E426F6C64203A3D
        20547275653B0D0A202020202020202020696620706C5072657644617948485B
        27497346726F6E74446F75626C654C696E6572275D207468656E20626567696E
        0D0A0920202020202045726C506163652E466F6E742E556E6465726C696E6520
        3A3D20547275653B0D0A202020202020202020656E643B200D0A202020202020
        656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060745
        726C50616365094576656E744E616D6506074F6E5072696E74074576656E7449
        4402200001060F5472614576656E7448616E646C65720B50726F6772616D4E61
        6D65060E4D6964506163654F6E5072696E740B50726F6772616D54797065070B
        747450726F63656475726506536F757263650C1B02000070726F636564757265
        204D6964506163654F6E5072696E743B0D0A626567696E0D0A094D6964506163
        652E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20202020
        20204D6964506163652E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20202020200D0A09696620706C5072657644617948485B274D6964646C655061
        636552616E6B275D203D2031207468656E20626567696E0D0A092020204D6964
        506163652E466F6E742E426F6C64203A3D20547275653B0D0A20202020202020
        2020696620706C5072657644617948485B27497346726F6E74446F75626C654C
        696E6572275D207468656E20626567696E0D0A092020202020204D6964506163
        652E466F6E742E556E6465726C696E65203A3D20547275653B0D0A2020202020
        20202020656E643B200D0A202020202020656E643B200D0A0D0A09696620706C
        5072657644617948485B274D6964646C655061636552616E6B275D203D203120
        7468656E20626567696E0D0A092020204D6964506163652E466F6E742E426F6C
        64203A3D20547275653B0D0A202020202020202020696620706C507265764461
        7948485B2749734261636B446F75626C654C696E6572275D207468656E206265
        67696E0D0A092020202020204D6964506163652E466F6E742E556E6465726C69
        6E65203A3D20547275653B0D0A202020202020202020656E643B200D0A202020
        202020656E643B200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06074D696450616365094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D6506126C626C45726C506F734F6E476574546578740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C210100007072
        6F636564757265206C626C45726C506F734F6E47657454657874287661722054
        6578743A20537472696E67293B0D0A626567696E0D0A2054657874203A3D2027
        20273B0D0A20200D0A2020696620706C5072657644617948485B274561726C79
        50616365506F73275D203C3E2039393939207468656E20626567696E0D0A2020
        2020696620706C5072657644617948485B274561726C7950616365506F73275D
        203C3E2030207468656E20626567696E0D0A092020696620706C507265764461
        7948485B274561726C7950616365506F7352616E6B275D203D2031207468656E
        20626567696E0D0A0909202054657874203A3D20272A273B0D0A092020656E64
        3B0D0A20202020656E643B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506096C626C45726C506F73094576656E744E61
        6D6506094F6E47657454657874074576656E74494402350001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506126C626C4D6964506F
        734F6E476574546578740B50726F6772616D54797065070B747450726F636564
        75726506536F757263650C3E01000070726F636564757265206C626C4D696450
        6F734F6E476574546578742876617220546578743A20537472696E67293B0D0A
        626567696E0D0A54657874203A3D202720273B0D0A0D0A2020696620706C5072
        657644617948485B274D6964646C6550616365506F73275D203C3E2039393939
        207468656E20626567696E0D0A2020202020696620706C507265764461794848
        5B274D6964646C6550616365506F73275D203C3E2030207468656E2062656769
        6E0D0A2020202020202020696620706C5072657644617948485B274D6964646C
        6550616365506F7352616E6B275D203D2031207468656E20626567696E0D0A20
        2020202020202020202054657874203A3D20272A273B0D0A2020202020202020
        656E643B0D0A2020202020656E643B0D0A2020656E643B202020202020200D0A
        0D0A200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506096C626C
        4D6964506F73094576656E744E616D6506094F6E47657454657874074576656E
        74494402350001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D6506136C626C4C617465506F734F6E476574546578740B50726F677261
        6D54797065070B747450726F63656475726506536F757263650C370100007072
        6F636564757265206C626C4C617465506F734F6E476574546578742876617220
        546578743A20537472696E67293B0D0A626567696E0D0A0D0A20200D0A202054
        657874203A3D202720273B0D0A20200D0A2020696620706C5072657644617948
        485B274C61746550616365506F73275D203C3E2039393939207468656E206265
        67696E0D0A2020202020696620706C5072657644617948485B274C6174655061
        6365506F73275D203C3E2030207468656E20626567696E0D0A20202020202020
        20696620706C5072657644617948485B274C61746550616365506F7352616E6B
        275D203D2031207468656E20626567696E0D0A2009202020202054657874203A
        3D20272A273B0D0A2020202020202020656E643B0D0A2020202020656E643B0D
        0A2020656E643B0D0A0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060A6C626C4C617465506F73094576656E744E616D6506094F6E476574
        54657874074576656E74494402350001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061364657457696E576167657265644F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        636506AF70726F6365647572652064657457696E576167657265644F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A09
        696620706C5072657644617948485B274F646473275D203E2030207468656E20
        626567696E0D0A090956616C7565203A3D2056616C7565202B2020322E30303B
        0D0A09656E6420656C736520626567696E0D0A090956616C7565203A3D205661
        6C75653B0D0A09656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E616D
        65060D64657457696E57616765726564094576656E744E616D6506064F6E4361
        6C63074576656E74494402210001060F5472614576656E7448616E646C65720B
        50726F6772616D4E616D65061264657457696E5061796F75744F6E43616C630B
        50726F6772616D54797065070B747450726F63656475726506536F757263650C
        A901000070726F6365647572652064657457696E5061796F75744F6E43616C63
        287661722056616C75653A2056617269616E74293B0D0A7661720D0A664F6464
        733A20646F75626C653B0D0A665061796F75743A646F75626C653B0D0A665761
        676572416D743A646F75626C653B0D0A0D0A626567696E0D0A0D0A2020202020
        20665761676572416D74203A3D2020322E30303B0D0A202020202020664F6464
        73203A3D20706C5072657644617948485B274F646473275D3B0D0A2020202020
        20665061796F7574203A3D20303B0D0A2020200D0A09696620664F646473203E
        2030207468656E20626567696E0D0A090969662028706C507265764461794848
        5B2746696E697368506F73275D203D203129207468656E20626567696E0D0A09
        0909665061796F7574203A3D2028664F646473202A20665761676572416D7429
        202B20665761676572416D743B0D0A0909656E643B0D0A090956616C7565203A
        3D2056616C7565202B20665061796F75743B0D0A09656E6420656C7365206265
        67696E0D0A090956616C7565203A3D2056616C75653B0D0A20202009656E643B
        0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C646574
        57696E5061796F7574094576656E744E616D6506064F6E43616C63074576656E
        74494402210001060F5472614576656E7448616E646C65720B50726F6772616D
        4E616D650612646574506C635061796F75744F6E43616C630B50726F6772616D
        54797065070B747450726F63656475726506536F757263650CED01000070726F
        63656475726520646574506C635061796F75744F6E43616C6328766172205661
        6C75653A2056617269616E74293B0D0A7661720D0A664F6464733A20646F7562
        6C653B0D0A665061796F75743A646F75626C653B0D0A665761676572416D743A
        646F75626C653B0D0A0D0A626567696E0D0A0D0A202020202020665761676572
        416D74203A3D2020322E30303B0D0A202020202020664F646473203A3D202870
        6C5072657644617952485B2757696E506C635061796F7574275D202D20322E30
        3029202F20323B0D0A2020202020200D0A202020202020665061796F7574203A
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
        65070B747450726F63656475726506536F757263650CED01000070726F636564
        7572652064657453686F5061796F75744F6E43616C63287661722056616C7565
        3A2056617269616E74293B0D0A7661720D0A664F6464733A20646F75626C653B
        0D0A665061796F75743A646F75626C653B0D0A665761676572416D743A646F75
        626C653B0D0A0D0A626567696E0D0A0D0A202020202020665761676572416D74
        203A3D2020322E30303B0D0A202020202020664F646473203A3D2028706C5072
        657644617952485B2757696E53686F5061796F7574275D202D20322E30302920
        2F20323B0D0A2020202020200D0A202020202020665061796F7574203A3D2030
        3B0D0A2020200D0A09696620664F646473203E2030207468656E20626567696E
        0D0A09096966202828706C5072657644617948485B2746696E697368506F7327
        5D203E3D20312920616E642028706C5072657644617948485B2746696E697368
        506F73275D203C3D20332929207468656E20626567696E0D0A09090966506179
        6F7574203A3D2028664F646473202A20665761676572416D7429202B20665761
        676572416D743B0D0A0909656E643B0D0A090956616C7565203A3D2056616C75
        65202B20665061796F75743B0D0A09656E6420656C736520626567696E0D0A09
        0956616C7565203A3D2056616C75653B0D0A20202009656E643B0D0A2020200D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060C64657453686F506179
        6F7574094576656E744E616D6506064F6E43616C63074576656E744944022100
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        5175696E656C6C614E6272734F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F757263650C5901000070726F6365647572
        65205175696E656C6C614E6272734F6E5072696E743B0D0A626567696E090D0A
        20205175696E656C6C614E6272732E466F6E742E426F6C64203A3D2046616C73
        653B0D0A2020696620706C5072657644617952485B2749735175696E656C6C61
        4D617463686564275D203D2054727565207468656E20626567696E0D0A202020
        20205175696E656C6C614E6272732E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E643B0D0A202020200D0A2020696620706C5072657644617952
        485B27497351756952616365275D203D2054727565207468656E20626567696E
        0D0A202020202020205175696E656C6C614E6272732E56697369626C65203A3D
        20547275653B0D0A2020656E6420656C736520626567696E0D0A202020202020
        205175696E656C6C614E6272732E56697369626C65203A3D2046616C73653B0D
        0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0C5175696E656C6C614E627273094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D6506114578616374614E6272734F6E5072696E740B50726F
        6772616D54797065070B747450726F63656475726506536F757263650C4E0100
        0070726F636564757265204578616374614E6272734F6E5072696E743B0D0A62
        6567696E0D0A20204578616374614E6272732E466F6E742E426F6C64203A3D20
        46616C73653B0D0A2020696620706C5072657644617952485B27497345786163
        74614D617463686564275D203D2054727565207468656E20626567696E0D0A20
        202020204578616374614E6272732E466F6E742E426F6C64203A3D2054727565
        3B0D0A2020656E643B0D0A202020200D0A2020696620706C5072657644617952
        485B27497345786152616365275D203D2054727565207468656E20626567696E
        0D0A202020202020204578616374614E6272732E56697369626C65203A3D2054
        7275653B0D0A2020656E6420656C736520626567696E0D0A2020202020202045
        78616374614E6272732E56697369626C65203A3D2046616C73653B0D0A202065
        6E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060A45
        78616374614E627273094576656E744E616D6506074F6E5072696E7407457665
        6E74494402200001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D65061354726966656374614E6272734F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F757263650C5A01000070
        726F6365647572652054726966656374614E6272734F6E5072696E743B0D0A62
        6567696E0D0A202054726966656374614E6272732E466F6E742E426F6C64203A
        3D2046616C73653B0D0A2020696620706C5072657644617952485B2749735472
        6966656374614D617463686564275D203D2054727565207468656E2062656769
        6E0D0A202020202054726966656374614E6272732E466F6E742E426F6C64203A
        3D20547275653B0D0A2020656E643B0D0A202020200D0A2020696620706C5072
        657644617952485B27497354726952616365275D203D2054727565207468656E
        20626567696E0D0A2020202020202054726966656374614E6272732E56697369
        626C65203A3D20547275653B0D0A2020656E6420656C736520626567696E0D0A
        2020202020202054726966656374614E6272732E56697369626C65203A3D2046
        616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E
        656E744E616D65060C54726966656374614E627273094576656E744E616D6506
        074F6E5072696E74074576656E74494402200001060F5472614576656E744861
        6E646C65720B50726F6772616D4E616D650615537570657266656374614E6272
        734F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C9601000070726F63656475726520537570657266656374
        614E6272734F6E5072696E743B0D0A626567696E0D0A20205375706572666563
        74614E6272732E466F6E742E426F6C64203A3D2046616C73653B0D0A20206966
        20706C5072657644617952485B274973537570657266656374614D6174636865
        64275D203D2054727565207468656E20626567696E0D0A202020202053757065
        7266656374614E6272732E466F6E742E426F6C64203A3D20547275653B0D0A20
        20656E643B0D0A202020200D0A206966202828706C5072657644617952485B27
        4973537570657252616365275D203D20547275652920616E642028706C507265
        7644617952485B27537570657266656374615761676572416D74275D203E2030
        29297468656E20626567696E0D0A20202020202020537570657266656374614E
        6272732E56697369626C65203A3D20547275653B0D0A2020656E6420656C7365
        20626567696E0D0A20202020202020537570657266656374614E6272732E5669
        7369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E64
        3B0D0A0D436F6D706F6E656E744E616D65060E537570657266656374614E6272
        73094576656E744E616D6506074F6E5072696E74074576656E74494402200001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060C53
        757065724F6E5072696E740B50726F6772616D54797065070B747450726F6365
        6475726506536F757263650C6201000070726F6365647572652053757065724F
        6E5072696E743B0D0A626567696E0D0A202053757065722E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B2749
        7353757065724D617463686564275D203D2054727565207468656E2062656769
        6E0D0A202020202053757065722E466F6E742E426F6C64203A3D20547275653B
        0D0A2020656E643B0D0A20200D0A20206966202828706C507265764461795248
        5B274973537570657252616365275D203D20547275652920616E642028706C50
        72657644617952485B27537570657266656374615761676572416D74275D203E
        203029297468656E20626567696E0D0A202020202020202053757065722E5669
        7369626C65203A3D20547275653B0D0A2020656E6420656C736520626567696E
        0D0A2020202020202053757065722E56697369626C65203A3D2046616C73653B
        0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
        06055375706572094576656E744E616D6506074F6E5072696E74074576656E74
        494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
        616D65060A5472694F6E5072696E740B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C2901000070726F636564757265205472
        694F6E5072696E743B0D0A626567696E0D0A20205472692E466F6E742E426F6C
        64203A3D2046616C73653B0D0A2020696620706C5072657644617952485B2749
        735472694D617463686564275D203D2054727565207468656E20626567696E0D
        0A20202020205472692E466F6E742E426F6C64203A3D20547275653B0D0A2020
        656E643B0D0A20200D0A20200D0A20696620706C5072657644617952485B2749
        7354726952616365275D203D2054727565207468656E20626567696E0D0A2020
        20202020205472692E56697369626C65203A3D20547275653B0D0A2020656E64
        20656C736520626567696E0D0A202020202020205472692E56697369626C6520
        3A3D2046616C73653B0D0A2020656E643B0D0A0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D650603547269094576656E744E616D6506074F6E5072
        696E74074576656E74494402200001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060D4578616374614F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F757263650C3A010000
        70726F636564757265204578616374614F6E5072696E743B0D0A626567696E0D
        0A20204578616374612E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20696620706C5072657644617952485B2749734578614D617463686564275D20
        3D2054727565207468656E20626567696E0D0A20202020204578616374612E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A20200D0A20
        200D0A20696620706C5072657644617952485B27497345786152616365275D20
        3D2054727565207468656E20626567696E0D0A20202020202020457861637461
        2E56697369626C65203A3D20547275653B0D0A2020656E6420656C7365206265
        67696E0D0A202020202020204578616374612E56697369626C65203A3D204661
        6C73653B0D0A2020656E643B0D0A0D0A0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D650606457861637461094576656E744E616D6506074F6E5072
        696E74074576656E74494402200001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060F5175696E656C6C614F6E5072696E740B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C4001
        000070726F636564757265205175696E656C6C614F6E5072696E743B0D0A6265
        67696E0D0A20205175696E656C6C612E466F6E742E426F6C64203A3D2046616C
        73653B0D0A2020696620706C5072657644617952485B2749735175694D617463
        686564275D203D2054727565207468656E20626567696E0D0A20202020205175
        696E656C6C612E466F6E742E426F6C64203A3D20547275653B0D0A2020656E64
        3B0D0A20200D0A20200D0A20696620706C5072657644617952485B2749735175
        6952616365275D203D2054727565207468656E20626567696E0D0A2020202020
        20205175696E656C6C612E56697369626C65203A3D20547275653B0D0A202065
        6E6420656C736520626567696E0D0A202020202020205175696E656C6C612E56
        697369626C65203A3D2046616C73653B0D0A2020656E643B0D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D6506085175696E656C6C61094576656E74
        4E616D6506074F6E5072696E74074576656E74494402200001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D6506115761676572416D74
        4F6E476574546578740B50726F6772616D54797065070B747450726F63656475
        726506536F75726365065470726F636564757265205761676572416D744F6E47
        6574546578742876617220546578743A20537472696E67293B0D0A626567696E
        0D0A0D0A202054657874203A3D2027322E3030273B0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506085761676572416D74094576656E744E616D
        6506094F6E47657454657874074576656E74494402350001060F547261457665
        6E7448616E646C65720B50726F6772616D4E616D650614506C63576167657241
        6D744F6E476574546578740B50726F6772616D54797065070B747450726F6365
        6475726506536F75726365065770726F63656475726520506C63576167657241
        6D744F6E476574546578742876617220546578743A20537472696E67293B0D0A
        626567696E0D0A0D0A202054657874203A3D2027322E3030273B0D0A0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060B506C635761676572416D7409
        4576656E744E616D6506094F6E47657454657874074576656E74494402350001
        060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061453
        686F5761676572416D744F6E476574546578740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365065770726F6365647572652053
        686F5761676572416D744F6E476574546578742876617220546578743A205374
        72696E67293B0D0A626567696E0D0A0D0A202054657874203A3D2027322E3030
        273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060B53686F57
        61676572416D74094576656E744E616D6506094F6E4765745465787407457665
        6E74494402350001060F5472614576656E7448616E646C65720B50726F677261
        6D4E616D6506114B535031737443616C6C4F6E5072696E740B50726F6772616D
        54797065070B747450726F63656475726506536F757263650CE401000070726F
        636564757265204B535031737443616C6C4F6E5072696E743B0D0A626567696E
        0D0A0D0A202020202020696620706C5072657644617948485B274B5350317374
        43616C6C275D203D2039393939207468656E20626567696E0D0A202020202020
        2020204B535031737443616C6C2E56697369626C65203A3D2046616C73653B0D
        0A202020202020656E6420656C736520626567696E0D0A202020202020202020
        4B535031737443616C6C2E56697369626C65203A3D20547275653B0D0A202020
        202020656E643B0D0A2020202020200D0A2020202020200D0A09696620706C50
        72657644617948485B274B535031737443616C6C52616E6B275D203D20312074
        68656E20626567696E0D0A2020202020202020204B535031737443616C6C2E46
        6F6E742E426F6C64203A3D20547275653B0D0A2020202020202020204B535031
        737443616C6C2E466F6E742E556E6465726C696E65203A3D20547275653B0D0A
        202020202020656E6420656C736520626567696E0D0A2020202020202020204B
        535031737443616C6C2E466F6E742E426F6C64203A3D2046616C73653B0D0A20
        20202020202020204B535031737443616C6C2E466F6E742E556E6465726C696E
        65203A3D2046616C73653B0D0A202020202020656E643B0D0A0D0A656E643B0D
        0A0D436F6D706F6E656E744E616D65060A4B535031737443616C6C094576656E
        744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
        76656E7448616E646C65720B50726F6772616D4E616D65060F7661724550534F
        6E476574546578740B50726F6772616D54797065070B747450726F6365647572
        6506536F757263650C1501000070726F636564757265207661724550534F6E47
        6574546578742876617220546578743A20537472696E67293B0D0A626567696E
        0D0A0D0A20202069662028706C5072657644617948485B275153503173744361
        6C6C275D203E203029207468656E20626567696E0D0A20200954657874203A3D
        20706C5072657644617948485B2751535031737443616C6C52756E5374796C65
        275D202B20272D27202B20496E74546F53747228706C5072657644617948485B
        2751535031737443616C6C275D293B0D0A2020656E6420656C73652062656769
        6E0D0A0954657874203A3D20706C5072657644617948485B2751535031737443
        616C6C52756E5374796C65275D3B0D0A2020656E643B20200D0A0D0A656E643B
        0D0A0D436F6D706F6E656E744E616D650606766172455053094576656E744E61
        6D6506094F6E47657454657874074576656E74494402350001060F5472614576
        656E7448616E646C65720B50726F6772616D4E616D65060D7661724550534F6E
        5072696E740B50726F6772616D54797065070B747450726F6365647572650653
        6F757263650C2101000070726F636564757265207661724550534F6E5072696E
        743B0D0A626567696E0D0A2020696620706C5072657644617948485B27515350
        31737443616C6C52616E6B275D203D2031207468656E20626567696E0D0A2020
        202020202020207661724550532E466F6E742E426F6C64203A3D20547275653B
        0D0A2020202020202020207661724550532E466F6E742E556E6465726C696E65
        203A3D20547275653B0D0A202020202020656E6420656C736520626567696E0D
        0A2020202020202020207661724550532E466F6E742E426F6C64203A3D204661
        6C73653B0D0A2020202020202020207661724550532E466F6E742E556E646572
        6C696E653A3D2046616C73653B0D0A202020202020656E643B0D0A2020202020
        200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506067661724550
        53094576656E744E616D6506074F6E5072696E74074576656E74494402200000}
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
    OnNewRecord = tblPrevDayRHNewRecord
    DatabaseName = 'dbLinerWagerResultsReport'
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
    Left = 280
    Top = 225
  end
end
