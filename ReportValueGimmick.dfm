object ValueGimmickReportForm: TValueGimmickReportForm
  Left = 168
  Top = 280
  Width = 690
  Height = 300
  Caption = 'Value Gimmick Report'
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
    Width = 668
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
      Width = 647
      Height = 16
      TabOrder = 0
    end
  end
  object staBar: TStatusBar
    Left = 0
    Top = 246
    Width = 682
    Height = 27
    Panels = <>
    SimplePanel = True
  end
  object btnCreatePdf: TButton
    Left = 5
    Top = 61
    Width = 668
    Height = 41
    Caption = 'Create PDF Reports'
    TabOrder = 2
    OnClick = btnCreatePdfClick
  end
  object dbValueGimmickReport: TDBISAMDatabase
    EngineVersion = '4.21 Build 6'
    Connected = True
    DatabaseName = 'dbValueGimmickReport'
    Directory = 'c:\ratingsdata31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 392
    Top = 160
  end
  object tblGimmicks: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = True
    CopyOnAppend = False
    DatabaseName = 'dbValueGimmickReport'
    EngineVersion = '4.21 Build 6'
    IndexFieldNames = 'RaceDate;EstTimeOfRace'
    TableName = 'Gimmicks'
    Left = 102
    Top = 104
  end
  object dsGimmicks: TDataSource
    DataSet = tblGimmicks
    Left = 102
    Top = 152
  end
  object plGimmicks: TppDBPipeline
    DataSource = dsGimmicks
    CloseDataSource = True
    UserName = 'plGimmicks'
    Left = 102
    Top = 202
  end
  object ppValueGimmickReport: TppReport
    AutoStop = False
    DataPipeline = plRacesReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\Ratings\FullTipSheet.rtm'
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
    TextFileName = 
      'C:\Documents and Settings\jkaras.JOSEPH-XX9EDN3P\Desktop\tesyt.T' +
      'XT'
    TextFileType = ftFixedLength
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 256
    Top = 136
    Version = '7.04'
    mmColumnWidth = 203200
    DataPipelineName = 'plRacesReport'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RaceDate'
        DataPipeline = plGimmicks
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGimmicks'
        mmHeight = 5080
        mmLeft = 125519
        mmTop = 0
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'VALUE GIMMICK SHEETS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 63765
        mmTop = 0
        mmWidth = 52366
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4868
      mmPrintPosition = 0
      object TotalRatingReport: TppSubReport
        UserName = 'TotalRatingReport'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        ParentWidth = False
        TraverseAllData = False
        DataPipelineName = 'plGimmicks'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 265378
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport12: TppChildReport
          AutoStop = False
          DataPipeline = plGimmicks
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'Letter 8 '#189' x 11 in'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 1
          Template.Format = ftASCII
          Units = utScreenPixels
          Left = 408
          Top = 288
          Version = '7.04'
          mmColumnWidth = 266701
          DataPipelineName = 'plGimmicks'
          object ppDetailBand13: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 28575
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'Shape4'
              ParentHeight = True
              ParentWidth = True
              mmHeight = 28575
              mmLeft = 0
              mmTop = 0
              mmWidth = 203200
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 3.000000000000000000
              mmHeight = 28575
              mmLeft = 58208
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object Wager1: TppDBText
              UserName = 'dbPick3'
              ShiftWithParent = True
              DataField = 'Wager1'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 3969
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              ShiftWithParent = True
              DataField = 'TrkCode'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3246
              mmLeft = 265
              mmTop = 0
              mmWidth = 8996
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'RaceNbr'
              ShiftWithParent = True
              DataField = 'RaceNbr'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 9948
              mmTop = 0
              mmWidth = 7620
              BandType = 4
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 3.000000000000000000
              mmHeight = 28575
              mmLeft = 93398
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'RaceNbr1'
              ShiftWithParent = True
              DataField = 'EstTimeOfRace'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 212
              mmTop = 4233
              mmWidth = 17145
              BandType = 4
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Pen.Width = 4
              ParentHeight = True
              Position = lpLeft
              Weight = 3.000000000000000000
              mmHeight = 28575
              mmLeft = 17992
              mmTop = 0
              mmWidth = 1058
              BandType = 4
            end
            object lblTri: TppLabel
              UserName = 'lblTri'
              AutoSize = False
              Caption = 'Trifecta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 0
              mmWidth = 37835
              BandType = 4
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              ShiftWithParent = True
              DataField = 'Dollar'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 113771
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              AutoSize = False
              Caption = 'Dollars'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 265
              mmWidth = 8467
              BandType = 4
            end
            object lblPick3: TppLabel
              UserName = 'lblPick3'
              AutoSize = False
              Caption = 'Pick 3 '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 0
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              ShiftWithParent = True
              BlankWhenZero = True
              DataField = 'WagerAmt'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3969
              mmLeft = 45508
              mmTop = 20373
              mmWidth = 8202
              BandType = 4
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              AutoSize = False
              Caption = 'Value'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 3704
              mmWidth = 17463
              BandType = 4
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Sheet Choices'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3969
              mmLeft = 169863
              mmTop = 13229
              mmWidth = 32015
              BandType = 4
            end
            object lblTurf: TppLabel
              UserName = 'lblTurf'
              Caption = 'Top Turf'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 169598
              mmTop = 529
              mmWidth = 9260
              BandType = 4
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Top Mud'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 169598
              mmTop = 4233
              mmWidth = 9525
              BandType = 4
            end
            object lblPedigree: TppLabel
              UserName = 'lblPedigree'
              Caption = 'Top Pedigree'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 169598
              mmTop = 7673
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              ShiftWithParent = True
              DataField = 'FinalOrder'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3704
              mmLeft = 169598
              mmTop = 17727
              mmWidth = 32279
              BandType = 4
            end
            object txtTurf: TppDBText
              UserName = 'txtTurf'
              ShiftWithParent = True
              DataField = 'TopTurf'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 185738
              mmTop = 529
              mmWidth = 16140
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              ShiftWithParent = True
              DataField = 'TopMud'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 185738
              mmTop = 4233
              mmWidth = 16140
              BandType = 4
            end
            object txtPedigree: TppDBText
              UserName = 'txtPedigree'
              ShiftWithParent = True
              DataField = 'TopPedigree'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 185738
              mmTop = 7673
              mmWidth = 16140
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'txtDana'
              ShiftWithParent = True
              DataField = 'TopOwner'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 113771
              mmTop = 10583
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              ShiftWithParent = True
              DataField = 'RaceType'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              WordWrap = True
              DataPipelineName = 'plRacesReport'
              mmHeight = 4763
              mmLeft = 265
              mmTop = 8731
              mmWidth = 17198
              BandType = 4
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              AutoSize = False
              Caption = 'Top Trainers'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133879
              mmTop = 17727
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              ShiftWithParent = True
              DataField = 'HotTrainer'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 14023
              mmWidth = 18785
              BandType = 4
            end
            object ppLabel21: TppLabel
              UserName = 'lblPedigree1'
              AutoSize = False
              Caption = 'Hot Jockey'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 14023
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'txtPedigree1'
              ShiftWithParent = True
              DataField = 'HotJockey'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 113771
              mmTop = 14023
              mmWidth = 18785
              BandType = 4
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'ML Favorite'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 7144
              mmWidth = 17198
              BandType = 4
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              AutoSize = False
              Caption = 'Top Jockeys'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95515
              mmTop = 17727
              mmWidth = 15081
              BandType = 4
            end
            object ppLabel19: TppLabel
              UserName = 'Label201'
              AutoSize = False
              Caption = 'Hot Trainer'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133879
              mmTop = 14023
              mmWidth = 14288
              BandType = 4
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              AutoSize = False
              Caption = 'Late Pace'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133615
              mmTop = 7144
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              ShiftWithParent = True
              DataField = 'LatePace'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 7144
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              ShiftWithParent = True
              AutoSize = True
              DataField = 'TopJockey'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 2709
              mmLeft = 128111
              mmTop = 17727
              mmWidth = 4445
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              ShiftWithParent = True
              DataField = 'TopTrainer'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 17727
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              ShiftWithParent = True
              DataField = 'MLFavorite'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 113771
              mmTop = 7144
              mmWidth = 18785
              BandType = 4
            end
            object ppLabel25: TppLabel
              UserName = 'Label202'
              AutoSize = False
              Caption = 'Top T/J'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133879
              mmTop = 10583
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              ShiftWithParent = True
              DataField = 'TopTJ'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 10583
              mmWidth = 18785
              BandType = 4
            end
            object Tri: TppDBText
              UserName = 'Tri'
              ShiftWithParent = True
              DataField = 'Tri'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 3704
              mmWidth = 37835
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'dbPick4'
              ShiftWithParent = True
              DataField = 'Wager2'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 11906
              mmWidth = 32544
              BandType = 4
            end
            object lblPick4: TppLabel
              UserName = 'lblPick4'
              AutoSize = False
              Caption = 'Pick 4'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 7938
              mmWidth = 32544
              BandType = 4
            end
            object Super: TppDBText
              UserName = 'Super'
              ShiftWithParent = True
              DataField = 'Super'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 12171
              mmWidth = 37835
              BandType = 4
            end
            object lblSuper: TppLabel
              UserName = 'lblSuper'
              AutoSize = False
              Caption = 'Superfecta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 8467
              mmWidth = 37835
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              ShiftWithParent = True
              DataField = 'Value'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 0
              mmWidth = 18785
              BandType = 4
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'Liners'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133879
              mmTop = 0
              mmWidth = 14288
              BandType = 4
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              AutoSize = False
              Caption = 'Top Owners'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 95250
              mmTop = 10583
              mmWidth = 14288
              BandType = 4
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              AutoSize = False
              Caption = 'Dots'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 133879
              mmTop = 3704
              mmWidth = 14288
              BandType = 4
            end
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              ShiftWithParent = True
              DataField = 'DoubleDot'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 149225
              mmTop = 3704
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'WagerType'
              DataPipeline = plRacesReport
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              DataPipelineName = 'plRacesReport'
              mmHeight = 3175
              mmLeft = 1058
              mmTop = 24606
              mmWidth = 200290
              BandType = 4
            end
            object ppLabel4: TppLabel
              UserName = 'lblDD'
              AutoSize = False
              Caption = 'Daily Double'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 15875
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'dbDD'
              ShiftWithParent = True
              DataField = 'AltWager1'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3175
              mmLeft = 59796
              mmTop = 20373
              mmWidth = 32544
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              ShiftWithParent = True
              DataField = 'Value'
              DataPipeline = plGimmicks
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plGimmicks'
              mmHeight = 3969
              mmLeft = 25929
              mmTop = 20373
              mmWidth = 6879
              BandType = 4
            end
            object ppLabel5: TppLabel
              UserName = 'lblSuper1'
              AutoSize = False
              Caption = 'Win'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial Narrow'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 19050
              mmTop = 16140
              mmWidth = 37835
              BandType = 4
            end
            object ppLabel7: TppLabel
              UserName = 'Label4'
              Caption = 'P#'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3895
              mmLeft = 19844
              mmTop = 20373
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Amt:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 35719
              mmTop = 20373
              mmWidth = 8467
              BandType = 4
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
              526163654E62724F6E476574546578740B50726F6772616D54797065070B7474
              50726F63656475726506536F75726365066670726F6365647572652052616365
              4E62724F6E476574546578742876617220546578743A20537472696E67293B0D
              0A626567696E0D0A0D0A54657874203A3D202752232D27202B20706C47696D6D
              69636B735B27526163654E6272275D3B0D0A656E643B0D0A0D436F6D706F6E65
              6E744E616D650607526163654E6272094576656E744E616D6506094F6E476574
              54657874074576656E74494402350001060F5472614576656E7448616E646C65
              720B50726F6772616D4E616D65060E6C626C547572664F6E5072696E740B5072
              6F6772616D54797065070B747450726F63656475726506536F7572636506C270
              726F636564757265206C626C547572664F6E5072696E743B0D0A626567696E0D
              0A0D0A2020206966202828706C52616365735265706F72745B27537572666163
              65275D203C3E202754272929207468656E20626567696E0D0A2020202020206C
              626C547572662E56697369626C65203A3D2046616C73653B200D0A202020656E
              6420656C736520626567696E0D0A2020202020206C626C547572662E56697369
              626C65203A3D20547275653B200D0A202020656E643B0D0A200D0A656E643B0D
              0A0D436F6D706F6E656E744E616D6506076C626C54757266094576656E744E61
              6D6506074F6E5072696E74074576656E74494402200001060F5472614576656E
              7448616E646C65720B50726F6772616D4E616D65060E747874547572664F6E50
              72696E740B50726F6772616D54797065070B747450726F63656475726506536F
              7572636506C170726F63656475726520747874547572664F6E5072696E743B0D
              0A626567696E0D0A0D0A2020206966202828706C52616365735265706F72745B
              2753757266616365275D203C3E202754272929207468656E20626567696E0D0A
              202020202020747874547572662E56697369626C65203A3D2046616C73653B20
              0D0A202020656E6420656C736520626567696E0D0A2020202020207478745475
              72662E56697369626C65203A3D20547275653B200D0A202020656E643B0D0A0D
              0A656E643B0D0A0D436F6D706F6E656E744E616D650607747874547572660945
              76656E744E616D6506074F6E5072696E74074576656E74494402200001060F54
              72614576656E7448616E646C65720B50726F6772616D4E616D65061274787450
              656469677265654F6E5072696E740B50726F6772616D54797065070B74745072
              6F63656475726506536F757263650C0001000070726F63656475726520747874
              50656469677265654F6E5072696E743B0D0A626567696E0D0A0D0A2020206966
              202828706C52616365735265706F72745B275261636554797065275D203C3E20
              274D5357272920616E640D0A20202020202028706C52616365735265706F7274
              5B275261636554797065275D203C3E20274D434C272929207468656E20626567
              696E0D0A20202020202074787450656469677265652E56697369626C65203A3D
              2046616C73653B200D0A202020656E6420656C736520626567696E0D0A202020
              20202074787450656469677265652E56697369626C65203A3D20547275653B20
              0D0A202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D
              65060B7478745065646967726565094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D6506126C626C50656469677265654F6E5072696E740B50
              726F6772616D54797065070B747450726F63656475726506536F757263650C02
              01000070726F636564757265206C626C50656469677265654F6E5072696E743B
              0D0A626567696E0D0A0D0A2020206966202828706C52616365735265706F7274
              5B275261636554797065275D203C3E20274D5357272920616E640D0A20202020
              202028706C52616365735265706F72745B275261636554797065275D203C3E20
              274D434C272929207468656E20626567696E0D0A2020202020206C626C506564
              69677265652E56697369626C65203A3D2046616C73653B200D0A202020656E64
              20656C736520626567696E0D0A2020202020206C626C50656469677265652E56
              697369626C65203A3D20547275653B200D0A202020656E643B0D0A0D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D65060B6C626C5065646967726565
              094576656E744E616D6506074F6E5072696E74074576656E7449440220000106
              0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060E6462
              5069636B334F6E5072696E740B50726F6772616D54797065070B747450726F63
              656475726506536F7572636506C970726F6365647572652064625069636B334F
              6E5072696E743B0D0A626567696E0D0A0D0A20202020696620706C5261636573
              5265706F72745B274973506B334C656731275D203D2054727565207468656E20
              626567696E0D0A202020200964625069636B332E56697369626C65203A3D2054
              7275653B0D0A20202020656E6420202020656C736520202020626567696E0D0A
              20202020202064625069636B332E56697369626C65203A3D2046616C73653B0D
              0A20202020656E643B0D0A202020200D0A656E643B0D0A0D436F6D706F6E656E
              744E616D65060764625069636B33094576656E744E616D6506074F6E5072696E
              74074576656E74494402200001060F5472614576656E7448616E646C65720B50
              726F6772616D4E616D65060F6C626C5069636B344F6E5072696E740B50726F67
              72616D54797065070B747450726F63656475726506536F7572636506C870726F
              636564757265206C626C5069636B344F6E5072696E743B0D0A626567696E0D0A
              0D0A20202020696620706C52616365735265706F72745B274973506B344C6567
              31275D203D2054727565207468656E20626567696E0D0A20202020096C626C50
              69636B342E56697369626C65203A3D20547275653B0D0A20202020656E642020
              2020656C736520202020626567696E0D0A2020202020206C626C5069636B342E
              56697369626C65203A3D2046616C73653B0D0A20202020656E643B0D0A0D0A65
              6E643B0D0A0D436F6D706F6E656E744E616D6506086C626C5069636B34094576
              656E744E616D6506074F6E5072696E74074576656E74494402200001060F5472
              614576656E7448616E646C65720B50726F6772616D4E616D65060F6C626C5069
              636B334F6E5072696E740B50726F6772616D54797065070B747450726F636564
              75726506536F7572636506C370726F636564757265206C626C5069636B334F6E
              5072696E743B0D0A626567696E0D0A20696620706C52616365735265706F7274
              5B274973506B334C656731275D203D2054727565207468656E20626567696E0D
              0A20202020096C626C5069636B332E56697369626C65203A3D20547275653B0D
              0A20202020656E6420202020656C736520202020626567696E0D0A2020202020
              206C626C5069636B332E56697369626C65203A3D2046616C73653B0D0A202020
              20656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506086C
              626C5069636B33094576656E744E616D6506074F6E5072696E74074576656E74
              494402200001060F5472614576656E7448616E646C65720B50726F6772616D4E
              616D65060A5472694F6E5072696E740B50726F6772616D54797065070B747450
              726F63656475726506536F7572636506B570726F636564757265205472694F6E
              5072696E743B0D0A626567696E0D0A2020696620706C52616365735265706F72
              745B27497354726952616365275D203D2054727565207468656E20626567696E
              0D0A20202020095472692E56697369626C65203A3D20547275653B0D0A202020
              20656E6420202020656C736520202020626567696E0D0A202020202020547269
              2E56697369626C65203A3D2046616C73653B0D0A20202020656E643B0D0A0D0A
              656E643B0D0A0D436F6D706F6E656E744E616D650603547269094576656E744E
              616D6506074F6E5072696E74074576656E74494402200001060F547261457665
              6E7448616E646C65720B50726F6772616D4E616D65060C53757065724F6E5072
              696E740B50726F6772616D54797065070B747450726F63656475726506536F75
              72636506BF70726F6365647572652053757065724F6E5072696E743B0D0A6265
              67696E0D0A2020696620706C52616365735265706F72745B2749735375706572
              52616365275D203D2054727565207468656E20626567696E0D0A202020200953
              757065722E56697369626C65203A3D20547275653B0D0A20202020656E642020
              2020656C736520202020626567696E0D0A20202020202053757065722E566973
              69626C65203A3D2046616C73653B0D0A20202020656E643B0D0A0D0A0D0A656E
              643B0D0A0D436F6D706F6E656E744E616D6506055375706572094576656E744E
              616D6506074F6E5072696E74074576656E74494402200001060F547261457665
              6E7448616E646C65720B50726F6772616D4E616D65060F6C626C53757065724F
              6E5072696E740B50726F6772616D54797065070B747450726F63656475726506
              536F7572636506CD70726F636564757265206C626C53757065724F6E5072696E
              743B0D0A626567696E0D0A2020696620706C52616365735265706F72745B2749
              73537570657252616365275D203D2054727565207468656E20626567696E0D0A
              20202020096C626C53757065722E56697369626C65203A3D20547275653B0D0A
              20202020656E6420202020656C736520202020626567696E0D0A20202020096C
              626C53757065722E56697369626C65203A3D2046616C73653B0D0A2020202065
              6E643B0D0A202020200D0A0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E
              616D6506086C626C5375706572094576656E744E616D6506074F6E5072696E74
              074576656E74494402200001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D65060D6C626C5472694F6E5072696E740B50726F6772616D
              54797065070B747450726F63656475726506536F7572636506BD70726F636564
              757265206C626C5472694F6E5072696E743B0D0A626567696E0D0A2069662070
              6C52616365735265706F72745B27497354726952616365275D203D2054727565
              207468656E20626567696E0D0A20202020096C626C5472692E56697369626C65
              203A3D20547275653B0D0A20202020656E6420202020656C7365202020206265
              67696E0D0A2020202020206C626C5472692E56697369626C65203A3D2046616C
              73653B0D0A20202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E
              744E616D6506066C626C547269094576656E744E616D6506074F6E5072696E74
              074576656E74494402200001060F5472614576656E7448616E646C65720B5072
              6F6772616D4E616D65060C6C626C44444F6E5072696E740B50726F6772616D54
              797065070B747450726F63656475726506536F7572636506B970726F63656475
              7265206C626C44444F6E5072696E743B0D0A626567696E0D0A20696620706C52
              616365735265706F72745B27497344444C656731275D203D2054727565207468
              656E20626567696E0D0A20202020096C626C44442E56697369626C65203A3D20
              547275653B0D0A20202020656E6420202020656C736520202020626567696E0D
              0A2020202020206C626C44442E56697369626C65203A3D2046616C73653B0D0A
              20202020656E643B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65
              06056C626C4444094576656E744E616D6506074F6E5072696E74074576656E74
              494402200000}
          end
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object timCloseFormCheck: TTimer
    OnTimer = timCloseFormCheckTimer
    Left = 608
    Top = 192
  end
  object tblRacesLoop: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbValueGimmickReport'
    EngineVersion = '4.21 Build 6'
    TableName = 'Race.DAT'
    Left = 576
    Top = 128
  end
  object tblRacesMaster: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = '(IsPrintedOnValueSheet=True) and (isAngleSheetSelected=True)'
    Filtered = True
    DatabaseName = 'dbValueGimmickReport'
    EngineVersion = '4.21 Build 6'
    IndexFieldNames = 'TrkCode;RaceDate;RaceNbr'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    MasterSource = dsGimmicks
    TableName = 'Race.DAT'
    Left = 28
    Top = 104
  end
  object plRacesReport: TppDBPipeline
    DataSource = dsRacesMaster
    CloseDataSource = True
    UserName = 'plRacesReport'
    Left = 24
    Top = 200
    MasterDataPipelineName = 'plGimmicks'
  end
  object dsRacesMaster: TDataSource
    DataSet = tblRacesMaster
    Left = 24
    Top = 152
  end
end
