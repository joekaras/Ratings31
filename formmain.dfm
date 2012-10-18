object MainForm: TMainForm
  Left = 410
  Top = 199
  Width = 1376
  Height = 780
  Caption = 'KSK Ratings 3.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 120
  TextHeight = 16
  object staBar: TStatusBar
    Left = 0
    Top = 692
    Width = 1368
    Height = 19
    Panels = <>
    ParentShowHint = False
    ShowHint = False
    SimplePanel = True
  end
  object pnlPrgBar: TPanel
    Left = 0
    Top = 711
    Width = 1368
    Height = 36
    Align = alBottom
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    Visible = False
    object prgBar: TcxProgressBar
      Left = 5
      Top = 6
      TabOrder = 0
      Width = 1227
    end
  end
  object pgCtrlMain: TcxPageControl
    Left = 0
    Top = 28
    Width = 1368
    Height = 664
    ActivePage = tabDaily
    Align = alClient
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    ClientRectBottom = 662
    ClientRectLeft = 2
    ClientRectRight = 1366
    ClientRectTop = 25
    object tabDaily: TcxTabSheet
      Caption = 'Daily'
      object lblLocalPath: TLabel
        Left = 0
        Top = 584
        Width = 1364
        Height = 26
        Align = alBottom
        AutoSize = False
        Caption = 'LocalPath'
        Color = clBackground
        ParentColor = False
        Transparent = False
        Layout = tlBottom
        Visible = False
      end
      object lblServerPath: TLabel
        Left = 0
        Top = 610
        Width = 1364
        Height = 27
        Align = alBottom
        AutoSize = False
        Caption = 'ServerPath'
        Color = clPurple
        ParentColor = False
        Transparent = False
        Visible = False
      end
      object pnlAxcis: TPanel
        Left = 10
        Top = 20
        Width = 229
        Height = 582
        TabOrder = 0
        object btnStartOfDay: TButton
          Left = 12
          Top = 9
          Width = 208
          Height = 30
          Caption = 'Start Of Day'
          TabOrder = 0
          OnClick = btnStartOfDayClick
        end
        object btnDownloadAxcis: TButton
          Left = 12
          Top = 46
          Width = 208
          Height = 32
          Caption = 'Download Axcis Files'
          TabOrder = 1
          OnClick = btnDownloadAxcisClick
        end
        object btnImport: TButton
          Left = 12
          Top = 85
          Width = 208
          Height = 29
          Caption = 'Import Axcis Files For History'
          TabOrder = 2
          OnClick = btnImportClick
        end
        object btnBackup: TButton
          Left = 12
          Top = 164
          Width = 208
          Height = 30
          Caption = 'Backup Axcis Files'
          TabOrder = 3
          OnClick = btnBackupClick
        end
        object btnCreateTodaysRatings: TButton
          Left = 12
          Top = 202
          Width = 208
          Height = 32
          Caption = 'Create Todays Ratings File'
          TabOrder = 4
          OnClick = btnCreateTodaysRatingsClick
        end
        object btnImportToday: TButton
          Left = 1222
          Top = 634
          Width = 208
          Height = 31
          Caption = 'Import Todays Axcis For Reports'
          TabOrder = 5
          OnClick = btnImportTodayClick
        end
        object btnDownloadSelections: TButton
          Left = 12
          Top = 318
          Width = 208
          Height = 30
          Caption = 'Download Selections '
          TabOrder = 6
          OnClick = btnDownloadSelectionsClick
        end
        object btnProcessSelections: TButton
          Left = 12
          Top = 356
          Width = 208
          Height = 29
          Caption = 'Process Selections '
          TabOrder = 7
          OnClick = btnProcessSelectionsClick
        end
        object btnDownloadEquibaseStats: TButton
          Left = 12
          Top = 395
          Width = 208
          Height = 31
          Caption = 'Download Equibase Stats'
          TabOrder = 8
          OnClick = btnDownloadEquibaseStatsClick
        end
        object btnProcessEquibaseStats: TButton
          Left = 12
          Top = 434
          Width = 208
          Height = 30
          Caption = 'Process Equibase Stats'
          TabOrder = 9
          OnClick = btnProcessEquibaseStatsClick
        end
        object btnDownloadTSN: TButton
          Left = 14
          Top = 124
          Width = 208
          Height = 32
          Caption = 'Download TSN Files'
          TabOrder = 10
          OnClick = btnDownloadTSNClick
        end
        object btnContenders: TButton
          Left = 12
          Top = 281
          Width = 208
          Height = 30
          Caption = 'Adjust For Contenders Only'
          TabOrder = 11
          OnClick = btnContendersClick
        end
      end
      object pnlOptions: TPanel
        Left = 255
        Top = 58
        Width = 402
        Height = 277
        TabOrder = 1
        object TLabel
          Left = 325
          Top = 49
          Width = 3
          Height = 16
        end
        object edtProxy: TcxTextEdit
          Left = 266
          Top = 57
          Properties.OnChange = edtProxyPropertiesChange
          TabOrder = 0
          Width = 119
        end
        object chkProcessAllDates: TcxCheckBox
          Left = 10
          Top = 75
          Caption = 'Process All Dates'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          TabOrder = 1
          Width = 149
        end
        object chkUseProxy: TcxCheckBox
          Left = 10
          Top = 43
          Caption = 'Proxy '
          Properties.OnChange = chkUseProxyPropertiesChange
          TabOrder = 2
          Width = 149
        end
        object chkOverrideDate: TcxCheckBox
          Left = 10
          Top = 10
          Caption = 'Override Date'
          Properties.OnChange = chkOverrideDatePropertiesChange
          State = cbsChecked
          TabOrder = 3
          Width = 149
        end
        object edtOverrideDate: TcxDateEdit
          Left = 267
          Top = 9
          EditValue = 0d
          Properties.DateButtons = [btnClear, btnNow, btnToday]
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = edtOverrideDatePropertiesChange
          TabOrder = 4
          Width = 121
        end
        object chkDownloadProcessResults: TcxCheckBox
          Left = 10
          Top = 105
          Caption = 'Download/Process Results'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          State = cbsChecked
          TabOrder = 5
          Width = 208
        end
        object chkDownloadProcessStats: TcxCheckBox
          Left = 10
          Top = 134
          Caption = 'Download/Process Stats'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          State = cbsChecked
          TabOrder = 6
          Width = 208
        end
        object chkSuppressAutomaticProcessing: TcxCheckBox
          Left = 10
          Top = 193
          Caption = 'Suppress Automatic Processing'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          TabOrder = 7
          Width = 296
        end
        object chkForceEquibase: TcxCheckBox
          Left = 10
          Top = 164
          Caption = 'Force Equibase Process'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          TabOrder = 8
          Width = 208
        end
      end
      object pnlReports: TPanel
        Left = 262
        Top = 343
        Width = 203
        Height = 299
        TabOrder = 2
        object btnCreateReports: TButton
          Left = 20
          Top = 217
          Width = 167
          Height = 32
          Caption = 'Create Reports'
          TabOrder = 1
          OnClick = btnCreateReportsClick
        end
        object chkCreateHospitalReport: TcxCheckBox
          Left = 17
          Top = 6
          Caption = 'Hospital Report'
          State = cbsChecked
          TabOrder = 2
          Width = 122
        end
        object chkCreateGimmickReport: TcxCheckBox
          Left = 17
          Top = 30
          Caption = 'Gimmick Report'
          TabOrder = 3
          Width = 132
        end
        object chkCreateSelectionReport: TcxCheckBox
          Left = 17
          Top = 95
          Caption = 'Selection Report'
          TabOrder = 4
          Width = 131
        end
        object btnCreateReportsNone: TButton
          Left = 18
          Top = 257
          Width = 168
          Height = 32
          Caption = 'Select None'
          TabOrder = 0
          OnClick = btnCreateReportsNoneClick
        end
        object chkCreateValueReport: TcxCheckBox
          Left = 18
          Top = 53
          Caption = 'Value Report'
          State = cbsChecked
          TabOrder = 5
          Width = 142
        end
        object btnDeleteReports: TButton
          Left = 21
          Top = 180
          Width = 168
          Height = 32
          Caption = 'Delete Reports'
          TabOrder = 6
          OnClick = btnDeleteReportsClick
        end
        object chkCreateWagerReport: TcxCheckBox
          Left = 17
          Top = 114
          Caption = 'Wager Report'
          TabOrder = 7
          Width = 128
        end
        object chkCreateTipReport: TcxCheckBox
          Left = 17
          Top = 74
          Caption = 'Tip Report'
          State = cbsChecked
          TabOrder = 8
          Width = 122
        end
        object chkCreateContestReport: TcxCheckBox
          Left = 17
          Top = 135
          Caption = 'Contest Report'
          TabOrder = 9
          Width = 128
        end
        object chkCreateExportFiles: TcxCheckBox
          Left = 17
          Top = 159
          Caption = 'Export Files'
          State = cbsChecked
          TabOrder = 10
          Width = 128
        end
      end
      object pnlFTP: TPanel
        Left = 471
        Top = 343
        Width = 186
        Height = 299
        TabOrder = 3
        object btnFTPReports: TButton
          Left = 18
          Top = 221
          Width = 148
          Height = 32
          Caption = 'FTP Reports'
          TabOrder = 0
          OnClick = btnFTPReportsClick
        end
        object chkFTPHospitalReport: TcxCheckBox
          Left = 6
          Top = 6
          Caption = 'Hospital Report'
          State = cbsChecked
          TabOrder = 1
          Width = 133
        end
        object chkFTPGimmickReport: TcxCheckBox
          Left = 6
          Top = 28
          Caption = 'Gimmick Report'
          TabOrder = 2
          Width = 133
        end
        object chkFTPValueReport: TcxCheckBox
          Left = 6
          Top = 52
          Caption = 'Value Report'
          State = cbsChecked
          TabOrder = 3
          Width = 133
        end
        object btnFTPReportsNone: TButton
          Left = 18
          Top = 262
          Width = 148
          Height = 32
          Caption = 'Select None'
          TabOrder = 4
          OnClick = btnFTPReportsNoneClick
        end
        object chkFTPSelectionReport: TcxCheckBox
          Left = 6
          Top = 98
          Caption = 'Selection Report'
          TabOrder = 5
          Width = 131
        end
        object chkFTPWagerReport: TcxCheckBox
          Left = 6
          Top = 122
          Caption = 'Wager Report'
          TabOrder = 6
          Width = 133
        end
        object btnDeleteAllFTPReport: TButton
          Left = 18
          Top = 180
          Width = 148
          Height = 32
          Caption = 'Delete All FTP Reports'
          TabOrder = 7
          OnClick = btnDeleteAllFTPReportClick
        end
        object chkFTPTipReport: TcxCheckBox
          Left = 6
          Top = 76
          Caption = 'Tip Report'
          State = cbsChecked
          TabOrder = 8
          Width = 105
        end
        object chkFTPExportFiles: TcxCheckBox
          Left = 6
          Top = 146
          Caption = 'Export Files'
          State = cbsChecked
          TabOrder = 9
          Width = 133
        end
      end
    end
    object tabBatch: TcxTabSheet
      Caption = 'Process'
      object Panel2: TPanel
        Left = 10
        Top = -5
        Width = 231
        Height = 587
        TabOrder = 0
        object chkDownloadAxcis: TcxCheckBox
          Left = 6
          Top = 15
          Caption = 'Download AXCIS'
          TabOrder = 0
          Width = 179
        end
        object btnProcessToday: TButton
          Left = 9
          Top = 284
          Width = 214
          Height = 31
          Caption = 'Process Todays Ratings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = btnProcessTodayClick
        end
        object btnProcessTomorrow: TButton
          Left = 9
          Top = 337
          Width = 214
          Height = 31
          Caption = 'Process Tomorrows Ratings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnProcessTomorrowClick
        end
        object btnProcessYesterday: TButton
          Left = 9
          Top = 233
          Width = 214
          Height = 30
          Caption = 'Process Yesterdays Ratings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnProcessYesterdayClick
        end
        object chkCreateReports: TcxCheckBox
          Left = 6
          Top = 50
          Caption = 'Create Reports'
          State = cbsChecked
          TabOrder = 4
          Width = 179
        end
        object chkFTPReports: TcxCheckBox
          Left = 6
          Top = 87
          Caption = 'FTP Reports'
          TabOrder = 5
          Width = 179
        end
        object btnProcessDaily: TButton
          Left = 9
          Top = 430
          Width = 214
          Height = 30
          Caption = 'Process Daily'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnClick = btnProcessDailyClick
        end
        object chkDownloadEquibase: TcxCheckBox
          Left = 6
          Top = 124
          Caption = 'Download Equibase'
          TabOrder = 7
          Width = 179
        end
        object chkDownloadDRF: TcxCheckBox
          Left = 6
          Top = 191
          Caption = 'Download DRF'
          TabOrder = 8
          Width = 179
        end
        object chkSuppressProcess: TcxCheckBox
          Left = 7
          Top = 158
          Caption = 'Suppress Process'
          TabOrder = 9
          Width = 179
        end
        object btnProcessAfterTomorrow: TButton
          Left = 7
          Top = 386
          Width = 215
          Height = 31
          Caption = 'Process After Tomorrows Ratings'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnClick = btnProcessAfterTomorrowClick
        end
        object btnProcessLateScratches: TButton
          Left = 9
          Top = 489
          Width = 214
          Height = 30
          Caption = 'Process Scratches'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnClick = btnProcessLateScratchesClick
        end
        object btnCreatePTCFile: TButton
          Left = 9
          Top = 553
          Width = 214
          Height = 30
          Caption = 'Process PTC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnClick = btnCreatePTCFileClick
        end
      end
      object Panel3: TPanel
        Left = 479
        Top = 5
        Width = 225
        Height = 486
        TabOrder = 1
        object chkUpdateALLRatings: TcxCheckBox
          Left = 5
          Top = 146
          Caption = 'Update ALL Cumulative Ratings'
          TabOrder = 0
          Width = 219
        end
        object btnUpdateRankings: TButton
          Left = 7
          Top = 375
          Width = 206
          Height = 31
          Caption = 'Update Checked'
          TabOrder = 1
          OnClick = btnUpdateRankingsClick
        end
        object chkGenRankingStats: TcxCheckBox
          Left = 5
          Top = 260
          Caption = 'Generate Rankings'
          TabOrder = 2
          Width = 161
        end
        object chkGenRankingStatsByTrack: TcxCheckBox
          Left = 5
          Top = 288
          Caption = 'Generate Rankings By Track'
          TabOrder = 3
          Width = 210
        end
        object chkUpdateCreatePKSKDK: TcxCheckBox
          Left = 5
          Top = 175
          Caption = 'Update/Create PK SK DK'
          TabOrder = 4
          Width = 197
        end
        object chkUpdateHHFromEquibase: TcxCheckBox
          Left = 5
          Top = 90
          Caption = 'Equibase Processing'
          TabOrder = 5
          Width = 210
        end
        object btnBatchSelectNone: TButton
          Left = 7
          Top = 410
          Width = 206
          Height = 31
          Caption = 'Select None'
          TabOrder = 6
          OnClick = btnBatchSelectNoneClick
        end
        object btnBatchSelectAll: TButton
          Left = 7
          Top = 447
          Width = 206
          Height = 31
          Caption = 'Select All'
          TabOrder = 7
          OnClick = btnBatchSelectAllClick
        end
        object chkUpdateCreateFK: TcxCheckBox
          Left = 5
          Top = 203
          Caption = 'Update/Create Final Keys'
          TabOrder = 8
          Width = 197
        end
        object chkUpdateTodaysWagerOrder: TcxCheckBox
          Left = 5
          Top = 231
          Caption = 'Update Final Sheet Order'
          TabOrder = 9
          Width = 197
        end
        object chkAddEquibaseCharts: TcxCheckBox
          Left = 5
          Top = 33
          Caption = 'Add Equibase Charts'
          TabOrder = 10
          Width = 210
        end
        object chkAddDRFCharts: TcxCheckBox
          Left = -418
          Top = -17
          Caption = 'Add DRF Charts'
          TabOrder = 11
          Width = 210
        end
        object chkUpdateHHFromDRF: TcxCheckBox
          Left = 5
          Top = 118
          Caption = 'DRF Processing'
          TabOrder = 12
          Width = 210
        end
        object cxCheckBox1: TcxCheckBox
          Left = 6
          Top = 316
          Caption = 'Archive History'
          TabOrder = 13
          Width = 211
        end
        object cxCheckBox3: TcxCheckBox
          Left = 9
          Top = 346
          Caption = 'Archive DRF/EQUIBASE'
          TabOrder = 14
          Width = 210
        end
        object chkUpdateYouBetBankWagers: TcxCheckBox
          Left = 5
          Top = 5
          Caption = 'Update YouBet Bank/Wagers'
          TabOrder = 15
          Width = 210
        end
      end
      object Panel1: TPanel
        Left = 246
        Top = 251
        Width = 229
        Height = 240
        TabOrder = 2
        object btnDownloadEquibaseResults: TButton
          Left = 10
          Top = 7
          Width = 208
          Height = 31
          Caption = 'Download Equibase Results'
          TabOrder = 0
          OnClick = btnDownloadEquibaseResultsClick
        end
        object btnDownloadEquibaseCharts: TButton
          Left = 10
          Top = 46
          Width = 208
          Height = 32
          Caption = 'Download Equibase Charts'
          TabOrder = 1
          OnClick = btnDownloadEquibaseChartsClick
        end
        object btnProcessEquibaseCharts: TButton
          Left = 10
          Top = 161
          Width = 208
          Height = 31
          Caption = 'Process Equibase Charts'
          TabOrder = 2
          OnClick = btnProcessEquibaseChartsClick
        end
        object btnAddEquibaseResultsFromDisk: TButton
          Left = 10
          Top = 84
          Width = 208
          Height = 30
          Caption = 'Add Equibase Results From Disk'
          TabOrder = 3
          OnClick = btnAddEquibaseResultsFromDiskClick
        end
        object btnAddEquibaseChartsFromDisk: TButton
          Left = 10
          Top = 123
          Width = 208
          Height = 32
          Caption = 'Add Equibase Charts From Disk'
          TabOrder = 4
          OnClick = btnAddEquibaseChartsFromDiskClick
        end
        object btnProcessEquibaseResults: TButton
          Left = 10
          Top = 201
          Width = 208
          Height = 30
          Caption = 'Process Equibase Results'
          TabOrder = 5
        end
      end
      object Panel5: TPanel
        Left = 246
        Top = 5
        Width = 229
        Height = 240
        TabOrder = 3
        object btnDownloadDRFResults: TButton
          Left = 10
          Top = 6
          Width = 208
          Height = 31
          Caption = 'Download DRF Results'
          TabOrder = 0
          OnClick = btnDownloadDRFResultsClick
        end
        object btnDownloadDRFCharts: TButton
          Left = 10
          Top = 44
          Width = 208
          Height = 29
          Caption = 'Download DRF Charts'
          TabOrder = 1
          OnClick = btnDownloadDRFChartsClick
        end
        object btnProcessDRFCharts: TButton
          Left = 10
          Top = 161
          Width = 208
          Height = 32
          Caption = 'Process DRF Charts'
          TabOrder = 2
          OnClick = btnProcessDRFChartsClick
        end
        object btnAddDRFResultsFromDisk: TButton
          Left = 10
          Top = 84
          Width = 208
          Height = 30
          Caption = 'Add DRF Results From Disk'
          TabOrder = 3
          OnClick = btnAddDRFResultsFromDiskClick
        end
        object btnAddDRFChartsFromDisk: TButton
          Left = 10
          Top = 130
          Width = 208
          Height = 32
          Caption = 'Add DRF Charts From Disk'
          TabOrder = 4
          OnClick = btnAddDRFChartsFromDiskClick
        end
        object btnProcessDRFResults: TButton
          Left = 10
          Top = 201
          Width = 208
          Height = 30
          Caption = 'Process DRF Results'
          TabOrder = 5
        end
      end
      object Panel7: TPanel
        Left = 246
        Top = 495
        Width = 229
        Height = 186
        TabOrder = 4
        object btnDownloadTsnResults: TButton
          Left = 10
          Top = 10
          Width = 208
          Height = 28
          Caption = 'Download TSN Results'
          TabOrder = 0
          OnClick = btnDownloadTsnResultsClick
        end
        object btnProcessTSNResults: TButton
          Left = 10
          Top = 47
          Width = 208
          Height = 31
          Caption = 'Process TSN Results'
          TabOrder = 1
          OnClick = btnProcessTSNResultsClick
        end
        object btnProcessLateChanges: TButton
          Left = 12
          Top = 127
          Width = 208
          Height = 31
          Caption = 'Process TSN Late Changes'
          TabOrder = 2
          OnClick = btnProcessLateChangesClick
        end
        object btnDownloadTSNLSC: TButton
          Left = 10
          Top = 89
          Width = 208
          Height = 28
          Caption = 'Download TSN Late Scratches'
          TabOrder = 3
          OnClick = btnDownloadTSNLSCClick
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Analysis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -18
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 236
        Height = 895
        Align = alLeft
        TabOrder = 0
        object btnAnalysisFinalOrderForm: TButton
          Left = 10
          Top = 6
          Width = 208
          Height = 31
          Caption = 'Final Order'
          TabOrder = 0
          OnClick = btnAnalysisFinalOrderFormClick
        end
        object btnRankingsForm: TButton
          Left = 10
          Top = 52
          Width = 208
          Height = 30
          Caption = 'Rankings'
          TabOrder = 1
          OnClick = btnRankingsFormClick
        end
        object btnTodaysEntriesForm: TButton
          Left = 10
          Top = 98
          Width = 208
          Height = 32
          Caption = 'Todays Entries'
          TabOrder = 2
          OnClick = btnTodaysEntriesFormClick
        end
        object btnHorseHistoryForm: TButton
          Left = 10
          Top = 146
          Width = 208
          Height = 31
          Caption = 'Horse History'
          TabOrder = 3
        end
        object btnConnectionsForm: TButton
          Left = 10
          Top = 193
          Width = 208
          Height = 31
          Caption = 'Connections'
          TabOrder = 4
          OnClick = btnConnectionsFormClick
        end
        object btnQueryPrevDayForm: TButton
          Left = 10
          Top = 370
          Width = 208
          Height = 31
          Caption = 'QueryPrevDay'
          TabOrder = 5
          OnClick = btnQueryPrevDayFormClick
        end
        object btnTrainerConnections: TButton
          Left = 20
          Top = 262
          Width = 208
          Height = 31
          Caption = 'Trainer Connections'
          TabOrder = 6
          OnClick = btnTrainerConnectionsClick
        end
        object btnQueryPrevWeekForm: TButton
          Left = 10
          Top = 430
          Width = 208
          Height = 30
          Caption = 'QueryPrevWeek'
          TabOrder = 7
          OnClick = btnQueryPrevWeekFormClick
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Testing'
      ImageIndex = 6
      object cxButton3: TcxButton
        Left = 9
        Top = 164
        Width = 406
        Height = 32
        Caption = 'Entry Form'
        TabOrder = 0
        OnClick = cxButton3Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnConnections: TcxButton
        Left = 9
        Top = 214
        Width = 406
        Height = 32
        Caption = 'Connections Form'
        TabOrder = 1
        OnClick = btnConnectionsClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnReProcessDays: TButton
        Left = 9
        Top = 316
        Width = 406
        Height = 32
        Caption = 'Reprocess Days'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnReProcessDaysClick
      end
      object btnCreateKeys: TcxButton
        Left = 9
        Top = 266
        Width = 406
        Height = 32
        Caption = 'Create Keys'
        TabOrder = 3
        OnClick = btnCreateKeysClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton5: TcxButton
        Left = 9
        Top = 11
        Width = 406
        Height = 32
        Caption = 'Test'
        TabOrder = 4
        OnClick = cxButton5Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnTestReports: TcxButton
        Left = 9
        Top = 112
        Width = 406
        Height = 32
        Caption = 'Test Reports'
        TabOrder = 5
        OnClick = btnTestReportsClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object Memo1: TMemo
        Left = -33
        Top = -164
        Width = 494
        Height = 80
        Lines.Strings = (
          'Memo1')
        TabOrder = 6
      end
      object btnDownloadDays: TButton
        Left = 9
        Top = 368
        Width = 406
        Height = 32
        Caption = 'Reprocess DRF Charts'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = btnDownloadDaysClick
      end
      object btnHHTest: TcxButton
        Left = 9
        Top = 52
        Width = 406
        Height = 32
        Caption = 'HH Test'
        TabOrder = 8
        OnClick = btnHHTestClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnWagers: TcxButton
        Left = 9
        Top = 425
        Width = 406
        Height = 32
        Caption = 'Rerun Wagers'
        TabOrder = 9
        OnClick = btnWagersClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnCreateFinalOrder: TcxButton
        Left = 9
        Top = 482
        Width = 406
        Height = 32
        Caption = 'Create Final Order From One Year Data'
        TabOrder = 10
        OnClick = btnCreateFinalOrderClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnCreateRankings: TcxButton
        Left = 7
        Top = 529
        Width = 407
        Height = 32
        Caption = 'Ranks Stats '
        TabOrder = 11
        OnClick = btnCreateRankingsClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object edtAltLastDateToProcess: TcxDateEdit
        Left = 578
        Top = 319
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 12
        Width = 121
      end
      object edtAltFirstDateToProcess: TcxDateEdit
        Left = 434
        Top = 319
        EditValue = 0d
        Properties.DateButtons = [btnClear, btnNow, btnToday]
        Properties.SaveTime = False
        Properties.ShowTime = False
        TabOrder = 13
        Width = 121
      end
      object btnCreateAnalysisTables: TButton
        Left = 453
        Top = 558
        Width = 405
        Height = 30
        Caption = 'Create Analysis Tables'
        TabOrder = 14
        OnClick = btnCreateAnalysisTablesClick
      end
      object btnDownloadReprocessDRFEquibase: TButton
        Left = 471
        Top = 437
        Width = 407
        Height = 32
        Caption = 'Download/Reprocess DRF/Equibase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = btnDownloadReprocessDRFEquibaseClick
      end
      object btnReprocessTsnResults: TButton
        Left = 9
        Top = 594
        Width = 406
        Height = 32
        Caption = 'Reprocess TSN Results'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnClick = btnReprocessTsnResultsClick
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Edit'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 228
        Height = 458
        Align = alLeft
        TabOrder = 0
        object btnOptions: TButton
          Left = 10
          Top = 6
          Width = 208
          Height = 31
          Caption = 'Options'
          TabOrder = 0
          OnClick = btnOptionsClick
        end
        object btnBank: TButton
          Left = 10
          Top = 46
          Width = 208
          Height = 30
          Caption = 'Bank'
          TabOrder = 1
          OnClick = btnBankClick
        end
        object btnEditWagers: TButton
          Left = 10
          Top = 85
          Width = 208
          Height = 31
          Caption = 'Wagers'
          TabOrder = 2
          OnClick = btnEditWagersClick
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Reports'
      ImageIndex = 5
      object Panel10: TPanel
        Left = 11
        Top = 183
        Width = 433
        Height = 74
        Alignment = taLeftJustify
        TabOrder = 3
        object chkYouBetResultsReports: TcxCheckBox
          Left = 10
          Top = 7
          Caption = 'YouBet Results'
          State = cbsChecked
          TabOrder = 0
          Width = 139
        end
        object chkTopPickResultsReports: TcxCheckBox
          Left = 10
          Top = 30
          Caption = 'Top Pick Results'
          TabOrder = 1
          Width = 139
        end
        object chkLinerResultsReports: TcxCheckBox
          Left = 158
          Top = 9
          Caption = 'Liner Results'
          TabOrder = 2
          Width = 109
        end
        object chkWagerResultsReports: TcxCheckBox
          Left = 159
          Top = 31
          Caption = 'Wager Results'
          TabOrder = 3
          Width = 118
        end
        object chkExoticResultReports: TcxCheckBox
          Left = 286
          Top = 9
          Caption = 'Exotic'
          TabOrder = 4
          Width = 109
        end
      end
      object Panel11: TPanel
        Left = 11
        Top = 111
        Width = 355
        Height = 67
        TabOrder = 2
        object chkPreviousDays: TcxCheckBox
          Left = 7
          Top = 7
          Caption = 'Previous Days'
          State = cbsChecked
          TabOrder = 0
          Width = 202
        end
        object chkPrevious21Days: TcxCheckBox
          Left = 9
          Top = 32
          Caption = 'Previous 90 Days '
          Properties.NullStyle = nssUnchecked
          TabOrder = 1
          Width = 140
        end
      end
      object Panel8: TPanel
        Left = 11
        Top = 6
        Width = 353
        Height = 100
        TabOrder = 0
        object btnCreatePreviousDayTables: TcxButton
          Left = 7
          Top = 69
          Width = 340
          Height = 25
          Caption = 'Create Tables '
          TabOrder = 0
          OnClick = btnCreatePreviousDayTablesClick
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
        end
        object chkCreatePreviousDaysResultTable: TcxCheckBox
          Left = 0
          Top = 5
          Caption = 'Create Previous Days Result Tables'
          State = cbsChecked
          TabOrder = 1
          Width = 262
        end
        object chkCreatePrevious21DaysResultTable: TcxCheckBox
          Left = 1
          Top = 34
          Caption = 'Create Previous 21 Days Result Tables'
          State = cbsChecked
          TabOrder = 2
          Width = 262
        end
      end
      object Panel9: TPanel
        Left = 12
        Top = 263
        Width = 915
        Height = 309
        TabOrder = 1
        object btnSelectNoneResultReports: TButton
          Left = 9
          Top = 5
          Width = 898
          Height = 28
          Caption = 'Select None'
          TabOrder = 0
          OnClick = btnSelectNoneResultReportsClick
        end
        object btnSelectAllResultReports: TButton
          Left = 9
          Top = 41
          Width = 898
          Height = 28
          Caption = 'Select All'
          TabOrder = 1
          OnClick = btnSelectAllResultReportsClick
        end
        object btnDeleteResultReports: TButton
          Left = 9
          Top = 76
          Width = 897
          Height = 29
          Caption = 'Delete Reports'
          TabOrder = 2
          OnClick = btnDeleteResultReportsClick
        end
        object btnCreateResultReports: TButton
          Left = 9
          Top = 112
          Width = 897
          Height = 27
          Caption = 'Create Reports'
          TabOrder = 3
          OnClick = btnCreateResultReportsClick
        end
        object btnFTPResultReports: TButton
          Left = 9
          Top = 148
          Width = 897
          Height = 28
          Caption = 'FTP Reports'
          TabOrder = 4
          OnClick = btnFTPResultReportsClick
        end
        object btnCreateJustResultReports: TButton
          Left = 7
          Top = 191
          Width = 898
          Height = 27
          Caption = 'Create Just Reports'
          TabOrder = 5
          OnClick = btnCreateJustResultReportsClick
        end
        object Button1: TButton
          Left = 7
          Top = 240
          Width = 898
          Height = 27
          Caption = 'Process Results'
          TabOrder = 6
          OnClick = Button1Click
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Log'
      ImageIndex = 6
      object btnDeleteLog: TButton
        Left = 5
        Top = 452
        Width = 252
        Height = 32
        Caption = 'Delete Log'
        TabOrder = 0
        OnClick = btnDeleteLogClick
      end
      object btnRefreshLog: TButton
        Left = 297
        Top = 452
        Width = 256
        Height = 32
        Caption = 'Refresh Log'
        TabOrder = 1
        OnClick = btnRefreshLogClick
      end
      object cxRtfLog: TcxRichEdit
        Left = 5
        Top = 5
        ParentFont = False
        Properties.HideScrollBars = False
        Properties.HideSelection = False
        Properties.PlainText = True
        Properties.ReadOnly = True
        Properties.ScrollBars = ssVertical
        Properties.SelectionBar = True
        Lines.Strings = (
          '')
        Style.TextStyle = []
        TabOrder = 2
        Height = 441
        Width = 924
      end
      object btnLoadExceptionLog: TButton
        Left = 592
        Top = 459
        Width = 256
        Height = 32
        Caption = 'Load Exception Log'
        TabOrder = 3
        OnClick = btnLoadExceptionLogClick
      end
      object btnLoadEquibaseLog: TButton
        Left = 1
        Top = 491
        Width = 256
        Height = 32
        Caption = 'Load Equibase Log'
        TabOrder = 4
        OnClick = btnLoadEquibaseLogClick
      end
      object btnLoadTSNLog: TButton
        Left = 297
        Top = 501
        Width = 256
        Height = 32
        Caption = 'Load TSN Log'
        TabOrder = 5
        OnClick = btnLoadTSNLogClick
      end
      object btnLoadStatsLog: TButton
        Left = 592
        Top = 501
        Width = 256
        Height = 32
        Caption = 'Load Stat Log'
        TabOrder = 6
        OnClick = btnLoadStatsLogClick
      end
      object btnLoadAxcisLog: TButton
        Left = 1
        Top = 540
        Width = 256
        Height = 32
        Caption = 'Load Axcis Log'
        TabOrder = 7
        OnClick = btnLoadAxcisLogClick
      end
      object btnLoadBloodHorseLog: TButton
        Left = 297
        Top = 550
        Width = 256
        Height = 32
        Caption = 'Load BloodHorse Log'
        TabOrder = 8
        OnClick = btnLoadBloodHorseLogClick
      end
    end
    object cxTabSheet6: TcxTabSheet
      Caption = 'Unused'
      ImageIndex = 7
      object btnDownloadAxcisBuggy: TButton
        Left = 140
        Top = 36
        Width = 208
        Height = 32
        Caption = 'Download All Harness Files'
        TabOrder = 0
        OnClick = btnDownloadAxcisBuggyClick
      end
      object btnDownloadFlashNet: TButton
        Left = 170
        Top = 202
        Width = 208
        Height = 31
        Caption = 'Download Flashnet Files'
        TabOrder = 1
        OnClick = btnDownloadFlashNetClick
      end
      object btnImportAxcisHarness: TButton
        Left = 12
        Top = 357
        Width = 208
        Height = 29
        Caption = 'Import Axcis Files For History'
        TabOrder = 2
        OnClick = btnImportAxcisHarnessClick
      end
      object btnImportFlashNet: TButton
        Left = 12
        Top = 396
        Width = 208
        Height = 30
        Caption = 'Import Harness Flash Net'
        TabOrder = 3
        OnClick = btnImportFlashNetClick
      end
      object chkCreateHarnessReport: TcxCheckBox
        Left = 244
        Top = 164
        Caption = 'Harness Report'
        TabOrder = 4
        Width = 122
      end
      object chkCreateHarnessValueReport: TcxCheckBox
        Left = 303
        Top = 137
        Caption = 'Harness Value Report'
        TabOrder = 5
        Width = 167
      end
      object chkFTPHarnessValueReport: TcxCheckBox
        Left = 292
        Top = 337
        Caption = 'Harness Value Report'
        TabOrder = 6
        Width = 162
      end
      object chkFTPMikeReport: TcxCheckBox
        Left = 431
        Top = 225
        Caption = 'Mike Report'
        TabOrder = 7
        Width = 133
      end
      object chkFTPHarnessReport: TcxCheckBox
        Left = 6
        Top = 274
        Caption = 'Harness Report'
        TabOrder = 8
        Width = 133
      end
      object chkFTPJimReport: TcxCheckBox
        Left = 7
        Top = 249
        Caption = 'Jim Report'
        TabOrder = 9
        Width = 133
      end
      object btnBackupBuggy: TButton
        Left = 22
        Top = 160
        Width = 208
        Height = 32
        Caption = 'Backup Harness Files'
        TabOrder = 10
        OnClick = btnBackupBuggyClick
      end
      object Panel14: TPanel
        Left = 246
        Top = 406
        Width = 229
        Height = 163
        TabOrder = 11
        object btnDownloadUSTACharts: TButton
          Left = 10
          Top = 6
          Width = 208
          Height = 31
          Caption = 'Download USTA Charts'
          TabOrder = 0
          OnClick = btnDownloadUSTAChartsClick
        end
        object btnDownloadSCCharts: TButton
          Left = 10
          Top = 81
          Width = 208
          Height = 31
          Caption = 'Download SC Charts'
          TabOrder = 1
          OnClick = btnDownloadSCChartsClick
        end
        object btnProcessSCCharts: TButton
          Left = 10
          Top = 124
          Width = 208
          Height = 30
          Caption = 'Process SC Charts'
          TabOrder = 2
          OnClick = btnProcessSCChartsClick
        end
        object btnProcessUSTACharts: TButton
          Left = 10
          Top = 44
          Width = 208
          Height = 30
          Caption = 'Process USTA Charts'
          TabOrder = 3
          OnClick = btnProcessUSTAChartsClick
        end
      end
      object chkFTPAngleReport: TcxCheckBox
        Left = 6
        Top = 119
        Caption = 'Angle Report'
        TabOrder = 12
        Width = 133
      end
      object chkFTPContestReport: TcxCheckBox
        Left = 460
        Top = -6
        Caption = 'Contest Report'
        TabOrder = 13
        Width = 133
      end
      object btnExportToNexus: TcxButton
        Left = 28
        Top = 572
        Width = 200
        Height = 32
        Caption = 'Export To Nexus'
        TabOrder = 14
        OnClick = btnExportToNexusClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton2: TcxButton
        Left = 9
        Top = 427
        Width = 219
        Height = 30
        Caption = 'Test Arrays'
        TabOrder = 15
        OnClick = cxButton2Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object Panel12: TPanel
        Left = 583
        Top = 124
        Width = 277
        Height = 197
        TabOrder = 16
        object chkPrevious21DaysByRaceDate: TcxCheckBox
          Left = 11
          Top = 5
          Caption = 'Previous 90 Days By Race Date'
          Properties.OnChange = chkPrevious21DaysByRaceDatePropertiesChange
          TabOrder = 0
          Width = 236
        end
        object chkPrevious21DaysByTrkCode: TcxCheckBox
          Left = 11
          Top = 32
          Caption = 'Previous 90 Days By Track Code'
          Properties.OnChange = chkPrevious21DaysByTrkCodePropertiesChange
          TabOrder = 1
          Width = 236
        end
        object chkPrevious21DaysByRaceType: TcxCheckBox
          Left = 11
          Top = 59
          Caption = 'Previous 90 Days By Race Type'
          Properties.OnChange = chkPrevious21DaysByRaceTypePropertiesChange
          TabOrder = 2
          Width = 228
        end
        object chkPrevious21DaysByML: TcxCheckBox
          Left = 12
          Top = 86
          Caption = 'Previous 90 By Morning Line'
          Properties.OnChange = chkPrevious21DaysByMLPropertiesChange
          TabOrder = 3
          Width = 227
        end
      end
      object btnEmailWagerReports: TButton
        Left = 86
        Top = 656
        Width = 388
        Height = 28
        Caption = 'Email Wager Reports'
        TabOrder = 17
        OnClick = btnEmailWagerReportsClick
      end
      object btnEmailResultReports: TButton
        Left = 39
        Top = 614
        Width = 677
        Height = 28
        Caption = 'Email Result Reports'
        TabOrder = 18
        OnClick = btnEmailResultReportsClick
      end
    end
  end
  object qrySQL: TDBISAMQuery
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    BeforeOpen = qrySQLBeforeOpen
    AfterClose = qrySQLAfterClose
    DatabaseName = 'dbSireRate'
    EngineVersion = '4.24 Build 1'
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT DISTINCT'
      '         SUM(TrainerRecords.TrnOddsGt5Wins) TrnOddsGt5Wins,'
      '         SUM(TrainerRecords.TrnOddsGt5Starts) TrnOddsGt5Starts,'
      '         SUM(TrainerRecords.TrnOddsLess5Wins) TrnOddsLess5Wins,'
      
        '         SUM(TrainerRecords.TrnOddsLess5Starts) TrnOddsLess5Star' +
        'ts,'
      '         SUM(TrainerRecords.TrnStarts) TrnStarts,'
      '         SUM(TrainerRecords.TrnWins) TrnWins,'
      '         SUM(TrainerRecords.TrnLast30Wins) TrnLast30Wins,'
      '         SUM(TrainerRecords.TrnLast30Starts) TrnLast30Starts'
      '    FROM TrainerRecords  ')
    Params = <>
    ReadOnly = True
    OnQueryProgress = qrySQLQueryProgress
    BeforeExecute = qrySQLBeforeExecute
    AfterExecute = qrySQLAfterExecute
    Left = 785
    Top = 364
  end
  object ztvRar: TUnRar
    CpuType = cptAuto
    FileSpec.Strings = (
      '*.*')
    UseStoredDirs = False
    Left = 857
    Top = 342
  end
  object ztvLha: TUnLha
    CpuType = cptAuto
    FileSpec.Strings = (
      '*.*')
    UseStoredDirs = False
    Left = 689
    Top = 276
  end
  object idAntiFreeze: TIdAntiFreeze
    Left = 776
    Top = 424
  end
  object ztvZip: TZip
    Attributes = [fsZeroAttr, fsReadOnly, fsArchive, fsCompressed, fsEncrypted]
    DeleteOptions = doAllowUndo
    RecurseDirs = False
    ArcType = atZip
    AttributesEx = []
    CompressMethod = cmDeflate
    DefaultExt = '.zip'
    StoredDirNames = sdAbsoluteNoDrv
    StoreFilesOfType.Strings = (
      '.ACE'
      '.ARC'
      '.ARJ'
      '.BH'
      '.CAB'
      '.ENC'
      '.GZ'
      '.HA'
      '.JAR'
      '.LHA'
      '.LZH'
      '.PAK'
      '.PK3'
      '.PK_'
      '.RAR'
      '.TAR'
      '.TGZ'
      '.UUE'
      '.UU'
      '.WAR'
      '.XXE'
      '.Z'
      '.ZIP'
      '.ZOO')
    TempDir = 'C:\DOCUME~1\ADMINI~1\LOCALS~1\Temp\'
    Switch = swAdd
    Left = 760
    Top = 547
  end
  object idHTTP: TIdHTTP
    OnStatus = idHTTPStatus
    IOHandler = IdSSLIOHandlerSocketOpenSSL1
    OnDisconnected = idHTTPDisconnected
    OnWork = idHTTPWork
    OnWorkBegin = idHTTPWorkBegin
    OnWorkEnd = idHTTPWorkEnd
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = []
    CookieManager = idCookieManager
    Left = 680
    Top = 144
  end
  object idFtp: TIdFTP
    OnStatus = idFtpStatus
    OnDisconnected = idFtpDisconnected
    OnWork = idFtpWork
    OnWorkBegin = idFtpWorkBegin
    OnWorkEnd = idFtpWorkEnd
    AutoLogin = True
    Host = 'www.ksklimited.com'
    Passive = True
    Password = 'wildmagic1234'
    TransferTimeout = 10000
    Username = 'JoeKarasKSK'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    ReadTimeout = 10000
    Left = 752
    Top = 56
  end
  object idCookieManager: TIdCookieManager
    Left = 864
    Top = 216
  end
  object timChk: TTimer
    Interval = 100000
    OnTimer = timChkTimer
    Left = 696
    Top = 63
  end
  object dxBarMgr: TdxBarManager
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Custom 1'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 1011
        FloatTop = 86
        FloatClientWidth = 0
        FloatClientHeight = 0
        ItemLinks = <
          item
            Item = dxBarControlContainerItem1
            Visible = True
          end>
        Name = 'Custom 1'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = False
      end>
    Categories.Strings = (
      'Default'
      'File'
      'Menus')
    Categories.ItemsVisibles = (
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True)
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 752
    Top = 120
    DockControlHeights = (
      0
      0
      28
      0)
    object File1: TdxBarSubItem
      Caption = 'File'
      Category = 2
      Visible = ivAlways
      ItemLinks = <
        item
          Item = mnuFileExit
          Visible = True
        end>
    end
    object Form11: TdxBarButton
      Caption = 'InMemory'
      Category = 1
      Visible = ivAlways
    end
    object Query1: TdxBarButton
      Caption = 'Query'
      Category = 1
      Visible = ivAlways
    end
    object Inspector1: TdxBarButton
      Caption = 'Ratings'
      Category = 1
      Visible = ivAlways
    end
    object mnuFileExit: TdxBarButton
      Caption = 'E&xit'
      Category = 1
      Visible = ivAlways
      OnClick = mnuFileExitClick
    end
    object dxBarButton1: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarButton2: TdxBarButton
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'New Item'
      Category = 0
      Visible = ivAlways
      ItemLinks = <>
    end
    object dxBarSpinEdit1: TdxBarSpinEdit
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Width = 100
    end
    object dxBarControlContainerItem1: TdxBarControlContainerItem
      Caption = 'New Item'
      Category = 0
      Hint = 'New Item'
      Visible = ivAlways
      Control = edtOverrideDate
    end
  end
  object extDevicesOptions: TExtraOptions
    About = 'TExtraDevices 2.97'
    HTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    HTML.BackLink = '&lt&lt'
    HTML.ForwardLink = '&gt&gt'
    HTML.ShowLinks = True
    HTML.UseTextFileName = False
    HTML.ZoomableImages = False
    HTML.Visible = True
    HTML.PixelFormat = pf8bit
    HTML.SingleFileOutput = False
    XHTML.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    XHTML.BackLink = '&lt&lt'
    XHTML.ForwardLink = '&gt&gt'
    XHTML.ShowLinks = True
    XHTML.UseTextFileName = False
    XHTML.ZoomableImages = False
    XHTML.Visible = True
    XHTML.PixelFormat = pf8bit
    XHTML.SingleFileOutput = False
    RTF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    RTF.Visible = True
    RTF.RichTextAsImage = False
    RTF.UseTextBox = True
    RTF.PixelFormat = pf8bit
    RTF.PixelsPerInch = 96
    Lotus.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Lotus.Visible = True
    Lotus.ColSpacing = 16934
    Quattro.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Quattro.Visible = True
    Quattro.ColSpacing = 16934
    Excel.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Excel.Visible = True
    Excel.ColSpacing = 16934
    Excel.RowSizing = False
    Excel.AutoConvertToNumber = True
    Graphic.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    Graphic.PixelFormat = pf8bit
    Graphic.UseTextFileName = False
    Graphic.Visible = True
    Graphic.PixelsPerInch = 96
    Graphic.GrayScale = False
    PDF.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    PDF.Creator = 'KSK'
    PDF.Author = 'KSK'
    PDF.FastCompression = True
    PDF.CompressImages = True
    PDF.ScaleImages = True
    PDF.Visible = True
    PDF.RichTextAsImage = False
    PDF.RichEditPixelFormat = pf1bit
    PDF.PixelFormat = pf32bit
    PDF.PixelsPerInch = 96
    PDF.Permissions = [ppPrint, ppCopy]
    PDF.ViewerPreferences = []
    PDF.AutoEmbedFonts = True
    PDF.ImageFormat = riBitmap
    DotMatrix.ItemsToExport = [reText, reImage, reLine, reShape, reRTF, reBarCode, reCheckBox]
    DotMatrix.Visible = True
    DotMatrix.CharsPerInch = cs10CPI
    DotMatrix.LinesPerInch = ls6LPI
    DotMatrix.Port = 'LPT1'
    DotMatrix.ContinousPaper = False
    DotMatrix.PrinterType = ptEpson
    Left = 864
    Top = 544
  end
  object DHTMLParse: TDIHtmlParser
    FilterHtmlTags.StartTags = fiShow
    FilterHtmlTags.EndTags = fiShow
    FilterScripts = fiShow
    FilterText = fiShow
    NormalizeWhiteSpace = True
    Left = 672
    Top = 424
  end
  object styRepository: TcxStyleRepository
    Left = 896
    Top = 264
    PixelsPerInch = 120
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 13160660
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 6956042
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 13160660
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 6956042
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor]
      Color = 14590588
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13795663
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clYellow
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14590588
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor]
      Color = 15185807
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15120279
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13160660
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 13160660
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10841658
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13160660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 6956042
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6956042
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle67: TcxStyle
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clSilver
      TextColor = clBlack
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461355
      TextColor = clBlack
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor]
      Color = 12937777
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11295531
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor]
      Color = 15119240
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15120025
      TextColor = clWhite
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clSilver
      TextColor = clBlack
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461355
      TextColor = clBlack
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461355
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6447714
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clSilver
      TextColor = clBlack
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461355
      TextColor = clBlack
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle68
      Styles.ContentEven = cxStyle69
      Styles.ContentOdd = cxStyle70
      Styles.Inactive = cxStyle75
      Styles.Selection = cxStyle78
      Styles.Footer = cxStyle71
      Styles.Group = cxStyle72
      Styles.GroupByBox = cxStyle73
      Styles.Header = cxStyle74
      Styles.Indicator = cxStyle76
      Styles.Preview = cxStyle77
      BuiltIn = True
    end
    object cxVerticalGridStyleSheetUserFormat4: TcxVerticalGridStyleSheet
      Caption = 'UserFormat4'
      Styles.Background = cxStyle79
      Styles.Content = cxStyle81
      Styles.Inactive = cxStyle83
      Styles.Selection = cxStyle85
      Styles.Category = cxStyle80
      Styles.Header = cxStyle82
      Styles.IncSearch = cxStyle84
      BuiltIn = True
    end
    object GridBandedTableViewStyleSheetUserFormat4: TcxGridBandedTableViewStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle87
      Styles.ContentEven = cxStyle88
      Styles.ContentOdd = cxStyle89
      Styles.Inactive = cxStyle94
      Styles.Selection = cxStyle97
      Styles.Footer = cxStyle90
      Styles.Group = cxStyle91
      Styles.GroupByBox = cxStyle92
      Styles.Header = cxStyle93
      Styles.Indicator = cxStyle95
      Styles.Preview = cxStyle96
      Styles.BandHeader = cxStyle86
      BuiltIn = True
    end
    object GridCardViewStyleSheetUserFormat4: TcxGridCardViewStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle110
      Styles.ContentEven = cxStyle111
      Styles.ContentOdd = cxStyle112
      Styles.Inactive = cxStyle113
      Styles.Selection = cxStyle115
      Styles.CaptionRow = cxStyle109
      Styles.RowCaption = cxStyle114
      BuiltIn = True
    end
  end
  object IdMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 874
    Top = 92
  end
  object IdSMTP: TIdSMTP
    Host = 'mail.ksklimited.com'
    Password = 'wildmagic2'
    SASLMechanisms = <>
    Username = 'jkaras@ksklimited.com'
    Left = 904
    Top = 152
  end
  object DIHtmlWriterPlugin: TDIHtmlWriterPlugin
    FilterComments = fiShow
    Left = 808
    Top = 152
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Method = sslvSSLv3
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 752
    Top = 480
  end
  object vZip: TVCLUnZip
    DestDir = 'c:\TsnDownload'
    OverwriteMode = Always
    FilesList.Strings = (
      '*.*')
    DoAll = True
    IncompleteZipMode = izAssumeNotAZip
    RetainAttributes = False
    FlushFilesOnClose = True
    Left = 672
    Top = 208
  end
  object MadExceptionHandler1: TMadExceptionHandler
    Left = 784
    Top = 288
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 712
    Top = 376
  end
  object csvOut: TDataToWK1
    Columns = <>
    Left = 730
    Top = 186
  end
  object csvPTC: TDataToAscii
    DataSet = PTCWager
    Separator = ','
    Quote = #0
    Fields = <>
    Options = []
    Left = 808
    Top = 64
  end
  object PTCWager: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbSireRate'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'PTCWAGER'
    Left = 864
    Top = 416
  end
  object VCLZip: TVCLZip
    ZipName = 'C:\RatingsReports\Export\ExportFiles.zip'
    DestDir = 'C:\RatingsReports\Export'
    RootDir = 'C:\RatingsReports\Export\'
    OverwriteMode = Always
    DoProcessMessages = False
    Left = 928
    Top = 280
  end
end
