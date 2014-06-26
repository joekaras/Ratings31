object TipReportForm: TTipReportForm
  Left = 249
  Top = 165
  Width = 703
  Height = 360
  HorzScrollBar.Position = 161
  Caption = 'Tip Sheet Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object pnlPrgBar: TPanel
    Left = -155
    Top = 17
    Width = 842
    Height = 51
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 9
      Top = 14
      Width = 823
      Height = 19
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = -161
    Top = 280
    Width = 856
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = -147
    Top = 75
    Width = 842
    Height = 51
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbTipSheets: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbTipSheets'
    Directory = 'd:\RatingsData31'
    KeepConnection = False
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 208
    Top = 144
  end
  object ppTipSheetReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Dell Laser Printer 1700n'
    PrinterSetup.mmMarginBottom = 23
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'C:\Ratings31\ValueSheet.rtm'
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
    Left = 280
    Top = 8
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 20320
      mmPrintPosition = 53
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'LatePaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 193252
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object lblErlPace: TppLabel
        UserName = 'lblPowerOrder2'
        AutoSize = False
        Caption = 'Early:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 128694
        mmTop = 1058
        mmWidth = 5927
        BandType = 4
      end
      object ErlPaceSheetOrder: TppDBText
        UserName = 'ErlPaceSheetOrder'
        AutoSize = True
        DataField = 'ErlPaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 137160
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object lblMidPace: TppLabel
        UserName = 'lblMidPace'
        Caption = 'Mid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 157269
        mmTop = 1058
        mmWidth = 4784
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'MidPaceSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 164465
        mmTop = 1058
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label3'
        Caption = 'Late:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 184785
        mmTop = 1058
        mmWidth = 5588
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Power:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 97579
        mmTop = 1058
        mmWidth = 7832
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RaceNbr'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 12912
        mmTop = 847
        mmWidth = 1439
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'Surface'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 17780
        mmTop = 847
        mmWidth = 1863
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DistanceDesc'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 22648
        mmTop = 847
        mmWidth = 3768
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.200000047683716000
        mmHeight = 212
        mmLeft = 0
        mmTop = 0
        mmWidth = 215900
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'RaceDesc'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 22648
        mmTop = 5927
        mmWidth = 11853
        BandType = 4
      end
      object txtDebut: TppDBText
        UserName = 'txtDebut'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrDebutStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 67987
        mmTop = 5715
        mmWidth = 18161
        BandType = 4
      end
      object txtDebutTurf: TppDBText
        UserName = 'txtDebutTurf'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrTurfDebutStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 75692
        mmTop = 5715
        mmWidth = 22310
        BandType = 4
      end
      object txtSts: TppDBText
        UserName = 'txtSts'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'NbrStarters'
        DataPipeline = plRacesReport
        DisplayFormat = '##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 72348
        mmTop = 5715
        mmWidth = 1312
        BandType = 4
      end
      object Starters: TppLabel
        UserName = 'Starters'
        Caption = 'Starters'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 57785
        mmTop = 5715
        mmWidth = 8890
        BandType = 4
      end
      object lblDebut: TppLabel
        UserName = 'lblDebut'
        Caption = 'Debut'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3387
        mmLeft = 74718
        mmTop = 5715
        mmWidth = 6350
        BandType = 4
      end
      object lblDebutTurf: TppLabel
        UserName = 'lblDebutTurf'
        Caption = 'Turf'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3387
        mmLeft = 86995
        mmTop = 5715
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label5'
        Caption = 'R#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 8890
        mmTop = 847
        mmWidth = 3387
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'TrkCode'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 1693
        mmTop = 847
        mmWidth = 5207
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'txtDebut1'
        AutoSize = True
        DataField = 'BetLine'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 2879
        mmLeft = 423
        mmTop = 16298
        mmWidth = 99949
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'EstTimeOfRace'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3725
        mmLeft = 1905
        mmTop = 5927
        mmWidth = 15071
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Starters1'
        Caption = '1st'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 4868
        mmLeft = 2117
        mmTop = 10795
        mmWidth = 6138
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = '4th'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 4868
        mmLeft = 47202
        mmTop = 10795
        mmWidth = 6138
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = '2nd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 4868
        mmLeft = 17145
        mmTop = 10795
        mmWidth = 6138
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Hospital'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3260
        mmLeft = 57362
        mmTop = 423
        mmWidth = 9229
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'WagerSheetOrder1'
        AutoSize = True
        DataField = 'TodaysWagerOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 69850
        mmTop = 423
        mmWidth = 11684
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'WagerSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3387
        mmLeft = 107315
        mmTop = 1058
        mmWidth = 20955
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Early Pos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 121920
        mmTop = 8678
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'ErlPaceSheetOrder2'
        AutoSize = True
        DataField = 'ErlPacePosSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 137160
        mmTop = 8678
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'lblMidPace1'
        Caption = 'Mid:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3175
        mmLeft = 157269
        mmTop = 8678
        mmWidth = 4868
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MidPacePosSheetOrder'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 3302
        mmLeft = 164465
        mmTop = 8678
        mmWidth = 7535
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label7'
        Caption = '3rd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        mmHeight = 4657
        mmLeft = 32173
        mmTop = 10795
        mmWidth = 6138
        BandType = 4
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TrkCode'
      DataPipeline = plRacesReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plRacesReport'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText5'
          DataField = 'TrkCode'
          DataPipeline = plRacesReport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Narrow'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRacesReport'
          mmHeight = 4233
          mmLeft = 78581
          mmTop = 0
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'RaceDate'
          DataPipeline = plRacesReport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial Narrow'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plRacesReport'
          mmHeight = 4233
          mmLeft = 104511
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        7478744465627574547572664F6E5072696E740B50726F6772616D5479706507
        0B747450726F63656475726506536F7572636506D970726F6365647572652074
        78744465627574547572664F6E5072696E743B0D0A626567696E0D0A69662028
        706C52616365735265706F72745B2753757266616365275D203D202754272920
        2020202020207468656E20626567696E0D0A2020202020202074787444656275
        74547572662E56697369626C65203A3D20547275653B0D0A20202020656E6420
        656C736520626567696E0D0A202020202020207478744465627574547572662E
        56697369626C65203A3D2046616C73653B2020200D0A0D0A20202020656E643B
        0D0A20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C7478
        74446562757454757266094576656E744E616D6506074F6E5072696E74074576
        656E74494402200001060F5472614576656E7448616E646C65720B50726F6772
        616D4E616D6506136C626C4465627574547572664F6E5072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506D870726F
        636564757265206C626C4465627574547572664F6E5072696E743B0D0A626567
        696E0D0A2069662028706C52616365735265706F72745B275375726661636527
        5D203D2027542729202020202020207468656E20626567696E0D0A2020202020
        20206C626C4465627574547572662E56697369626C65203A3D20547275653B0D
        0A20202020656E6420656C736520626567696E0D0A202020202020206C626C44
        65627574547572662E56697369626C65203A3D2046616C73653B2020200D0A0D
        0A20202020656E643B0D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D65060C6C626C446562757454757266094576656E744E616D6506074F6E50
        72696E74074576656E74494402200001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65060F6C626C44656275744F6E5072696E740B50
        726F6772616D54797065070B747450726F63656475726506536F7572636506F5
        70726F636564757265206C626C44656275744F6E5072696E743B0D0A62656769
        6E0D0A0D0A69662028706C52616365735265706F72745B275261636554797065
        275D203D20274D5357272920206F720D0A20202020202028706C526163657352
        65706F72745B275261636554797065275D203D20274D434C2729207468656E20
        626567696E0D0A202020202020206C626C44656275742E56697369626C65203A
        3D20547275653B0D0A20202020656E6420656C736520626567696E0D0A202020
        202020206C626C44656275742E56697369626C65203A3D2046616C73653B2020
        200D0A0D0A20202020656E643B0D0A656E643B0D0A0D436F6D706F6E656E744E
        616D6506086C626C4465627574094576656E744E616D6506074F6E5072696E74
        074576656E74494402200001060F5472614576656E7448616E646C65720B5072
        6F6772616D4E616D65060F74787444656275744F6E5072696E740B50726F6772
        616D54797065070B747450726F63656475726506536F7572636506FB70726F63
        65647572652074787444656275744F6E5072696E743B0D0A626567696E0D0A0D
        0A69662028706C52616365735265706F72745B275261636554797065275D203D
        20274D5357272920206F720D0A20202020202028706C52616365735265706F72
        745B275261636554797065275D203D20274D434C2729207468656E2062656769
        6E0D0A2020202020202074787444656275742E56697369626C65203A3D205472
        75653B0D0A20202020656E6420656C736520626567696E0D0A20202020202020
        74787444656275742E56697369626C65203A3D2046616C73653B2020200D0A0D
        0A20202020656E643B0D0A202020200D0A656E643B0D0A0D436F6D706F6E656E
        744E616D6506087478744465627574094576656E744E616D6506074F6E507269
        6E74074576656E74494402200000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTipSheets'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race.DAT'
    Left = 536
    Top = 184
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 608
    Top = 232
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 536
    Top = 113
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 24
    Top = 184
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 24
    Top = 248
  end
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbTipSheets'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByCT'
    TableName = 'Race'
    Left = 40
    Top = 88
  end
end
