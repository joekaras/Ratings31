object SelectionReportForm: TSelectionReportForm
  Left = 373
  Top = 114
  Width = 586
  Height = 356
  HorzScrollBar.Position = 8
  Caption = 'Selection Sheet Report'
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
    Left = -2
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
    Left = -8
    Top = 276
    Width = 682
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = -2
    Top = 75
    Width = 676
    Height = 51
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbSelectionReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    Connected = True
    DatabaseName = 'dbSelectionReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 376
    Top = 160
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'TrkCode = '#39'AP'#39' or TrkCode = '#39'DMR'#39
    DatabaseName = 'dbSelectionReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByTodaysWagerWinPctRank'
    MasterFields = 'RangeRaceDate;TrkCode;RaceDate;RaceNbr'
    MasterSource = dsRacesMaster
    TableName = 'Entry'
    Left = 110
    Top = 184
  end
  object dsEntries: TDataSource
    DataSet = tblEntries
    Left = 206
    Top = 184
  end
  object plEntries: TppDBPipeline
    DataSource = dsEntries
    CloseDataSource = True
    UserName = 'plEntries'
    Left = 198
    Top = 242
    MasterDataPipelineName = 'plRacesReport'
  end
  object ppSelectionReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PageLimit = 20
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\ratings31\SelectionSheet.rtm'
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
    Left = 208
    Top = 120
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RaceDate'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 4191
        mmLeft = 134070
        mmTop = 0
        mmWidth = 16002
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 5292
        mmWidth = 284163
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'TrkCode'
        DataPipeline = plRacesReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plRacesReport'
        mmHeight = 4191
        mmLeft = 116501
        mmTop = 0
        mmWidth = 14309
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7144
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
        mmHeight = 6615
        mmLeft = 0
        mmTop = 0
        mmWidth = 284163
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport12: TppChildReport
          AutoStop = False
          DataPipeline = plEntries
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210080
          PrinterSetup.mmPaperWidth = 296863
          PrinterSetup.PaperSize = 9
          Template.FileName = 'D:\ratings31\SelectionSheet.rtm'
          Template.Format = ftASCII
          Units = utScreenPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 266701
          DataPipelineName = 'plEntries'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 10054
            mmPrintPosition = 0
            object ppShape9: TppShape
              UserName = 'Shape9'
              ParentHeight = True
              mmHeight = 10054
              mmLeft = 0
              mmTop = 0
              mmWidth = 284163
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Todays'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = -8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 156634
              mmTop = 4498
              mmWidth = 6879
              BandType = 1
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'ML'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 183357
              mmTop = 4498
              mmWidth = 2498
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'LS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 188119
              mmTop = 4498
              mmWidth = 2201
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'BS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 192088
              mmTop = 4498
              mmWidth = 2413
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'LP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 227194
              mmTop = 4498
              mmWidth = 2201
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'WK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 213519
              mmTop = 4498
              mmWidth = 2910
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label101'
              Caption = 'PW'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 202671
              mmTop = 4498
              mmWidth = 2794
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label102'
              Caption = 'EP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 219171
              mmTop = 4498
              mmWidth = 2286
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'MP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 223108
              mmTop = 4498
              mmWidth = 2582
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'ST21'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 207963
              mmTop = 4498
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = ' W% '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 264584
              mmTop = 4498
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Sts'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2117
              mmLeft = 260351
              mmTop = 4763
              mmWidth = 2646
              BandType = 1
            end
            object ppDBText55: TppDBText
              UserName = 'DBText55'
              ShiftWithParent = True
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
              mmHeight = 4233
              mmLeft = 11642
              mmTop = 0
              mmWidth = 271463
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              Caption = 'Value'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 269876
              mmTop = 4498
              mmWidth = 4498
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'Rank'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 275167
              mmTop = 4498
              mmWidth = 4233
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'LC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 195527
              mmTop = 4498
              mmWidth = 2328
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'Trk'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 46302
              mmTop = 4498
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Win'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 50271
              mmTop = 4498
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'ERN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 118534
              mmTop = 4498
              mmWidth = 3704
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label4'
              Caption = 'EPP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 230992
              mmTop = 4498
              mmWidth = 3429
              BandType = 1
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'MPP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 234929
              mmTop = 4498
              mmWidth = 3725
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'LPP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2381
              mmLeft = 238919
              mmTop = 4498
              mmWidth = 3440
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'TRK'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 108215
              mmTop = 4498
              mmWidth = 3704
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              Caption = 'WIN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 114036
              mmTop = 4498
              mmWidth = 3440
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = 'Ern'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2381
              mmLeft = 54769
              mmTop = 4498
              mmWidth = 2910
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = 'Trainer'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 29104
              mmTop = 4498
              mmWidth = 6879
              BandType = 1
            end
            object ppLabel58: TppLabel
              UserName = 'Label58'
              Caption = 'Jockey'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = -8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 93134
              mmTop = 4498
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'Label59'
              Caption = 'Sire'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = -8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 124354
              mmTop = 4498
              mmWidth = 3704
              BandType = 1
            end
            object ppLabel65: TppLabel
              UserName = 'Label65'
              Caption = 'BC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2455
              mmLeft = 198967
              mmTop = 4498
              mmWidth = 2540
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'Q1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 247439
              mmTop = 4498
              mmWidth = 2328
              BandType = 1
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              Caption = 'K1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 251227
              mmTop = 4498
              mmWidth = 2244
              BandType = 1
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              Caption = 'K2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2455
              mmLeft = 254667
              mmTop = 4498
              mmWidth = 2244
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'Sire'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = -8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 142082
              mmTop = 4498
              mmWidth = 3704
              BandType = 1
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
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
              mmHeight = 4233
              mmLeft = 794
              mmTop = 0
              mmWidth = 9790
              BandType = 1
            end
          end
          object ppDetailBand13: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              ParentHeight = True
              ParentWidth = True
              mmHeight = 3440
              mmLeft = 0
              mmTop = 0
              mmWidth = 284163
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'RaceNbr'
              ShiftWithParent = True
              DataField = 'ProgramNbr'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 0
              mmTop = 0
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'RaceNbr1'
              ShiftWithParent = True
              DataField = 'HorseName'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2455
              mmLeft = 5027
              mmTop = 0
              mmWidth = 15790
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TodaysWagerWinPct'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 264245
              mmTop = 0
              mmWidth = 4572
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              ShiftWithParent = True
              DataField = 'Trainer'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 29104
              mmTop = 0
              mmWidth = 26458
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              ShiftWithParent = True
              DataField = 'MorningLineDesc'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 3175
              mmLeft = 22754
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TodaysWagerWinPctRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 278300
              mmTop = 0
              mmWidth = 1016
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 21431
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object TodaysWagerStarts: TppDBText
              UserName = 'TodaysWagerStarts'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TodaysWagerStarts'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 259948
              mmTop = 0
              mmWidth = 3048
              BandType = 4
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 28046
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MorningLineTo1Rank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 185029
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object BackSpeedRank: TppDBText
              UserName = 'BackSpeedRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'BackSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 191474
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object LastSpeedRank: TppDBText
              UserName = 'LastSpeedRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LastSpeedRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 187675
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object PowerRank: TppDBText
              UserName = 'PowerRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'PowerRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 203550
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object NbrWorksLast: TppDBText
              UserName = 'NbrWorksLast'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'NbrWorksLast'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 214567
              mmTop = 0
              mmWidth = 1863
              BandType = 4
            end
            object EarlyPaceRank: TppDBText
              UserName = 'EarlyPaceRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'EarlyPaceRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 219593
              mmTop = 0
              mmWidth = 1863
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              ShiftWithParent = True
              DataField = 'MiddlePaceRank'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2381
              mmLeft = 222780
              mmTop = 0
              mmWidth = 2910
              BandType = 4
            end
            object StartsWorks21: TppDBText
              UserName = 'StartsWorks21'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'StartsWorks21'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 200269
              mmTop = 0
              mmWidth = 12192
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 258763
              mmTop = 0
              mmWidth = 794
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 187325
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 194469
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 202407
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 206640
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 217488
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              ShiftWithParent = True
              DataField = 'Jockey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 72496
              mmTop = 0
              mmWidth = 25400
              BandType = 4
            end
            object ppLine36: TppLine
              UserName = 'Line36'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 71438
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppDBText58: TppDBText
              UserName = 'DBText58'
              ShiftWithParent = True
              DataField = 'TodaysWagerOrderKey'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2910
              mmLeft = 157427
              mmTop = 0
              mmWidth = 23283
              BandType = 4
            end
            object TodaysWagerValueBet: TppDBText
              UserName = 'TodaysWagerValueBet'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TodaysWagerValueBet'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 270818
              mmTop = 0
              mmWidth = 3556
              BandType = 4
            end
            object LastClassRank: TppDBText
              UserName = 'LastClassRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LastClassRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 196310
              mmTop = 0
              mmWidth = 1863
              BandType = 4
            end
            object ppDBText67: TppDBText
              UserName = 'DBText501'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TrnWinsRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 63098
              mmTop = 0
              mmWidth = 3048
              BandType = 4
            end
            object ppDBText68: TppDBText
              UserName = 'DBText68'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TrnTrackRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 58029
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppDBText69: TppDBText
              UserName = 'DBText69'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'JkyTrackRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 109887
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'TrnEarningsRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 67596
              mmTop = 0
              mmWidth = 3048
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 123031
              mmTop = 0
              mmWidth = 794
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'JkyWinsRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 114427
              mmTop = 0
              mmWidth = 3048
              BandType = 4
            end
            object SireTurfThisYearRank: TppDBText
              UserName = 'SireTurfThisYearRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireTurfThisYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 145786
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object MiddlePaceRank: TppDBText
              UserName = 'DBText301'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MiddlePaceRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 223658
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object LatePaceRank: TppDBText
              UserName = 'LatePaceRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LatePaceRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 227362
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object EarlyPacePosRank: TppDBText
              UserName = 'EarlyPacePosRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'EarlyPacePosRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 232558
              mmTop = 0
              mmWidth = 1863
              BandType = 4
            end
            object MiddlePacePosRank: TppDBText
              UserName = 'MiddlePacePosRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'MiddlePacePosRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 236623
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object LatePacePosRank: TppDBText
              UserName = 'LatePacePosRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'LatePacePosRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 240327
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppLine21: TppLine
              UserName = 'Line201'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 230453
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText73: TppDBText
              UserName = 'DBText73'
              ShiftWithParent = True
              DataField = 'Sire'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2117
              mmLeft = 124090
              mmTop = 0
              mmWidth = 15610
              BandType = 4
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 2.250000000000000000
              mmHeight = 3440
              mmLeft = 155840
              mmTop = 0
              mmWidth = 1588
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 108215
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 56092
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 140494
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 61119
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 112713
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 67469
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line31'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 118004
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object SireGeneralThisYearRank: TppDBText
              UserName = 'SireGeneralThisYearRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireGeneralThisYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 140759
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object SireJuvenileThisYearRank: TppDBText
              UserName = 'SireJuvenileThisYearRank'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireJuvenileThisYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 151077
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object BackClassRank: TppDBText
              UserName = 'BackClassRank'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'BackClassRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2371
              mmLeft = 199221
              mmTop = 0
              mmWidth = 1863
              BandType = 4
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 190500
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'LatePacePosRank1'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'QSP1stCallRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 248000
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'KSP1stCallRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 251534
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'KSP2ndCallRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 254974
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 198438
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object QSP1stCallRunStyle: TppDBText
              UserName = 'QSP1stCallRunStyle'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'QSP1stCallRunStyle'
              DataPipeline = plEntries
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 245936
              mmTop = 0
              mmWidth = 1185
              BandType = 4
            end
            object ppLine39: TppLine
              UserName = 'Line39'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 243417
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'SireGeneralThisYearRank1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireGeneralLastYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 143140
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'SireTurfThisYearRank1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireTurfLastYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 148696
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'SireJuvenileThisYearRank1'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'SireJuvenileLastYearRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 5
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2646
              mmLeft = 153459
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              ShiftWithParent = True
              AutoSize = True
              BlankWhenZero = True
              DataField = 'JkyEarningsRank'
              DataPipeline = plEntries
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 6
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plEntries'
              mmHeight = 2709
              mmLeft = 120735
              mmTop = 0
              mmWidth = 2032
              BandType = 4
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.600000023841857900
              mmHeight = 3440
              mmLeft = 183621
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppSubReport1: TppSubReport
              UserName = 'SubReport1'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ParentPrinterSetup = False
              TraverseAllData = False
              DataPipelineName = 'plEntries'
              mmHeight = 4022
              mmLeft = 0
              mmTop = 0
              mmWidth = 284163
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object Pick3Sub: TppChildReport
                AutoStop = False
                DataPipeline = plEntries
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
                PrinterSetup.Orientation = poLandscape
                PrinterSetup.PaperName = 'A4'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 6350
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 210080
                PrinterSetup.mmPaperWidth = 296863
                PrinterSetup.PaperSize = 9
                Template.FileName = 'D:\ratings31\SelectionSheet.rtm'
                Template.Format = ftASCII
                Units = utScreenPixels
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'plEntries'
                object ppTitleBand2: TppTitleBand
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 3175
                  mmPrintPosition = 0
                  object ppShape3: TppShape
                    UserName = 'Shape3'
                    ParentHeight = True
                    ParentWidth = True
                    mmHeight = 3175
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 284163
                    BandType = 1
                  end
                  object ppLabel35: TppLabel
                    UserName = 'Label35'
                    Caption = 'Horse'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 4763
                    mmTop = 0
                    mmWidth = 4699
                    BandType = 1
                  end
                  object ppLabel36: TppLabel
                    UserName = 'Label36'
                    Caption = 'P#'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 2201
                    BandType = 1
                  end
                  object ppLabel18: TppLabel
                    UserName = 'Label18'
                    Caption = 'Starts'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 93663
                    mmTop = 0
                    mmWidth = 4530
                    BandType = 1
                  end
                  object ppLabel22: TppLabel
                    UserName = 'Label22'
                    Caption = 'W%'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 110596
                    mmTop = 0
                    mmWidth = 3175
                    BandType = 1
                  end
                  object ppLabel40: TppLabel
                    UserName = 'Label40'
                    Caption = 'Top 3'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2381
                    mmLeft = 121444
                    mmTop = 0
                    mmWidth = 4498
                    BandType = 1
                  end
                  object ppLabel43: TppLabel
                    UserName = 'Label401'
                    AutoSize = False
                    Caption = 'W Rnk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 130175
                    mmTop = 0
                    mmWidth = 4233
                    BandType = 1
                  end
                  object ppLabel25: TppLabel
                    UserName = 'Label25'
                    Caption = 'Wins'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 102659
                    mmTop = 0
                    mmWidth = 3895
                    BandType = 1
                  end
                  object ppLabel15: TppLabel
                    UserName = 'Label15'
                    AutoSize = False
                    Caption = 'E Rnk'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 6
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2498
                    mmLeft = 137319
                    mmTop = 0
                    mmWidth = 4233
                    BandType = 1
                  end
                end
                object ppDetailBand2: TppDetailBand
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 3704
                  mmPrintPosition = 0
                  object ppShape2: TppShape
                    UserName = 'Shape2'
                    ParentHeight = True
                    ParentWidth = True
                    mmHeight = 3704
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 284163
                    BandType = 4
                  end
                  object HorseName: TppDBText
                    UserName = 'HorseName'
                    ShiftWithParent = True
                    DataField = 'HorseName'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3175
                    mmLeft = 6615
                    mmTop = 0
                    mmWidth = 22490
                    BandType = 4
                  end
                  object ProgramNbr: TppDBText
                    UserName = 'RaceNbr3'
                    ShiftWithParent = True
                    DataField = 'ProgramNbr'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3302
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 4498
                    BandType = 4
                  end
                  object ppLine22: TppLine
                    UserName = 'Line22'
                    Pen.Width = 4
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 2.250000000000000000
                    mmHeight = 3704
                    mmLeft = 40481
                    mmTop = 0
                    mmWidth = 1058
                    BandType = 4
                  end
                  object SecondaryStarts: TppDBText
                    UserName = 'SecondaryStarts'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'Owner'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 42598
                    mmTop = 0
                    mmWidth = 6943
                    BandType = 4
                  end
                  object SecondaryWinPct: TppDBText
                    UserName = 'SecondaryWinPct'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalOwnStarts'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 84869
                    mmTop = 0
                    mmWidth = 15917
                    BandType = 4
                  end
                  object ppDBText26: TppDBText
                    UserName = 'DBText102'
                    ShiftWithParent = True
                    AutoSize = True
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
                    mmHeight = 3725
                    mmLeft = 135817
                    mmTop = 0
                    mmWidth = 18965
                    BandType = 4
                  end
                  object ppDBText27: TppDBText
                    UserName = 'SecondaryWinPct1'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalOwnWins'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 91916
                    mmTop = 0
                    mmWidth = 15240
                    BandType = 4
                  end
                  object ppDBText28: TppDBText
                    UserName = 'DBText28'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalOwnWinPct'
                    DataPipeline = plEntries
                    DisplayFormat = '##0.0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 97293
                    mmTop = 0
                    mmWidth = 17272
                    BandType = 4
                  end
                  object ppDBText29: TppDBText
                    UserName = 'DBText29'
                    ShiftWithParent = True
                    BlankWhenZero = True
                    DataField = 'TotalOwnTop3WinPct'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3175
                    mmLeft = 117740
                    mmTop = 0
                    mmWidth = 8202
                    BandType = 4
                  end
                  object ppDBText20: TppDBText
                    UserName = 'PowerRank1'
                    ShiftWithParent = True
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'PowerRank'
                    DataPipeline = plEntries
                    DisplayFormat = '#00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 135446
                    mmTop = 265
                    mmWidth = 12192
                    BandType = 4
                  end
                  object ppDBText15: TppDBText
                    UserName = 'DBText15'
                    ShiftWithParent = True
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'OwnEarningsRank'
                    DataPipeline = plEntries
                    DisplayFormat = '#00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 121476
                    mmTop = 0
                    mmWidth = 19812
                    BandType = 4
                  end
                  object ppDBText14: TppDBText
                    UserName = 'DBText14'
                    ShiftWithParent = True
                    AutoSize = True
                    BlankWhenZero = True
                    DataField = 'OwnWinsRank'
                    DataPipeline = plEntries
                    DisplayFormat = '#00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 118830
                    mmTop = 0
                    mmWidth = 15579
                    BandType = 4
                  end
                  object ppLine6: TppLine
                    UserName = 'Line6'
                    Pen.Width = 2
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 1.500000000000000000
                    mmHeight = 3704
                    mmLeft = 155840
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine8: TppLine
                    UserName = 'Line8'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 94192
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine10: TppLine
                    UserName = 'Line10'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 101865
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine11: TppLine
                    UserName = 'Line101'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 108215
                    mmTop = 0
                    mmWidth = 5292
                    BandType = 4
                  end
                  object ppLine17: TppLine
                    UserName = 'Line17'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 116152
                    mmTop = 0
                    mmWidth = 1058
                    BandType = 4
                  end
                  object ppLine23: TppLine
                    UserName = 'Line23'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 127529
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine24: TppLine
                    UserName = 'Line24'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 142611
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppLine25: TppLine
                    UserName = 'Line25'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 148961
                    mmTop = 0
                    mmWidth = 265
                    BandType = 4
                  end
                  object ppDBText13: TppDBText
                    UserName = 'SecondaryWinPct2'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnStarts'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 187241
                    mmTop = 265
                    mmWidth = 14901
                    BandType = 4
                  end
                  object ppDBText24: TppDBText
                    UserName = 'DBText24'
                    ShiftWithParent = True
                    DataField = 'Trainer'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3175
                    mmLeft = 212990
                    mmTop = 0
                    mmWidth = 26458
                    BandType = 4
                  end
                  object ppDBText25: TppDBText
                    UserName = 'DBText25'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnOwnWinPct'
                    DataPipeline = plEntries
                    DisplayFormat = '##0.0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 165270
                    mmTop = 0
                    mmWidth = 20997
                    BandType = 4
                  end
                  object ppDBText31: TppDBText
                    UserName = 'DBText31'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnOwnWins'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 156443
                    mmTop = 0
                    mmWidth = 18965
                    BandType = 4
                  end
                  object ppLine34: TppLine
                    UserName = 'Line34'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 187855
                    mmTop = 0
                    mmWidth = 1323
                    BandType = 4
                  end
                  object ppDBText32: TppDBText
                    UserName = 'DBText32'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnWins'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 194004
                    mmTop = 0
                    mmWidth = 14224
                    BandType = 4
                  end
                  object ppDBText33: TppDBText
                    UserName = 'DBText33'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnWinPct'
                    DataPipeline = plEntries
                    DisplayFormat = '##0.0'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 177684
                    mmTop = 0
                    mmWidth = 16256
                    BandType = 4
                  end
                  object ppDBText34: TppDBText
                    UserName = 'DBText34'
                    ShiftWithParent = True
                    AutoSize = True
                    DataField = 'TotalTrnOwnStarts'
                    DataPipeline = plEntries
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial Narrow'
                    Font.Size = 8
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'plEntries'
                    mmHeight = 3725
                    mmLeft = 149691
                    mmTop = 0
                    mmWidth = 19643
                    BandType = 4
                  end
                  object ppLine32: TppLine
                    UserName = 'Line32'
                    ParentHeight = True
                    Position = lpLeft
                    Weight = 0.750000000000000000
                    mmHeight = 3704
                    mmLeft = 211403
                    mmTop = 0
                    mmWidth = 27252
                    BandType = 4
                  end
                end
                object raCodeModule3: TraCodeModule
                  ProgramStream = {00}
                end
              end
            end
          end
          object raCodeModule2: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 304
    Top = 120
  end
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = 'TrkCode = '#39'AP'#39' or TrkCode = '#39'DMR'#39
    DatabaseName = 'dbSelectionReport'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race'
    Left = 24
    Top = 88
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
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSelectionReport'
    EngineVersion = '4.24 Build 1'
    TableName = 'Race.DAT'
    Left = 496
    Top = 176
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
end
