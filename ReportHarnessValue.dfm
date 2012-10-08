object HarnessValueReportForm: THarnessValueReportForm
  Left = 260
  Top = 258
  Width = 701
  Height = 393
  Caption = 'Value Sheet Report'
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
    Top = 339
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
  object dbHarnessValueReport: TDBISAMDatabase
    EngineVersion = '4.20 Build 3'
    Connected = True
    DatabaseName = 'dbHarnessValueReport'
    Directory = 'c:\BuggyData'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 336
    Top = 16
  end
  object ppHarnessValueReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1323
    PrinterSetup.mmMarginLeft = 1323
    PrinterSetup.mmMarginRight = 1323
    PrinterSetup.mmMarginTop = 1323
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\Ratings31\HarnessValue.rtm'
    Template.Format = ftASCII
    Units = utScreenPixels
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'ReportTextFile'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 248
    Top = 136
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23918
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 5786
        mmLeft = 135997
        mmTop = 0
        mmWidth = 18415
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Albatross Form'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5680
        mmLeft = 93769
        mmTop = 0
        mmWidth = 29951
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5080
        mmLeft = 179282
        mmTop = 0
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Of'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5045
        mmLeft = 197380
        mmTop = 0
        mmWidth = 4692
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5045
        mmLeft = 206658
        mmTop = 0
        mmWidth = 2364
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2963
        mmLeft = 1693
        mmTop = 17357
        mmWidth = 4022
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
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 6773
        mmTop = 20320
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'DRIVER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 53763
        mmTop = 14605
        mmWidth = 9102
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
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 113665
        mmTop = 21378
        mmWidth = 3598
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
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 33443
        mmTop = 14605
        mmWidth = 12277
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = '------PACE STYLE -----'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 91440
        mmTop = 17992
        mmWidth = 17568
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'RATING'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 65405
        mmTop = 17992
        mmWidth = 6562
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'W%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 60325
        mmTop = 17992
        mmWidth = 3598
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
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 147532
        mmTop = 17992
        mmWidth = 65617
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'SIRE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 121709
        mmTop = 14605
        mmWidth = 4022
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'MED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 6773
        mmTop = 17357
        mmWidth = 3810
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'lblERL'
        Caption = '2Q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 99060
        mmTop = 21378
        mmWidth = 2328
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'lblSTR'
        Caption = 'FIN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 109009
        mmTop = 21378
        mmWidth = 2752
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lblMID'
        Caption = '3Q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 104352
        mmTop = 21378
        mmWidth = 2328
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'STS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2328
        mmLeft = 76200
        mmTop = 18203
        mmWidth = 3387
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'SPD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 81703
        mmTop = 21378
        mmWidth = 3598
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        AutoSize = False
        Caption = '1Q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 93134
        mmTop = 21378
        mmWidth = 2963
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'PP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 135467
        mmTop = 21167
        mmWidth = 2328
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'CLS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2540
        mmLeft = 86572
        mmTop = 21378
        mmWidth = 3598
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'TRN/DRV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 71120
        mmTop = 14393
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'STS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 53763
        mmTop = 17992
        mmWidth = 4868
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'W%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 75988
        mmTop = 21378
        mmWidth = 3598
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'STS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 33443
        mmTop = 17992
        mmWidth = 5715
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'W%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 39793
        mmTop = 17992
        mmWidth = 5292
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'RATING'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 45932
        mmTop = 17992
        mmWidth = 6562
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'EQUIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 11430
        mmTop = 17357
        mmWidth = 5503
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'CLASS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 17568
        mmTop = 17357
        mmWidth = 4022
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'LST 6 ERN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 23707
        mmTop = 17357
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'W%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 122132
        mmTop = 21378
        mmWidth = 3598
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label301'
        AutoSize = False
        Caption = 'VALUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 127000
        mmTop = 17992
        mmWidth = 7620
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'PP  RTG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2540
        mmLeft = 127635
        mmTop = 21378
        mmWidth = 6985
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Class'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 154729
        mmTop = 21167
        mmWidth = 4445
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'TRK'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 148379
        mmTop = 21167
        mmWidth = 3598
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'TRAINER LAST RACE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 33443
        mmTop = 21378
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        AutoSize = False
        Caption = 'DRIVER LAST RACE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2540
        mmLeft = 53763
        mmTop = 21378
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Time'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 192405
        mmTop = 21167
        mmWidth = 3810
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label401'
        Caption = '4Q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 197909
        mmTop = 21167
        mmWidth = 2328
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Finish'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 203200
        mmTop = 21167
        mmWidth = 4657
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Odds'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 208915
        mmTop = 21167
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Comment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2752
        mmLeft = 174625
        mmTop = 21167
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'STS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial Narrow'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2469
        mmLeft = 122344
        mmTop = 17992
        mmWidth = 3387
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
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'plEntries'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 213254
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
          PrinterSetup.mmMarginBottom = 1323
          PrinterSetup.mmMarginLeft = 1323
          PrinterSetup.mmMarginRight = 1323
          PrinterSetup.mmMarginTop = 1323
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.Format = ftASCII
          Units = utScreenPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 266701
          DataPipelineName = 'plEntries'
          object ppTitleBand12: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
            object ppShape9: TppShape
              UserName = 'Shape9'
              ParentWidth = True
              mmHeight = 4445
              mmLeft = 0
              mmTop = 3810
              mmWidth = 213254
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 212
              mmLeft = 0
              mmTop = 8255
              mmWidth = 213254
              BandType = 1
            end
            object ppDBText41: TppDBText
              UserName = 'DBText41'
              AutoSize = True
              DataField = 'RaceNbr'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 9031
              mmTop = 0
              mmWidth = 11924
              BandType = 1
            end
            object ppDBText42: TppDBText
              UserName = 'DBText42'
              AutoSize = True
              DataField = 'EstTimeOfRace'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 139700
              mmTop = 0
              mmWidth = 21449
              BandType = 1
            end
            object ppDBText43: TppDBText
              UserName = 'DBText43'
              AutoSize = True
              DataField = 'Purse'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 77047
              mmTop = 0
              mmWidth = 8079
              BandType = 1
            end
            object ppDBText44: TppDBText
              UserName = 'DBText44'
              AutoSize = True
              DataField = 'Distance'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 53763
              mmTop = 0
              mmWidth = 12100
              BandType = 1
            end
            object ppDBText45: TppDBText
              UserName = 'DBText45'
              AutoSize = True
              DataField = 'Gait'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 65828
              mmTop = 0
              mmWidth = 5644
              BandType = 1
            end
            object ppDBText46: TppDBText
              UserName = 'DBText46'
              AutoSize = True
              DataField = 'ClassRating'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4092
              mmLeft = 107950
              mmTop = 0
              mmWidth = 16757
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label7'
              Caption = 'RACE#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4022
              mmLeft = 7197
              mmTop = 0
              mmWidth = 9737
              BandType = 1
            end
            object ppDBMemo1: TppDBMemo
              UserName = 'RaceConditions1'
              CharWrap = False
              DataField = 'WagerInfo'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taFullJustified
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 3810
              mmLeft = 212
              mmTop = 4233
              mmWidth = 213149
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'TrkFullName'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 10
              Font.Style = [fsBold]
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4022
              mmLeft = 23283
              mmTop = 0
              mmWidth = 25188
              BandType = 1
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
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
              mmHeight = 4092
              mmLeft = 0
              mmTop = 0
              mmWidth = 11748
              BandType = 1
            end
          end
          object aDetailBand: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8678
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 124249
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentWidth = True
              Position = lpBottom
              ShiftWithParent = True
              Weight = 0.750000000000000000
              mmHeight = 847
              mmLeft = 0
              mmTop = 7832
              mmWidth = 213254
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 111125
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 89324
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 31115
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Pen.Width = 0
              Position = lpLeft
              Weight = 0.200000002980232200
              mmHeight = 8255
              mmLeft = 78528
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 117264
              mmTop = 0
              mmWidth = 635
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'ProgramNbr'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 4868
              mmLeft = 0
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 5080
              mmTop = 2963
              mmWidth = 25400
              BandType = 4
            end
            object Trainer: TppDBText
              UserName = 'Trainer'
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2928
              mmLeft = 31750
              mmTop = 0
              mmWidth = 19262
              BandType = 4
            end
            object Driver: TppDBText
              UserName = 'Driver'
              DataField = 'Driver'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2928
              mmLeft = 51858
              mmTop = 0
              mmWidth = 19262
              BandType = 4
            end
            object TrnStarts: TppDBText
              UserName = 'TrnStarts'
              DataField = 'TrnStarts'
              DataPipeline = plEntries
              DisplayFormat = '###0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 31750
              mmTop = 3175
              mmWidth = 5715
              BandType = 4
            end
            object TrnDrvStarts: TppDBText
              UserName = 'TrnDrvStarts'
              DataField = 'TrnDrvStarts'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 72602
              mmTop = 0
              mmWidth = 5292
              BandType = 4
            end
            object TrnDrvWinPct: TppDBText
              UserName = 'TrnDrvWinPct'
              DataField = 'TrnDrvWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 72602
              mmTop = 3598
              mmWidth = 5292
              BandType = 4
            end
            object AvgClass: TppDBText
              UserName = 'AvgClass'
              BlankWhenZero = True
              DataField = 'AvgClass'
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
              mmLeft = 84455
              mmTop = 0
              mmWidth = 4022
              BandType = 4
            end
            object AvgSpeed: TppDBText
              UserName = 'AvgSpeed'
              BlankWhenZero = True
              DataField = 'AvgSpeed'
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
              mmLeft = 79375
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object SireStarts: TppDBText
              UserName = 'SireStarts'
              DataField = 'SireStarts'
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
              mmLeft = 118322
              mmTop = 0
              mmWidth = 5715
              BandType = 4
            end
            object SireWinPct: TppDBText
              UserName = 'SireWinPct'
              DataField = 'SireWinPct'
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
              mmLeft = 118322
              mmTop = 3598
              mmWidth = 5715
              BandType = 4
            end
            object TrnWinPct: TppDBText
              UserName = 'TrnWinPct'
              DataField = 'TrnWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 38100
              mmTop = 3175
              mmWidth = 5292
              BandType = 4
            end
            object TrnUTR: TppDBText
              UserName = 'TrnUTR'
              DataField = 'TrnUTR'
              DataPipeline = plEntries
              DisplayFormat = '0.000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 44662
              mmTop = 3175
              mmWidth = 6350
              BandType = 4
            end
            object MorningLineDesc: TppDBText
              UserName = 'MorningLineDesc'
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3387
              mmLeft = 111549
              mmTop = 0
              mmWidth = 5503
              BandType = 4
            end
            object DrvStarts: TppDBText
              UserName = 'DrvStarts'
              DataField = 'DrvStarts'
              DataPipeline = plEntries
              DisplayFormat = '###0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 51858
              mmTop = 3175
              mmWidth = 5715
              BandType = 4
            end
            object DrvUDR: TppDBText
              UserName = 'DrvUDR'
              DataField = 'DrvUDR'
              DataPipeline = plEntries
              DisplayFormat = '0.000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 64770
              mmTop = 3175
              mmWidth = 6350
              BandType = 4
            end
            object DrvWinPct: TppDBText
              UserName = 'DrvWinPct'
              DataField = 'DrvWinPct'
              DataPipeline = plEntries
              DisplayFormat = '##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2752
              mmLeft = 58843
              mmTop = 3175
              mmWidth = 5292
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'Med'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 5080
              mmTop = 0
              mmWidth = 3810
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'Equip'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 9737
              mmTop = 0
              mmWidth = 5503
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'ClassChange'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 15875
              mmTop = 0
              mmWidth = 5927
              BandType = 4
            end
            object Last6Earnings: TppDBText
              UserName = 'Last6Earnings'
              BlankWhenZero = True
              DataField = 'Last6Earnings'
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
              mmLeft = 23072
              mmTop = 0
              mmWidth = 7408
              BandType = 4
            end
            object PaceStyle1stQ: TppDBText
              UserName = 'PaceStyle1stQ'
              BlankWhenZero = True
              DataField = 'PaceStyle1stQ'
              DataPipeline = plEntries
              DisplayFormat = '#0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 89959
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object PaceStyle2ndQ: TppDBText
              UserName = 'PaceStyle2ndQ'
              BlankWhenZero = True
              DataField = 'PaceStyle2ndQ'
              DataPipeline = plEntries
              DisplayFormat = '#0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 95250
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object PaceStyle3rdQ: TppDBText
              UserName = 'PaceStyle3rdQ'
              BlankWhenZero = True
              DataField = 'PaceStyle3rdQ'
              DataPipeline = plEntries
              DisplayFormat = '#0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 100542
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object PaceStyleFinish: TppDBText
              UserName = 'PaceStyleFinish'
              BlankWhenZero = True
              DataField = 'PaceStyleFinish'
              DataPipeline = plEntries
              DisplayFormat = '0.0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 105622
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText302'
              DataField = 'Race1BackRaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 133774
              mmTop = 0
              mmWidth = 79587
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Pen.Width = 0
              Position = lpLeft
              Weight = 0.200000002980232200
              mmHeight = 8467
              mmLeft = 71755
              mmTop = 0
              mmWidth = 423
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Pen.Width = 0
              Position = lpLeft
              Weight = 0.200000002980232200
              mmHeight = 8467
              mmLeft = 51435
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object FinalValueBet: TppDBText
              UserName = 'FinalValueBet'
              DataField = 'FinalValueBet'
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
              mmLeft = 129117
              mmTop = 0
              mmWidth = 3810
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 8678
              mmLeft = 133350
              mmTop = 0
              mmWidth = 212
              BandType = 4
            end
            object WinIndex: TppDBText
              UserName = 'WinIndex'
              DataField = 'WinIndex'
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
              mmLeft = 129117
              mmTop = 3598
              mmWidth = 3810
              BandType = 4
            end
            object ValueIndicator: TppDBText
              UserName = 'ValueIndicator'
              DataField = 'ValueIndicator'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              Visible = False
              DataPipelineName = 'plEntries'
              mmHeight = 2963
              mmLeft = 125095
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'WinIndex1'
              BlankWhenZero = True
              DataField = 'PostPos'
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
              mmLeft = 125095
              mmTop = 3598
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'Race2BackRaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 133774
              mmTop = 2963
              mmWidth = 79163
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'Race3BackRaceDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 5
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 1905
              mmLeft = 133774
              mmTop = 5715
              mmWidth = 79163
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'Trainer1'
              DataField = 'Race1BackTrainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2469
              mmLeft = 31750
              mmTop = 6138
              mmWidth = 19262
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'Race1BackDriver'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2469
              mmLeft = 51858
              mmTop = 6138
              mmWidth = 19262
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'Wager'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 2540
              mmLeft = 5503
              mmTop = 5927
              mmWidth = 10372
              BandType = 4
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650617
              56616C7565496E64696361746F724F6E476574546578740B50726F6772616D54
              797065070B747450726F63656475726506536F757263650C3802000070726F63
              65647572652056616C7565496E64696361746F724F6E47657454657874287661
              7220546578743A20537472696E67293B0D0A626567696E0D0A0D0A2020546578
              74203A3D202720273B0D0A202056616C7565496E64696361746F722E56697369
              626C65203A3D2046616C73653B0D0A20200D0A2020696620706C456E74726965
              735B2746696E616C56616C7565426574275D203E3D20312E303020207468656E
              20626567696E0D0A2020202020696620706C456E74726965735B2756616C7565
              496E64696361746F72275D203D20272B27207468656E20626567696E0D0A2020
              20202020202056616C7565496E64696361746F722E56697369626C65203A3D20
              547275653B0D0A202020202020202054657874203A3D202724273B0D0A202020
              2020656E643B0D0A2020202020696620706C456E74726965735B2756616C7565
              496E64696361746F72275D203D20274C27207468656E20626567696E0D0A2020
              20202020202056616C7565496E64696361746F722E56697369626C65203A3D20
              547275653B0D0A202020202020202054657874203A3D202724273B0D0A202020
              2020656E643B0D0A2020202020696620706C456E74726965735B2756616C7565
              496E64696361746F72275D203D20274227207468656E20626567696E0D0A0920
              2056616C7565496E64696361746F722E56697369626C65203A3D20547275653B
              0D0A202020202020202054657874203A3D20272424273B0D0A2020202020656E
              643B0D0A2020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D65060E56616C7565496E64696361746F72094576656E744E616D6506094F6E
              47657454657874074576656E74494402350001060F5472614576656E7448616E
              646C65720B50726F6772616D4E616D65060D54726E5554524F6E5072696E740B
              50726F6772616D54797065070B747450726F63656475726506536F7572636506
              F770726F6365647572652054726E5554524F6E5072696E743B0D0A626567696E
              0D0A0D0A20202054726E5554522E466F6E742E426F6C64203A3D2046616C7365
              3B0D0A20202054726E5554522E466F6E742E556E6465726C696E65203A3D2046
              616C73653B0D0A20202020200D0A202020696620706C456E74726965735B2754
              726E55545252616E6B275D203D2031207468656E20626567696E0D0A20202020
              202054726E5554522E466F6E742E426F6C64203A3D20547275653B0D0A202020
              20202054726E5554522E466F6E742E556E6465726C696E65203A3D2046616C73
              653B0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D65060654726E555452094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D65061054726E57696E5063744F6E5072696E740B50726F
              6772616D54797065070B747450726F63656475726506536F757263650C080100
              0070726F6365647572652054726E57696E5063744F6E5072696E743B0D0A6265
              67696E0D0A0D0A202054726E57696E5063742E466F6E742E426F6C64203A3D20
              46616C73653B0D0A202054726E57696E5063742E466F6E742E556E6465726C69
              6E65203A3D2046616C73653B0D0A202020200D0A202020696620706C456E7472
              6965735B2754726E55545252616E6B275D203D2031207468656E20626567696E
              0D0A20202020202054726E57696E5063742E466F6E742E426F6C64203A3D2054
              7275653B0D0A20202020202054726E57696E5063742E466F6E742E556E646572
              6C696E65203A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A2020
              200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060954726E57696E50
              6374094576656E744E616D6506074F6E5072696E74074576656E744944022000
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650616
              4D6F726E696E674C696E65446573634F6E5072696E740B50726F6772616D5479
              7065070B747450726F63656475726506536F7572636506C570726F6365647572
              65204D6F726E696E674C696E65446573634F6E5072696E743B0D0A626567696E
              0D0A0D0A2020204D6F726E696E674C696E65446573632E466F6E742E426F6C64
              203A3D2046616C73653B0D0A202020696620706C456E74726965735B274D6F72
              6E696E674C696E65546F3152616E6B275D203D2031207468656E20626567696E
              0D0A2020202020204D6F726E696E674C696E65446573632E466F6E742E426F6C
              64203A3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F
              6D706F6E656E744E616D65060F4D6F726E696E674C696E654465736309457665
              6E744E616D6506074F6E5072696E74074576656E74494402200001060F547261
              4576656E7448616E646C65720B50726F6772616D4E616D65060D447276554452
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F7572636506F770726F636564757265204472765544524F6E5072696E74
              3B0D0A626567696E0D0A0D0A2020204472765544522E466F6E742E426F6C6420
              3A3D2046616C73653B0D0A2020204472765544522E466F6E742E556E6465726C
              696E65203A3D2046616C73653B0D0A2020202020200D0A202020696620706C45
              6E74726965735B2744727655445252616E6B275D203D2031207468656E206265
              67696E0D0A2020202020204472765544522E466F6E742E426F6C64203A3D2054
              7275653B0D0A2020202020204472765544522E466F6E742E556E6465726C696E
              65203A3D2046616C73653B0D0A202020656E643B0D0A0D0A0D0A656E643B0D0A
              0D436F6D706F6E656E744E616D650606447276554452094576656E744E616D65
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D65061044727657696E5063744F6E50
              72696E740B50726F6772616D54797065070B747450726F63656475726506536F
              757263650C1101000070726F6365647572652044727657696E5063744F6E5072
              696E743B0D0A626567696E0D0A0D0A20202044727657696E5063742E466F6E74
              2E426F6C64203A3D2046616C73653B0D0A20202044727657696E5063742E466F
              6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020202020202020
              200D0A202020696620706C456E74726965735B2744727655445252616E6B275D
              203D2031207468656E20626567696E0D0A20202020202044727657696E506374
              2E466F6E742E426F6C64203A3D20547275653B0D0A2020202020204472765769
              6E5063742E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A20
              2020656E643B0D0A2020200D0A2020200D0A0D0A656E643B0D0A0D436F6D706F
              6E656E744E616D65060944727657696E506374094576656E744E616D6506074F
              6E5072696E74074576656E74494402200001060F5472614576656E7448616E64
              6C65720B50726F6772616D4E616D6506144C617374364561726E696E67734F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F7572636506C370726F636564757265204C617374364561726E696E67734F6E
              5072696E743B0D0A626567696E0D0A0D0A2020204C617374364561726E696E67
              732E466F6E742E426F6C64203A3D2046616C73653B0D0A202020696620706C45
              6E74726965735B274C617374364561726E696E677352616E6B275D203D203120
              7468656E20626567696E0D0A2020202020204C617374364561726E696E67732E
              466F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A202020
              0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D4C6173743645
              61726E696E6773094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D650614506163655374796C65317374514F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F757263650C5B0200007072
              6F63656475726520506163655374796C65317374514F6E5072696E743B0D0A62
              6567696E0D0A0D0A202020506163655374796C65317374512E466F6E742E426F
              6C64203A3D2046616C73653B0D0A202020506163655374796C65317374512E46
              6F6E742E556E6465724C696E65203A3D2046616C73653B0D0A2020202020200D
              0A202020696620706C456E74726965735B27506163655374796C653173745152
              616E6B275D203D2031207468656E20626567696E0D0A20202020202050616365
              5374796C65317374512E466F6E742E426F6C64203A3D20547275653B0D0A2020
              20656E643B0D0A2020200D0A202020696620706C456E74726965735B27506163
              655374796C653173745152616E6B275D203D2031207468656E20626567696E0D
              0A09696620706C456E74726965735B27506163655374796C65326E645152616E
              6B275D203D2031207468656E20626567696E0D0A202020202020202020696620
              706C456E74726965735B27506163655374796C653372645152616E6B275D203D
              2031207468656E20626567696E0D0A09202020202020696620706C456E747269
              65735B27506163655374796C6546696E69736852616E6B275D203D2031207468
              656E20626567696E0D0A2020200909202020506163655374796C65317374512E
              466F6E742E556E6465724C696E65203A3D20547275653B0D0A20202009202020
              202020656E643B092020202020200D0A202020202020202020656E643B092020
              202020200D0A202020202020656E643B092020202020200D0A202020656E643B
              092020202020200D0A2020202020200D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D65060D506163655374796C6531737451094576656E744E616D65
              06074F6E5072696E74074576656E74494402200001060F5472614576656E7448
              616E646C65720B50726F6772616D4E616D650614506163655374796C65326E64
              514F6E5072696E740B50726F6772616D54797065070B747450726F6365647572
              6506536F757263650C5402000070726F63656475726520506163655374796C65
              326E64514F6E5072696E743B0D0A626567696E0D0A202020506163655374796C
              65326E64512E466F6E742E426F6C64203A3D2046616C73653B0D0A2020205061
              63655374796C65326E64512E466F6E742E556E6465724C696E65203A3D204661
              6C73653B0D0A2020202020200D0A202020696620706C456E74726965735B2750
              6163655374796C65326E645152616E6B275D203D2031207468656E2062656769
              6E0D0A202020202020506163655374796C65326E64512E466F6E742E426F6C64
              203A3D20547275653B0D0A202020656E643B0D0A2020200D0A20202069662070
              6C456E74726965735B27506163655374796C653173745152616E6B275D203D20
              31207468656E20626567696E0D0A09696620706C456E74726965735B27506163
              655374796C65326E645152616E6B275D203D2031207468656E20626567696E0D
              0A202020202020202020696620706C456E74726965735B27506163655374796C
              65326E645152616E6B275D203D2031207468656E20626567696E0D0A09202020
              202020696620706C456E74726965735B27506163655374796C6546696E697368
              52616E6B275D203D2031207468656E20626567696E0D0A202020090920202050
              6163655374796C65326E64512E466F6E742E556E6465724C696E65203A3D2054
              7275653B0D0A20202009202020202020656E643B092020202020200D0A202020
              202020202020656E643B092020202020200D0A202020202020656E643B092020
              202020200D0A202020656E643B092020202020200D0A2020200D0A656E643B0D
              0A0D436F6D706F6E656E744E616D65060D506163655374796C65326E64510945
              76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
              72614576656E7448616E646C65720B50726F6772616D4E616D65061450616365
              5374796C65337264514F6E5072696E740B50726F6772616D54797065070B7474
              50726F63656475726506536F757263650C5902000070726F6365647572652050
              6163655374796C65337264514F6E5072696E743B0D0A626567696E0D0A202020
              506163655374796C65337264512E466F6E742E426F6C64203A3D2046616C7365
              3B0D0A202020506163655374796C65337264512E466F6E742E556E6465724C69
              6E65203A3D2046616C73653B0D0A2020202020200D0A202020696620706C456E
              74726965735B27506163655374796C653372645152616E6B275D203D20312074
              68656E20626567696E0D0A202020202020506163655374796C65337264512E46
              6F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A2020200D
              0A202020696620706C456E74726965735B27506163655374796C653173745152
              616E6B275D203D2031207468656E20626567696E0D0A09696620706C456E7472
              6965735B27506163655374796C65326E645152616E6B275D203D203120746865
              6E20626567696E0D0A202020202020202020696620706C456E74726965735B27
              506163655374796C653372645152616E6B275D203D2031207468656E20626567
              696E0D0A09202020202020696620706C456E74726965735B2750616365537479
              6C6546696E69736852616E6B275D203D2031207468656E20626567696E0D0A20
              20200909202020506163655374796C65337264512E466F6E742E556E6465724C
              696E65203A3D20547275653B0D0A20202009202020202020656E643B09202020
              2020200D0A202020202020202020656E643B092020202020200D0A2020202020
              20656E643B092020202020200D0A202020656E643B092020202020200D0A2020
              200D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D5061
              63655374796C6533726451094576656E744E616D6506074F6E5072696E740745
              76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D650616506163655374796C6546696E6973684F6E5072696E740B
              50726F6772616D54797065070B747450726F63656475726506536F757263650C
              6102000070726F63656475726520506163655374796C6546696E6973684F6E50
              72696E743B0D0A626567696E0D0A202020506163655374796C6546696E697368
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A20202050616365537479
              6C6546696E6973682E466F6E742E556E6465724C696E65203A3D2046616C7365
              3B0D0A2020202020200D0A202020696620706C456E74726965735B2750616365
              5374796C6546696E69736852616E6B275D203D2031207468656E20626567696E
              0D0A202020202020506163655374796C6546696E6973682E466F6E742E426F6C
              64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A202020696620
              706C456E74726965735B27506163655374796C653173745152616E6B275D203D
              2031207468656E20626567696E0D0A09696620706C456E74726965735B275061
              63655374796C65326E645152616E6B275D203D2031207468656E20626567696E
              0D0A202020202020202020696620706C456E74726965735B2750616365537479
              6C653372645152616E6B275D203D2031207468656E20626567696E0D0A092020
              20202020696620706C456E74726965735B27506163655374796C6546696E6973
              6852616E6B275D203D2031207468656E20626567696E0D0A2020200909202020
              506163655374796C6546696E6973682E466F6E742E556E6465724C696E65203A
              3D20547275653B0D0A20202009202020202020656E643B092020202020200D0A
              202020202020202020656E643B092020202020200D0A202020202020656E643B
              092020202020200D0A202020656E643B092020202020200D0A202020200D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D65060F506163655374796C654669
              6E697368094576656E744E616D6506074F6E5072696E74074576656E74494402
              200001060F5472614576656E7448616E646C65720B50726F6772616D4E616D65
              060F57696E496E6465784F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F7572636506AD70726F6365647572652057696E
              496E6465784F6E5072696E743B0D0A626567696E0D0A0D0A20202057696E496E
              6465782E466F6E742E426F6C64203A3D2046616C73653B0D0A20202069662070
              6C456E74726965735B2757696E496E64657852616E6B275D203D203120746865
              6E20626567696E0D0A20202020202057696E496E6465782E466F6E742E426F6C
              64203A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B0D0A
              0D436F6D706F6E656E744E616D65060857696E496E646578094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D6506115369726557696E506374
              4F6E5072696E740B50726F6772616D54797065070B747450726F636564757265
              06536F7572636506B570726F636564757265205369726557696E5063744F6E50
              72696E743B0D0A626567696E0D0A0D0A2020205369726557696E5063742E466F
              6E742E426F6C64203A3D2046616C73653B0D0A202020696620706C456E747269
              65735B275369726557696E50637452616E6B275D203D2031207468656E206265
              67696E0D0A2020202020205369726557696E5063742E466F6E742E426F6C6420
              3A3D20547275653B0D0A202020656E643B0D0A2020200D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D65060A5369726557696E506374094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D65060F41766753706565644F6E
              5072696E740B50726F6772616D54797065070B747450726F6365647572650653
              6F7572636506AD70726F6365647572652041766753706565644F6E5072696E74
              3B0D0A626567696E0D0A0D0A20202041766753706565642E466F6E742E426F6C
              64203A3D2046616C73653B0D0A202020696620706C456E74726965735B274176
              67537065656452616E6B275D203D2031207468656E20626567696E0D0A202020
              20202041766753706565642E466F6E742E426F6C64203A3D20547275653B0D0A
              202020656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E61
              6D6506084176675370656564094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D65060F417667436C6173734F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F7572636506AD70726F6365
              6475726520417667436C6173734F6E5072696E743B0D0A626567696E0D0A0D0A
              202020417667436C6173732E466F6E742E426F6C64203A3D2046616C73653B0D
              0A202020696620706C456E74726965735B27417667436C61737352616E6B275D
              203D2031207468656E20626567696E0D0A202020202020417667436C6173732E
              466F6E742E426F6C64203A3D20547275653B0D0A202020656E643B0D0A202020
              0D0A656E643B0D0A0D436F6D706F6E656E744E616D650608417667436C617373
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D6506135472
              6E44727657696E5063744F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F7572636506BD70726F6365647572652054726E
              44727657696E5063744F6E5072696E743B0D0A626567696E0D0A0D0A20202054
              726E44727657696E5063742E466F6E742E426F6C64203A3D2046616C73653B0D
              0A202020696620706C456E74726965735B2754726E44727657696E5063745261
              6E6B275D203D2031207468656E20626567696E0D0A20202020202054726E4472
              7657696E5063742E466F6E742E426F6C64203A3D20547275653B0D0A20202065
              6E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060C
              54726E44727657696E506374094576656E744E616D6506074F6E5072696E7407
              4576656E74494402200001060F5472614576656E7448616E646C65720B50726F
              6772616D4E616D65061354726E4472765374617274734F6E5072696E740B5072
              6F6772616D54797065070B747450726F63656475726506536F7572636506BA70
              726F6365647572652054726E4472765374617274734F6E5072696E743B0D0A62
              6567696E0D0A0D0A20202054726E4472765374617274732E466F6E742E426F6C
              64203A3D2046616C73653B0D0A202020696620706C456E74726965735B275472
              6E44727657696E50637452616E6B275D203D2031207468656E20626567696E0D
              0A20202020202054726E4472765374617274732E466F6E742E426F6C64203A3D
              20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D65060C54726E447276537461727473094576656E744E616D6506
              074F6E5072696E74074576656E74494402200001060F5472614576656E744861
              6E646C65720B50726F6772616D4E616D65061054726E5374617274734F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              7263650C0A01000070726F6365647572652054726E5374617274734F6E507269
              6E743B0D0A626567696E0D0A0D0A20202054726E5374617274732E466F6E742E
              426F6C64203A3D2046616C73653B0D0A20202054726E5374617274732E466F6E
              742E556E6465726C696E65203A3D2046616C73653B0D0A202020202020202020
              0D0A202020696620706C456E74726965735B2754726E55545252616E6B275D20
              3D2031207468656E20626567696E0D0A20202020202054726E5374617274732E
              466F6E742E426F6C64203A3D20547275653B0D0A20202020202054726E537461
              7274732E466F6E742E556E6465726C696E65203A3D2046616C73653B0D0A2020
              20656E643B0D0A2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65
              060954726E537461727473094576656E744E616D6506074F6E5072696E740745
              76656E74494402200001060F5472614576656E7448616E646C65720B50726F67
              72616D4E616D6506104472765374617274734F6E5072696E740B50726F677261
              6D54797065070B747450726F63656475726506536F757263650C090100007072
              6F636564757265204472765374617274734F6E5072696E743B0D0A626567696E
              0D0A0D0A2020204472765374617274732E466F6E742E426F6C64203A3D204661
              6C73653B0D0A2020204472765374617274732E466F6E742E556E6465726C696E
              65203A3D2046616C73653B0D0A2020202020200D0A202020696620706C456E74
              726965735B2744727655445252616E6B275D203D2031207468656E2062656769
              6E0D0A2020202020204472765374617274732E466F6E742E426F6C64203A3D20
              547275653B0D0A2020202020204472765374617274732E466F6E742E556E6465
              726C696E65203A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D650609447276537461727473
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060D4472
              697665724F6E5072696E740B50726F6772616D54797065070B747450726F6365
              6475726506536F7572636506F570726F636564757265204472697665724F6E50
              72696E743B0D0A626567696E0D0A0D0A2020204472697665722E466F6E742E42
              6F6C64203A3D2046616C73653B0D0A2020204472697665722E466F6E742E556E
              6465726C696E65203A3D2046616C73653B0D0A2020202020200D0A2020206966
              20706C456E74726965735B2744727655445252616E6B275D203D203120746865
              6E20626567696E0D0A2020202020204472697665722E466F6E742E426F6C6420
              3A3D20547275653B0D0A2020202020204472697665722E466F6E742E556E6465
              726C696E65203A3D2046616C73653B0D0A202020656E643B0D0A0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D650606447269766572094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D65060E547261696E65724F6E50
              72696E740B50726F6772616D54797065070B747450726F63656475726506536F
              7572636506FE70726F63656475726520547261696E65724F6E5072696E743B0D
              0A626567696E0D0A0D0A202020547261696E65722E466F6E742E426F6C64203A
              3D2046616C73653B0D0A202020547261696E65722E466F6E742E556E6465726C
              696E65203A3D2046616C73653B0D0A20202020200D0A202020696620706C456E
              74726965735B2754726E55545252616E6B275D203D2031207468656E20626567
              696E0D0A202020202020547261696E65722E466F6E742E426F6C64203A3D2054
              7275653B0D0A202020202020547261696E65722E466F6E742E556E6465726C69
              6E65203A3D2046616C73653B0D0A202020656E643B0D0A2020200D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D650607547261696E6572094576656E
              744E616D6506074F6E5072696E74074576656E74494402200001060F54726145
              76656E7448616E646C65720B50726F6772616D4E616D65061153697265537461
              7274734F6E5072696E740B50726F6772616D54797065070B747450726F636564
              75726506536F7572636506B270726F6365647572652053697265537461727473
              4F6E5072696E743B0D0A626567696E0D0A0D0A20202053697265537461727473
              2E466F6E742E426F6C64203A3D2046616C73653B0D0A202020696620706C456E
              74726965735B275369726557696E50637452616E6B275D203D2031207468656E
              20626567696E0D0A202020202020536972655374617274732E466F6E742E426F
              6C64203A3D20547275653B0D0A202020656E643B0D0A0D0A656E643B0D0A0D43
              6F6D706F6E656E744E616D65060A53697265537461727473094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D65061446696E616C56616C7565
              4265744F6E5072696E740B50726F6772616D54797065070B747450726F636564
              75726506536F7572636506BF70726F6365647572652046696E616C56616C7565
              4265744F6E5072696E743B0D0A626567696E0D0A0D0A202046696E616C56616C
              75654265742E466F6E742E426F6C64203A3D2046616C73653B0D0A2020696620
              706C456E74726965735B2746696E616C56616C7565426574275D203E3D20312E
              303020207468656E20626567696E0D0A2020202046696E616C56616C75654265
              742E466F6E742E426F6C64203A3D20547275653B0D0A2020656E643B0D0A2020
              2020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65060D46696E616C
              56616C7565426574094576656E744E616D6506074F6E5072696E74074576656E
              74494402200000}
          end
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 408
    Top = 112
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
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHarnessValueReport'
    SessionName = 'Default'
    EngineVersion = '4.20 Build 3'
    IndexName = 'ByEstTimeOfRace'
    TableName = 'TodaysRaces'
    Left = 48
    Top = 80
  end
  object tblEntries: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 
      'IsPrintedOnValueSheet = True and ((DollarIndicator = '#39'$'#39' or Doll' +
      'arIndicator = '#39'$$'#39' ) or (IsTripleLiner = True)) and (PaceStyle1s' +
      'tQ > 0)'
    Filtered = True
    DatabaseName = 'dbHarnessValueReport'
    SessionName = 'Default'
    EngineVersion = '4.20 Build 3'
    FieldDefs = <
      item
        Name = 'TrkCode'
        DataType = ftString
        Size = 3
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RangeRaceDate'
        DataType = ftDate
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'RaceNbr'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ProgramNbr'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ProgramNbrSort'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'HorseName'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'OwnerName'
        DataType = ftString
        Size = 65
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'BreederName'
        DataType = ftString
        Size = 45
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SaddleCloth'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinishPos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Odds'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Distance'
        DataType = ftString
        Size = 10
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Gait'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WinIndex'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'WinIndexRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineDesc'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineTo1'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'MorningLineTo1Rank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Med'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Equip'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Power'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PowerRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ValueIndicator'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgSpeed'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgSpeedRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClass'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'AvgClassRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ClassChange'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle1stQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle1stQRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle2ndQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle2ndQRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle3rdQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyle3rdQRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyleFinish'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyleFinishRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PaceStyleNbrOfRaces'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Trainer'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnWinPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnPlcPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnShoPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnUTR'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnUTRRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Driver'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvWinPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvPlcPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvShoPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvUDR'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DrvUDRRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnDrvStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnDrvWinPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'TrnDrvWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackDaysAgo'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackTrkCode'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackSpeed'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackClass'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackTime'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1Back4thQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackFinish'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackFinishLengths'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackTrackSize'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackPostPos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackGait'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackCond'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackClassDesc'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackComment'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackClaimed'
        DataType = ftString
        Size = 9
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackDriver'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackTrainer'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race1BackRaceDesc'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackDaysAgo'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackTrkCode'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackSpeed'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackClass'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackTime'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2Back4thQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackFinish'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackFinishLengths'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackTrackSize'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackPostPos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackGait'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackCond'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackClassDesc'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackComment'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackClaimed'
        DataType = ftString
        Size = 9
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackDriver'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackTrainer'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race2BackRaceDesc'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackDaysAgo'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackTrkCode'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackSpeed'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackClass'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackTime'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3Back4thQ'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackFinish'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackFinishLengths'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackTrackSize'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackPostPos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackGait'
        DataType = ftString
        Size = 1
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackCond'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackClassDesc'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackComment'
        DataType = ftString
        Size = 15
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackClaimed'
        DataType = ftString
        Size = 9
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackDriver'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackTrainer'
        DataType = ftString
        Size = 25
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Race3BackRaceDesc'
        DataType = ftString
        Size = 100
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearWins'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearPlcs'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearShos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearEPS'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearBestTime'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ThisYearBestTimeTrkCode'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearWins'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearPlcs'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearShos'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearEPS'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearBestTime'
        DataType = ftString
        Size = 7
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'LastYearBestTimeTrkCode'
        DataType = ftString
        Size = 5
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last6Earnings'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'Last6EarningsRank'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireStarts'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireWinPct'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'SireWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsPrintedOnValueSheet'
        DataType = ftBoolean
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsYouBetTrack'
        DataType = ftBoolean
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DollarIndicator'
        DataType = ftString
        Size = 2
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalKey'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalStarts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalWins'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'FinalValueBet'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosKey'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosStarts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosWins'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'PostPosValueBet'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionKey'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionStarts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionWins'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'ConnectionValueBet'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultKey'
        DataType = ftString
        Size = 30
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultStarts'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultWins'
        DataType = ftInteger
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultWinPct'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultWinPctRank'
        DataType = ftSmallint
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'DefaultValueBet'
        DataType = ftFloat
        CharCase = fcNoChange
        Compression = 0
      end
      item
        Name = 'IsTripleLiner'
        DataType = ftBoolean
        CharCase = fcNoChange
        Compression = 0
      end>
    IndexDefs = <
      item
        Name = 'tblEntriesDBISA1'
        Fields = 'TrkCode;RaceDate;RaceNbr;ProgramNbr;RecordID'
        Options = [ixPrimary, ixUnique]
        Compression = icFull
      end
      item
        Name = 'ByRangeRaceDate'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;ProgramNbr'
        Compression = icNone
      end
      item
        Name = 'ByActualPrimary'
        Fields = 'TrkCode;RaceDate;RaceNbr;ProgramNbr'
        Compression = icNone
      end
      item
        Name = 'ByFinalWinPctRank'
        DescFields = 'FinalWinPct;WinIndex'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;FinalWinPct;WinIndex'
        Options = [ixDescending]
        Compression = icNone
      end
      item
        Name = 'ByTrnDrvWinPctRank'
        DescFields = 'TrnDrvWinPct;WinIndex'
        Fields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr;TrnDrvWinPct;WinIndex'
        Options = [ixDescending]
        Compression = icNone
      end>
    IndexName = 'ByFinalWinPctRank'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'TodaysEntries'
    StoreDefs = True
    Left = 144
    Top = 88
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 142
    Top = 144
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 40
    Top = 152
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 48
    Top = 224
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    UserName = 'plEntries'
    OnTraversal = plEntriesTraversal
    Left = 174
    Top = 218
    MasterDataPipelineName = 'plRacesReport'
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbHarnessValueReport'
    SessionName = 'Default'
    EngineVersion = '4.20 Build 3'
    IndexName = 'ByActualPrimary'
    TableName = 'TodaysRaces'
    Left = 448
    Top = 248
  end
end
