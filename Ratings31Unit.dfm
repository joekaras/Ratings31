object MainForm: TMainForm
  Left = 36
  Top = 52
  Width = 797
  Height = 570
  Caption = 'Ratings 3.1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object staBar: TStatusBar
    Left = 0
    Top = 524
    Width = 789
    Height = 19
    Panels = <>
    ParentShowHint = False
    ShowHint = False
    SimplePanel = True
  end
  object pgCtrlMain: TcxPageControl
    Left = 0
    Top = 23
    Width = 789
    Height = 472
    ActivePage = cxTabSheet2
    Align = alClient
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    ClientRectBottom = 470
    ClientRectLeft = 2
    ClientRectRight = 787
    ClientRectTop = 22
    object tabDaily: TcxTabSheet
      Caption = 'Daily'
      object lblLocalPath: TLabel
        Left = 0
        Top = 405
        Width = 800
        Height = 21
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
        Top = 426
        Width = 800
        Height = 22
        Align = alBottom
        AutoSize = False
        Caption = 'ServerPath'
        Color = clPurple
        ParentColor = False
        Transparent = False
        Visible = False
      end
      object pnlAxcis: TPanel
        Left = 8
        Top = 10
        Width = 186
        Height = 479
        TabOrder = 0
        object btnStartOfDay: TButton
          Left = 10
          Top = 7
          Width = 169
          Height = 25
          Caption = 'Start Of Day'
          TabOrder = 0
          OnClick = btnStartOfDayClick
        end
        object btnDownloadAxcis: TButton
          Left = 10
          Top = 37
          Width = 169
          Height = 26
          Caption = 'Download Axcis Files'
          TabOrder = 1
          OnClick = btnDownloadAxcisClick
        end
        object btnImport: TButton
          Left = 10
          Top = 69
          Width = 169
          Height = 24
          Caption = 'Import Axcis Files For History'
          TabOrder = 2
          OnClick = btnImportClick
        end
        object btnBackup: TButton
          Left = 10
          Top = 101
          Width = 169
          Height = 25
          Caption = 'Backup Axcis Files'
          TabOrder = 3
          OnClick = btnBackupClick
        end
        object btnCreateTodaysRatings: TButton
          Left = 10
          Top = 132
          Width = 169
          Height = 26
          Caption = 'Create Todays Ratings File'
          TabOrder = 4
          OnClick = btnCreateTodaysRatingsClick
        end
        object btnImportToday: TButton
          Left = 10
          Top = 164
          Width = 169
          Height = 25
          Caption = 'Import Todays Axcis For Reports'
          TabOrder = 5
          OnClick = btnImportTodayClick
        end
        object btnDownloadAxcisBuggy: TButton
          Left = 10
          Top = 196
          Width = 169
          Height = 26
          Caption = 'Download All Harness Files'
          TabOrder = 6
          OnClick = btnDownloadAxcisBuggyClick
        end
        object btnImportFlashNet: TButton
          Left = 10
          Top = 322
          Width = 169
          Height = 24
          Caption = 'Import Harness Flash Net'
          TabOrder = 7
          OnClick = btnImportFlashNetClick
        end
        object btnDownloadFlashNet: TButton
          Left = 10
          Top = 228
          Width = 169
          Height = 25
          Caption = 'Download Flashnet Files'
          TabOrder = 8
          OnClick = btnDownloadFlashNetClick
        end
        object btnBackupBuggy: TButton
          Left = 10
          Top = 258
          Width = 169
          Height = 26
          Caption = 'Backup Harness Files'
          TabOrder = 9
          OnClick = btnBackupBuggyClick
        end
        object btnImportAxcisHarness: TButton
          Left = 10
          Top = 290
          Width = 169
          Height = 24
          Caption = 'Import Axcis Files For History'
          TabOrder = 10
          OnClick = btnImportAxcisHarnessClick
        end
        object btnDownloadSelections: TButton
          Left = 10
          Top = 353
          Width = 169
          Height = 25
          Caption = 'Download Selections '
          TabOrder = 11
          OnClick = btnDownloadSelectionsClick
        end
        object btnProcessSelections: TButton
          Left = 10
          Top = 385
          Width = 169
          Height = 24
          Caption = 'Process Selections '
          TabOrder = 12
          OnClick = btnProcessSelectionsClick
        end
        object btnDownloadEquibaseStats: TButton
          Left = 10
          Top = 417
          Width = 169
          Height = 25
          Caption = 'Download Equibase Stats'
          TabOrder = 13
          OnClick = btnDownloadEquibaseStatsClick
        end
        object btnProcessEquibaseStats: TButton
          Left = 10
          Top = 449
          Width = 169
          Height = 24
          Caption = 'Process Equibase Stats'
          TabOrder = 14
          OnClick = btnProcessEquibaseStatsClick
        end
      end
      object pnlOptions: TPanel
        Left = 201
        Top = 8
        Width = 326
        Height = 95
        TabOrder = 1
        object TLabel
          Left = 264
          Top = 40
          Width = 3
          Height = 13
        end
        object edtProxy: TcxTextEdit
          Left = 136
          Top = 38
          Properties.OnChange = edtProxyPropertiesChange
          TabOrder = 0
          Width = 97
        end
        object chkProcessAllDates: TcxCheckBox
          Left = 8
          Top = 61
          Caption = 'Process All Dates'
          Properties.OnChange = chkProcessAllDatesPropertiesChange
          TabOrder = 1
          Width = 121
        end
        object chkUseProxy: TcxCheckBox
          Left = 8
          Top = 35
          Caption = 'Proxy '
          Properties.OnChange = chkUseProxyPropertiesChange
          TabOrder = 2
          Width = 121
        end
        object chkOverrideDate: TcxCheckBox
          Left = 8
          Top = 8
          Caption = 'Override Date'
          Properties.OnChange = chkOverrideDatePropertiesChange
          State = cbsChecked
          TabOrder = 3
          Width = 121
        end
        object edtOverrideDate: TcxDateEdit
          Left = 137
          Top = 7
          EditValue = 0d
          Properties.DateButtons = [btnClear, btnNow, btnToday]
          Properties.SaveTime = False
          Properties.ShowTime = False
          TabOrder = 4
          Width = 98
        end
      end
      object pnlReports: TPanel
        Left = 200
        Top = 110
        Width = 165
        Height = 352
        TabOrder = 2
        object btnCreateReports: TButton
          Left = 14
          Top = 297
          Width = 136
          Height = 25
          Caption = 'Create Reports'
          TabOrder = 1
          OnClick = btnCreateReportsClick
        end
        object chkCreateTipReport: TcxCheckBox
          Left = 15
          Top = 7
          Caption = 'Tip Report'
          TabOrder = 3
          Width = 99
        end
        object chkCreateHospitalReport: TcxCheckBox
          Left = 14
          Top = 27
          Caption = 'Hospital Report'
          State = cbsChecked
          TabOrder = 2
          Width = 99
        end
        object chkCreateGimmickReport: TcxCheckBox
          Left = 14
          Top = 50
          Caption = 'Gimmick Report'
          TabOrder = 4
          Width = 107
        end
        object chkCreateSelectionReport: TcxCheckBox
          Left = 14
          Top = 123
          Caption = 'Selection Report'
          TabOrder = 5
          Width = 106
        end
        object btnCreateReportsNone: TButton
          Left = 14
          Top = 324
          Width = 136
          Height = 24
          Caption = 'Select None'
          TabOrder = 0
          OnClick = btnCreateReportsNoneClick
        end
        object chkCreateValueReport: TcxCheckBox
          Left = 14
          Top = 72
          Caption = 'Value Report'
          State = cbsChecked
          TabOrder = 6
          Width = 115
        end
        object chkCreateAngleReport: TcxCheckBox
          Left = 15
          Top = 95
          Caption = 'Angle Report'
          TabOrder = 7
          Width = 115
        end
        object btnDeleteReports: TButton
          Left = 15
          Top = 269
          Width = 135
          Height = 25
          Caption = 'Delete Reports'
          TabOrder = 8
          OnClick = btnDeleteReportsClick
        end
        object chkCreateWagerReport: TcxCheckBox
          Left = 14
          Top = 147
          Caption = 'Wager Report'
          State = cbsChecked
          TabOrder = 9
          Width = 104
        end
        object chkCreateContestReport: TcxCheckBox
          Left = 14
          Top = 174
          Caption = 'Contest Report'
          TabOrder = 10
          Width = 104
        end
        object chkCreateHarnessReport: TcxCheckBox
          Left = 14
          Top = 197
          Caption = 'Harness Report'
          TabOrder = 11
          Width = 99
        end
        object chkCreateHarnessValueReport: TcxCheckBox
          Left = 14
          Top = 223
          Caption = 'Harness Value Report'
          TabOrder = 12
          Width = 136
        end
      end
      object pnlFTP: TPanel
        Left = 376
        Top = 110
        Width = 151
        Height = 352
        TabOrder = 3
        object btnFTPReports: TButton
          Left = 11
          Top = 291
          Width = 120
          Height = 24
          Caption = 'FTP Reports'
          TabOrder = 0
          OnClick = btnFTPReportsClick
        end
        object chkFTPTipReport: TcxCheckBox
          Left = 5
          Top = 5
          Caption = 'Tip Report'
          TabOrder = 1
          Width = 85
        end
        object chkFTPHospitalReport: TcxCheckBox
          Left = 5
          Top = 28
          Caption = 'Hospital Report'
          State = cbsChecked
          TabOrder = 2
          Width = 108
        end
        object chkFTPGimmickReport: TcxCheckBox
          Left = 5
          Top = 50
          Caption = 'Gimmick Report'
          TabOrder = 3
          Width = 108
        end
        object chkFTPValueReport: TcxCheckBox
          Left = 5
          Top = 71
          Caption = 'Value Report'
          State = cbsChecked
          TabOrder = 4
          Width = 108
        end
        object btnFTPReportsNone: TButton
          Left = 11
          Top = 319
          Width = 120
          Height = 26
          Caption = 'Select None'
          TabOrder = 5
          OnClick = btnFTPReportsNoneClick
        end
        object chkFTPSelectionReport: TcxCheckBox
          Left = 5
          Top = 117
          Caption = 'Selection Report'
          TabOrder = 6
          Width = 106
        end
        object chkFTPAngleReport: TcxCheckBox
          Left = 5
          Top = 97
          Caption = 'Angle Report'
          TabOrder = 7
          Width = 108
        end
        object chkFTPWagerReport: TcxCheckBox
          Left = 6
          Top = 143
          Caption = 'Wager Report'
          State = cbsChecked
          TabOrder = 8
          Width = 108
        end
        object chkFTPContestReport: TcxCheckBox
          Left = 6
          Top = 163
          Caption = 'Contest Report'
          TabOrder = 9
          Width = 108
        end
        object chkFTPMikeReport: TcxCheckBox
          Left = 6
          Top = 183
          Caption = 'Mike Report'
          TabOrder = 10
          Width = 108
        end
        object chkFTPJimReport: TcxCheckBox
          Left = 6
          Top = 202
          Caption = 'Jim Report'
          TabOrder = 11
          Width = 108
        end
        object chkFTPHarnessReport: TcxCheckBox
          Left = 5
          Top = 223
          Caption = 'Harness Report'
          TabOrder = 12
          Width = 108
        end
        object chkFTPHarnessValueReport: TcxCheckBox
          Left = 5
          Top = 242
          Caption = 'Harness Value Report'
          TabOrder = 13
          Width = 132
        end
        object btnDeleteAllFTPReport: TButton
          Left = 11
          Top = 264
          Width = 120
          Height = 24
          Caption = 'Delete All FTP Reports'
          TabOrder = 14
          OnClick = btnDeleteAllFTPReportClick
        end
      end
    end
    object tabBatch: TcxTabSheet
      Caption = 'Process'
      object Panel2: TPanel
        Left = 8
        Top = 14
        Width = 188
        Height = 355
        TabOrder = 0
        object chkDownloadAxcis: TcxCheckBox
          Left = 5
          Top = 12
          Caption = 'Download AXCIS'
          TabOrder = 0
          Width = 145
        end
        object btnProcessToday: TButton
          Left = 7
          Top = 231
          Width = 174
          Height = 25
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
          Left = 7
          Top = 274
          Width = 174
          Height = 25
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
          Left = 7
          Top = 189
          Width = 174
          Height = 25
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
          Left = 5
          Top = 41
          Caption = 'Create Reports'
          State = cbsChecked
          TabOrder = 4
          Width = 145
        end
        object chkFTPReports: TcxCheckBox
          Left = 5
          Top = 71
          Caption = 'FTP Reports'
          State = cbsChecked
          TabOrder = 5
          Width = 145
        end
        object btnProcessDaily: TButton
          Left = 7
          Top = 317
          Width = 174
          Height = 25
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
          Left = 5
          Top = 101
          Caption = 'Download Equibase'
          TabOrder = 7
          Width = 145
        end
        object chkDownloadDRF: TcxCheckBox
          Left = 5
          Top = 131
          Caption = 'Download DRF'
          TabOrder = 8
          Width = 145
        end
        object chkSuppressProcess: TcxCheckBox
          Left = 6
          Top = 160
          Caption = 'Suppress Process'
          TabOrder = 9
          Width = 145
        end
      end
      object Panel3: TPanel
        Left = 389
        Top = 14
        Width = 183
        Height = 443
        TabOrder = 1
        object chkUpdateALLRatings: TcxCheckBox
          Left = 4
          Top = 109
          Caption = 'Update ALL Cumulative Ratings'
          TabOrder = 0
          Width = 178
        end
        object btnUpdateRankings: TButton
          Left = 6
          Top = 352
          Width = 167
          Height = 25
          Caption = 'Update Checked'
          TabOrder = 1
          OnClick = btnUpdateRankingsClick
        end
        object chkGenRankingStats: TcxCheckBox
          Left = 4
          Top = 208
          Caption = 'Generate Rankings'
          TabOrder = 2
          Width = 131
        end
        object chkGenRankingStatsByTrack: TcxCheckBox
          Left = 4
          Top = 233
          Caption = 'Generate Rankings By Track'
          TabOrder = 3
          Width = 171
        end
        object chkUpdateCreatePKSKDK: TcxCheckBox
          Left = 4
          Top = 134
          Caption = 'Update/Create PK SK DK'
          TabOrder = 4
          Width = 160
        end
        object chkUpdateHHFromEquibase: TcxCheckBox
          Left = 4
          Top = 60
          Caption = 'Equibase Processing'
          TabOrder = 5
          Width = 171
        end
        object btnBatchSelectNone: TButton
          Left = 6
          Top = 383
          Width = 167
          Height = 25
          Caption = 'Select None'
          TabOrder = 6
          OnClick = btnBatchSelectNoneClick
        end
        object btnBatchSelectAll: TButton
          Left = 6
          Top = 415
          Width = 167
          Height = 25
          Caption = 'Select All'
          TabOrder = 7
          OnClick = btnBatchSelectAllClick
        end
        object chkUpdateCreateFK: TcxCheckBox
          Left = 4
          Top = 159
          Caption = 'Update/Create Final Keys'
          TabOrder = 8
          Width = 160
        end
        object chkUpdateFinalSheetOrder: TcxCheckBox
          Left = 4
          Top = 183
          Caption = 'Update Final Sheet Order'
          TabOrder = 9
          Width = 160
        end
        object chkAddEquibaseCharts: TcxCheckBox
          Left = 4
          Top = 12
          Caption = 'Add Equibase Charts'
          TabOrder = 10
          Width = 171
        end
        object chkAddDRFCharts: TcxCheckBox
          Left = 4
          Top = 35
          Caption = 'Add DRF Charts'
          TabOrder = 11
          Width = 171
        end
        object chkUpdateHHFromDRF: TcxCheckBox
          Left = 4
          Top = 85
          Caption = 'DRF Processing'
          TabOrder = 12
          Width = 171
        end
        object cxCheckBox1: TcxCheckBox
          Left = 5
          Top = 257
          Caption = 'Archive History'
          TabOrder = 13
          Width = 171
        end
      end
      object Panel1: TPanel
        Left = 200
        Top = 174
        Width = 186
        Height = 152
        TabOrder = 2
        object btnDownloadEquibaseResults: TButton
          Left = 8
          Top = 5
          Width = 169
          Height = 25
          Caption = 'Download Equibase Results'
          TabOrder = 0
          OnClick = btnDownloadEquibaseResultsClick
        end
        object btnDownloadEquibaseCharts: TButton
          Left = 8
          Top = 33
          Width = 169
          Height = 26
          Caption = 'Download Equibase Charts'
          TabOrder = 1
          OnClick = btnDownloadEquibaseChartsClick
        end
        object btnProcessEquibaseCharts: TButton
          Left = 8
          Top = 120
          Width = 169
          Height = 25
          Caption = 'Process Equibase Charts'
          TabOrder = 2
          OnClick = btnProcessEquibaseChartsClick
        end
        object btnAddEquibaseResultsFromDisk: TButton
          Left = 8
          Top = 62
          Width = 169
          Height = 25
          Caption = 'Add Equibase Results From Disk'
          TabOrder = 3
          OnClick = btnAddEquibaseResultsFromDiskClick
        end
        object btnAddEquibaseChartsFromDisk: TButton
          Left = 8
          Top = 90
          Width = 169
          Height = 26
          Caption = 'Add Equibase Charts From Disk'
          TabOrder = 4
          OnClick = btnAddEquibaseChartsFromDiskClick
        end
      end
      object Panel5: TPanel
        Left = 200
        Top = 14
        Width = 185
        Height = 156
        TabOrder = 3
        object btnDownloadDRFResults: TButton
          Left = 8
          Top = 5
          Width = 169
          Height = 25
          Caption = 'Download DRF Results'
          TabOrder = 0
          OnClick = btnDownloadDRFResultsClick
        end
        object btnDownloadDRFCharts: TButton
          Left = 8
          Top = 32
          Width = 169
          Height = 23
          Caption = 'Download DRF Charts'
          TabOrder = 1
          OnClick = btnDownloadDRFChartsClick
        end
        object btnProcessDRFCharts: TButton
          Left = 8
          Top = 120
          Width = 169
          Height = 25
          Caption = 'Process DRF Charts'
          TabOrder = 2
          OnClick = btnProcessDRFChartsClick
        end
        object btnAddDRFResultsFromDisk: TButton
          Left = 8
          Top = 57
          Width = 169
          Height = 25
          Caption = 'Add DRF Results From Disk'
          TabOrder = 3
          OnClick = btnAddDRFResultsFromDiskClick
        end
        object btnAddDRFChartsFromDisk: TButton
          Left = 8
          Top = 90
          Width = 169
          Height = 26
          Caption = 'Add DRF Charts From Disk'
          TabOrder = 4
          OnClick = btnAddDRFChartsFromDiskClick
        end
      end
      object Panel14: TPanel
        Left = 200
        Top = 330
        Width = 186
        Height = 132
        TabOrder = 4
        object btnDownloadUSTACharts: TButton
          Left = 8
          Top = 5
          Width = 169
          Height = 25
          Caption = 'Download USTA Charts'
          TabOrder = 0
          OnClick = btnDownloadUSTAChartsClick
        end
        object btnDownloadSCCharts: TButton
          Left = 8
          Top = 66
          Width = 169
          Height = 25
          Caption = 'Download SC Charts'
          TabOrder = 1
          OnClick = btnDownloadSCChartsClick
        end
        object btnProcessSCCharts: TButton
          Left = 8
          Top = 101
          Width = 169
          Height = 24
          Caption = 'Process SC Charts'
          TabOrder = 2
          OnClick = btnProcessSCChartsClick
        end
        object btnProcessUSTACharts: TButton
          Left = 8
          Top = 36
          Width = 169
          Height = 24
          Caption = 'Process USTA Charts'
          TabOrder = 3
          OnClick = btnProcessUSTAChartsClick
        end
      end
    end
    object cxTabSheet1: TcxTabSheet
      Caption = 'Analysis'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 6
      ParentFont = False
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 192
        Height = 554
        Align = alLeft
        TabOrder = 0
        object btnAnalysisFinalOrder: TButton
          Left = 8
          Top = 5
          Width = 169
          Height = 25
          Caption = 'Final Order'
          TabOrder = 0
          OnClick = btnAnalysisFinalOrderClick
        end
        object Button2: TButton
          Left = 8
          Top = 42
          Width = 169
          Height = 25
          Caption = 'Rankings'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 8
          Top = 80
          Width = 169
          Height = 26
          Caption = 'Todays Entries'
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button4: TButton
          Left = 8
          Top = 119
          Width = 169
          Height = 25
          Caption = 'Horse History'
          TabOrder = 3
        end
        object Button5: TButton
          Left = 8
          Top = 157
          Width = 169
          Height = 25
          Caption = 'Connections'
          TabOrder = 4
          OnClick = Button5Click
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Testing'
      ImageIndex = 6
      object cxButton3: TcxButton
        Left = 7
        Top = 121
        Width = 330
        Height = 26
        Caption = 'Entry Form'
        TabOrder = 0
        OnClick = cxButton3Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnConnections: TcxButton
        Left = 7
        Top = 155
        Width = 330
        Height = 26
        Caption = 'Connections Form'
        TabOrder = 1
        OnClick = btnConnectionsClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton2: TcxButton
        Left = 7
        Top = 347
        Width = 330
        Height = 24
        Caption = 'Test Arrays'
        TabOrder = 2
        OnClick = cxButton2Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object btnReProcessDays: TButton
        Left = 7
        Top = 250
        Width = 327
        Height = 26
        Caption = 'Reprocess Days'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnReProcessDaysClick
      end
      object cxButton1: TcxButton
        Left = 7
        Top = 202
        Width = 330
        Height = 24
        Caption = 'Gen Ratings'
        TabOrder = 4
        OnClick = cxButton1Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton5: TcxButton
        Left = 7
        Top = 9
        Width = 330
        Height = 26
        Caption = 'Test'
        TabOrder = 5
        OnClick = cxButton5Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton6: TcxButton
        Left = 7
        Top = 89
        Width = 330
        Height = 26
        Caption = 'Parse'
        TabOrder = 6
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object Memo1: TMemo
        Left = 344
        Top = 8
        Width = 673
        Height = 537
        Lines.Strings = (
          'Memo1')
        TabOrder = 7
      end
      object btnDownloadDays: TButton
        Left = 7
        Top = 299
        Width = 327
        Height = 26
        Caption = 'Download Last 6 Days'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = btnDownloadDaysClick
      end
      object btnExportToNexus: TcxButton
        Left = 7
        Top = 393
        Width = 330
        Height = 26
        Caption = 'Export To Nexus'
        TabOrder = 9
        OnClick = btnExportToNexusClick
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
      object cxButton4: TcxButton
        Left = 7
        Top = 49
        Width = 330
        Height = 26
        Caption = 'HH Test'
        TabOrder = 10
        OnClick = cxButton4Click
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = False
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Edit'
      ImageIndex = 4
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 185
        Height = 448
        Align = alLeft
        TabOrder = 0
        object btnOptions: TButton
          Left = 8
          Top = 5
          Width = 169
          Height = 25
          Caption = 'Options'
          TabOrder = 0
          OnClick = btnOptionsClick
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Reports'
      ImageIndex = 5
      object Panel8: TPanel
        Left = 13
        Top = 2
        Width = 225
        Height = 97
        TabOrder = 0
        object btnCreatePreviousDayTables: TcxButton
          Left = 6
          Top = 56
          Width = 211
          Height = 25
          Caption = 'Create Tables '
          TabOrder = 0
          OnClick = btnCreatePreviousDayTablesClick
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
        end
        object chkCreatePreviousDaysResultTable: TcxCheckBox
          Left = 0
          Top = 7
          Caption = 'Create Previous Days Result Tables'
          State = cbsChecked
          TabOrder = 1
          Width = 213
        end
        object chkCreatePrevious21DaysResultTable: TcxCheckBox
          Left = 1
          Top = 31
          Caption = 'Create Previous 21 Days Result Tables'
          State = cbsChecked
          TabOrder = 2
          Width = 213
        end
      end
      object Panel9: TPanel
        Left = 18
        Top = 267
        Width = 689
        Height = 208
        TabOrder = 1
        object btnSelectNoneResultReports: TButton
          Left = 6
          Top = 4
          Width = 679
          Height = 23
          Caption = 'Select None'
          TabOrder = 0
          OnClick = btnSelectNoneResultReportsClick
        end
        object btnSelectAllResultReports: TButton
          Left = 6
          Top = 33
          Width = 679
          Height = 23
          Caption = 'Select All'
          TabOrder = 1
          OnClick = btnSelectAllResultReportsClick
        end
        object btnDeleteResultReports: TButton
          Left = 6
          Top = 62
          Width = 679
          Height = 23
          Caption = 'Delete Reports'
          TabOrder = 2
          OnClick = btnDeleteResultReportsClick
        end
        object btnCreateResultReports: TButton
          Left = 6
          Top = 91
          Width = 679
          Height = 22
          Caption = 'Create Reports'
          TabOrder = 3
          OnClick = btnCreateResultReportsClick
        end
        object Button1: TButton
          Left = 6
          Top = 120
          Width = 679
          Height = 23
          Caption = 'FTP Reports'
          TabOrder = 4
          OnClick = Button1Click
        end
        object btnEmailWagerReports: TButton
          Left = 6
          Top = 149
          Width = 680
          Height = 23
          Caption = 'Email Wager Reports'
          TabOrder = 5
          OnClick = btnEmailWagerReportsClick
        end
        object btnEmailResultReports: TButton
          Left = 6
          Top = 179
          Width = 680
          Height = 23
          Caption = 'Email Result Reports'
          TabOrder = 6
          OnClick = btnEmailResultReportsClick
        end
      end
      object Panel12: TPanel
        Left = 474
        Top = 101
        Width = 225
        Height = 160
        TabOrder = 2
        object chkPrevious21DaysByRaceDate: TcxCheckBox
          Left = 9
          Top = 4
          Caption = 'Previous 90 Days By Race Date'
          Properties.OnChange = chkPrevious21DaysByRaceDatePropertiesChange
          TabOrder = 0
          Width = 192
        end
        object chkPrevious21DaysByTrkCode: TcxCheckBox
          Left = 9
          Top = 26
          Caption = 'Previous 90 Days By Track Code'
          Properties.OnChange = chkPrevious21DaysByTrkCodePropertiesChange
          TabOrder = 1
          Width = 192
        end
        object chkPrevious21DaysByRaceType: TcxCheckBox
          Left = 9
          Top = 48
          Caption = 'Previous 90 Days By Race Type'
          Properties.OnChange = chkPrevious21DaysByRaceTypePropertiesChange
          TabOrder = 2
          Width = 185
        end
        object chkPrevious21DaysByML: TcxCheckBox
          Left = 10
          Top = 70
          Caption = 'Previous 90 By Morning Line'
          Properties.OnChange = chkPrevious21DaysByMLPropertiesChange
          TabOrder = 3
          Width = 184
        end
      end
      object Panel11: TPanel
        Left = 241
        Top = 101
        Width = 225
        Height = 98
        TabOrder = 3
        object chkPreviousDays: TcxCheckBox
          Left = 6
          Top = 6
          Caption = 'Previous Days'
          State = cbsChecked
          TabOrder = 0
          Width = 164
        end
        object chkPrevious21Days: TcxCheckBox
          Left = 7
          Top = 34
          Caption = 'Previous 90 Days '
          State = cbsChecked
          TabOrder = 1
          Width = 132
        end
      end
      object Panel10: TPanel
        Left = 241
        Top = 202
        Width = 225
        Height = 61
        TabOrder = 4
        object chkYouBetResultsReports: TcxCheckBox
          Left = 8
          Top = 8
          Caption = 'YouBet Reports'
          TabOrder = 0
          Width = 137
        end
        object chkTopPickResultsReports: TcxCheckBox
          Left = 8
          Top = 32
          Caption = 'Top Pick Reports'
          State = cbsChecked
          TabOrder = 1
          Width = 137
        end
      end
      object Panel13: TPanel
        Left = 10
        Top = 202
        Width = 225
        Height = 61
        TabOrder = 5
        object chkSummaryResultsReports: TcxCheckBox
          Left = 8
          Top = 12
          Caption = 'Summary Reports'
          TabOrder = 0
          Width = 171
        end
        object chkDetailResultsReports: TcxCheckBox
          Left = 7
          Top = 36
          Caption = 'Detail Reports'
          State = cbsChecked
          TabOrder = 1
          Width = 171
        end
      end
      object Panel7: TPanel
        Left = 11
        Top = 101
        Width = 225
        Height = 98
        TabOrder = 6
        object chkBasicResultsReports: TcxCheckBox
          Left = 8
          Top = 7
          Caption = 'Only Basic Reports'
          Properties.OnChange = chkBasicResultsReportsPropertiesChange
          State = cbsChecked
          TabOrder = 0
          Width = 171
        end
        object chkWagerResultsReports: TcxCheckBox
          Left = 8
          Top = 51
          Caption = 'Only Wager Reports'
          Properties.OnChange = chkWagerResultsReportsPropertiesChange
          TabOrder = 1
          Width = 171
        end
        object chkSpecialResultsReports: TcxCheckBox
          Left = 8
          Top = 28
          Caption = 'Only Special Reports'
          Properties.NullStyle = nssInactive
          Properties.OnChange = chkSpecialResultsReportsPropertiesChange
          TabOrder = 2
          Width = 171
        end
        object chkAllResultsReports: TcxCheckBox
          Left = 9
          Top = 71
          Caption = 'All Reports'
          Properties.OnChange = chkAllResultsReportsPropertiesChange
          TabOrder = 3
          Width = 172
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Log'
      ImageIndex = 6
      object Panel15: TPanel
        Left = 8
        Top = 8
        Width = 1001
        Height = 625
        TabOrder = 0
        object cxRtfLog: TcxRichEdit
          Left = 0
          Top = 0
          Lines.Strings = (
            '')
          ParentFont = False
          Properties.HideScrollBars = False
          Properties.HideSelection = False
          Properties.PlainText = True
          Properties.ReadOnly = True
          Properties.ScrollBars = ssVertical
          Properties.SelectionBar = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.TextStyle = []
          TabOrder = 0
          Height = 569
          Width = 977
        end
        object btnRefreshLog: TButton
          Left = 11
          Top = 583
          Width = 198
          Height = 26
          Caption = 'Refresh Log'
          TabOrder = 1
          OnClick = btnRefreshLogClick
        end
        object btnDeleteLog: TButton
          Left = 243
          Top = 583
          Width = 198
          Height = 26
          Caption = 'Delete Log'
          TabOrder = 2
          OnClick = btnDeleteLogClick
        end
      end
    end
  end
  object pnlPrgBar: TPanel
    Left = 0
    Top = 495
    Width = 789
    Height = 29
    Align = alBottom
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    object prgBar: TcxProgressBar
      Left = 4
      Top = 5
      TabOrder = 0
      Width = 997
    end
  end
  object qrySQL: TDBISAMQuery
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    BeforeOpen = qrySQLBeforeOpen
    AfterClose = qrySQLAfterClose
    AfterScroll = qrySQLAfterScroll
    DatabaseName = 'dbSireRate'
    EngineVersion = '4.21 Build 10'
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
    Left = 817
    Top = 540
  end
  object ztvRar: TUnRar
    CpuType = cptAuto
    FileSpec.Strings = (
      '*.*')
    UseStoredDirs = False
    Left = 889
    Top = 182
  end
  object ztvLha: TUnLha
    CpuType = cptAuto
    FileSpec.Strings = (
      '*.*')
    UseStoredDirs = False
    Left = 881
    Top = 236
  end
  object idAntiFreeze: TIdAntiFreeze
    Left = 952
    Top = 520
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
    TempDir = 'C:\DOCUME~1\JKARAS~1.JOS\LOCALS~1\Temp\'
    Switch = swAdd
    Left = 896
    Top = 59
  end
  object idHTTP: TIdHTTP
    OnStatus = idHTTPStatus
    OnDisconnected = idHTTPDisconnected
    OnWork = idHTTPWork
    OnWorkBegin = idHTTPWorkBegin
    OnWorkEnd = idHTTPWorkEnd
    AuthRetries = 0
    AuthProxyRetries = 0
    AllowCookies = True
    HandleRedirects = True
    ProtocolVersion = pv1_0
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentRangeInstanceLength = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = True
    Request.Host = 'www.axcis.com'
    Request.Password = '340526748'
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Username = 'ZSARAKLSR'
    HTTPOptions = [hoForceEncodeParams]
    CookieManager = idCookieManager
    Left = 800
    Top = 328
  end
  object idFtp: TIdFTP
    OnStatus = idFtpStatus
    OnDisconnected = idFtpDisconnected
    OnWork = idFtpWork
    OnWorkBegin = idFtpWorkBegin
    OnWorkEnd = idFtpWorkEnd
    AutoLogin = True
    Host = 'ksklimited.com'
    Password = 'wildmagic2'
    TransferTimeout = 60000
    Username = 'ksklimit'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 768
    Top = 72
  end
  object idCookieManager: TIdCookieManager
    Left = 840
    Top = 440
  end
  object timChk: TTimer
    Interval = 100000
    OnTimer = timChkTimer
    Left = 880
    Top = 383
  end
  object dxBarMgr: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Bars = <
      item
        Caption = 'Main Menu'
        DockedDockingStyle = dsTop
        DockedLeft = 0
        DockedTop = 0
        DockingStyle = dsTop
        FloatLeft = 457
        FloatTop = 149
        FloatClientWidth = 26
        FloatClientHeight = 19
        IsMainMenu = True
        ItemLinks = <
          item
            Item = File1
            Visible = True
          end>
        MultiLine = True
        Name = 'Main Menu'
        OneOnRow = True
        Row = 0
        UseOwnFont = False
        Visible = True
        WholeRow = True
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
    Left = 816
    Top = 104
    DockControlHeights = (
      0
      0
      23
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
    Left = 824
    Top = 176
  end
  object dbfRace: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'RACEDP.DBF'
    TableLevel = 3
    AfterScroll = dbfRaceAfterScroll
    Left = 952
    Top = 72
  end
  object dbfPast: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRRDP.DBF'
    TableLevel = 3
    AfterScroll = dbfPastAfterScroll
    Left = 952
    Top = 144
  end
  object dbfEntry: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THR2DP.DBF'
    TableLevel = 3
    AfterScroll = dbfEntryAfterScroll
    Left = 952
    Top = 179
  end
  object dbfSire: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRSDP.DBF'
    TableLevel = 3
    AfterScroll = dbfSireAfterScroll
    Left = 952
    Top = 240
  end
  object dbfDam: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRDDP.DBF'
    TableLevel = 3
    AfterScroll = dbfDamAfterScroll
    Left = 880
    Top = 312
  end
  object dbfMatchup: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRMDP.DBF'
    TableLevel = 3
    AfterScroll = dbfMatchupAfterScroll
    Left = 920
    Top = 344
  end
  object dbfTrainer: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRTDP.DBF'
    TableLevel = 3
    AfterScroll = dbfTrainerAfterScroll
    Left = 720
    Top = 272
  end
  object dbfJockey: TDbf
    FilePath = 'D:\AxcisDownload\'
    IndexDefs = <>
    TableName = 'THRJDP.DBF'
    TableLevel = 3
    AfterScroll = dbfJockeyAfterScroll
    Left = 888
    Top = 120
  end
  object DHTMLParse: TDIHtmlParser
    FilterHtmlTags.StartTags = fiShow
    FilterHtmlTags.EndTags = fiShow
    FilterScripts = fiShow
    FilterText = fiShow
    NormalizeWhiteSpace = True
    TrimAttribValues = False
    Left = 816
    Top = 272
  end
  object hLog: TmLog
    LogFileName = 'default.log'
    LogSize = 10000000
    ShowSeverityLevelInLog = True
    TraceLevel = mtrcOperationDetail
    TraceLevelRegKeyValue = '\software\masoft\logs\tracelevels'
    About = 'Version 1.2, 2004'#174' MASoft'
    Left = 624
    Top = 240
  end
  object styRepository: TcxStyleRepository
    Left = 824
    Top = 56
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
    object TreeListStyleSheetUserFormat4: TcxTreeListStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle101
      Styles.Inactive = cxStyle105
      Styles.Selection = cxStyle108
      Styles.BandBackground = cxStyle98
      Styles.BandHeader = cxStyle99
      Styles.ColumnHeader = cxStyle100
      Styles.ContentEven = cxStyle102
      Styles.ContentOdd = cxStyle103
      Styles.Footer = cxStyle104
      Styles.Indicator = cxStyle106
      Styles.Preview = cxStyle107
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
    Left = 746
    Top = 156
  end
  object IdSMTP: TIdSMTP
    Host = 'mail.ksklimited.com'
    Password = 'wildmagic2'
    SASLMechanisms = <>
    Username = 'jkaras@ksklimited.com'
    Left = 832
    Top = 320
  end
  object DIHtmlWriterPlugin: TDIHtmlWriterPlugin
    FilterComments = fiShow
    Left = 856
    Top = 224
  end
  object qryHarnessSQL: TDBISAMQuery
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    BeforeOpen = qrySQLBeforeOpen
    AfterClose = qrySQLAfterClose
    AfterScroll = qryHarnessSQLAfterScroll
    DatabaseName = 'dbBuggy'
    EngineVersion = '4.21 Build 10'
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT *'
      'INTO TodayRaces'
      'FROM HarnessRace'
      'WHERE RaceDate = :RaceDateParam;'
      ''
      'SELECT *'
      'INTO TodayEntries'
      'FROM HarnessEntry'
      'WHERE RaceDate = :RaceDateParam;'
      ''
      
        'CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodayRaces" Trk' +
        'Code","RaceDate","RaceNbr","ProgramNbr");'
      
        'CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevDayRH" ("Tr' +
        'kCode","RaceDate","RaceNbr");'
      '')
    Params = <
      item
        DataType = ftDate
        Name = 'RaceDateParam'
      end>
    ReadOnly = True
    OnQueryProgress = qrySQLQueryProgress
    BeforeExecute = qrySQLBeforeExecute
    AfterExecute = qrySQLAfterExecute
    Left = 889
    Top = 476
    ParamData = <
      item
        DataType = ftDate
        Name = 'RaceDateParam'
      end>
  end
  object dbfHarnessEntry: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'HORSEHR.DBF'
    TableLevel = 3
    AfterScroll = dbfHarnessEntryAfterScroll
    Left = 720
    Top = 504
  end
  object dbfHarnessRace: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'RACESHR.DBF'
    TableLevel = 3
    AfterScroll = dbfHarnessRaceAfterScroll
    Left = 712
    Top = 568
  end
  object dbfHarnessPast: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'RUNLINHR.DBF'
    TableLevel = 4
    AfterScroll = dbfHarnessPastAfterScroll
    Left = 712
    Top = 456
  end
  object dbfHarnessTrainer: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'TRAINRHR.DBF'
    TableLevel = 4
    AfterScroll = dbfHarnessTrainerAfterScroll
    Left = 696
    Top = 376
  end
  object dbfHarnessDriver: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'TRAINRHR.DBF'
    TableLevel = 4
    AfterScroll = dbfHarnessDriverAfterScroll
    Left = 784
    Top = 408
  end
end
