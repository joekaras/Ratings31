unit FormMain;

interface

uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms,
   Dialogs, dbisamen, dbisamlb, dbisamcn,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls,
   ztvBase, ztvUnRAR, ztvUnLHA, ztvRegister,
   Menus, iniFiles, IdLogEvent, IdLogFile, IDFTPCommon,
   ztvZip, IdIOHandler, dxBar, StrMan,
   cxPc, cxControls, cxCheckBox, cxContainer, cxEdit, cxTextEdit,
   cxMaskEdit, cxDropDownEdit, dxBarExtItems, cxButtons,
   cxLookAndFeelPainters, cxGridLevel,
   cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
   cxGridCustomView, cxGrid, cxLookAndFeels, cxGridBandedTableView,
   cxGridCardView, cxClasses, cxStyles, dxNavBarStyles, dxNavBarBase,
   dxNavBarCollns, dxNavBar, Dbf, TXComp, cxProgressBar, cxCalendar,
   mLog, IdExplicitTLSClientServerBase,
   IdAntiFreezeBase, IdAntiFreeze, IdComponent, IdTCPConnection,
   IdTCPClient, IdHTTP, IdBaseComponent, IdCookieManager, IdFTP, cxTL,
   cxVGrid, IdAttachment, IdAttachmentFile, IdMessage, IdUDPBase,
   IdUDPClient, IdSNMP, IdMessageClient, IdSMTPBase, IdSMTP,
   DIUnicode, DIHtmlParser, DIHtmlWriterPlugin, DIUnicodeHtmlWriter,
   DIHtmlCharSetPlugin, DIHtmlMisc, DIUtils, cxMemo, cxRichEdit, TXRB,
   IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, ztvUnZip,
   VCLUnZip, madExceptVcl, DIHtmlAttribsPlugin, DIHtmlLinksPlugin,
   DataExport, DataToAscii, DataToXLS, DataToWK1, VCLZip;


type
   TNums = set of 1..20;


   TMainForm = class(TForm)
      dxBarMgr: TdxBarManager;
      extDevicesOptions: TExtraOptions;
      File1: TdxBarSubItem;
      Form11: TdxBarButton;
      idAntiFreeze: TIdAntiFreeze;
      idCookieManager: TIdCookieManager;
      idFtp: TIdFTP;
      idHTTP: TIdHTTP;
      Inspector1: TdxBarButton;
      mnuFileExit: TdxBarButton;
      qrySQL: TDBISAMQuery;
      Query1: TdxBarButton;
      timChk: TTimer;
      ztvLha: TUnLha;
      ztvRar: TUnRar;
      ztvZip: TZip;
      dxBarButton1: TdxBarButton;
      dxBarButton2: TdxBarButton;
      dxBarSubItem1: TdxBarSubItem;
      DHTMLParse: TDIHtmlParser;
      staBar: TStatusBar;
      pnlPrgBar: TPanel;
      prgBar: TcxProgressBar;
      styRepository: TcxStyleRepository;
      cxStyle1: TcxStyle;
      cxStyle2: TcxStyle;
      cxStyle3: TcxStyle;
      cxStyle4: TcxStyle;
      cxStyle5: TcxStyle;
      cxStyle6: TcxStyle;
      cxStyle7: TcxStyle;
      cxStyle8: TcxStyle;
      cxStyle9: TcxStyle;
      cxStyle10: TcxStyle;
      cxStyle11: TcxStyle;
      cxStyle12: TcxStyle;
      cxStyle13: TcxStyle;
      cxStyle14: TcxStyle;
      cxStyle15: TcxStyle;
      cxStyle16: TcxStyle;
      cxStyle17: TcxStyle;
      cxStyle18: TcxStyle;
      cxStyle19: TcxStyle;
      cxStyle20: TcxStyle;
      cxStyle21: TcxStyle;
      cxStyle22: TcxStyle;
      cxStyle23: TcxStyle;
      cxStyle24: TcxStyle;
      cxStyle25: TcxStyle;
      cxStyle26: TcxStyle;
      cxStyle27: TcxStyle;
      cxStyle28: TcxStyle;
      cxStyle29: TcxStyle;
      cxStyle30: TcxStyle;
      cxStyle31: TcxStyle;
      cxStyle32: TcxStyle;
      cxStyle33: TcxStyle;
      cxStyle34: TcxStyle;
      cxStyle35: TcxStyle;
      cxStyle36: TcxStyle;
      cxStyle37: TcxStyle;
      cxStyle38: TcxStyle;
      cxStyle39: TcxStyle;
      cxStyle40: TcxStyle;
      cxStyle41: TcxStyle;
      cxStyle42: TcxStyle;
      cxStyle43: TcxStyle;
      cxStyle44: TcxStyle;
      cxStyle45: TcxStyle;
      cxStyle46: TcxStyle;
      cxStyle47: TcxStyle;
      cxStyle48: TcxStyle;
      cxStyle49: TcxStyle;
      cxStyle50: TcxStyle;
      cxStyle51: TcxStyle;
      cxStyle52: TcxStyle;
      cxStyle53: TcxStyle;
      cxStyle54: TcxStyle;
      cxStyle55: TcxStyle;
      cxStyle56: TcxStyle;
      cxStyle57: TcxStyle;
      cxStyle58: TcxStyle;
      cxStyle59: TcxStyle;
      cxStyle60: TcxStyle;
      cxStyle61: TcxStyle;
      cxStyle62: TcxStyle;
      cxStyle63: TcxStyle;
      cxStyle64: TcxStyle;
      cxStyle65: TcxStyle;
      cxStyle66: TcxStyle;
      cxStyle67: TcxStyle;
      GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet;
      cxStyle68: TcxStyle;
      cxStyle69: TcxStyle;
      cxStyle70: TcxStyle;
      cxStyle71: TcxStyle;
      cxStyle72: TcxStyle;
      cxStyle73: TcxStyle;
      cxStyle74: TcxStyle;
      cxStyle75: TcxStyle;
      cxStyle76: TcxStyle;
      cxStyle77: TcxStyle;
      cxStyle78: TcxStyle;
      cxVerticalGridStyleSheetUserFormat4: TcxVerticalGridStyleSheet;
      cxStyle79: TcxStyle;
      cxStyle80: TcxStyle;
      cxStyle81: TcxStyle;
      cxStyle82: TcxStyle;
      cxStyle83: TcxStyle;
      cxStyle84: TcxStyle;
      cxStyle85: TcxStyle;
      GridBandedTableViewStyleSheetUserFormat4:
      TcxGridBandedTableViewStyleSheet;
      cxStyle86: TcxStyle;
      cxStyle87: TcxStyle;
      cxStyle88: TcxStyle;
      cxStyle89: TcxStyle;
      cxStyle90: TcxStyle;
      cxStyle91: TcxStyle;
      cxStyle92: TcxStyle;
      cxStyle93: TcxStyle;
      cxStyle94: TcxStyle;
      cxStyle95: TcxStyle;
      cxStyle96: TcxStyle;
      cxStyle97: TcxStyle;
      cxStyle98: TcxStyle;
      cxStyle99: TcxStyle;
      cxStyle100: TcxStyle;
      cxStyle101: TcxStyle;
      cxStyle102: TcxStyle;
      cxStyle103: TcxStyle;
      cxStyle104: TcxStyle;
      cxStyle105: TcxStyle;
      cxStyle106: TcxStyle;
      cxStyle107: TcxStyle;
      cxStyle108: TcxStyle;
      GridCardViewStyleSheetUserFormat4: TcxGridCardViewStyleSheet;
      cxStyle109: TcxStyle;
      cxStyle110: TcxStyle;
      cxStyle111: TcxStyle;
      cxStyle112: TcxStyle;
      cxStyle113: TcxStyle;
      cxStyle114: TcxStyle;
      cxStyle115: TcxStyle;
      IdMessage: TIdMessage;
      IdSMTP: TIdSMTP;
      DIHtmlWriterPlugin: TDIHtmlWriterPlugin;
      pgCtrlMain: TcxPageControl;
      tabDaily: TcxTabSheet;
      lblLocalPath: TLabel;
      lblServerPath: TLabel;
      pnlAxcis: TPanel;
      btnStartOfDay: TButton;
      btnDownloadAxcis: TButton;
      btnImport: TButton;
      btnBackup: TButton;
      btnCreateTodaysRatings: TButton;
      btnImportToday: TButton;
      btnDownloadSelections: TButton;
      btnProcessSelections: TButton;
      btnDownloadEquibaseStats: TButton;
      btnProcessEquibaseStats: TButton;
      pnlOptions: TPanel;
      edtProxy: TcxTextEdit;
      chkProcessAllDates: TcxCheckBox;
      chkUseProxy: TcxCheckBox;
      chkOverrideDate: TcxCheckBox;
      edtOverrideDate: TcxDateEdit;
      pnlReports: TPanel;
      btnCreateReports: TButton;
      chkCreateHospitalReport: TcxCheckBox;
      chkCreateGimmickReport: TcxCheckBox;
      chkCreateSelectionReport: TcxCheckBox;
      btnCreateReportsNone: TButton;
      chkCreateValueReport: TcxCheckBox;
      btnDeleteReports: TButton;
      chkCreateWagerReport: TcxCheckBox;
      pnlFTP: TPanel;
      btnFTPReports: TButton;
      chkFTPHospitalReport: TcxCheckBox;
      chkFTPGimmickReport: TcxCheckBox;
      chkFTPValueReport: TcxCheckBox;
      btnFTPReportsNone: TButton;
      chkFTPSelectionReport: TcxCheckBox;
      chkFTPWagerReport: TcxCheckBox;
      btnDeleteAllFTPReport: TButton;
      tabBatch: TcxTabSheet;
      Panel2: TPanel;
      chkDownloadAxcis: TcxCheckBox;
      btnProcessToday: TButton;
      btnProcessTomorrow: TButton;
      btnProcessYesterday: TButton;
      chkCreateReports: TcxCheckBox;
      chkFTPReports: TcxCheckBox;
      btnProcessDaily: TButton;
      chkDownloadEquibase: TcxCheckBox;
      chkDownloadDRF: TcxCheckBox;
      chkSuppressProcess: TcxCheckBox;
      Panel3: TPanel;
      chkUpdateALLRatings: TcxCheckBox;
      btnUpdateRankings: TButton;
      chkGenRankingStats: TcxCheckBox;
      chkGenRankingStatsByTrack: TcxCheckBox;
      chkUpdateCreatePKSKDK: TcxCheckBox;
      chkUpdateHHFromEquibase: TcxCheckBox;
      btnBatchSelectNone: TButton;
      btnBatchSelectAll: TButton;
      chkUpdateCreateFK: TcxCheckBox;
      chkAddEquibaseCharts: TcxCheckBox;
      chkAddDRFCharts: TcxCheckBox;
      chkUpdateHHFromDRF: TcxCheckBox;
      cxCheckBox1: TcxCheckBox;
      Panel1: TPanel;
      btnDownloadEquibaseResults: TButton;
      btnDownloadEquibaseCharts: TButton;
      btnProcessEquibaseCharts: TButton;
      btnAddEquibaseResultsFromDisk: TButton;
      btnAddEquibaseChartsFromDisk: TButton;
      btnProcessEquibaseResults: TButton;
      Panel5: TPanel;
      btnDownloadDRFResults: TButton;
      btnDownloadDRFCharts: TButton;
      btnProcessDRFCharts: TButton;
      btnAddDRFResultsFromDisk: TButton;
      btnAddDRFChartsFromDisk: TButton;
      btnProcessDRFResults: TButton;
      cxTabSheet1: TcxTabSheet;
      Panel4: TPanel;
      btnAnalysisFinalOrderForm: TButton;
      btnRankingsForm: TButton;
      btnTodaysEntriesForm: TButton;
      btnHorseHistoryForm: TButton;
      btnConnectionsForm: TButton;
      cxTabSheet2: TcxTabSheet;
      cxButton3: TcxButton;
      btnConnections: TcxButton;
      btnReProcessDays: TButton;
      btnCreateKeys: TcxButton;
      cxButton5: TcxButton;
      btnTestReports: TcxButton;
      Memo1: TMemo;
      btnDownloadDays: TButton;
      btnHHTest: TcxButton;
      cxTabSheet3: TcxTabSheet;
      Panel6: TPanel;
      btnOptions: TButton;
      cxTabSheet4: TcxTabSheet;
      Panel10: TPanel;
      chkYouBetResultsReports: TcxCheckBox;
      chkTopPickResultsReports: TcxCheckBox;
      Panel11: TPanel;
      chkPreviousDays: TcxCheckBox;
      chkPrevious21Days: TcxCheckBox;
      Panel8: TPanel;
      btnCreatePreviousDayTables: TcxButton;
      chkCreatePreviousDaysResultTable: TcxCheckBox;
      chkCreatePrevious21DaysResultTable: TcxCheckBox;
      Panel9: TPanel;
      btnSelectNoneResultReports: TButton;
      btnSelectAllResultReports: TButton;
      btnDeleteResultReports: TButton;
      btnCreateResultReports: TButton;
      btnFTPResultReports: TButton;
      cxTabSheet5: TcxTabSheet;
      btnDeleteLog: TButton;
      btnRefreshLog: TButton;
      cxRtfLog: TcxRichEdit;
      cxTabSheet6: TcxTabSheet;
      btnDownloadAxcisBuggy: TButton;
      btnDownloadFlashNet: TButton;
      btnImportAxcisHarness: TButton;
      btnImportFlashNet: TButton;
      chkCreateHarnessReport: TcxCheckBox;
      chkCreateHarnessValueReport: TcxCheckBox;
      chkFTPHarnessValueReport: TcxCheckBox;
      chkFTPMikeReport: TcxCheckBox;
      chkFTPHarnessReport: TcxCheckBox;
      chkFTPJimReport: TcxCheckBox;
      btnBackupBuggy: TButton;
      Panel14: TPanel;
      btnDownloadUSTACharts: TButton;
      btnDownloadSCCharts: TButton;
      btnProcessSCCharts: TButton;
      btnProcessUSTACharts: TButton;
      chkFTPAngleReport: TcxCheckBox;
      chkFTPContestReport: TcxCheckBox;
      btnExportToNexus: TcxButton;
      cxButton2: TcxButton;
      Panel12: TPanel;
      chkPrevious21DaysByRaceDate: TcxCheckBox;
      chkPrevious21DaysByTrkCode: TcxCheckBox;
      chkPrevious21DaysByRaceType: TcxCheckBox;
      chkPrevious21DaysByML: TcxCheckBox;
      btnEmailWagerReports: TButton;
      btnEmailResultReports: TButton;
      btnBank: TButton;
      btnWagers: TcxButton;
      btnEditWagers: TButton;
      cxCheckBox3: TcxCheckBox;
      chkUpdateYouBetBankWagers: TcxCheckBox;
      chkLinerResultsReports: TcxCheckBox;
      chkWagerResultsReports: TcxCheckBox;
      chkUpdateTodaysWagerOrder: TcxCheckBox;
      btnLoadExceptionLog: TButton;
      btnCreateFinalOrder: TcxButton;
      btnCreateRankings: TcxButton;
      edtAltLastDateToProcess: TcxDateEdit;
      edtAltFirstDateToProcess: TcxDateEdit;
      btnCreateAnalysisTables: TButton;
      btnDownloadReprocessDRFEquibase: TButton;
      btnDownloadTSN: TButton;
      IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
      Panel7: TPanel;
      btnDownloadTsnResults: TButton;
      btnProcessTSNResults: TButton;
      btnReprocessTsnResults: TButton;
      chkCreateTipReport: TcxCheckBox;
      chkFTPTipReport: TcxCheckBox;
      btnLoadEquibaseLog: TButton;
      btnLoadTSNLog: TButton;
      btnLoadStatsLog: TButton;
      btnLoadAxcisLog: TButton;
      vZip: TVCLUnZip;
      btnQueryPrevDayForm: TButton;
      dxBarSpinEdit1: TdxBarSpinEdit;
      dxBarControlContainerItem1: TdxBarControlContainerItem;
      btnLoadBloodHorseLog: TButton;
      btnTrainerConnections: TButton;
      chkCreateContestReport: TcxCheckBox;
      btnCreateJustResultReports: TButton;
      chkExoticResultReports: TcxCheckBox;
      chkDownloadProcessResults: TcxCheckBox;
      chkDownloadProcessStats: TcxCheckBox;
      chkSuppressAutomaticProcessing: TcxCheckBox;
      btnContenders: TButton;
      btnProcessAfterTomorrow: TButton;
      MadExceptionHandler1: TMadExceptionHandler;
      chkForceEquibase: TcxCheckBox;
      IdHTTP1: TIdHTTP;
      btnProcessLateChanges: TButton;
      btnDownloadTSNLSC: TButton;
      btnProcessLateScratches: TButton;
      Button1: TButton;
      btnQueryPrevWeekForm: TButton;
      csvOut: TDataToWK1;
      btnCreatePTCFile: TButton;
      csvPTC: TDataToAscii;
      PTCWager: TDBISAMTable;
      chkCreateExportFiles: TcxCheckBox;
      chkFTPExportFiles: TcxCheckBox;
      VCLZip: TVCLZip;

      procedure btnAbortQryClick(Sender: TObject);
      procedure btnBackupClick(Sender: TObject);
      procedure btnCreateReportsClick(Sender: TObject);
      procedure btnCreUpdHHRHClick(Sender: TObject);
      procedure btnDownloadAxcisClick(Sender: TObject);
      procedure btnDownloadEquibaseChartsClick(Sender: TObject);
      procedure btnFTPReportsClick(Sender: TObject);
      procedure btnImportClick(Sender: TObject);
      procedure btnProcessEquibaseChartsClick(Sender: TObject);

      procedure btnProcessDRFChartsClick(Sender: TObject);
      procedure btnQueryClick(Sender: TObject);
      procedure btnSpcHHClick(Sender: TObject);
      procedure btnStartOfDayClick(Sender: TObject);
      procedure btnTestClick(Sender: TObject);
      procedure btnUpdateAllRatingsClick(Sender: TObject);
      procedure btnCreateTodaysRatingsClick(Sender: TObject);
      procedure FormActivate(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure idFTPConnected(Sender: TObject);
      procedure idFTPDisconnected(Sender: TObject);
      procedure idFTPWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
      procedure idFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
      procedure idFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
      procedure idHTTPConnected(Sender: TObject);
      procedure idHTTPDisconnected(Sender: TObject);
      procedure idHTTPStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
      procedure idHTTPWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
      procedure idHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
      procedure idHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
      procedure mnuFileExitClick(Sender: TObject);
      procedure qrySQLAfterClose(DataSet: TDataSet);
      procedure qrySQLBeforeOpen(DataSet: TDataSet);
      procedure qrySQLNewRecord(DataSet: TDataSet);
      procedure qrySQLQueryProgress(Sender: TObject; PercentDone: Word; var AbortQuery: Boolean);
      procedure timChkTimer(Sender: TObject);
      procedure chkProcessAllDatesPropertiesChange(Sender: TObject);
      procedure chkOverrideDatePropertiesChange(Sender: TObject);
      procedure chkUseProxyPropertiesChange(Sender: TObject);
      procedure edtProxyPropertiesChange(Sender: TObject);
      procedure idFtpStatus(ASender: TObject; const AStatus: TIdStatus; const AStatusText: string);
      procedure btnCreateReportsNoneClick(Sender: TObject);
      procedure btnReProcessDaysClick(Sender: TObject);
      procedure btnCreateKeysClick(Sender: TObject);
      procedure btnProcessTodayClick(Sender: TObject);
      procedure btnProcessTomorrowClick(Sender: TObject);
      procedure btnProcessYesterdayClick(Sender: TObject);
      procedure cxButton2Click(Sender: TObject);
      procedure cxButton3Click(Sender: TObject);
      procedure btnConnectionsClick(Sender: TObject);
      procedure btnBatchSelectNoneClick(Sender: TObject);
      procedure btnBatchSelectAllClick(Sender: TObject);
      procedure btnUpdateRankingsClick(Sender: TObject);
      procedure btnProcessDailyClick(Sender: TObject);
      procedure navItemFinalOrderClick(Sender: TObject);
      procedure btnAnalysisFinalOrderFormClick(Sender: TObject);
      procedure btnRankingsFormClick(Sender: TObject);
      procedure btnTodaysEntriesFormClick(Sender: TObject);
      procedure btnConnectionsFormClick(Sender: TObject);
      procedure cxButton5Click(Sender: TObject);
      procedure btnFTPReportsNoneClick(Sender: TObject);
      procedure btnDownloadDRFResultsClick(Sender: TObject);
      procedure btnDownloadDRFChartsClick(Sender: TObject);
      procedure btnOptionsClick(Sender: TObject);
      procedure btnDownloadEquibaseResultsClick(Sender: TObject);
      procedure btnAddEquibaseResultsFromDiskClick(Sender: TObject);

      procedure btnAddDRFResultsFromDiskClick(Sender: TObject);
      procedure btnAddEquibaseChartsFromDiskClick(Sender: TObject);

      procedure btnAddDRFChartsFromDiskClick(Sender: TObject);
      procedure btnDownloadDaysClick(Sender: TObject);

      procedure qrySQLBeforeExecute(Sender: TObject);
      procedure qrySQLAfterExecute(Sender: TObject);

      procedure btnCreateResultReportsClick(Sender: TObject);
      procedure btnCreatePreviousDayTablesClick(Sender: TObject);
      procedure btnSelectNoneResultReportsClick(Sender: TObject);
      procedure btnSelectAllResultReportsClick(Sender: TObject);
      procedure btnDeleteResultReportsClick(Sender: TObject);
      procedure btnDeleteReportsClick(Sender: TObject);
      procedure btnExportToNexusClick(Sender: TObject);
      procedure btnFTPResultReportsClick(Sender: TObject);
      procedure chkPrevious21DaysByRaceDatePropertiesChange(Sender: TObject);
      procedure chkPrevious21DaysByTrkCodePropertiesChange(Sender: TObject);
      procedure chkPrevious21DaysByRaceTypePropertiesChange(Sender: TObject);
      procedure chkWagerResultsReportsPropertiesChange(Sender: TObject);
      procedure chkSpecialResultsReportsPropertiesChange(Sender: TObject);
      procedure chkBasicResultsReportsPropertiesChange(Sender: TObject);
      procedure chkPrevious21DaysByMLPropertiesChange(Sender: TObject);
      procedure chkAllResultsReportsPropertiesChange(Sender: TObject);
      procedure btnEmailWagerReportsClick(Sender: TObject);
      procedure btnEmailResultReportsClick(Sender: TObject);
      procedure btnImportFlashNetClick(Sender: TObject);
      procedure btnDownloadFlashNetClick(Sender: TObject);
      procedure btnDownloadAxcisBuggyClick(Sender: TObject);
      procedure btnBackupBuggyClick(Sender: TObject);
      procedure btnDownloadUSTAChartsClick(Sender: TObject);
      procedure btnProcessUSTAChartsClick(Sender: TObject);
      procedure btnDownloadSCChartsClick(Sender: TObject);
      procedure btnProcessSCChartsClick(Sender: TObject);
      procedure btnImportAxcisHarnessClick(Sender: TObject);
      procedure btnDeleteAllFTPReportClick(Sender: TObject);
      procedure btnDownloadSelectionsClick(Sender: TObject);
      procedure btnProcessSelectionsClick(Sender: TObject);
      procedure btnDownloadEquibaseStatsClick(Sender: TObject);
      procedure btnProcessEquibaseStatsClick(Sender: TObject);
      procedure btnRefreshLogClick(Sender: TObject);
      procedure btnDeleteLogClick(Sender: TObject);
      //   procedure edtOverrideDatePropertiesChange(Sender: TObject);
     //    procedure FormDestroy(Sender: TObject);
        // procedure btnProcessEquibaseResultsClick(Sender: TObject);
        // procedure btnProcessDRFResultsClick(Sender: TObject);
      procedure btnTestReportsClick(Sender: TObject);
      procedure btnBankClick(Sender: TObject);
      procedure btnWagersClick(Sender: TObject);
      procedure btnEditWagersClick(Sender: TObject);
      procedure btnLoadExceptionLogClick(Sender: TObject);
      procedure btnCreateFinalOrderClick(Sender: TObject);
      procedure btnCreateRankingsClick(Sender: TObject);
      procedure btnCreateAnalysisTablesClick(Sender: TObject);
      procedure btnDownloadReprocessDRFEquibaseClick(Sender: TObject);
      procedure btnDownloadTSNClick(Sender: TObject);
      procedure btnDownloadTsnResultsClick(Sender: TObject);
      procedure btnProcessTSNResultsClick(Sender: TObject);
      procedure btnReprocessTsnResultsClick(Sender: TObject);
      procedure btnLoadEquibaseLogClick(Sender: TObject);
      procedure btnLoadTSNLogClick(Sender: TObject);
      procedure btnLoadStatsLogClick(Sender: TObject);
      procedure btnLoadAxcisLogClick(Sender: TObject);
      procedure btnQueryPrevDayFormClick(Sender: TObject);
      procedure btnLoadBloodHorseLogClick(Sender: TObject);
      procedure btnTrainerConnectionsClick(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure edtOverrideDatePropertiesChange(Sender: TObject);
      procedure btnCreateJustResultReportsClick(Sender: TObject);
      procedure btnHHTestClick(Sender: TObject);
      procedure btnContendersClick(Sender: TObject);
      procedure btnProcessAfterTomorrowClick(Sender: TObject);
      procedure btnImportTodayClick(Sender: TObject);
      procedure DIHtmlLinksPlugin1Link(const Sender: TDIHtmlLinksPlugin;
         const TagID, AttribId: Cardinal; var Link: WideString; var Accept,
         Show: Boolean);
      procedure btnDownloadTSNLSCClick(Sender: TObject);
      procedure btnProcessLateScratchesClick(Sender: TObject);
      procedure btnProcessLateChangesClick(Sender: TObject);
      procedure Button1Click(Sender: TObject);
      procedure btnQueryPrevWeekFormClick(Sender: TObject);
      procedure btnResultsExportClick(Sender: TObject);
      procedure Button87Click(Sender: TObject);
      procedure btnCreatePTCFileClick(Sender: TObject);
      procedure MadExceptionHandler1ExceptAction(action: TExceptAction;
         const exceptIntf: IMEException; var handled: Boolean);
      procedure MadExceptionHandler1Exception(const exceptIntf: IMEException;
         var handled: Boolean);


   private

      iFinalWinPctAllOddsCnt: integer;
      iFinalWinPctWinOddsCnt: integer;
      { Private declarations }

      procedure ExportFiles(Sender: TObject);


      procedure ImportAxcisRaceEntry(
         sRaceFileName: string;
         sEntryFileName: string;
         sDamFileName: string;
         sSireFileName: string;
         sPastFileName: string;
         sMatchupFileName: string;
         sTrainerFileName: string;
         sJockeyFileName: string);

      procedure ImportAxcisPastMatch(
         sPastFileName: string;
         sMatchupFileName: string;
         sJockeyFileName: string
         );

      procedure ImportAxcisTodayRaceEntry(
         sRaceFileName: string;
         sEntryFileName: string;
         sDamFileName: string;
         sSireFileName: string;
         sPastFileName: string;
         sMatchupFileName: string;
         sTrainerFileName: string;
         sJockeyFileName: string);



      procedure UpdateValueChoice(
         tblR: TDBISAMTable;
         tblE: TDBISAMTable;
         pnlPrgBar: TPanel;
         prgBar: TcxProgressBar;
         staBar: TStatusBar;
         iIncCnt: Integer);




      function DownLoadFile(sURL: string; sLocalFile: string): boolean;
      function DownLoadLSCFile(sURL: string; sLocalFile: string): boolean;
      function DownLoadSelectionFile(sURL: string; sLocalFile: string): boolean;
      function GetGimmickChoice(tblR: TDBISAMTable; tblE: TDBISAMTable; iChoice: integer): double;
      function GetWagerNbr(sProgNbrIn: string): Integer;
      function StripOutName(sIn: string): string;
      function TrackNotPlayable(sTrkCode: string): boolean;

      procedure AddDam();
      procedure AddSire();
      procedure AddToDRFCharts(bUseOverrideDate: boolean);
      procedure AddToDRFResults(bUseOverrideDate: boolean);
      procedure AddToEquibaseCharts(bUseOverrideDate: boolean);
      procedure AddToEquibaseResults(bUseOverrideDate: boolean);
      procedure Backup(Sender: TObject);
      procedure BackupBuggy(Sender: TObject);
      procedure CopyAFile(AFrom: string; ATo: string);
      procedure CreateReports(Sender: TObject);
      procedure DeleteReports();
      procedure DeleteMikeReports();
      procedure DeleteJimReports();
      procedure DownloadAxcis(Sender: TObject);
      procedure DownloadDRFCharts(Sender: TObject);
      procedure DownloadDRFResults(Sender: TObject);

      procedure DownloadTsn(Sender: TObject);
      procedure DownloadTsnResults(Sender: TObject);
      procedure DownloadTsnLate(Sender: TObject);
      procedure DownloadTSNLSC(Sender: TObject);

      procedure FldDam();
      procedure FldEntryAxcis();
      procedure FldEntryAxcisToday();
      procedure FldRaceAxcisToday();
      procedure FldRH();
      procedure FldSire();
      procedure FTPReports(Sender: TObject);
      procedure DeleteAllFTPReports(Sender: TObject);
      procedure FTPSheets(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
      procedure DeleteFTPSheets(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
      procedure FTPExport(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
      procedure DeleteFTPExport(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
      procedure GetDamStats(sIn: string);
      procedure GetJockeyStats(sIn: string);
      procedure GetSireStats(sIn: string);
      procedure GetTrainerStats(sIn: string);
      procedure Import(Sender: TObject);
      procedure ImportAxcisEntry(lRecNo: Longint);
      procedure ImportAxcisTodayEntry(lRecNo: Longint);
      procedure ImportToday(Sender: TObject);
      procedure ImportTSNForToday(Sender: TObject);

      //      procedure UpdateTodayContenders(Sender: TObject);

      procedure ImportTSNOldToday(Sender: TObject);
      procedure ImportTSNOldResults(Sender: TObject;
         tblR: TDBISAMTable;
         tblE: TDBISAMTable
         );


      procedure ImportHDWForToday(Sender: TObject);

      procedure ImportHDWToday(Sender: TObject);
      procedure ImportHDWResults(Sender: TObject;
         tblR: TDBISAMTable;
         tblE: TDBISAMTable
         );




      procedure ProcessDRFResults(Sender: TObject; bUseOverride: boolean);


      procedure SaveMemoryTables();

      //      procedure TimerOn(bOn: boolean);


            // Run Seq 1 thru 5 needs to be run to create the Final Order Table from
            // the Horse History Table.
            //
            // This table will then be used by daily programs for handicapping
            // The run seq is set to run daily in the automatic daily processing
            // in chkTimer procedure.  They also can be run thru batch processing
            //
            // Run Seq 6 thru 9 need to be run to generate stat tables
            //

            // Updates the PK, SK, DK in HorseHistory
            // Run Seq 1
            // procedure Update_HH_PK_SK_DK_Keys(
            //    iIncCnt: integer;
            //    bOneDay: boolean;
            //    iNbrOfDays: integer
            //    );
            //
            // Creates the PK, SK, DK in FinalOrder from HorseHistory
            // Run Seq 2
            //procedure Create_FO_PK_SK_DK_Keys(
            //   iIncCnt: integer;
            //   bOneDay: boolean;
            //   iNbrOfDays: integer
            //   );
            //
            // Gets win pct for PK, SK and DK. Since fields are same names in HH
            // and entries files it is used by daily and stat updates
            // Run Seq 3
            //procedure Update_PK_SK_DK_WinPct(
            //   tblR: TDBISAMTable;
            //   tblE: TDBISAMTable;
            //   pnlPrgBar: TPanel;
            //   prgBar: TcxProgressBar;
            //   staBar: TStatusBar;
            //   iIncCnt: integer;
            //   bOneDay: boolean;
            //   iNbrOfDays: integer
            //   );


            // Sets win pct rank for PK, SK and DK. Used by daily and stat updates
            // Run Seq 4
            //procedure Update_PK_SK_DK_WinPctRank(
            //   tblR: TDBISAMTable;
            //   tblE: TDBISAMTable;
            //   pnlPrgBar: TPanel;
            //   prgBar: TcxProgressBar;
            //   staBar: TStatusBar;
            //   iIncCnt: integer;
            //   bOneDay: boolean;
            //   iNbrOfDays: integer
            //   );

            // Creates the Final Order Keys from Horse History File
            // Run Seq 5
            //procedure Create_FO_FK_Key(
            //   iIncCnt: integer;
            //   bOneDay: boolean;
            //   iNbrOfDays: integer
            //   );


            // Sets win pct rank for FK. Used by daily and stat updates
            // Run Seq 7
            // procedure Update_FK_WinPctRank(
            //    tblR: TDBISAMTable;
            //    tblE: TDBISAMTable;
            //    pnlPrgBar: TPanel;
            //    prgBar: TcxProgressBar;
            //    staBar: TStatusBar;
            //    iIncCnt: integer;
            //    bOneDay: boolean;
            //    iNbrOfDays: integer
            //    );

            // Sets win pct rank for FK (FinalKey) . Used by daily and stat updates
            // Run Seq 8
      procedure AdjustFinalWinPct
         (
         tblR: TDBISAMTable;
         tblE: TDBISAMTable;
         pnlPrgBar: TPanel;
         prgBar: TcxProgressBar;
         staBar: TStatusBar;
         iIncCnt: integer;
         bOneDay: boolean;
         iNbrOfDays: integer
         );

      // Sets final order for sheets. Used by daily and stat updates
      // Run Seq 9
//
//       procedure UpdateTodaysWagerWinPct(
//          tblR: TDBISAMTable;
//          tblE: TDBISAMTable;
//          tblF: TDBISAMTable;
//          pnlPrgBar: TPanel;
//          prgBar: TcxProgressBar;
//          staBar: TStatusBar;
//          iIncCnt: integer;
//          bOneDay: boolean;
//          iNbrOfDays: integer
//          );
//
      // Run Seq 10
      // procedure Update_TodaysWagerWinPctRank(
      //    tblR: TDBISAMTable;
      //    tblE: TDBISAMTable;
      //    pnlPrgBar: TPanel;
      //    prgBar: TcxProgressBar;
      //    staBar: TStatusBar;
      //    iIncCnt: integer;
      //    bOneDay: boolean;
      //    iNbrOfDays: integer
      //    );
      //
      // Creates stat tables
      // Run Seq 11
      // procedure GenRankingStatsClick(Sender: TObject; bOneDay: boolean; iNbrOfDays: integer);

      // Creates stat tables
      // Run Seq 12
      // procedure GenRankingStatsByTrackClick(Sender: TObject; bOneDay: boolean; iNbrOfDays: integer);


      // Run Seq 13
      //procedure Update_PK_SK_DK_FK_ValueBetRank(
      //   tblR: TDBISAMTable;
      //   tblE: TDBISAMTable;
      //   pnlPrgBar: TPanel;
      //   prgBar: TcxProgressBar;
      //   staBar: TStatusBar;
      //   iIncCnt: integer;
      //   bOneDay: boolean;
      //   iNbrOfDays: integer
      //   );


      procedure UpdateTblProgressStatusBar(tbl: TDBISAMTable; sHeading: string);

      function ParseEquibaseCharts(sFileName: string): string;
      function ParseEquibaseResults(sFileName: string): string;

      function ParseDRFCharts(sFileName: string): string;
      function ParseDRFResults(sFileName: string): string;

      procedure ReprocessDays(Sender: TObject);
      procedure ReprocessEquibaseDays(Sender: TObject);
      //procedure UpdateRaceHistory(Sender: TObject);

      procedure UpdateValueIndicator(Sender: TObject);

      procedure DownloadSelections(Sender: TObject; sTrkCode: string);
      procedure ProcessSelections(Sender: TObject; sTrkCode: string);
      procedure ParseHAWSelections(sFileName: string; sSaveFileName: string; sFileTrkCode: string; dtFileTrkDate: TDateTime);
      procedure DownloadEquibaseStats(Sender: TObject);
      procedure DownloadEquibaseResults(Sender: TObject);
      procedure DownloadEquibaseCharts(Sender: TObject);

      //procedure ProcessEquibaseStats(Sender: TObject; sStatType: string; sYear: string);
      //procedure ParseEquibaseStats(sFileName: string; sSaveFileName: string; sStatType: string; sYear: string; tbl: TDBISAMTable);

      //procedure ProcessEquibaseTrackLeaders(Sender: TObject);
      //procedure ParseEquibaseTrackLeaders(sFileName: string; sSaveFileName: string; tbl: TDBISAMTable);

      procedure DownloadTrackLeaders(Sender: TObject; sStatType: string);
      procedure UpdateTrackTable(Sender: TObject);
      function StringListTrim(const Search: string): string;

      procedure DownloadTSNAvailable(Sender: TObject);

      procedure ImportTSNHistory(Sender: TObject);
      procedure ImportHDWHistory(Sender: TObject);
   public
      { Public declarations }
      dAverageSpeed: Double;
      bCreateAll: boolean;
   end;

var
   MainForm: TMainForm;

implementation

uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   FormEntry, FormFinalOrder, stStat, ESBRtns, ESBMaths,
   FormConnection, FormRanking, ReportTip, ReportHospital, ReportHospital2, ReportGimmick,
   ReportValue, ReportSelection, FormOptions, ReportWager,
   ReportContest, HDataModule,
   Math, UnitDBRoutines, UnitSetRanking,
   UnitCommonCode, UnitGenerateRankings, UnitGenerateRankingsByTrack,
   UnitUpdateSummaryTables, UnitProcessEquibaseCharts,
   UnitProcessEquibaseResults, UnitProcessEquibaseStats,
   UnitProcessEquibaseTrackLeaders, UnitProcessDRFCharts,
   UnitProcessPicksAndResults, UnitUpdateTipSelections,
   UnitUpdateGimmicks, UnitUpdateNbrOfStarters,
   UnitUpdateFinalWinPct, UnitGetHandicappingKeys,
   UnitUpdateKeysInHorseHistory, UnitCreateFinalKeys,
   UnitCreateTodaysRatings,
   UnitUpdateHHFromToday, UnitUpdateOddsProbability,
   UnitSetLiners, FormBank, UnitUpdateWagers, UnitUpdateHHMisc,
   ReportYouBetResults, ReportHospitalResults, FormWagers,
   ReportLinersResults, ReportWagerResults, UnitQrySQL, UnitUpdateSuper,
   UnitDownloadSireLists, UnitUpdateKeysWinPct,
   UnitProcessBloodHorseSireLists, UnitSireInfo, UnitUpdatePace,
   UnitCreatePrevious, DatDBF, UnitSpeedPoints, UnitAngles,
   UnitCalibrationHandicapping, UnitIndexTodayFiles, ReportValueShort,
   UnitTSNImport, ReportTSNSheets, UnitUpdateTodaysWinPct,
   UnitUpdateTopFigures, UnitUpdateLines, UnitUpdateReportSelections,
   FormQuery, QueryWagerResults, FormTrainerConnections,
   ReportContestResults, UnitTSNImportMCP, UnitUpdateTSN,
   UnitHDWImportJCP, UnitUpdateHDW,
   UnitProcessTSNLists, unitProcessTSNChanges;


{$R *.DFM}


function TMainForm.DownLoadLSCFile(sURL: string; sLocalFile: string): boolean;
var
   iAttributes: integer;
   tsFile: TSearchRec;
   fsIn: TFileStream;
begin

   try
      Result := False;
      UpdateStatusBar(sURL + ' ' + sLocalFile);
      fsIn := TFileStream.Create(sLocalFile, fmCreate);
      idHTTP.Get(sURL, fsIn);
   except
      Result := False;
      fsIn.Destroy;
      DeleteFile(sLocalFile);
      UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      Exit;
   end;

   fsIn.Destroy;
   iAttributes := faAnyFile;
   if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      if (tsFile.Size > 3000) then begin
         Result := False;
         //   DeleteFile(sLocalFile);
         FindClose(tsFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end else begin
         Result := True;
         FindClose(tsFile);
         UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
         Exit;
      end;
   end;

   UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
   Result := True;
end;

function TMainForm.DownLoadFile(sURL: string; sLocalFile: string): boolean;
var
   iAttributes: integer;
   tsFile: TSearchRec;
   fsIn: TFileStream;
begin

   try
      Result := False;
      UpdateStatusBar(sURL + ' ' + sLocalFile);
      fsIn := TFileStream.Create(sLocalFile, fmCreate);
      idHTTP.Get(sURL, fsIn);
   except
      Result := False;
      fsIn.Destroy;
      DeleteFile(sLocalFile);
      UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      Exit;
   end;

   fsIn.Destroy;
   iAttributes := faAnyFile;
   if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      if (tsFile.Size < MIN_EQUIBASE_FILE_SIZE) then begin
         Result := False;
         DeleteFile(sLocalFile);
         FindClose(tsFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end else begin
         Result := True;
         FindClose(tsFile);
         UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
         Exit;
      end;
   end;

   UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
   Result := True;
end;

procedure TMainForm.ImportAxcisPastMatch
   (
   sPastFileName: string;
   sMatchupFileName: string;
   sJockeyFileName: string
   );
var
   bFinished: boolean;

   sTmp: string;
   iBegPos: integer;
   iEndPos: integer;
   iLen: integer;

   sD: string;
   sM: string;
   sY: string;

   dtPastRaceDate: TDateTime;

   sPastRaceType: string;
   sPastTrkCode: string;
   sPastRaceNbr: string;
   sPastPostPos: string;
   sPastRaceDate: string;

   sPastOdds: string;


   sPastRaceClass: string;
   sPastClmPrice: string;

   sPastPurse: string;
   sPastBlSep: string;
   sPastRaceDesc: string;
   sPastSurf: string;
   sPastRaceConditions: string;
   sPastDistanceDesc: string;

   fPastDistance: double;
   iPastFinishPos: integer;
   fPastBL: double;
   fPastOdds: double;

   sPastFavoriteIndicator: string;
   sPastDQIndicator: string;
   sPastJockey: string;
   sPastClaimed: string;
   sPastComment: string;
   sPastComment2: string;
   sPastTopFinish1: string;
   sPastTopFinish2: string;
   sPastTopFinish3: string;
   sPastTrkCond: string;
   fPastClmPrice: double;
   fPastPurse: double;

   fPace1: double;
   fPace2: double;

   fBackPace1: double;
   fBackPace2: double;

   fBackClass: double;
   fCurrClass: double;

   iPastSpeed: integer;

   fLastClassRating: double;

   bRouteRace: boolean;
   fTimeDiff: double;

   fFldStarts: double;
   fTotalWins: double;

   sSurface: string;

   iPastClassRating: integer;
   lJockeyRecNo: longint;

   sPastTop3Finishers: string;

   sPastTime1stCall: string;
   sPastTime2ndCall: string;
   sPastTimeStrCall: string;
   sPastTimeFinCall: string;

   sPastBL1stCall: string;
   sPastBL2ndCall: string;
   sPastBLStrCall: string;
   sPastBLFinCall: string;

   sPastPos1stCall: string;
   sPastPos2ndCall: string;
   sPastPosStrCall: string;
   sPastPosFinCall: string;

   fPastPos1stCall: double;
   fPastPos2ndCall: double;
   fPastPosStrCall: double;
   fPastPosFinCall: double;


   sPast1stPace: string;
   sPast2ndPace: string;

   sPastSpeed: string;
   sPastClass: string;

   iPastDistance: integer;
   sMonthDesc: string;

   sPastGateBreak: string;
   sPastLen1Back: string;
   sPastLen2Back: string;
   sPastStrLenBack: string;
   sPastFinishBeaten: string;
   sPastRunningLine: string;

   sPastEquip: string;
   sPastWeight: string;
   sPastTrackVariant: string;
   sPastSRWinner: string;
   sPastHorseTime: string;
   sPastWinTime: string;

   sPastTrackLine: string;
   sPastFractionsLine: string;
   sPastOddsLine: string;
   sPastExtraLine: string;
   sPastClassLine: string;

   iNbrPP: integer;
   iHorseNbr: integer;
   iSaveHorseNbr: integer;


   iStaCnt: integer;
   iRecordCount: integer;

   iPastFldSize: integer;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   iPastNbr: integer;
   iPastSaveHorseNbr: integer;
   iPastHorseNbr: integer;

begin

   hLog.LogFileName := LOG_PATH + AXCIS_LOG_FILENAME;
   hLog.AddToLog('ImportAxcisPastMatch', msevOperation);
   bFinished := False;
   try
      dmDBF.dbfPast.Active := False;
      dmDBF.dbfPast.TableName := sPastFileName;
      dmDBF.dbfPast.FilePath := AXCIS_PATH;
      dmDBF.dbfPast.FilePathFull := AXCIS_PATH;
      dmDBF.dbfPast.Active := True;

      dmDBF.dbfMatchup.Active := False;
      dmDBF.dbfMatchup.TableName := sMatchupFileName;
      dmDBF.dbfMatchup.FilePath := AXCIS_PATH;
      dmDBF.dbfMatchup.FilePathFull := AXCIS_PATH;
      dmDBF.dbfMatchup.Active := True;

      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfJockey.TableName := sJockeyFileName;
      dmDBF.dbfJockey.FilePath := AXCIS_PATH;
      dmDBF.dbfJockey.FilePathFull := AXCIS_PATH;
      dmDBF.dbfJockey.Active := True;
   except
      dmDBF.dbfPast.Active := False;
      dmDBF.dbfMatchup.Active := False;
      dmDBF.dbfJockey.Active := False;
   end;

   //   UpdateStatusBar('Loading ' + sPastFileName);
   InitPrgBar(dmDBF.dbfPast.RecordCount);

   try

      OpenTable(dm.tblRH);
      OpenTable(dm.tblHH);
      OpenTable(dm.tblProcessed);
      OpenTable(dm.tblRatings);
      OpenTable(dm.tblPast);
      OpenTable(dm.tblPP);


      //*** Past

      dmDBF.dbfPast.First();
      UpdateStatusBar('Importing Past Performances: ' + sPastTrkCode);

      iPastNbr := 0;
      iPastHorseNbr := 0;
      iPastSaveHorseNbr := 0;

      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end;
      while (not bFinished) do begin

         if (dmDBF.dbfPast.Eof) then begin
            bFinished := True;
         end;

         IncPrgBar();

         sY := FormatDateTime('yyyy', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
         sM := FormatDateTime('mm', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
         sD := FormatDateTime('dd', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);

         sPastTrkCode := CopyStr(dmDBF.dbfPast.FieldByName('TRACK_RACE').AsString, 1, 3);
         sPastRaceNbr := CopyStr(dmDBF.dbfPast.FieldByName('TRACK_RACE').AsString, 4, 3);
         sPastPostPos := dmDBF.dbfPast.FieldByName('POST_POS').AsString;
         sPastOdds := dmDBF.dbfPast.FieldByName('ODDS').AsString;


         sPastRaceType := Trim(CopyStr(dmDBF.dbfPast.FieldByName('CLASS').AsString, 1, 3));
         sPastRaceClass := GetRaceClass(sPastRaceType);

         //
         sTmp := dmDBF.dbfPast.FieldByName('FIN_BEATEN').AsString;
         iLen := Length(sTmp);
         iBegPos := SmartPos('-', sTmp);
         sPastBLFinCall := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);

         sTmp := dmDBF.dbfPast.FieldByName('LEN1_BACK').AsString;
         iLen := Length(sTmp);
         iBegPos := SmartPos('-', sTmp);
         sPastBL1stCall := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);

         sTmp := dmDBF.dbfPast.FieldByName('LEN2_BACK').AsString;
         iLen := Length(sTmp);
         iBegPos := SmartPos('-', sTmp);
         sPastBL2ndCall := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);

         sTmp := dmDBF.dbfPast.FieldByName('STLEN_BACK').AsString;
         iLen := Length(sTmp);
         iBegPos := SmartPos('-', sTmp);
         sPastBLStrCall := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);

         //
         sTmp := dmDBF.dbfPast.FieldByName('LEN1_BACK').AsString;
         iEndPos := SmartPos('-', sTmp);
         iLen := Length(sTmp);
         if iEndPos > 0 then begin
            sPastPos1stCall := CopyStr(sTmp, 1, (iEndPos - 1));
            fPastPos1stCall := atof(sPastPos1stCall);
         end else begin
            fPastPos1stCall := 0;
         end;

         //
         sTmp := dmDBF.dbfPast.FieldByName('LEN2_BACK').AsString;
         iEndPos := SmartPos('-', sTmp);
         iLen := Length(sTmp);
         if iEndPos > 0 then begin
            sPastPos2ndCall := CopyStr(sTmp, 1, (iEndPos - 1));
            fPastPos2ndCall := atof(sPastPos2ndCall);
         end else begin
            fPastPos2ndCall := 0;
         end;

         //
         sTmp := dmDBF.dbfPast.FieldByName('STLEN_BACK').AsString;
         iEndPos := SmartPos('-', sTmp);
         iLen := Length(sTmp);
         if iEndPos > 0 then begin
            sPastPosStrCall := CopyStr(sTmp, 1, (iEndPos - 1));
            fPastPosStrCall := atof(sPastPosStrCall);
         end else begin
            fPastPosStrCall := 0;
         end;

         //
         sTmp := dmDBF.dbfPast.FieldByName('FIN_BEATEN').AsString;
         iEndPos := SmartPos('-', sTmp);
         iLen := Length(sTmp);
         if iEndPos > 0 then begin
            sPastPosFinCall := CopyStr(sTmp, 1, (iEndPos - 1));
            fPastPosFinCall := atof(sPastPosFinCall);
         end else begin
            fPastPosFinCall := 0;
         end;

         if (iStaCnt > SMALL_BATCH_SIZE) then begin
            iStaCnt := 0;
            if not dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.StartTransaction();
            end else begin
               if dm.dbSireRate.InTransaction then begin
                  dm.dbSireRate.Commit;
                  dm.dbSireRate.StartTransaction();
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
         end;

         dm.tblHH.IndexName := '';
         dm.tblHH.SetKey();
         dm.tblHH.FieldByName('TrkCode').AsString := sPastTrkCode;
         dm.tblHH.FieldByName('RaceNbr').AsInteger := atoi(sPastRaceNbr);
         dm.tblHH.FieldByName('RaceDate').AsDateTime := dmDBF.dbfPast.FieldByName('DATE').AsDateTime;
         dm.tblHH.FieldByName('PostPos').AsInteger := atoi(sPastPostPos);
         if (dm.tblHH.GotoKey()) then begin
            dm.tblHH.Edit();
            dm.tblHH.FieldByName('Odds').AsFloat := atof(sPastOdds);
            dm.tblHH.FieldByName('FinishPos').AsFloat := atof(sPastPosFinCall);
            dm.tblHH.FieldByName('TrkCond').AsString := dmDBF.dbfPast.FieldByName('TRACK_COND').AsString;
            dm.tblHH.FieldByName('Surface').AsString := GetAxcisSurface(CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 5, 1));
            if dmDBF.dbfPast.FieldByName('FAV_INDC').AsString = '*' then begin
               dm.tblHH.FieldByName('IsFavorite').AsBoolean := True;
            end else begin
               dm.tblHH.FieldByName('IsFavorite').AsBoolean := False;
            end;
            dm.tblHH.Post();
         end;

         dm.tblRH.IndexName := '';
         dm.tblRH.SetKey();
         dm.tblRH.FieldByName('TrkCode').AsString := sPastTrkCode;
         dm.tblRH.FieldByName('RaceNbr').AsInteger := atoi(sPastRaceNbr);
         dm.tblRH.FieldByName('RaceDate').AsDateTime := dmDBF.dbfPast.FieldByName('DATE').AsDateTime;
         if (dm.tblRH.GotoKey()) then begin
            dm.tblRH.Edit();
            dm.tblRH.FieldByName('TrkCond').AsString := dmDBF.dbfPast.FieldByName('TRACK_COND').AsString;
            dm.tblRH.FieldByName('Surface').AsString := GetAxcisSurface(CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 5, 1));
            dm.tblRH.FieldByName('DistanceDesc').AsString := CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 1, 4);
            dm.tblRH.FieldByName('RaceConditions').AsString := dmDBF.dbfPast.FieldByName('NON_WIN_R').AsString;
            dm.tblRH.Post();
         end;

         Inc(iPastNbr);
         iPastHorseNbr := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
         if (iPastHorseNbr <> iPastSaveHorseNbr) then begin
            iPastNbr := 1;
            iPastSaveHorseNbr := iPastHorseNbr;
         end;

         dm.tblPast.IndexName := '';
         dm.tblPast.SetKey();
         dm.tblPast.FieldByName('TrkCode').AsString := sFileTrkCode;
         dm.tblPast.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
         dm.tblPast.FieldByName('HorseNbr').AsInteger := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
         dm.tblPast.FieldByName('PPNbr').Value := iPastNbr;
         if not dm.tblPast.GotoKey() then begin
            dm.tblPast.Append();
            dm.tblPast.FieldByName('TrkCode').AsString := sFileTrkCode;
            dm.tblPast.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
            dm.tblPast.FieldByName('HorseNbr').AsInteger := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
            dm.tblPast.FieldByName('PPNbr').Value := iPastNbr;

            dm.tblPast.FieldByName('LastTrkCode').AsString := sPastTrkCode;
            dm.tblPast.FieldByName('LastRaceDate').AsDateTime := dmDBF.dbfPast.FieldByName('DATE').AsDateTime;
            dm.tblPast.FieldByName('LastRaceNbr').AsInteger := atoi(CopyStr(dmDBF.dbfPast.FieldByName('TRACK_RACE').AsString, 4, 3));
            dm.tblPast.FieldByName('LastPostPos').AsInteger := atoi(Trim(dmDBF.dbfPast.FieldByName('POST_POS').AsString));

            dm.tblPast.FieldByName('LastRaceType').AsString := sPastRaceClass;
            dm.tblPast.FieldByName('LastRaceConditions').AsString := Trim(dmDBF.dbfPast.FieldByName('NON_WIN_R').AsString);
            dm.tblPast.FieldByName('LastDistanceDesc').AsString := CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 1, 4);
            dm.tblPast.FieldByName('LastSurf').AsString := CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 5, 1);

            dm.tblPast.FieldByName('LastTrkCond').AsString := dmDBF.dbfPast.FieldByName('TRACK_COND').AsString;
            dm.tblPast.FieldByName('LastOdds').AsFloat := atof(sPastOdds);

            dm.tblPast.FieldByName('LastComment').AsString := dmDBF.dbfPast.FieldByName('COMMENT').AsString;
            dm.tblPast.FieldByName('LastComment2').AsString := dmDBF.dbfPast.FieldByName('COMM_2').AsString;
            dm.tblPast.FieldByName('LastDQIndicator').AsString := dmDBF.dbfPast.FieldByName('DQ_INDC').AsString;
            dm.tblPast.FieldByName('LastFavoriteIndicator').AsString := dmDBF.dbfPast.FieldByName('FAV_INDC').AsString;
            dm.tblPast.FieldByName('LastPurse').AsInteger := Round(atof(dmDBF.dbfPast.FieldByName('PURSE').AsString) * 1000);
            dm.tblPast.FieldByName('LastClmPrice').AsInteger := Round(atof(dmDBF.dbfPast.FieldByName('CLM_PRICE').AsString) * 1000);
            dm.tblPast.FieldByName('LastClaimed').AsString := Trim(dmDBF.dbfPast.FieldByName('IS_CLM').AsString);

            dm.tblPast.FieldByName('LastTopFinish1').AsString := UpperCase(dmDBF.dbfPast.FieldByName('TOP1_FINSH').AsString);
            dm.tblPast.FieldByName('LastTopFinish2').AsString := UpperCase(dmDBF.dbfPast.FieldByName('TOP2_FINSH').AsString);
            dm.tblPast.FieldByName('LastTopFinish3').AsString := UpperCase(dmDBF.dbfPast.FieldByName('TOP3_FINSH').AsString);

            lJockeyRecNo := atol(dmDBF.dbfPast.FieldByName('JN').AsString);
            if (lJockeyRecNo > 0) then begin
               dmDBF.dbfJockey.PhysicalRecNo := lJockeyRecNo;
               dm.tblPast.FieldByName('LastJockey').Value := dmDBF.dbfJockey.FieldByName('JOCKNAME').AsString;
            end;

            sY := FormatDateTime('yyyy', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
            sM := FormatDateTime('mm', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
            sD := FormatDateTime('dd', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);

            dm.tblPast.FieldByName('LastDay').AsString := sY;
            dm.tblPast.FieldByName('LastMonthDesc').AsString := GetMonthDesc(atoi(sM));
            dm.tblPast.FieldByName('LastYear').AsString := sY;

            dm.tblPast.FieldByName('LastTime1stCall').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('PTCALL1').AsString));
            dm.tblPast.FieldByName('LastTime2ndCall').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('PTCALL2').AsString));
            dm.tblPast.FieldByName('LastTimeStrCall').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('PTCALL3').AsString));
            dm.tblPast.FieldByName('LastTimeFinCall').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('WIN_TIME').AsString));

            dm.tblPast.FieldByName('LastBL1stCall').AsFloat := atof(sPastBL1stCall);
            dm.tblPast.FieldByName('LastBL2ndCall').AsFloat := atof(sPastBL2ndCall);
            dm.tblPast.FieldByName('LastBLStrCall').AsFloat := atof(sPastBLStrCall);
            dm.tblPast.FieldByName('LastBLFinCall').AsFloat := atof(sPastBLFinCall);

            dm.tblPast.FieldByName('LastPos1stCall').AsFloat := atof(sPastPos1stCall);
            dm.tblPast.FieldByName('LastPos2ndCall').AsFloat := atof(sPastPos2ndCall);
            dm.tblPast.FieldByName('LastPosStrCall').AsFloat := atof(sPastPosStrCall);
            dm.tblPast.FieldByName('LastPosFinCall').AsFloat := atof(sPastPosFinCall);

            dm.tblPast.FieldByName('LastGateBreak').AsString := Trim(dmDBF.dbfPast.FieldByName('GATE_BREAK').AsString);
            dm.tblPast.FieldByName('LastLen1Back').AsString := Trim(dmDBF.dbfPast.FieldByName('LEN1_BACK').AsString);
            dm.tblPast.FieldByName('LastLen2Back').AsString := Trim(dmDBF.dbfPast.FieldByName('LEN2_BACK').AsString);
            dm.tblPast.FieldByName('LastStLenBack').AsString := Trim(dmDBF.dbfPast.FieldByName('STLEN_BACK').AsString);
            dm.tblPast.FieldByName('LastFinishBeaten').AsString := Trim(dmDBF.dbfPast.FieldByName('FIN_BEATEN').AsString);

            dm.tblPast.FieldByName('LastEquip').AsString := dmDBF.dbfPast.FieldByName('EQUIP').AsString;

            dm.tblPast.FieldByName('LastWeight').AsInteger := atoi(dmDBF.dbfPast.FieldByName('WEIGHT').AsString);
            dm.tblPast.FieldByName('LastTrackVariant').AsInteger := atoi(Trim(dmDBF.dbfPast.FieldByName('TRACK_VAR').AsString));

            dm.tblPast.FieldByName('LastClass').AsInteger := atoi(Trim(dmDBF.dbfPast.FieldByName('SPD_FIG').AsString));
            dm.tblPast.FieldByName('LastSpeed').AsInteger := atoi(Trim(dmDBF.dbfPast.FieldByName('CLASS_RTG').AsString));

            dm.tblPast.FieldByName('LastHorseTime').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('WIN_TIME').AsString));


            dm.tblPast.FieldByName('LastSRWinner').AsFloat := atof(Trim(dmDBF.dbfPast.FieldByName('SR_WIN').AsString));

            dm.tblPast.Post();
         end;

         sPastTrkCode := CopyStr(dmDBF.dbfPast.FieldByName('TRACK_RACE').AsString, 1, 3);
         sPastRaceNbr := CopyStr(dmDBF.dbfPast.FieldByName('TRACK_RACE').AsString, 4, 3);

         sPastRaceDate := DateToStr(dtAxcisRaceDate);
         iPastHorseNbr := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
         sPastTrkCode := sPastTrkCode;

         sPastRaceType := sPastRaceClass;
         sPastRaceConditions := Trim(dmDBF.dbfPast.FieldByName('NON_WIN_R').AsString);
         sPastDistanceDesc := CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 1, 4);
         sPastSurf := CopyStr(dmDBF.dbfPast.FieldByName('DIST_SURF').AsString, 5, 1);
         if (sPastSurf = 'E') then begin
            sPastSurf := 'D';
         end;
         if (sPastSurf = 'N') then begin
            sPastSurf := 'D';
         end;
         if (sPastSurf = 'I') then begin
            sPastSurf := 'T';
         end;
         if (sPastSurf = 'C') then begin
            sPastSurf := 'T';
         end;
         if (sPastSurf = 'O') then begin
            sPastSurf := 'T';
         end;

         if sPastSurf = 'y' then begin
            iPastDistance := atoi(sPastDistanceDesc);
            sPastDistanceDesc := GetYardDistanceDesc(iPastDistance);
            fPastDistance := atof(sPastDistanceDesc) / YARDS_IN_FURLONG;
            sPastSurf := 'D';
         end else begin
            fPastDistance := atof(sPastDistanceDesc);
            sPastDistanceDesc := GetFurlongDistanceDesc(fPastDistance);
         end;

         sPastTrkCond := dmDBF.dbfPast.FieldByName('TRACK_COND').AsString;
         fPastOdds := atof(sPastOdds);

         //         fPastPos1stCall := atof(sPastPos1stCall);
         //         fPastPos2ndCall := atof(sPastPos2ndCall);
         //         fPastPosStrCall := atof(sPastPosStrCall);
         //         fPastPosFinCall := atof(sPastPosFinCall);

         fPastBL := atof(sPastBLFinCall);

         sPastComment := dmDBF.dbfPast.FieldByName('COMMENT').AsString;
         sPastComment2 := dmDBF.dbfPast.FieldByName('COMM_2').AsString;
         sPastDQIndicator := dmDBF.dbfPast.FieldByName('DQ_INDC').AsString;
         sPastFavoriteIndicator := dmDBF.dbfPast.FieldByName('FAV_INDC').AsString;
         fPastPurse := Round(atof(dmDBF.dbfPast.FieldByName('PURSE').AsString) * 1000);
         fPastClmPrice := Round(atof(dmDBF.dbfPast.FieldByName('CLM_PRICE').AsString) * 1000);
         sPastClaimed := Trim(dmDBF.dbfPast.FieldByName('IS_CLM').AsString);

         sPastTopFinish1 := UpperCase(Trim(dmDBF.dbfPast.FieldByName('TOP1_FINSH').AsString));
         sPastTopFinish2 := UpperCase(Trim(dmDBF.dbfPast.FieldByName('TOP2_FINSH').AsString));
         sPastTopFinish3 := UpperCase(Trim(dmDBF.dbfPast.FieldByName('TOP3_FINSH').AsString));

         iPastClassRating := atoi(dmDBF.dbfPast.FieldByName('CLASS_RTG').AsString);

         sPastPurse := FormatFloat('#######', fPastPurse);
         sPastClmPrice := FormatFloat('#######', fPastClmPrice);
         sPastOdds := FormatFloat('##0.00', fPastOdds);

         sPastBLFinCall := FormatFloat('#0.00', fPastBL);
         sPastPosFinCall := FormatFloat('##', fPastPosFinCall);

         sPastPostPos := Trim(dmDBF.dbfPast.FieldByName('POST_POS').AsString);

         sPastTime1stCall := Trim(dmDBF.dbfPast.FieldByName('PTCALL1').AsString);
         if (atof(sPastTime1stCall) > 0.00) then begin
            sPastTime1stCall := FormatFloat('##0.0', atof(sPastTime1stCall));
         end else begin
            sPastTime1stCall := ' ';
         end;

         sPastTime2ndCall := Trim(dmDBF.dbfPast.FieldByName('PTCALL2').AsString);
         if (atof(sPastTime2ndCall) > 0.00) then begin
            sPastTime2ndCall := FormatFloat('##0.0', atof(sPastTime2ndCall));
         end else begin
            sPastTime2ndCall := ' ';
         end;

         sPastTimeStrCall := Trim(dmDBF.dbfPast.FieldByName('PTCALL3').AsString);
         if (atof(sPastTimeStrCall) > 0.00) then begin
            sPastTimeStrCall := FormatFloat('##0.0', atof(sPastTimeStrCall));
         end else begin
            sPastTimeStrCall := ' ';
         end;

         sPastTimeFinCall := Trim(dmDBF.dbfPast.FieldByName('RACE_TIME').AsString);
         if (atof(sPastTimeFinCall) > 0.00) then begin
            sPastTimeFinCall := FormatFloat('##0.0', atof(sPastTimeFinCall));
         end else begin
            sPastTimeFinCall := ' ';
         end;

         sPastSpeed := Trim(dmDBF.dbfPast.FieldByName('SPD_FIG').AsString);
         sPastClass := Trim(dmDBF.dbfPast.FieldByName('CLASS_RTG').AsString);

         if Length(sPastBLFinCall) = 1 then begin
            sPastBLFinCall := ' ' + sPastBLFinCall;
         end;
         if Length(sPastBLFinCall) = 2 then begin
            sPastBLFinCall := ' ' + sPastBLFinCall;
         end;
         if Length(sPastBLFinCall) = 3 then begin
            sPastBLFinCall := ' ' + sPastBLFinCall;
         end;
         if Length(sPastBLFinCall) = 4 then begin
            sPastBLFinCall := ' ' + sPastBLFinCall;
         end;

         if Length(sPastOdds) = 1 then begin
            sPastOdds := ' ' + sPastOdds;
         end;
         if Length(sPastOdds) = 2 then begin
            sPastOdds := ' ' + sPastOdds;
         end;
         if Length(sPastOdds) = 3 then begin
            sPastOdds := ' ' + sPastOdds;
         end;
         if Length(sPastOdds) = 4 then begin
            sPastOdds := ' ' + sPastOdds;
         end;
         if Length(sPastOdds) = 5 then begin
            sPastOdds := ' ' + sPastOdds;
         end;

         if Length(sPastPosFinCall) = 0 then begin
            sPastPosFinCall := ' ' + sPastPosFinCall;
         end;

         if Length(sPastPosFinCall) = 1 then begin
            sPastPosFinCall := ' ' + sPastPosFinCall;
         end;

         if sPastBLFinCall = ' 0.00' then begin
            sPastBLFinCall := '     ';
            sPastBlSep := ' ';
         end else begin
            sPastBlSep := '-';
         end;

         if sPastPosFinCall = ' 0' then begin
            sPastPosFinCall := '  ';
         end;

         if sPastOdds = '  0.00' then begin
            sPastOdds := '      ';
         end;

         sY := FormatDateTime('yyyy', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
         sM := FormatDateTime('mm', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
         sD := FormatDateTime('dd', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);

         sPastGateBreak := Trim(dmDBF.dbfPast.FieldByName('GATE_BREAK').AsString);
         sPastLen1Back := Trim(dmDBF.dbfPast.FieldByName('LEN1_BACK').AsString);
         sPastLen2Back := Trim(dmDBF.dbfPast.FieldByName('LEN2_BACK').AsString);
         sPastStrLenBack := Trim(dmDBF.dbfPast.FieldByName('STLEN_BACK').AsString);
         sPastFinishBeaten := Trim(dmDBF.dbfPast.FieldByName('FIN_BEATEN').AsString);

         sPastEquip := dmDBF.dbfPast.FieldByName('EQUIP').AsString;
         sPastWeight := dmDBF.dbfPast.FieldByName('WEIGHT').AsString;
         sPastTrackVariant := Trim(dmDBF.dbfPast.FieldByName('TRACK_VAR').AsString);

         sPastSRWinner := Trim(dmDBF.dbfPast.FieldByName('SR_WIN').AsString);
         sPastHorseTime := Trim(dmDBF.dbfPast.FieldByName('HORSE_TIME').AsString);
         sPastWinTime := Trim(dmDBF.dbfPast.FieldByName('WIN_TIME').AsString);

         iPastFldSize := Atoi(Trim(dmDBF.dbfPast.FieldByName('FLDSIZE').AsString));

         lJockeyRecNo := atol(dmDBF.dbfPast.FieldByName('JN').AsString);
         if (lJockeyRecNo > 0) then begin
            dmDBF.dbfJockey.PhysicalRecNo := lJockeyRecNo;
            sPastJockey := dmDBF.dbfJockey.FieldByName('JOCKNAME').AsString;
            sPastJockey := LeftStr(sPastJockey, 7);
         end else begin
            sPastJockey := '';
         end;

         sMonthDesc := GetMonthDesc(atoi(sM));
         sY := RightStr(sY, 2);

         sPastTrackLine := '';
         sPastTrackLine :=
            Format('%-2s', [sD]) +
            Format('%3s', [sMonthDesc]) +
            Format('%-2s', [sY]) + ' ' +
            Format('%2s', [sPastPostPos]) + ' ' +
            //            Format('%-2s', [sPastRaceNbr]) + ' ' +
         Format('%-3s', [sPastTrkCode]) + ' ' +
            Format('%1s', [sPastSurf]) + ' ' +
            Format('%2s', [sPastTrkCond]) + ' ' +
            Format('%7s', [sPastDistanceDesc]);

         sPastFractionsLine := '';
         sPastFractionsLine :=
            Format('%7s', [sPastTime1stCall]) + '|' +
            Format('%7s', [sPastTime2ndCall]) + '|' +
            Format('%7s', [sPastTimeStrCall]) + '|' +
            Format('%7s', [sPastTimeFinCall]);

         sPastClassLine := '';
         sPastClassLine :=
            Format('%4s', [sPastRaceType]) +
            Format('%7s', [sPastClmPrice]) +
            Format('%1s', [sPastClaimed]) +
            Format('%7s', [sPastPurse]) + ' ' +
            Format('%-10s', [sPastRaceConditions]) + ' ' +
            Format('%3s', [sPastSpeed]);

         sPastRunningLine := '';
         sPastRunningLine :=
            //            Format('%2s', [sPastPostPos]) + '|' +
//            Format('%2s', [sPastGateBreak]) + '|' +
         Format('%7s', [sPastLen1Back]) + '|' +
            Format('%7s', [sPastLen2Back]) + '|' +
            Format('%7s', [sPastStrLenBack]) + '|' +
            Format('%2s', [sPastDQIndicator]) +
            Format('%7s', [sPastFinishBeaten]);

         sPastOddsLine := '';
         sPastOddsLine :=
            Format('%-14s', [sPastJockey]) + ' ' +
            Format('%-6s', [sPastEquip]) + ' ' +
            Format('%-3s', [sPastWeight]) + ' ' +
            Format('%6s', [sPastOdds]) +
            Format('%1s', [sPastFavoriteIndicator]);

         sPastExtraLine := '';
         sPastExtraLine :=
            Format('%3s', [sPastClass]) + ' ' +
            Format('%7s', [sPastHorseTime]) + ' ' +
            Format('%7s', [sPastWinTime]) + ' ' +
            Format('%3s', [sPastSRWinner]);

         sPastRaceDesc := '';
         sPastRaceDesc :=
            Format('%-2s', [sD]) +
            Format('%3s', [sMonthDesc]) +
            Format('%-2s', [sY]) + ' ' +
            Format('%-2s', [sPastPostPos]) + ' ' +
            //            Format('%-2s', [sPastRaceNbr]) + ' ' +
         Format('%-3s', [sPastTrkCode]) + ' ' +
            Format('%-1s', [sPastSurf]) + ' ' +
            Format('%-2s', [sPastTrkCond]) + ' ' +
            Format('%-7s', [sPastDistanceDesc]) + ' ' +

         //         Format('%7s', [sPast1stCall]) + ' ' +
         //            Format('%7s', [sPast2ndCall]) + ' ' +
         //            Format('%7s', [sPast3rdCall]) + ' ' +
         //            Format('%7s', [sPastFinCall]) + ' ' +

         Format('%-4s', [sPastRaceType]) +
            Format('%-7s', [sPastClmPrice]) +
            Format('%-1s', [sPastClaimed]) +
            Format('%-7s', [sPastPurse]) + ' ' +
            Format('%-10s', [sPastRaceConditions]) + ' ' +

         //            Format('%-3s', [sPastSpeed]) + ' ' +
//         Format('%-2s', [sPastPostPos]) + ' ' +
//            Format('%2s', [sPastGateBreak]) + ' ' +
//            Format('%7s', [sPastLen1Back]) + ' ' +
//            Format('%7s', [sPastLen2Back]) + ' ' +
//            Format('%7s', [sPastStLenBack]) + ' ' +
//         Format('%-2s', [sPastDQIndicator]) +
//            Format('%-7s', [sPastFinishBeaten]) + ' ' +

         Format('%-7s', [sPastJockey]) + ' ' +
            //            Format('%-6s', [sPastEquip]) + ' ' +
         Format('%-3s', [sPastWeight]) + ' ' +
            Format('%-2s', [sPastDQIndicator]) +
            Format('%-7s', [sPastFinishBeaten]) + ' ' +
            Format('%-6s', [sPastOdds]) +
            Format('%-1s', [sPastFavoriteIndicator]);
         //            Format('%-1s', [sPastFavoriteIndicator]) + ' ' +
         //            Format('%-2s', [sPastTrackVariant]);

         sPastTop3Finishers := sPastTopFinish1 + ' ' + sPastTopFinish2 + ' ' + sPastTopFinish3;
         iHorseNbr := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
         if (iHorseNbr <> iSaveHorseNbr) then begin
            iNbrPP := 0;
            iSaveHorseNbr := iHorseNbr;
         end;

         iNbrPP := 0;
         // Try to get all - does not affect pace figs/pos
         if (iNbrPP <= MAX_PP) then begin
            Inc(iNbrPP);

            dm.tblPP.IndexName := '';
            dm.tblPP.SetKey();
            dm.tblPP.FieldByName('TrkCode').AsString := sFileTrkCode;
            dm.tblPP.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
            dm.tblPP.FieldByName('HorseNbr').AsInteger := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
            dm.tblPP.FieldByName('PPNbr').AsInteger := iNbrPP;

            if (dm.tblPP.GotoKey()) then begin
               dm.tblPP.Edit();
               dm.tblPP.FieldByName('Time1stCall').AsFloat := atof(UpperCase(sPastTime1stCall));
               dm.tblPP.FieldByName('Time2ndCall').AsFloat := atof(UpperCase(sPastTime2ndCall));
               dm.tblPP.FieldByName('TimeStrCall').AsFloat := atof(UpperCase(sPastTimeStrCall));
               dm.tblPP.FieldByName('TimeFinCall').AsFloat := atof(UpperCase(sPastTimeFinCall));

               dm.tblPP.FieldByName('Pos1stCall').AsFloat := atof(sPastPos1stCall);
               dm.tblPP.FieldByName('Pos2ndCall').AsFloat := atof(sPastPos2ndCall);
               dm.tblPP.FieldByName('PosStrCall').AsFloat := atof(sPastPosStrCall);
               dm.tblPP.FieldByName('PosFinCall').AsFloat := atof(sPastPosFinCall);

               dm.tblPP.FieldByName('BLFinCall').AsFloat := atof(sPastBLFinCall);
               dm.tblPP.FieldByName('BL1stCall').AsFloat := atof(sPastBL1stCall);
               dm.tblPP.FieldByName('BL2ndCall').AsFloat := atof(sPastBL2ndCall);
               dm.tblPP.FieldByName('BLStrCall').AsFloat := atof(sPastBLStrCall);

               dm.tblPP.FieldByName('RaceDesc').Value := UpperCase(sPastRaceDesc);
               dm.tblPP.Post();
            end else begin
               dm.tblPP.Append();

               dm.tblPP.FieldByName('TrkCode').AsString := sFileTrkCode;
               dm.tblPP.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
               dm.tblPP.FieldByName('HorseNbr').AsInteger := atoi(dmDBF.dbfPast.FieldByName('HN').AsString);
               dm.tblPP.FieldByName('PPNbr').AsInteger := iNbrPP;

               dm.tblPP.FieldByName('RaceDesc').Value := UpperCase(sPastRaceDesc);
               dm.tblPP.FieldByName('Top3Finishers').Value := UpperCase(sPastTop3Finishers);
               dm.tblPP.FieldByName('Comment2').Value := UpperCase(sPastComment2);

               dm.tblPP.FieldByName('OddsLine').Value := UpperCase(sPastOddsLine);
               dm.tblPP.FieldByName('TrackLine').Value := UpperCase(sPastTrackLine);
               dm.tblPP.FieldByName('ExtraLine').Value := UpperCase(sPastExtraLine);
               dm.tblPP.FieldByName('RunningLine').Value := UpperCase(sPastRunningLine);
               dm.tblPP.FieldByName('FractionsLine').Value := UpperCase(sPastFractionsLine);
               dm.tblPP.FieldByName('ClassLine').Value := UpperCase(sPastClassLine);

               dm.tblPP.FieldByName('Day').Value := UpperCase(sD);
               dm.tblPP.FieldByName('MonthDesc').Value := UpperCase(sMonthDesc);
               dm.tblPP.FieldByName('Year').Value := UpperCase(sY);


               wDay := atow(sD);
               wMonth := atow(sM);
               wYear := atow(sY) + 2000;
               dtPPRaceDate := EncodeDate(wYear, wMonth, wDay);

               dm.tblPP.FieldByName('DateOfRace').AsDateTime := dtPPRaceDate;
               dm.tblPP.FieldByName('DaysFromTodaysRace').AsFloat := DaysApart(dtPPRaceDate, dtAxcisRaceDate);

               dm.tblPP.FieldByName('RaceNbr').Value := UpperCase(sPastRaceNbr);
               dm.tblPP.FieldByName('TrkAbbr').Value := UpperCase(sPastTrkCode);

               dm.tblPP.FieldByName('Surf').Value := UpperCase(sPastSurf);
               dm.tblPP.FieldByName('TrkCond').Value := UpperCase(sPastTrkCond);
               dm.tblPP.FieldByName('DistanceDesc').Value := UpperCase(sPastDistanceDesc);

               dm.tblPP.FieldByName('Time1stCall').AsFloat := atof(UpperCase(sPastTime1stCall));
               dm.tblPP.FieldByName('Time2ndCall').AsFloat := atof(UpperCase(sPastTime2ndCall));
               dm.tblPP.FieldByName('TimeStrCall').AsFloat := atof(UpperCase(sPastTimeStrCall));
               dm.tblPP.FieldByName('TimeFinCall').AsFloat := atof(UpperCase(sPastTimeFinCall));

               dm.tblPP.FieldByName('Pos1stCall').AsFloat := atof(sPastPos1stCall);
               dm.tblPP.FieldByName('Pos2ndCall').AsFloat := atof(sPastPos2ndCall);
               dm.tblPP.FieldByName('PosStrCall').AsFloat := atof(sPastPosStrCall);
               dm.tblPP.FieldByName('PosFinCall').AsFloat := atof(sPastPosFinCall);

               dm.tblPP.FieldByName('BLFinCall').AsFloat := atof(sPastBLFinCall);
               dm.tblPP.FieldByName('BL1stCall').AsFloat := atof(sPastBL1stCall);
               dm.tblPP.FieldByName('BL2ndCall').AsFloat := atof(sPastBL2ndCall);
               dm.tblPP.FieldByName('BLStrCall').AsFloat := atof(sPastBLStrCall);

               dm.tblPP.FieldByName('RaceType').Value := UpperCase(sPastRaceType);

               dm.tblPP.FieldByName('ClmPrice').AsInteger := atoi(UpperCase(sPastClmPrice));
               dm.tblPP.FieldByName('Claimed').Value := UpperCase(sPastClaimed);
               dm.tblPP.FieldByName('Purse').AsInteger := atoi(UpperCase(sPastPurse));

               dm.tblPP.FieldByName('RaceConditions').Value := UpperCase(sPastRaceConditions);

               dm.tblPP.FieldByName('Speed').AsInteger := atoi(sPastSpeed);
               dm.tblPP.FieldByName('PostPos').AsInteger := atoi(UpperCase(sPastPostPos));

               dm.tblPP.FieldByName('GateBreak').Value := UpperCase(sPastGateBreak);
               dm.tblPP.FieldByName('Len1Back').Value := UpperCase(sPastLen1Back);
               dm.tblPP.FieldByName('Len2Back').Value := UpperCase(sPastLen2Back);
               dm.tblPP.FieldByName('StLenBack').Value := UpperCase(sPastStrLenBack);
               dm.tblPP.FieldByName('FinishBeaten').Value := UpperCase(sPastFinishBeaten);

               dm.tblPP.FieldByName('DQIndicator').Value := UpperCase(sPastDQIndicator);
               dm.tblPP.FieldByName('Jockey').Value := UpperCase(sPastJockey);
               dm.tblPP.FieldByName('Equip').Value := UpperCase(sPastEquip);

               dm.tblPP.FieldByName('Weight').AsInteger := atoi(UpperCase(sPastWeight));
               dm.tblPP.FieldByName('Odds').AsFloat := atof(UpperCase(sPastOdds));

               dm.tblPP.FieldByName('FavoriteIndicator').Value := UpperCase(sPastFavoriteIndicator);
               dm.tblPP.FieldByName('TrackVariant').AsInteger := atoi(UpperCase(sPastTrackVariant));

               dm.tblPP.FieldByName('Class').AsInteger := atoi(sPastClass);
               dm.tblPP.FieldByName('HorseTime').AsFloat := atof(UpperCase(sPastHorseTime));

               dm.tblPP.FieldByName('SRWinner').AsFloat := atof(UpperCase(sPastSRWinner));
               dm.tblPP.FieldByName('FldSize').AsInteger := iPastFldSize;

               dm.tblPP.FieldByName('EarlyPace').Value := atof(dmDBF.dbfPast.FieldByName('PACE_FIG1').AsString);
               dm.tblPP.FieldByName('MiddlePace').Value := atof(dmDBF.dbfPast.FieldByName('PACE_FIG2').AsString);
               dm.tblPP.FieldByName('LatePace').Value := atof(dmDBF.dbfPast.FieldByName('SPD_FIG').AsString);

               dm.tblPP.FieldByName('RaceDesc').Value := UpperCase(sPastRaceDesc);

               dm.tblPP.FieldByName('HHTrkCode').AsString := sFileTrkCode;
               dm.tblPP.FieldByName('HHRaceDate').AsDateTime := dtAxcisRaceDate;

               dm.tblPP.Post();
            end;

         end;

         dmDBF.dbfPast.Next();
      end;

      //*** Matchup
      //UpdateStatusBar('Loading ' + sMatchupFileName);

      //InitPrgBar(dmDBF.dbfMatchup.RecordCount);
      //
      //bFinished := False;
      //dmDBF.dbfMatchup.First();
      //while (not bFinished) do begin
      //   IncPrgBar();
      //
      //   if (dmDBF.dbfMatchup.Eof) then begin
      //      bFinished := True;
      //   end;
      //
      //   dtPastRaceDate := dmDBF.dbfMatchup.FieldByName('DATE').AsDateTime;
      //
      //   sY := FormatDateTime('yyyy', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
      //   sM := FormatDateTime('mm', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
      //   sD := FormatDateTime('dd', dmDBF.dbfPast.FieldByName('DATE').AsDateTime);
      //
      //   sPastTrkCode := CopyStr(dmDBF.dbfMatchup.FieldByName('TRACK_RACE').AsString, 1, 3);
      //   sPastRaceNbr := CopyStr(dmDBF.dbfMatchup.FieldByName('TRACK_RACE').AsString, 4, 3);
      //   sPastPostPos := dmDBF.dbfMatchup.FieldByName('POST_POS').AsString;
      //   sPastOdds := dmDBF.dbfMatchup.FieldByName('ODDS').AsString;
      //
      //   sPastFinishPos := CopyStr(dmDBF.dbfMatchup.FieldByName('FIN_BEATEN').AsString, 1, 2);
      //
      //   UpdateStatusBar('Importing Match Performances: ' + sPastTrkCode + ' ' + DateToStr(dtPastRaceDate) + ' ' + sPastRaceNbr + ' ' + sPastPostPos);
      //
      //   dm.tblHH.IndexName := '';
      //   dm.tblHH.SetKey();
      //   dm.tblHH.FieldByName('TrkCode').Value := sPastTrkCode;
      //   dm.tblHH.FieldByName('RaceNbr').AsInteger := atoi(sPastRaceNbr);
      //   dm.tblHH.FieldByName('RaceDate').Value := dtPastRaceDate;
      //   dm.tblHH.FieldByName('PostPos').AsInteger := atoi(sPastPostPos);
      //
      //   if (dm.tblHH.GotoKey()) then begin
      //      dm.tblHH.Edit();
      //      dm.tblHH.FieldByName('Odds').AsFloat := atof(sPastOdds);
      //      dm.tblHH.FieldByName('FinishPos').AsFloat := atof(sPastFinishPos);
      //      dm.tblHH.FieldByName('TrkCond').AsString := dmDBF.dbfMatchup.FieldByName('TRACK_COND').AsString;
      //      dm.tblHH.Post();
      //   end;
      //
      //   dmDBF.dbfMatchup.Next();
      //end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;

      ClearPrgStatusBars();
      dmDBF.dbfPast.Active := False;
      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfMatchup.Active := False;

      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblProcessed);

      CloseTable(dm.tblRatings);
      CloseTable(dm.tblPast);
      CloseTable(dm.tblPP);
   end;

   ClearPrgStatusBars();
   dmDBF.dbfPast.Active := False;
   dmDBF.dbfJockey.Active := False;
   dmDBF.dbfMatchup.Active := False;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit();
   end;
   CloseTable(dm.tblRH);
   CloseTable(dm.tblHH);
   CloseTable(dm.tblProcessed);

   CloseTable(dm.tblRatings);
   CloseTable(dm.tblPast);
   CloseTable(dm.tblPP);
   hLog.LogFileName := LOG_PATH + LOG_FILENAME;

end;

procedure TMainForm.ImportAxcisRaceEntry(sRaceFileName: string;
   sEntryFileName: string;
   sDamFileName: string;
   sSireFileName: string;
   sPastFileName: string;
   sMatchupFileName: string;
   sTrainerFileName: string;
   sJockeyFileName: string);
var
   lRecNo: Longint;
   bFinished: Boolean;
   sCurrTrkCode: string;
   sSendTrkCode: string;
   sSurfDisp: string;

begin

   hLog.LogFileName := LOG_PATH + AXCIS_LOG_FILENAME;
   hLog.AddToLog('ImportAxcisRaceEntry', msevOperation);
   try
      dmDBF.dbfRace.Active := False;
      dmDBF.dbfRace.TableName := sRaceFileName;
      dmDBF.dbfRace.FilePath := AXCIS_PATH;
      dmDBF.dbfRace.FilePathFull := AXCIS_PATH;
      dmDBF.dbfRace.Active := True;

      dmDBF.dbfEntry.Active := False;
      dmDBF.dbfEntry.TableName := sEntryFileName;
      dmDBF.dbfEntry.FilePath := AXCIS_PATH;
      dmDBF.dbfEntry.FilePathFull := AXCIS_PATH;
      dmDBF.dbfEntry.Active := True;

      dmDBF.dbfDam.Active := False;
      dmDBF.dbfDam.TableName := sDamFileName;
      dmDBF.dbfDam.FilePath := AXCIS_PATH;
      dmDBF.dbfDam.FilePathFull := AXCIS_PATH;
      dmDBF.dbfDam.Active := True;

      dmDBF.dbfSire.Active := False;
      dmDBF.dbfSire.TableName := sSireFileName;
      dmDBF.dbfSire.FilePath := AXCIS_PATH;
      dmDBF.dbfSire.FilePathFull := AXCIS_PATH;
      dmDBF.dbfSire.Active := True;

      dmDBF.dbfTrainer.Active := False;
      dmDBF.dbfTrainer.TableName := sTrainerFileName;
      dmDBF.dbfTrainer.FilePath := AXCIS_PATH;
      dmDBF.dbfTrainer.FilePathFull := AXCIS_PATH;
      dmDBF.dbfTrainer.Active := True;

      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfJockey.TableName := sJockeyFileName;
      dmDBF.dbfJockey.FilePath := AXCIS_PATH;
      dmDBF.dbfJockey.FilePathFull := AXCIS_PATH;
      dmDBF.dbfJockey.Active := True;

      dmDBF.dbfPast.Active := False;
      dmDBF.dbfPast.TableName := sPastFileName;
      dmDBF.dbfPast.FilePath := AXCIS_PATH;
      dmDBF.dbfPast.FilePathFull := AXCIS_PATH;
      dmDBF.dbfPast.Active := True;

      dmDBF.dbfMatchup.Active := False;
      dmDBF.dbfMatchup.TableName := sMatchupFileName;
      dmDBF.dbfMatchup.FilePath := AXCIS_PATH;
      dmDBF.dbfMatchup.FilePathFull := AXCIS_PATH;
      dmDBF.dbfMatchup.Active := True;

      OpenTable(dm.tblRH);
      OpenTable(dm.tblHH);
      OpenTable(dm.tblProcessed);
      OpenTable(dm.tblOwner);
      OpenTable(dm.tblBreeder);
      OpenTable(dm.tblSire);
      OpenTable(dm.tblDam);
      OpenTable(dm.tblTrainer);
      OpenTable(dm.tblJockey);

      OpenTable(dm.tblRatings);
      OpenTable(dm.tblPast);
      OpenTable(dm.tblPP);

      //      UpdateStatusBar('Loading ' + sRaceFileName);

      InitPrgBar(dmDBF.dbfRace.RecordCount);

      dmDBF.dbfRace.First;

      bFinished := False;
      while (not bFinished) do begin
         IncPrgBar();

         if (dmDBF.dbfRace.Eof) then begin
            bFinished := True;
         end;

         sCurrTrkCode := dmDBF.dbfRace.FieldByName('TRACK').AsString;
         sSendTrkCode := dmDBF.dbfRace.FieldByName('SEND_TRACK').AsString;

         sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
         if (SmartPos('q', sSurfDisp) > 0) or (SmartPos('o', sSurfDisp) > 0) then begin
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'q', '', True);
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'o', '', True);
            sSendTrkCode := FastReplace(sSendTrkCode, 'q', '', True);
            sSendTrkCode := FastReplace(sSendTrkCode, 'o', '', True);
         end;

         // Special For TDN, RD, BEU
         if sCurrTrkCode = 'TDN' then begin
            sFileTrkCode := 'TDN';
         end;
         if sCurrTrkCode = 'RD' then begin
            sFileTrkCode := 'RD';
         end;
         if sCurrTrkCode = 'BEU' then begin
            sFileTrkCode := 'BEU';
         end;

         if (sCurrTrkCode = sFileTrkCode) then begin
            staBar.SimpleText := 'Importing ' +
               dmDBF.dbfRace.FieldByName('TRACK').AsString + ' ' +
               DateToStr(dtAxcisRaceDate) + ' ' +
               dmDBF.dbfRace.FieldByName('RACE').AsString;

            lRecNo := atol(dmDBF.dbfRace.FieldByName('HORSE1').AsString);

            //*** Skip Quarter Horse Races
            sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
            dm.tblRH.IndexName := '';
            dm.tblRH.SetKey();
            dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

            dm.tblRH.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
            dm.tblRH.FieldByName('RaceDate').Value := dtAxcisRaceDate;

            if (dm.tblRH.GotoKey()) then begin
               dm.tblRH.Edit();
               FldRH();
               dm.tblRH.Post();
            end else begin
               dm.tblRH.Append();
               dm.tblRH.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
               dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
               dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

               dm.tblRH.FieldByName('RaceDate').Value := dtAxcisRaceDate;
               dm.tblRH.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
               FldRH();
               dm.tblRH.Post();
            end;

            dm.tblProcessed.IndexName := '';
            dm.tblProcessed.SetKey();
            dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

            dm.tblProcessed.FieldByName('RaceDate').Value := dtAxcisRaceDate;

            if (not dm.tblProcessed.GotoKey()) then begin
               dm.tblProcessed.Append();
               dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
               dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
               dm.tblProcessed.FieldByName('RaceDate').Value := dtAxcisRaceDate;
               dm.tblProcessed.Post();
            end;

            ImportAxcisEntry(lRecNo);

            dm.tblProcessed.IndexName := '';
            dm.tblProcessed.SetKey();
            dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
            dm.tblProcessed.FieldByName('RaceDate').Value := dtAxcisRaceDate;

            if (not dm.tblProcessed.GotoKey()) then begin
               dm.tblProcessed.Append();
               dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
               dm.tblProcessed.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
               dm.tblProcessed.FieldByName('RaceDate').Value := dtAxcisRaceDate;
               dm.tblProcessed.Post();
            end;
         end;
         dmDBF.dbfRace.Next();
      end;
   finally
      ClearPrgStatusBars();
      dmDBF.dbfRace.Active := False;
      dmDBF.dbfEntry.Active := False;
      dmDBF.dbfDam.Active := False;
      dmDBF.dbfSire.Active := False;
      dmDBF.dbfTrainer.Active := False;
      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfPast.Active := False;
      dmDBF.dbfMatchup.Active := False;
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblProcessed);
      CloseTable(dm.tblOwner);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblBreeder);
      CloseTable(dm.tblSire);
      CloseTable(dm.tblDam);
      CloseTable(dm.tblRatings);
      CloseTable(dm.tblPast);
      CloseTable(dm.tblPP);
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   end;
end;

procedure TMainForm.ImportAxcisEntry(lRecNo: Longint);
var
   bFinished: boolean;
   fStarts: double;
   fWinPct: double;
   fWins: double;
   sCurrRaceNbr: string;
   sRaceNbr: string;

begin
   try

      dmDBF.dbfEntry.PhysicalRecNo := lRecNo;

      sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      sCurrRaceNbr := dmDBF.dbfRace.FieldByName('RACE').AsString;
      bFinished := False;
      while (sRaceNbr = sCurrRaceNbr) and (not bFinished) do begin

         if (sRaceNbr <> sCurrRaceNbr) then begin
            exit;
         end;
         if (dmDBF.dbfEntry.Eof) then begin
            bFinished := True;
         end;

         dm.tblHH.IndexName := '';
         dm.tblHH.SetKey();
         dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
         dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

         dm.tblHH.FieldByName('RaceNbr').AsInteger := atoi(dmDBF.dbfRace.FieldByName('RACE').AsString);
         dm.tblHH.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
         dm.tblHH.FieldByName('PostPos').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('PP').AsString);

         try
            if (dm.tblHH.GotoKey()) then begin
               if dm.tblHH.RecordID > 0 then begin
                  dm.tblHH.Edit();
                  FldEntryAxcis();
                  dm.tblHH.Post();
               end;
               Application.ProcessMessages();
            end else begin
               dm.tblHH.Append();
               dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
               dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
               dm.tblHH.FieldByName('RaceNbr').AsInteger := atoi(dmDBF.dbfRace.FieldByName('RACE').AsString);
               dm.tblHH.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
               dm.tblHH.FieldByName('PostPos').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('PP').AsString);
               FldEntryAxcis();
               dm.tblHH.Post();
               Application.ProcessMessages();
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         dm.tblRatings.IndexName := '';
         dm.tblRatings.SetKey();
         dm.tblRatings.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
         dm.tblRatings.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

         dm.tblRatings.FieldByName('RaceNbr').AsInteger := atoi(dmDBF.dbfRace.FieldByName('RACE').AsString);
         dm.tblRatings.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
         dm.tblRatings.FieldByName('PostPos').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('PP').AsString);

         if (not dm.tblRatings.GotoKey()) then begin
            dm.tblRatings.Append();
            dm.tblRatings.FieldByName('TrkCode').AsString := dmDBF.dbfRace.FieldByName('TRACK').AsString;
            dm.tblRatings.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblRatings.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);
            dm.tblRatings.FieldByName('RaceNbr').AsInteger := atoi(dmDBF.dbfRace.FieldByName('RACE').AsString);
            dm.tblRatings.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
            dm.tblRatings.FieldByName('PostPos').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('PP').AsString);

            GetTrainerStats('AFTCLM');
            dm.tblRatings.FieldByName('TotalTrnAftClmStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnAftClmWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrnAftClmWins').AsInteger := iTrainerWins;

            if dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat >= MILE_FURLONGS then begin
               GetTrainerStats('TR_TF_R');
               dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsInteger := iTrainerStarts;
               dm.tblRatings.FieldByName('TotalTrnTurfWinPct').AsInteger := iTrainerWinPct;
               dm.tblRatings.FieldByName('TotalTrnTurfWins').AsInteger := iTrainerWins;

               GetJockeyStats('JC_TF_R');
               dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsInteger := iJockeyStarts;
               dm.tblRatings.FieldByName('TotalJkyTurfWinPct').AsInteger := iJockeyWinPct;
               dm.tblRatings.FieldByName('TotalJkyTurfWins').AsInteger := iJockeyWins;
            end else begin
               GetTrainerStats('TR_TF_S');
               dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsInteger := iTrainerStarts;
               dm.tblRatings.FieldByName('TotalTrnTurfWinPct').AsInteger := iTrainerWinPct;
               dm.tblRatings.FieldByName('TotalTrnTurfWins').AsInteger := iTrainerWins;

               GetJockeyStats('JC_TF_S');
               dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsInteger := iJockeyStarts;
               dm.tblRatings.FieldByName('TotalJkyTurfWinPct').AsInteger := iJockeyWinPct;
               dm.tblRatings.FieldByName('TotalJkyTurfWins').AsInteger := iJockeyWins;
            end;

            GetTrainerStats('TRFIR');
            dm.tblRatings.FieldByName('TotalTrn1stStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn1stWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn1stWins').AsInteger := iTrainerWins;

            GetTrainerStats('TL10');
            dm.tblRatings.FieldByName('TotalTrn10Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn10WinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn10Wins').AsInteger := iTrainerWins;

            GetTrainerStats('TL30');
            dm.tblRatings.FieldByName('TotalTrn30Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn30WinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn30Wins').AsInteger := iTrainerWins;

            GetTrainerStats('TF2DT');
            dm.tblRatings.FieldByName('TrnTurfToDirtWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnTurfToDirtStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('DT2TF');
            dm.tblRatings.FieldByName('TrnDirtToTurfWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnDirtToTurfStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('SP2RT');
            dm.tblRatings.FieldByName('TrnSprToRteWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnSprToRteStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('RT2SP');
            dm.tblRatings.FieldByName('TrnRteToSprWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnRteToSprStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('SHRACES');
            dm.tblRatings.FieldByName('TrnStkWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('ALWRACES');
            dm.tblRatings.FieldByName('TrnAlwWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('CSHRACES');
            dm.tblRatings.FieldByName('TrnClmWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('MCLRACES');
            dm.tblRatings.FieldByName('TrnMdnWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TPTF');
            dm.tblRatings.FieldByName('TotalTrnFavStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnFavWins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnFavWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TR2YO');
            dm.tblRatings.FieldByName('TotalTrn2yoStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn2yoWins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrn2yoWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TODDGT5');
            dm.tblRatings.FieldByName('TotalTrnOddsGt5Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsGt5Wins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnOddsGt5WinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TODDLE5');
            dm.tblRatings.FieldByName('TotalTrnOddsLe5Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsLe5Wins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnOddsLe5WinPct').AsInteger := iTrainerWinPct;

            fWins := dm.tblRatings.FieldByName('TotalTrnOddsLe5Wins').AsFloat + dm.tblRatings.FieldByName('TotalTrnOddsGt5Wins').AsFloat;
            fStarts := dm.tblRatings.FieldByName('TotalTrnOddsLe5Starts').AsFloat + dm.tblRatings.FieldByName('TotalTrnOddsGt5Starts').AsFloat;
            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
            end else begin
               fWinPct := 0;
            end;

            dm.tblRatings.FieldByName('TotalTrnOddsWinPct').AsFloat := Round(fWinPct * 100) / 100;
            dm.tblRatings.FieldByName('TotalTrnOddsStarts').AsFloat := fStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsWins').AsFloat := fWins;

            GetJockeyStats('JL10');
            dm.tblRatings.FieldByName('TotalJky10Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky10WinPct').AsInteger := iJockeyWinPct;
            dm.tblRatings.FieldByName('TotalJky10Wins').AsInteger := iJockeyWins;

            GetJockeyStats('JL30');
            dm.tblRatings.FieldByName('TotalJky30Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky30WinPct').AsInteger := iJockeyWinPct;
            dm.tblRatings.FieldByName('TotalJky30Wins').AsInteger := iJockeyWins;

            GetJockeyStats('JPTF');
            dm.tblRatings.FieldByName('TotalJkyFavStarts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyFavWins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyFavWinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JC2YO');
            dm.tblRatings.FieldByName('TotalJky2yoStarts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky2yoWins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJky2yoWinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JODDGT5');
            dm.tblRatings.FieldByName('TotalJkyOddsGt5Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsGt5Wins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyOddsGt5WinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JODDLE5');
            dm.tblRatings.FieldByName('TotalJkyOddsLe5Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsLe5Wins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyOddsLe5WinPct').AsInteger := iJockeyWinPct;

            fWins := dm.tblRatings.FieldByName('TotalJkyOddsLe5Wins').AsFloat + dm.tblRatings.FieldByName('TotalJkyOddsGt5Wins').AsFloat;
            fStarts := dm.tblRatings.FieldByName('TotalJkyOddsLe5Starts').AsFloat + dm.tblRatings.FieldByName('TotalJkyOddsGt5Starts').AsFloat;
            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
            end else begin
               fWinPct := 0;
            end;

            dm.tblRatings.FieldByName('TotalJkyOddsWinPct').AsFloat := Round(fWinPct * 100) / 100;
            dm.tblRatings.FieldByName('TotalJkyOddsStarts').AsFloat := fStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsWins').AsFloat := fWins;

            dm.tblRatings.FieldByName('TotalTrnJkyWinPct').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123P').AsString, 6, 3));
            dm.tblRatings.FieldByName('TotalTrnJkyStarts').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123P').AsString, 1, 4));
            dm.tblRatings.FieldByName('TotalTrnJkyWins').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123').AsString, 6, 3));

            dm.tblRatings.Post();
         end else begin
            dm.tblRatings.Edit();

            GetTrainerStats('AFTCLM');
            dm.tblRatings.FieldByName('TotalTrnAftClmStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnAftClmWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrnAftClmWins').AsInteger := iTrainerWins;

            if dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat >= MILE_FURLONGS then begin
               GetTrainerStats('TR_TF_R');
               dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsInteger := iTrainerStarts;
               dm.tblRatings.FieldByName('TotalTrnTurfWinPct').AsInteger := iTrainerWinPct;
               dm.tblRatings.FieldByName('TotalTrnTurfWins').AsInteger := iTrainerWins;

               GetJockeyStats('JC_TF_R');
               dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsInteger := iJockeyStarts;
               dm.tblRatings.FieldByName('TotalJkyTurfWinPct').AsInteger := iJockeyWinPct;
               dm.tblRatings.FieldByName('TotalJkyTurfWins').AsInteger := iJockeyWins;
            end else begin
               GetTrainerStats('TR_TF_S');
               dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsInteger := iTrainerStarts;
               dm.tblRatings.FieldByName('TotalTrnTurfWinPct').AsInteger := iTrainerWinPct;
               dm.tblRatings.FieldByName('TotalTrnTurfWins').AsInteger := iTrainerWins;

               GetJockeyStats('JC_TF_S');
               dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsInteger := iJockeyStarts;
               dm.tblRatings.FieldByName('TotalJkyTurfWinPct').AsInteger := iJockeyWinPct;
               dm.tblRatings.FieldByName('TotalJkyTurfWins').AsInteger := iJockeyWins;
            end;

            GetTrainerStats('TRFIR');
            dm.tblRatings.FieldByName('TotalTrn1stStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn1stWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn1stWins').AsInteger := iTrainerWins;

            GetTrainerStats('TL10');
            dm.tblRatings.FieldByName('TotalTrn10Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn10WinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn10Wins').AsInteger := iTrainerWins;

            GetTrainerStats('TL30');
            dm.tblRatings.FieldByName('TotalTrn30Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn30WinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TotalTrn30Wins').AsInteger := iTrainerWins;

            GetTrainerStats('TF2DT');
            dm.tblRatings.FieldByName('TrnTurfToDirtWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnTurfToDirtStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('DT2TF');
            dm.tblRatings.FieldByName('TrnDirtToTurfWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnDirtToTurfStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('SP2RT');
            dm.tblRatings.FieldByName('TrnSprToRteWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnSprToRteStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('RT2SP');
            dm.tblRatings.FieldByName('TrnRteToSprWinPct').AsInteger := iTrainerWinPct;
            dm.tblRatings.FieldByName('TrnRteToSprStarts').AsInteger := iTrainerStarts;

            GetTrainerStats('SHRACES');
            dm.tblRatings.FieldByName('TrnStkWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('ALWRACES');
            dm.tblRatings.FieldByName('TrnAlwWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('CSHRACES');
            dm.tblRatings.FieldByName('TrnClmWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('MCLRACES');
            dm.tblRatings.FieldByName('TrnMdnWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TPTF');
            dm.tblRatings.FieldByName('TotalTrnFavStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnFavWins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnFavWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TR2YO');
            dm.tblRatings.FieldByName('TotalTrn2yoStarts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrn2yoWins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrn2yoWinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TODDGT5');
            dm.tblRatings.FieldByName('TotalTrnOddsGt5Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsGt5Wins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnOddsGt5WinPct').AsInteger := iTrainerWinPct;

            GetTrainerStats('TODDLE5');
            dm.tblRatings.FieldByName('TotalTrnOddsLe5Starts').AsInteger := iTrainerStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsLe5Wins').AsInteger := iTrainerWins;
            dm.tblRatings.FieldByName('TotalTrnOddsLe5WinPct').AsInteger := iTrainerWinPct;

            fWins := dm.tblRatings.FieldByName('TotalTrnOddsLe5Wins').AsFloat + dm.tblRatings.FieldByName('TotalTrnOddsGt5Wins').AsFloat;
            fStarts := dm.tblRatings.FieldByName('TotalTrnOddsLe5Starts').AsFloat + dm.tblRatings.FieldByName('TotalTrnOddsGt5Starts').AsFloat;

            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
            end else begin
               fWinPct := 0;
            end;

            dm.tblRatings.FieldByName('TotalTrnOddsWinPct').AsFloat := Round(fWinPct * 100) / 100;
            dm.tblRatings.FieldByName('TotalTrnOddsStarts').AsFloat := fStarts;
            dm.tblRatings.FieldByName('TotalTrnOddsWins').AsFloat := fWins;

            GetJockeyStats('JL10');
            dm.tblRatings.FieldByName('TotalJky10Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky10WinPct').AsInteger := iJockeyWinPct;
            dm.tblRatings.FieldByName('TotalJky10Wins').AsInteger := iJockeyWins;

            GetJockeyStats('JL30');
            dm.tblRatings.FieldByName('TotalJky30Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky30WinPct').AsInteger := iJockeyWinPct;
            dm.tblRatings.FieldByName('TotalJky30Wins').AsInteger := iJockeyWins;

            GetJockeyStats('JPTF');
            dm.tblRatings.FieldByName('TotalJkyFavStarts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyFavWins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyFavWinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JC2YO');
            dm.tblRatings.FieldByName('TotalJky2yoStarts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJky2yoWins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJky2yoWinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JODDGT5');
            dm.tblRatings.FieldByName('TotalJkyOddsGt5Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsGt5Wins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyOddsGt5WinPct').AsInteger := iJockeyWinPct;

            GetJockeyStats('JODDLE5');
            dm.tblRatings.FieldByName('TotalJkyOddsLe5Starts').AsInteger := iJockeyStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsLe5Wins').AsInteger := iJockeyWins;
            dm.tblRatings.FieldByName('TotalJkyOddsLe5WinPct').AsInteger := iJockeyWinPct;

            fWins := dm.tblRatings.FieldByName('TotalJkyOddsLe5Wins').AsFloat + dm.tblRatings.FieldByName('TotalJkyOddsGt5Wins').AsFloat;
            fStarts := dm.tblRatings.FieldByName('TotalJkyOddsLe5Starts').AsFloat + dm.tblRatings.FieldByName('TotalJkyOddsGt5Starts').AsFloat;

            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
            end else begin
               fWinPct := 0;
            end;

            dm.tblRatings.FieldByName('TotalJkyOddsWinPct').AsFloat := Round(fWinPct * 100) / 100;
            dm.tblRatings.FieldByName('TotalJkyOddsStarts').AsFloat := fStarts;
            dm.tblRatings.FieldByName('TotalJkyOddsWins').AsFloat := fWins;

            dm.tblRatings.FieldByName('TotalTrnJkyWinPct').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123P').AsString, 6, 3));
            dm.tblRatings.FieldByName('TotalTrnJkyStarts').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123P').AsString, 1, 4));
            dm.tblRatings.FieldByName('TotalTrnJkyWins').AsFloat := atof(CopyStr(dmDBF.dbfEntry.FieldByName('JTS123').AsString, 6, 3));

            dm.tblRatings.Post();

         end;

         dmDBF.dbfEntry.Next();
         sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TMainForm.FldRH();
var
   iDistanceInYards: integer;
   fDistanceInFurlongs: double;
   iDistanceInFeet: integer;
   iRaceNbr: integer;
   sPostTime: string;
   dtLocalTimeOfRace: TDateTime;
   sHour: string;
   sMinute: string;
   sAMPM: string;
   iEndPos: integer;
   wHour: word;
   wMinute: word;

begin

   iRaceNbr := dm.tblRH.FieldByName('RaceNbr').AsInteger;
   sPostTime := dmDBF.dbfRace.FieldByName('POST_TIME').AsString;
   iEndPos := SmartPos(':', sPostTime);
   if iEndPos = 2 then begin
      sHour := CopyStr(sPostTime, 1, 1);
      sMinute := CopyStr(sPostTime, 3, 2);
      sAMPM := CopyStr(sPostTime, 5, 2);
   end;
   if iEndPos = 3 then begin
      sHour := CopyStr(sPostTime, 1, 2);
      sMinute := CopyStr(sPostTime, 4, 2);
      sAMPM := CopyStr(sPostTime, 6, 2);
   end;

   if Trim(sHour) <> '' then begin
      wHour := atow(sHour);
      wMinute := atow(sMinute);
      if sAMPM = 'AM' then begin
         if wHour = 12 then begin
            wHour := 0;
         end;
      end;
      if sAMPM = 'PM' then begin
         if wHour <> 12 then begin
            wHour := wHour + 12;
            if (wHour >= 24) then begin
               wHour := wHour - 24;
            end;
         end;
      end;
      dtLocalTimeOfRace := EncodeTime(wHour, wMinute, 0, 0);
      gdtLocalTimeOfRace := dtLocalTimeOfRace;
   end else begin
      if (iRaceNbr = 1) then begin
         dtLocalTimeOfRace := EncodeTime(11, 0, 0, 0);
         gdtLocalTimeOfRace := dtLocalTimeOfRace;
      end
      else begin
         dtLocalTimeOfRace := gdtLocalTimeOfRace + 25;
         gdtLocalTimeOfRace := dtLocalTimeOfRace;
      end;
   end;

   fDistanceInFurlongs := atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString);

   //   if (SmartPos('q', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) or
   //      (SmartPos('o', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) then begin
   //      if fDistanceInFurlongs > 3 then begin
   //         iDistanceInYards := Trunc(fDistanceInFurlongs) * 100;
   //         iDistanceInFeet := (iDistanceInYards * 3);
   //      end else begin
   //         iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
   //         iDistanceInYards := (iDistanceInFeet div 3);
   //      end;
   //   end   else begin
   //      iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
   //      iDistanceInYards := (iDistanceInFeet div 3);
   //   end;

   with dm.tblRH do begin
      FieldByName('Surface').AsString := GetAxcisSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);
      FieldByName('OrigSurface').AsString := GetAxcisSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);
      FieldByName('DistanceInFeet').AsInteger := iDistanceInFeet;

      FieldByName('DistanceInYards').AsInteger := iDistanceInYards;
      FieldByName('DistanceInFurlongs').AsFloat := fDistanceInFurlongs;
      FieldByName('OrigDistanceDesc').Value := GetYardDistanceDesc(iDistanceInYards);

      FieldByName('RaceType').AsString := GetRaceClass(dmDBF.dbfRace.FieldByName('STKORCLM').AsString);
      FieldByName('RaceCondition1').Value := dmDBF.dbfRace.FieldByName('RTEXT1').AsString;
      FieldByName('RaceCondition2').Value := dmDBF.dbfRace.FieldByName('RTEXT2').AsString;
      FieldByName('RaceCondition3').Value := dmDBF.dbfRace.FieldByName('RTEXT3').AsString;
      FieldByName('RaceCondition4').Value := dmDBF.dbfRace.FieldByName('RTEXT4').AsString;
      FieldByName('RaceCondition5').Value := dmDBF.dbfRace.FieldByName('RTEXT5').AsString;
      FieldByName('RaceCondition6').Value := dmDBF.dbfRace.FieldByName('RTEXT6').AsString;
      FieldByName('RaceCondition7').Value := dmDBF.dbfRace.FieldByName('RTEXT7').AsString;
      FieldByName('RaceCondition8').Value := dmDBF.dbfRace.FieldByName('RTEXT8').AsString;
      FieldByName('RaceCondition9').Value := dmDBF.dbfRace.FieldByName('RTEXT9').AsString;
      FieldByName('RaceCondition10').Value := dmDBF.dbfRace.FieldByName('RTEXT10').AsString;

      FieldByName('BetLine').Value := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
      FieldByName('Purse').AsFloat := atof(dmDBF.dbfRace.FieldByName('PURSE').AsString);
      FieldByName('ClaimingPrice').AsFloat := atof(dmDBF.dbfRace.FieldByName('CLAIMAMT').AsString);

      FieldByName('LocalTimeOfRace').Value := dtLocalTimeOfRace;
   end;

end;

procedure TMainForm.FldEntryAxcis();
var
   lJockeyRecNo: Longint;
   lTrainerRecNo: Longint;
   lSireRecNo: Longint;
   lDamRecNo: Longint;

   iEndPos: Integer;
   iLen: Integer;

   iBotOdds: Integer;
   iTopOdds: Integer;

   sBotOdds: string;
   sTopOdds: string;

   sTmp: string;

   sAxcisEarlyPacePos: string;
   sAxcisMiddlePacePos: string;
   sAxcisLatePacePos: string;

   sAvgPurseValue: string;
   sPower: string;

   sSpeed1Back: string;
   sSpeed2Back: string;
   sSpeed3Back: string;
   sSpeed4Back: string;
   sSpeed5Back: string;

   iSpeed1Back: Integer;
   iSpeed2Back: Integer;
   iSpeed3Back: Integer;
   iSpeed4Back: Integer;
   iSpeed5Back: Integer;

   fBackSpeed: double;

   fPower: double;

   fAxcisEarlyPacePos: double;
   fAxcisMiddlePacePos: double;
   fAxcisLatePacePos: double;

   fAxcisEarlyMiddleMove: double;
   fAxcisMiddleLateMove: double;
   fAxcisSort: double;

   sFirstChar: string;

   sStarts: string;
   iStarts: integer;

   fMLOddsKey: double;
   sOwner: string;
   sBreeder: string;

   iDistanceKey: integer;

   iDistanceInFeet: integer;
   iDistanceInYards: integer;
   fDistanceInFurlongs: double;

   bRouteRace: boolean;

begin

   dm.tblHH.FieldByName('ProgramNbr').Value := dmDBF.dbfEntry.FieldByName('PROGRAM').AsString;
   dm.tblHH.FieldByName('ProgNbrSort').Value := GetProgramNbrSort(dmDBF.dbfEntry.FieldByName('PROGRAM').AsString);

   sTmp := dmDBF.dbfEntry.FieldByName('CLAIMLAST').AsString;
   if (sTmp = '*') then begin
      dm.tblHH.FieldByName('IsClaimed1Back').AsBoolean := True;
   end else begin
      dm.tblHH.FieldByName('IsClaimed1Back').AsBoolean := False;
   end;

   sTmp := dmDBF.dbfEntry.FieldByName('CLAIM2BACK').AsString;
   if (sTmp = '*') then begin
      dm.tblHH.FieldByName('IsClaimed2Back').AsBoolean := True;
   end else begin
      dm.tblHH.FieldByName('IsClaimed2Back').AsBoolean := False;
   end;

   sTmp := dmDBF.dbfEntry.FieldByName('AXCIS_ODDS').AsString;
   if SmartPos('/', sTmp) > 0 then begin
      iEndPos := SmartPos('/', sTmp);
      iLen := Length(sTmp);
      sTopOdds := CopyStr(sTmp, 1, iEndPos - 1);
      iTopOdds := atoi(sTopOdds);
      if (SmartPos('B', sTmp) > 0) or
         (SmartPos('L', sTmp) > 0) or
         (SmartPos('+', sTmp) > 0) or
         (SmartPos('-', sTmp) > 0) then begin
         sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen - iEndPos - 1));
         iBotOdds := atoi(sBotOdds);
      end else begin
         sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen - iEndPos));
         iBotOdds := atoi(sBotOdds);
      end;

      if iBotOdds > 0 then begin
         dm.tblHH.FieldByName('MorningLineTo1').AsFloat := iTopOdds / iBotOdds
      end else begin
         dm.tblHH.FieldByName('MorningLineTo1').AsFloat := 0;
      end;

      dm.tblHH.FieldByName('MorningLineDesc').Value := dmDBF.dbfEntry.FieldByName('AXCIS_ODDS').AsString;

      sTmp := dmDBF.dbfEntry.FieldByName('DAYS').AsString;
      dm.tblHH.FieldByName('DaysLast').AsInteger := atoi(sTmp);
      if dm.tblHH.FieldByName('DaysLast').AsInteger > 0 then begin
         dm.tblHH.FieldByName('DaysLast').AsInteger := dm.tblHH.FieldByName('DaysLast').AsInteger + 1;
      end;

      sTmp := dmDBF.dbfEntry.FieldByName('HN').AsString;
      dm.tblHH.FieldByName('HorseNbr').AsInteger := atoi(sTmp);

      sTmp := dmDBF.dbfEntry.FieldByName('YOB').AsString;
      dm.tblHH.FieldByName('Age').AsInteger := atoi(sTmp);
      dm.tblHH.FieldByName('Sex').Value := dmDBF.dbfEntry.FieldByName('Sex').AsString;

      sPower := dmDBF.dbfEntry.FieldByName('POWER').AsString;
      dm.tblHH.FieldByName('Power').AsFloat := atof(sPower);
      //      dm.tblHH.FieldByName('TodaysClass').Value := atoi(dmDBF.dbfEntry.FieldByName('TODAYS_CLS').AsString);

      //      sSpeed1Back := CopyStr(dmDBF.dbfEntry.FieldByName('R1').AsString, 13, 3);
      //      sSpeed2Back := CopyStr(dmDBF.dbfEntry.FieldByName('R2').AsString, 13, 3);
      //      sSpeed3Back := CopyStr(dmDBF.dbfEntry.FieldByName('R3').AsString, 13, 3);
      //      sSpeed4Back := CopyStr(dmDBF.dbfEntry.FieldByName('R4').AsString, 13, 3);
      //      sSpeed5Back := CopyStr(dmDBF.dbfEntry.FieldByName('R5').AsString, 13, 3);

      //      iSpeed1Back := atoi(sSpeed1Back);
      //      iSpeed2Back := atoi(sSpeed2Back);
      //      iSpeed3Back := atoi(sSpeed3Back);
      //      iSpeed4Back := atoi(sSpeed4Back);
      //      iSpeed5Back := atoi(sSpeed4Back);

      //      iBackSpeed := iSpeed1Back;
      //      if (iSpeed2Back > iBackSpeed) then begin
      //         iBackSpeed := iSpeed2Back;
      //      end;
      //      if (iSpeed3Back > iBackSpeed) then begin
      //         iBackSpeed := iSpeed3Back;
      //      end;
      //      if (iSpeed4Back > iBackSpeed) then begin
      //         iBackSpeed := iSpeed4Back;
      //      end;
      //      if (iSpeed5Back > iBackSpeed) then begin
      //         iBackSpeed := iSpeed5Back;
      //      end;


            //      AVG_SPD_SD
            //      AVG_CL_SD
            //      HI_SPD_SD

      dm.tblHH.FieldByName('AvgClass').AsFloat := atoi(dmDBF.dbfEntry.FieldByName('AVE_CL_SD').AsString);
      dm.tblHH.FieldByName('AvgSpeed').AsFloat := atoi(dmDBF.dbfEntry.FieldByName('AVG_SPD_SD').AsString);
      dm.tblHH.FieldByName('LastSpeed').AsInteger := iSpeed1Back;

      //      if (atoi(dmDBF.dbfEntry.FieldByName('HI_SPD_SD').AsString) = 0) then begin
      //         dm.tblHH.FieldByName('BackSpeed').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('HI_SPD_SD').AsString);
      //      end else begin
      //         dm.tblHH.FieldByName('BackSpeed').AsInteger := iBackSpeed;
      //      end;

      //      dm.tblHH.FieldByName('Speed1Back').AsInteger := iSpeed1Back;
      //      dm.tblHH.FieldByName('Speed2Back').AsInteger := iSpeed2Back;
      //      dm.tblHH.FieldByName('Speed3Back').AsInteger := iSpeed3Back;
      //      dm.tblHH.FieldByName('Speed4Back').AsInteger := iSpeed4Back;
      //      dm.tblHH.FieldByName('Speed5Back').AsInteger := iSpeed5Back;

            //Todays Surface/Distance
      sTmp := dmDBF.dbfEntry.FieldByName('PACER').AsString;
      //Check for Route or Sprint
      if (Trim(sTmp) = '') then begin
         if dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
            sTmp := dmDBF.dbfEntry.FieldByName('PACER_SPR').AsString;
         end else begin
            sTmp := dmDBF.dbfEntry.FieldByName('PACER_RTE').AsString;
         end;
      end;
      //If Nothing use what we have
      if (Trim(sTmp) = '') then begin
         sTmp := dmDBF.dbfEntry.FieldByName('PACER_ALL').AsString;
      end;

      iLen := Length(sTmp);
      if (iLen >= 14) then begin
         sAxcisEarlyPacePos := CopyStr(sTmp, 1, 4);
         sAxcisMiddlePacePos := CopyStr(sTmp, 6, 4);
         sAxcisLatePacePos := CopyStr(sTmp, 11, 4);
      end else begin
         sAxcisEarlyPacePos := '';
         sAxcisMiddlePacePos := '';
         sAxcisLatePacePos := '';
      end;

      fAxcisEarlyPacePos := atof(sAxcisEarlyPacePos);
      fAxcisMiddlePacePos := atof(sAxcisMiddlePacePos);
      fAxcisLatePacePos := atof(sAxcisLatePacePos);

      if fAxcisEarlyPacePos = 0 then begin
         fAxcisEarlyPacePos := 9999;
      end;
      if fAxcisMiddlePacePos = 0 then begin
         fAxcisMiddlePacePos := 9999;
      end;
      if fAxcisLatePacePos = 0 then begin
         fAxcisLatePacePos := 9999;
      end;

      dm.tblHH.FieldByName('EarlyPacePos').AsFloat := fAxcisEarlyPacePos;
      dm.tblHH.FieldByName('MiddlePacePos').AsFloat := fAxcisMiddlePacePos;
      dm.tblHH.FieldByName('LatePacePos').AsFloat := fAxcisLatePacePos;

      //Todays Surface/Distance
      sTmp := dmDBF.dbfEntry.FieldByName('S_PACER').AsString;
      //Check for Route or Sprint
      if (Trim(sTmp) = '') then begin
         if dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
            sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_SPR').AsString;
         end else begin
            sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_RTE').AsString;
         end;
      end;
      //If Nothing use what we have
      if (Trim(sTmp) = '') then begin
         sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_ALL').AsString;
      end;
      iLen := Length(sTmp);
      if (iLen >= 17) then begin
         dm.tblHH.FieldByName('EarlyPace').AsFloat := atof(CopyStr(sTmp, 1, 5));
         dm.tblHH.FieldByName('MiddlePace').AsFloat := atof(CopyStr(sTmp, 7, 5));
         dm.tblHH.FieldByName('LatePace').AsFloat := atof(CopyStr(sTmp, 13, 5));
      end else begin
         dm.tblHH.FieldByName('EarlyPace').AsFloat := 0;
         dm.tblHH.FieldByName('MiddlePace').AsFloat := 0;
         dm.tblHH.FieldByName('LatePace').AsFloat := 0;
      end;

      //dm.tblHH.FieldByName('PDQPaceRating').AsFloat :=
      //   Int(dm.tblHH.FieldByName('EarlyPace').AsFloat) +
      //   Int(dm.tblHH.FieldByName('MiddlePace').AsFloat) +
      //   Int(dm.tblHH.FieldByName('LatePace').AsFloat);

      //if (dm.tblHH.FieldByName('EarlyPacePos').AsFloat > 9000) or (dm.tblHH.FieldByName('MiddlePacePos').AsFloat > 9000) then begin
      //   dm.tblHH.FieldByName('SpeedPoints').AsFloat := 0;
      //end else begin
      //   dm.tblHH.FieldByName('SpeedPoints').AsFloat := 100 - (dm.tblHH.FieldByName('EarlyPacePos').AsFloat +
      //      dm.tblHH.FieldByName('MiddlePacePos').AsFloat);
      //end;

      dm.tblHH.FieldByName('HorseName').Value := dmDBF.dbfEntry.FieldByName('HORSE_NAME').AsString;

      dm.tblHH.FieldByName('FinishPos').AsInteger := 0;
      dm.tblHH.FieldByName('Odds').AsFloat := 0;

      dm.tblHH.FieldByName('StartsWorks21').Value := atoi(dmDBF.dbfEntry.FieldByName('ST21').AsString);

      sTmp := dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString;
      if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 3 then begin
         dm.tblHH.FieldByName('DaysLastWork').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 1, 3));
         if dm.tblHH.FieldByName('DaysLastWork').AsInteger > 0 then begin
            dm.tblHH.FieldByName('DaysLastWork').AsInteger := dm.tblHH.FieldByName('DaysLastWork').AsInteger + 1;
         end;
      end;

      if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 8 then begin
         dm.tblHH.FieldByName('DaysLastWork2').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 5, 3));
         if dm.tblHH.FieldByName('DaysLastWork2').AsInteger > 0 then begin
            dm.tblHH.FieldByName('DaysLastWork2').AsInteger := dm.tblHH.FieldByName('DaysLastWork2').AsInteger + 1;
         end;
      end;

      if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) >= 11 then begin
         dm.tblHH.FieldByName('DaysLastWork3').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 9, 3));
         if dm.tblHH.FieldByName('DaysLastWork3').AsInteger > 0 then begin
            dm.tblHH.FieldByName('DaysLastWork3').AsInteger := dm.tblHH.FieldByName('DaysLastWork3').AsInteger + 1;
         end;
      end;

      dm.tblHH.FieldByName('NbrWorksLast').AsInteger := 0;
      if (dm.tblHH.FieldByName('DaysLastWork').AsInteger <
         dm.tblHH.FieldByName('DaysLast').AsInteger) then begin
         dm.tblHH.FieldByName('NbrWorksLast').AsInteger := 1;
      end;

      if (dm.tblHH.FieldByName('DaysLastWork2').AsInteger <
         dm.tblHH.FieldByName('DaysLast').AsInteger) then begin
         dm.tblHH.FieldByName('NbrWorksLast').AsInteger := 2;
      end;

      if (dm.tblHH.FieldByName('DaysLastWork3').AsInteger <
         dm.tblHH.FieldByName('DaysLast').AsInteger) then begin
         dm.tblHH.FieldByName('NbrWorksLast').AsInteger := 3;
      end;


      lTrainerRecNo := atol(dmDBF.dbfEntry.FieldByName('TN').AsString);
      if (lTrainerRecNo > 0) then begin
         dmDBF.dbfTrainer.PhysicalRecNo := lTrainerRecNo;
         dm.tblHH.FieldByName('TrnEquibaseKey').Value := dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
      end;

      lJockeyRecNo := atol(dmDBF.dbfEntry.FieldByName('JN').AsString);
      if (lJockeyRecNo > 0) then begin
         dmDBF.dbfJockey.PhysicalRecNo := lJockeyRecNo;
         dm.tblHH.FieldByName('JkyEquibaseKey').Value := dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
      end;

      sSireName := '';
      sDamName := '';
      sDamSireName := '';

      lSireRecNo := atol(dmDBF.dbfEntry.FieldByName('SN').AsString);
      if (lSireRecNo > 0) then begin
         dmDBF.dbfSire.PhysicalRecNo := lSireRecNo;
         sTmp := dmDBF.dbfSire.FieldByName('SIRENAME').AsString;
         sTmp := UpperCase(sTmp);
         if SmartPos('(', sTmp) > 0 then begin
            iEndPos := SmartPos('(', sTmp);
            sSireName := Trim(CopyStr(sTmp, 1, iEndPos - 1));
            sSireName := FastReplace(sSireName, '.', '', True);
         end else begin
            sSireName := Trim(sTmp);
            sSireName := FastReplace(sSireName, '.', '', True);
         end;
      end;

      lDamRecNo := atol(dmDBF.dbfEntry.FieldByName('DN').AsString);
      if (lDamRecNo > 0) then begin
         dmDBF.dbfDam.PhysicalRecNo := lDamRecNo;

         //***
         sTmp := dmDBF.dbfDam.FieldByName('DAMNAME').AsString;
         sTmp := UpperCase(sTmp);
         sFirstChar := CopyStr(sTmp, 1, 1);
         if (sFirstChar = '*') then begin
            iEndPos := Length(sTmp);
            sTmp := CopyStr(sTmp, 2, iEndPos - 1);
         end;
         if (SmartPos('(', sTmp) > 0) then begin
            iEndPos := SmartPos('(', sTmp);
            sDamName := CopyStr(sTmp, 1, iEndPos - 1);
            sDamName := FastReplace(sDamName, '.', '', True);
         end else begin
            sDamName := Trim(sTmp);
            sDamName := FastReplace(sDamName, '.', '', True);
         end;

         //***
         sTmp := dmDBF.dbfDam.FieldByName('DAMSIRE').AsString;
         sTmp := UpperCase(sTmp);
         sFirstChar := CopyStr(sTmp, 1, 1);
         if (sFirstChar = '*') then begin
            iEndPos := Length(sTmp);
            sTmp := CopyStr(sTmp, 2, iEndPos - 1);
         end;
         if (SmartPos('(', sTmp) > 0) then begin
            iEndPos := SmartPos('(', sTmp);
            sDamSireName := CopyStr(sTmp, 1, iEndPos - 1);
            sDamSireName := FastReplace(sDamSireName, '.', '', True);
         end else begin
            sDamSireName := Trim(sTmp);
            sDamSireName := FastReplace(sDamSireName, '.', '', True);
         end;
      end;

      if (Trim(sDamName) <> '') then begin
         AddDam();
      end;
      if (Trim(sSireName) <> '') then begin
         AddSire();
      end;

      dm.tblHH.FieldByName('SireName').AsString := Trim(sSireName);
      dm.tblHH.FieldByName('DamSireName').AsString := Trim(sDamSireName);
      dm.tblHH.FieldByName('DamName').AsString := Trim(sDamName);

      //************************************************
      sTmp := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('OWNER_NAME').AsString));
      dm.tblHH.FieldByName('Owner').AsString := sTmp;
      dm.tblOwner.IndexName := '';
      dm.tblOwner.SetKey();
      dm.tblOwner.FieldByName('Owner').AsString := sTmp;

      if not dm.tblOwner.GotoKey() then begin
         dm.tblOwner.Append();
         dm.tblOwner.FieldByName('Owner').AsString := sTmp;
         dm.tblOwner.Post();
      end;

      //************************************************
      sTmp := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('BREEDER').AsString));
      dm.tblHH.FieldByName('Breeder').AsString := sTmp;

      dm.tblBreeder.IndexName := '';
      dm.tblBreeder.SetKey();
      dm.tblBreeder.FieldByName('Breeder').AsString := sTmp;
      if not dm.tblBreeder.GotoKey() then begin
         dm.tblBreeder.Append();
         dm.tblBreeder.FieldByName('Breeder').AsString := sTmp;
         dm.tblBreeder.Post();
      end;

      // Lifetime Record
      sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 1, 3);
      iStarts := atoi(sStarts);
      if iStarts = 0 then begin
         dm.tblHH.FieldByName('IsDebut').AsBoolean := True;
      end else begin
         dm.tblHH.FieldByName('IsDebut').AsBoolean := False;
      end;

      if iStarts = 1 then begin
         dm.tblHH.FieldByName('IsDebutTwo').AsBoolean := True;
      end else begin
         dm.tblHH.FieldByName('IsDebutTwo').AsBoolean := False;
      end;

      // Lifetime Turf Distance
      sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 1, 3);
      iStarts := atoi(sStarts);
      if iStarts = 0 then begin
         dm.tblHH.FieldByName('IsTurfDebut').AsBoolean := True;
      end else begin
         dm.tblHH.FieldByName('IsTurfDebut').AsBoolean := False;
      end;

      //if iStarts = 1 then begin
      //   dm.tblHH.FieldByName('IsTurfDebutTwo').AsBoolean := True;
      //end else begin
      //   dm.tblHH.FieldByName('IsTurfDebutTwo').AsBoolean := False;
      //end;

      fDistanceInFurlongs := atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString);
      //      if (SmartPos('q', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) or
      //         (SmartPos('o', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0)         then begin
      //         if fDistanceInFurlongs > 3 then begin
      //            iDistanceInYards := Trunc(fDistanceInFurlongs) * 100;
      //            iDistanceInFeet := (iDistanceInYards * 3);
      //         end else begin
      //            iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
      //            iDistanceInYards := (iDistanceInFeet div 3);
      //         end;
      //      end else begin
      //         iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
      //         iDistanceInYards := (iDistanceInFeet div 3);
      //      end;

      //      dm.tblHH.FieldByName('DistanceInFeet').AsInteger := iDistanceInFeet;
      //      dm.tblHH.FieldByName('DistanceInYards').AsInteger := iDistanceInYards;
      dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat := fDistanceInFurlongs;

      dm.tblHH.FieldByName('RaceType').AsString := GetRaceClass(dmDBF.dbfRace.FieldByName('STKORCLM').AsString);

      if dm.tblHH.FieldByName('DistanceInFurlongs').AsInteger < MILE_FURLONGS then begin
         bRouteRace := False;
      end else begin
         bRouteRace := True;
      end;
   end;


end;

procedure TMainForm.btnStartOfDayClick(Sender: TObject);
begin

   hLog.AddToLog('Start Of Day : ' + DateToStr(edtOverrideDate.Date), msevOperation);


   btnStartOfDay.Enabled := False;
   UpdateStatusBar('Emptying Ranking File');

   CloseTable(dm.tblRatings);
   CloseTable(dm.tblPast);
   CloseTable(dm.tblPP);
   CloseTable(dm.tblATrainerList);

   try

      try
         dm.tblRatings.EmptyTable();
         dm.tblPast.EmptyTable();
         dm.tblPP.EmptyTable();
         dm.tblATrainerList.EmptyTable();

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      // Empty Out Files
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);

      dm.tblRaces.EmptyTable();
      dm.tblEntries.EmptyTable();

      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
   finally
      ClearPrgStatusBars();
      CloseTable(dm.tblRatings);
      CloseTable(dm.tblPast);
      CloseTable(dm.tblPP);
      btnStartOfDay.Enabled := True;
   end;

end;

procedure TMainForm.btnDownloadAxcisClick(Sender: TObject);
begin
   exit;
   TimerOn(False);
   hLog.LogFileName := LOG_PATH + AXCIS_LOG_FILENAME;
   idHTTP.ProxyParams.ProxyServer := '';
   idHTTP.ProxyParams.ProxyPort := 80;
   btnDownloadAxcis.Enabled := False;
   DownloadAxcis(Sender);
   btnDownloadAxcis.Enabled := True;
   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   TimerOn(True);
end;

procedure TMainForm.DownloadAxcis(Sender: TObject);
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   bMultiTrack: boolean;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;

   function DownLoadAxcisFile(sURL: string; sLocalFile: string): boolean;
   var
      iAttributes: integer;
      tsFile: TSearchRec;
      fsIn: TFileStream;
   begin

      try
         Result := False;
         UpdateStatusBar(sURL + ' ' + sLocalFile);
         fsIn := TFileStream.Create(sLocalFile, fmCreate);
         idHTTP.Get(sURL, fsIn);
      except
         Result := False;
         fsIn.Destroy;
         DeleteFile(sLocalFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end;

      fsIn.Destroy;
      iAttributes := faAnyFile;
      if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
         if (tsFile.Size < MIN_AXCIS_FILE_SIZE) then begin
            Result := False;
            DeleteFile(sLocalFile);
            FindClose(tsFile);
            UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
            Exit;
         end else begin
            Result := True;
            FindClose(tsFile);
            UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
            Exit;
         end;
      end;

      UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      Result := True;
   end;
begin

   hLog.AddToLog('DownloadAxcis', msevOperation);

   CheckProxy();
   OpenTable(dm.tblTrack);
   OpenTable(dm.tblVendor);

   try

      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      //      dm.tblTrack.Filtered := False;
      //      dm.tblTrack.Filter := ' (IsActive=True) and (Type=''T'') ';
      //      dm.tblTrack.Filtered := True;
      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();

         if (dm.tblTrack.FieldByName('Type').AsString = 'T') then begin
            if (dm.tblTrack.FieldByName('IsActive').AsBoolean) then begin
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
               dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster Plus';
               if dm.tblVendor.GotoKey() then begin
                  sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
                  sTsnTrkCode := Trim(sTsnTrkCode);

                  sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sNormalTrkCode := Trim(sNormalTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := AXCIS_PATH;
                  sTrkCode := sNormalTrkCode;

                  bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

                  idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
                  idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
                  idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;

                  if gbUseOverrideDate then begin
                     dtDownloadDate := edtOverrideDate.Date;
                  end else begin
                     dtDownloadDate := Now();
                  end;

                  DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
                  if (bMultiTrack) then begin
                     sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'p.' + sDownloadFileType;
                  end else begin
                     sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'p.' + sDownloadFileType;
                  end;

                  sDownloadFullFileName := sDownloadLocation + sFileName;

                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                     then begin
                     if (tsFile.Size < 30000) then begin
                        DeleteFile(sDownloadFullFileName);
                     end;
                  end;
                  FindClose(tsFile);

                  sServerFullFileName := sBaseImportPath + sFileName;
                  sServerFullFileName := LowerCase(sServerFullFileName);

                  if not FileExists(sDownloadFullFileName) then begin
                     lblServerPath.Caption := sServerFullFileName;
                     lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadAxcisFile(sServerFullFileName, sDownloadFullFileName);
                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                     hLog.AddToLog(sDownloadFullFileName, msevOperation);
                  end;

                  ClearPrgStatusBars();
               end;
            end;
         end;
         //         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
   except
      idHTTP.Disconnect;
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      Exit;
   end;

   idHTTP.Disconnect;
   CloseTable(dm.tblTrack);
   CloseTable(dm.tblVendor);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   btnBackupClick(Sender);

end;

//procedure TMainForm.DownloadAxcisForMike(Sender: TObject);
//var
//   sTrkCode: string;
//   sTsnTrkCode: string;
//   sNormalTrkCode: string;
//   bMultiTrack: boolean;
//   iAttributes: integer;
//   tsFile: TSearchRec;
//   sBaseImportPath: string;
//   sCompressionMethod: string;
//   sDownloadFileType: string;
//   sDownloadLocation: string;
//   sOutputFileType: string;
//   sFormatString: string;
//   sOverrideDownloadLocation: string;
//   dtDownLoadDate: TDateTime;
//   wYear: Word;
//   wMonth: Word;
//   wDay: Word;
//   sFileName: string;
//   sDownloadFullFileName: string;
//   sServerFullFileName: string;
//
//begin
//
//   hLog.AddToLog('DownloadAxcisMike', msevOperation);
//
//
//   CheckProxy();
//   OpenTable(dm.tblTrack);
//   OpenTable(dm.tblVendor);
//
//   try
//      lblServerPath.Visible := True;
//      lblLocalPath.Visible := True;
//
//      dm.tblTrack.Filtered := False;
//      dm.tblTrack.Filter := ' TrkCode=''GP'' or TrkCode=''TAM'' or TrkCode=''FG'' ';
//      dm.tblTrack.Filtered := True;
//
//      dm.tblTrack.First();
//
//      while not dm.tblTrack.Eof do begin
//         IncPrgBar();
//         if (dm.tblTrack.FieldByName('Type').AsString = 'T') then begin
//            dm.tblVendor.IndexName := '';
//            dm.tblVendor.SetKey();
//            dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
//            dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster Plus PDF';
//            if dm.tblVendor.GotoKey() then begin
//               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
//               sTsnTrkCode := Trim(sTsnTrkCode);
//
//               sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
//               sNormalTrkCode := Trim(sNormalTrkCode);
//
//               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
//               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
//               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
//               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
//
//               sDownloadLocation := PDF_MIKE_REPORT_PATH;
//
//               sTrkCode := sNormalTrkCode;
//
//               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
//               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
//               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
//               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;
//
//               idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
//               idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
//               idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;
//
//
//               if bUseOverrideDate then begin
//                  dtDownloadDate := edtOverrideDate.Date;
//               end else begin
//                  dtDownloadDate := Now();
//               end;
//
//               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
//               if (bMultiTrack) then begin
//                  sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'p.' + sDownloadFileType;
//               end else begin
//                  sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'p.' + sDownloadFileType;
//               end;
//
//               sDownloadFullFileName := sDownloadLocation + sFileName;
//
//               iAttributes := faAnyFile;
//               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
//                  if (tsFile.Size < 30000) then begin
//                     DeleteFile(sDownloadFullFileName);
//                  end;
//               end;
//               FindClose(tsFile);
//
//               sServerFullFileName := sBaseImportPath + sFileName;
//               sServerFullFileName := LowerCase(sServerFullFileName);
//
//               if not FileExists(sDownloadFullFileName) then begin
//                  lblServerPath.Caption := sServerFullFileName;
//                  lblLocalPath.Caption := sDownloadFullFileName;
//                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
//                  staBar.SimpleText := sDownloadFullFileName;
//                  Application.ProcessMessages();
//               end;
//
//               ClearPrgStatusBars();
//            end;
//         end;
//         Sleep(SLEEP_LONG);
//         dm.tblTrack.Next();
//      end;
//      lblServerPath.Caption := '';
//      lblLocalPath.Caption := '';
//   except
//      dm.tblTrack.Filtered := False;
//      dm.tblTrack.Filter := '';
//      dm.tblTrack.Filtered := False;
//      idHTTP.Disconnect;
//      CloseTable(dm.tblTrack);
//      CloseTable(dm.tblVendor);
//      lblServerPath.Caption := '';
//      lblLocalPath.Caption := '';
//      lblServerPath.Visible := False;
//      lblLocalPath.Visible := False;
//      Exit;
//   end;
//
//   idHTTP.Disconnect;
//   dm.tblTrack.Filtered := False;
//   dm.tblTrack.Filter := '';
//   dm.tblTrack.Filtered := False;
//   CloseTable(dm.tblTrack);
//   CloseTable(dm.tblVendor);
//   lblServerPath.Caption := '';
//   lblLocalPath.Caption := '';
//   lblServerPath.Visible := False;
//   lblLocalPath.Visible := False;
//   btnBackupClick(Sender);
//
//end;

procedure TMainForm.btnImportClick(Sender: TObject);
begin
   exit;
   TimerOn(False);
   Import(Sender);
   TimerOn(True);
end;

procedure TMainForm.Import(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;

begin

   hLog.AddToLog('Import AXCIS Files For History', msevOperation);
   try

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;

      if gbUseOverrideDate then begin
         dtDownloadDate := edtOverrideDate.Date;
      end else begin
         dtDownloadDate := Now();
      end;

      //******
      iAttributes := faAnyFile;
      sPath := AXCIS_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*p.exe';
      end
      else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;
         sFileName := sFileName + 'p.exe';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);
      gbFilesToImportFound := False;
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         gbFilesToImportFound := True;
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := iEndPos - 5;

         sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
         sFileTrkCode := UpperCase(sFileTrkCode);

         sTmp := CopyStr(tsFile.Name, iStartPos, 4);
         sRaceMM := CopyStr(sTmp, 1, 2);
         sRaceDD := CopyStr(sTmp, 3, 2);

         sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
         iLen := Length(sTmp);
         sTmp := CopyStr(sTmp, 9, iLen - 8);
         sFileName := sPath + sTmp;
         sFileName := UpperCase(sFileName);
         bOk := ExtractRar(sFileName);
         if bOk then begin
            dtPresent := Now();
            DecodeDate(dtPresent, wYear, wMonth, wDay);
            wDay := atow(sRaceDD);
            wMonth := atow(sRaceMM);

            if bProcessAllDates then begin
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
            end else begin
               dtAxcisRaceDate := dtDownloadDate;
            end;

            sRaceDbfName := 'racedp.dbf';
            sEntryDbfName := 'thr2dp.dbf';
            sTrainerDbfName := 'thrtdp.dbf';
            sJockeyDbfName := 'thrjdp.dbf';
            sDamDbfName := 'thrddp.dbf';
            sSireDbfName := 'thrsdp.dbf';
            sPastDbfName := 'thrrdp.dbf';
            sMatchupDbfName := 'thrmdp.dbf';

            try
               ImportAxcisRaceEntry(
                  sRaceDbfName,
                  sEntryDbfName,
                  sDamDbfName,
                  sSireDbfName,
                  sPastDbfName,
                  sMatchupDbfName,
                  sTrainerDbfName,
                  sJockeyDbfName
                  );
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            if not bProcessAllDates then begin
               try
                  ImportAxcisPastMatch(sPastDbfName, sMatchupDbfName, sJockeyDbfName);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;
            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;

            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            sTmp := CopyStr(tsFile.Name, iStartPos, 4);
            sRaceMM := CopyStr(sTmp, 1, 2);
            sRaceDD := CopyStr(sTmp, 3, 2);

            sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
            iLen := Length(sTmp);
            sTmp := CopyStr(sTmp, 9, iLen - 8);
            sFileName := sPath + sTmp;
            sFileName := UpperCase(sFileName);
            bOk := ExtractRar(sFileName);
            if bOk then begin
               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);

               if bProcessAllDates then begin
                  dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
               end else begin
                  dtAxcisRaceDate := dtDownloadDate;
               end;

               sRaceDbfName := 'racedp.dbf';
               sEntryDbfName := 'thr2dp.dbf';
               sTrainerDbfName := 'thrtdp.dbf';
               sJockeyDbfName := 'thrjdp.dbf';
               sDamDbfName := 'thrddp.dbf';
               sSireDbfName := 'thrsdp.dbf';
               sPastDbfName := 'thrrdp.dbf';
               sMatchupDbfName := 'thrmdp.dbf';

               if bProcessAllDates then begin
                  btnStartOfDayClick(Sender);
               end;

               try
                  ImportAxcisRaceEntry(sRaceDbfName,
                     sEntryDbfName,
                     sDamDbfName,
                     sSireDbfName,
                     sPastDbfName,
                     sMatchupDbfName,
                     sTrainerDbfName,
                     sJockeyDbfName
                     );

               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               if not bProcessAllDates then begin
                  try
                     ImportAxcisPastMatch(sPastDbfName, sMatchupDbfName, sJockeyDbfName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;
            end;
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
         dmDBF.dbfRace.Active := False;
         dmDBF.dbfEntry.Active := False;
         dmDBF.dbfDam.Active := False;
         dmDBF.dbfSire.Active := False;
         dmDBF.dbfTrainer.Active := False;
         dmDBF.dbfJockey.Active := False;
         dmDBF.dbfPast.Active := False;
         dmDBF.dbfMatchup.Active := False;
      end;
   end;

   ClearPrgStatusBars();
   dmDBF.dbfRace.Active := False;
   dmDBF.dbfEntry.Active := False;
   dmDBF.dbfDam.Active := False;
   dmDBF.dbfSire.Active := False;
   dmDBF.dbfTrainer.Active := False;
   dmDBF.dbfJockey.Active := False;
   dmDBF.dbfPast.Active := False;
   dmDBF.dbfMatchup.Active := False;

end;

procedure TMainForm.btnUpdateAllRatingsClick(Sender: TObject);
begin
   TimerOn(False);
   UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, TRN_STAT_DAYS);
   TimerOn(True);
end;


procedure TMainForm.btnBackupClick(Sender: TObject);
begin
   TimerOn(False);
   Backup(Sender);
   TimerOn(True);
end;

procedure TMainForm.Backup(Sender: TObject);
var
   sFileName: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;

begin

   hLog.AddToLog('BackupAxcisFiles', msevOperation);
   try
      try
         btnBackup.Enabled := False;
         CheckProxy();
         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := 'Axcis' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + sm.Str(wYear, 4);
         ztvZip.ArchiveFile := BACKUP_PATH + sFileName + '.zip';
         hLog.AddToLog(ztvZip.ArchiveFile, msevOperation);

         ztvZip.FileSpec.Clear();
         //sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         //sFileName := 'ap*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;

         sFileName := AXCIS_PATH + sFileName + 'p.exe';
         ztvZip.FileSpec.Add(sFileName);
         ztvZip.Compress;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   finally
      btnBackup.Enabled := True;
   end;

end;

procedure TMainForm.BackupBuggy(Sender: TObject);
var
   sFileName: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;

begin

   hLog.AddToLog('BackupBuggyAxcisFiles', msevOperation);
   try
      try
         CheckProxy();
         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := 'Buggy' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + sm.Str(wYear, 4);
         ztvZip.ArchiveFile := BACKUP_BUGGY_PATH + sFileName + '.zip';
         hLog.AddToLog(ztvZip.ArchiveFile, msevOperation);

         ztvZip.FileSpec.Clear();
         //sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         //sFileName := 'ap*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;

         sFileName := AXCIS_BUGGY_PATH + sFileName + '*.*';
         ztvZip.FileSpec.Add(sFileName);
         ztvZip.Compress;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   finally
   end;

end;

//function TMainForm.GetYardDistanceDesc(iDistanceInYards: Integer): string;
//begin
//
//   case iDistanceInYards of
//      110: Result := '.5f';
//      (110 * 2): Result := '1f';
//      (110 * 3): Result := '1.5f';
//      350: Result := '350y';
//      400: Result := '400y';
//      800: Result := '800y';
//      (110 * 4): Result := '2f';
//      (110 * 5): Result := '2.5f';
//      (110 * 6): Result := '3f';
//      (110 * 7): Result := '3.5f';
//      (110 * 8): Result := '4f';
//      (110 * 9): Result := '4.5f';
//      (110 * 10): Result := '5f';
//      (110 * 11): Result := '5.5f';
//      (110 * 12): Result := '6f';
//      (110 * 13): Result := '6.5f';
//      (110 * 14): Result := '7f';
//      (110 * 15): Result := '7.5f';
//      (110 * 16): Result := '1m';
//      1803: Result := '1m 40y';
//      (110 * 16) + 40: Result := '1m 40y';
//      1826: Result := '1m 70y';
//      (110 * 16) + 70: Result := '1m 70y';
//      (110 * 17): Result := '1 1/16m';
//      (110 * 18): Result := '1 1/8m';
//      (110 * 19): Result := '1 3/16m';
//      (110 * 20): Result := '1 1/4m';
//      (110 * 21): Result := '1 5/16m';
//      (110 * 22): Result := '1 3/8m';
//      (110 * 23): Result := '1 7/16m';
//      (110 * 24): Result := '1 1/2m';
//      (110 * 25): Result := '1 9/16m';
//      (110 * 26): Result := '1 5/8m';
//      (110 * 27): Result := '1 11/16m';
//      (110 * 28): Result := '1 3/4m';
//      (110 * 29): Result := '1 13/16m';
//      (110 * 30): Result := '1 7/8m';
//      (110 * 31): Result := '2m';
//      (110 * 32): Result := '2 1/16m';
//      (110 * 33): Result := '2 1/8m';
//      (110 * 34): Result := '2 3/16m';
//      (110 * 35): Result := '2 1/4m';
//      (110 * 36): Result := '2 5/16m';
//      (110 * 37): Result := '2 3/8m';
//      (110 * 38): Result := '2 7/16m';
//      (110 * 39): Result := '2 1/2m';
//      (110 * 40): Result := '2 9/16m';
//      (110 * 41): Result := '2 5/8m';
//      (110 * 42): Result := '2 11/16m';
//      (110 * 43): Result := '2 3/4m';
//      (110 * 44): Result := '2 13/16m';
//      (110 * 45): Result := '2 7/8m';
//      (110 * 46): Result := '3m';
//      (110 * 47): Result := '3 1/16m';
//      (110 * 48): Result := '3 1/8m';
//      (110 * 49): Result := '3 3/16m';
//      (110 * 50): Result := '3 1/4m';
//      (110 * 51): Result := '3 5/16m';
//      (110 * 52): Result := '3 3/8m';
//      (110 * 53): Result := '3 7/16m';
//      (110 * 54): Result := '3 1/2m';
//      (110 * 55): Result := '3 9/16m';
//      (110 * 56): Result := '3 5/8m';
//      (110 * 57): Result := '3 11/16m';
//      (110 * 58): Result := '3 3/4m';
//      (110 * 59): Result := '3 13/16m';
//      (110 * 60): Result := '3 7/8m';
//   else
//      Result := IntToStr(iDistanceInYards);
//   end;
//
//end;



procedure TMainForm.FormActivate(Sender: TObject);
begin
   //   edtOverrideDate.Date := Now();
end;


procedure TMainForm.FormCreate(Sender: TObject);
var
   iniFile: TIniFile;
   sLocation: string;
   iIdx: integer;

begin


   try
      hLog := TmLog.Create(MainForm);

      gbSuppressTimerOn := False;

      iniFile := TIniFile.Create(INI_FILE);

      sLocation := iniFile.ReadString('Processing', 'Location', 'Work');
      if sLocation = 'Testing' then begin
         gbTest := True;
      end else begin
         gbTest := False;
      end;


      LOCATION := iniFile.ReadString('Processing', 'Location', 'Testing');
      if (LOCATION = 'ERROR') then begin
         iniFile.WriteString('Processing', 'Location', 'Testing');
      end;

      DATA_PATH := iniFile.ReadString('Paths', 'DataPath', 'ERROR');
      if (DATA_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DataPath', 'd:\RatingsData31\');
      end;

      DATA_BUGGY_PATH := iniFile.ReadString('Paths', 'DataBuggyPath', 'ERROR');
      if (DATA_BUGGY_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DataBuggyPath', 'd:\BuggyData\');
      end;

      SQL_PATH := iniFile.ReadString('Paths', 'SQLPath', 'ERROR');
      if (SQL_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'SQLPath', 'd:\Ratings31\SQL\');
      end;

      LOG_PATH := iniFile.ReadString('Paths', 'LOGPath', 'ERROR');
      if (LOG_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'LOGPath', 'd:\Ratings31\Log\');
      end;

      LOG_FILENAME := 'Ratings.log';
      EXCEPTION_LOG_FILENAME := 'ExceptRatings.log';
      STATS_LOG_FILENAME := 'Stats.log';
      TSN_LOG_FILENAME := 'TSN.log';
      EQUIBASE_LOG_FILENAME := 'Equibase.log';
      AXCIS_LOG_FILENAME := 'Axcis.log';
      BLOODHORSE_LOG_FILENAME := 'BloodHorse.log';

      //      EXCEPTION_LOG_FILENAME := LOG_FILENAME;
      //      STATS_LOG_FILENAME := LOG_FILENAME;
      //      TSN_LOG_FILENAME := LOG_FILENAME;
      //      EQUIBASE_LOG_FILENAME := LOG_FILENAME;
      //      AXCIS_LOG_FILENAME := LOG_FILENAME;

      TSN_MCP_PATH := iniFile.ReadString('Paths', 'TsnMCPPath', 'ERROR');
      if (TSN_MCP_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'TsnMCPPath', 'd:\TsnDownload\ProCaps\');
      end;

      HDW_JCP_PATH := iniFile.ReadString('Paths', 'HdwJCPPath', 'ERROR');
      if (HDW_JCP_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'HdwJCPPath', 'd:\HdwDownload\JCP\');
      end;

      TSN_XRD_PATH := iniFile.ReadString('Paths', 'TsnXRDPath', 'ERROR');
      if (TSN_XRD_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'TsnXRDPath', 'd:\TsnDownload\Results\');
      end;



      HDW_XRD_PATH := iniFile.ReadString('Paths', 'HDWXRDPath', 'ERROR');
      if (HDW_XRD_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'HdwXRDPath', 'd:\HdwDownload\Results\');
      end;

      AXCIS_PATH := iniFile.ReadString('Paths', 'AxcisPath', 'ERROR');
      if (AXCIS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'AxcisPath', 'd:\2001Axcis\');
      end;

      SAVE_AXCIS_PATH := AXCIS_PATH;
      PDF_MIKE_REPORT_PATH := AXCIS_PATH + 'PP\';

      AXCIS_BUGGY_PATH := iniFile.ReadString('Paths', 'AxcisBuggyPath',
         'ERROR');
      if (AXCIS_BUGGY_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'AxcisBuggyPath', 'd:\BuggyDownload\');
      end;
      PDF_JIM_REPORT_PATH := AXCIS_BUGGY_PATH + 'PP\';


      ALT_AXCIS_PATH := iniFile.ReadString('Paths', 'AltAxcisPath', 'ERROR');
      if (ALT_AXCIS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'AltAxcisPath', 'd:\2001Axcis\');
      end;

      dtAltFirstDateToProcess := iniFile.ReadDate('Process', 'AltFirstDateToProcess', 0);
      if (dtAltFirstDateToProcess = 0) then begin
         iniFile.WriteDate('Process', 'AltFirstDateToProcess', Now());
      end;
      edtAltFirstDateToProcess.Date := dtAltFirstDateToProcess;

      dtAltLastDateToProcess := iniFile.ReadDate('Process', 'AltLastDateToProcess', 0);
      if (dtAltLastDateToProcess = 0) then begin
         iniFile.WriteDate('Process', 'AltLastDateToProcess', Now());
      end;
      edtAltLastDateToProcess.Date := dtAltLastDateToProcess;

      dtAltStartDateProcessed := iniFile.ReadDate('Process', 'AltStartDateProcessed', 0);
      if (dtAltStartDateProcessed = 0) then begin
         iniFile.WriteDate('Process', 'AltStartDateProcessed', Now());
      end;

      dtAltStopDateProcessed := iniFile.ReadDate('Process', 'AltStopDateProcessed', 0);
      if (dtAltStopDateProcessed = 0) then begin
         iniFile.WriteDate('Process', 'AltStopDateProcessed', Now());
      end;

      DATE_STATS_UPDATED_TO := iniFile.ReadDate('Process', 'DateStatsUpdatedTo', 0);
      if (DATE_STATS_UPDATED_TO = 0) then begin
         iniFile.WriteDate('Process', 'DateStatsUpdatedTo', Now());
      end;

      DATE_FINAL_ORDER_UPDATED_TO := iniFile.ReadDate('Process', 'DateFinalOrderUpdatedTo', 0);
      if (DATE_FINAL_ORDER_UPDATED_TO = 0) then begin
         iniFile.WriteDate('Process', 'DateFinalOrderUpdatedTo', Now());
      end;

      dtAltStartDateProcessed := Now() - PREV_WEEK_DAYS;
      iniFile.WriteDate('Process', 'AltStartDateProcessed', dtAltStartDateProcessed);
      iniFile.WriteDate('Process', 'AltStopDateProcessed', Now() - 1);

      if ((dtAltLastDateToProcess < dtAltStartDateProcessed) or
         (dtAltLastDateToProcess > dtAltStopDateProcessed)) then begin
         dtAltLastDateToProcess := Now() - (PREV_WEEK_DAYS + 1);
         iniFile.WriteDate('Process', 'AltLastDateToProcess', dtAltLastDateToProcess);
      end;

      if ((dtAltFirstDateToProcess < dtAltStartDateProcessed) or
         (dtAltFirstDateToProcess > dtAltStopDateProcessed)) then begin
         dtAltFirstDateToProcess := Now() - PREV_WEEK_DAYS;
         iniFile.WriteDate('Process', 'AltFirstDateToProcess', dtAltFirstDateToProcess);
      end;

      BACKUP_PATH := iniFile.ReadString('Paths', 'BackupPath', 'ERROR');
      if (BACKUP_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'BackupPath', 'd:\RatingsBackup\');
      end;

      BACKUP_BUGGY_PATH := iniFile.ReadString('Paths', 'BackupBuggyPath',
         'ERROR');
      if (BACKUP_BUGGY_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'BackupBuggyPath', 'd:\BuggyBackup\');
      end;

      PDF_TIP_REPORT_PATH := iniFile.ReadString('Paths', 'PdfTipReportPath', 'ERROR');
      if (PDF_TIP_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfTipReportPath', 'd:\RatingsReports\PdfTipReport\');
      end;

      EXPORT_REPORT_PATH := iniFile.ReadString('Paths', 'ExportReportPath', 'ERROR');
      if (EXPORT_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'ExportReportPath', 'd:\RatingsReports\Export\');
      end;


      PDF_RESULTS_REPORT_PATH := iniFile.ReadString('Paths', 'PdfResultsReportPath', 'ERROR');
      if (PDF_RESULTS_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfResultsReportPath', 'd:\RatingsReports\ResultsReport\');
      end;

      PDF_SUMMARY_REPORT_PATH := iniFile.ReadString('Paths', 'PdfSummaryReportPath', 'ERROR');
      if (PDF_SUMMARY_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfSummaryReportPath', 'd:\RatingsReports\PdfSummaryReport\');
      end;

      PDF_YOUBET_RESULTS_REPORT_PATH := iniFile.ReadString('Paths', 'PdfYouBetResultsReportPath', 'ERROR');
      if (PDF_YOUBET_RESULTS_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfYouBetResultsReportPath', 'd:\RatingsReports\PdfYouBetResultsReport\');
      end;

      PDF_YOUBET_SUMMARY_REPORT_PATH := iniFile.ReadString('Paths', 'PdfYouBetSummaryReportPath', 'ERROR');
      if (PDF_YOUBET_SUMMARY_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfYouBetSummaryReportPath', 'd:\RatingsReports\PdfYouBetSummaryReport\');
      end;

      PDF_HOSPITAL_REPORT_PATH := iniFile.ReadString('Paths', 'PdfHospitalReportPath', 'ERROR');
      if (PDF_HOSPITAL_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfHospitalReportPath', 'd:\RatingsReports\PdfHospitalReport\');
      end;

      PDF_HOSPITAL_REPORT2_PATH := iniFile.ReadString('Paths', 'PdfHospitalReport2Path', 'ERROR');
      if (PDF_HOSPITAL_REPORT2_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfHospitalReport2Path', 'd:\RatingsReports\PdfHospitalReport2\');
      end;

      PDF_HARNESS_REPORT_PATH := iniFile.ReadString('Paths', 'PdfHarnessReportPath', 'ERROR');
      if (PDF_HARNESS_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfHarnessReportPath', 'd:\RatingsReports\PdfHarnessReport\');
      end;


      PDF_GIMMICK_REPORT_PATH := iniFile.ReadString('Paths', 'PdfGimmickReportPath', 'ERROR');
      if (PDF_GIMMICK_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfGimmickReportPath', 'd:\RatingsReports\PdfGimmickReport\');
      end;

      PDF_VALUE_REPORT_PATH := iniFile.ReadString('Paths', 'PdfValueReportPath', 'ERROR');
      if (PDF_VALUE_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfValueReportPath', 'd:\RatingsReports\PdfValueReport\');
      end;

      PDF_HARNESS_VALUE_REPORT_PATH := iniFile.ReadString('Paths', 'PdfHarnessValueReportPath', 'ERROR');
      if (PDF_HARNESS_VALUE_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfHarnessValueReportPath', 'd:\RatingsReports\PdfHarnessValueReport\');
      end;

      PDF_ANGLE_REPORT_PATH := iniFile.ReadString('Paths', 'PdfAngleReportPath', 'ERROR');
      if (PDF_ANGLE_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfAngleReportPath', 'd:\RatingsReports\PdfAngleReport\');
      end;

      PDF_SELECTION_REPORT_PATH := iniFile.ReadString('Paths', 'PdfSelectionReportPath', 'ERROR');
      if (PDF_SELECTION_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfSelectionReportPath', 'd:\RatingsReports\PdfSelectionReport\');
      end;

      PDF_WAGER_REPORT_PATH := iniFile.ReadString('Paths', 'PdfWagerReportPath', 'ERROR');
      if (PDF_WAGER_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfWagerReportPath', 'd:\RatingsReports\PdfWagerReport\');
      end;

      PDF_CONTEST_REPORT_PATH := iniFile.ReadString('Paths', 'PdfContestReportPath', 'ERROR');
      if (PDF_CONTEST_REPORT_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'PdfContestReportPath', 'd:\RatingsReports\PdfContestReport\');
      end;

      USTA_CHARTS_PATH := iniFile.ReadString('Paths', 'USTAChartsPath', 'ERROR');
      if (USTA_CHARTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'USTAChartsPath', 'd:\Harness\USTACharts\');
      end;

      TRACK_SELECTION_PATH := iniFile.ReadString('Paths', 'TrackSelectionPath', 'ERROR');
      if (TRACK_SELECTION_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'TrackSelectionPath', 'd:\AxcisDownload\TrackSelections\');
      end;

      EQUIBASE_STATS_PATH := iniFile.ReadString('Paths', 'EquibaseStatsPath', 'ERROR');
      if (EQUIBASE_STATS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseStatsPath', 'd:\Equibase\Stats\');
      end;

      TSN_STATS_PATH := iniFile.ReadString('Paths', 'TSNStatsPath', 'ERROR');
      if (TSN_STATS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'TSNStatsPath', 'd:\TsnDownload\TSNStats\');
      end;

      TSN_LSC_PATH := iniFile.ReadString('Paths', 'TSNLSCPath', 'ERROR');
      if (TSN_LSC_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'TSNLSCPath', 'd:\TsnDownload\TSNLSC\');
      end;

      EQUIBASE_TRACK_LEADERS_PATH := iniFile.ReadString('Paths', 'EquibaseTrackLeadersPath', 'ERROR');
      if (EQUIBASE_TRACK_LEADERS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseTrackLeadersPath', 'd:\Equibase\TrackLeaders\');
      end;

      SC_CHARTS_PATH := iniFile.ReadString('Paths', 'SCChartsPath', 'ERROR');
      if (SC_CHARTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'SCChartsPath', 'd:\Harness\SCCharts\');
      end;

      EQUIBASE_CHARTS_PATH := iniFile.ReadString('Paths', 'EquibaseChartsPath', 'ERROR');
      if (EQUIBASE_CHARTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseChartsPath', 'd:\Equibase\Charts\');
      end;

      EQUIBASE_RESULTS_PATH := iniFile.ReadString('Paths', 'EquibaseResultsPath', 'ERROR');
      if (EQUIBASE_RESULTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseResultsPath', 'd:\Equibase\Results\');
      end;

      EQUIBASE_ENTRIES_PATH := iniFile.ReadString('Paths', 'EquibaseEntriesPath', 'ERROR');
      if (EQUIBASE_ENTRIES_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseEntriesPath', 'd:\Equibase\Entries\');
      end;

      EQUIBASE_WORKOUTS_PATH := iniFile.ReadString('Paths', 'EquibaseWorkoutsPath', 'ERROR');
      if (EQUIBASE_WORKOUTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'EquibaseWorkoutsPath', 'd:\Equibase\Workouts\');
      end;

      DRF_CHARTS_PATH := iniFile.ReadString('Paths', 'DRFChartsPath', 'ERROR');
      if (DRF_CHARTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DRFChartsPath', 'd:\DRF\Charts\');
      end;

      DRF_RESULTS_PATH := iniFile.ReadString('Paths', 'DRFResultsPath', 'ERROR');
      if (DRF_RESULTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DRFResultsPath', 'd:\DRF\Results\');
      end;

      DRF_ENTRIES_PATH := iniFile.ReadString('Paths', 'DRFEntriesPath', 'ERROR');
      if (DRF_ENTRIES_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DRFEntriesPath', 'd:\DRF\Entries\');
      end;

      DRF_WORKOUTS_PATH := iniFile.ReadString('Paths', 'DRFWorkoutsPath', 'ERROR');
      if (DRF_WORKOUTS_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'DRFWorkoutsPath', 'd:\DRF\Workouts\');
      end;

      BLOODHORSE_SIRES_PATH := iniFile.ReadString('Paths', 'BloodHorseSiresPath', 'ERROR');
      if (BLOODHORSE_SIRES_PATH = 'ERROR') then begin
         iniFile.WriteString('Paths', 'BloodHorseSiresPath', 'd:\Equibase\Breeding\');
      end;

      sProxyServer := iniFile.ReadString('Proxy', 'ProxyServer', 'ERROR');
      if (sProxyServer = 'ERROR') then begin
         sProxyServer := '';
         iniFile.WriteString('Proxy', 'ProxyServer', '');
      end;

      iProxyPort := iniFile.ReadInteger('Proxy', 'iProxyPort', 0);
      if (iProxyPort = 0) then begin
         iniFile.WriteInteger('Proxy', 'ProxyPort', 0);
      end;

      bProcessAllDates := iniFile.ReadBool('SireRate', 'ProcessAllDates', False);
      if (bProcessAllDates = False) then begin
         iniFile.WriteBool('SireRate', 'ProcessAllDates', False);
      end;

      gbUseOverrideDate := iniFile.ReadBool('SireRate', 'UseOverrideDate', False);
      if (gbUseOverrideDate = False) then begin
         iniFile.WriteBool('SireRate', 'UseOverrideDate', False);
      end;

      // DEFAULT
      gbOpenCloseFiles := True;

      bUseProxyServer := iniFile.ReadBool('Proxy', 'UseProxyServer', False);
      if (bUseProxyServer = False) then begin
         iniFile.WriteBool('Proxy', 'UseProxyServer', False);
      end;

      if bProcessAllDates = True then begin
         chkProcessAllDates.Checked := True;
      end else begin
         chkProcessAllDates.Checked := False;
      end;

      if gbUseOverrideDate = True then begin
         chkOverrideDate.Checked := True;
      end else begin
         chkOverrideDate.Checked := False;
      end;

      if bUseProxyServer = True then begin
         chkUseProxy.Checked := True;
      end else begin
         chkUseProxy.Checked := False;
      end;

      bUseEquibase := iniFile.ReadBool('Processing', 'UseEquibase', False);
      if (bUseEquibase = False) then begin
         iniFile.WriteBool('Processing', 'UseEquibase', False);
      end;

      bUseDRF := iniFile.ReadBool('Processing', 'UseDRF', False);
      if (bUseDRF = False) then begin
         iniFile.WriteBool('Processing', 'UseDRF', False);
      end;

      pgCtrlMain.ActivePage := tabDaily;

      edtProxy.Text := sProxyServer;
      edtOverrideDate.Date := Now();

   except
      FreeAndNil(iniFile);
   end;
   FreeAndNil(iniFile);

   try
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   except
   end;

   hLog.ShowSeverityLevelInLog := True;
   DAYS_TO_REPROCESS := 8;

   // If this changes then
   // procedure TMainForm.UpdateGimmicks has to change
   // also sLeg1 etc
   DOLLAR_FILTER := '';
   DOLLAR_FILTER := DOLLAR_FILTER +
      '( (IsDollar=True) or (IsDoubleDollar=True) )';

   //
   WAGER_FILTER := '';
   WAGER_FILTER := WAGER_FILTER + '( ';
   WAGER_FILTER := WAGER_FILTER + '(IsPrintedOnValueSheet=True) ';
   WAGER_FILTER := WAGER_FILTER + ' and ';
   WAGER_FILTER := WAGER_FILTER + '(IsWagerSheetSelected=True) ';
   WAGER_FILTER := WAGER_FILTER + ') ';

   //
   YOUBET_WAGER_FILTER := '';
   YOUBET_WAGER_FILTER := '';
   YOUBET_WAGER_FILTER := YOUBET_WAGER_FILTER + '( ';
   YOUBET_WAGER_FILTER := YOUBET_WAGER_FILTER + '(IsYouBetTrack=True) ';
   YOUBET_WAGER_FILTER := YOUBET_WAGER_FILTER + ' and ';
   YOUBET_WAGER_FILTER := YOUBET_WAGER_FILTER + '(IsSpeedSheetSelected=True) ';
   YOUBET_WAGER_FILTER := YOUBET_WAGER_FILTER + ') ';

   //
   PTC_WAGER_FILTER := '';
   PTC_WAGER_FILTER := '';
   PTC_WAGER_FILTER := PTC_WAGER_FILTER + '( ';
   PTC_WAGER_FILTER := PTC_WAGER_FILTER + '(IsPTCTrack=True)';
   PTC_WAGER_FILTER := PTC_WAGER_FILTER + ' and ';
   PTC_WAGER_FILTER := PTC_WAGER_FILTER + '(IsValueWagerSelected=True) ';
   PTC_WAGER_FILTER := PTC_WAGER_FILTER + ') ';

   //
   LINER_FILTER := '';
   LINER_FILTER := LINER_FILTER + '( ';
   LINER_FILTER := LINER_FILTER + '(IsYouBetTrack=True) ';
   LINER_FILTER := LINER_FILTER + ' and ';
   LINER_FILTER := LINER_FILTER + '(IsLinerSheetSelected=True) ';
   LINER_FILTER := LINER_FILTER + ') ';

   //
   SPEED_FILTER := '';
   SPEED_FILTER := SPEED_FILTER + '( ';
   SPEED_FILTER := SPEED_FILTER + '(IsYouBetTrack=True) ';
   SPEED_FILTER := SPEED_FILTER + ' and ';
   SPEED_FILTER := SPEED_FILTER + '(IsSpeedSheetSelected=True) ';
   SPEED_FILTER := SPEED_FILTER + ') ';

   //
   BRED_1ST_FILTER := '';
   BRED_1ST_FILTER := BRED_1ST_FILTER + '( ';
   BRED_1ST_FILTER := BRED_1ST_FILTER + '(IsYouBetTrack=True) ';
   BRED_1ST_FILTER := BRED_1ST_FILTER + ' and ';
   BRED_1ST_FILTER := BRED_1ST_FILTER + '(Is1stBredSheetSelected=True) ';
   BRED_1ST_FILTER := BRED_1ST_FILTER + ') ';

   //
   BRED_TURF_FILTER := '';
   BRED_TURF_FILTER := BRED_TURF_FILTER + '( ';
   BRED_TURF_FILTER := BRED_TURF_FILTER + '(IsYouBetTrack=True) ';
   BRED_TURF_FILTER := BRED_TURF_FILTER + ' and ';
   BRED_TURF_FILTER := BRED_TURF_FILTER + '(IsTurfBredSheetSelected=True) ';
   BRED_TURF_FILTER := BRED_TURF_FILTER + ') ';

   //
   BRED_2YO_FILTER := '';
   BRED_2YO_FILTER := BRED_2YO_FILTER + '( ';
   BRED_2YO_FILTER := BRED_2YO_FILTER + '(IsYouBetTrack=True) ';
   BRED_2YO_FILTER := BRED_2YO_FILTER + ' and ';
   BRED_2YO_FILTER := BRED_2YO_FILTER + '(Is2yoBredSheetSelected=True) ';
   BRED_2YO_FILTER := BRED_2YO_FILTER + ') ';


   //SPD_BRD_FILTER := '';
   //SPD_BRD_FILTER := SPD_BRD_FILTER + '( ';
   //SPD_BRD_FILTER := SPD_BRD_FILTER + '(IsSpdBrdSheetSelected=True) ';
   //SPD_BRD_FILTER := SPD_BRD_FILTER + ') ';


   //
   LINER_FILTER_YOUBET := '';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + '( ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + '(IsPrintedOnValueSheet=True) ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + ' and ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + '(TodaysWagerKellyPct >= 0.0100) ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + ' and ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + '(MorningLineTo1Fair < 20) ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + ' and ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + '(TodaysWagerLineTo1Fair < 20) ';
   LINER_FILTER_YOUBET := LINER_FILTER_YOUBET + ') ';


   //
   TOP_PICK_FILTER := '';
   TOP_PICK_FILTER := TOP_PICK_FILTER + ' (TodaysWagerWinPctRank=1)';
   TOP_PICK_FILTER := TOP_PICK_FILTER + ' and ';
   TOP_PICK_FILTER := TOP_PICK_FILTER + ' (IsPrintedOnValueSheet=True)';
   TOP_PICK_FILTER := TOP_PICK_FILTER + ' and TypeOfRace = ''T'' ';


   //
   WAGER_FILTER_ALL := '';

   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '( ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(IsTSNProcessed=True) ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + ' and ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '( ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(FinalWinPctRank=1) or ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(IsDollar=True) or ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(IsDoubleDollar=True) or ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(IsWagerSheetSelected=True) ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + ')';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + ')';

   //   ((FinalWinPctRank=1) or (IsDollar=True) or (IsDoubleDollar=True) or (IsWagerSheetSelected=True)) and IsPrintedOnValueSheet = True

   WAGER_FILTER_ALL := WAGER_FILTER_ALL + ' and ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + '(IsPrintedOnValueSheet=True) ';
   WAGER_FILTER_ALL := WAGER_FILTER_ALL + ') ';

   // Liner, liner trk > fair, not a first starter
//

   WAGER_FILTER_OVLY := '';
   WAGER_FILTER_OVLY := WAGER_FILTER_OVLY + '((TodaysWagerWinPctRank=1) or (FinalWinPctRank=1) or (IsWagerSheetSelected=True) or (IsSpeedSheetSelected=True) or (IsLinerSheetSelected=True) ) and IsPrintedOnValueSheet = True';

   try
      if FileExists(LOG_PATH + LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + LOG_FILENAME);
         //         for iIdx := 0 to cxRtfLog.lines.Count - 1 do begin
         //            if  SmartPos('[Operation]', cxRtfLog.lines.Strings[iIdx]) > 0  then begin
         //                 cxRtfLog.Lines.Delete(iIdx);
         //            end;
         //         end;
      end;
   except
   end;

end;


procedure TMainForm.qrySQLAfterClose(DataSet: TDataSet);
begin
   staBar.SimpleText := '';
   pnlPrgBar.Visible := False;
end;

procedure TMainForm.qrySQLBeforeOpen(DataSet: TDataSet);
begin

   pgCtrlMain.ActivePage := tabDaily;

   prgBar.Properties.Max := 100;
   prgBar.Position := 0;
   prgBar.Width := pnlPrgBar.Width - 10;
   pnlPrgBar.Visible := True;
   staBar.SimpleText := sQrySqlStatusSimpleText;
   Application.ProcessMessages();

end;

procedure TMainForm.btnAbortQryClick(Sender: TObject);
begin

   bAbortQuery := True;

end;

//procedure TMainForm.OpenTable(t: TDBISAMTable);
//begin
//
//   try
//      if t.Active = False then begin
//         t.Active := True;
//      end;
//   except
//      on E: Exception do begin
//         hLog.AddToLog(E.Message, msevException);
//      end;
//   end;
//
//end;
//
//procedure TMainForm.OpenTable(t: TDBISAMTable);
//begin
//   try
//      t.IndexName := '';
//      if t.Active = False then begin
//         t.Exclusive := True;
//         t.Active := True;
//      end;
//      if t.Active = True then begin
//         t.Active := False;
//         t.Exclusive := True;
//         t.Active := True;
//      end;
//   except
//      on E: Exception do begin
//         hLog.AddToLog(E.Message, msevException);
//      end;
//
//   end;
//end;

//procedure TMainForm.CloseTable(t: TDBISAMTable);
//begin
//
//   try
//
//      if t.Active = True then begin
//         t.FlushBuffers();
//         t.IndexName := '';
//         if t.Ranged then begin
//            t.CancelRange();
//         end;
//         if (t.Filtered) then begin
//            t.Filtered := False;
//         end;
//
//         t.Active := False;
//         t.Exclusive := False;
//      end;
//
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//end;
//
//procedure TMainForm.CloseTable(t: TDBISAMTable);
//begin
//
//   try
//
//      if t.Active = True then begin
//         t.IndexName := '';
//         t.FlushBuffers();
//         if t.Ranged then begin
//            t.CancelRange();
//         end;
//         if (t.Filtered) then begin
//            t.Filtered := False;
//         end;
//
//         t.Active := False;
//         t.Exclusive := False;
//      end;
//
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//end;



//procedure TMainForm.btnImportTodayClick(Sender: TObject);
//begin
//   TimerOn(False);
//   ImportToday(Sender);
//   TimerOn(True);
//end;

procedure TMainForm.ImportToday(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
begin

   try


      try
         hLog.AddToLog('Import Todays Axcis For Reports ', msevOperation);

         bDebug := False;

         // Empty Out Files
         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         if not (bDebug) then begin
            dm.tblRaces.EmptyTable();
            dm.tblEntries.EmptyTable();
         end;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         OpenTable(dm.tblRaces);
         OpenTable(dm.tblEntries);
         OpenTable(dm.tblRatings);

         OpenTable(dm.tblTrack);
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblJockey);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         if not (bDebug) then begin
            iAttributes := faAnyFile;
            sPath := AXCIS_PATH;
            if bProcessAllDates then begin
               sSearch := sPath + '*p.exe';
            end else begin
               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               if gbTest then begin
                  sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
               end else begin
                  sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
               end;
               sFileName := sFileName + 'p.exe';
               sSearch := sPath + sFileName;
            end;

            UpdateStatusBar(sSearch);
            if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;

               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);
               if (sFileTrkCode <> '') then begin

                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);

                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);
                  bOk := ExtractRar(sFileName);
                  if bOk then begin
                     dtPresent := Now();
                     DecodeDate(dtPresent, wYear, wMonth, wDay);
                     wDay := atow(sRaceDD);
                     wMonth := atow(sRaceMM);
                     if bProcessAllDates then begin
                        dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                     end else begin
                        dtAxcisRaceDate := dtDownloadDate;
                     end;

                     sRaceDbfName := 'racedp.dbf';
                     sEntryDbfName := 'thr2dp.dbf';
                     sTrainerDbfName := 'thrtdp.dbf';
                     sJockeyDbfName := 'thrjdp.dbf';
                     sDamDbfName := 'thrddp.dbf';
                     sSireDbfName := 'thrsdp.dbf';
                     sPastDbfName := 'thrrdp.dbf';
                     sMatchupDbfName := 'thrmdp.dbf';

                     try
                        ImportAxcisTodayRaceEntry(sRaceDbfName,
                           sEntryDbfName,
                           sDamDbfName,
                           sSireDbfName,
                           sPastDbfName,
                           sMatchupDbfName,
                           sTrainerDbfName,
                           sJockeyDbfName
                           );
                     except
                        on E: Exception do
                           hLog.AddToLog(E.Message, msevException);
                     end;
                  end;
               end;

               while (FindNext(tsFile) = 0) do begin
                  iEndPos := SmartPos('.', tsFile.Name);
                  iStartPos := iEndPos - 5;

                  sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
                  sFileTrkCode := UpperCase(sFileTrkCode);

                  if (sFileTrkCode <> '') then begin
                     sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                     sRaceMM := CopyStr(sTmp, 1, 2);
                     sRaceDD := CopyStr(sTmp, 3, 2);

                     sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                     iLen := Length(sTmp);
                     sTmp := CopyStr(sTmp, 9, iLen - 8);
                     sFileName := sPath + sTmp;
                     sFileName := UpperCase(sFileName);
                     bOk := ExtractRar(sFileName);
                     if bOk then begin
                        dtPresent := Now();
                        DecodeDate(dtPresent, wYear, wMonth, wDay);
                        wDay := atow(sRaceDD);
                        wMonth := atow(sRaceMM);
                        if bProcessAllDates then begin
                           dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                        end else begin
                           dtAxcisRaceDate := dtDownloadDate;
                        end;

                        sRaceDbfName := 'racedp.dbf';
                        sEntryDbfName := 'thr2dp.dbf';
                        sTrainerDbfName := 'thrtdp.dbf';
                        sJockeyDbfName := 'thrjdp.dbf';
                        sDamDbfName := 'thrddp.dbf';
                        sSireDbfName := 'thrsdp.dbf';
                        sPastDbfName := 'thrrdp.dbf';
                        sMatchupDbfName := 'thrmdp.dbf';

                        try
                           ImportAxcisTodayRaceEntry(sRaceDbfName,
                              sEntryDbfName,
                              sDamDbfName,
                              sSireDbfName,
                              sPastDbfName,
                              sMatchupDbfName,
                              sTrainerDbfName,
                              sJockeyDbfName
                              );
                        except
                           on E: Exception do
                              hLog.AddToLog(E.Message, msevException);
                        end;
                     end;
                  end;
               end;
            end;
            FindClose(tsFile);

            try
               SireInfo(dm.tblRaces, dm.tblEntries, dm.tblRatings, dm.tblTrack, pnlPrgBar, prgBar, staBar);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         try
            gbOpenCloseFiles := True;
            OpenTable(dm.tblBank);
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblPP);
            OpenTable(dm.tblRH);
            OpenTable(dm.tblHH);
            OpenTable(dm.tblRankingStats);
            OpenTable(dm.tblRankingStatsByTrk);
            OpenTable(dm.tblFinalOrder);
            OpenTable(dm.tblTrack);
            OpenTable(dm.tblTrainer);
            OpenTable(dm.tblJockey);
            OpenTable(dm.tblOwner);
            OpenTable(dm.tblSire);
            OpenTable(dm.tblTrackLeaders);
            OpenTable(dm.tblGimmicks);
            OpenTable(dm.tblWagers);
            gbOpenCloseFiles := False;

            try
               UpdatePacePos(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateQSPAndKSP(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateCalibration(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateAngles(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //ImportTSNToday(Sender);
            ImportHDWToday(Sender);

            SetRanking(dm.tblEntries, 'ByLastSpeedRank', 'LastSpeedRank', 'LastSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByBackSpeedRank', 'BackSpeedRank', 'BackSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            //      SetRankingDouble(dm.tblEntries, 'ByLastClassRank', 'LastClassRank', 'LastClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
      //            SetRankingDouble(dm.tblEntries, 'ByBackClassRank', 'BackClassRank', 'BackClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByPowerRank', 'PowerRank', 'Power', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            //            SetRankingDouble(dm.tblEntries, 'ByAvgClassRank', 'AvgClassRank', 'AvgClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);


            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            try
               IndexToday(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               IndexPedigree(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            gbOpenCloseFiles := False;

            //Paired
            qryUpdateEntryOwnerFromXrefTrainer();
            try
               UpdateTrnJkyOwnSireRanks(dm.tblRaces, dm.tblEntries, dm.tblTrack, dm.tblTrainer, dm.tblJockey, dm.tblOwner, dm.tblSire, dm.tblTrackLeaders, dm.tblOwnerSummary, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            try
               UpdateTotalPaceAndPoints(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            //Paired


            // ALL REGULAR INDEXING EXCEPT FINAL HAS TO BE DONE BEFORE THIS
            try
               Update_PK_SK_DK_WinPct(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               Update_PK_SK_DK_WinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            // Has to be run this way - start
            try
               UpdateNbrOfStarters(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               SetLiners(dm.tblRaces, dm.tblEntries, dm.tblRankingStats, dm.tblRankingStatsByTrk, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //  try
  //               Update_FinalOrder_WinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
  //            except
  //               on E: Exception do hLog.AddToLog(E.Message, msevException);
  //            end;
  //
  //            try
  //               Update_FinalOrder_WinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
  //            except
  //               on E: Exception do hLog.AddToLog(E.Message, msevException);
  //            end;

            try
               UpdatePaceAdvantage(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateValueChoice(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTopFigures(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            // This uses fields update in UpdateTipSelections
            //Alt surface first
            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, ALT_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateOddsProbability(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateProbabilityLines(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            // This uses TodaysWagerChoices
            try
               UpdateReportSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateWagerSelectedRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblGimmicks);
            try
               UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblGimmicks);
            gbOpenCloseFiles := False;

            try
               CreateWagers(dm.tblRaces, dm.tblEntries, dm.tblBank, dm.tblWagers, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateHHFromToday(dm.tblRaces, dm.tblEntries, dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         finally
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);

            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      gbOpenCloseFiles := True;
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPP);
      CloseTable(dm.tblRankingStats);
      CloseTable(dm.tblRankingStatsByTrk);
      CloseTable(dm.tblFinalOrder);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblOwner);
      CloseTable(dm.tblSire);
      CloseTable(dm.tblTrackLeaders);
      CloseTable(dm.tblGimmicks);
      CloseTable(dm.tblWagers);
      CloseTable(dm.tblBank);
      ClearPrgStatusBars();
   end;
end;


procedure TMainForm.ImportAxcisTodayRaceEntry(sRaceFileName: string;
   sEntryFileName: string;
   sDamFileName: string;
   sSireFileName: string;
   sPastFileName: string;
   sMatchupFileName: string;
   sTrainerFileName: string;
   sJockeyFileName: string);
var
   lRecNo: Longint;
   bFinished: Boolean;
   sSurfDisp: string;
   sCurrTrkCode: string;

begin

   try

      dmDBF.dbfRace.Active := False;
      dmDBF.dbfRace.TableName := sRaceFileName;
      dmDBF.dbfRace.FilePath := AXCIS_PATH;
      dmDBF.dbfRace.FilePathFull := AXCIS_PATH;
      dmDBF.dbfRace.Active := True;

      dmDBF.dbfEntry.Active := False;
      dmDBF.dbfEntry.TableName := sEntryFileName;
      dmDBF.dbfEntry.FilePath := AXCIS_PATH;
      dmDBF.dbfEntry.FilePathFull := AXCIS_PATH;
      dmDBF.dbfEntry.Active := True;

      dmDBF.dbfDam.Active := False;
      dmDBF.dbfDam.TableName := sDamFileName;
      dmDBF.dbfDam.FilePath := AXCIS_PATH;
      dmDBF.dbfDam.FilePathFull := AXCIS_PATH;
      dmDBF.dbfDam.Active := True;

      dmDBF.dbfSire.Active := False;
      dmDBF.dbfSire.TableName := sSireFileName;
      dmDBF.dbfSire.FilePath := AXCIS_PATH;
      dmDBF.dbfSire.FilePathFull := AXCIS_PATH;
      dmDBF.dbfSire.Active := True;

      dmDBF.dbfTrainer.Active := False;
      dmDBF.dbfTrainer.TableName := sTrainerFileName;
      dmDBF.dbfTrainer.FilePath := AXCIS_PATH;
      dmDBF.dbfTrainer.FilePathFull := AXCIS_PATH;
      dmDBF.dbfTrainer.Active := True;

      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfJockey.TableName := sJockeyFileName;
      dmDBF.dbfJockey.FilePath := AXCIS_PATH;
      dmDBF.dbfJockey.FilePathFull := AXCIS_PATH;
      dmDBF.dbfJockey.Active := True;

      dmDBF.dbfPast.Active := False;
      dmDBF.dbfPast.TableName := sPastFileName;
      dmDBF.dbfPast.FilePath := AXCIS_PATH;
      dmDBF.dbfPast.FilePathFull := AXCIS_PATH;
      dmDBF.dbfPast.Active := True;

      dmDBF.dbfMatchup.Active := False;
      dmDBF.dbfMatchup.TableName := sMatchupFileName;
      dmDBF.dbfMatchup.FilePath := AXCIS_PATH;
      dmDBF.dbfMatchup.FilePathFull := AXCIS_PATH;
      dmDBF.dbfMatchup.Active := True;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         dmDBF.dbfRace.Active := False;
         dmDBF.dbfEntry.Active := False;
         dmDBF.dbfDam.Active := False;
         dmDBF.dbfSire.Active := False;
         dmDBF.dbfTrainer.Active := False;
         dmDBF.dbfJockey.Active := False;
         dmDBF.dbfPast.Active := False;
         dmDBF.dbfMatchup.Active := False;
      end;
   end;

   try
      //      UpdateStatusBar('Loading ' + sRaceFileName);
      InitPrgBar(dmDBF.dbfRace.RecordCount);

      dmDBF.dbfRace.First;

      bFinished := False;
      while not bFinished do begin
         IncPrgBar();

         if (dmDBF.dbfRace.Eof) then begin
            bFinished := True;
         end;

         sCurrTrkCode := dmDBF.dbfRace.FieldByName('TRACK').AsString;
         sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
         if (SmartPos('q', sSurfDisp) > 0) or (SmartPos('o', sSurfDisp) > 0) then begin
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'q', '', True);
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'o', '', True);
         end;

         // Special For TDN, RD, BEU
         if sCurrTrkCode = 'TDN' then begin
            sFileTrkCode := 'TDN';
         end;
         if sCurrTrkCode = 'RD' then begin
            sFileTrkCode := 'RD';
         end;
         if sCurrTrkCode = 'BEU' then begin
            sFileTrkCode := 'BEU';
         end;

         // Skip Simulcast Races
         if (sCurrTrkCode = sFileTrkCode) then begin

            dm.tblRaces.IndexName := '';
            dm.tblRaces.SetKey();

            dm.tblRaces.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblRaces.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

            dm.tblRaces.FieldByName('RaceDate').Value := dtAxcisRaceDate;
            dm.tblRaces.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;

            UpdateStatusBar('Importing ' +
               dmDBF.dbfRace.FieldByName('TRACK').AsString + ' ' +
               dmDBF.dbfRace.FieldByName('RACE').AsString);

            lRecNo := atol(dmDBF.dbfRace.FieldByName('HORSE1').AsString);

            //*** Skip Quarter Horse Races
            sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
            if not dm.tblRaces.GotoKey() then begin
               dm.tblRaces.Append();
               FldRaceAxcisToday();
               dm.tblRaces.Post();
               ImportAxcisTodayEntry(lRecNo);
            end;
         end;
         dmDBF.dbfRace.Next();
      end;
   except
      ClearPrgStatusBars();
      dmDBF.dbfRace.Active := False;
      dmDBF.dbfEntry.Active := False;
      dmDBF.dbfDam.Active := False;
      dmDBF.dbfSire.Active := False;
      dmDBF.dbfTrainer.Active := False;
      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfPast.Active := False;
      dmDBF.dbfMatchup.Active := False;
   end;

   ClearPrgStatusBars();
   try
      dmDBF.dbfRace.Active := False;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   dmDBF.dbfEntry.Active := False;
   dmDBF.dbfDam.Active := False;
   dmDBF.dbfSire.Active := False;
   dmDBF.dbfTrainer.Active := False;
   dmDBF.dbfJockey.Active := False;
   dmDBF.dbfPast.Active := False;
   dmDBF.dbfMatchup.Active := False;
end;

//******************* TMainForm.ImportAxcisTodayEntry *************************

procedure TMainForm.ImportAxcisTodayEntry(lRecNo: Longint);
var
   bFinished: Boolean;
   sRaceNbr: string;
   sCurrRaceNbr: string;

begin
   try

      dmDBF.dbfEntry.PhysicalRecNo := lRecNo;

      sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      sCurrRaceNbr := dmDBF.dbfRace.FieldByName('RACE').AsString;

      bFinished := False;
      while (sRaceNbr = sCurrRaceNbr) and (not bFinished) do begin
         if (sRaceNbr <> sCurrRaceNbr) then begin
            exit;
         end;
         if (dmDBF.dbfEntry.Eof) then begin
            bFinished := True;
         end;

         dm.tblEntries.IndexName := 'ByHorseName';
         dm.tblEntries.SetKey();
         dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
         dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

         dm.tblEntries.FieldByName('RaceDate').Value := dtAxcisRaceDate;
         dm.tblEntries.FieldByName('RangeRaceDate').Value := dtAxcisRaceDate;
         dm.tblEntries.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
         dm.tblEntries.FieldByName('HorseName').Value := dmDBF.dbfEntry.FieldByName('HORSE_NAME').AsString;

         if dm.tblEntries.GotoKey() then begin
            dm.tblEntries.Edit();
            FldEntryAxcisToday();
            dm.tblEntries.Post();
         end else begin
            dm.tblEntries.Append();
            FldEntryAxcisToday();
            dm.tblEntries.Post();
         end;

         dmDBF.dbfEntry.Next();
         sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      end;
   finally
   end;
end;

procedure TMainForm.FldRaceAxcisToday();
var
   sTmp: string;
   sAge: string;
   sSex: string;
   sSurface: string;
   sSurfDisp: string;

   fDistanceInFurlongs: Double;
   iDistanceInYards: Integer;
   iDistanceInFeet: Integer;

   b10CentSuperfectaRace: boolean;

   sWagerTypes: string;

begin
   dm.tblEntries.FieldByName('HorseName').Value := dmDBF.dbfEntry.FieldByName('HORSE_NAME').AsString;

   dm.tblRaces.FieldByName('TypeOfRace').Value := 'T';
   sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
   if (SmartPos('q', sSurfDisp) > 0) then begin
      dm.tblRaces.FieldByName('TypeOfRace').Value := 'Q';
   end;
   if (SmartPos('o', sSurfDisp) > 0) then begin
      dm.tblRaces.FieldByName('TypeOfRace').Value := 'A';
   end;

   dm.tblRaces.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
   dm.tblRaces.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

   dm.tblRaces.FieldByName('RaceDate').Value := dtAxcisRaceDate;
   dm.tblRaces.FieldByName('RangeRaceDate').Value := dtAxcisRaceDate;
   dm.tblRaces.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;

   fDistanceInFurlongs := atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString);
   if (SmartPos('q', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) or
      (SmartPos('o', dmDBF.dbfRace.FieldByName('SURF_DISP').AsString) > 0) then begin
      if fDistanceInFurlongs > 3 then begin
         iDistanceInYards := Trunc(fDistanceInFurlongs) * 100;
         iDistanceInFeet := (iDistanceInYards * 3);
      end else begin
         iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
         iDistanceInYards := (iDistanceInFeet div 3);
      end;
   end else begin
      iDistanceInFeet := Trunc(atof(dmDBF.dbfRace.FieldByName('DISTANCE').AsString) * FEET_IN_FURLONG);
      iDistanceInYards := (iDistanceInFeet div 3);
   end;

   dm.tblRaces.FieldByName('DistanceInFeet').Value := iDistanceInFeet;
   dm.tblRaces.FieldByName('DistanceInYards').Value := iDistanceInYards;
   dm.tblRaces.FieldByName('DistanceInFurlongs').Value := fDistanceInFurlongs;
   dm.tblRaces.FieldByName('DistanceDesc').Value := GetYardDistanceDesc(iDistanceInYards);


   if fDistanceInFurlongs >= 8 then begin
      dm.tblRaces.FieldByName('IsRouteRace').Value := True;
   end;

   dm.tblRaces.FieldByName('Surface').AsString :=
      GetAxcisSurface(dmDBF.dbfRace.FieldByName('SURFACE').AsString);

   if dm.tblRaces.FieldByName('Surface').AsString = 'T' then begin
      dm.tblRaces.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
      dm.tblRaces.FieldByName('IsTurfRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'HC' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := HCP_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Handicap';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'AL' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := ALW_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Allowance';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'CL' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := CLM_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Claiming';
      dm.tblRaces.FieldByName('IsClaimingRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'OC' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := OCLM_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Optional Claiming';
      dm.tblRaces.FieldByName('IsClaimingRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MC' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := MCL_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Maiden Claiming';
      dm.tblRaces.FieldByName('IsMaidenClaimingRace').AsBoolean := True;
      dm.tblRaces.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
      dm.tblRaces.FieldByName('IsClaimingRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MD' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := MSW_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Maiden Special Weight';
      dm.tblRaces.FieldByName('IsMaidenSpecialRace').AsBoolean := True;
      dm.tblRaces.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'MS' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := MSW_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Maiden Special Weight';
      dm.tblRaces.FieldByName('IsMaidenSpecialRace').AsBoolean := True;
      dm.tblRaces.FieldByName('IsMaidenOrTurfRace').AsBoolean := True;
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'SH' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := SHCP_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Starter Handicap';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G1_RACE then begin
      dm.tblRaces.FieldByName('RaceType').AsString := G1_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Grade I';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G2_RACE then begin
      dm.tblRaces.FieldByName('RaceType').AsString := G2_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Grade II';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = G3_RACE then begin
      dm.tblRaces.FieldByName('RaceType').AsString := G3_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Grade III';
   end;

   if dmDBF.dbfRace.FieldByName('STKORCLM').AsString = 'ST' then begin
      dm.tblRaces.FieldByName('RaceType').AsString := STK_RACE;
      dm.tblRaces.FieldByName('RaceTypeDesc').AsString := 'Stake';
   end;

   dm.tblRaces.FieldByName('ClaimingPrice').Value := atof(dmDBF.dbfRace.FieldByName('CLAIMAMT').AsString);
   dm.tblRaces.FieldByName('Purse').Value := atof(dmDBF.dbfRace.FieldByName('PURSE').AsString);

   sAge := dmDBF.dbfRace.FieldByName('AGE_RESTR').AsString;
   if sAge = 'AO' then
      sAge := '02';
   if sAge = 'BO' then
      sAge := '03';
   if sAge = 'CO' then
      sAge := '04';
   if sAge = 'DO' then
      sAge := '05';
   if sAge = 'EO' then
      sAge := '34';
   if sAge = 'FO' then
      sAge := '45';
   if sAge = 'GO' then
      sAge := '35';
   if sAge = 'HO' then
      sAge := '2U';
   if sAge = 'AU' then
      sAge := '2U';
   if sAge = 'BU' then
      sAge := '3U';
   if sAge = 'CU' then
      sAge := '4U';
   if sAge = 'DU' then
      sAge := '5U';
   if sAge = 'EU' then
      sAge := '34';
   if sAge = 'FU' then
      sAge := '45';
   if sAge = 'GU' then
      sAge := '35';
   if sAge = 'HU' then
      sAge := '2U';

   if (sAge = '02') or (sAge = '2U') then begin
      dm.tblRaces.FieldByName('IsTwoYearOldRace').AsBoolean := True;
   end;

   dm.tblRaces.FieldByName('AgeSexRestriction').Value := sAge + sSex;

   sTmp := dmDBF.dbfRace.FieldByName('RTEXT1').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT2').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT3').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT4').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT5').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT6').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT7').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT8').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT9').AsString + ' ' +
      dmDBF.dbfRace.FieldByName('RTEXT10').AsString;

   dm.tblRaces.FieldByName('RaceCondition').Value := sTmp;
   dm.tblRaces.FieldByName('WagerType').Value := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);

   b10CentSuperfectaRace := False;

   sWagerTypes := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);
   if SmartPos('10 CENT SUPER', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('SUPERFECTA (10-CENT MIN)', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('10-CENT SUPER', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('.10 SUPER', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;


   if SmartPos('SUPERFECTA (TEN CENT MINIMUM)', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('SUPERFECTA(.10 CENT MINIMUM)', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('SUPERFECTA(10 CENT MINIMUM)', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;

   if SmartPos('SUPERFECTA(10 CENT)', sWagerTypes) > 0 then begin
      b10CentSuperfectaRace := True;
   end;


   if SmartPos('SUPERFECTA', sWagerTypes) > 0 then begin
      if SmartPos('TEN CENT MINIMUM', sWagerTypes) > 0 then begin
         b10CentSuperfectaRace := True;
      end;

      if SmartPos('10 CENT', sWagerTypes) > 0 then begin
         b10CentSuperfectaRace := True;
      end;

      if SmartPos('10-CENT', sWagerTypes) > 0 then begin
         b10CentSuperfectaRace := True;
      end;
      if SmartPos('.10', sWagerTypes) > 0 then begin
         b10CentSuperfectaRace := True;
      end;
      if SmartPos('1- CENT', sWagerTypes) > 0 then begin
         b10CentSuperfectaRace := True;
      end;
   end;


   dm.tblRaces.FieldByName('Is10CentSuperfectaRace').AsBoolean := b10CentSuperfectaRace;

   dm.tblRaces.FieldByName('SimulcastTrkCode').Value := dmDBF.dbfRace.FieldByName('SEND_TRACK').AsString;
   dm.tblRaces.FieldByName('SimulcastRaceNbr').Value := atoi(dmDBF.dbfRace.FieldByName('RACEORD').AsString);

   if dm.tblRaces.FieldByName('Surface').AsString = 'T' then begin
      sSurface := 'TURF';
   end else begin
      sSurface := 'DIRT';
   end;

   if dm.tblRaces.FieldByName('ClaimingPrice').AsFloat > 0 then begin
      dm.tblRaces.FieldByName('RaceDesc').AsString := 'RACE # ' +
         dm.tblRaces.FieldByName('RaceNbr').AsString + '  ' +
         dm.tblRaces.FieldByName('DistanceDesc').AsString + '  ' +
         sSurface + '  ' +
         dm.tblRaces.FieldByName('RaceTypeDesc').AsString + '  ' +
         'CLM: ' +
         dm.tblRaces.FieldByName('ClaimingPrice').AsString + '  ' +
         'PURSE: ' +
         dm.tblRaces.FieldByName('Purse').AsString + '  ' +
         'POST: ' +
         dm.tblRaces.FieldByName('EstTimeOfRace').AsString + '  ' +
         dm.tblRaces.FieldByName('RaceDate').AsString;
   end
   else begin
      dm.tblRaces.FieldByName('RaceDesc').AsString :=
         'RACE # ' +
         dm.tblRaces.FieldByName('RaceNbr').AsString + '  ' +
         dm.tblRaces.FieldByName('DistanceDesc').AsString + '  ' +
         sSurface + '  ' +
         dm.tblRaces.FieldByName('RaceTypeDesc').AsString + '  ' +
         'PURSE: ' +
         dm.tblRaces.FieldByName('Purse').AsString + '  ' +
         'POST: ' +
         dm.tblRaces.FieldByName('EstTimeOfRace').AsString + '  ' +
         dm.tblRaces.FieldByName('RaceDate').AsString;
   end;

   dm.tblRaces.FieldByName('IsPlayableValue').AsBoolean := False;

   sTmp := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);

   //
   dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 0;
   dm.tblRaces.FieldByName('Pk3RaceNbr').AsInteger := 0;
   dm.tblRaces.FieldByName('Pk4RaceNbr').AsInteger := 0;
   dm.tblRaces.FieldByName('Pk6RaceNbr').AsInteger := 0;

   //
   //   $2 DAILY DOUBLE
   if (SmartPos('DAILY DOUBLE', sTmp) > 0) or (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := True;
      iDDRace := 2;
   end;

   // RET
   if (SmartPos('/ DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := True;
      iDDRace := 2;
   end;

   if (SmartPos('FIRST HALF LATE DOUBLE', sTmp) > 0) or
      (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := True;
      iDDRace := 2;
   end;

   if (SmartPos('1ST HALF $2 DAILY DOUBLE', sTmp) > 0) or
      (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := True;
      iDDRace := 2;
   end;

   if (iDDRace > 0) then begin
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 3 - iDDRace;
      Dec(iDDRace);
   end else begin
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := False;
   end;


   //MNR
   if (SmartPos('SECOND HALF $2 LATE DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;
   if (SmartPos('SECOND HALF $2 DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   //PEN
   if (SmartPos('SECOND HALF EARLY DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   if (SmartPos('2ND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;


   if (SmartPos('2ND HALF EARLY DD', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;
   if (SmartPos('2ND HALF LATE DD', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   //
   if (SmartPos('SECOND HALF DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   if (SmartPos('2ND HALF DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   //
   if (SmartPos('SECOND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsDDLeg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsDDRace').AsBoolean := True;
      dm.tblRaces.FieldByName('DDRaceNbr').AsInteger := 2;
      iDDRace := 0;
   end;

   //
   if ((SmartPos('PICK 3', sTmp) > 0) or (SmartPos('PICK THREE', sTmp) > 0) or
      (SmartPos('PIC THREE', sTmp) > 0) or (SmartPos('BET 3', sTmp) > 0)) then begin
      dm.tblRaces.FieldByName('IsPK3Leg1').AsBoolean := True;
      iPk3Race := 3;
   end;
   if (iPk3Race > 0) then begin
      dm.tblRaces.FieldByName('IsPk3Race').AsBoolean := True;
      dm.tblRaces.FieldByName('Pk3RaceNbr').AsInteger := 4 - iPk3Race;
      Dec(iPk3Race);
   end else begin
      dm.tblRaces.FieldByName('IsPk3Race').AsBoolean := False;
   end;

   if (SmartPos('1ST LEG PICK THREE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('Pk3RaceNbr').AsInteger := 1;
      dm.tblRaces.FieldByName('IsPK3Leg1').AsBoolean := True;
      dm.tblRaces.FieldByName('IsPK3Race').AsBoolean := True;
   end;

   if (SmartPos('2ND LEG PICK THREE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('Pk3RaceNbr').AsInteger := 2;
      dm.tblRaces.FieldByName('IsPK3Leg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsPK3Race').AsBoolean := True;
   end;

   if (SmartPos('3RD LEG PICK THREE', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('Pk3RaceNbr').AsInteger := 3;
      dm.tblRaces.FieldByName('IsPK3Leg1').AsBoolean := False;
      dm.tblRaces.FieldByName('IsPK3Race').AsBoolean := True;
   end;

   //
   if (SmartPos('PICK 4', sTmp) > 0) or (SmartPos('PICK FOUR', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsPk4Leg1').AsBoolean := True;
      iPk4Race := 4;
   end;
   if (iPk4Race > 0) then begin
      dm.tblRaces.FieldByName('IsPk4Race').AsBoolean := True;
      dm.tblRaces.FieldByName('Pk4RaceNbr').AsInteger := 5 - iPk4Race;
      Dec(iPk4Race);
   end else begin
      dm.tblRaces.FieldByName('IsPk4Race').AsBoolean := False;
   end;

   //
   if (SmartPos('PICK 6', sTmp) > 0) or (SmartPos('PICK SIX', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsPk6Leg1').AsBoolean := True;
      iPk6Race := 6;
   end;
   if (iPk6Race > 0) then begin
      dm.tblRaces.FieldByName('IsPk6Race').AsBoolean := True;
      dm.tblRaces.FieldByName('Pk6RaceNbr').AsInteger := 7 - iPk6Race;
      Dec(iPk6Race);
   end else begin
      dm.tblRaces.FieldByName('IsPk6Race').AsBoolean := False;
   end;

   //
   if SmartPos('SUPERFECTA', sTmp) > 0 then begin
      dm.tblRaces.FieldByName('IsSuperRace').AsBoolean := True;
   end else begin
      dm.tblRaces.FieldByName('IsSuperRace').AsBoolean := False;
   end;

   //
   if ((SmartPos('TRIFECTA', sTmp) > 0) or (SmartPos('TRIACTOR', sTmp) > 0)) then begin
      dm.tblRaces.FieldByName('IsTriRace').AsBoolean := True;
   end else begin
      dm.tblRaces.FieldByName('IsTriRace').AsBoolean := False;
   end;

   //
   if ((SmartPos('EXACTA', sTmp) > 0) or (SmartPos('EXACTOR', sTmp) > 0) or
      (SmartPos('PERFECTA', sTmp) > 0)) then begin
      dm.tblRaces.FieldByName('IsExaRace').AsBoolean := True;
   end else begin
      dm.tblRaces.FieldByName('IsExaRace').AsBoolean := False;
   end;

   //
   if (SmartPos('QUINELLA', sTmp) > 0) then begin
      dm.tblRaces.FieldByName('IsQuiRace').AsBoolean := True;
   end else begin
      dm.tblRaces.FieldByName('IsQuiRace').AsBoolean := False;
   end;

   dm.tblRaces.FieldByName('ParTime').AsString :=
      dmDBF.dbfRace.FieldByName('PARTIM').AsString;


end;

procedure TMainForm.FldEntryAxcisToday();
var
   wYear: Word;
   wMonth: Word;
   wDay: Word;

   dtPresent: TDateTime;

   lJockeyRecNo: Longint;
   lTrainerRecNo: Longint;
   lSireRecNo: Longint;
   lDamRecNo: Longint;

   bBute: Boolean;
   bLasix: Boolean;

   iEndPos: Integer;
   iLen: Integer;

   iBotOdds: Integer;
   iTopOdds: Integer;

   sBotOdds: string;
   sTopOdds: string;

   sTmp: string;
   sSireName: string;
   sDamName: string;
   sDamSireName: string;

   sStarts: string;
   sWins: string;
   sPlcs: string;
   sShos: string;
   sItms: string;
   sRoi: string;
   sEPS: string;
   sEarn: string;

   sWinPct: string;
   sPlcPct: string;
   sShoPct: string;
   sItmPct: string;

   iStarts: Integer;
   iWins: Integer;
   iPlcs: Integer;
   iShos: Integer;

   iDistanceStarts: Integer;
   iDistanceWins: Integer;
   iDistancePlcs: Integer;
   iDistanceShos: Integer;
   lDistanceEarn: Longint;
   lDistanceEPS: Longint;

   iMudStarts: Integer;
   iMudWins: Integer;
   iMudPlcs: Integer;
   iMudShos: Integer;
   lMudEarn: Longint;
   lMudEPS: Longint;

   iDirtSprintsStarts: Integer;
   iDirtSprintsWins: Integer;
   iDirtSprintsPlcs: Integer;
   iDirtSprintsShos: Integer;
   lDirtSprintsEarn: Longint;
   lDirtSprintsEPS: Longint;

   iDirtRoutesStarts: Integer;
   iDirtRoutesWins: Integer;
   iDirtRoutesPlcs: Integer;
   iDirtRoutesShos: Integer;
   lDirtRoutesEarn: Longint;
   lDirtRoutesEPS: Longint;

   iTurfSprintsStarts: Integer;
   iTurfSprintsWins: Integer;
   iTurfSprintsPlcs: Integer;
   iTurfSprintsShos: Integer;
   lTurfSprintsEarn: Longint;
   lTurfSprintsEPS: Longint;

   iTurfRoutesStarts: Integer;
   iTurfRoutesWins: Integer;
   iTurfRoutesPlcs: Integer;
   iTurfRoutesShos: Integer;
   lTurfRoutesEarn: Longint;
   lTurfRoutesEPS: Longint;

   iTotalRoutesStarts: Integer;
   iTotalRoutesWins: Integer;
   iTotalRoutesPlcs: Integer;
   iTotalRoutesShos: Integer;

   iTotalSprintsStarts: Integer;
   iTotalSprintsWins: Integer;
   iTotalSprintsPlcs: Integer;
   iTotalSprintsShos: Integer;


   iItms: Integer;
   lEarn: Longint;
   lEPS: Longint;

   iWinPct: Integer;
   iPlcPct: Integer;
   iShoPct: Integer;
   iItmPct: Integer;

   bRouteRace: boolean;
   sSurface: string;

   sAxcisEarlyPacePos: string;
   sAxcisMiddlePacePos: string;
   sAxcisLatePacePos: string;

   fAxcisEarlyPacePos: double;
   fAxcisMiddlePacePos: double;
   fAxcisLatePacePos: double;

begin

   if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
      bRouteRace := False;
   end else begin
      bRouteRace := True;
   end;

   sSurface := dm.tblRaces.FieldByName('Surface').AsString;

   dm.tblEntries.FieldByName('RaceType').AsString := dm.tblRaces.FieldByName('RaceType').AsString;
   dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
   dm.tblEntries.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

   dm.tblEntries.FieldByName('RaceDate').Value := dtAxcisRaceDate;
   dm.tblEntries.FieldByName('RangeRaceDate').Value := dtAxcisRaceDate;
   dm.tblEntries.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
   dm.tblEntries.FieldByName('HorseName').Value := dmDBF.dbfEntry.FieldByName('HORSE_NAME').AsString;
   dm.tblEntries.FieldByName('HorseNbr').Value := atoi(dmDBF.dbfEntry.FieldByName('HN').AsString);

   dm.tblEntries.FieldByName('Owner').Value := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('OWNER_NAME').AsString));
   dm.tblEntries.FieldByName('ProgramNbr').Value := dmDBF.dbfEntry.FieldByName('PROGRAM').AsString;
   dm.tblEntries.FieldByName('ProgramNbrSort').Value := GetProgramNbrSort(dmDBF.dbfEntry.FieldByName('PROGRAM').AsString);
   dm.tblEntries.FieldByName('PostPos').Value := dmDBF.dbfEntry.FieldByName('PP').AsString;

   lJockeyRecNo := atol(dmDBF.dbfEntry.FieldByName('JN').AsString);
   if lJockeyRecNo > 0 then begin
      dmDBF.dbfJockey.PhysicalRecNo := lJockeyRecNo;
      dm.tblEntries.FieldByName('Jockey').Value := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
      dm.tblEntries.FieldByName('JkyEquibaseKey').Value := dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;

      dm.tblJockey.IndexName := '';
      dm.tblJockey.SetKey();
      dm.tblJockey.FieldByName('Jockey').AsString := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
      if not dm.tblJockey.GotoKey() then begin
         dm.tblJockey.Append();
         dm.tblJockey.FieldByName('Jockey').AsString := UpperCase(dmDBF.dbfJockey.FieldByName('JOCK_DISP').AsString);
         dm.tblJockey.FieldByName('JkyEquibaseKey').Value :=
            dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
         try
            dm.tblJockey.Post();
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end else begin
         dm.tblJockey.Edit();
         dm.tblJockey.FieldByName('JkyEquibaseKey').Value := dmDBF.dbfJockey.FieldByName('JOCKNUMB').AsString;
         try
            dm.tblJockey.Post();
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;
   end;

   lTrainerRecNo := atol(dmDBF.dbfEntry.FieldByName('TN').AsString);
   if lTrainerRecNo > 0 then begin
      dmDBF.dbfTrainer.PhysicalRecNo := lTrainerRecNo;
      dm.tblEntries.FieldByName('Trainer').Value :=
         UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
      dm.tblEntries.FieldByName('TrnEquibaseKey').Value := dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;

      dm.tblTrainer.IndexName := '';
      dm.tblTrainer.SetKey();
      dm.tblTrainer.FieldByName('Trainer').AsString :=
         UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
      if not dm.tblTrainer.GotoKey() then begin
         dm.tblTrainer.Append();
         dm.tblTrainer.FieldByName('Trainer').AsString := UpperCase(dmDBF.dbfTrainer.FieldByName('TRAN_DISP').AsString);
         dm.tblTrainer.FieldByName('TrnEquibaseKey').Value := dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
         dm.tblTrainer.Post();
      end else begin
         dm.tblTrainer.Edit();
         dm.tblTrainer.FieldByName('TrnEquibaseKey').Value :=
            dmDBF.dbfTrainer.FieldByName('TRAINNUMB').AsString;
         dm.tblTrainer.Post();
      end;
   end;

   lSireRecNo := atol(dmDBF.dbfEntry.FieldByName('SN').AsString);
   if lSireRecNo > 0 then begin
      dmDBF.dbfSire.PhysicalRecNo := lSireRecNo;
      sTmp := dmDBF.dbfSire.FieldByName('SIRENAME').AsString;
      sTmp := UpperCase(sTmp);
      if SmartPos('(', sTmp) > 0 then begin
         iEndPos := SmartPos('(', sTmp);
         sSireName := Trim(CopyStr(sTmp, 1, iEndPos - 1));
         sSireName := FastReplace(sSireName, '.', '', True);
      end else begin
         sSireName := Trim(sTmp);
         sSireName := FastReplace(sSireName, '.', '', True);
      end;

      dm.tblEntries.FieldByName('Sire').Value := Trim(CopyStr(sSireName, 1, 16));

      dm.tblEntries.FieldByName('SIRE_REC_FOAL').Value := dmDBF.dbfSire.FieldByName('REC_FOAL').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_TURF').Value := dmDBF.dbfSire.FieldByName('REC_TURF').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_2YR').Value := dmDBF.dbfSire.FieldByName('REC_2YR').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_STK').Value := dmDBF.dbfSire.FieldByName('REC_STK').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_OFFTRK').Value := dmDBF.dbfSire.FieldByName('REC_OFFTRK').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_FTS').Value := dmDBF.dbfSire.FieldByName('REC_FTS').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_OFSTRK').Value := dmDBF.dbfSire.FieldByName('REC_OFSTRK').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_DS').Value := dmDBF.dbfSire.FieldByName('REC_DS').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_DR').Value := dmDBF.dbfSire.FieldByName('REC_DR').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_TS').Value := dmDBF.dbfSire.FieldByName('REC_TS').AsString;
      dm.tblEntries.FieldByName('SIRE_REC_TR').Value := dmDBF.dbfSire.FieldByName('REC_TR').AsString;

   end;

   lDamRecNo := atol(dmDBF.dbfEntry.FieldByName('DN').AsString);
   if lDamRecNo > 0 then begin
      dmDBF.dbfDam.PhysicalRecNo := lDamRecNo;

      sTmp := dmDBF.dbfDam.FieldByName('DAMNAME').AsString;
      sTmp := UpperCase(sTmp);
      if SmartPos('(', sTmp) > 0 then begin
         iEndPos := SmartPos('(', sTmp);
         sDamName := CopyStr(sTmp, 1, iEndPos - 1);
         sDamName := FastReplace(sDamName, '.', '', True);
      end else begin
         sDamName := Trim(sTmp);
         sDamName := FastReplace(sDamName, '.', '', True);
      end;

      dm.tblEntries.FieldByName('Dam').Value := Trim(CopyStr(sDamName, 1, 16));

      dm.tblEntries.FieldByName('DAM_REC_FOAL').Value := dmDBF.dbfDam.FieldByName('REC_FOAL').AsString;
      dm.tblEntries.FieldByName('DAM_REC_TURFST').Value := dmDBF.dbfDam.FieldByName('REC_TURFST').AsString;
      dm.tblEntries.FieldByName('DAM_REC_OFFTRK').Value := dmDBF.dbfDam.FieldByName('REC_OFFTRK').AsString;
      dm.tblEntries.FieldByName('DAM_REC_FTS').Value := dmDBF.dbfDam.FieldByName('REC_FTS').AsString;
      dm.tblEntries.FieldByName('DAM_REC_2YR').Value := dmDBF.dbfDam.FieldByName('REC_2YR').AsString;
      dm.tblEntries.FieldByName('DAM_REC_STKST').Value := dmDBF.dbfDam.FieldByName('REC_STKST').AsString;
      dm.tblEntries.FieldByName('DAM_REC_OFSTRK').Value := dmDBF.dbfDam.FieldByName('REC_OFSTRK').AsString;
      dm.tblEntries.FieldByName('DAM_REC_TS').Value := dmDBF.dbfDam.FieldByName('REC_TS').AsString;
      dm.tblEntries.FieldByName('DAM_REC_TR').Value := dmDBF.dbfDam.FieldByName('REC_TR').AsString;
      dm.tblEntries.FieldByName('DAM_REC_DS').Value := dmDBF.dbfDam.FieldByName('REC_DS').AsString;
      dm.tblEntries.FieldByName('DAM_REC_DR').Value := dmDBF.dbfDam.FieldByName('REC_DR').AsString;

      sTmp := dmDBF.dbfDam.FieldByName('DAMSIRE').AsString;
      sTmp := UpperCase(sTmp);
      if SmartPos('(', sTmp) > 0 then begin
         iEndPos := SmartPos('(', sTmp);
         sDamSireName := CopyStr(sTmp, 1, iEndPos - 1);
         sDamSireName := FastReplace(sDamSireName, '.', '', True);
      end else begin
         sDamSireName := Trim(sTmp);
         sDamSireName := FastReplace(sDamSireName, '.', '', True);
      end;
      dm.tblEntries.FieldByName('DamSire').Value := Trim(CopyStr(sDamSireName,
         1, 16));
   end;

   sTmp := dmDBF.dbfEntry.FieldByName('AXCIS_ODDS').AsString;
   if SmartPos('/', sTmp) > 0 then begin
      iEndPos := SmartPos('/', sTmp);
      iLen := Length(sTmp);
      sTopOdds := CopyStr(sTmp, 1, iEndPos - 1);
      iTopOdds := atoi(sTopOdds);
      if (SmartPos('B', sTmp) > 0) or (SmartPos('L', sTmp) > 0) or
         (SmartPos('+', sTmp) > 0) or (SmartPos('-', sTmp) > 0) then begin
         sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen - iEndPos - 1));
         iBotOdds := atoi(sBotOdds);
      end else begin
         sBotOdds := CopyStr(sTmp, iEndPos + 1, (iLen - iEndPos));
         iBotOdds := atoi(sBotOdds);
      end;

      if (SmartPos('B', sTmp) > 0) then begin
         dm.tblEntries.FieldByName('ValueIndicator').AsString := '$$';
      end;
      if (SmartPos('+', sTmp) > 0) then begin
         dm.tblEntries.FieldByName('ValueIndicator').AsString := '$';
      end;
      if (SmartPos('L', sTmp) > 0) then begin
         dm.tblEntries.FieldByName('ValueIndicator').AsString := '$';
      end;

      if iBotOdds > 0 then
         dm.tblEntries.FieldByName('MorningLineTo1').Value := iTopOdds / iBotOdds
      else
         dm.tblEntries.FieldByName('MorningLine').Value := 0;
   end;

   dm.tblEntries.FieldByName('MorningLineDesc').Value := sTopOdds + '/' + sBotOdds;

   sTmp := dmDBF.dbfEntry.FieldByName('YOB').AsString;
   dm.tblEntries.FieldByName('Age').Value := atoi(dmDBF.dbfEntry.FieldByName('YOB').AsString);
   dm.tblEntries.FieldByName('Sex').Value := dmDBF.dbfEntry.FieldByName('SEX').AsString;
   dm.tblEntries.FieldByName('Weight').Value := dmDBF.dbfEntry.FieldByName('WEIGHT').AsString;
   dm.tblEntries.FieldByName('Color').Value := dmDBF.dbfEntry.FieldByName('COLOR').AsString;

   dm.tblEntries.FieldByName('Breeder').Value := UpperCase(StripOutName(dmDBF.dbfEntry.FieldByName('BREEDER').AsString));

   dm.tblEntries.FieldByName('BredIn').Value := dmDBF.dbfEntry.FieldByName('WH_FOALED').AsString;
   dm.tblEntries.FieldByName('DaysLast').Value := atoi(dmDBF.dbfEntry.FieldByName('DAYS').AsString);

   // Lifetime Record
   iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 1, 3));
   if iStarts = 0 then begin
      dm.tblEntries.FieldByName('DebutIndicator').Value := '*';
      dm.tblEntries.FieldByName('IsDebut').AsBoolean := True;
   end;
   if iStarts = 1 then begin
      dm.tblEntries.FieldByName('DebutIndicator').Value := '**';
      dm.tblEntries.FieldByName('IsDebutTwo').AsBoolean := True;
   end;

   iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 1, 3));
   if iStarts = 0 then begin
      dm.tblEntries.FieldByName('TurfIndicator').Value := '*';
   end;
   if iStarts = 1 then begin
      dm.tblEntries.FieldByName('TurfIndicator').Value := '**';
   end;

   iStarts := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 1, 3));
   if iStarts = 0 then begin
      dm.tblEntries.FieldByName('MudIndicator').Value := '*';
   end;
   if iStarts = 1 then begin
      dm.tblEntries.FieldByName('MudIndicator').Value := '**';
   end;

   sTmp := dmDBF.dbfEntry.FieldByName('MED').AsString;
   if sTmp = 'N' then begin
      dm.tblEntries.FieldByName('Med').Value := '(L)';
   end;
   if sTmp = 'L' then begin
      dm.tblEntries.FieldByName('Med').Value := '(L)';
   end;
   if sTmp = 'X' then begin
      dm.tblEntries.FieldByName('Med').Value := '';
   end;

   if sTmp = '1' then begin
      dm.tblEntries.FieldByName('Med').Value := '(L*)';
      dm.tblEntries.FieldByName('IsFirstTimeJuice').Value := True;
   end;
   if sTmp = '2' then begin
      dm.tblEntries.FieldByName('Med').Value := '(L**)';
      dm.tblEntries.FieldByName('IsSecondTimeJuice').Value := True;
   end;

   dm.tblEntries.FieldByName('Equip').Value := dmDBF.dbfEntry.FieldByName('EQUIP').AsString;
   dm.tblEntries.FieldByName('LastEquip').Value := dmDBF.dbfEntry.FieldByName('EQUIPLAST1').AsString;

   sTmp := dmDBF.dbfEntry.FieldByName('EQUIP').AsString;
   if sTmp = 'ON' then begin
      dm.tblEntries.FieldByName('IsBlinkersOn').Value := True;
   end;
   if sTmp = 'OFF' then begin
      dm.tblEntries.FieldByName('IsBlinkersOff').Value := True;
   end;

   dm.tblEntries.FieldByName('StartsWorks21').Value := atoi(dmDBF.dbfEntry.FieldByName('ST21').AsString);

   if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 3 then begin
      dm.tblEntries.FieldByName('DaysLastWork').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 1, 3));
      if dm.tblEntries.FieldByName('DaysLastWork').AsInteger > 0 then begin
         dm.tblEntries.FieldByName('DaysLastWork').AsInteger := dm.tblEntries.FieldByName('DaysLastWork').AsInteger + 1;
      end;
   end;

   if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) > 8 then begin
      dm.tblEntries.FieldByName('DaysLastWork2').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 5, 3));
      if dm.tblEntries.FieldByName('DaysLastWork2').AsInteger > 0 then begin
         dm.tblEntries.FieldByName('DaysLastWork2').AsInteger := dm.tblEntries.FieldByName('DaysLastWork2').AsInteger + 1;
      end;
   end;

   if Length(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString) >= 11 then begin
      dm.tblEntries.FieldByName('DaysLastWork3').Value := atoi(CopyStr(dmDBF.dbfEntry.FieldByName('WODAYSAGO').AsString, 9, 3));
      if dm.tblEntries.FieldByName('DaysLastWork3').AsInteger > 0 then begin
         dm.tblEntries.FieldByName('DaysLastWork3').AsInteger := dm.tblEntries.FieldByName('DaysLastWork3').AsInteger + 1;
      end;
   end;

   dm.tblEntries.FieldByName('WorkLine1').AsString := '';

   dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 0;
   if (dm.tblEntries.FieldByName('DaysLastWork').AsInteger <
      dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
      dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 1;
      dm.tblEntries.FieldByName('WorkLine1').AsString :=
         dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString;
   end;

   if (dm.tblEntries.FieldByName('DaysLastWork2').AsInteger <
      dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
      dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 2;
      dm.tblEntries.FieldByName('WorkLine1').AsString :=
         dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
         dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString;
   end;

   if (dm.tblEntries.FieldByName('DaysLastWork3').AsInteger <
      dm.tblEntries.FieldByName('DaysLast').AsInteger) then begin
      dm.tblEntries.FieldByName('NbrWorksLast').AsInteger := 3;
      dm.tblEntries.FieldByName('WorkLine1').AsString :=
         dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
         dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString + ' ' +
         dmDBF.dbfEntry.FieldByName('LAST3_WORK').AsString;
   end;

   // If first start
   if (dm.tblEntries.FieldByName('DaysLast').AsInteger = 0) then begin
      dm.tblEntries.FieldByName('WorkLine1').AsString :=
         dmDBF.dbfEntry.FieldByName('LAST_WORK').AsString + ' ' +
         dmDBF.dbfEntry.FieldByName('LAST2_WORK').AsString + ' ' +
         dmDBF.dbfEntry.FieldByName('LAST3_WORK').AsString;
   end;

   dm.tblEntries.FieldByName('WorkLine2').AsString :=
      dmDBF.dbfEntry.FieldByName('LAST7_WORK').AsString + '  ' +
      dmDBF.dbfEntry.FieldByName('LAST8_WORK').AsString + '  ' +
      dmDBF.dbfEntry.FieldByName('LAST9_WORK').AsString + '  ' +
      dmDBF.dbfEntry.FieldByName('LAST10_WRK').AsString + '  ' +
      dmDBF.dbfEntry.FieldByName('LAST11_WRK').AsString + '  ' +
      dmDBF.dbfEntry.FieldByName('LAST12_WRK').AsString;

   // Dirt Sprints
   sStarts := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 5, 3);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 9, 3);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('DSP123').AsString, 13, 3);
   sEPS := dmDBF.dbfEntry.FieldByName('S91_DS_EPS').AsString;


   //  dm.tblHorseRecords.FieldByName('DirtSprStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('DirtSprWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('DirtSprPlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('DirtSprShos').AsInteger   := atoi(sShos);
   //  dm.tblHorseRecords.FieldByName('DirtSprEPS').AsInteger    := atoi(sEPS);
   //  dm.tblHorseRecords.FieldByName('DirtSprEarnings').AsInteger :=
   //    atoi(sEPS) * atoi(sStarts);

   iDirtSprintsStarts := atoi(sStarts);
   iDirtSprintsWins := atoi(sWins);
   iDirtSprintsPlcs := atoi(sPlcs);
   iDirtSprintsShos := atoi(sShos);
   lDirtSprintsEarn := atoi(sEPS) * atoi(sStarts);
   lDirtSprintsEPS := atol(sEPS);

   // Dirt Routes
   sStarts := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 5, 3);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 9, 3);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('DRT123').AsString, 13, 3);
   sEPS := dmDBF.dbfEntry.FieldByName('S91_DR_EPS').AsString;

   //  dm.tblHorseRecords.FieldByName('DirtRteStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('DirtRteWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('DirtRtePlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('DirtRteShos').AsInteger   := atoi(sShos);
   //  dm.tblHorseRecords.FieldByName('DirtRteEPS').AsInteger    := atoi(sEPS);
   //  dm.tblHorseRecords.FieldByName('DirtRteEarnings').AsInteger :=
   //    atoi(sEPS) * atoi(sStarts);

   iDirtRoutesStarts := atoi(sStarts);
   iDirtRoutesWins := atoi(sWins);
   iDirtRoutesPlcs := atoi(sPlcs);
   iDirtRoutesShos := atoi(sShos);
   lDirtRoutesEarn := atoi(sEPS) * atoi(sStarts);
   lDirtRoutesEPS := atol(sEPS);

   // Turf Sprints
   sStarts := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 5, 3);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 9, 3);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('TSP123').AsString, 13, 3);
   sEPS := dmDBF.dbfEntry.fieldByName('S91_TS_EPS').AsString;

   //  dm.tblHorseRecords.FieldByName('TurfSprStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('TurfSprWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('TurfSprPlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('TurfSprShos').AsInteger   := atoi(sShos);
   //  dm.tblHorseRecords.FieldByName('TurfSprEPS').AsInteger    := atoi(sEPS);
   //  dm.tblHorseRecords.FieldByName('TurfSprEarnings').AsInteger :=
   //    atoi(sEPS) * atoi(sStarts);

   iTurfSprintsStarts := atoi(sStarts);
   iTurfSprintsWins := atoi(sWins);
   iTurfSprintsPlcs := atoi(sPlcs);
   iTurfSprintsShos := atoi(sShos);
   lTurfSprintsEarn := atoi(sEPS) * atoi(sStarts);
   lTurfSprintsEPS := atol(sEPS);

   // Turf Routes
   sStarts := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 5, 3);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 9, 3);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('TRT123').AsString, 13, 3);
   sEPS := dmDBF.dbfEntry.FieldByName('S91_TR_EPS').AsString;

   //  dm.tblHorseRecords.FieldByName('TurfRteStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('TurfRteWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('TurfRtePlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('TurfRteShos').AsInteger   := atoi(sShos);
   //  dm.tblHorseRecords.FieldByName('TurfRteEPS').AsInteger    := atoi(sEPS);
   //  dm.tblHorseRecords.FieldByName('TurfRteEarnings').AsInteger :=
   //    atoi(sEPS) * atoi(sStarts);

   iTurfRoutesStarts := atoi(sStarts);
   iTurfRoutesWins := atoi(sWins);
   iTurfRoutesPlcs := atoi(sPlcs);
   iTurfRoutesShos := atoi(sShos);
   lTurfRoutesEarn := atoi(sEPS) * atoi(sStarts);
   lTurfRoutesEPS := atol(sEPS);

   iTotalRoutesStarts := iTurfRoutesStarts + iDirtRoutesStarts;
   iTotalRoutesWins := iTurfRoutesWins + iDirtRoutesWins;
   iTotalRoutesPlcs := iTurfRoutesPlcs + iDirtRoutesPlcs;
   iTotalRoutesShos := iTurfRoutesShos + iDirtRoutesShos;

   iTotalSprintsStarts := iTurfSprintsStarts + iDirtSprintsStarts;
   iTotalSprintsWins := iTurfSprintsWins + iDirtSprintsWins;
   iTotalSprintsPlcs := iTurfSprintsPlcs + iDirtSprintsPlcs;
   iTotalSprintsShos := iTurfSprintsShos + iDirtSprintsShos;


   // Current Year Record
   //  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 1, 2);
   //  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 4, 2);
   //  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 7, 2);
   //  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('TY_S123'), 10, 2);
   //  sEPS    := dmDBF.dbfEntry.GetFieldByName('TY_EPS');

   //  dm.tblHorseRecords.FieldByName('CurrStarts').AsInteger   := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('CurrWins').AsInteger     := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('CurrPlcs').AsInteger     := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('CurrShos').AsInteger     := atoi(sShos);
   //  dm.tblHorseRecords.FieldByName('CurrEPS').AsInteger      := atoi(sEPS);
   //  dm.tblHorseRecords.FieldByName('CurrEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);
   //
   // Last Year Record
   //  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 1, 2);
   //  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 4, 2);
   //  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 7, 2);
   //  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LY_S123'), 10, 2);
   //  sEPS    := dmDBF.dbfEntry.GetFieldByName('LY_EPS');
   //
    //dm.tblHorseRecords.FieldByName('PrevStarts').AsInteger   := atoi(sStarts);
    //dm.tblHorseRecords.FieldByName('PrevWins').AsInteger     := atoi(sWins);
    //dm.tblHorseRecords.FieldByName('PrevPlcs').AsInteger     := atoi(sPlcs);
    //dm.tblHorseRecords.FieldByName('PrevShos').AsInteger     := atoi(sShos);
    //dm.tblHorseRecords.FieldByName('PrevEPS').AsInteger      := atoi(sEPS);
    //dm.tblHorseRecords.FieldByName('PrevEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);

    //   Dirt Sprint Record At Track
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKDS_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprPlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprShos').AsInteger := atoi(sShos);
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprEPS').AsInteger := atoi(sEPS);
    //   dm.tblHorseRecords.FieldByName('TrkDirtSprEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);

    //   Dirt Route Record At Track
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKDR_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('TrkDirtRteStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('TrkDirtRteWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('TrkDirtRtePlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('TrkDirtRteShos').AsInteger := atoi(sShos);
    //   dm.tblHorseRecords.FieldByName('TrkDirtRteEPS').AsInteger := atoi(sEPS);
    //   dm.tblHorseRecords.FieldByName('TrkDirtRteEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);

    //   Turf Sprint Record At Track
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKTS_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprPlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprShos').AsInteger := atoi(sShos);
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprEPS').AsInteger := atoi(sEPS);
    //   dm.tblHorseRecords.FieldByName('TrkTurfSprEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);

    //   Turf Route Record At Track
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('TRKTR_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('TrkTurfRteStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('TrkTurfRteWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('TrkTurfRtePlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('TrkTurfRteShos').AsInteger := atoi(sShos);
    //   dm.tblHorseRecords.FieldByName('TrkTurfRteEPS').AsInteger := atoi(sEPS);
    //   dm.tblHorseRecords.FieldByName('TrkTurfRteEarnings').AsInteger := atoi(sEPS) * atoi(sStarts);

    //   Distance Stats
    //   Dirt Distance Record
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('ODD_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('DistDirtStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('DistDirtWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('DistDirtPlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('DistDirtShos').AsInteger := atoi(sShos);

    //   Turf Distance
    //   sStarts := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 1, 2);
    //   sWins := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 4, 2);
    //   sPlcs := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 7, 2);
    //   sShos := dmDBF.dbfEntry.GetFieldByName('OTD_S123'), 10, 2);
    //
    //   dm.tblHorseRecords.FieldByName('DistTurfStarts').AsInteger := atoi(sStarts);
    //   dm.tblHorseRecords.FieldByName('DistTurfWins').AsInteger := atoi(sWins);
    //   dm.tblHorseRecords.FieldByName('DistTurfPlcs').AsInteger := atoi(sPlcs);
    //   dm.tblHorseRecords.FieldByName('DistTurfShos').AsInteger := atoi(sShos);

    // Lifetime Dirt Distance
   //  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 1, 3);
   //  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 5, 2);
   //  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 8, 2);
   //  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_DIRT'), 11, 2);
   //
   //  dm.tblHorseRecords.FieldByName('LifeDirtStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('LifeDirtWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('LifeDirtPlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('LifeDirtShos').AsInteger   := atoi(sShos);

   //  lEarn := (lDirtRoutesEPS * iDirtRoutesStarts) + (lDirtSprintsEPS * iDirtSprintsStarts);
   //  if (atoi(sStarts) > 0) then
   //  begin
   //    lEPS := lEarn div atoi(sStarts);
   //  end
   //  else
   //  begin
   //    lEPS := 0;
   //  end;
   //
   //  dm.tblHorseRecords.FieldByName('LifeDirtEarnings').Value := lEarn;
   //  dm.tblHorseRecords.FieldByName('LifeDirtEPS').Value      := lEPS;

    //** Add Turf Debut Record
   //  if (atoi(sStarts) = 0) then
   //  begin
   //    dm.tblHorseTurfDebutRecords.IndexName := '';
   //    dm.tblHorseTurfDebutRecords.SetKey();
   //    dm.tblHorseTurfDebutRecords.FieldByName('HorseName').Value :=
   //      dmDBF.dbfEntry.GetFieldByName('HORSE_NAME');
   //    if (dm.tblHorseTurfDebutRecords.GotoKey()) then
   //    begin
   //      dm.tblHorseTurfDebutRecords.Edit();
   //      dm.tblHorseTurfDebutRecords.FieldByName('Starts').AsInteger := atoi(sStarts);
   //      dm.tblHorseTurfDebutRecords.FieldByName('Wins').AsInteger   := atoi(sWins);
   //      dm.tblHorseTurfDebutRecords.FieldByName('Earnings').Value   := lEarn;
   //      dm.tblHorseTurfDebutRecords.FieldByName('SireName').Value   := Trim(sSireName);
   //      dm.tblHorseTurfDebutRecords.FieldByName('DamSireName').Value := Trim(sDamSireName);
   //      dm.tblHorseTurfDebutRecords.FieldByName('DamName').Value    := Trim(sDamName);
   //      dm.tblHorseTurfDebutRecords.Post();
   //      Application.ProcessMessages();
   //    end
   //    else
   //    begin
   //      dm.tblHorseTurfDebutRecords.Append();
   //      dm.tblHorseTurfDebutRecords.FieldByName('HorseName').Value :=
   //        dmDBF.dbfEntry.GetFieldByName('HORSE_NAME');
   //      dm.tblHorseTurfDebutRecords.FieldByName('Starts').AsInteger := atoi(sStarts);
   //      dm.tblHorseTurfDebutRecords.FieldByName('Wins').AsInteger  := atoi(sWins);
   //      dm.tblHorseTurfDebutRecords.FieldByName('Earnings').Value  := lEarn;
   //      dm.tblHorseTurfDebutRecords.FieldByName('SireName').Value  := Trim(sSireName);
   //      dm.tblHorseTurfDebutRecords.FieldByName('DamSireName').Value := Trim(sDamSireName);
   //      dm.tblHorseTurfDebutRecords.FieldByName('DamName').Value   := Trim(sDamName);
   //      dm.tblHorseTurfDebutRecords.Post();
   //      Application.ProcessMessages();
   //    end;
   //  end;
   //
   //  // Soft Turf Stats
   //  sStarts := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 1, 3);
   //  sWins   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 5, 2);
   //  sPlcs   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 8, 2);
   //  sShos   := Copy(dmDBF.dbfEntry.GetFieldByName('LT_SOFT'), 11, 2);

   //  dm.tblHorseRecords.FieldByName('LifeSoftStarts').AsInteger := atoi(sStarts);
   //  dm.tblHorseRecords.FieldByName('LifeSoftWins').AsInteger   := atoi(sWins);
   //  dm.tblHorseRecords.FieldByName('LifeSoftPlcs').AsInteger   := atoi(sPlcs);
   //  dm.tblHorseRecords.FieldByName('LifeSoftShos').AsInteger   := atoi(sShos);
   //
   // Lifetime Turf Distance
   sStarts := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 5, 2);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 8, 2);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('LT_TURF').AsString, 11, 2);

   dm.tblEntries.FieldByName('TurfStarts').AsInteger := atoi(sStarts);
   dm.tblEntries.FieldByName('TurfWins').AsInteger := atoi(sWins);
   dm.tblEntries.FieldByName('TurfPlcs').AsInteger := atoi(sPlcs);
   dm.tblEntries.FieldByName('TurfShos').AsInteger := atoi(sShos);

   lEarn := (lTurfRoutesEPS * iTurfRoutesStarts) + (lTurfSprintsEPS * iTurfSprintsStarts);
   if (atoi(sStarts) > 0) then begin
      lEPS := lEarn div atoi(sStarts);
   end else begin
      lEPS := 0;
   end;

   dm.tblEntries.FieldByName('TurfEarnings').Value := lEarn;
   dm.tblEntries.FieldByName('TurfEPS').Value := lEPS;

   // 139  EARNWET  Num     9       Horses earnings total in all off track races
   sStarts := '';
   sWins := '';
   sPlcs := '';
   sShos := '';

   sStarts := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 1, 3);
   sWins := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 5, 2);
   sPlcs := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 8, 2);
   sShos := Copy(dmDBF.dbfEntry.FieldByName('LT_MUD').AsString, 11, 2);

   dm.tblEntries.FieldByName('MudStarts').AsInteger := atoi(sStarts);
   dm.tblEntries.FieldByName('MudWins').AsInteger := atoi(sWins);
   dm.tblEntries.FieldByName('MudPlcs').AsInteger := atoi(sPlcs);
   dm.tblEntries.FieldByName('MudShos').AsInteger := atoi(sShos);

   lEarn := atol(dmDBF.dbfEntry.FieldByName('EARNWET').AsString);
   if (atoi(sStarts) > 0) then begin
      lEPS := lEarn div atoi(sStarts);
   end else begin
      lEPS := 0;
   end;
   dm.tblEntries.FieldByName('MudEarnings').Value := lEarn;
   dm.tblEntries.FieldByName('MudEPS').Value := lEPS;

   //
   sStarts := '';
   sWins := '';
   sPlcs := '';
   sShos := '';

   // 75    TRK_D_S123  Char    11      Horses record at track dirt races since '91
   //   76  TRK_T_S123  Char    11      Horses record at track turf races since '91
   //   77  TRK_W_S123  Char    11      Horses record at track off-track  since '91
   //   78  TRK_S_S123  Char    11      Horses record at track soft turf since '91
   //   79  TRKDS_S123  Char    11      Horses record all tracks dirt sprints since '91
   //   80  TRKDR_S123  Char    11      Horses record all tracks dirt routes since '91
   //   81  TRKTS_S123  Char    11      Horses record all tracks turf sprints since '91
   //   82  TRKTR_S123  Char    11      Horses record all tracks turf routes since '91
   //   83  TRKDD_S123  Char    11      Horses record at track distance/dirt
   //   84  TRKTD_S123  Char    11      Horses record at track distance/turf


   // 75    TRK_D_S123  Char    11      Horses record at track dirt races since '91
   sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 1, 2);
   sWins := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 4, 2);
   sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 7, 2);
   sShos := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_D_S123').AsString, 10, 2);

   dm.tblEntries.FieldByName('TrkStarts').AsInteger := atoi(sStarts);
   dm.tblEntries.FieldByName('TrkWins').AsInteger := atoi(sWins);
   dm.tblEntries.FieldByName('TrkPlcs').AsInteger := atoi(sPlcs);
   dm.tblEntries.FieldByName('TrkShos').AsInteger := atoi(sShos);

   sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 1, 2);
   sWins := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 4, 2);
   sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 7, 2);
   sShos := CopyStr(dmDBF.dbfEntry.FieldByName('TRK_T_S123').AsString, 10, 2);

   dm.tblEntries.FieldByName('TrkStarts').AsInteger := dm.tblEntries.FieldByName('TrkStarts').AsInteger + atoi(sStarts);
   dm.tblEntries.FieldByName('TrkWins').AsInteger := dm.tblEntries.FieldByName('TrkWins').AsInteger + atoi(sWins);
   dm.tblEntries.FieldByName('TrkPlcs').AsInteger := dm.tblEntries.FieldByName('TrkPlcs').AsInteger + atoi(sPlcs);
   dm.tblEntries.FieldByName('TrkShos').AsInteger := dm.tblEntries.FieldByName('TrkShos').AsInteger + atoi(sShos);

   // 137   EARNTRK Num 9       Horses earnings total in all races at track
   lEarn := atol(dmDBF.dbfEntry.FieldByName('EARNTRK').AsString);
   if (atoi(sStarts) > 0) then begin
      lEPS := lEarn div atoi(sStarts);
   end else begin
      lEPS := 0;
   end;
   dm.tblEntries.FieldByName('TrkEPS').Value := lEPS;


   //DSP_
   //TY_S123
   //TY_EPS


   //REC_TY

   // Lifetime Record
   sStarts := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 1, 3);
   sWins := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 5, 2);
   sPlcs := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 8, 2);
   sShos := CopyStr(dmDBF.dbfEntry.FieldByName('LT_RECORD').AsString, 11, 2);
   sEarn := CopyStr(dmDBF.dbfEntry.FieldByName('OVRAL_REC1').AsString, 27, 7);

   dm.tblEntries.FieldByName('LifeStarts').AsInteger := atoi(sStarts);
   dm.tblEntries.FieldByName('LifeWins').AsInteger := atoi(sWins);
   dm.tblEntries.FieldByName('LifePlcs').AsInteger := atoi(sPlcs);
   dm.tblEntries.FieldByName('LifeShos').AsInteger := atoi(sShos);
   dm.tblEntries.FieldByName('LifeEarnings').AsInteger := atoi(sEarn);

   sEarn := CopyStr(dmDBF.dbfEntry.FieldByName('OVRAL_REC1').AsString, 27, 7);
   lEarn := atol(sEarn);
   if (atoi(sStarts) > 0) then begin
      lEPS := lEarn div atol(sStarts);
   end else begin
      lEPS := 0;
   end;
   dm.tblEntries.FieldByName('LifeEPS').Value := lEPS;


   if (dm.tblEntries.FieldByName('AvgClass').AsFloat = 0) then begin
      dm.tblEntries.FieldByName('AvgClass').AsFloat := atof(dmDBF.dbfEntry.FieldByName('AVE_CL').AsString);
   end;

   if (dm.tblEntries.FieldByName('AvgSpeed').Value = 0) then begin
      dm.tblEntries.FieldByName('AvgSpeed').Value := atoi(dmDBF.dbfEntry.FieldByName('AVE_SP').AsString);
   end;

   dm.tblEntries.FieldByName('AvgPurse').AsFloat := atof(dmDBF.dbfEntry.FieldByName('AV_PUR_VAL').AsString);
   dm.tblEntries.FieldByName('TodaysClass').Value := atoi(dmDBF.dbfEntry.FieldByName('TODAYS_CLS').AsString);

   dm.tblEntries.FieldByName('AvgClassRating').Value := atoi(dmDBF.dbfEntry.FieldByName('AVE_CL').AsString);

   if dm.tblEntries.FieldByName('AvgSpeed').AsInteger = 0 then begin
      dm.tblEntries.FieldByName('AvgSpeed').AsInteger := dm.tblEntries.FieldByName('LastSpeed').AsInteger;
   end;
   if dm.tblEntries.FieldByName('AvgClass').AsFloat = 0 then begin
      dm.tblEntries.FieldByName('AvgClass').AsFloat := dm.tblEntries.FieldByName('TodaysClass').AsFloat;
   end;
   if dm.tblEntries.FieldByName('AvgClassRating').Value = 0 then begin
      dm.tblEntries.FieldByName('AvgClassRating').Value := dm.tblEntries.FieldByName('TodaysClass').AsFloat;
   end;

   dm.tblEntries.FieldByName('RouteStarts').AsInteger := iTotalRoutesStarts;
   dm.tblEntries.FieldByName('RouteWins').AsInteger := iTotalRoutesWins;
   dm.tblEntries.FieldByName('RoutePlcs').AsInteger := iTotalRoutesPlcs;
   dm.tblEntries.FieldByName('RouteShos').AsInteger := iTotalRoutesShos;

   dm.tblEntries.FieldByName('SprintStarts').AsInteger := iTotalSprintsStarts;
   dm.tblEntries.FieldByName('SprintWins').AsInteger := iTotalSprintsWins;
   dm.tblEntries.FieldByName('SprintPlcs').AsInteger := iTotalSprintsPlcs;
   dm.tblEntries.FieldByName('SprintShos').AsInteger := iTotalSprintsShos;

   if (iTotalRoutesStarts = 0) then begin
      if (dm.tblRaces.FieldByName('IsRouteRace').AsBoolean) then begin
         dm.tblEntries.FieldByName('RouteIndicator').Value := '*';
      end;
   end;

   if (iTotalRoutesStarts = 1) then begin
      if (dm.tblRaces.FieldByName('IsRouteRace').AsBoolean) then begin
         dm.tblEntries.FieldByName('RouteIndicator').Value := '**';
      end;
   end;

   //Todays Surface/Distance
   sTmp := dmDBF.dbfEntry.FieldByName('PACER').AsString;
   //Check for Route or Sprint
   if (Trim(sTmp) = '') then begin
      if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
         sTmp := dmDBF.dbfEntry.FieldByName('PACER_SPR').AsString;
      end else begin
         sTmp := dmDBF.dbfEntry.FieldByName('PACER_RTE').AsString;
      end;
   end;
   //If Nothing use what we have
   if (Trim(sTmp) = '') then begin
      sTmp := dmDBF.dbfEntry.FieldByName('PACER_ALL').AsString;
   end;

   iLen := Length(sTmp);
   if (iLen >= 14) then begin
      sAxcisEarlyPacePos := CopyStr(sTmp, 1, 4);
      sAxcisMiddlePacePos := CopyStr(sTmp, 6, 4);
      sAxcisLatePacePos := CopyStr(sTmp, 11, 4);
   end else begin
      sAxcisEarlyPacePos := '';
      sAxcisMiddlePacePos := '';
      sAxcisLatePacePos := '';
   end;

   fAxcisEarlyPacePos := atof(sAxcisEarlyPacePos);
   fAxcisMiddlePacePos := atof(sAxcisMiddlePacePos);
   fAxcisLatePacePos := atof(sAxcisLatePacePos);

   if fAxcisEarlyPacePos = 0 then begin
      fAxcisEarlyPacePos := 9999;
   end;
   if fAxcisMiddlePacePos = 0 then begin
      fAxcisMiddlePacePos := 9999;
   end;
   if fAxcisLatePacePos = 0 then begin
      fAxcisLatePacePos := 9999;
   end;

   dm.tblEntries.FieldByName('AxcisEarlyPacePos').AsFloat := fAxcisEarlyPacePos;
   dm.tblEntries.FieldByName('AxcisMiddlePacePos').AsFloat := fAxcisMiddlePacePos;
   dm.tblEntries.FieldByName('AxcisLatePacePos').AsFloat := fAxcisLatePacePos;

   //Todays Surface/Distance
   sTmp := dmDBF.dbfEntry.FieldByName('S_PACER').AsString;
   //Check for Route or Sprint
   if (Trim(sTmp) = '') then begin
      if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
         sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_SPR').AsString;
      end else begin
         sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_RTE').AsString;
      end;
   end;

   //If Nothing use what we have
   if (Trim(sTmp) = '') then begin
      sTmp := dmDBF.dbfEntry.FieldByName('S_PACR_ALL').AsString;
   end;
   iLen := Length(sTmp);
   if (iLen >= 17) then begin
      dm.tblEntries.FieldByName('AxcisEarlyPace').AsFloat := atof(CopyStr(sTmp, 1, 5));
      dm.tblEntries.FieldByName('AxcisMiddlePace').AsFloat := atof(CopyStr(sTmp, 7, 5));
      dm.tblEntries.FieldByName('AxcisLatePace').AsFloat := atof(CopyStr(sTmp, 13, 5));
   end else begin
      dm.tblEntries.FieldByName('AxcisEarlyPace').AsFloat := 0;
      dm.tblEntries.FieldByName('AxcisMiddlePace').AsFloat := 0;
      dm.tblEntries.FieldByName('AxcisLatePace').AsFloat := 0;
   end;

   // We will use these from now on
   dm.tblEntries.FieldByName('EarlyPacePos').AsFloat := fAxcisEarlyPacePos;
   dm.tblEntries.FieldByName('MiddlePacePos').AsFloat := fAxcisMiddlePacePos;
   dm.tblEntries.FieldByName('LatePacePos').AsFloat := fAxcisLatePacePos;

   dm.tblEntries.FieldByName('EarlyPace').AsFloat := atof(CopyStr(sTmp, 1, 5));
   dm.tblEntries.FieldByName('MiddlePace').AsFloat := atof(CopyStr(sTmp, 7, 5));
   dm.tblEntries.FieldByName('LatePace').AsFloat := atof(CopyStr(sTmp, 13, 5));

end;

procedure TMainForm.btnCreateReportsClick(Sender: TObject);
begin
   TimerOn(False);
   CreateReports(Sender);
   TimerOn(True);
end;

procedure TMainForm.CreateReports(Sender: TObject);
var
   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;
   sToFileName: string;

begin

   //
   hLog.AddToLog('Create Reports ', msevOperation);

   //
   try
      if chkCreateExportFiles.Checked then begin
         ExportFiles(Sender);
         //  FTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD)
      end;
   except
   end;


   //  try
   //         hLog.AddToLog('Delete Export Files ', msevOperation);
   //         iAttributes := faAnyFile;
   //         sSearch := EXPORT_REPORT_PATH + '*.csv';
   //         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
   //            begin
   //               repeat
   //                  sFileName := Trim(tsFile.Name);
   //                  VCLZip.FilesList.Add(sFileName);
   //               until FindNext(tsFile) <> 0;
   //               FindClose(tsFile);
   //            end;
   //         end;
   //      except
   //         FindClose(tsFile);
   //         exit;
   //      end;
   //      VCLZip.Zip;
   //  end;

      //
   if chkCreateTipReport.Checked then begin
      hLog.AddToLog('Create TSN Reports - Start', msevOperation);
      try
         if not assigned(TipReportForm) then begin
            TipReportForm := TTipReportForm.Create(Application);
         end;
         try
            TipReportForm.ShowModal;
         finally
            FreeAndNil(TipReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create TSN Reports - End', msevOperation);
   end;

  
   if chkCreateHospitalReport.Checked then begin
      hLog.AddToLog('Create Hospital Reports - Start', msevOperation);
      try
         if not assigned(HospitalReportForm) then begin
            HospitalReportForm := THospitalReportForm.Create(Application);
         end;
         try
            HospitalReportForm.ShowModal;
         finally
            FreeAndNil(HospitalReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Hospital Reports - End', msevOperation);
   end;

   if chkCreateHospitalReport.Checked then begin
      hLog.AddToLog('Create Hospital2 Reports - Start', msevOperation);
      try
         if not assigned(HospitalReport2Form) then begin
            HospitalReport2Form := THospitalReport2Form.Create(Application);
         end;
         try
            HospitalReport2Form.ShowModal;
         finally
            FreeAndNil(HospitalReport2Form);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Hospital2 Reports - End', msevOperation);
   end;
   //
   if chkCreateGimmickReport.Checked then begin
      hLog.AddToLog('Create Gimmick Reports ', msevOperation);
      try
         if not assigned(GimmickReportForm) then begin
            GimmickReportForm := TGimmickReportForm.Create(Application);
         end;
         try
            GimmickReportForm.ShowModal;
         finally
            FreeAndNil(GimmickReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Gimmick Reports - End ', msevOperation);
   end;

   //
   if chkCreateValueReport.Checked then begin

      hLog.AddToLog('Create Value Reports - Start', msevOperation);
      try
         if not assigned(ValueReportForm) then begin
            ValueReportForm := TValueReportForm.Create(Application);
         end;
         try
            ValueReportForm.ShowModal;
         finally
            FreeAndNil(ValueReportForm);
            ValueReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

      try
         if not assigned(ValueShortReportForm) then begin
            ValueShortReportForm := TValueShortReportForm.Create(Application);
         end;
         try
            ValueShortReportForm.bCreateAll := bCreateAll;
            ValueShortReportForm.ShowModal;
         finally
            FreeAndNil(ValueShortReportForm);
            ValueShortReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Value Reports - End ', msevOperation);


   end;

   //
   //if chkCreateAngleReport.Checked then begin
   //   hLog.AddToLog('Create Angle Reports ', msevOperation);
   //   try
   //      if not assigned(AngleReportForm) then begin
   //         AngleReportForm := TAngleReportForm.Create(Application);
   //      end;
   //      try
   //         AngleReportForm.ShowModal;
   //      finally
   //         FreeAndNil(AngleReportForm);
   //         AngleReportForm := nil;
   //      end;
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   hLog.AddToLog('Create Angle Reports - End ', msevOperation);
   //end;

   //
   if chkCreateSelectionReport.Checked then begin
      hLog.AddToLog('Create Selection Reports ', msevOperation);
      try
         if not assigned(SelectionReportForm) then begin
            SelectionReportForm := TSelectionReportForm.Create(Application);
         end;
         try
            SelectionReportForm.ShowModal
         finally
            FreeAndNil(SelectionReportForm);
            SelectionReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Selection Reports - End ', msevOperation);
   end;

   //
   if chkCreateWagerReport.Checked then begin
      hLog.AddToLog('Create Wager Reports ', msevOperation);
      try
         if not assigned(ValueReportForm) then begin
            ValueReportForm := TValueReportForm.Create(Application);
         end;
         try
            ValueReportForm.ShowModal;
         finally
            FreeAndNil(ValueReportForm);
            ValueReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Value Reports - End ', msevOperation);

      try
         hLog.AddToLog('Create Wager Reports ', msevOperation);
         if not assigned(WagerReportForm) then begin
            WagerReportForm := TWagerReportForm.Create(Application);
         end;
         try
            WagerReportForm.ShowModal;
         finally
            FreeAndNil(WagerReportForm);
            WagerReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Wager Reports - End ', msevOperation);
   end;

   //
   if chkCreateContestReport.Checked then begin
      hLog.AddToLog('Create Contest Reports ', msevOperation);
      try
         if not assigned(ContestReportForm) then begin
            ContestReportForm := TContestReportForm.Create(Application);
         end;
         try
            ContestReportForm.ShowModal;
         finally
            FreeAndNil(ContestReportForm);
            ContestReportForm := nil;
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      hLog.AddToLog('Create Contest Reports - End ', msevOperation);
   end;

   //
   //if chkCreateHarnessReport.Checked then begin
   //   hLog.AddToLog('Create Harness Reports ', msevOperation);
   //   try
   //      if not assigned(HarnessReportForm) then begin
   //         HarnessReportForm := THarnessReportForm.Create(Application);
   //      end;
   //      try
   //         HarnessReportForm.ShowModal;
   //      finally
   //         FreeAndNil(HarnessReportForm);
   //      end;
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   hLog.AddToLog('Create Harness Reports - End ', msevOperation);
   //end;
   //
   ////
   //if chkCreateHarnessValueReport.Checked then begin
   //   hLog.AddToLog('Create HarnessValue Reports ', msevOperation);
   //   try
   //      if not assigned(HarnessValueReportForm) then begin
   //         HarnessValueReportForm := THarnessValueReportForm.Create(Application);
   //      end;
   //      try
   //         HarnessValueReportForm.ShowModal;
   //      finally
   //         FreeAndNil(HarnessValueReportForm);
   //      end;
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   hLog.AddToLog('Create HarnessValue Reports - End ', msevOperation);
   //end;
end;


procedure TMainForm.DeleteReports();
var
   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;
   sToFileName: string;

begin

   hLog.AddToLog('Delete Reports', msevOperation);

   //
   if chkCreateTipReport.Checked then begin
      hLog.AddToLog('Delete Tip Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_TIP_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_TIP_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;

   //
   if chkCreateHospitalReport.Checked then begin
      hLog.AddToLog('Delete Hospital Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_HOSPITAL_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_HOSPITAL_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;

   if chkCreateHospitalReport.Checked then begin
      hLog.AddToLog('Delete Hospital Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_HOSPITAL_REPORT2_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_HOSPITAL_REPORT2_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;
   //
   if chkCreateGimmickReport.Checked then begin
      hLog.AddToLog('Delete Gimmick Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_GIMMICK_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_GIMMICK_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;

   //
   if chkCreateValueReport.Checked then begin
      hLog.AddToLog('Delete Tip Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_TIP_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_TIP_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;

      hLog.AddToLog('Delete Value Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_VALUE_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_VALUE_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;

      try
         iAttributes := faAnyFile;
         sSearch := PDF_VALUE_REPORT_PATH + '*.xls';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_VALUE_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;

      try
         iAttributes := faAnyFile;
         sSearch := PDF_VALUE_REPORT_PATH + '*.csv';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_VALUE_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;

      try
         iAttributes := faAnyFile;
         sSearch := PDF_VALUE_REPORT_PATH + '*.csv';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_VALUE_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;

   end;

   //
   if chkCreateHarnessValueReport.Checked then begin
      hLog.AddToLog('Delete Harness Value Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_HARNESS_VALUE_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_HARNESS_VALUE_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;

   //
   if chkCreateHarnessReport.Checked then begin
      hLog.AddToLog('Delete Harness Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_HARNESS_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_HARNESS_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;


   if chkCreateSelectionReport.Checked then begin
      hLog.AddToLog('Delete Selection Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_SELECTION_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_SELECTION_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;

   //   if chkCreateAngleReport.Checked then begin
   //      hLog.AddToLog('Delete Angle Reports ', msevOperation);
   //      try
   //         iAttributes := faAnyFile;
   //         sSearch := PDF_ANGLE_REPORT_PATH + '*.pdf';
   //         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
   //            begin
   //               repeat
   //                  sFileName := PDF_ANGLE_REPORT_PATH + tsFile.Name;
   //                  DeleteFile(sFileName);
   //               until FindNext(tsFile) <> 0;
   //               FindClose(tsFile);
   //            end;
   //         end;
   //      except
   //         FindClose(tsFile);
   //         exit;
   //      end;
   //   end;

   if chkCreateWagerReport.Checked then begin
      hLog.AddToLog('Delete Wager Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_WAGER_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_WAGER_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;


   if chkCreateContestReport.Checked then begin
      hLog.AddToLog('Delete Contest Reports ', msevOperation);
      try
         iAttributes := faAnyFile;
         sSearch := PDF_CONTEST_REPORT_PATH + '*.pdf';
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            begin
               repeat
                  sFileName := PDF_CONTEST_REPORT_PATH + tsFile.Name;
                  DeleteFile(sFileName);
               until FindNext(tsFile) <> 0;
               FindClose(tsFile);
            end;
         end;
      except
         FindClose(tsFile);
         exit;
      end;
   end;


   try
      hLog.AddToLog('Delete Results Reports ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := PDF_RESULTS_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_RESULTS_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   try
      hLog.AddToLog('Delete Summary Reports ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := PDF_SUMMARY_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_SUMMARY_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;


   try
      hLog.AddToLog('Delete Youbet Results Reports ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := PDF_YOUBET_RESULTS_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_YOUBET_RESULTS_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   try
      hLog.AddToLog('Delete Youbet Summary Reports ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := PDF_YOUBET_SUMMARY_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_YOUBET_SUMMARY_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   try
      hLog.AddToLog('Delete Export Files ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := EXPORT_REPORT_PATH + '*.csv';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := EXPORT_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   try
      hLog.AddToLog('Delete Export Files ', msevOperation);
      iAttributes := faAnyFile;
      sSearch := EXPORT_REPORT_PATH + '*.zip';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := EXPORT_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;
end;

procedure TMainForm.CopyAFile(AFrom, ATo: string);
var
   FromFileStream, ToFileStream: TFileStream;
begin

   FromFileStream := TFileStream.Create(AFrom, fmOpenRead);
   ToFileStream := TFileStream.Create(ATo, fmCreate or fmOpenWrite);
   try
      ToFileStream.CopyFrom(FromFileStream, FromFileStream.Size);
   finally
      FreeAndNil(ToFileStream);
      FreeAndNil(FromFileStream);
   end;
end;

procedure TMainForm.idFTPWork(Sender: TObject; AWorkMode: TWorkMode; const
   AWorkCount: Integer);
var
   S: string;
   TotalTime: TDateTime;
   H, M, Sec, MS: Word;
   DLTime: Double;
begin
   Application.ProcessMessages();
   TotalTime := Now - dtSTime;
   DecodeTime(TotalTime, H, M, Sec, MS);
   Sec := Sec + M * 60 + H * 3600;
   DLTime := Sec + MS / 1000;
   if DLTime > 0 then begin
      dAverageSpeed := (dAverageSpeed + (AWorkCount / 1024) / DLTime) / 2;
   end;

   S := FormatFloat('0.00 KB/s', dAverageSpeed);
   case AWorkMode of
      wmRead:
         UpdateStatusBar('Download speed ' + S);
      wmWrite:
         UpdateStatusBar('Upload speed ' + S);
   end;

   prgBar.Position := AWorkCount;
   Application.ProcessMessages();

end;

procedure TMainForm.idFTPConnected(Sender: TObject);
begin
   Application.ProcessMessages();
   UpdateStatusBar('FTP Connected ....');
   Application.ProcessMessages();
end;

procedure TMainForm.idFTPDisconnected(Sender: TObject);
begin
   Application.ProcessMessages();
   UpdateStatusBar('Disconnected ....');
   Application.ProcessMessages();
end;

procedure TMainForm.idFTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode; const
   AWorkCountMax: Integer);
begin
   bTransferringData := true;
   bAbortTransfer := false;
   dtSTime := Now;
   prgBar.Properties.Max := lwBytesToTransfer;
   dAverageSpeed := 0;
end;

procedure TMainForm.idFTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
   Application.ProcessMessages();
   UpdateStatusBar('Transfer complete.');
   Application.ProcessMessages();
   lwBytesToTransfer := 0;
   bTransferringData := false;
   prgBar.Position := 0;
   dAverageSpeed := 0;
end;

procedure TMainForm.btnFTPReportsClick(Sender: TObject);
begin
   TimerOn(False);
   FTPReports(Sender);
   TimerOn(True);
end;

procedure TMainForm.DeleteAllFTPReports(Sender: TObject);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin

   hLog.AddToLog('Delete FTP Reports ', msevOperation);

   DeleteFTPSheets(FTP_HOSPITAL_REPORT_DIR, PDF_HOSPITAL_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   DeleteFTPSheets(FTP_HOSPITAL_REPORT2_DIR, PDF_HOSPITAL_REPORT2_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   DeleteFTPSheets(FTP_TIP_REPORT_DIR, PDF_TIP_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   //   DeleteFTPSheets(FTP_GIMMICK_REPORT_DIR, PDF_GIMMICK_REPORT_PATH);
   DeleteFTPSheets(FTP_VALUE_REPORT_DIR, PDF_VALUE_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   //DeleteFTPSheets(FTP_SELECTION_REPORT_DIR, PDF_SELECTION_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   //   DeleteFTPSheets(FTP_ANGLE_REPORT_DIR, PDF_ANGLE_REPORT_PATH);
   //DeleteFTPSheets(FTP_WAGER_REPORT_DIR, PDF_WAGER_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   DeleteFTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);

end;


procedure TMainForm.FTPReports(Sender: TObject);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin


   hLog.AddToLog('FTP Reports ', msevOperation);
   //
   if chkFTPHospitalReport.Checked then begin
      FTPSheets(FTP_HOSPITAL_REPORT_DIR, PDF_HOSPITAL_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   end;

   if chkFTPHospitalReport.Checked then begin
      FTPSheets(FTP_HOSPITAL_REPORT2_DIR, PDF_HOSPITAL_REPORT2_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   end;

   //
   if chkFTPTipReport.Checked then begin
      FTPSheets(FTP_TIP_REPORT_DIR, PDF_TIP_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   end;

   //
   //if chkFTPGimmickReport.Checked then begin
  //    FTPSheets(FTP_GIMMICK_REPORT_DIR, PDF_GIMMICK_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
  // end;

   //
   if chkFTPValueReport.Checked then begin
      FTPSheets(FTP_VALUE_REPORT_DIR, PDF_VALUE_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   end;


   //
   //if chkFTPSelectionReport.Checked then begin
   //   FTPSheets(FTP_SELECTION_REPORT_DIR, PDF_SELECTION_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
  // end;


  // if chkFTPAngleReport.Checked then begin
  //    FTPSheets(FTP_ANGLE_REPORT_DIR, PDF_ANGLE_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
  // end;

   //
   //if chkFTPWagerReport.Checked then begin
    //  FTPSheets(FTP_WAGER_REPORT_DIR, PDF_WAGER_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
  // end;

   if chkFTPExportFiles.Checked then begin
      FTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD)
   end;

   //
   //if chkFTPContestReport.Checked then begin
   //   FTPSheets(FTP_CONTEST_REPORT_DIR, PDF_CONTEST_REPORT_PATH);
   //end;
   //

end;

procedure TMainForm.DeleteFTPSheets(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin
   try
      try
         hLog.AddToLog('Deleting FTP SHEETS: ' + sFtpDir, msevOperation);

         lstDir := TStringList.Create;

         if idFtp.Connected then begin
            idFTP.Disconnect;
         end;

         idFTP.Host := sFTP_HOST;
         idFTP.Username := sFTP_USERNAME;
         idFTP.Password := sFTP_PASSWORD;
         idFTP.TransferType := ftBinary;
         idFTP.Passive := True;
         idFTP.Connect;

         idFTP.ChangeDir(sFTPDir);
         sCurrDir := idFTP.RetrieveCurrentDir;
         if (SmartPos(sFTPDir, sCurrDir) > 0) then begin
            try

               idFTP.List(lstDir, '*.pdf', False);
               for iIdx := 0 to lstDir.Count - 1 do begin
                  sDirLine := lstDir.Strings[iIdx];
                  try
                     idFTP.Delete(sDirLine);
                  except
                     if idFtp.Connected then begin
                        idFTP.Disconnect;
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end else begin
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end;
                  end;
               end;
            except
            end;

         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   finally
      FreeAndNil(lstDir);
      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;
   end;


end;

procedure TMainForm.FTPExport(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin
   try

      hlog.AddToLog('Uploading FTP Export: Start ' + sFtpDir, msevOperation);

      lstDir := TStringList.Create;

      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;

      idFTP.Host := sFTP_HOST;
      idFTP.Username := sFTP_USERNAME;
      idFTP.Password := sFTP_PASSWORD;
      idFTP.TransferType := ftBinary;
      idFTP.Passive := True;
      idFTP.Connect;

      idFTP.ChangeDir(sFTPDir);
      sCurrDir := idFTP.RetrieveCurrentDir;
      if (SmartPos(sFTPDir, sCurrDir) > 0) then begin
         try
            idFTP.List(lstDir, '*.csv', False);
            for iIdx := 0 to lstDir.Count - 1 do begin
               sDirLine := lstDir.Strings[iIdx];
               try
                  idFTP.Delete(sDirLine);
               except
                  if idFtp.Connected then begin
                     idFTP.Disconnect;
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end else begin
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end;
               end;
            end;
         except
         end;

         try
            idFTP.List(lstDir, '*.zip', False);
            for iIdx := 0 to lstDir.Count - 1 do begin
               sDirLine := lstDir.Strings[iIdx];
               try
                  idFTP.Delete(sDirLine);
               except
                  if idFtp.Connected then begin
                     idFTP.Disconnect;
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end else begin
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end;
               end;
            end;
         except
         end;

         try
            iAttributes := faAnyFile;
            sSearch := sLocalDir + '*.csv';
            if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
               begin
                  repeat
                     sFileName := sLocalDir + tsFile.Name;
                     try
                        if idFtp.Connected then begin
                           idFTP.Disconnect;
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                           idFTP.Put(sFileName, tsFile.Name);
                        end;
                        hlog.AddToLog('FTP Done ' + sFileName, msevOperation);
                     except
                        hlog.AddToLog('FTP Error' + sFileName, msevException);
                        if idFtp.Connected then begin
                           idFTP.Disconnect;
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                        end else begin
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                        end;
                     end;
                  until FindNext(tsFile) <> 0;
                  FindClose(tsFile);
               end;
            end;
         except
            FindClose(tsFile);
         end; end;
      hlog.AddToLog('Uploading FTP Export: End ' + sFtpDir, msevOperation);

   finally
      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;
      FreeAndNil(lstDir);
   end;

end;

procedure TMainForm.DeleteFTPExport(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin
   try
      try
         hlog.AddToLog('Deleting FTP SHEETS: ' + sFtpDir, msevOperation);

         lstDir := TStringList.Create;

         if idFtp.Connected then begin
            idFTP.Disconnect;
         end;

         idFTP.Host := sFTP_HOST;
         idFTP.Username := sFTP_USERNAME;
         idFTP.Password := sFTP_PASSWORD;
         idFTP.TransferType := ftBinary;
         idFTP.Passive := True;
         idFTP.Connect;

         idFTP.ChangeDir(sFTPDir);
         sCurrDir := idFTP.RetrieveCurrentDir;
         if (SmartPos(sFTPDir, sCurrDir) > 0) then begin
            try

               idFTP.List(lstDir, '*.xls', False);
               for iIdx := 0 to lstDir.Count - 1 do begin
                  sDirLine := lstDir.Strings[iIdx];
                  try
                     idFTP.Delete(sDirLine);
                  except
                     if idFtp.Connected then begin
                        idFTP.Disconnect;
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end else begin
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end;
                  end;
               end;

               idFTP.List(lstDir, '*.csv', False);
               for iIdx := 0 to lstDir.Count - 1 do begin
                  sDirLine := lstDir.Strings[iIdx];
                  try
                     idFTP.Delete(sDirLine);
                  except
                     if idFtp.Connected then begin
                        idFTP.Disconnect;
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end else begin
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end;
                  end;
               end;

               idFTP.List(lstDir, '*.zip', False);
               for iIdx := 0 to lstDir.Count - 1 do begin
                  sDirLine := lstDir.Strings[iIdx];
                  try
                     idFTP.Delete(sDirLine);
                  except
                     if idFtp.Connected then begin
                        idFTP.Disconnect;
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end else begin
                        idFTP.Connect;
                        idFTP.ChangeDir(sFTPDir);
                     end;
                  end;
               end;


            except
            end;

         end;
      except
         on E: Exception do hlog.AddToLog(E.Message, msevException);
      end;

   finally
      FreeAndNil(lstDir);
      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;
   end;


end;



procedure TMainForm.FTPSheets(sFtpDir: string; sLocalDir: string; sFTP_HOST: string; sFTP_USERNAME: string; sFTP_PASSWORD: string);
var
   sCurrDir: string;
   sDirLine: string;

   iIdx: integer;
   lstDir: TStringList;

   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin
   try

      hLog.AddToLog('Uploading FTP SHEETS: Start ' + sFtpDir, msevOperation);

      lstDir := TStringList.Create;

      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;

      idFTP.Host := sFTP_HOST;
      idFTP.Username := sFTP_USERNAME;
      idFTP.Password := sFTP_PASSWORD;
      idFTP.TransferType := ftBinary;
      idFTP.Passive := True;
      idFTP.Connect;

      idFTP.ChangeDir(sFTPDir);
      sCurrDir := idFTP.RetrieveCurrentDir;
      if (SmartPos(sFTPDir, sCurrDir) > 0) then begin
         try
            idFTP.List(lstDir, '*.pdf', False);
            for iIdx := 0 to lstDir.Count - 1 do begin
               sDirLine := lstDir.Strings[iIdx];
               try
                  idFTP.Delete(sDirLine);
               except
                  if idFtp.Connected then begin
                     idFTP.Disconnect;
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end else begin
                     idFTP.Connect;
                     idFTP.ChangeDir(sFTPDir);
                  end;
               end;
            end;
         except
         end;

         try
            iAttributes := faAnyFile;
            sSearch := sLocalDir + '*.pdf';
            if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
               begin
                  repeat
                     sFileName := sLocalDir + tsFile.Name;
                     try
                        if idFtp.Connected then begin
                           idFTP.Disconnect;
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                           idFTP.Put(sFileName, tsFile.Name);
                        end;
                        hLog.AddToLog('FTP Done ' + sFileName, msevOperation);
                     except
                        hLog.AddToLog('FTP Error' + sFileName, msevException);
                        if idFtp.Connected then begin
                           idFTP.Disconnect;
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                        end else begin
                           idFTP.Connect;
                           idFTP.ChangeDir(sFTPDir);
                        end;
                     end;
                  until FindNext(tsFile) <> 0;
                  FindClose(tsFile);
               end;
            end;
         except
            FindClose(tsFile);
         end;
      end;
      hLog.AddToLog('Uploading FTP SHEETS: End ' + sFtpDir, msevOperation);

   finally
      if idFtp.Connected then begin
         idFTP.Disconnect;
      end;
      FreeAndNil(lstDir);
   end;

end;

procedure TMainForm.mnuFileExitClick(Sender: TObject);
begin
   Close();
end;


//******************* TMainForm.btnCreUpdPicksClick *************************

procedure TMainForm.btnCreUpdHHRHClick(Sender: TObject);
var
   bGotAllRecs: boolean;
begin

end;

procedure TMainForm.btnQueryClick(Sender: TObject);
begin
end;

//******************* TMainForm.btnUpdRatingsClick *************************

procedure TMainForm.idHTTPConnected(Sender: TObject);
begin

   UpdateStatusBar('HTTP Connected : ');
   Application.ProcessMessages;

end;

procedure TMainForm.idHTTPDisconnected(Sender: TObject);
begin

   UpdateStatusBar('HTTP Disconnected');
   Application.ProcessMessages;

end;

procedure TMainForm.idHTTPStatus(ASender: TObject;
   const AStatus: TIdStatus; const AStatusText: string);
begin
   UpdateStatusBar(AStatusText);
end;

procedure TMainForm.idHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
   const AWorkCount: Integer);
var
   S: string;
   TotalTime: TDateTime;
   H, M, Sec, MS: Word;
   DLTime: Double;
begin
   TotalTime := Now - dtSTime;
   DecodeTime(TotalTime, H, M, Sec, MS);
   Sec := Sec + M * 60 + H * 3600;
   DLTime := Sec + MS / 1000;
   if DLTime > 0 then begin
      dAverageSpeed := (dAverageSpeed + (AWorkCount / 1024) / DLTime) / 2;
   end;

   S := FormatFloat('0.00 KB/s', dAverageSpeed);
   case AWorkMode of
      wmRead:
         UpdateStatusBar('Download speed ' + S);
      wmWrite:
         UpdateStatusBar('Upload speed ' + S);
   end;

   prgBar.Position := AWorkCount;

end;

procedure TMainForm.idHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
   const AWorkCountMax: Integer);
begin
   bTransferringData := true;
   bAbortTransfer := false;
   dtSTime := Now;
   prgBar.Properties.Max := lwBytesToTransfer;
   dAverageSpeed := 0;

end;

procedure TMainForm.idHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
   UpdateStatusBar('Transfer complete.');
   lwBytesToTransfer := 0;
   bTransferringData := false;
   prgBar.Position := 0;
   dAverageSpeed := 0;
end;

procedure TMainForm.btnTestClick(Sender: TObject);
begin
end;

//******************* TMainForm.GetProgramNbrSort *************************

function TMainForm.GetWagerNbr(sProgNbrIn: string): Integer;
var
   sProgNbr: string;

begin

   sProgNbr := Trim(UpperCase(sProgNbrIn));

   Result := 0;

   if sProgNbr = '1' then
      Result := 1;
   if sProgNbr = '2' then
      Result := 2;
   if sProgNbr = '3' then
      Result := 3;
   if sProgNbr = '4' then
      Result := 4;
   if sProgNbr = '5' then
      Result := 5;
   if sProgNbr = '6' then
      Result := 6;
   if sProgNbr = '7' then
      Result := 7;
   if sProgNbr = '8' then
      Result := 8;
   if sProgNbr = '9' then
      Result := 9;
   if sProgNbr = '10' then
      Result := 10;
   if sProgNbr = '11' then
      Result := 11;
   if sProgNbr = '12' then
      Result := 12;
   if sProgNbr = '13' then
      Result := 13;
   if sProgNbr = '14' then
      Result := 14;
   if sProgNbr = '15' then
      Result := 15;
   if sProgNbr = '16' then
      Result := 16;
   if sProgNbr = '17' then
      Result := 17;
   if sProgNbr = '18' then
      Result := 18;
   if sProgNbr = '19' then
      Result := 19;
   if sProgNbr = '20' then
      Result := 20;

   if sProgNbr = '1A' then
      Result := 1;
   if sProgNbr = '1B' then
      Result := 1;
   if sProgNbr = '1C' then
      Result := 1;
   if sProgNbr = '1F' then
      Result := 1;
   if sProgNbr = '1X' then
      Result := 1;

   if sProgNbr = '2A' then
      Result := 2;
   if sProgNbr = '2B' then
      Result := 2;
   if sProgNbr = '2C' then
      Result := 2;
   if sProgNbr = '2F' then
      Result := 2;
   if sProgNbr = '2X' then
      Result := 2;

   if sProgNbr = '3A' then
      Result := 3;
   if sProgNbr = '3B' then
      Result := 3;
   if sProgNbr = '3C' then
      Result := 3;
   if sProgNbr = '3F' then
      Result := 3;
   if sProgNbr = '3X' then
      Result := 3;

   if sProgNbr = '11A' then
      Result := 11;
   if sProgNbr = '11B' then
      Result := 11;
   if sProgNbr = '11C' then
      Result := 11;
   if sProgNbr = '11D' then
      Result := 11;
   if sProgNbr = '11E' then
      Result := 11;
   if sProgNbr = '11F' then
      Result := 11;
   if sProgNbr = '11G' then
      Result := 11;
   if sProgNbr = '11X' then
      Result := 11;

   if sProgNbr = '10A' then
      Result := 10;
   if sProgNbr = '10B' then
      Result := 10;
   if sProgNbr = '10C' then
      Result := 10;
   if sProgNbr = '10D' then
      Result := 10;
   if sProgNbr = '10E' then
      Result := 10;
   if sProgNbr = '10F' then
      Result := 10;
   if sProgNbr = '10G' then
      Result := 10;
   if sProgNbr = '10X' then
      Result := 10;

   if sProgNbr = '12A' then
      Result := 12;
   if sProgNbr = '12B' then
      Result := 12;
   if sProgNbr = '12C' then
      Result := 12;
   if sProgNbr = '12D' then
      Result := 12;
   if sProgNbr = '12E' then
      Result := 12;
   if sProgNbr = '12F' then
      Result := 12;
   if sProgNbr = '12G' then
      Result := 12;
   if sProgNbr = '12X' then
      Result := 12;

   if sProgNbr = '13A' then
      Result := 13;
   if sProgNbr = '13B' then
      Result := 13;
   if sProgNbr = '13C' then
      Result := 13;
   if sProgNbr = '13D' then
      Result := 13;
   if sProgNbr = '13E' then
      Result := 13;
   if sProgNbr = '13F' then
      Result := 13;
   if sProgNbr = '13G' then
      Result := 13;
   if sProgNbr = '13X' then
      Result := 13;

   if sProgNbr = '14A' then
      Result := 14;
   if sProgNbr = '14B' then
      Result := 14;
   if sProgNbr = '14C' then
      Result := 14;
   if sProgNbr = '14D' then
      Result := 14;
   if sProgNbr = '14E' then
      Result := 14;
   if sProgNbr = '14F' then
      Result := 14;
   if sProgNbr = '14G' then
      Result := 14;
   if sProgNbr = '14X' then
      Result := 14;

   if sProgNbr = '15A' then
      Result := 15;
   if sProgNbr = '15B' then
      Result := 15;
   if sProgNbr = '15C' then
      Result := 15;
   if sProgNbr = '15D' then
      Result := 15;
   if sProgNbr = '15E' then
      Result := 15;
   if sProgNbr = '15F' then
      Result := 15;
   if sProgNbr = '15G' then
      Result := 15;
   if sProgNbr = '15X' then
      Result := 15;

   if sProgNbr = '16A' then
      Result := 16;
   if sProgNbr = '16B' then
      Result := 16;
   if sProgNbr = '16C' then
      Result := 16;
   if sProgNbr = '16D' then
      Result := 16;
   if sProgNbr = '16E' then
      Result := 16;
   if sProgNbr = '16F' then
      Result := 16;
   if sProgNbr = '16G' then
      Result := 16;
   if sProgNbr = '16X' then
      Result := 16;

end;

function TMainForm.TrackNotPlayable(sTrkCode: string): boolean;
begin

   Result := True;

   if (dm.tblEntries.FieldByName('TrkCode').AsString = 'PM') then begin
      Result := False;
   end;

end;

procedure TMainForm.btnDownloadEquibaseResultsClick(Sender: TObject);
begin
   TimerOn(False);
   DownloadEquibaseResults(Sender);
   TimerOn(True);
end;

procedure TMainForm.DownloadEquibaseResults(Sender: TObject);
var
   sTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLResultsToEquibase();
   begin

      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin
         dm.tblEquibase.Edit();

         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();

      end else begin
         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;

         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();
      end;

   end;

begin

   hLog.AddToLog('DownloadEquibaseResults', msevOperation);

   try
      CheckProxy();

      //   if LOCATION = 'Home' then begin
      //      idHTTP.ProxyParams.ProxyServer := 'localhost';
      //      idHTTP.ProxyParams.ProxyPort := 8080;
      //   end;

      OpenTable(dm.tblTrack);
      OpenTable(dm.tblVendor);
      OpenTable(dm.tblEquibase);
      OpenTable(dm.tblProcessed);

      //*****
      try

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         InitPrgBar(dm.tblTrack.RecordCount);
         dm.tblTrack.First();

         while not dm.tblTrack.Eof do begin
            IncPrgBar();
            sStatusBar := 'Download Equibase Results';
            Application.ProcessMessages();
            try
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
               dm.tblVendor.FieldByName('Product').AsString := 'Results';
               if (dm.tblVendor.GotoKey()) then begin
                  sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sTrkCode := Trim(sTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := EQUIBASE_RESULTS_PATH;

                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

                  idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;

                  if gbUseOverrideDate then begin
                     dtDownloadDate := edtOverrideDate.Date;
                  end else begin
                     dtDownloadDate := Now() - 1;
                  end;
                  DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

                  //
                  dm.tblProcessed.IndexName := '';
                  dm.tblProcessed.SetKey();
                  dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
                  dm.tblProcessed.FieldByName('RaceDate').Value :=
                     dtDownloadDate;
                  if (not dm.tblProcessed.GotoKey()) then begin
                     dm.tblTrack.Next();
                     continue;
                  end else begin
                     if
                        (dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean) then begin
                        dm.tblTrack.Next();
                        continue;
                     end;
                  end;
                  //

                  sFileName := sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
                  sDownloadFullFileName := sDownloadLocation + sFileName;

                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                     then begin
                     if (tsFile.Size < MIN_EQUIBASE_FILE_SIZE) then begin
                        DeleteFile(sDownloadFullFileName);
                        Application.ProcessMessages();
                     end;
                  end;
                  FindClose(tsFile);

                  sServerFullFileName := sBaseImportPath + 'TRK=' + sTrkCode;
                  if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                     sServerFullFileName := sServerFullFileName + '&CY=USA';
                  end;
                  if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                     sServerFullFileName := sServerFullFileName + '&CY=CAN';
                  end;
                  sServerFullFileName := sServerFullFileName + '&DATE=';
                  sServerFullFileName := sServerFullFileName + sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4);
                  sServerFullFileName := sServerFullFileName + '&STYLE=EQB';

                  lblServerPath.Caption := sServerFullFileName;
                  lblLocalPath.Caption := sDownloadFullFileName;

                  if FileExists(sDownloadFullFileName) then begin
                     AddHTMLResultsToEquibase();
                  end else begin
                     if (DownLoadFile(sServerFullFileName,
                        sDownloadFullFileName)) then begin
                        AddHTMLResultsToEquibase();
                        staBar.SimpleText := sDownloadFullFileName;
                        Application.ProcessMessages();
                     end;
                  end;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            Sleep(SLEEP_LONG);
            dm.tblTrack.Next();
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
         //         CloseTable(dm.tblEquibase);
         //         CloseTable(dm.tblTrack);
         //         CloseTable(dm.tblVendor);
         //         CloseTable(dm.tblProcessed);
         //
         //         lblServerPath.Caption := '';
         //         lblLocalPath.Caption := '';
         //         lblServerPath.Visible := False;
         //         lblLocalPath.Visible := False;
         //         ClearPrgStatusBars();
         //         Exit;
      end;
   finally
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblEquibase);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
   end;
end;


procedure TMainForm.btnDownloadEquibaseChartsClick(Sender: TObject);
begin
   TimerOn(False);
   DownloadEquibaseCharts(Sender);
   TimerOn(True);
end;

procedure TMainForm.DownloadEquibaseCharts(Sender: TObject);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;
   sTrkCode: string;
   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLChartsToEquibase();
   begin

      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin
         dm.tblEquibase.Edit();

         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;

         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();
      end else begin
         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;

         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.Edit();
         dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
         dm.tblProcessed.Post();

      end;
   end;

begin

   hLog.AddToLog('DownloadEquibaseCharts', msevOperation);
   try
      CheckProxy();

      if LOCATION = 'Exit' then begin
         idHTTP.ProxyParams.ProxyServer := 'localhost';
         idHTTP.ProxyParams.ProxyPort := 8080;
      end;

      idHTTP.ProxyParams.ProxyServer := 'localhost';
      idHTTP.ProxyParams.ProxyPort := 8080;

      OpenTable(dm.tblTrack);
      OpenTable(dm.tblVendor);
      OpenTable(dm.tblEquibase);
      OpenTable(dm.tblProcessed);

      try
         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         InitPrgBar(dm.tblTrack.RecordCount);
         dm.tblTrack.First();

         while not dm.tblTrack.Eof do begin
            IncPrgBar();
            sStatusBar := 'Download Equibase Charts';
            Application.ProcessMessages();
            try
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
               dm.tblVendor.FieldByName('Product').AsString := 'Charts';
               if (dm.tblVendor.GotoKey()) then begin
                  sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sTrkCode := Trim(sTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := EQUIBASE_CHARTS_PATH;

                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;


                  idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;

                  if gbUseOverrideDate then begin
                     dtDownloadDate := edtOverrideDate.Date;
                  end else begin
                     dtDownloadDate := Now() - 1;
                  end;

                  DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

                  // Check file was downloaded and imported
                  dm.tblProcessed.IndexName := '';
                  dm.tblProcessed.SetKey();
                  dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
                  dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
                  if (not dm.tblProcessed.GotoKey()) then begin
                     dm.tblTrack.Next();
                     continue;
                  end else begin
                     if
                        (dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean) then begin
                        dm.tblTrack.Next();
                        continue;
                     end;
                  end;
                  //

                  sFileName := sm.Str(wYear, 5) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
                  sDownloadFullFileName := sDownloadLocation + sFileName;
                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                     then begin
                     if (tsFile.Size < 20000) then begin
                        DeleteFile(sDownloadFullFileName);
                        Application.ProcessMessages();
                     end;
                  end;
                  FindClose(tsFile);
                  //http://www.equibase.com/premium/eqbPDFChart.cfm?TID=ALB&CTRY=USA&DAY=D&DT=05/27/2006&STYLE=EQB&RACE=A&BorP=B
                  //http://www.equibase.com/premium/eqbPDFChart.cfm?TID=HAW&CTRY=USA&DAY=D&DT=10/14/2005&STYLE=EQB&RACE=A&BorP=B
                  sServerFullFileName := sBaseImportPath + 'TID=' + sTrkCode;
                  if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                     sServerFullFileName := sServerFullFileName + '&CTRY=USA';
                  end;
                  if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                     sServerFullFileName := sServerFullFileName + '&CTRY=CAN';
                  end;
                  sServerFullFileName := sServerFullFileName + '&DAY=D&DT=';
                  sServerFullFileName := sServerFullFileName + sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4);
                  sServerFullFileName := sServerFullFileName + '&STYLE=EQB&RACE=A&BorP=B';

                  lblServerPath.Caption := sServerFullFileName;
                  lblLocalPath.Caption := sDownloadFullFileName;

                  if FileExists(sDownloadFullFileName) then begin
                     dm.tblProcessed.Edit();
                     dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
                     dm.tblProcessed.Post();
                     dm.tblProcessed.FlushBuffers();

                     //                     AddHTMLChartsToEquibase();
                  end else begin
                     //http://www.equibase.com/premium/eqbPDFChart.cfm?TID=HAW&CTRY=USA&DAY=D&DT=10/14/2005&STYLE=EQB&RACE=A&BorP=B
                     if (DownLoadFile(sServerFullFileName, sDownloadFullFileName)) then begin
                        //                        AddHTMLChartsToEquibase();
                        dm.tblProcessed.Edit();
                        dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean := True;
                        dm.tblProcessed.Post();
                        staBar.SimpleText := sDownloadFullFileName;
                        Application.ProcessMessages();
                     end;
                  end;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            idHTTP.Disconnect;
            Sleep(SLEEP_LONG);
            dm.tblTrack.Next();
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblEquibase);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();

   end;
end;




procedure TMainForm.qrySQLQueryProgress(Sender: TObject;
   PercentDone: Word; var AbortQuery: Boolean);
begin
   prgBar.Position := PercentDone;
   if bAbortQuery then begin
      AbortQuery := True;
   end;
   Application.ProcessMessages();
end;

procedure TMainForm.qrySQLNewRecord(DataSet: TDataSet);
begin
   Application.ProcessMessages();
end;

procedure TMainForm.timChkTimer(Sender: TObject);
var
   iDayOfTheWeek: Integer;
   iLastDayProcessed: Integer;
   sLastDayProcessed: string;
   iniFile: TIniFile;
   Present: TDateTime;
   wHour, wMin, wSec, wMSec: Word;
   iLastHourProcessed: integer;
   iResultsProcessed: integer;
   sLocation: string;

begin
   try
      if chkSuppressAutomaticProcessing.Checked then begin
         exit;
      end;

      iniFile := TIniFile.Create(INI_FILE);
      iDayOfTheWeek := DayOfTheWeek(Now());

      sLocation := iniFile.ReadString('Processing', 'Location', 'Work');
      if sLocation = 'Testing' then begin
         FreeAndNil(iniFile);
         Application.Terminate;
      end;

      if sLocation = 'Exit' then begin
         FreeAndNil(iniFile);
         Application.Terminate;
      end;

      iLastDayProcessed := iniFile.ReadInteger('Processing', 'LastDayProcessed', -1);

      if (iLastDayProcessed = -1) then begin
         iniFile.WriteInteger('Processing', 'LastDayProcessed', iDayOfTheWeek);
      end;

      iLastHourProcessed := iniFile.ReadInteger('Processing', 'LastHourProcessed', -1);
      if (iLastHourProcessed = -1) then begin
         iLastHourProcessed := 0;
         iniFile.WriteInteger('Processing', 'LastHourProcessed', iLastHourProcessed);
      end;

      iResultsProcessed := iniFile.ReadInteger('Processing', 'ResultsProcessed', -1);

      if sLocation = 'Home' then begin
         Present := Now;
         DecodeTime(Present, wHour, wMin, wSec, wMSec);
         if (wHour < 0) then begin
            FreeAndNil(iniFile);
            exit;
         end;
      end;


      if sLocation = 'Home' then begin
         try
            Present := Now;
            DecodeTime(Present, wHour, wMin, wSec, wMSec);


            if (iResultsProcessed = 0) then begin

               hLog.AddToLog('Home Result Processing Start', msevOperation);
               TimerOn(False);
               gbSuppressTimerOn := True;

               //try
//                  btnDownloadTsnResultsClick(Sender);
//               except
//                  on E: Exception do hLog.AddToLog(E.Message, msevException);
//               end;

               try
                  edtOverrideDate.Date := Now();
                  edtOverrideDate.Date := edtOverrideDate.Date - 1;
                  btnProcessTSNResultsClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               try
                  edtOverrideDate.Date := Now();
                  edtOverrideDate.Date := edtOverrideDate.Date - 2;
                  btnProcessTSNResultsClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               try
                  edtOverrideDate.Date := Now();
                  edtOverrideDate.Date := edtOverrideDate.Date - 3;
                  btnProcessTSNResultsClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               try
                  edtOverrideDate.Date := Now();
                  edtOverrideDate.Date := edtOverrideDate.Date - 4;
                  btnProcessTSNResultsClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;


               iniFile.WriteInteger('Processing', 'ResultsProcessed', 1);
               gbSuppressTimerOn := False;
               TimerOn(True);
               Application.Terminate;
            end;


         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;



      if sLocation = 'Home' then begin
         try
            Present := Now;
            DecodeTime(Present, wHour, wMin, wSec, wMSec);


            if ((wHour = 7) or (wHour = 17)) then begin
               iniFile.WriteInteger('Processing', 'LastHourProcessed', 13);

               hLog.AddToLog('Home After 5 Processing Start', msevOperation);

               TimerOn(False);
               gbSuppressTimerOn := True;


               edtOverrideDate.Date := Now() + 1;
               //try
                //    btnDownloadTSNClick(Sender);
  //               except
  //                  on E: Exception do hLog.AddToLog(E.Message, msevException);
  //               end;

               try
                  edtOverrideDate.Date := Now() + 1;
                  btnStartOfDayClick(Sender);
                  ImportTSNHistory(Sender);
                  ImportHDWHistory(Sender);

                  try
                     btnDownloadTSNLSCClick(Sender);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;



                  //ImportTSNForToday(Sender);
                  ImportHDWForToday(Sender);

                  chkCreateExportFiles.Checked := True;
                  chkCreateHospitalReport.Checked := True;
                  chkCreateValueReport.Checked := True;
                  chkCreateTipReport.Checked := True;
                  chkCreateWagerReport.Checked := False;
                  chkCreateContestReport.Checked := False;
                  chkFTPHospitalReport.Checked := False;
                  chkFTPValueReport.Checked := False;

                  bCreateAll := False;
                  btnCreateReportsClick(Sender);

                  chkFTPHospitalReport.Checked := True;
                  chkFTPValueReport.Checked := True;

               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               try
                  edtOverrideDate.Date := Now();
                  FreeAndNil(iniFile);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;


               edtOverrideDate.Date := Now();

               btnStartOfDayClick(Sender);
                ImportTSNHistory(Sender);
               ImportHDWHistory(Sender);
               try
                  btnDownloadTSNLSCClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;


               try
                  btnProcessLateChangesClick(sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);

               end;

               //ImportTSNForToday(Sender);
               ImportHDWForToday(Sender);


               chkCreateExportFiles.Checked := True;
               chkCreateHospitalReport.Checked := True;
               chkCreateValueReport.Checked := True;
               chkCreateTipReport.Checked := True;
               chkCreateWagerReport.Checked := False;
               chkCreateContestReport.Checked := False;
               chkFTPHospitalReport.Checked := False;
               chkFTPValueReport.Checked := False;

               bCreateAll := False;
               btnCreateReportsClick(Sender);

               chkFTPHospitalReport.Checked := True;
               chkFTPValueReport.Checked := True;



               gbSuppressTimerOn := False;
               iniFile.WriteInteger('Processing', 'LastHourProcessed', 14);
               hLog.AddToLog('Home After 1 Processing End', msevOperation);
               TimerOn(True);
               Application.Terminate;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if sLocation = 'Home' then begin
         try
            Present := Now;
            DecodeTime(Present, wHour, wMin, wSec, wMSec);


            if ((wHour >= 10) and (wHour < 21)) then begin

               hLog.AddToLog('Home After 1 Processing Start', msevOperation);

               TimerOn(False);
               gbSuppressTimerOn := True;



               try
                  edtOverrideDate.Date := Now();
                  FreeAndNil(iniFile);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;


               edtOverrideDate.Date := Now();
               btnStartOfDayClick(Sender);
               ImportTSNHistory(Sender);
               ImportHDWHistory(Sender);

               try
                  btnDownloadTSNLSCClick(Sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;


               try
                  btnProcessLateChangesClick(sender);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               //  ImportTSNForToday(Sender);
               ImportHDWForToday(Sender);

               chkCreateExportFiles.Checked := True;
               chkCreateHospitalReport.Checked := True;
               chkCreateValueReport.Checked := True;
               chkCreateTipReport.Checked := True;
               chkCreateWagerReport.Checked := False;
               chkCreateContestReport.Checked := False;
               chkFTPHospitalReport.Checked := False;
               chkFTPValueReport.Checked := False;

               bCreateAll := False;
               btnCreateReportsClick(Sender);

               chkFTPHospitalReport.Checked := True;
               chkFTPValueReport.Checked := True;


               gbSuppressTimerOn := False;
               iniFile.WriteInteger('Processing', 'LastHourProcessed', 14);
               hLog.AddToLog('Home After 1 Processing End', msevOperation);
               TimerOn(True);
               Application.Terminate;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if (iDayOfTheWeek <> iLastDayProcessed) then begin

         TimerOn(False);
         gbSuppressTimerOn := True;
         iniFile.WriteInteger('Processing', 'LastDayProcessed', iDayOfTheWeek);

         case iLastDayProcessed of
            DaySunday: sLastDayProcessed := 'Sun';
            DayMonday: sLastDayProcessed := 'Mon';
            DayTuesday: sLastDayProcessed := 'Tue';
            DayWednesday: sLastDayProcessed := 'Wed';
            DayThursday: sLastDayProcessed := 'Thu';
            DayFriday: sLastDayProcessed := 'Fri';
            DaySaturday: sLastDayProcessed := 'Sat';
         end;

         iniFile.WriteString('Processing', 'ProcessLastDay', sLastDayProcessed);
         iniFile.WriteInteger('Processing', 'ResultsProcessed', 0);

         //
         try
            chkCreateExportFiles.Checked := True;
            chkCreateTipReport.Checked := True;
            chkCreateHospitalReport.Checked := True;
            chkCreateValueReport.Checked := True;
            chkCreateWagerReport.Checked := True;
            chkCreateContestReport.Checked := True;
            chkCreateGimmickReport.Checked := True;
            chkCreateSelectionReport.Checked := True;
            DeleteReports();
            btnCreateReportsNoneClick(Sender);
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         //         //
         //         try
         //            edtOverrideDate.Date := Now();
         //            btnDownloadEquibaseStatsClick(Sender);
         //            btnProcessEquibaseStatsClick(Sender);
         //         except
         //            on E: Exception do hLog.AddToLog(E.Message, msevException);
         //         end;

                  //try
         //            btnDownloadTSNClick(Sender);
         //         except
         //            on E: Exception do hLog.AddToLog(E.Message, msevException);
         //         end;


         chkCreateHospitalReport.Checked := True;
         chkCreateValueReport.Checked := False;
         chkCreateExportFiles.Checked := True;
         chkCreateContestReport.Checked := False;

         chkFTPHospitalReport.Checked := True;
         chkFTPValueReport.Checked := True;

         try
            edtOverrideDate.Date := Now();
            edtOverrideDate.Date := edtOverrideDate.Date + 3;

            btnStartOfDayClick(Sender);
            ImportTSNHistory(Sender);
            ImportTSNForToday(Sender);

            ImportHDWHistory(Sender);
            ImportHDWForToday(Sender);


            chkCreateExportFiles.Checked := True;
            chkCreateTipReport.Checked := True;
            chkCreateWagerReport.Checked := False;
            chkCreateContestReport.Checked := False;
            chkCreateHospitalReport.Checked := True;
            chkCreateValueReport.Checked := True;
            btnCreateReportsClick(Sender);

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;


         // Processs Day After Tommorrow
         try
            edtOverrideDate.Date := Now();
            edtOverrideDate.Date := edtOverrideDate.Date + 2;

            btnStartOfDayClick(Sender);
            ImportTSNHistory(Sender);
            ImportTSNForToday(Sender);
            ImportHDWHistory(Sender);
            ImportHDWForToday(Sender);

            chkCreateExportFiles.Checked := True;
            chkCreateTipReport.Checked := True;
            chkCreateWagerReport.Checked := False;
            chkCreateContestReport.Checked := False;
            chkCreateHospitalReport.Checked := True;
            chkCreateValueReport.Checked := True;
            btnCreateReportsClick(Sender);

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         try
            edtOverrideDate.Date := Now();
            edtOverrideDate.Date := edtOverrideDate.Date + 1;

            btnStartOfDayClick(Sender);
            ImportTSNHistory(Sender);
            ImportTSNForToday(Sender);
            ImportHDWHistory(Sender);
            ImportHDWForToday(Sender);

            chkCreateExportFiles.Checked := True;
            chkCreateTipReport.Checked := True;
            chkCreateWagerReport.Checked := False;
            chkCreateContestReport.Checked := False;
            chkCreateHospitalReport.Checked := True;
            chkCreateValueReport.Checked := True;
            btnCreateReportsClick(Sender);

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;




         // Processs Today
         try
            edtOverrideDate.Date := Now();

            btnStartOfDayClick(Sender);
                        ImportTSNHistory(Sender);
                        ImportTSNForToday(Sender);
            ImportHDWHistory(Sender);
            ImportHDWForToday(Sender);

            chkCreateExportFiles.Checked := True;
            chkCreateTipReport.Checked := True;
            chkCreateWagerReport.Checked := False;
            chkCreateContestReport.Checked := False;
            chkCreateHospitalReport.Checked := True;
            chkCreateValueReport.Checked := True;
            btnCreateReportsClick(Sender);

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         try
            edtOverrideDate.Date := Now();
            chkFTPHospitalReport.Checked := True;
            chkFTPValueReport.Checked := True;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

         //if (DayOfTheWeek(edtOverrideDate.Date) = DayTuesday) then begin
//            try
//               TimerOn(False);
//               qryGetRacesAndRunners(dm.tblTotals);
//               GenerateRankingStats(ONE_DAY_FALSE, RANKING_STAT_DAYS);
//               GenerateRankingStatsByTrack(ONE_DAY_FALSE, RANKING_TRACK_STAT_DAYS);
//               qryUpdateIVRankingTables();
//            finally
//               TimerOn(True);
//            end;
//         end;

         if (DayOfTheWeek(Now()) = DayMonday) then begin
            try
               UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, TRN_STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end else begin
            try
               UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_FALSE, ONE_DAY_FALSE, TRN_STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end;
         //

         if (DayOfTheWeek(edtOverrideDate.Date) = DayTuesday) then begin
            try
               Create_FO_PK_SK_DK_Keys(BATCH_SIZE, True, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS * 100);
               Create_FinalOrder_Key(BATCH_SIZE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
         end;

         edtOverrideDate.Date := Now();

      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         FreeAndNil(iniFile);
         gbSuppressTimerOn := False;
         TimerOn(True);
      end;
   end;

   gbSuppressTimerOn := False;
   TimerOn(True);
   FreeAndNil(iniFile);
   Application.Terminate;


end;


procedure TMainForm.UpdateTblProgressStatusBar(tbl: TDBISAMTable; sHeading: string);
begin

   prgBar.Position := prgBar.Position + 1;

   staBar.SimpleText := sHeading +
      tbl.FieldByName('TrkCode').AsString + ' ' +
      tbl.FieldByName('RaceDate').AsString + ' Race # ' +
      tbl.FieldByName('RaceNbr').AsString + ' ' +
      tbl.FieldByName('HorseName').AsString;

   Application.ProcessMessages();

end;




//

procedure TMainForm.GetTrainerStats(sIn: string);
var
   sTrainerStarts: string;
   sTrainerWinPct: string;
   sTrainerPlcPct: string;
   sTrainerShoPct: string;
   sTrainerItmPct: string;
   sTrainerRoi: string;

   fTrainerWinPct: Double;
   fTrainerPlcPct: Double;
   fTrainerShoPct: Double;
   fTrainerItmPct: Double;
   fTrainerRoi: Double;

   fTrainerStarts: Double;
   fTrainerWins: Double;
   fTrainerPlcs: Double;
   fTrainerShos: Double;
   fTrainerItms: Double;

   sTmp: string;
   iPos: integer;
   iHPos: integer;
   iFPPos: integer;
   iLen: integer;

begin

   try

      sTrainerStarts := '';
      sTrainerWinPct := '';
      sTrainerPlcPct := '';
      sTrainerShoPct := '';
      sTrainerItmPct := '';
      sTrainerRoi := '';

      fTrainerStarts := 0;
      fTrainerWinPct := 0;
      fTrainerPlcPct := 0;
      fTrainerShoPct := 0;
      fTrainerItmPct := 0;
      fTrainerRoi := 0;

      fTrainerWins := 0;
      fTrainerPlcs := 0;
      fTrainerShos := 0;
      fTrainerItms := 0;

      iTrainerStarts := 0;
      iTrainerWins := 0;
      iTrainerPlcs := 0;
      iTrainerShos := 0;
      iTrainerItms := 0;

      iTrainerWinPct := 0;
      iTrainerPlcPct := 0;
      iTrainerShoPct := 0;
      iTrainerItmPct := 0;
      iTrainerRoi := 0;

      sTmp := dmDBF.dbfTrainer.FieldByName(sIn).AsString;
      iLen := Length(sTmp);
      if iLen >= 27 then begin
         sTrainerStarts := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 1, 5);
         sTrainerWinPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 7, 3);
         sTrainerPlcPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 11, 3);
         sTrainerShoPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 15, 3);
         sTrainerItmPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 19, 3);
         sTrainerRoi := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 23, 5);
      end;

      if iLen >= 25 then begin
         if (sIn = 'TL10') then begin
            sTrainerStarts := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 1, 3);
            sTrainerWinPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 5, 3);
            sTrainerPlcPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 9, 3);
            sTrainerShoPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 13, 3);
            sTrainerItmPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 17, 3);
            sTrainerRoi := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 21, 5);
         end;
      end;

      if (sIn = 'TL30') then begin
         iPos := SmartPos('-', sTmp);
         if (iPos = 4) then begin
            if iLen >= 25 then begin
               sTrainerStarts := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 1, 3);
               sTrainerWinPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 5, 3);
               sTrainerPlcPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 9, 3);
               sTrainerShoPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 13, 3);
               sTrainerItmPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 17, 3);
               sTrainerRoi := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 21, 5);
            end;
         end else begin
            if iLen >= 26 then begin
               sTrainerStarts := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 1, 4);
               sTrainerWinPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 6, 3);
               sTrainerPlcPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 10, 3);
               sTrainerShoPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 14, 3);
               sTrainerItmPct := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 18, 3);
               sTrainerRoi := CopyStr(dmDBF.dbfTrainer.FieldByName(sIn).AsString, 22, 5);
            end;
         end;
      end;

      fTrainerStarts := atof(sTrainerStarts);
      fTrainerWinPct := atof(sTrainerWinPct);
      fTrainerPlcPct := atof(sTrainerPlcPct);
      fTrainerShoPct := atof(sTrainerShoPct);
      fTrainerItmPct := atof(sTrainerItmPct);
      fTrainerRoi := atof(sTrainerRoi);

      fTrainerWins := fTrainerStarts * (fTrainerWinPct / 100);
      fTrainerPlcs := fTrainerStarts * (fTrainerPlcPct / 100);
      fTrainerShos := fTrainerStarts * (fTrainerShoPct / 100);
      fTrainerItms := fTrainerStarts * (fTrainerItmPct / 100);

      iTrainerStarts := Round(fTrainerStarts);
      iTrainerWins := Round(fTrainerWins);
      iTrainerPlcs := Round(fTrainerPlcs);
      iTrainerShos := Round(fTrainerShos);
      iTrainerItms := Round(fTrainerItms);

      iTrainerWinPct := Round(fTrainerWinPct);
      iTrainerPlcPct := Round(fTrainerPlcPct);
      iTrainerShoPct := Round(fTrainerShoPct);
      iTrainerItmPct := Round(fTrainerItmPct);
      iTrainerRoi := Round(fTrainerRoi);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.GetJockeyStats(sIn: string);
var
   sJockeyStarts: string;
   sJockeyWinPct: string;
   sJockeyPlcPct: string;
   sJockeyShoPct: string;
   sJockeyItmPct: string;
   sJockeyRoi: string;

   fJockeyWinPct: Double;
   fJockeyPlcPct: Double;
   fJockeyShoPct: Double;
   fJockeyItmPct: Double;
   fJockeyRoi: Double;

   fJockeyStarts: Double;
   fJockeyWins: Double;
   fJockeyPlcs: Double;
   fJockeyShos: Double;
   fJockeyItms: Double;

   sTmp: string;
   iPos: integer;
   iLen: integer;

begin
   try

      sJockeyStarts := '';
      sJockeyWinPct := '';
      sJockeyPlcPct := '';
      sJockeyShoPct := '';
      sJockeyItmPct := '';
      sJockeyRoi := '';

      fJockeyStarts := 0;
      fJockeyWinPct := 0;
      fJockeyPlcPct := 0;
      fJockeyShoPct := 0;
      fJockeyItmPct := 0;
      fJockeyRoi := 0;

      fJockeyWins := 0;
      fJockeyPlcs := 0;
      fJockeyShos := 0;
      fJockeyItms := 0;

      iJockeyStarts := 0;
      iJockeyWins := 0;
      iJockeyPlcs := 0;
      iJockeyShos := 0;
      iJockeyItms := 0;

      iJockeyWinPct := 0;
      iJockeyPlcPct := 0;
      iJockeyShoPct := 0;
      iJockeyItmPct := 0;
      iJockeyRoi := 0;

      sTmp := dmDBF.dbfJockey.FieldByName(sIn).AsString;
      iLen := Length(sTmp);
      if iLen >= 27 then begin
         sJockeyStarts := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 1, 5);
         sJockeyWinPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 7, 3);
         sJockeyPlcPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 11, 3);
         sJockeyShoPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 15, 3);
         sJockeyItmPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 19, 3);
         sJockeyRoi := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 23, 5);
      end;

      if iLen >= 25 then begin
         if (sIn = 'JL10') then begin
            sJockeyStarts := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 1, 3);
            sJockeyWinPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 5, 3);
            sJockeyPlcPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 9, 3);
            sJockeyShoPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 13, 3);
            sJockeyItmPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 17, 3);
            sJockeyRoi := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 21, 5);
         end;
      end;

      if (sIn = 'JL30') then begin
         iPos := SmartPos('-', sTmp);
         if (iPos = 4) then begin
            if iLen >= 25 then begin
               sJockeyStarts := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 1, 3);
               sJockeyWinPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 5, 3);
               sJockeyPlcPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 9, 3);
               sJockeyShoPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 13, 3);
               sJockeyItmPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 17, 3);
               sJockeyRoi := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 21, 5);
            end;
         end
         else begin
            if iLen >= 26 then begin
               sJockeyStarts := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 1, 4);
               sJockeyWinPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 6, 3);
               sJockeyPlcPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 10, 3);
               sJockeyShoPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 14, 3);
               sJockeyItmPct := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 18, 3);
               sJockeyRoi := CopyStr(dmDBF.dbfJockey.FieldByName(sIn).AsString, 22, 5);
            end;
         end;
      end;

      fJockeyStarts := atof(sJockeyStarts);
      fJockeyWinPct := atof(sJockeyWinPct);
      fJockeyPlcPct := atof(sJockeyPlcPct);
      fJockeyShoPct := atof(sJockeyShoPct);
      fJockeyItmPct := atof(sJockeyItmPct);
      fJockeyRoi := atof(sJockeyRoi);

      fJockeyWins := fJockeyStarts * (fJockeyWinPct / 100);
      fJockeyPlcs := fJockeyStarts * (fJockeyPlcPct / 100);
      fJockeyShos := fJockeyStarts * (fJockeyShoPct / 100);
      fJockeyItms := fJockeyStarts * (fJockeyItmPct / 100);

      iJockeyStarts := Round(fJockeyStarts);
      iJockeyWins := Round(fJockeyWins);
      iJockeyPlcs := Round(fJockeyPlcs);
      iJockeyShos := Round(fJockeyShos);
      iJockeyItms := Round(fJockeyItms);

      iJockeyWinPct := Round(fJockeyWinPct);
      iJockeyPlcPct := Round(fJockeyPlcPct);
      iJockeyShoPct := Round(fJockeyShoPct);
      iJockeyItmPct := Round(fJockeyItmPct);
      iJockeyRoi := Round(fJockeyRoi);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TMainForm.btnSpcHHClick(Sender: TObject);

begin

   try

      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();

      while not dm.tblHH.Eof do begin
         IncPrgBar();

         staBar.SimpleText := 'Updating Race/Horse History - ' +
            dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
            dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
            dm.tblHH.FieldByName('RaceNbr').AsString;

         Application.ProcessMessages();

         // dm.tblHH.IndexName := '';
         // dm.tblHH.SetKey();
         // If dm.tblHH.FieldByName('FinishPos').AsInteger >= 20 Then Begin
         //   dm.tblHH.Edit();
         //   dm.tblHH.FieldByName('FinishPos').AsInteger := 0;
         //   dm.tblHH.FieldByName('Odds').AsFloat := 0;
         //   dm.tblHH.Post();
         // End;

         if dm.tblHH.FieldByName('AvgSpeed').AsInteger = 0 then begin
            if dm.tblHH.FieldByName('LastSpeed').AsInteger > 0 then begin
               dm.tblHH.Edit();
               dm.tblHH.FieldByName('AvgSpeed').AsInteger :=
                  dm.tblHH.FieldByName('LastSpeed').AsInteger;
               dm.tblHH.Post();
            end;
         end;

         //      If dm.tblHH.FieldByName('AvgClass').AsFloat = 0 Then Begin
         //        dm.tblHH.FieldByName('AvgClass').AsFloat := dm.tblHH.FieldByName('TodaysClass').AsFloat;
         //      End
         //      Else Begin
         //        dm.tblHH.FieldByName('AvgClass').AsFloat := dm.tblHH.FieldByName('TodaysClass').AsFloat +
         //          dm.tblHH.FieldByName('AvgPurse').AsFloat;
         //      End;

         //      If dm.tblHH.FieldByName('AvgClassRating').Value = 0 Then Begin
         //        dm.tblHH.FieldByName('AvgClassRating').Value := dm.tblHH.FieldByName('TodaysClass').AsFloat;
         //      End;

         dm.tblHH.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         CloseTable(dm.tblHH);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(dm.tblHH);
   ClearPrgStatusBars();

end;


procedure TMainForm.btnCreateTodaysRatingsClick(Sender: TObject);
begin
   TimerOn(False);
   CreateTodaysRatings(Sender, 100);
   TimerOn(True);
end;


function TMainForm.StripOutName(sIn: string): string;
var
   sTmp: string;
begin

   sTmp := sIn;
   sTmp := FastReplace(sTmp, '%', ' ', True);
   sTmp := FastReplace(sTmp, '_', ' ', True);
   sTmp := FastReplace(sTmp, '/', ' ', True);
   sTmp := FastReplace(sTmp, '\', ' ', True);
   sTmp := FastReplace(sTmp, '&', '', True);
   sTmp := FastReplace(sTmp, '(', '', True);
   sTmp := FastReplace(sTmp, ')', '', True);
   sTmp := FastReplace(sTmp, '[', ' ', True);
   sTmp := FastReplace(sTmp, ']', ' ', True);
   sTmp := FastReplace(sTmp, '''', '', True);
   sTmp := FastReplace(sTmp, '"', '', True);
   sTmp := FastReplace(sTmp, '.', '', True);
   sTmp := FastReplace(sTmp, ',', '', True);
   sTmp := FastReplace(sTmp, '$', '', True);
   sTmp := FastReplace(sTmp, '+', '', True);
   sTmp := FastReplace(sTmp, '=', '', True);
   sTmp := FastReplace(sTmp, '-', '', True);

   if UpperCase(sTmp) = 'FRANK C CALABRESE' then begin
      sTmp := 'FRANK CARL CALABRESE';
   end;
   if UpperCase(sTmp) = 'FRANK CALABRESE' then begin
      sTmp := 'FRANK CARL CALABRESE';
   end;

   Result := sTmp;


end;



procedure TMainForm.UpdateValueChoice
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer);
var

   sProgramNbr: string;

   iIdx: integer;

   sTimmyGatorFilter: string;

begin

   hLog.AddToLog('UpdateValueChoices', msevOperation);
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);
   except
      ClearPrgStatusBars();
   end;

   //Start
   try
      InitPrgBar(tblE.RecordCount);
      tblE.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction;
      end;
      while not tblE.Eof do begin
         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Clearing Choices - ');
         tblE.Edit();
         tblE.FieldByName('ValueChoice').AsInteger := NO_CHOICE;
         tblE.Post();
         tblE.Next();
      end;
   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback;
      end;
      ClearPrgStatusBars();
   end;
   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   //Start
   try
      InitPrgBar(tblE.RecordCount);

      tblE.Filtered := False;
      sTimmyGatorFilter := '';
      sTimmyGatorFilter := sTimmyGatorFilter +
         'FinalWinPctRank = 1 and (IsChalkValue = True) ';

      tblE.Filter := sTimmyGatorFilter;
      tblE.Filtered := True;

      tblE.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction;
      end;

      while not tblE.Eof do begin
         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Updating Gator - ');
         tblE.Edit();
         tblE.FieldByName('ValueChoice').AsInteger := CHALK_CHOICE;
         tblE.Post();
         tblE.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback;
      end;
      ClearPrgStatusBars();
   end;
   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   //Start
   try
      InitPrgBar(tblE.RecordCount);
      tblE.Filtered := False;
      sTimmyGatorFilter := '';
      sTimmyGatorFilter := sTimmyGatorFilter + 'IsFinalValue = True)';

      tblE.Filter := sTimmyGatorFilter;
      tblE.Filtered := True;

      tblE.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction;
      end;
      while not tblE.Eof do begin
         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Updating Timmy - ');
         tblE.Edit();
         tblE.FieldByName('ValueChoice').AsInteger := VALUE_CHOICE;
         tblE.Post();
         tblE.Next();
      end;
   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback;
      end;
      ClearPrgStatusBars();
   end;
   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

end;




procedure TMainForm.AddSire();
begin
   dm.tblSire.IndexName := '';
   dm.tblSire.SetKey();
   dm.tblSire.FieldByName('SireName').Value := Trim(sSireName);

   if (dm.tblSire.GotoKey()) then begin
      dm.tblSire.Edit();
      FldSire();
      dm.tblSire.Post();
      Application.ProcessMessages();
   end else begin
      if Trim(sSireName) <> '' then begin
         dm.tblSire.Append();
         dm.tblSire.FieldByName('SireName').Value := Trim(sSireName);
         FldSire();
         dm.tblSire.Post();
         Application.ProcessMessages();
      end;
   end;
end;

procedure TMainForm.FldSire();

begin

   dm.tblSire.FieldByName('LastUpdate').AsDateTime := Now();

   GetSireStats('REC_FOAL');
   dm.tblSire.FieldByName('AllStarts').AsInteger := iSireStarts;
   dm.tblSire.FieldByName('AllWinPct').AsInteger := iSireWinPct;
   dm.tblSire.FieldByName('AllWins').AsInteger := iSireWins;

   GetSireStats('REC_TURF');
   dm.tblSire.FieldByName('TurfStarts').AsInteger := iSireStarts;
   dm.tblSire.FieldByName('TurfWinPct').AsInteger := iSireWinPct;
   dm.tblSire.FieldByName('TurfWins').AsInteger := iSireWins;

   //  GetSireStats('REC_2YR');
   //  dm.tblSire.FieldByName('Sire2yoStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('Sire2yoWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('Sire2yoWins').AsInteger := iSireWins;

   //  GetSireStats('REC_STK');
   //  dm.tblSire.FieldByName('SireStkStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireStkWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireStkWins').AsInteger := iSireWins;

   GetSireStats('REC_OFFTRK');
   dm.tblSire.FieldByName('MudStarts').AsInteger := iSireStarts;
   dm.tblSire.FieldByName('MudWinPct').AsInteger := iSireWinPct;
   dm.tblSire.FieldByName('MudWins').AsInteger := iSireWins;

   //  GetSireStats('REC_FTS');
   //  dm.tblSire.FieldByName('SireDebutStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireDebutWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireDebutWins').AsInteger := iSireWins;

   //  GetSireStats('REC_OFSTRK'); //   Char    36      Record of all foals on off turf
   //  dm.tblSire.FieldByName('SireSoftStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireSoftWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireSoftWins').AsInteger := iSireWins;

   //  GetSireStats('REC_DS'); //   Char    36      Record of all foals in dirt sprints
   //  dm.tblSire.FieldByName('SireDirtSprStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireDirtSprWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireDirtSprWins').AsInteger := iSireWins;

   //  GetSireStats('REC_DR'); //   Char    36      Record of all foals in dirt routes
   //  dm.tblSire.FieldByName('SireDirtRteStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireDirtRteWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireDirtRteWins').AsInteger := iSireWins;

   //  GetSireStats('REC_TS'); //   Char    36      Record of all foals in turf sprints
   //  dm.tblSire.FieldByName('SireTurfSprStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireTurfSprWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireTurfSprWins').AsInteger := iSireWins;

   //  GetSireStats('REC_TR'); //   Char    36      Record of all foals in turf routes
   //  dm.tblSire.FieldByName('SireTurfRteStarts').AsInteger := iSireStarts;
   //  dm.tblSire.FieldByName('SireTurfRteWinPct').AsInteger := iSireWinPct;
   //  dm.tblSire.FieldByName('SireTurfRteWins').AsInteger := iSireWins;
end;

procedure TMainForm.GetSireStats(sIn: string);
var
   sSireStarts: string;
   sSireWinPct: string;
   sSirePlcPct: string;
   sSireShoPct: string;
   sSireItmPct: string;
   sSireRoi: string;
   fSireWinPct: double;
   fSirePlcPct: double;
   fSireShoPct: double;
   fSireItmPct: double;
   fSireRoi: double;
   fSireStarts: double;
   fSireWins: double;
   fSirePlcs: double;
   fSireShos: double;
   fSireItms: double;
begin

   try
      sSireStarts := '';
      sSireWinPct := '';
      sSirePlcPct := '';
      sSireShoPct := '';
      sSireItmPct := '';
      sSireRoi := '';
      fSireWinPct := 0;
      fSirePlcPct := 0;
      fSireShoPct := 0;
      fSireItmPct := 0;
      fSireRoi := 0;
      fSireStarts := 0;
      fSireWins := 0;
      fSirePlcs := 0;
      fSireShos := 0;
      fSireItms := 0;
      iSireWinPct := 0;
      iSirePlcPct := 0;
      iSireShoPct := 0;
      iSireItmPct := 0;
      iSireRoi := 0;

      sSireStarts := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 1, 5);
      sSireWinPct := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 7, 3);
      sSirePlcPct := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 11, 3);
      sSireShoPct := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 15, 3);
      sSireItmPct := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 19, 3);
      sSireRoi := CopyStr(dmDBF.dbfSire.FieldByName(sIn).AsString, 23, 5);

      fSireStarts := atof(sSireStarts);
      fSireWinPct := atof(sSireWinPct);
      fSirePlcPct := atof(sSirePlcPct);
      fSireShoPct := atof(sSireShoPct);
      fSireItmPct := atof(sSireItmPct);
      fSireRoi := atof(sSireRoi);

      fSireWins := fSireStarts * (fSireWinPct / 100);
      fSirePlcs := fSireStarts * (fSirePlcPct / 100);
      fSireShos := fSireStarts * (fSireShoPct / 100);
      fSireItms := fSireStarts * (fSireItmPct / 100);

      iSireWinPct := Round(fSireWinPct);
      iSirePlcPct := Round(fSirePlcPct);
      iSireShoPct := Round(fSireShoPct);
      iSireItmPct := Round(fSireItmPct);
      iSireRoi := Round(fSireRoi);

      iSireStarts := Round(fSireStarts);
      iSireWins := Round(fSireWins);
      iSirePlcs := Round(fSirePlcs);
      iSireShos := Round(fSireShos);
      iSireItms := Round(fSireItms);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.AddDam();
begin
   dm.tblDam.IndexName := '';
   dm.tblDam.SetKey();
   dm.tblDam.FieldByName('DamName').Value := Trim(sDamName);

   if (dm.tblDam.GotoKey()) then begin
      dm.tblDam.Edit();
      FldDam();
      dm.tblDam.Post();
      Application.ProcessMessages();
   end else begin
      if Trim(sDamName) <> '' then begin
         dm.tblDam.Append();
         dm.tblDam.FieldByName('DamName').Value := Trim(sDamName);
         FldDam();
         dm.tblDam.Post();
         Application.ProcessMessages();
      end;
   end;
end;

procedure TMainForm.FldDam();
begin

   dm.tblDam.FieldByName('DamSireName').Value := Trim(sDamSireName);
   dm.tblDam.FieldByName('LastUpdate').AsDateTime := Now();

   GetDamStats('REC_FOAL');
   dm.tblDam.FieldByName('AllStarts').AsInteger := iDamStarts;
   dm.tblDam.FieldByName('AllWinPct').AsInteger := iDamWinPct;
   dm.tblDam.FieldByName('AllWins').AsInteger := iDamWins;

   GetDamStats('REC_TURFST');
   dm.tblDam.FieldByName('TurfStarts').AsInteger := iDamStarts;
   dm.tblDam.FieldByName('TurfWinPct').AsInteger := iDamWinPct;
   dm.tblDam.FieldByName('TurfWins').AsInteger := iDamWins;

   GetDamStats('REC_OFFTRK');
   dm.tblDam.FieldByName('MudStarts').AsInteger := iDamStarts;
   dm.tblDam.FieldByName('MudWinPct').AsInteger := iDamWinPct;
   dm.tblDam.FieldByName('MudWins').AsInteger := iDamWins;

   //  GetDamStats('REC_FTS'); //   Char    36      Record of all foals starting first time
   //  dm.tblDam.FieldByName('DebutStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('DebutWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('DebutWins').AsInteger := iDamWins;

   //  GetDamStats('REC_2YR');
   //  dm.tblDam.FieldByName('TwoYearOldStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('TwoYearOldWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('TwoYearOldWins').AsInteger := iDamWins;

   //  GetDamStats('REC_STKST');
   //  dm.tblDam.FieldByName('StkStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('StkWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('StkWins').AsInteger := iDamWins;

   //  GetDamStats('REC_OFSTRK'); //    Char    36      Record of all foals on soft turf
   //  dm.tblDam.FieldByName('SoftStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('SoftWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('SoftWins').AsInteger := iDamWins;

   //  GetDamStats('REC_DS'); //    Char    36      Record of all foals in dirt sprints
   //  dm.tblDam.FieldByName('DirtSprStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('DirtSprWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('DirtSprWins').AsInteger := iDamWins;

   //  GetDamStats('REC_DR'); //    Char    36      Record of all foals in dirt routes
   //  dm.tblDam.FieldByName('DirtRteStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('DirtRteWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('DirtRteWins').AsInteger := iDamWins;

   //  GetDamStats('REC_TS'); //    Char    36      Record of all foals in turf sprints
   //  dm.tblDam.FieldByName('TurfSprStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('TurfSprWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('TurfSprWins').AsInteger := iDamWins;

   //  GetDamStats('REC_TR'); //    Char    36      Record of all foals in turf routes
   //  dm.tblDam.FieldByName('TurfRteStarts').AsInteger := iDamStarts;
   //  dm.tblDam.FieldByName('TurfRteWinPct').AsInteger := iDamWinPct;
   //  dm.tblDam.FieldByName('TurfRteWins').AsInteger := iDamWins;
end;

procedure TMainForm.GetDamStats(sIn: string);
var
   sDamStarts: string;
   sDamWinPct: string;
   sDamPlcPct: string;
   sDamShoPct: string;
   sDamItmPct: string;
   sDamRoi: string;
   fDamWinPct: double;
   fDamPlcPct: double;
   fDamShoPct: double;
   fDamItmPct: double;
   fDamRoi: double;
   fDamStarts: double;
   fDamWins: double;
   fDamPlcs: double;
   fDamShos: double;
   fDamItms: double;
begin

   try
      sDamStarts := '';
      sDamWinPct := '';
      sDamPlcPct := '';
      sDamShoPct := '';
      sDamItmPct := '';
      sDamRoi := '';
      fDamWinPct := 0;
      fDamPlcPct := 0;
      fDamShoPct := 0;
      fDamItmPct := 0;
      fDamRoi := 0;
      fDamStarts := 0;
      fDamWins := 0;
      fDamPlcs := 0;
      fDamShos := 0;
      fDamItms := 0;
      iDamWinPct := 0;
      iDamPlcPct := 0;
      iDamShoPct := 0;
      iDamItmPct := 0;
      iDamRoi := 0;

      iDamStarts := Round(fDamStarts);
      iDamWins := Round(fDamWins);
      iDamPlcs := Round(fDamPlcs);
      iDamShos := Round(fDamShos);
      iDamItms := Round(fDamItms);

      sDamStarts := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 1, 5);
      sDamWinPct := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 7, 3);
      sDamPlcPct := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 11, 3);
      sDamShoPct := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 15, 3);
      sDamItmPct := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 19, 3);
      sDamRoi := CopyStr(dmDBF.dbfDam.FieldByName(sIn).AsString, 23, 5);

      fDamStarts := atof(sDamStarts);
      fDamWinPct := atof(sDamWinPct);
      fDamPlcPct := atof(sDamPlcPct);
      fDamShoPct := atof(sDamShoPct);
      fDamItmPct := atof(sDamItmPct);
      fDamRoi := atof(sDamRoi);

      fDamWins := fDamStarts * (fDamWinPct / 100);
      fDamPlcs := fDamStarts * (fDamPlcPct / 100);
      fDamShos := fDamStarts * (fDamShoPct / 100);
      fDamItms := fDamStarts * (fDamItmPct / 100);

      iDamWinPct := Round(fDamWinPct);
      iDamPlcPct := Round(fDamPlcPct);
      iDamShoPct := Round(fDamShoPct);
      iDamItmPct := Round(fDamItmPct);
      iDamRoi := Round(fDamRoi);

      iDamStarts := Round(fDamStarts);
      iDamWins := Round(fDamWins);
      iDamPlcs := Round(fDamPlcs);
      iDamShos := Round(fDamShos);
      iDamItms := Round(fDamItms);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.chkOverrideDatePropertiesChange(Sender: TObject);
var
   iniFile: TIniFile;
begin

   try
      iniFile := TIniFile.Create(INI_FILE);
      if chkOverrideDate.Checked then begin
         iniFile.WriteBool('SireRate', 'UseOverrideDate', True);
         gbUseOverrideDate := True;
      end else begin
         iniFile.WriteBool('SireRate', 'UseOverrideDate', False);
         gbUseOverrideDate := False;
      end;
   except
      FreeAndNil(iniFile);
   end;
   FreeAndNil(iniFile);

end;

procedure TMainForm.chkUseProxyPropertiesChange(Sender: TObject);
var
   iniFile: TIniFile;
begin
   try
      iniFile := TIniFile.Create(INI_FILE);
      if chkUseProxy.Checked then begin
         iniFile.WriteBool('Proxy', 'UseProxyServer', True);
         bUseProxyServer := True;
      end else begin
         iniFile.WriteBool('Proxy', 'UseProxyServer', False);
         bUseProxyServer := False;
      end;
   except
      FreeAndNil(iniFile);
   end;
   FreeAndNil(iniFile);

end;

procedure TMainForm.edtProxyPropertiesChange(Sender: TObject);
var
   iniFile: TIniFile;

begin

   try
      iniFile := TIniFile.Create(INI_FILE);
      sProxyServer := edtProxy.Text;
      iniFile.WriteString('Proxy', 'ProxyServer', sProxyServer);
   except
      FreeAndNil(iniFile);
   end;
   FreeAndNil(iniFile);

end;

procedure TMainForm.chkProcessAllDatesPropertiesChange(Sender: TObject);
var
   iniFile: TIniFile;
begin

   try
      iniFile := TIniFile.Create(INI_FILE);

      if chkProcessAllDates.Checked then begin
         iniFile.WriteBool('SireRate', 'ProcessAllDates', True);
         bProcessAllDates := True;
      end else begin
         iniFile.WriteBool('SireRate', 'ProcessAllDates', False);
         bProcessAllDates := False;
      end;

   except
      FreeAndNil(iniFile);
   end;
   FreeAndNil(iniFile);
end;

procedure TMainForm.SaveMemoryTables();
begin
   exit;

   //  Try
   //    CloseTable(dm.tblPP);
   //    CloseTable(dm.tblPast);
   //    CloseTable(dm.tblRaces);
   //    CloseTable(dm.tblEntries);
   //    CloseTable(dm.tblRatings);
   //    CloseTable(dm.tblGimmicks);
   //
   //    CloseTable(dm.tblPP);
   //    CloseTable(dm.tblPast);
   //    CloseTable(dm.tblRaces);
   //    CloseTable(dm.tblEntries);
   //    CloseTable(dm.tblRatings);
   //    CloseTable(dm.tblGimmicks);
   //
   //    dm.tblPP.CopyTable(dm.dbSireRate.Directory, dm.tblPP.TableName);
   //    dm.tblPast.CopyTable(dm.dbSireRate.Directory, dm.tblPast.TableName);
   //    dm.tblRaces.CopyTable(dm.dbSireRate.Directory, dm.tblRaces.TableName);
   //    dm.tblEntries.CopyTable(dm.dbSireRate.Directory, dm.tblEntries.TableName);
   //    dm.tblRatings.CopyTable(dm.dbSireRate.Directory, dm.tblRatings.TableName);
   //    dm.tblGimmicks.CopyTable(dm.dbSireRate.Directory, dm.tblGimmicks.TableName);
   //  Except
   //  End;

end;

function TMainForm.GetGimmickChoice(tblR: TDBISAMTable; tblE: TDBISAMTable;
   iChoice: integer): double;
begin

   Result := 0;

   Result := tblE.FieldByName('TotalTrnWinPct').AsFloat;

end;

procedure TMainForm.idFtpStatus(ASender: TObject; const AStatus: TIdStatus;
   const AStatusText: string);
begin

   Application.ProcessMessages();
   UpdateStatusBar(AStatusText);
   Application.ProcessMessages();

end;

procedure TMainForm.btnCreateReportsNoneClick(Sender: TObject);
begin

   //   chkCreateAngleReport.Checked := False;
   chkCreateTipReport.Checked := False;
   chkCreateHospitalReport.Checked := False;
   chkCreateHarnessReport.Checked := False;
   chkCreateHarnessValueReport.Checked := False;
   chkCreateValueReport.Checked := False;
   chkCreateWagerReport.Checked := False;
   chkCreateContestReport.Checked := False;
   chkCreateGimmickReport.Checked := False;
   chkCreateContestReport.Checked := False;
   chkCreateSelectionReport.Checked := False;
   chkCreateExportFiles.Checked := False;

end;

procedure TMainForm.btnReProcessDaysClick(Sender: TObject);
var
   iniFile: TIniFile;

begin


   //   dm.tblRaces.CopyTable(DATA_PATH,'SaveRace');
   //   exit;
   dtAltFirstDateToProcess := edtAltFirstDateToProcess.Date;
   dtAltLastDateToProcess := edtAltLastDateToProcess.Date;


   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'AltFirstDateToProcess', edtAltFirstDateToProcess.Date);
   finally
      FreeAndNil(iniFile);
   end;

   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'AltLastDateToProcess', edtAltLastDateToProcess.Date);
   finally
      FreeAndNil(iniFile);
   end;

   ReprocessDays(Sender);


   TimerOn(False);

end;

procedure TMainForm.ReprocessDays(Sender: TObject);
var
   iIdx: integer;

begin
   try

      edtOverrideDate.Date := dtAltFirstDateToProcess;

      repeat
         try
            try
               btnStartOfDayClick(Sender);
               ImportTSNHistory(Sender);
               ImportHDWHistory(Sender);
               ProcessTSNChanges(dm.tblRaces, dm.tblEntries);
               ImportTSNForToday(Sender);
               ImportHDWForToday(Sender);
               chkCreateExportFiles.Checked := True;
               chkCreateHospitalReport.Checked := False;
               chkCreateValueReport.Checked := True;
               chkCreateTipReport.Checked := True;
               chkCreateWagerReport.Checked := False;
               chkCreateContestReport.Checked := False;

               CreateReports(Sender);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         finally
            edtOverrideDate.Date := edtOverrideDate.Date + 1;
         end;
      until (edtOverrideDate.Date > dtAltLastDateToProcess);

   finally // wrap up
      edtOverrideDate.Date := Now();
   end; // try/finally
end;


procedure TMainForm.ReprocessEquibaseDays(Sender: TObject);
var
   iIdx: integer;

begin

   try

      edtOverrideDate.Date := dtAltFirstDateToProcess;

      repeat
         try
            try
               ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         finally
            edtOverrideDate.Date := edtOverrideDate.Date + 1;
         end;
      until (edtOverrideDate.Date > dtAltLastDateToProcess);

   finally // wrap up
      edtOverrideDate.Date := Now();
   end; // try/finally

end;




procedure TMainForm.btnCreateKeysClick(Sender: TObject);
begin
   try
      TimerOn(False);

      // Update_HH_PK_SK_DK_Keys(BATCH_SIZE, CREATE_ALL_TRUE, FINAL_ORDER_DAYS * 1);
      Create_FO_PK_SK_DK_Keys(BATCH_SIZE, True, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS * 2);
      //Create_Speed_Keys(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS * 8);
      //Create_FinalOrder_Key(BATCH_SIZE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);

      // a) Update Primary, Secondary, Default Keys In Horse History
      //Update_HH_PK_SK_DK_Keys(BATCH_SIZE, False, FINAL_ORDER_DAYS);

      // b) Create Final Order Table With Primary, Secondary, Default Keys From Horse History and Accum Stats
      //  Create_FO_PK_SK_DK_Keys(BATCH_SIZE, True, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
      //  Create_FO_PK_SK_DK_Keys(BATCH_SIZE, False, 3, 3);
        //UpdateSummaryTables(BATCH_SIZE, True, ONE_DAY_FALSE, STAT_DAYS);
      TimerOn(True);
      exit;

      Create_FO_LINER_Keys(BATCH_SIZE, LINER_ORDER_DAYS, LINER_ORDER_DAYS);
      //      Create_DIRT_FO_Keys(BATCH_SIZE, False, DIRT_ORDER_DAYS, DIRT_ORDER_DAYS);
      //      Create_TURF_FO_Keys(BATCH_SIZE, False, TURF_ORDER_DAYS, TURF_ORDER_DAYS);
      //      Create_MUD_FO_Keys(BATCH_SIZE, False, MUD_ORDER_DAYS, MUD_ORDER_DAYS);

            // c) Update Primary, Secondary, Default Keys In Horse History With Win % from Final Order
            //Update_PK_SK_DK_WinPct(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);

            // d) Update Primary, Secondary, Default Win Pct Rank In Horse History
            //Update_PK_SK_DK_WinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);

            // e) Create Final Win Order Key and Update Horse History With It
      Create_FinalOrder_Key(BATCH_SIZE, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);

      //Has to run this way
      // a) Update Final Key Win % In Horse History
      //Update_FK_WinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);

      // b) Index and Call SetRank
      //Update_FK_WinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);

      //UpdateTodaysWagerWinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
      //Update_TodaysWagerWinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
      //
      ////Has to run this way
      UpdateSummaryTables(BATCH_SIZE, True, ONE_DAY_FALSE, STAT_DAYS);
      //GenerateRankingStats(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
      //GenerateRankingStatsByTrack(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
      TimerOn(True);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.btnProcessTodayClick(Sender: TObject);
begin

   hLog.AddToLog('ProcessTodays', msevOperation);
   TimerOn(False);

   //  Create_FO_PK_SK_DK_Keys(BATCH_SIZE, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);

   //try
//      btnDownloadTSNClick-(Sender);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;

   try
      btnStartOfDayClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      ImportHDWHistory(Sender);
      ImportTSNHistory(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      btnDownloadTSNLSCClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      btnProcessLateChangesClick(sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      ImportHDWForToday(Sender);
      //ImportTSNForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      chkCreateHospitalReport.Checked := True;
      chkCreateValueReport.Checked := True;
      chkCreateTipReport.Checked := True;
      chkCreateWagerReport.Checked := False;
      chkCreateContestReport.Checked := False;
      chkFTPHospitalReport.Checked := False;
      chkFTPValueReport.Checked := False;
      chkCreateExportFiles.Checked := True;

      bCreateAll := False;
      btnCreateReportsClick(Sender);

      chkFTPHospitalReport.Checked := True;
      chkFTPValueReport.Checked := True;

      //btnDeleteAllFTPReportClick(Sender);
      //btnFTPReportsClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True);

end;

procedure TMainForm.btnProcessYesterdayClick(Sender: TObject);
begin

   hLog.AddToLog('ProcessYesterday', msevOperation);
   TimerOn(False);

   try
      edtOverrideDate.Date := Now() - 1;
      btnStartOfDayClick(Sender);
         ImportTSNHistory(Sender);
        ImportTSNForToday(Sender);
      ImportHDWHistory(Sender);
      ImportHDWForToday(Sender);
      //    if (chkCreateReports.Checked) then begin
        //         btnCreateReportsClick(Sender);
        //      end;
        //      if (chkFTPReports.Checked) then begin
        //         btnFtpReportsClick(Sender);
        //      end;


   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True);

end;

procedure TMainForm.btnProcessTomorrowClick(Sender: TObject);
begin
   hLog.AddToLog('ProcessTomorrow', msevOperation);
   TimerOn(False);

   edtOverrideDate.Date := Now() + 1;

   // try
 //      btnDownloadTSNClick(Sender);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;

   try
      btnStartOfDayClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      ImportTSNHistory(Sender);
      ImportHDWHistory(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //    ImportTSNForToday(Sender);
      ImportHDWForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      chkCreateHospitalReport.Checked := True;
      chkCreateValueReport.Checked := True;
      chkCreateTipReport.Checked := True;
      chkCreateWagerReport.Checked := False;
      chkCreateContestReport.Checked := False;
      chkFTPHospitalReport.Checked := False;
      chkFTPValueReport.Checked := False;

      bCreateAll := False;
      btnCreateReportsClick(Sender);

      chkFTPHospitalReport.Checked := True;
      chkFTPValueReport.Checked := True;

      //btnDeleteAllFTPReportClick(Sender);
      //btnFTPReportsClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True)
end;

procedure TMainForm.cxButton2Click(Sender: TObject);
var
   iIdx: integer;

   fEarlyPacePosH: double;
   fMiddlePacePosH: double;
   fTestPacePosH: double;

   aEarlyPacePosH: array of double;

   i, NData: Integer;
   s, t: double;

begin
   //yyyy-mm-dd
   //hh:mm:ss.zzz ampm
   //.
   //44

   fEarlyPacePosH := 0;
   fMiddlePacePosH := 0;
   fTestPacePosH := 0;

   SetLength(aEarlyPacePosH, 12);

   aEarlyPacePosH[0] := 1;
   aEarlyPacePosH[1] := 3;
   aEarlyPacePosH[2] := 3;
   aEarlyPacePosH[3] := 4;
   aEarlyPacePosH[4] := 6;
   aEarlyPacePosH[5] := 5;
   aEarlyPacePosH[6] := 5;
   aEarlyPacePosH[7] := 6;
   aEarlyPacePosH[8] := 6;
   aEarlyPacePosH[9] := 4;
   aEarlyPacePosH[10] := 7;
   aEarlyPacePosH[11] := 8;
   fEarlyPacePosH := HarmonicMean(aEarlyPacePosH);
   fEarlyPacePosH := GeometricMean(aEarlyPacePosH);


   NData := 12;
   s := 0.0;
   for i := 0 to NData - 1 do begin
      t := aEarlyPacePosH[i];
      s := s + (1.0 / t);
   end;

   fTestPacePosH := NData / s;

end;


procedure TMainForm.cxButton3Click(Sender: TObject);
begin
   try
      if not assigned(EntryForm) then begin
         EntryForm := TEntryForm.Create(Application);
      end;
      try
         EntryForm.ShowModal;
      finally
         EntryForm.Free;
         EntryForm := nil;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.btnConnectionsClick(Sender: TObject);
begin
   try
      if not assigned(ConnectionForm) then begin
         ConnectionForm := TConnectionForm.Create(Application);
      end;
      try
         ConnectionForm.ShowModal;
      finally
         FreeAndNil(ConnectionForm);
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure TMainForm.btnBatchSelectNoneClick(Sender: TObject);
begin

   chkUpdateHHFromEquibase.Checked := False;
   chkUpdateALLRatings.Checked := False;
   chkGenRankingStats.Checked := False;
   chkGenRankingStatsByTrack.Checked := False;
   chkUpdateCreatePKSKDK.Checked := False;
   chkUpdateCreateFK.Checked := False;
   chkUpdateTodaysWagerOrder.Checked := False;
end;

procedure TMainForm.btnBatchSelectAllClick(Sender: TObject);
begin

   chkUpdateHHFromEquibase.Checked := True;
   chkUpdateALLRatings.Checked := True;
   chkGenRankingStats.Checked := True;
   chkGenRankingStatsByTrack.Checked := True;
   chkUpdateCreatePKSKDK.Checked := True;
   chkUpdateCreateFK.Checked := True;
   chkUpdateTodaysWagerOrder.Checked := True;

end;

procedure TMainForm.btnUpdateRankingsClick(Sender: TObject);
var
   iIdx: integer;
   eCnt: Extended;
   iCnt: integer;
begin

   TimerOn(False);
   gbSuppressTimerOn := True;

   if chkUpdateYouBetBankWagers.Checked then begin
      UpdateWagersFromHH();
   end;

   if chkAddEquibaseCharts.Checked then begin
      // Adds all charts/results from disk
      AddToEquibaseCharts(False);
      AddToEquibaseResults(False);
   end;


   if chkAddDRFCharts.Checked then begin
      // Adds all charts/results from disk
      AddToDRFResults(False);
      AddToDRFCharts(False);
   end;

   if chkUpdateHHFromEquibase.Checked then begin
      // Updates finish, odds based on  downloads
      // UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, dm.tblTrainer, dm.tblJockey, dm.tblOwner, dm.tblRankingStats, dm.tblRankingStatsByTrk, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
      UpdateTipSheetSelections(dm.tblRH, dm.tblHH, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
      //      ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, Sender, False);
      ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   end;

   if chkUpdateHHFromDRF.Checked then begin
      // Updates finish, odds based on  downloads
      ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, OVERRIDE_DATE_FALSE);
   end;

   if chkUpdateALLRatings.Checked then begin
      try
         UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, TRN_STAT_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;


   if chkUpdateCreatePKSKDK.Checked then begin
      try
         // a) Update Primary, Secondary, Default Keys In Horse History
         //Update_HH_PK_SK_DK_Keys(BATCH_SIZE, False, RANKING_DAYS);
         // b) Create Final Order Table With Primary, Secondary, Default Keys From Horse History and Accum Stats
         Create_FO_PK_SK_DK_Keys(BATCH_SIZE, True, False, RANKING_DAYS, RANKING_DAYS);
         //   Create_FO_PK_SK_DK_Keys(BATCH_SIZE, True, False, 7, 7);
            //Create_FO_LINER_Keys(BATCH_SIZE, LINER_ORDER_DAYS, LINER_ORDER_DAYS);
            // c) Update Primary, Secondary, Default Keys In Horse History With Win % from Final Order
            //Update_PK_SK_DK_WinPct(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
            // d) Update Primary, Secondary, Default Win Pct Rank In Horse History
            //Update_PK_SK_DK_WinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
            // e) Create Final Win Order Key and Update Horse History With It
            //Create_FO_FK_Key(BATCH_SIZE, False, RANKING_DAYS, RANKING_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   if chkUpdateCreateFK.Checked then begin
      try
         //Has to run this way
         // a) Update Final Key Win % In Horse History
         Update_FinalOrder_WinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
         // b) Index and Call SetRank
         Update_FinalOrder_WinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
         // f) Index and Call SetRank
         //Update_PK_SK_DK_FK_ValueBetRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   if chkUpdateTodaysWagerOrder.Checked then begin
      try
         UpdateTodaysWagerWinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS, NORMAL_ORDER);
         UpdateTodaysWagerWinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   if chkGenRankingStats.Checked then begin
      try
         GenerateRankingStats(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   if chkGenRankingStatsByTrack.Checked then begin
      try
         GenerateRankingStatsByTrack(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   gbSuppressTimerOn := False;
   TimerOn(True);

end;

procedure TMainForm.btnProcessDailyClick(Sender: TObject);
begin

   hLog.AddToLog('ProcessTodays', msevOperation);
   TimerOn(False);

   //   try
   //      btnStartOfDayClick(Sender);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   try
   //      ImportTSNHistory(Sender);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   try
      ImportTSNForToday(Sender);
      ImportHDWForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


   TimerOn(True);
   exit;
   hLog.AddToLog('ProcessYesterday', msevOperation);
   TimerOn(False);

   try
      //      edtOverrideDate.Date := Now() + 1;
       //     if (chkDownloadAxcis.Checked) then begin
       //        btnDownloadAxcisClick(Sender);
       //     end;

      btnStartOfDayClick(Sender);
      btnImportClick(Sender);
      //   if (chkDownloadAxcis.Checked) then begin
   //   btnDownloadTSNClick(Sender);
      //    end;
      btnCreateTodaysRatingsClick(Sender);
      btnImportTodayClick(Sender);

      if (chkCreateReports.Checked) then begin
         btnCreateReportsClick(Sender);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      edtOverrideDate.Date := Now();
      if (chkDownloadAxcis.Checked) then begin
         btnDownloadAxcisClick(Sender);
      end;

      btnStartOfDayClick(Sender);
      btnImportClick(Sender);
      //  if (chkDownloadAxcis.Checked) then begin
    //btnDownloadTSNClick(Sender);
      //   end;
      btnCreateTodaysRatingsClick(Sender);
      btnImportTodayClick(Sender);

      if (chkCreateReports.Checked) then begin
         btnCreateReportsClick(Sender);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True);




end;

procedure TMainForm.navItemFinalOrderClick(Sender: TObject);

begin

   try
      if not assigned(FinalOrderForm) then begin
         FinalOrderForm := TFinalOrderForm.Create(Application);
      end;
      try
         FinalOrderForm.ShowModal;
      finally
         FreeAndNil(FinalOrderForm);
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.btnAnalysisFinalOrderFormClick(Sender: TObject);
begin

   try
      if not assigned(FinalOrderForm) then {//}  begin
         FinalOrderForm := TFinalOrderForm.Create(Application);
      end;
      try
         FinalOrderForm.ShowModal;
      finally
         FreeAndNil(FinalOrderForm);
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.btnRankingsFormClick(Sender: TObject);
begin

   try
      if not assigned(RankingForm) then begin
         RankingForm := TRankingForm.Create(Application);
      end;
      RankingForm.ShowModal
   except
   end;

end;

procedure TMainForm.btnTodaysEntriesFormClick(Sender: TObject);
begin
   try
      if not assigned(EntryForm) then begin
         EntryForm := TEntryForm.Create(Application);
      end;
      EntryForm.ShowModal
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.btnConnectionsFormClick(Sender: TObject);
begin

   try
      if not assigned(ConnectionForm) then begin
         ConnectionForm := TConnectionForm.Create(Application);
      end;
      ConnectionForm.ShowModal
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.cxButton5Click(Sender: TObject);
var
   sFileName: string;
   sBuf: string;
   iIdx: integer;
   bClearTotals: boolean;

begin
   //try
//      UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   try
//      UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
   gbOpenCloseFiles := True;
   CloseTable(dm.tblRaces);
   CloseTable(dm.tblEntries);
   CloseTable(dm.tblGimmicks);
   try
      UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   OpenTable(dm.tblRaces);
   OpenTable(dm.tblEntries);
   OpenTable(dm.tblGimmicks);
   gbOpenCloseFiles := False;
   exit;
   // try
 //      UpdateOddsProbability(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;
 //
 //   try
 //      UpdateProbabilityLines(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;

    // This uses TodaysWagerChoices
  //  try
 //      UpdateReportSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;
 //
 //   try
 //      UpdateWagerSelectedRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;
 //

 //   try
 //      CreateWagers(dm.tblRaces, dm.tblEntries, dm.tblBank, dm.tblWagers, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
 //   except
 //      on E: Exception do hLog.AddToLog(E.Message, msevException);
 //   end;
 //   exit;
   TimerOn(False);
   try
      UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   gbOpenCloseFiles := True;
   CloseTable(dm.tblRaces);
   CloseTable(dm.tblEntries);
   CloseTable(dm.tblGimmicks);
   try
      UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   OpenTable(dm.tblRaces);
   OpenTable(dm.tblEntries);
   OpenTable(dm.tblGimmicks);
   gbOpenCloseFiles := False;
   //     try
 //               IndexToday(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
 //            except
 //               on E: Exception do hLog.AddToLog(E.Message, msevException);
 //            end;
 //
   exit;


   TimerOn(True);
   chkSuppressAutomaticProcessing.Checked := True;
   gbOpenCloseFiles := False;
   try
      btnDownloadTSNLSCClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      btnProcessLateChangesClick(sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //     ImportTSNForToday(Sender);
      ImportHDWHistory(Sender);
      ImportHDWForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      chkCreateHospitalReport.Checked := True;
      chkCreateValueReport.Checked := True;
      chkCreateTipReport.Checked := True;
      chkCreateWagerReport.Checked := False;
      chkCreateContestReport.Checked := False;
      chkFTPHospitalReport.Checked := False;
      chkFTPValueReport.Checked := False;
      chkCreateExportFiles.Checked := True;

      bCreateAll := False;
      btnCreateReportsClick(Sender);

      chkFTPHospitalReport.Checked := True;
      chkFTPValueReport.Checked := True;

      //btnDeleteAllFTPReportClick(Sender);
      //btnFTPReportsClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   exit;
   try
      Create_FO_PK_SK_DK_Keys(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
      Create_FinalOrder_Key(BATCH_SIZE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   chkSuppressAutomaticProcessing.Checked := False;
   TimerOn(True);
   exit;

   //   try
   //      Create_FO_PK_SK_DK_Keys(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
   //
   //      UpdateTodaysWagerWinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, FINAL_ORDER_DAYS, NORMAL_ORDER);
   //      UpdateTodaysWagerWinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
   //
   //      Create_FinalOrder_Key(BATCH_SIZE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
   //
   //      Update_FinalOrder_WinPct(dm.tblRH, dm.tblHH, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
   //
   //      Update_FinalOrder_WinPctRank(dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, FINAL_ORDER_DAYS);
   //
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
      // try
      //      IndexPedigree(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;
      //

        // try
      //      btnStartOfDayClick(Sender);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;
      //
      //   try
      //      ImportTSNHistory(Sender);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;

      //   try
      //      IndexPedigree(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;


         //   bProcessAllDates := True;
         //   sProcessAllDatesPath := 'c:\TsnDownload\Results\2006\';
         //   sProcessAllDatesSearch := '*.zip';
         //   sProcessAllDatesSearchXrd := '*.xrd';
         //   ImportTSNResults(Sender, dm.tblRH, dm.tblHH);

         //   bProcessAllDates := True;
         //   sProcessAllDatesPath := 'c:\TsnDownload\Results\2007\';
         //   sProcessAllDatesSearch := '*.zip';
         //   sProcessAllDatesSearchXrd := '*.xrd';
         //   ImportTSNResults(Sender, dm.tblRH, dm.tblHH);

         //   bProcessAllDates := True;
         //   sProcessAllDatesPath := 'c:\TsnDownload\Results\2008\';
         //   sProcessAllDatesSearch := '*.zip';
         //   sProcessAllDatesSearchXrd := '*.xrd';
         //   ImportTSNResults(Sender, dm.tblRH, dm.tblHH);
         //

         //   bProcessAllDates := True;
         //   sProcessAllDatesPath := 'c:\TsnDownload\Results\2009\';
         //   sProcessAllDatesSearch := '*.zip';
         //   sProcessAllDatesSearchXrd := '*.xrd';
         //   ImportTSNResults(Sender, dm.tblRH, dm.tblHH);

   exit;
   TimerOn(False);
   chkSuppressAutomaticProcessing.Checked := False;
   gbOpenCloseFiles := True;
   CloseTable(dm.tblRaces);
   CloseTable(dm.tblEntries);

   OpenTable(dm.tblRaces);
   OpenTable(dm.tblEntries);
   gbOpenCloseFiles := False;
   exit;
   //
         //   try
//               UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
//            except
//               on E: Exception do hLog.AddToLog(E.Message, msevException);
//            end;

            // This uses fields update in UpdateTipSelections
   try
      UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   exit;

   //   try
   //      UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   // This uses TodaysWagerChoices
   //   try
   //      UpdateReportSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;

   gbOpenCloseFiles := True;
   CloseTable(dm.tblRaces);
   CloseTable(dm.tblEntries);
   CloseTable(dm.tblGimmicks);
   try
      UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   OpenTable(dm.tblRaces);
   OpenTable(dm.tblEntries);
   OpenTable(dm.tblGimmicks);
   gbOpenCloseFiles := False;

   try
      UpdateATrainerList(dm.tblRaces, dm.tblEntries, dm.tblATrainerList, pnlPrgBar, prgBar, staBar);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


   try
      UpdateHHFromToday(dm.tblRaces, dm.tblEntries, dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, 100);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


   //
   chkSuppressAutomaticProcessing.Checked := False;
   TimerOn(True);
   exit;
   //


end;



procedure TMainForm.btnFTPReportsNoneClick(Sender: TObject);
begin

   chkFTPWagerReport.Checked := False;
   chkFTPContestReport.Checked := False;
   chkFTPAngleReport.Checked := False;
   chkFTPTipReport.Checked := False;
   chkFTPHospitalReport.Checked := False;
   chkFTPHarnessValueReport.Checked := False;
   chkFTPValueReport.Checked := False;
   chkFTPGimmickReport.Checked := False;
   chkFTPSelectionReport.Checked := False;
   chkFTPMikeReport.Checked := False;
   chkFTPJimReport.Checked := False;
   chkFTPHarnessReport.Checked := False;
   chkFTPExportFiles.Checked := False;

end;

procedure TMainForm.AdjustFinalWinPct
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );
begin

   if (bOneDay) then begin
      exit;
   end;

   try
      OpenTable(tblE);

      tblE.IndexName := 'ByFinalWinPctRank';
      tblE.SetKey();

      tblE.First();
      while not tblE.Eof do begin
         UpdateEntriesProgressStatusBar(tblE,
            'Adjusting Final Win Pct Rank - ');

         if (tblE.FieldByName('TrkCode').AsString = '') then begin
            tblE.Next();
            continue;
         end;

         if ((tblE.FieldByName('FinalWinPctRank').AsInteger = 101) and
            (tblE.FieldByName('MorningLineTo1').AsFloat > MAX_VALUE_ML_ODDS))
            then begin
            tblE.Edit();
            tblE.FieldByName('FinalWinPct').AsFloat :=
               tblE.FieldByName('FinalWinPctRank').AsFloat;
            tblE.Post();
         end;

         if ((tblE.FieldByName('FinalWinPctRank').AsInteger = 1) and
            (tblE.FieldByName('MorningLineTo1').AsFloat > MAX_VALUE_ML_ODDS))
            then begin
            tblE.Edit();
            tblE.FieldByName('FinalWinPct').AsFloat :=
               tblE.FieldByName('FinalWinPctRank').AsFloat;
            tblE.Post();
         end;

         tblE.Next();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         CloseTable(tblE);
         ClearPrgStatusBars();
      end;
   end;
   CloseTable(tblE);
   ClearPrgStatusBars();

end;



procedure TMainForm.btnDownloadDRFResultsClick(Sender: TObject);
begin
   TimerOn(False);
   DownloadDRFResults(Sender);
   TimerOn(True);

end;

procedure TMainForm.DownloadDRFResults(Sender: TObject);
var
   sTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLResultsToDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();

      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin

         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end else begin

         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end;
   end;

begin

   hLog.AddToLog('DownloadDRFResults - Start', msevOperation);

   try
      OpenTable(dm.tblDRF);
      OpenTable(dm.tblTrack);
      OpenTable(dm.tblVendor);
      OpenTable(dm.tblProcessed);

      try

         CheckProxy();

         if LOCATION = 'Home' then begin
            idHTTP.ProxyParams.ProxyServer := '';
            idHTTP.ProxyParams.ProxyPort := 80;
         end;

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         InitPrgBar(dm.tblTrack.RecordCount);
         dm.tblTrack.First();

         while not dm.tblTrack.Eof do begin
            IncPrgBar();
            sStatusBar := 'Download DRF Results';
            Application.ProcessMessages();
            try
               dm.tblVendor.IndexName := '';
               dm.tblVendor.SetKey();
               dm.tblVendor.FieldByName('Vendor').AsString := 'DRF';
               dm.tblVendor.FieldByName('Product').AsString := 'Results';
               if (dm.tblVendor.GotoKey()) then begin
                  sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
                  sTrkCode := Trim(sTrkCode);

                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
                  sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
                  sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
                  sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

                  sDownloadLocation := DRF_RESULTS_PATH;

                  sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
                  sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
                  sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

                  idHTTP.Request.Host := INTERNET_DRF_HOME_PAGE;

                  if gbUseOverrideDate then begin
                     dtDownloadDate := edtOverrideDate.Date;
                  end else begin
                     dtDownloadDate := Now() - 1;
                  end;
                  DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

                  //
                  dm.tblProcessed.IndexName := '';
                  dm.tblProcessed.SetKey();
                  dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
                  dm.tblProcessed.FieldByName('RaceDate').Value :=
                     dtDownloadDate;
                  if (not dm.tblProcessed.GotoKey()) then begin
                     dm.tblTrack.Next();
                     continue;
                  end else begin
                     if
                        (dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean) then begin
                        dm.tblTrack.Next();
                        continue;
                     end;
                  end;

                  //
                  sFileName := sm.Str(wYear, 4) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
                  sDownloadFullFileName := sDownloadLocation + sFileName;

                  iAttributes := faAnyFile;
                  if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                     then begin
                     if (tsFile.Size < MIN_DRF_FILE_SIZE) then begin
                        DeleteFile(sDownloadFullFileName);
                        Application.ProcessMessages();
                     end;
                  end;
                  FindClose(tsFile);

                  sServerFullFileName := sBaseImportPath + sm.Str(wDay, 2) + '/' + 'r' + Trim(sTrkCode) + sm.Str(wDay, 2) + '.' +
                     sDownloadFileType;
                  lblServerPath.Caption := sServerFullFileName;
                  lblLocalPath.Caption := sDownloadFullFileName;

                  if FileExists(sDownloadFullFileName) then begin
                     AddHTMLResultsToDRF();
                  end else begin
                     if (DownLoadFile(sServerFullFileName,
                        sDownloadFullFileName)) then begin
                        AddHTMLResultsToDRF();
                        staBar.SimpleText := sDownloadFullFileName;
                        Application.ProcessMessages();
                     end;
                  end;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            Sleep(SLEEP_LONG);
            dm.tblTrack.Next();
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(dm.tblDRF);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);

      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      hLog.AddToLog('DownloadDRFResults - Exit', msevOperation);
      ClearPrgStatusBars();
   end;

end;

procedure TMainForm.btnDownloadDRFChartsClick(Sender: TObject);
begin

   TimerOn(False);
   DownloadDRFCharts(Sender);
   TimerOn(True);

end;

procedure TMainForm.DownloadDRFCharts(Sender: TObject);
var
   sTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sBuf: string;
   msText: TMemoryStream;

   procedure AddHTMLChartsToDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();
      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin
         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end else begin
         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sDownloadFullFileName);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sDownloadFullFileName);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean := True;
            dm.tblProcessed.Post();
         end;

      end;
   end;

begin

   CheckProxy();

   if LOCATION = 'Home' then begin
      idHTTP.ProxyParams.ProxyServer := '';
      idHTTP.ProxyParams.ProxyPort := 80;
   end;

   OpenTable(dm.tblDRF);
   OpenTable(dm.tblTrack);
   OpenTable(dm.tblVendor);
   OpenTable(dm.tblProcessed);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      InitPrgBar(dm.tblTrack.RecordCount);
      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         sStatusBar := 'Download DRF Charts';
         Application.ProcessMessages();
         try
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'DRF';
            dm.tblVendor.FieldByName('Product').AsString := 'Charts';
            if (dm.tblVendor.GotoKey()) then begin
               sTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sTrkCode := Trim(sTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := LowerCase(dm.tblVendor.FieldByName('DownloadFileType').AsString);
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := DRF_CHARTS_PATH;

               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_DRF_HOME_PAGE;
               idHTTP.Request.BasicAuthentication := False;
               idHTTP.Request.Username := '';
               idHTTP.Request.Password := '';

               if gbUseOverrideDate then begin
                  dtDownloadDate := edtOverrideDate.Date;
               end else begin
                  dtDownloadDate := Now() - 1;
               end;
               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

               //
               dm.tblProcessed.IndexName := '';
               dm.tblProcessed.SetKey();
               dm.tblProcessed.FieldByName('TrkCode').AsString := sTrkCode;
               dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
               if (not dm.tblProcessed.GotoKey()) then begin
                  dm.tblTrack.Next();
                  continue;
               end else begin
                  if
                     (dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean) then begin
                     dm.tblTrack.Next();
                     continue;
                  end;
               end;
               //

               sFileName := sm.Str(wYear, 5) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '-' + Trim(sTrkCode) + '.' + sDownloadFileType;
               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                  then begin
                  if (tsFile.Size < 20000) then begin
                     DeleteFile(sDownloadFullFileName);
                     Application.ProcessMessages();
                  end;
               end;
               FindClose(tsFile);

               sServerFullFileName := sBaseImportPath + sm.Str(wDay, 2) + '/' + 'c' + Trim(sTrkCode) + sm.Str(wDay, 2) + '.' + sDownloadFileType;
               lblServerPath.Caption := sServerFullFileName;
               lblLocalPath.Caption := sDownloadFullFileName;
               if FileExists(sDownloadFullFileName) then begin
                  AddHTMLChartsToDRF();
               end else begin
                  if (DownLoadFile(sServerFullFileName, sDownloadFullFileName))
                     then begin
                     AddHTMLChartsToDRF();
                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
   except
      CloseTable(dm.tblDRF);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
      Exit;
   end;

   CloseTable(dm.tblDRF);
   CloseTable(dm.tblTrack);
   CloseTable(dm.tblVendor);
   CloseTable(dm.tblProcessed);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   ClearPrgStatusBars();

end;

procedure TMainForm.btnOptionsClick(Sender: TObject);
begin

   try
      if not assigned(OptionsForm) then {//}  begin
         OptionsForm := TOptionsForm.Create(Application);
      end;
      try
         OptionsForm.ShowModal;
      finally
         FreeAndNil(OptionsForm);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


procedure TMainForm.btnAddDRFChartsFromDiskClick(Sender: TObject);
begin

   AddToDRFCharts(ONE_DAY_TRUE);

end;


procedure TMainForm.AddToDRFCharts(bUseOverrideDate: boolean);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;
   sTrkCode: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   sPath: string;

   sMM: string;
   sDD: string;
   sYY: string;
   iLen: Integer;

   sBuf: string;
   msText: TMemoryStream;

   procedure UpdateDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();
      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin

         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean :=
               True;
            dm.tblProcessed.Post();
         end;

      end else begin

         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLCharts.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFCharts(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFChartsDownloaded').AsBoolean :=
               True;
            dm.tblProcessed.Post();
         end;
      end;

   end;

begin

   try

      OpenTable(dm.tblDRF);
      OpenTable(dm.tblProcessed);

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      pgCtrlMain.ActivePage := tabDaily;

      //******
      iAttributes := faAnyFile;
      sPath := DRF_CHARTS_PATH;

      if bUseOverrideDate then begin
         DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
         sSearch := sPath + '*' + sm.Str(wYear, 4) + sm.Str(wMonth, 2) +
            sm.Str(wDay, 2) + '*.html';
      end else begin
         sSearch := sPath + '*.html';
      end;

      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := SmartPos('-', tsFile.Name);

         sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos - iStartPos)
            - 1));
         sTrkCode := UpperCase(sTrkCode);

         sTmp := CopyStr(tsFile.Name, 1, 9);
         sYY := CopyStr(sTmp, 2, 4);
         sMM := CopyStr(sTmp, 6, 2);
         sDD := CopyStr(sTmp, 8, 2);

         wDay := atow(sDD);
         wMonth := atow(sMM);
         wYear := atow(sYY);
         dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
         UpdateDRF();
      end;

      while (FindNext(tsFile) = 0) do begin
         UpdateStatusBar(sPath + tsFile.Name);

         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := SmartPos('-', tsFile.Name);

         sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos - iStartPos)
            - 1));
         sTrkCode := UpperCase(sTrkCode);

         sTmp := CopyStr(tsFile.Name, 1, 9);
         sYY := CopyStr(sTmp, 2, 4);
         sMM := CopyStr(sTmp, 6, 2);
         sDD := CopyStr(sTmp, 8, 2);

         wDay := atow(sDD);
         wMonth := atow(sMM);
         wYear := atow(sYY);
         dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
         UpdateDRF();
      end;

      FindClose(tsFile);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         FindClose(tsFile);
         CloseTable(dm.tblDRF);
         CloseTable(dm.tblProcessed);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(dm.tblDRF);
   CloseTable(dm.tblProcessed);
   ClearPrgStatusBars();

end;

procedure TMainForm.btnAddDRFResultsFromDiskClick(Sender: TObject);
begin

   AddToDRFResults(True);

end;

procedure TMainForm.AddToDRFResults(bUseOverrideDate: boolean);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;
   sTrkCode: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   sPath: string;

   sMM: string;
   sDD: string;
   sYY: string;
   iLen: Integer;
   sBuf: string;
   msText: TMemoryStream;

   procedure UpdateDRF();
   begin
      dm.tblDRF.IndexName := '';
      dm.tblDRF.SetKey();
      dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblDRF.GotoKey()) then begin
         dm.tblDRF.Edit();
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean :=
               True;
            dm.tblProcessed.Post();
         end;

      end else begin
         dm.tblDRF.Append();
         dm.tblDRF.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblDRF.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblDRF.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblDRFHTMLResults.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseDRFResults(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblDRFResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblDRF.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsDRFResultsDownloaded').AsBoolean :=
               True;
            dm.tblProcessed.Post();
         end;
      end;
   end;

begin

   try

      OpenTable(dm.tblDRF);
      OpenTable(dm.tblProcessed);

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;
      pgCtrlMain.ActivePage := tabDaily;

      //******
      iAttributes := faAnyFile;
      sPath := DRF_RESULTS_PATH;
      if bUseOverrideDate then begin
         DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
         sSearch := sPath + '*' + sm.Str(wYear, 4) + sm.Str(wMonth, 2) +
            sm.Str(wDay, 2) + '*.html';
      end else begin
         sSearch := sPath + '*.html';
      end;

      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := SmartPos('-', tsFile.Name);

         sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos - iStartPos)
            - 1));
         sTrkCode := UpperCase(sTrkCode);

         sTmp := CopyStr(tsFile.Name, 1, 9);
         sYY := CopyStr(sTmp, 1, 4);
         sMM := CopyStr(sTmp, 5, 2);
         sDD := CopyStr(sTmp, 7, 2);

         wDay := atow(sDD);
         wMonth := atow(sMM);
         wYear := atow(sYY);
         dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
         UpdateDRF();
      end;

      while (FindNext(tsFile) = 0) do begin
         UpdateStatusBar(sPath + tsFile.Name);

         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := SmartPos('-', tsFile.Name);

         sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos - iStartPos)
            - 1));
         sTrkCode := UpperCase(sTrkCode);

         sTmp := CopyStr(tsFile.Name, 1, 9);
         sYY := CopyStr(sTmp, 1, 4);
         sMM := CopyStr(sTmp, 5, 2);
         sDD := CopyStr(sTmp, 7, 2);

         wDay := atow(sDD);
         wMonth := atow(sMM);
         wYear := atow(sYY);
         dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
         UpdateDRF();

      end;
      FindClose(tsFile);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         FindClose(tsFile);
         CloseTable(dm.tblDRF);
         CloseTable(dm.tblProcessed);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(dm.tblDRF);
   CloseTable(dm.tblProcessed);
   ClearPrgStatusBars();

end;

procedure TMainForm.btnAddEquibaseChartsFromDiskClick(Sender: TObject);
begin

   AddToEquibaseCharts(True);

end;

procedure TMainForm.AddToEquibaseCharts(bUseOverrideDate: boolean);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;
   sTrkCode: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   sPath: string;

   sMM: string;
   sDD: string;
   sYY: string;
   iLen: Integer;

   sBuf: string;
   msText: TMemoryStream;

   procedure UpdateEquibase();
   begin
      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin

         dm.tblEquibase.Edit();
         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean
               := True;
            dm.tblProcessed.Post();
         end;
      end else begin

         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblEquibase.FieldByName('IsChartsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLCharts.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseCharts(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseCharts.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;

         dm.tblEquibase.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsEquibaseChartsDownloaded').AsBoolean
               := True;
            dm.tblProcessed.Post();
         end;

      end;
   end;

begin

   try
      try

         OpenTable(dm.tblEquibase);
         OpenTable(dm.tblProcessed);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;
         pgCtrlMain.ActivePage := tabDaily;

         //******
         iAttributes := faAnyFile;
         sPath := EQUIBASE_CHARTS_PATH;

         if bUseOverrideDate then begin
            DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
            sSearch := sPath + '*' + sm.Str(wYear, 4) + sm.Str(wMonth, 2) +
               sm.Str(wDay, 2) + '*.html';
         end else begin
            sSearch := sPath + '*.html';
         end;

         UpdateStatusBar(sSearch);

         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := SmartPos('-', tsFile.Name);

            sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos -
               iStartPos) - 1));
            sTrkCode := UpperCase(sTrkCode);

            sTmp := CopyStr(tsFile.Name, 1, 9);
            sYY := CopyStr(sTmp, 2, 4);
            sMM := CopyStr(sTmp, 6, 2);
            sDD := CopyStr(sTmp, 8, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYY);
            dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
            UpdateEquibase();
         end;

         while (FindNext(tsFile) = 0) do begin
            UpdateStatusBar(sPath + tsFile.Name);

            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := SmartPos('-', tsFile.Name);

            sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos -
               iStartPos) - 1));
            sTrkCode := UpperCase(sTrkCode);

            sTmp := CopyStr(tsFile.Name, 1, 9);
            sYY := CopyStr(sTmp, 2, 4);
            sMM := CopyStr(sTmp, 6, 2);
            sDD := CopyStr(sTmp, 8, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYY);
            dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
            UpdateEquibase();
         end;

         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;
   finally
      FindClose(tsFile);
      CloseTable(dm.tblEquibase);
      CloseTable(dm.tblProcessed);
      ClearPrgStatusBars();
   end;

end;

procedure TMainForm.btnAddEquibaseResultsFromDiskClick(Sender: TObject);
begin

   AddToEquibaseResults(True);

end;

procedure TMainForm.AddToEquibaseResults(bUseOverrideDate: boolean);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;
   sTrkCode: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;

   sPath: string;

   sMM: string;
   sDD: string;
   sYY: string;
   iLen: Integer;
   sBuf: string;
   msText: TMemoryStream;

   procedure UpdateEquibase();
   begin
      dm.tblEquibase.IndexName := '';
      dm.tblEquibase.SetKey();
      dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
      dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
      if (dm.tblEquibase.GotoKey()) then begin

         dm.tblEquibase.Edit();
         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean
               := True;
            dm.tblProcessed.Post();
         end;

      end else begin

         dm.tblEquibase.Append();
         dm.tblEquibase.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblEquibase.FieldByName('RaceDate').Value := dtDownloadDate;
         dm.tblEquibase.FieldByName('IsResultsDownloaded').AsBoolean := True;
         dm.tblEquibaseHTMLResults.LoadFromFile(sPath + tsFile.Name);
         try
            msText := TMemoryStream.Create;
            sBuf := ParseEquibaseResults(sPath + tsFile.Name);
            msText.WriteBuffer(sBuf[1], Length(sBuf));
            dm.tblEquibaseResults.LoadFromStream(msText);
         finally
            FreeAndNil(msText);
         end;
         dm.tblEquibase.Post();

         dm.tblProcessed.SetKey();
         dm.tblProcessed.FieldByName('TrkCode').Value := sTrkCode;
         dm.tblProcessed.FieldByName('RaceDate').Value := dtDownloadDate;
         if (dm.tblProcessed.GotoKey()) then begin
            dm.tblProcessed.Edit();
            dm.tblProcessed.FieldByName('IsEquibaseResultsDownloaded').AsBoolean
               := True;
            dm.tblProcessed.Post();
         end;
      end;
   end;

begin

   try
      try

         OpenTable(dm.tblEquibase);
         OpenTable(dm.tblProcessed);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         pgCtrlMain.ActivePage := tabDaily;

         //******
         iAttributes := faAnyFile;
         sPath := EQUIBASE_RESULTS_PATH;

         if bUseOverrideDate then begin
            DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
            sSearch := sPath + '*' + sm.Str(wYear, 4) + sm.Str(wMonth, 2) +
               sm.Str(wDay, 2) + '*.html';
         end else begin
            sSearch := sPath + '*.html';
         end;

         UpdateStatusBar(sSearch);

         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := SmartPos('-', tsFile.Name);

            sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos -
               iStartPos) - 1));
            sTrkCode := UpperCase(sTrkCode);

            sTmp := CopyStr(tsFile.Name, 1, 9);
            sYY := CopyStr(sTmp, 1, 4);
            sMM := CopyStr(sTmp, 5, 2);
            sDD := CopyStr(sTmp, 7, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYY);
            dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
            UpdateEquibase();
         end;

         while (FindNext(tsFile) = 0) do begin
            UpdateStatusBar(sPath + tsFile.Name);

            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := SmartPos('-', tsFile.Name);

            sTrkCode := CopyStr(tsFile.Name, iStartPos + 1, ((iEndPos -
               iStartPos) - 1));
            sTrkCode := UpperCase(sTrkCode);

            sTmp := CopyStr(tsFile.Name, 1, 9);
            sYY := CopyStr(sTmp, 1, 4);
            sMM := CopyStr(sTmp, 5, 2);
            sDD := CopyStr(sTmp, 7, 2);

            wDay := atow(sDD);
            wMonth := atow(sMM);
            wYear := atow(sYY);
            dtDownloadDate := EncodeDate(wYear, wMonth, wDay);
            UpdateEquibase();
         end;

         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      FindClose(tsFile);
      CloseTable(dm.tblEquibase);
      CloseTable(dm.tblProcessed);
      ClearPrgStatusBars();
   end;
end;


function TMainForm.ParseEquibaseCharts(sFileName: string): string;
var s: string;
   sIn: string;
begin
   try
      Result := '';

      DHtmlParse.SourceStream := TFileStream.Create(sFileName, fmOpenRead or
         fmShareDenyWrite);

      while DHtmlParse.ParseNextPiece do begin
         case DHtmlParse.PieceType of
            ptASP:
               continue;

            ptCDataSection:
               continue;

            ptComment:
               continue;

            ptCustomTag:
               continue;

            ptDTD:
               continue;

            ptHtmlTag: begin
                  case DHtmlParse.HtmlTag.TagID of
                     TAG_TD_ID: begin
                           S := S + '|';
                        end;

                     TAG_TR_ID: begin
                           S := S + #13 + #10;
                        end;
                  end;
               end;

            ptPHP:
               continue;

            ptHtmlPI:
               continue;

            ptScript:
               S := S + DHtmlParse.DataAsStrA;

            ptSsiTag:
               continue;

            ptStyle:
               continue;

            ptTitle:
               continue;

            ptXmlPI:
               continue;

            ptText: begin
                  S := S + Trim(DHtmlParse.DataAsStrA);
               end;

            ptUndefined:
               continue;
         else
            continue;
         end;
      end;

   finally
      S := FastReplace(S, '&nbsp;', ' ', False);
      S := FastReplace(S, '||', '|', False);
      DHtmlParse.SourceStream.Free;
      DHtmlParse.SourceStream := nil;
      Result := S;
   end;

end;

function TMainForm.ParseEquibaseResults(sFileName: string): string;
var s: string;
   sIn: string;
begin
   try
      Result := '';

      DHtmlParse.SourceStream := TFileStream.Create(sFileName, fmOpenRead or
         fmShareDenyWrite);

      while DHtmlParse.ParseNextPiece do begin
         case DHtmlParse.PieceType of
            ptASP:
               continue;

            ptCDataSection:
               continue;

            ptComment:
               continue;

            ptCustomTag:
               continue;

            ptDTD:
               continue;

            ptHtmlTag: begin
                  case DHtmlParse.HtmlTag.TagID of
                     TAG_TD_ID: begin
                           S := S + '|';
                        end;

                     TAG_TR_ID: begin
                           S := S + #13 + #10;
                        end;
                  end;
               end;

            ptPHP:
               continue;

            ptHtmlPI:
               continue;

            ptScript:
               S := S + DHtmlParse.DataAsStrA;

            ptSsiTag:
               continue;

            ptStyle:
               continue;

            ptTitle:
               continue;

            ptXmlPI:
               continue;

            ptText: begin
                  S := S + Trim(DHtmlParse.DataAsStrA);
               end;

            ptUndefined:
               continue;
         else
            continue;
         end;
      end;

   finally
      S := FastReplace(S, '&nbsp;', ' ', False);
      S := FastReplace(S, '||', '|', False);
      DHtmlParse.SourceStream.Free;
      DHtmlParse.SourceStream := nil;
      Result := S;
   end;
end;

function TMainForm.ParseDRFCharts(sFileName: string): string;
var s: string;
   sIn: string;
begin
   try
      Result := '';

      DHtmlParse.SourceStream := TFileStream.Create(sFileName, fmOpenRead or
         fmShareDenyWrite);

      while DHtmlParse.ParseNextPiece do begin
         case DHtmlParse.PieceType of
            ptASP:
               continue;

            ptCDataSection:
               continue;

            ptComment:
               continue;

            ptCustomTag:
               continue;

            ptDTD:
               continue;

            ptHtmlTag: begin
                  case DHtmlParse.HtmlTag.TagID of
                     TAG_TD_ID: begin
                           S := S + '|';
                        end;
                     TAG_SUP_ID: begin
                           S := S + '^';
                        end;
                     TAG_TR_ID: begin
                           S := S + #13 + #10;
                        end;
                  end;
               end;

            ptPHP:
               continue;

            ptHtmlPI:
               continue;

            ptScript:
               S := S + DHtmlParse.DataAsStrA;

            ptSsiTag:
               continue;

            ptStyle:
               continue;

            ptTitle:
               continue;

            ptXmlPI:
               continue;

            ptText: begin
                  S := S + Trim(DHtmlParse.DataAsStrA);
               end;

            ptUndefined:
               continue;
         else
            continue;
         end;
      end;

   finally
      S := FastReplace(S, '&nbsp;', ' ', False);
      S := FastReplace(S, '||', '|', False);
      DHtmlParse.SourceStream.Free;
      DHtmlParse.SourceStream := nil;
      Result := S;
   end;

end;

function TMainForm.ParseDRFResults(sFileName: string): string;
var s: string;
   sIn: string;
begin
   try
      Result := '';

      DHtmlParse.SourceStream := TFileStream.Create(sFileName, fmOpenRead or
         fmShareDenyWrite);

      while DHtmlParse.ParseNextPiece do begin
         case DHtmlParse.PieceType of
            ptASP:
               continue;

            ptCDataSection:
               continue;

            ptComment:
               continue;

            ptCustomTag:
               continue;

            ptDTD:
               continue;

            ptHtmlTag: begin
                  case DHtmlParse.HtmlTag.TagID of
                     TAG_TD_ID: begin
                           S := S + '|';
                        end;

                     TAG_TR_ID: begin
                           S := S + #13 + #10;
                        end;
                  end;
               end;

            ptPHP:
               continue;

            ptHtmlPI:
               continue;

            ptScript:
               S := S + DHtmlParse.DataAsStrA;

            ptSsiTag:
               continue;

            ptStyle:
               continue;

            ptTitle:
               continue;

            ptXmlPI:
               continue;

            ptText: begin
                  S := S + Trim(DHtmlParse.DataAsStrA);
               end;

            ptUndefined:
               continue;
         else
            continue;
         end;
      end;

   finally
      S := FastReplace(S, '&nbsp;', ' ', False);
      S := FastReplace(S, '||', '|', False);
      DHtmlParse.SourceStream.Free;
      DHtmlParse.SourceStream := nil;
      Result := S;
   end;

end;

procedure TMainForm.btnProcessEquibaseChartsClick(Sender: TObject);
begin
   TimerOn(False);
   //   ProcessEquibaseCharts(dm.tblRH, dm.tblHH, dm.tblEquibase, Sender, True);
   TimerOn(True);
end;


procedure TMainForm.ProcessDRFResults(Sender: TObject; bUseOverride: boolean);
var
   lstCharts: TStringList;

   iLineLen: integer;
   iIdx: integer;
   iFPPos: integer;
   iRaceNbr: integer;
   iRc: integer;
   iLineType: integer;

   sTmp: string;
   sPostPos: string;
   sOdds: string;
   sFinishPos: string;
   sHorseName: string;
   iHPos: integer;

   bRoute: boolean;

begin
end;


procedure TMainForm.btnProcessDRFChartsClick(Sender: TObject);
begin

   TimerOn(False);
   ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, ONE_DAY_TRUE);
   ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   TimerOn(True);

end;



procedure TMainForm.btnDownloadDaysClick(Sender: TObject);
begin

   TimerOn(False);

   try

      dtAltStopDateProcessed := edtAltLastDateToProcess.Date;
      edtOverrideDate.Date := edtAltFirstDateToProcess.Date;

      dtAltStopDateProcessed := Now() - 1;
      edtOverrideDate.Date := Now() - 22;

      //      edtOverrideDate.Date := Now() - 182;

      repeat
         try

            //ProcessEquibaseCharts(dm.tblRH, dm.tblHH, dm.tblEquibase, Sender, OVERRIDE_DATE_TRUE);
            ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, OVERRIDE_DATE_TRUE);
            ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
            //Create_FO_PK_SK_DK_Keys(BATCH_SIZE, ONE_DAY_TRUE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
            // Create_FO_FK_Key(BATCH_SIZE, ONE_DAY_TRUE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);

         finally
            edtOverrideDate.Date := edtOverrideDate.Date + 1;
         end;
      until (edtOverrideDate.Date > dtAltStopDateProcessed);

   finally // wrap up
      edtOverrideDate.Date := Now();
   end; // try/finally

   TimerOn(True);

end;


procedure TMainForm.qrySQLBeforeExecute(Sender: TObject);
begin

   pgCtrlMain.ActivePage := tabDaily;

   prgBar.Width := pnlPrgBar.Width - 10;
   prgBar.Properties.Max := 100;
   prgBar.Position := 0;
   pnlPrgBar.Visible := True;
   staBar.SimpleText := sStatusBar;
   Application.ProcessMessages();

end;

procedure TMainForm.qrySQLAfterExecute(Sender: TObject);
begin

   sStatusBar := '';
   pnlPrgBar.Visible := False;

end;



procedure TMainForm.btnSelectNoneResultReportsClick(Sender: TObject);
begin

   //   chkSpecialResultsReports.Checked := False;
   //   chkBasicResultsReports.Checked := False;
   //   chkSummaryResultsReports.Checked := False;
   //
   //   chkSummaryResultsReports.Checked := False;
   //   chkDetailResultsReports.Checked := False;
   chkYouBetResultsReports.Checked := False;
   chkTopPickResultsReports.Checked := False;
   chkLinerResultsReports.Checked := False;
   chkWagerResultsReports.Checked := False;
   //
   //   chkPreviousDays.Checked := False;
   //   chkPrevious21Days.Checked := False;
   //   chkPrevious21DaysByRaceDate.Checked := False;
   //   chkPrevious21DaysByTrkCode.Checked := False;
   //   chkPrevious21DaysByRaceType.Checked := False;

end;

procedure TMainForm.btnSelectAllResultReportsClick(Sender: TObject);
begin

   //   chkSpecialResultsReports.Checked := True;
   //   chkBasicResultsReports.Checked := True;
   //   chkSummaryResultsReports.Checked := True;
   //
   //   chkSummaryResultsReports.Checked := True;
   //   chkDetailResultsReports.Checked := True;
   //   chkYouBetResultsReports.Checked := True;
   //   chkTopPickResultsReports.Checked := True;
   //
   //   chkPreviousDays.Checked := True;
   //   chkPrevious21Days.Checked := True;
   //   chkPrevious21DaysByRaceDate.Checked := True;
   //   chkPrevious21DaysByTrkCode.Checked := True;
   //   chkPrevious21DaysByRaceType.Checked := True;

   //  chkYouBetResultsReports.Checked := True;
   //  chkTopPickResultsReports.Checked := True;
   //  chkLinerResultsReports.Checked := True;
   //  chkWagerResultsReports.Checked := True;

   chkBasicResultsReportsPropertiesChange(Sender);

end;

procedure TMainForm.btnDeleteResultReportsClick(Sender: TObject);
var
   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;

begin
   TimerOn(False);


   try
      iAttributes := faAnyFile;
      sSearch := PDF_RESULTS_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_RESULTS_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   //
   try
      iAttributes := faAnyFile;
      sSearch := PDF_SUMMARY_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_SUMMARY_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   //
   try
      iAttributes := faAnyFile;
      sSearch := PDF_YOUBET_RESULTS_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_YOUBET_RESULTS_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

   //
   try
      iAttributes := faAnyFile;
      sSearch := PDF_YOUBET_SUMMARY_REPORT_PATH + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_YOUBET_SUMMARY_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;
   TimerOn(True);

end;

procedure TMainForm.btnDeleteReportsClick(Sender: TObject);
begin

   TimerOn(False);
   DeleteReports();
   TimerOn(True);

end;



procedure TMainForm.btnFTPResultReportsClick(Sender: TObject);
begin
   TimerOn(False);
   FTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   FTPSheets(FTP_RESULTS_REPORT_DIR, PDF_RESULTS_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);
   //   FTPSheets(FTP_SUMMARY_REPORT_DIR, PDF_SUMMARY_REPORT_PATH);
   //   FTPSheets(FTP_WAGER_REPORT_DIR, PDF_WAGER_REPORT_PATH);
   //   FTPSheets(FTP_YOUBET_RESULTS_REPORT_DIR, PDF_YOUBET_RESULTS_REPORT_PATH);
   //   FTPSheets(FTP_YOUBET_SUMMARY_REPORT_DIR, PDF_YOUBET_SUMMARY_REPORT_PATH);
      //
   TimerOn(True);
end;

procedure TMainForm.chkPrevious21DaysByRaceDatePropertiesChange(Sender:
   TObject);
begin

   if (chkPrevious21DaysByRaceDate.Checked) then begin

      chkYouBetResultsReports.Checked := True;
      chkTopPickResultsReports.Checked := False;

      //      chkSpecialResultsReports.Checked := False;
      //      chkBasicResultsReports.Checked := False;
      //      chkWagerResultsReports.Checked := False;

      //      chkSummaryResultsReports.Checked := True;
      //      chkDetailResultsReports.Checked := False;

      chkPreviousDays.Checked := False;
      chkPrevious21Days.Checked := True;

   end;

end;

procedure TMainForm.chkPrevious21DaysByTrkCodePropertiesChange(Sender: TObject);
begin
   if (chkPrevious21DaysByTrkCode.Checked) then begin

      chkYouBetResultsReports.Checked := True;
      chkTopPickResultsReports.Checked := False;

      //      chkSpecialResultsReports.Checked := False;
      //      chkBasicResultsReports.Checked := False;
      //      chkWagerResultsReports.Checked := False;

      //      chkSummaryResultsReports.Checked := True;
      //      chkDetailResultsReports.Checked := False;

      chkPreviousDays.Checked := False;
      chkPrevious21Days.Checked := True;

   end;
end;

procedure TMainForm.chkPrevious21DaysByRaceTypePropertiesChange(Sender:
   TObject);
begin

   if (chkPrevious21DaysByRaceType.Checked) then begin

      chkYouBetResultsReports.Checked := True;
      chkTopPickResultsReports.Checked := False;

      //      chkSpecialResultsReports.Checked := False;
      //      chkBasicResultsReports.Checked := False;
      //      chkWagerResultsReports.Checked := False;

      //      chkSummaryResultsReports.Checked := True;
      //      chkDetailResultsReports.Checked := False;

      chkPreviousDays.Checked := False;
      chkPrevious21Days.Checked := True;

   end;


end;

procedure TMainForm.chkWagerResultsReportsPropertiesChange(Sender: TObject);
begin

   //   if (chkWagerResultsReports.Checked) then begin
   //      chkSpecialResultsReports.Checked := False;
   //      chkBasicResultsReports.Checked := False;
   //
   //      chkYouBetResultsReports.Checked := True;
   //      chkTopPickResultsReports.Checked := True;
   //
   //      chkPreviousDays.Checked := True;
   //      chkPrevious21Days.Checked := False;
   //
   //      chkDetailResultsReports.Checked := True;
   //      chkSummaryResultsReports.Checked := False;
   //
   //      chkPrevious21DaysByRaceDate.Checked := False;
   //      chkPrevious21DaysByTrkCode.Checked := False;
   //      chkPrevious21DaysByRaceType.Checked := False;
   //      chkPrevious21DaysByML.Checked := False;
   //
   //   end;

end;

procedure TMainForm.chkSpecialResultsReportsPropertiesChange(Sender: TObject);
begin

   //   if (chkSpecialResultsReports.Checked) then begin
   //      chkWagerResultsReports.Checked := False;
   //      chkBasicResultsReports.Checked := False;
   //
   //      chkYouBetResultsReports.Checked := False;
   //      chkTopPickResultsReports.Checked := False;
   //
   //      chkPreviousDays.Checked := False;
   //      chkPrevious21Days.Checked := True;
   //
   //      chkDetailResultsReports.Checked := False;
   //      chkSummaryResultsReports.Checked := True;
   //
   //      chkPrevious21DaysByRaceDate.Checked := False;
   //      chkPrevious21DaysByTrkCode.Checked := False;
   //      chkPrevious21DaysByRaceType.Checked := False;
   //      chkPrevious21DaysByML.Checked := False;
   //
   //   end;

end;

procedure TMainForm.chkBasicResultsReportsPropertiesChange(Sender: TObject);
begin

   chkWagerResultsReports.Checked := True;
   chkTopPickResultsReports.Checked := True;
   chkPreviousDays.Checked := True;

   chkYouBetResultsReports.Checked := False;
   chkLinerResultsReports.Checked := False;


   chkPrevious21DaysByRaceDate.Checked := False;
   chkPrevious21DaysByTrkCode.Checked := False;
   chkPrevious21DaysByRaceType.Checked := False;
   chkPrevious21DaysByML.Checked := False;

end;

procedure TMainForm.chkPrevious21DaysByMLPropertiesChange(Sender: TObject);
begin

   //   if (chkPrevious21DaysByML.Checked) then begin
   //
   //      chkYouBetResultsReports.Checked := True;
   //      chkTopPickResultsReports.Checked := False;
   //
   //      chkSpecialResultsReports.Checked := False;
   //      chkBasicResultsReports.Checked := False;
   //      chkWagerResultsReports.Checked := False;
   //
   //      chkSummaryResultsReports.Checked := True;
   //      chkDetailResultsReports.Checked := False;
   //
   //      chkPreviousDays.Checked := False;
   //      chkPrevious21Days.Checked := True;
   //   end;

end;

procedure TMainForm.chkAllResultsReportsPropertiesChange(Sender: TObject);
begin

   //   if (chkAllResultsReports.Checked) then begin
   //      chkSpecialResultsReports.Checked := False;
   //      chkBasicResultsReports.Checked := False;
   //      chkBasicResultsReports.Checked := False;
   //
   //      chkYouBetResultsReports.Checked := True;
   //      chkTopPickResultsReports.Checked := True;
   //
   //      chkPreviousDays.Checked := True;
   //      chkPrevious21Days.Checked := True;
   //
   //      chkDetailResultsReports.Checked := True;
   //      chkSummaryResultsReports.Checked := True;
   //
   //      chkPrevious21DaysByRaceDate.Checked := False;
   //      chkPrevious21DaysByTrkCode.Checked := False;
   //      chkPrevious21DaysByRaceType.Checked := False;
   //      chkPrevious21DaysByML.Checked := False;
   //
   //   end;


end;


procedure TMainForm.btnEmailWagerReportsClick(Sender: TObject);
var
   sFileName: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   idAttachmentFile: TidAttachmentFile;

begin

   DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
   sFileName := PDF_WAGER_REPORT_PATH + 'YouBetByTrkCodeValue' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '.pdf';

   if not FileExists(sFileName) then begin
      exit;
   end;

   try

      idSmtp.connect;
      with idMessage do begin
         Clear;
         idAttachmentFile := TIdAttachmentFile.Create(idMessage.MessageParts, sFileName);
         Subject := sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4) + ' - WAGER REPORTS';
         Body.Text := sFileName;
         Recipients.EMailAddresses := 'joe.karas@gmail.com';
         From.Name := 'Joseph Karas';
         From.Address := 'jkaras@ksklimited.com';
         Sender.Name := 'Joseph Karas';
         Sender.Address := 'jkaras@ksklimited.com';
         idSmtp.Send(idMessage);
      end;
   finally
      idSmtp.Disconnect;
   end;
end;

procedure TMainForm.btnEmailResultReportsClick(Sender: TObject);
var
   sFileName: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   idAttachmentFile: TidAttachmentFile;

begin

   sFileName := PDF_YOUBET_RESULTS_REPORT_PATH + 'PrevDayValueWagerDetail.pdf';
   if not FileExists(sFileName) then begin
      exit;
   end;

   DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);

   try
      idSmtp.connect;
      with idMessage do begin
         Clear;
         idAttachmentFile := TIdAttachmentFile.Create(idMessage.MessageParts, sFileName);
         Subject := sm.Str(wMonth, 2) + '/' + sm.Str(wDay, 2) + '/' + sm.Str(wYear, 4) + ' - RESULT REPORTS';
         Body.Text := sFileName;
         Recipients.EMailAddresses := 'joe.karas@gmail.com';
         From.Name := 'Joseph Karas';
         From.Address := 'jkaras@ksklimited.com';
         Sender.Name := 'Joseph Karas';
         Sender.Address := 'jkaras@ksklimited.com';
         idSmtp.Send(idMessage);
      end;
   finally
      idSmtp.Disconnect;
   end;

end;

procedure TMainForm.DeleteMikeReports();
var
   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;
   sToFileName: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;

begin

   hLog.AddToLog('Delete Mike Reports', msevOperation);

   //
   try
      iAttributes := faAnyFile;

      DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
      sSearch := PDF_MIKE_REPORT_PATH + '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_MIKE_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

end;

procedure TMainForm.DeleteJimReports();
var
   tsFile: TSearchRec;
   sSearch: string;
   iAttributes: integer;
   sFileName: string;
   sToFileName: string;
   wYear: Word;
   wMonth: Word;
   wDay: Word;

begin

   hLog.AddToLog('Delete Jim Reports', msevOperation);

   //
   try
      iAttributes := faAnyFile;

      DecodeDate(edtOverrideDate.Date, wYear, wMonth, wDay);
      sSearch := PDF_JIM_REPORT_PATH + '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '*.pdf';
      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         begin
            repeat
               sFileName := PDF_JIM_REPORT_PATH + tsFile.Name;
               DeleteFile(sFileName);
            until FindNext(tsFile) <> 0;
            FindClose(tsFile);
         end;
      end;
   except
      FindClose(tsFile);
      exit;
   end;

end;

//procedure TMainForm.DownloadAxcisForJim(Sender: TObject);
//var
//   sTrkCode: string;
//   sTsnTrkCode: string;
//   sNormalTrkCode: string;
//   bMultiTrack: boolean;
//   iAttributes: integer;
//   tsFile: TSearchRec;
//   sBaseImportPath: string;
//   sCompressionMethod: string;
//   sDownloadFileType: string;
//   sDownloadLocation: string;
//   sOutputFileType: string;
//   sFormatString: string;
//   sOverrideDownloadLocation: string;
//   dtDownLoadDate: TDateTime;
//   wYear: Word;
//   wMonth: Word;
//   wDay: Word;
//   sFileName: string;
//   sDownloadFullFileName: string;
//   sServerFullFileName: string;
//
//begin
//
//   hLog.AddToLog('DownloadAxcisJim', msevOperation);
//
//
//   CheckProxy();
//   OpenTable(dm.tblTrack);
//   OpenTable(dm.tblVendor);
//
//   try
//      lblServerPath.Visible := True;
//      lblLocalPath.Visible := True;
//
//      dm.tblTrack.First();
//
//      while not dm.tblTrack.Eof do begin
//         IncPrgBar();
//         if (dm.tblTrack.FieldByName('Type').AsString = 'H') then begin
//            dm.tblVendor.IndexName := '';
//            dm.tblVendor.SetKey();
//            dm.tblVendor.FieldByName('Vendor').AsString := 'TSN';
//            dm.tblVendor.FieldByName('Product').AsString := 'Axcis Trackmaster PP PDF';
//            if dm.tblVendor.GotoKey() then begin
//               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
//               sTsnTrkCode := Trim(sTsnTrkCode);
//
//               //            sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
//               sNormalTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
//               sNormalTrkCode := Trim(sNormalTrkCode);
//
//               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
//               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
//               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
//               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
//
//               sDownloadLocation := PDF_JIM_REPORT_PATH;
//
//               sTrkCode := sNormalTrkCode;
//
//               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
//               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
//               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
//               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;
//
//               idHTTP.Request.Host := INTERNET_AXCIS_HOME_PAGE;
//               idHTTP.Request.Username := INTERNET_AXCIS_USER_CODE;
//               idHTTP.Request.Password := INTERNET_AXCIS_PASS_WORD;
//
//
//               if bUseOverrideDate then begin
//                  dtDownloadDate := edtOverrideDate.Date;
//               end else begin
//                  dtDownloadDate := Now();
//               end;
//
//               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
//               if (bMultiTrack) then begin
//                  sFileName := Trim(sTrkCode) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'q.' + sDownloadFileType;
//               end else begin
//                  sFileName := sm.Str(wMonth, 2) + sm.Str(wDay, 2) + 'q.' + sDownloadFileType;
//               end;
//
//               sDownloadFullFileName := sDownloadLocation + sFileName;
//
//               iAttributes := faAnyFile;
//               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
//                  if (tsFile.Size < 30000) then begin
//                     DeleteFile(sDownloadFullFileName);
//                  end;
//               end;
//               FindClose(tsFile);
//
//               sServerFullFileName := sBaseImportPath + sFileName;
//               sServerFullFileName := LowerCase(sServerFullFileName);
//
//               if not FileExists(sDownloadFullFileName) then begin
//                  lblServerPath.Caption := sServerFullFileName;
//                  lblLocalPath.Caption := sDownloadFullFileName;
//                  DownLoadFile(sServerFullFileName, sDownloadFullFileName);
//                  staBar.SimpleText := sDownloadFullFileName;
//                  Application.ProcessMessages();
//               end;
//
//               ClearPrgStatusBars();
//            end;
//         end;
//         Sleep(SLEEP_LONG);
//         dm.tblTrack.Next();
//      end;
//      lblServerPath.Caption := '';
//      lblLocalPath.Caption := '';
//   except
//      dm.tblTrack.Filtered := False;
//      dm.tblTrack.Filter := '';
//      dm.tblTrack.Filtered := False;
//      idHTTP.Disconnect;
//      CloseTable(dm.tblTrack);
//      CloseTable(dm.tblVendor);
//      lblServerPath.Caption := '';
//      lblLocalPath.Caption := '';
//      lblServerPath.Visible := False;
//      lblLocalPath.Visible := False;
//      Exit;
//   end;
//
//   idHTTP.Disconnect;
//   dm.tblTrack.Filtered := False;
//   dm.tblTrack.Filter := '';
//   dm.tblTrack.Filtered := False;
//   CloseTable(dm.tblTrack);
//   CloseTable(dm.tblVendor);
//   lblServerPath.Caption := '';
//   lblLocalPath.Caption := '';
//   lblServerPath.Visible := False;
//   lblLocalPath.Visible := False;
//   btnBackupClick(Sender);
//
//end;





procedure TMainForm.btnImportFlashNetClick(Sender: TObject);
begin

   //try
   //   TimerOn(False);
   //   try
   //      ImportFlashNet(Sender);
   //      ImportHarness(Sender);
   //
   //      SetHarnessRankings(True);
   //
   //      CreateHarnessKeys(500, True);
   //      UpdateHarnessKeys(500, True);
   //      SetHarnessKeyRankings(True);
   //
   //      SetHarnessFinalKeyEntries(pnlPrgBar, prgBar, staBar, BATCH_SIZE, True);
   //      SetHarnessFinalRankings(True);
   //      UpdateHarnessWager(True);
   //      CreateTodaysHarnessFiles(Sender);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //finally
   //   TimerOn(True);
   //end;


end;

procedure TMainForm.btnDownloadFlashNetClick(Sender: TObject);
begin

   //TimerOn(False);
   //btnDownloadFlashNet.Enabled := False;
   //   DownloadAxcisFlashNet(Sender);
   //btnDownloadFlashNet.Enabled := True;
   //TimerOn(True);

end;

procedure TMainForm.btnDownloadAxcisBuggyClick(Sender: TObject);
begin
   //TimerOn(False);
   //idHTTP.ProxyParams.ProxyServer := '';
   //idHTTP.ProxyParams.ProxyPort := 80;
   //btnDownloadAxcisBuggy.Enabled := False;
   //   DownloadAxcisBuggy(Sender);
   //   DownloadAxcisFlashNet(Sender);
   //btnDownloadAxcisBuggy.Enabled := True;
   //TimerOn(True);

end;

procedure TMainForm.btnBackupBuggyClick(Sender: TObject);
begin
   //TimerOn(False);
   //BackupBuggy(Sender);
   //TimerOn(True);

end;

procedure TMainForm.btnDownloadUSTAChartsClick(Sender: TObject);
begin
   //TimerOn(False);
   //DownloadUSTACharts(Sender, BUGGY_EARLY_CHARTS);
   //DownloadUSTACharts(Sender, BUGGY_LATE_CHARTS);
   //TimerOn(True);

end;

procedure TMainForm.btnProcessUSTAChartsClick(Sender: TObject);
begin
   //TimerOn(False);
   //ProcessUSTACharts(Sender);
   //TimerOn(True);

end;

procedure TMainForm.btnDownloadSCChartsClick(Sender: TObject);
begin
   //TimerOn(False);
   //DownloadSCCharts(Sender, BUGGY_LATE_CHARTS);
   //TimerOn(True);
end;

procedure TMainForm.btnProcessSCChartsClick(Sender: TObject);
begin

   //TimerOn(False);
   //ProcessSCCharts(Sender);
   //TimerOn(True);

end;


//

procedure TMainForm.UpdateValueIndicator(Sender: TObject);

begin

   OpenTable(dm.tblHH);
   InitPrgBar(dm.tblHH.RecordCount);

   dm.tblHH.First();
   while (not dm.tblHH.Eof) do begin
      IncPrgBar();

      staBar.SimpleText := 'Updating - ' +
         dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
         dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
         dm.tblHH.FieldByName('RaceNbr').AsString;
      Application.ProcessMessages();

      dm.tblHH.Edit();

      if (SmartPos('B', dm.tblHH.FieldByName('MorningLineDesc').AsString) > 0) then begin
         dm.tblHH.FieldByName('ValueIndicator').AsString := '$$';
      end;
      if (SmartPos('+', dm.tblHH.FieldByName('MorningLineDesc').AsString) > 0) then begin
         dm.tblHH.FieldByName('ValueIndicator').AsString := '$';
      end;
      if (SmartPos('L', dm.tblHH.FieldByName('MorningLineDesc').AsString) > 0) then begin
         dm.tblHH.FieldByName('ValueIndicator').AsString := '$';
      end;

      if (dm.tblHH.FieldByName('FinalValueBet').AsFloat > 1.00) then begin
         if (dm.tblHH.FieldByName('ValueIndicator').AsString = '$') then begin
            dm.tblHH.FieldByName('IsDollar').AsBoolean := True;
            dm.tblHH.FieldByName('IsDoubleDollar').AsBoolean := False;
         end;
         if (dm.tblHH.FieldByName('ValueIndicator').AsString = '$$') then begin
            dm.tblHH.FieldByName('IsDollar').AsBoolean := False;
            dm.tblHH.FieldByName('IsDoubleDollar').AsBoolean := True;
         end;
      end;

      dm.tblHH.Post();
      dm.tblHH.Next();

   end;

   CloseTable(dm.tblHH);
end;


procedure TMainForm.btnImportAxcisHarnessClick(Sender: TObject);
begin

   // TimerOn(False);
   // ImportHarness(Sender);
   // TimerOn(True);

end;


procedure TMainForm.btnDeleteAllFTPReportClick(Sender: TObject);
begin
   DeleteAllFTPReports(Sender);
end;

procedure TMainForm.btnDownloadSelectionsClick(Sender: TObject);
begin

   TimerOn(False);
   //   btnDownloadSelections.Enabled := False;
   //    try
   //       //      DownloadSelections(Sender, 'HAW');
   //    except
   //       on E: Exception do hLog.AddToLog(E.Message, msevException);
   //    end;
   //    btnDownloadSelections.Enabled := True;
   TimerOn(True);

end;


function TMainForm.DownLoadSelectionFile(sURL: string; sLocalFile: string):
   boolean;
var
   iAttributes: integer;
   tsFile: TSearchRec;
   fsIn: TFileStream;
begin

   hLog.AddToLog('DownLoadSelectionFile: ' + sLocalFile, msevOperation);
   Sleep(SLEEP_LONG);

   try
      Result := False;
      UpdateStatusBar(sURL + ' ' + sLocalFile);
      fsIn := TFileStream.Create(sLocalFile, fmCreate);
      idHTTP.Get(sURL, fsIn);
   except
      Result := False;
      fsIn.Destroy;
      DeleteFile(sLocalFile);
      UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      Exit;
   end;

   fsIn.Destroy;
   iAttributes := faAnyFile;
   if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      if (tsFile.Size < 5000) then begin
         Result := False;
         DeleteFile(sLocalFile);
         FindClose(tsFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end else begin
         Result := True;
         FindClose(tsFile);
         UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
         Exit;
      end;
   end;

   UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
   Result := True;
end;

procedure TMainForm.DownloadSelections(Sender: TObject; sTrkCode: string);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

begin

   hLog.AddToLog('DownloadSelections: ' + sTrkCode, msevOperation);
   CheckProxy();

   try
      try
         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         sStatusBar := 'Download Selections';
         Application.ProcessMessages();

         if sTrkCode = 'HAW' then begin

            sDownloadLocation := TRACK_SELECTION_PATH;
            idHTTP.Request.Host := 'www.hawthorneracecourse.com';

            if gbUseOverrideDate then begin
               dtDownloadDate := edtOverrideDate.Date;
            end else begin
               dtDownloadDate := Now() - 1;
            end;

            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);

            wYear := wYear - 2000;
            sFileName := sTrkCode + '-' + sm.Str(wYear, 2) + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            sDownloadFullFileName := sDownloadLocation + sFilename + '.html';

            iAttributes := faAnyFile;
            if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
               if (tsFile.Size < 5000) then begin
                  DeleteFile(sDownloadFullFileName);
                  Application.ProcessMessages();
               end;
            end;
            FindClose(tsFile);

            sServerFullFileName := 'http://www.hawthorneracecourse.com/include.php?cat=racing&po=/racing/handicap/&h=House+Handicap&f=/racing/handicap/';
            sServerFullFileName := sServerFullFileName + sm.Str(wYear, 2) + sm.Str(wMonth, 2) + sm.Str(wDay, 2) + '/index.html&pf=1';

            lblServerPath.Caption := sServerFullFileName;
            lblLocalPath.Caption := sDownloadFullFileName;

            //http://www.hawthorneracecourse.com/include.php?cat=racing&po=/racing/handicap/&h=House+Handicap&f=/racing/handicap/050314/index.html&pf=1
            if not FileExists(sDownloadFullFileName) then begin
               DownLoadSelectionFile(sServerFullFileName, sDownloadFullFileName);
            end;
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevOperation);
      end;
   finally
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
   end;

end;

procedure TMainForm.btnProcessSelectionsClick(Sender: TObject);
begin
   TimerOn(False);
   try
      btnProcessLateChangesClick(sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //ImportTSNForToday(Sender);
      ImportHDWForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //      ProcessSelections(Sender, 'HAW');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   TimerOn(True);
end;

procedure TMainForm.ProcessSelections(Sender: TObject; sTrkCode: string);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sBuf: string;
   sSearch: string;

   tsFile: TSearchRec;

   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;

begin

   hLog.AddToLog('Process Selections: ' + sTrkCode, msevOperation);

   try

      prgBar.Position := 0;
      pnlPrgBar.Visible := False;

      if gbUseOverrideDate then begin
         dtDownloadDate := edtOverrideDate.Date;
      end else begin
         dtDownloadDate := Now();
      end;

      //******
      iAttributes := faAnyFile;
      sPath := TRACK_SELECTION_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*.html';
      end else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         sFileName := sFileName + '*.html';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         sFileTrkCode := UpperCase(CopyStr(tsFile.Name, 1, (SmartPos('-', tsFile.Name)) - 1));
         DeleteFile('Selection.txt');
         sFileName := sPath + tsFile.Name;
         if sTrkCode = 'HAW' then begin
            ParseHAWSelections(sFileName, 'Selection.txt', sFileTrkCode, dtDownloadDate);
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
      end;
   end;

   ClearPrgStatusBars();

end;

procedure TMainForm.ParseHAWSelections(sFileName: string; sSaveFileName: string;
   sFileTrkCode: string; dtFileTrkDate: TDateTime);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: string;
   iRaceNbr: integer;
   sRacePicks: string;

   procedure InitVariables();
   begin
      iRaceNbr := 0;
      sRacePicks := '';

   end;

   function GetRaceNbr(sLine: string): integer;
   begin
      Result := 999;


      if (SmartPos('RACE 20', sLine) > 0) then begin
         Result := 20;
         Exit;
      end;
      if (SmartPos('RACE 19', sLine) > 0) then begin
         Result := 19;
         Exit;
      end;
      if (SmartPos('RACE 18', sLine) > 0) then begin
         Result := 18;
         Exit;
      end;
      if (SmartPos('RACE 17', sLine) > 0) then begin
         Result := 17;
         Exit;
      end;
      if (SmartPos('RACE 16', sLine) > 0) then begin
         Result := 16;
         Exit;
      end;
      if (SmartPos('RACE 15', sLine) > 0) then begin
         Result := 15;
         Exit;
      end;
      if (SmartPos('RACE 14', sLine) > 0) then begin
         Result := 14;
         Exit;
      end;
      if (SmartPos('RACE 13', sLine) > 0) then begin
         Result := 13;
         Exit;
      end;
      if (SmartPos('RACE 12', sLine) > 0) then begin
         Result := 12;
         Exit;
      end;
      if (SmartPos('RACE 11', sLine) > 0) then begin
         Result := 11;
         Exit;
      end;
      if (SmartPos('RACE 10', sLine) > 0) then begin
         Result := 10;
         Exit;
      end;
      if (SmartPos('RACE 9', sLine) > 0) then begin
         Result := 9;
         Exit;
      end;
      if (SmartPos('RACE 8', sLine) > 0) then begin
         Result := 8;
         Exit;
      end;
      if (SmartPos('RACE 7', sLine) > 0) then begin
         Result := 7;
         Exit;
      end;
      if (SmartPos('RACE 6', sLine) > 0) then begin
         Result := 6;
         Exit;
      end;
      if (SmartPos('RACE 5', sLine) > 0) then begin
         Result := 5;
         Exit;
      end;
      if (SmartPos('RACE 4', sLine) > 0) then begin
         Result := 4;
         Exit;
      end;
      if (SmartPos('RACE 3', sLine) > 0) then begin
         Result := 3;
         Exit;
      end;
      if (SmartPos('RACE 2', sLine) > 0) then begin
         Result := 2;
         Exit;
      end;
      if (SmartPos('RACE 1', sLine) > 0) then begin
         Result := 1;
         Exit;
      end;
   end;


begin

   hLog.AddToLog('ParseHAWSelections', msevOperation);

   try

      UpdateStatusBar(sFileName);
      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      sOut := HtmlExtractText(sIn, False, True, True, False);

      sOut := FastReplace(sOut, Chr(160), '', False);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         FreeAndNil(fsOut);
      end;

   finally
      FreeAndNil(fsIn);
   end;

   try
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;

      lstIn.LoadFromFile(sSaveFileName);
      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := stringListTrim(lstIn[iIdx]);
         sTmp := Trim(lstIn[iIdx]);
         if (sTmp = '') then begin
            continue;
         end;

         if (sTmp = '|') then begin
            continue;
         end;

         if (SmartPos('CLUB HAWTHORNE POINTS EARNED', UpperCase(sTmp)) > 0) then begin
            continue;
         end;

         if (SmartPos('CLUB HAWTHORNE POINTS EARNED YESTERDAY', UpperCase(sTmp))
            > 0) then begin
            continue;
         end;

         if (SmartPos('RACE', LeftStr(UpperCase(sTmp), 4)) > 0) then begin
            lstOut.Add(sTmp);
            continue;
         end;

         if (SmartPos('S SELECTIONS', UpperCase(sTmp)) > 0) then begin
            lstOut.Add(sTmp);
            continue;
         end;

         if (SmartPos('BANKROLL BETS', LeftStr(UpperCase(sTmp), 13)) > 0) then begin
            lstOut.Add(sTmp);
            continue;
         end;


      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;


   //
   try
      InitVariables();

      OpenTable(dm.tblRaces);

      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);
         sTmp := Trim(lstIn[iIdx]);


         if (SmartPos('RACE', LeftStr(UpperCase(sTmp), 4)) > 0) then begin
            iRaceNbr := GetRaceNbr(UpperCase(sTmp));
            sRacePicks := 'House Handicap By Jim Miller From www.hawthorneracecourse.com';
            sRacePicks := sRacePicks + #13#10 + Trim(CopyStr(sTmp, 10, (Length(sTmp) - 10)));
            continue;
         end;


         if (SmartPos('S SELECTIONS', UpperCase(sTmp)) > 0) then begin
            sRacePicks := sRacePicks + #13#10 + Trim(sTmp);
            continue;
         end;

         if (SmartPos('BANKROLL BETS', LeftStr(UpperCase(sTmp), 13)) > 0) then begin
            sRacePicks := sRacePicks + #13#10 + Trim(sTmp);
            try
               dm.tblRaces.IndexName := '';
               dm.tblRaces.SetKey();
               dm.tblRaces.FieldByName('TrkCode').AsString := sFileTrkCode;
               dm.tblRaces.FieldByName('RaceNbr').AsInteger := iRaceNbr;
               dm.tblRaces.FieldByName('RaceDate').AsDateTime := dtFileTrkDate;
               if (dm.tblRaces.GotoKey()) then begin
                  dm.tblRaces.Edit();
                  dm.tblRaces.FieldByName('IsRacePicksAvailable').AsBoolean := True;
                  dm.tblRaces.FieldByName('RacePicks').AsString := sRacePicks;
                  dm.tblRaces.Post();
               end;
            finally
            end;
         end;

      end;

   finally
      CloseTable(dm.tblRaces);
      FreeAndNil(lstIn);
   end;

   UpdateStatusBar('');

end;

procedure TMainForm.DownloadEquibaseStats(Sender: TObject);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

   wPrevDay: Word;
   wPrevMonth: Word;
   wPrevYear: Word;

   procedure DownloadIt();
   begin
      iAttributes := faAnyFile;
      if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
         DeleteFile(sDownloadFullFileName);
         Application.ProcessMessages();
      end;
      FindClose(tsFile);
      lblServerPath.Caption := sServerFullFileName;
      lblLocalPath.Caption := sDownloadFullFileName;
      if not FileExists(sDownloadFullFileName) then begin
         DownLoadFile(sServerFullFileName, sDownloadFullFileName);
         staBar.SimpleText := sDownloadFullFileName;
         Application.ProcessMessages();
         Sleep(SLEEP_LONG);
      end;
   end;

begin

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=O&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=O&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=J&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=J&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=T&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=T&CNT=250

   hLog.AddToLog('DownloadEquibaseStats', msevOperation);
   CheckProxy();

   try
      try
         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         sStatusBar := 'Download Top 250';
         Application.ProcessMessages();


         sDownloadLocation := EQUIBASE_STATS_PATH;
         idHTTP.Request.Host := 'www.equibase.com';

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now() - 1;
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         DecodeDate(dtDownloadDate - 365, wPrevYear, wPrevMonth, wPrevDay);

         // Trainer
         sFileName := 'Top250TrainersByWinsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=T&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250TrainersByWinsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=T&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250TrainersByEarningsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=T&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250TrainersByEarningsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=T&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         // Jockey
         sFileName := 'Top250JockeysByWinsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=J&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250JockeysByWinsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=J&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250JockeysByEarningsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=J&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250JockeysByEarningsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=J&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         // Owner
         sFileName := 'Top250OwnersByWinsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=O&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250OwnersByWinsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=O&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250OwnersByEarningsThisYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wYear, 4) + '&STAT=O&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         sFileName := 'Top250OwnersByEarningsLastYear';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.equibase.com/premium/eqbTop50ByEarnings.cfm?YR=' + sm.Str(wPrevYear, 4) + '&STAT=O&CNT=250';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
   end;

end;


procedure TMainForm.DownloadTrackLeaders(Sender: TObject; sStatType: string);
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   bMultiTrack: boolean;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;

begin

   hLog.AddToLog('DownloadTrackLeaders', msevOperation);


   CheckProxy();
   OpenTable(dm.tblTrack);
   OpenTable(dm.tblVendor);

   try
      lblServerPath.Visible := True;
      lblLocalPath.Visible := True;

      dm.tblTrack.First();

      while not dm.tblTrack.Eof do begin
         IncPrgBar();

         if (dm.tblTrack.FieldByName('Type').AsString = 'T') then begin
            dm.tblVendor.IndexName := '';
            dm.tblVendor.SetKey();
            dm.tblVendor.FieldByName('Vendor').AsString := 'EQUIBASE';
            dm.tblVendor.FieldByName('Product').AsString := 'TrackLeaders';
            if dm.tblVendor.GotoKey() then begin
               sTsnTrkCode := dm.tblTrack.FieldByName('TsnTrkCode').AsString;
               sTsnTrkCode := Trim(sTsnTrkCode);

               sNormalTrkCode := dm.tblTrack.FieldByName('TrkCode').AsString;
               sNormalTrkCode := Trim(sNormalTrkCode);

               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;
               sCompressionMethod := dm.tblVendor.FieldByName('CompressionMethod').AsString;
               sDownloadFileType := dm.tblVendor.FieldByName('DownloadFileType').AsString;
               sBaseImportPath := dm.tblVendor.FieldByName('BaseImportPath').AsString;

               sDownloadLocation := EQUIBASE_TRACK_LEADERS_PATH;

               sTrkCode := sNormalTrkCode;

               bMultiTrack := dm.tblVendor.FieldByName('MultiTrack').AsBoolean;
               sOutputFileType := dm.tblVendor.FieldByName('OutputFileType').AsString;
               sFormatString := dm.tblVendor.FieldByName('FormatString').AsString;
               sOverrideDownloadLocation := dm.tblVendor.FieldByName('OverrideDownloadLocation').AsString;

               idHTTP.Request.Host := INTERNET_EQUIBASE_HOME_PAGE;


               if gbUseOverrideDate then begin
                  dtDownloadDate := edtOverrideDate.Date;
               end else begin
                  dtDownloadDate := Now();
               end;

               DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
               //http://www.equibase.com/static/statistics/tracks/AP-USA-Jockey.html
               if sStatType = JOCKEY_LEADERS then begin
                  sFileName := Trim(sTrkCode) + '-' + 'Jockeys' + '.' + sDownloadFileType;
               end;
               if sStatType = TRAINER_LEADERS then begin
                  sFileName := Trim(sTrkCode) + '-' + 'Trainers' + '.' + sDownloadFileType;

               end;


               //               if sStatType = OWNER_LEADERS then begin
               //                  sFileName := Trim(sTrkCode) + '-' + 'Owners' + '.' + sDownloadFileType;
               //               end;

               sDownloadFullFileName := sDownloadLocation + sFileName;

               iAttributes := faAnyFile;
               if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0)
                  then begin
                  DeleteFile(sDownloadFullFileName);
               end;
               FindClose(tsFile);
               //http://www.equibase.com/premium/eqbTopLeadersByTrackDisplay.cfm?TRK=ALB&CY=USA&STAT=J
               sServerFullFileName := sBaseImportPath + 'TRK=' + sTrkCode;
               //              if (dm.tblTrack.FieldByName('Country').AsString = 'USA') then begin
                //                sServerFullFileName := sServerFullFileName + '&CY=USA&STAT=' + sStatType;
               //              end;


               if sStatType = JOCKEY_LEADERS then begin
                  sServerFullFileName := 'http://www.equibase.com/static/statistics/tracks/';
                  if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                     sServerFullFileName := sServerFullFileName + sTrkCode + '-CAN-Jockey.html';
                  end else begin
                     sServerFullFileName := sServerFullFileName + sTrkCode + '-USA-Jockey.html';
                  end;
               end;

               if sStatType = TRAINER_LEADERS then begin
                  sServerFullFileName := 'http://www.equibase.com/static/statistics/tracks/';
                  if (dm.tblTrack.FieldByName('Country').AsString = 'CAN') then begin
                     sServerFullFileName := sServerFullFileName + sTrkCode + '-CAN-Trainer.html';
                  end else begin
                     sServerFullFileName := sServerFullFileName + sTrkCode + '-USA-Trainer.html';
                  end;
               end;
               try
                  if not FileExists(sDownloadFullFileName) then begin
                     lblServerPath.Caption := sServerFullFileName;
                     lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadSelectionFile(sServerFullFileName,
                        sDownloadFullFileName);
                     hLog.AddToLog(sDownloadFullFileName, msevOperation);
                  end;
               except
               end;
               ClearPrgStatusBars();
            end;
         end;
         Sleep(SLEEP_LONG);
         dm.tblTrack.Next();
      end;
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
   except
      idHTTP.Disconnect;
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      Exit;
   end;

   idHTTP.Disconnect;
   CloseTable(dm.tblTrack);
   CloseTable(dm.tblVendor);
   lblServerPath.Caption := '';
   lblLocalPath.Caption := '';
   lblServerPath.Visible := False;
   lblLocalPath.Visible := False;
   btnBackupClick(Sender);

end;


procedure TMainForm.btnDownloadEquibaseStatsClick(Sender: TObject);
begin
   //
   //   sD: string;
   //   sM: string;
   //   sY: string;

   if not chkDownloadProcessStats.Checked then begin
      exit;
   end;


   if ((DayOf(Now()) = 1 or 7 or 14 or 21 or 28) or (chkForceEquibase.Checked)) then begin
      TimerOn(False);
      //   idHTTP.ProxyParams.ProxyServer := 'localhost';
      //   idHTTP.ProxyParams.ProxyPort := 8080;
      hLog.LogFileName := LOG_PATH + STATS_LOG_FILENAME;
      btnDownloadEquibaseStats.Enabled := False;
      //    try
    //         DownloadSireLists();
    //      except
    //      end;

      try
         DownloadEquibaseStats(Sender);
      except
      end;

      try
         DownloadTrackLeaders(Sender, JOCKEY_LEADERS);
      except
      end;

      try
         DownloadTrackLeaders(Sender, TRAINER_LEADERS);
      except
      end;

      btnDownloadEquibaseStats.Enabled := True;
      hLog.LogFileName := LOG_PATH + LOG_FILENAME;
      TimerOn(True);
   end;

end;

procedure TMainForm.btnProcessEquibaseStatsClick(Sender: TObject);
var
   bClearTotals: boolean;

begin
   if not chkDownloadProcessStats.Checked then begin
      exit;
   end;

   if ((DayOf(Now()) = 1 or 7 or 14 or 21 or 28) or (chkForceEquibase.Checked)) then begin
      TimerOn(False);

      bClearTotals := True;
      btnProcessEquibaseStats.Enabled := False;

      hLog.AddToLog('ProcessTrackLeaders', msevOperation);
      ProcessEquibaseTrackLeaders();

      hLog.AddToLog('ProcessEquibaseStats', msevOperation);

      try
         ProcessEquibaseStats(TRAINER_WINS, THIS_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(TRAINER_EARNINGS, THIS_YEAR, bClearTotals);
      except
      end;

      try
         ProcessEquibaseStats(TRAINER_WINS, LAST_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(TRAINER_EARNINGS, LAST_YEAR, bClearTotals);
      except
      end;

      try
         ProcessEquibaseStats(JOCKEY_WINS, THIS_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(JOCKEY_EARNINGS, THIS_YEAR, bClearTotals);
      except
      end;

      try
         ProcessEquibaseStats(JOCKEY_WINS, LAST_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(JOCKEY_EARNINGS, LAST_YEAR, bClearTotals);
      except
      end;

      try
         ProcessEquibaseStats(OWNER_WINS, THIS_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(OWNER_EARNINGS, THIS_YEAR, bClearTotals);
      except
      end;

      try
         ProcessEquibaseStats(OWNER_WINS, LAST_YEAR, bClearTotals);
      except
      end;
      try
         ProcessEquibaseStats(OWNER_EARNINGS, LAST_YEAR, bClearTotals);
      except
      end;

      hLog.AddToLog('ProcessBloodHorseSireLists - ' + TURF_SIRES + ' ' + THIS_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, TURF_SIRES, THIS_YEAR, bClearTotals);
      except
      end;

      hLog.AddToLog('ProcessBloodHorseSireLists - ' + GENERAL_SIRES + ' ' + THIS_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, GENERAL_SIRES, THIS_YEAR, bClearTotals);
      except
      end;

      hLog.AddToLog('ProcessBloodHorseSireLists - ' + JUVENILE_SIRES + ' ' + THIS_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, JUVENILE_SIRES, THIS_YEAR, bClearTotals);
      except
      end;

      //    hLog.AddToLog('ProcessBloodHorseSireLists - ' + AEI_SIRES + ' ' + THIS_YEAR, msevOperation);
    //      try
    //         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, AEI_SIRES, THIS_YEAR, bClearTotals);
    //      except
    //      end;
    //
    //      hLog.AddToLog('ProcessBloodHorseSireLists - ' + AW_SIRES + ' ' + THIS_YEAR, msevOperation);
    //      try
    //         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, AW_SIRES, THIS_YEAR, bClearTotals);
    //      except
    //      end;

          //
      hLog.AddToLog('ProcessBloodHorseSireLists - ' + TURF_SIRES + ' ' + LAST_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, TURF_SIRES, LAST_YEAR, bClearTotals);
      except
      end;

      hLog.AddToLog('ProcessBloodHorseSireLists - ' + GENERAL_SIRES + ' ' + LAST_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, GENERAL_SIRES, LAST_YEAR, bClearTotals);
      except
      end;

      hLog.AddToLog('ProcessBloodHorseSireLists - ' + JUVENILE_SIRES + ' ' + LAST_YEAR, msevOperation);
      try
         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, JUVENILE_SIRES, LAST_YEAR, bClearTotals);
      except
      end;

      //   hLog.AddToLog('ProcessBloodHorseSireLists - ' + AEI_SIRES + ' ' + LAST_YEAR, msevOperation);
   //      try
   //         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, AEI_SIRES, LAST_YEAR, bClearTotals);
   //      except
   //      end;
   //
   //      hLog.AddToLog('ProcessBloodHorseSireLists - ' + AW_SIRES + ' ' + LAST_YEAR, msevOperation);
   //      try
   //         ProcessBloodHorseSireLists(dm.dbSireRate, dm.tblSire, AW_SIRES, LAST_YEAR, bClearTotals);
   //      except
   //      end;


      btnProcessEquibaseStats.Enabled := True;
      TimerOn(True);
   end;

end;

procedure TMainForm.btnRefreshLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnLoadExceptionLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + LOG_FILENAME) then begin
         ParseLogFileForExceptions();
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + EXCEPTION_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnDeleteLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      DeleteFile(LOG_PATH + LOG_FILENAME);
      DeleteFile(LOG_PATH + EXCEPTION_LOG_FILENAME);
      DeleteFile(LOG_PATH + STATS_LOG_FILENAME);
      DeleteFile(LOG_PATH + TSN_LOG_FILENAME);
      DeleteFile(LOG_PATH + EQUIBASE_LOG_FILENAME);
      DeleteFile(LOG_PATH + AXCIS_LOG_FILENAME);
      DeleteFile(LOG_PATH + BLOODHORSE_LOG_FILENAME);

      if FileExists(LOG_PATH + LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + LOG_FILENAME);
      end;
   except
   end;

end;




procedure TMainForm.UpdateTrackTable(Sender: TObject);
begin

   hLog.AddToLog('UdpateTrackTable', msevOperation);

   OpenTable(dm.tblTrack);
   UpdateStatusBar('Updating Track');
   InitPrgBar(dm.tblTrack.RecordCount);

   try
      dm.tblTrack.First();
      while not dm.tblTrack.Eof do begin
         IncPrgBar();
         dm.tblTrack.Edit();
         if (dm.tblTrack.FieldByName('IsPrintedOnValueSheetTue').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetWed').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetThu').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetFri').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetSat').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetSun').AsBoolean or
            dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean) then begin
            dm.tblTrack.FieldByName('IsActive').AsBoolean := True;
         end else begin
            dm.tblTrack.FieldByName('IsActive').AsBoolean := False;
         end;

         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetTue').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetWed').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetThu').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetFri').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetSat').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;
         //dm.tblTrack.FieldByName('IsPrintedOnValueSheetSun').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheet').AsBoolean;

         dm.tblTrack.Post();
         dm.tblTrack.Next();
      end;
   except
      CloseTable(dm.tblTrack);
      Exit;
   end;

   CloseTable(dm.tblTrack);
   ClearPrgStatusBars();

end;


function TMainForm.StringListTrim(const Search: string): string;
var
   Index: byte;
const
   BlackSpace = [#33..#126];
begin
   Index := 1;
   while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
      Index := Index + 1;
   Result := Copy(Search, Index, 255);
   Index := Length(Result);
   while (Index > 0) and not (Result[Index] in BlackSpace) do
      Index := Index - 1;
   Result := Copy(Result, 1, Index);
end;



procedure TMainForm.btnTestReportsClick(Sender: TObject);
begin
   //try
      //if not assigned(WagerResultsReportForm) then begin
      //   WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
      //end;

   //   try

         //         if (chkWagerResultsReports.Checked) then begin
         //            WagerResultsReportForm.bWagerReports := True;
         //         end else begin
         //            WagerResultsReportForm.bWagerReports := False;
         //         end;

      //   WagerResultsReportForm.bPrintDetail := True;
      //   WagerResultsReportForm.bPreviousDay := True;
      //   WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
      //   WagerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
      //
      //   WagerResultsReportForm.ShowModal;
      //finally
      //   FreeAndNil(WagerResultsReportForm);
      //end;
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;


end;

procedure TMainForm.btnBankClick(Sender: TObject);
begin
   try
      if not assigned(BankForm) then {//}  begin
         BankForm := TBankForm.Create(Application);
      end;
      try
         BankForm.ShowModal;
      finally
         FreeAndNil(BankForm);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


end;

procedure TMainForm.btnWagersClick(Sender: TObject);
begin
   try
      UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   try
      CreateWagers(dm.tblRaces, dm.tblEntries, dm.tblBank, dm.tblWagers, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   try
      hLog.AddToLog('Create Wager Reports ', msevOperation);
      if not assigned(WagerReportForm) then begin
         WagerReportForm := TWagerReportForm.Create(Application);
      end;
      try
         WagerReportForm.ShowModal;
      finally
         FreeAndNil(WagerReportForm);
         WagerReportForm := nil;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   exit;

end;

procedure TMainForm.btnEditWagersClick(Sender: TObject);
begin

   try
      if not assigned(WagersForm) then {//}  begin
         WagersForm := TWagersForm.Create(Application);
      end;
      try
         WagersForm.ShowModal;
      finally
         FreeAndNil(WagersForm);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


end;


procedure TMainForm.btnCreatePreviousDayTablesClick(Sender: TObject);
var
   sFileName: string;
begin

   TimerOn(True);
   try
      if (chkCreatePreviousDaysResultTable.Checked) then begin
         TimerOn(False);

         //
         edtOverrideDate.Date := edtOverrideDate.Date - 1;
         qryCreatePreviousDaysFiles();
         ClearRaceResults(dm.tblPrevDayRH);
         //         ImportTSNResults(Sender, dm.tblPrevDayRH, dm.tblPrevDayHH);
         ImportHDWResults(Sender, dm.tblPrevDayRH, dm.tblPrevDayHH);
         UpdateMultiRaceResults(dm.tblPrevDayRH);
         ProcessPicksAndResults(dm.tblPrevDayRH, OVERRIDE_DATE_FALSE);

         //
         dm.tblPrevDayRH.Active := True;
         dm.tblPrevDayRH.First();
         sFileName := dm.tblPrevDayRH.FieldByName('RaceDate').AsString + '.xls';
         sFileName := FastReplace(sFileName, '/', '-', True);
         sFileName := 'd:\RatingsReports\Export\RH' + sFileName;
         csvOut.DataSet := dm.tblPrevDayRH;
         csvOut.SaveToFile(sFileName);
         dm.tblPrevDayRH.Active := False;

         //
         dm.tblPrevDayHH.Active := True;
         dm.tblPrevDayHH.First();
         sFileName := dm.tblPrevDayHH.FieldByName('RaceDate').AsString + '.xls';
         sFileName := FastReplace(sFileName, '/', '-', True);
         sFileName := 'd:\RatingsReports\Export\HH' + sFileName;
         csvOut.DataSet := dm.tblPrevDayHH;

         csvOut.SaveToFile(sFileName);
         dm.tblPrevDayHH.Active := False;

         //  FTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);

         TimerOn(True);
      end;

      if (chkCreatePrevious21DaysResultTable.Checked) then begin
         TimerOn(False);

         //
         qryCreatePrevious21DaysFiles();

         //
         try
            //edtOverrideDate.Date := (Now() - 1) - PREV_WEEK_DAYS;

            edtOverrideDate.Date := (edtOverrideDate.Date - 1) - PREV_WEEK_DAYS;
            repeat
               ClearRaceResults(dm.tblPrevWeekRH);
               //  ImportTSNResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
               ImportHDWResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
               UpdateMultiRaceResults(dm.tblPrevWeekRH);
               ProcessPicksAndResults(dm.tblPrevWeekRH, OVERRIDE_DATE_FALSE);
               edtOverrideDate.Date := edtOverrideDate.Date + 1;
            until (edtOverrideDate.Date > ((edtOverrideDate.Date - 1) - PREV_WEEK_DAYS));
         finally // wrap up
            edtOverrideDate.Date := Now();
         end;

         TimerOn(True);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   TimerOn(False);
end;

procedure TMainForm.btnCreateResultReportsClick(Sender: TObject);
begin


   // //Yesterday
   if (chkPreviousDays.Checked) then begin
      try
         edtOverrideDate.Date := Now() - 1;

         //     try
     //            UpdateReportSelections(dm.tblPrevDayRH, dm.tblPrevDayHH, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
     //         except
     //            on E: Exception do hLog.AddToLog(E.Message, msevException);
     //         end;

     //         gbOpenCloseFiles := True;
     //         CloseTable(dm.tblRaces);
     //         CloseTable(dm.tblEntries);
     //         CloseTable(dm.tblGimmicks);
     //         try
     //            UpdateGimmicks(dm.tblPrevDayRH, dm.tblPrevDayHH, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
     //         except
     //            on E: Exception do hLog.AddToLog(E.Message, msevException);
     //         end;
     //         OpenTable(dm.tblRaces);
     //         OpenTable(dm.tblEntries);
     //         OpenTable(dm.tblGimmicks);
     //         gbOpenCloseFiles := False;

         ClearRaceResults(dm.tblPrevDayRH);
         // ImportTSNResults(Sender, dm.tblPrevDayRH, dm.tblPrevDayHH);
         ImportHDWResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
         UpdateMultiRaceResults(dm.tblPrevDayRH);
         ProcessPicksAndResults(dm.tblPrevDayRH, OVERRIDE_DATE_FALSE);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   // Last 7 Days
   if (chkPrevious21Days.Checked) then begin
      try
         ClearRaceResults(dm.tblPrevWeekRH);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      //     try
     //         UpdateReportSelections(dm.tblPrevWeekRH, dm.tblPrevWeekHH, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
     //      gbOpenCloseFiles := True;
     //      CloseTable(dm.tblRaces);
     //      CloseTable(dm.tblEntries);
     //      CloseTable(dm.tblGimmicks);
     //      try
     //         UpdateGimmicks(dm.tblPrevWeekRH, dm.tblPrevWeekHH, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //      OpenTable(dm.tblRaces);
     //      OpenTable(dm.tblEntries);
     //      OpenTable(dm.tblGimmicks);
     //      gbOpenCloseFiles := False;

      try
         edtOverrideDate.Date := (Now() - 1) - PREV_WEEK_DAYS;
         repeat
            try
               // ImportTSNResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
               ImportHDWResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            edtOverrideDate.Date := edtOverrideDate.Date + 1;
         until (edtOverrideDate.Date > (Now() - 1));
      finally // wrap up
         edtOverrideDate.Date := Now();
      end;
      try
         ProcessPicksAndResults(dm.tblPrevWeekRH, OVERRIDE_DATE_FALSE);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      try
         UpdateMultiRaceResults(dm.tblPrevWeekRH);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

   // Reports
   if (chkPreviousDays.Checked) then begin

      if (chkYouBetResultsReports.Checked) then begin
         try
            if not assigned(YouBetResultsReportForm) then begin
               YouBetResultsReportForm := TYouBetResultsReportForm.Create(Application);
            end;
            try
               YouBetResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               YouBetResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               YouBetResultsReportForm.bPreviousDay := True;
               YouBetResultsReportForm.ShowModal;
            finally
               FreeAndNil(YouBetResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Linerbet Wagers
      if (chkLinerResultsReports.Checked) then begin
         try
            if not assigned(LinerResultsReportForm) then begin
               LinerResultsReportForm := TLinerResultsReportForm.Create(Application);
            end;
            try
               LinerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               LinerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               LinerResultsReportForm.bPreviousDay := True;
               LinerResultsReportForm.ShowModal;
            finally
               FreeAndNil(LinerResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Youbet Wagers
      if (chkExoticResultReports.Checked) then begin
         try
            if not assigned(ContestReportForm) then begin
               ContestResultReportForm := TContestResultReportForm.Create(Application);
            end;
            try
               ContestResultReportForm.bPreviousDay := True;
               ContestResultReportForm.ShowModal;
            finally
               FreeAndNil(ContestResultReportForm);
               ContestResultReportForm := nil;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if (chkWagerResultsReports.Checked) then begin
         try
            if not assigned(WagerResultsReportForm) then begin
               WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
            end;
            try
               WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.bPreviousDay := True;
               WagerResultsReportForm.bPrintOdds := False;
               WagerResultsReportForm.bPrintPower := False;
               WagerResultsReportForm.bPrintTodaysWager := False;
               WagerResultsReportForm.bPrintOwnerBred := False;
               WagerResultsReportForm.bOwnerWagerSelected := False;

               WagerResultsReportForm.ShowModal;
            finally
               FreeAndNil(WagerResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Top Hospital Wagers
      if (chkTopPickResultsReports.Checked) then begin
         try
            if not assigned(HospitalResultsReportForm) then begin
               HospitalResultsReportForm := THospitalResultsReportForm.Create(Application);
            end;
            try
               HospitalResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               HospitalResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               HospitalResultsReportForm.bPreviousDay := True;
               HospitalResultsReportForm.ShowModal;
            finally
               FreeAndNil(HospitalResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;
   end; // Previous Day


   if (chkPrevious21Days.Checked) then begin
      //Last 21
      if (chkLinerResultsReports.Checked) then begin
         try
            if not assigned(LinerResultsReportForm) then begin
               LinerResultsReportForm := TLinerResultsReportForm.Create(Application);
            end;
            try
               LinerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               LinerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               LinerResultsReportForm.bPreviousDay := False;
               LinerResultsReportForm.ShowModal;
            finally
               FreeAndNil(LinerResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Last 21
      if (chkYouBetResultsReports.Checked) then begin
         try
            if not assigned(YouBetResultsReportForm) then begin
               YouBetResultsReportForm := TYouBetResultsReportForm.Create(Application);
            end;
            try
               YouBetResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               YouBetResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               YouBetResultsReportForm.bPreviousDay := False;
               YouBetResultsReportForm.ShowModal;
            finally
               FreeAndNil(YouBetResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Last 21
      if (chkExoticResultReports.Checked) then begin
         try
            if not assigned(ContestReportForm) then begin
               ContestResultReportForm := TContestResultReportForm.Create(Application);
            end;
            try
               ContestResultReportForm.bPreviousDay := False;
               ContestResultReportForm.ShowModal;
            finally
               FreeAndNil(ContestResultReportForm);
               ContestResultReportForm := nil;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if (chkWagerResultsReports.Checked) then begin
         try
            if not assigned(WagerResultsReportForm) then begin
               WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
            end;
            try
               WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.bPreviousDay := False;
               WagerResultsReportForm.bPrintDetail := False;
               WagerResultsReportForm.bPrintOdds := False;
               WagerResultsReportForm.bPrintPower := True;
               WagerResultsReportForm.bPrintTodaysWager := False;
               WagerResultsReportForm.bPrintOwnerBred := False;
               WagerResultsReportForm.bOwnerWagerSelected := False;
               WagerResultsReportForm.ShowModal;
            finally
               FreeAndNil(WagerResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if (chkTopPickResultsReports.Checked) then begin
         try
            if not assigned(HospitalResultsReportForm) then begin
               HospitalResultsReportForm := THospitalResultsReportForm.Create(Application);
            end;
            try
               HospitalResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               HospitalResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               HospitalResultsReportForm.bPreviousDay := False;
               HospitalResultsReportForm.ShowModal;
            finally
               FreeAndNil(HospitalResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

   end;

end; // Previous 21 Days


procedure TMainForm.btnExportToNexusClick(Sender: TObject);
var
   sPath: string;

begin
   sPath := 'd:\RatingsData31\Csv\';

   ExportToNexus(dm.tblEntries, sPath);
   ExportToNexus(dm.tblRaces, sPath);

   (*
   ExportToNexus(dm.tblBreeder, sPath);
   ExportToNexus(dm.tblBreederSummary, sPath);
   ExportToNexus(dm.tblDam, sPath);
   ExportToNexus(dm.tblDamSireSummary, sPath);
   ExportToNexus(dm.tblDamSummary, sPath);
   ExportToNexus(dm.tblJockeySummary, sPath);
   ExportToNexus(dm.tblOwner, sPath);
   ExportToNexus(dm.tblOwnerSummary, sPath);
   ExportToNexus(dm.tblPast, sPath);
   ExportToNexus(dm.tblPP, sPath);
   ExportToNexus(dm.tblProcessed, sPath);
   ExportToNexus(dm.tblRatings, sPath);
   ExportToNexus(dm.tblSire, sPath);
   ExportToNexus(dm.tblSireSummary, sPath);
   ExportToNexus(dm.tblTotals, sPath);
   ExportToNexus(dm.tblTrack, sPath);
   ExportToNexus(dm.tblTrainer1To45Summary, sPath);
   ExportToNexus(dm.tblTrainer1To45WorkSummary, sPath);
   ExportToNexus(dm.tblTrainer46To120Summary, sPath);
   ExportToNexus(dm.tblTrainer46To120WorkSummary, sPath);
   ExportToNexus(dm.tblTrainer120PlusSummary, sPath);
   ExportToNexus(dm.tblTrainer120PlusWorkSummary, sPath);
   ExportToNexus(dm.tblTrainerBlinkersOffSummary, sPath);
   ExportToNexus(dm.tblTrainerBlinkersOnSummary, sPath);
   ExportToNexus(dm.tblTrainerDebutSummary, sPath);
   ExportToNexus(dm.tblTrainerDebutTwoSummary, sPath);
   ExportToNexus(dm.tblTrainerFirstJuiceSummary, sPath);
   ExportToNexus(dm.tblTrainerJockeySummary, sPath);
   ExportToNexus(dm.tblTrainerOwnerSummary, sPath);
   ExportToNexus(dm.tblTrainerSecondJuiceSummary, sPath);
   ExportToNexus(dm.tblTrainerSummary, sPath);
   ExportToNexus(dm.tblVendor, sPath);
   ExportToNexus(dm.tblGimmicks, sPath);
   *)

end;


procedure TMainForm.btnCreateFinalOrderClick(Sender: TObject);
begin
   try
      TimerOn(False);
      Create_FO_PK_SK_DK_Keys(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
      Create_FO_LINER_Keys(BATCH_SIZE, LINER_ORDER_DAYS, LINER_ORDER_DAYS);
      Create_FinalOrder_Key(BATCH_SIZE, ONE_DAY_FALSE, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
      TimerOn(True);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TMainForm.btnCreateRankingsClick(Sender: TObject);
begin
   try
      TimerOn(False);
      qryGetRacesAndRunners(dm.tblTotals);
      GenerateRankingStats(ONE_DAY_FALSE, RANKING_STAT_DAYS);
      GenerateRankingStatsByTrack(ONE_DAY_FALSE, RANKING_STAT_DAYS);
      qryUpdateIVRankingTables();
   finally
      TimerOn(True);
   end;
end;

procedure TMainForm.btnCreateAnalysisTablesClick(Sender: TObject);
begin
   qryCreateAnalysisTables();
end;

procedure TMainForm.btnDownloadReprocessDRFEquibaseClick(Sender: TObject);
begin

   //try
   //   edtOverrideDate.Date := Now();
   //   edtOverrideDate.Date := edtOverrideDate.Date - 1;
   //   btnDownloadDRFResultsClick(Sender);
   //   btnDownloadDRFChartsClick(Sender);
   //   ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, ONE_DAY_TRUE);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   edtOverrideDate.Date := Now();
   //   edtOverrideDate.Date := edtOverrideDate.Date - 2;
   //   btnDownloadDRFResultsClick(Sender);
   //   btnDownloadDRFChartsClick(Sender);
   //   ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, ONE_DAY_TRUE);
   //   ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   edtOverrideDate.Date := Now();
   //   edtOverrideDate.Date := edtOverrideDate.Date - 3;
   //   btnDownloadDRFResultsClick(Sender);
   //   btnDownloadDRFChartsClick(Sender);
   //   ProcessDRFCharts(dm.tblRH, dm.tblHH, dm.tblDRF, ONE_DAY_TRUE);
   //   ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;

   //try
   //   edtOverrideDate.Date := Now();
   //   edtOverrideDate.Date := edtOverrideDate.Date - 1;
   //   btnDownloadEquibaseResultsClick(Sender);
   //   btnDownloadEquibaseChartsClick(Sender);
   //   edtOverrideDate.Date := Now();
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;

   //try
   //   btnCreatePreviousDayTablesClick(Sender);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   btnDeleteResultReportsClick(Sender);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   chkBasicResultsReportsPropertiesChange(Sender);
   //   btnCreateResultReportsClick(Sender);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;
   //
   //try
   //   FTPSheets(FTP_RESULTS_REPORT_DIR, PDF_RESULTS_REPORT_PATH);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;


end;

procedure TMainForm.DownloadTSNAvailable(Sender: TObject);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

   wPrevDay: Word;
   wPrevMonth: Word;
   wPrevYear: Word;

   procedure DownloadIt();
   begin
      iAttributes := faAnyFile;
      if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
         DeleteFile(sDownloadFullFileName);
         Application.ProcessMessages();
      end;
      FindClose(tsFile);
      lblServerPath.Caption := sServerFullFileName;
      lblLocalPath.Caption := sDownloadFullFileName;
      if not FileExists(sDownloadFullFileName) then begin
         DownLoadFile(sServerFullFileName, sDownloadFullFileName);
         staBar.SimpleText := sDownloadFullFileName;
         Application.ProcessMessages();
         Sleep(SLEEP_LONG);
      end;
   end;

begin

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=O&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=O&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=J&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=J&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=T&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=T&CNT=250

   hLog.AddToLog('DownloadTSNStats', msevOperation);
   CheckProxy();

   try
      try
         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         sStatusBar := 'Download Top 250';
         Application.ProcessMessages();


         sDownloadLocation := TSN_STATS_PATH;
         idHTTP.Request.Host := 'www.brisnet.com';

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now() - 1;
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         DecodeDate(dtDownloadDate - 365, wPrevYear, wPrevMonth, wPrevDay);

         // ProCaps
         //sFileName := 'ProCapFiles';
         //sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         //sServerFullFileName := 'http://www.tsnhorse.com/cgi-bin/trk_report.cgi?MCP';
         //DownloadIt();
         ///hLog.AddToLog(sDownloadFullFileName, msevOperation);

         // XRD
         //sFileName := 'ERDFiles';
         //sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         //sServerFullFileName := 'http://www.tsnhorse.com/cgi-bin/trk_report.cgi?erd';
         //DownloadIt();
         //hLog.AddToLog(sDownloadFullFileName, msevOperation);

         //http://www.brisnet.com/cgi-bin/trk_report.cgi?mcp
         // ProCaps
         sFileName := 'ProCapFiles';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.brisnet.com/cgi-bin/trk_report.cgi?mcp';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

         // XRD
         sFileName := 'ERDFiles';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.brisnet.com/cgi-bin/trk_report.cgi?erd';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);


      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
   end;

end;


procedure TMainForm.btnDownloadTSNClick(Sender: TObject);
begin
   hLog.AddToLog('btnDownloadTsn', msevOperation);
   DownloadTSNAvailable(Sender);
   ProcessTSNLists(dm.dbSireRate, dm.tblTSNDownload, MCP_FILE);
   TimerOn(False);
   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   idHTTP.ProxyParams.ProxyServer := '';
   idHTTP.ProxyParams.ProxyPort := 80;
   btnDownloadTsn.Enabled := False;
   DownloadTsn(Sender);
   btnDownloadTsn.Enabled := True;
   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   TimerOn(True);

end;

procedure TMainForm.DownloadTsn(Sender: TObject);
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sTsnFileName: string;
   bMultiTrack: boolean;
   sMM: string;
   sDD: string;
   dtTSNFileDate: TDateTime;

   function DownLoadMCPFile(sURL: string; sLocalFile: string): boolean;
   var
      iAttributes: integer;
      tsFile: TSearchRec;
      fsIn: TFileStream;
   begin

      try
         Result := False;
         UpdateStatusBar(sURL + ' ' + sLocalFile);
         fsIn := TFileStream.Create(sLocalFile, fmCreate);
         idHTTP.Get(sURL, fsIn);
      except
         Result := False;
         fsIn.Destroy;
         DeleteFile(sLocalFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end;

      fsIn.Destroy;
      //      iAttributes := faAnyFile;
      //      if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      //         if (tsFile.Size < MIN_TSN_MCP_FILE_SIZE) then begin
      //            Result := False;
      //            DeleteFile(sLocalFile);
      //            FindClose(tsFile);
      //            UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end else begin
      //            Result := True;
      //            FindClose(tsFile);
      //            UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end;
      //          end;

      UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      Result := True;
   end;


begin

   hLog.AddToLog('DownloadTsnMCP', msevOperation);


   try

      OpenTable(dm.tblTrack);
      OpenTable(dm.tblTSNDownload);
      OpenTable(dm.tblVendor);
      OpenTable(dm.tblProcessed);

      CheckProxy();

      try

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         dm.tblTSNDownload.First();
         while not dm.tblTSNDownload.Eof do begin
            IncPrgBar();
            if (dm.tblTSNDownload.FieldByName('FileType').AsString = 'MCP') then begin
               if not (dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean) then begin
                  sFileName := Trim(dm.tblTSNDownload.FieldByName('FileName').AsString);
                  sServerFullFileName := Trim(dm.tblTSNDownload.FieldByName('ServerURL').AsString);

                  sTSNTrkCode := LeftStr(UpperCase(dm.tblTSNDownload.FieldByName('FileName').AsString), 3);
                  DecodeDate(edtOverrideDate.date, wYear, wMonth, wDay);
                  sMM := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 4, 2);
                  sDD := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 6, 2);
                  dtTSNFileDate := EncodeDate(wYear, atow(sMM), atow(sDD));

                  idHTTP.Request.Host := INTERNET_TSN_HOME_PAGE;
                  idHTTP.Request.Username := INTERNET_TSN_USER_CODE;
                  idHTTP.Request.Password := INTERNET_TSN_PASS_WORD;

                  sDownloadFullFileName := TSN_MCP_PATH + sFileName;
                  if FileExists(sDownloadFullFileName) then begin
                     vZip.ZipName := sDownloadFullFileName;
                     vZip.DestDir := TSN_MCP_PATH;
                     if IsValidZip(sDownloadFullFileName) then begin
                        dm.tblTSNDownload.Edit();
                        dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                        hLog.AddToLog(sDownloadFullFileName, msevOperation);
                        dm.tblTSNDownload.Post();
                        dm.tblTSNDownload.FlushBuffers();

                        dm.tblProcessed.IndexName := '';
                        dm.tblProcessed.SetKey();
                        dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                        dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                        if (not dm.tblProcessed.GotoKey()) then begin
                           dm.tblProcessed.Append();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                           dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end else begin
                           dm.tblProcessed.Edit();
                           dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end;

                        hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                     end else begin
                        vZip.ZipName := '';
                        DeleteFile(sDownloadFullFileName);
                     end;
                  end;

                  if not (FileExists(sDownloadFullFileName)) then begin
                     lblServerPath.Caption := sServerFullFileName;
                     lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadMCPFile(sServerFullFileName, sDownloadFullFileName);

                     if FileExists(sDownloadFullFileName) then begin
                        vZip.ZipName := sDownloadFullFileName;
                        vZip.DestDir := TSN_MCP_PATH;
                        if IsValidZip(sDownloadFullFileName) then begin
                           hLog.AddToLog(sDownloadFullFileName, msevOperation);
                           dm.tblTSNDownload.Edit();
                           dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                           hLog.AddToLog(sDownloadFullFileName, msevOperation);
                           dm.tblTSNDownload.Post();
                           dm.tblTSNDownload.FlushBuffers();

                           dm.tblProcessed.IndexName := '';
                           dm.tblProcessed.SetKey();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                           if (not dm.tblProcessed.GotoKey()) then begin
                              dm.tblProcessed.Append();
                              dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                              dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                              dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end else begin
                              dm.tblProcessed.Edit();
                              dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end;

                        end else begin
                           vZip.ZipName := '';
                           DeleteFile(sDownloadFullFileName);
                        end;
                     end;

                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
            Sleep(1);
            dm.tblTSNDownload.Next();
         end;

         dm.tblTSNDownload.Last();
         while not dm.tblTSNDownload.Bof do begin
            IncPrgBar();
            if (dm.tblTSNDownload.FieldByName('FileType').AsString = 'MCP') then begin
               if not (dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean) then begin
                  sFileName := Trim(dm.tblTSNDownload.FieldByName('FileName').AsString);
                  sServerFullFileName := Trim(dm.tblTSNDownload.FieldByName('ServerURL').AsString);

                  sTSNTrkCode := LeftStr(UpperCase(dm.tblTSNDownload.FieldByName('FileName').AsString), 3);
                  DecodeDate(edtOverrideDate.date, wYear, wMonth, wDay);
                  sMM := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 4, 2);
                  sDD := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 6, 2);
                  dtTSNFileDate := EncodeDate(wYear, atow(sMM), atow(sDD));

                  idHTTP.Request.Host := INTERNET_TSN_HOME_PAGE;
                  idHTTP.Request.Username := INTERNET_TSN_USER_CODE;
                  idHTTP.Request.Password := INTERNET_TSN_PASS_WORD;

                  sDownloadFullFileName := TSN_MCP_PATH + sFileName;
                  if FileExists(sDownloadFullFileName) then begin
                     vZip.ZipName := sDownloadFullFileName;
                     vZip.DestDir := TSN_MCP_PATH;
                     if IsValidZip(sDownloadFullFileName) then begin
                        dm.tblTSNDownload.Edit();
                        dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                        hLog.AddToLog(sDownloadFullFileName, msevOperation);
                        dm.tblTSNDownload.Post();
                        dm.tblTSNDownload.FlushBuffers();

                        dm.tblProcessed.IndexName := '';
                        dm.tblProcessed.SetKey();
                        dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                        dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                        if (not dm.tblProcessed.GotoKey()) then begin
                           dm.tblProcessed.Append();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                           dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end else begin
                           dm.tblProcessed.Edit();
                           dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end;

                        hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                     end else begin
                        vZip.ZipName := '';
                        DeleteFile(sDownloadFullFileName);
                     end;
                  end;

                  if not (FileExists(sDownloadFullFileName)) then begin
                     lblServerPath.Caption := sServerFullFileName;
                     lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadMCPFile(sServerFullFileName, sDownloadFullFileName);

                     if FileExists(sDownloadFullFileName) then begin
                        vZip.ZipName := sDownloadFullFileName;
                        vZip.DestDir := TSN_MCP_PATH;
                        if IsValidZip(sDownloadFullFileName) then begin
                           hLog.AddToLog(sDownloadFullFileName, msevOperation);
                           dm.tblTSNDownload.Edit();
                           dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                           hLog.AddToLog(sDownloadFullFileName, msevOperation);
                           dm.tblTSNDownload.Post();
                           dm.tblTSNDownload.FlushBuffers();

                           dm.tblProcessed.IndexName := '';
                           dm.tblProcessed.SetKey();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                           if (not dm.tblProcessed.GotoKey()) then begin
                              dm.tblProcessed.Append();
                              dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                              dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                              dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end else begin
                              dm.tblProcessed.Edit();
                              dm.tblProcessed.FieldByName('IsTSNProCapsDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end;

                        end else begin
                           vZip.ZipName := '';
                           DeleteFile(sDownloadFullFileName);
                        end;
                     end;

                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
            Sleep(1);
            dm.tblTSNDownload.Prior();
         end;

         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
      except
         idHTTP.Disconnect;
         CloseTable(dm.tblTrack);
         CloseTable(dm.tblTSNDownload);
         CloseTable(dm.tblVendor);
         CloseTable(dm.tblProcessed);
         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
         lblServerPath.Visible := False;
         lblLocalPath.Visible := False;
         Exit;
      end;

      idHTTP.Disconnect;
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   finally
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      idHTTP.Disconnect;
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   end;

end;

procedure TMainForm.btnDownloadTsnResultsClick(Sender: TObject);
begin

   hLog.AddToLog('btnDownloadTsnResults', msevOperation);
   TimerOn(False);
   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   DownloadTSNAvailable(Sender);
   ProcessTSNLists(dm.dbSireRate, dm.tblTSNDownload, ERD_FILE);
   DownloadTsnResults(Sender);
   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   TimerOn(True);

end;

procedure TMainForm.DownloadTsnResults(Sender: TObject);
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sTsnFileName: string;
   bMultiTrack: boolean;

   sMM: string;
   sDD: string;
   dtTSNFileDate: TDateTime;

   function DownLoadXRDFile(sURL: string; sLocalFile: string): boolean;
   var
      iAttributes: integer;
      tsFile: TSearchRec;
      fsIn: TFileStream;
   begin

      try
         Result := False;
         UpdateStatusBar(sURL + ' ' + sLocalFile);
         fsIn := TFileStream.Create(sLocalFile, fmCreate);
         idHTTP.Get(sURL, fsIn);
      except
         Result := False;
         fsIn.Destroy;
         DeleteFile(sLocalFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end;

      fsIn.Destroy;
      //      iAttributes := faAnyFile;
      //      if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      //         if (tsFile.Size < MIN_TSN_XRD_FILE_SIZE) then begin
      //            Result := False;
      //            DeleteFile(sLocalFile);
      //            FindClose(tsFile);
      //            UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end else begin
      //            Result := True;
      //            FindClose(tsFile);
      //            UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end;
      //      end;

      UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      Result := True;
   end;

begin

   hLog.AddToLog('DownloadTsnResults', msevOperation);

   CheckProxy();

   OpenTable(dm.tblTrack);
   OpenTable(dm.tblVendor);
   OpenTable(dm.tblProcessed);
   OpenTable(dm.tblTSNDownload);

   try
      try

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         dm.tblTSNDownload.First();
         while not dm.tblTSNDownload.Eof do begin
            IncPrgBar();
            if (dm.tblTSNDownload.FieldByName('FileType').AsString = 'ERD') then begin

               if not (dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean) then begin

                  sFileName := dm.tblTSNDownload.FieldByName('FileName').AsString;
                  sServerFullFileName := dm.tblTSNDownload.FieldByName('ServerURL').AsString; ;

                  sDownloadLocation := TSN_XRD_PATH;

                  idHTTP.Request.Host := INTERNET_TSN_HOME_PAGE;
                  idHTTP.Request.Username := INTERNET_TSN_USER_CODE;
                  idHTTP.Request.Password := INTERNET_TSN_PASS_WORD;

                  sTSNTrkCode := LeftStr(UpperCase(dm.tblTSNDownload.FieldByName('FileName').AsString), 3);
                  DecodeDate(edtOverrideDate.date, wYear, wMonth, wDay);
                  sMM := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 4, 2);
                  sDD := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 6, 2);
                  dtTSNFileDate := EncodeDate(wYear, atow(sMM), atow(sDD));

                  sDownloadFullFileName := sDownloadLocation + sFileName;
                  if FileExists(sDownloadFullFileName) then begin
                     vZip.ZipName := sDownloadFullFileName;
                     vZip.DestDir := TSN_XRD_PATH;
                     if IsValidZip(sDownloadFullFileName) then begin
                        dm.tblTSNDownload.Edit();
                        dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                        hLog.AddToLog(sDownloadFullFileName, msevOperation);
                        dm.tblTSNDownload.Post();
                        dm.tblTSNDownload.FlushBuffers();
                        dm.tblProcessed.IndexName := '';
                        dm.tblProcessed.SetKey();
                        dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                        dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                        if (not dm.tblProcessed.GotoKey()) then begin
                           dm.tblProcessed.Append();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                           dm.tblProcessed.FieldByName('IsTSNXRDDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end else begin
                           dm.tblProcessed.Edit();
                           dm.tblProcessed.FieldByName('IsTSNXRDDownloaded').Value := true;
                           dm.tblProcessed.Post();
                        end;
                        hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                     end else begin
                        vZip.ZipName := '';
                        DeleteFile(sDownloadFullFileName);
                     end;
                  end;

                  if not FileExists(sDownloadFullFileName) then begin
                     lblServerPath.Caption := sServerFullFileName;
                     lblLocalPath.Caption := sDownloadFullFileName;
                     DownLoadXRDFile(sServerFullFileName, sDownloadFullFileName);
                     if FileExists(sDownloadFullFileName) then begin
                        vZip.ZipName := sDownloadFullFileName;
                        vZip.DestDir := TSN_XRD_PATH;
                        if IsValidZip(sDownloadFullFileName) then begin
                           dm.tblTSNDownload.Edit();
                           dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                           hLog.AddToLog(sDownloadFullFileName, msevOperation);
                           dm.tblTSNDownload.Post();
                           dm.tblTSNDownload.FlushBuffers();

                           dm.tblProcessed.IndexName := '';
                           dm.tblProcessed.SetKey();
                           dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                           dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                           if (not dm.tblProcessed.GotoKey()) then begin
                              dm.tblProcessed.Append();
                              dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                              dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                              dm.tblProcessed.FieldByName('IsTSNXRDDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end else begin
                              dm.tblProcessed.Edit();
                              dm.tblProcessed.FieldByName('IsTSNXRDDownloaded').Value := true;
                              dm.tblProcessed.Post();
                           end;

                           hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                        end else begin
                           vZip.ZipName := '';
                           DeleteFile(sDownloadFullFileName);
                        end;
                     end;
                     staBar.SimpleText := sDownloadFullFileName;
                     Application.ProcessMessages();
                  end;
               end;
            end;
            Sleep(1);
            dm.tblTSNDownload.Next();
         end;
         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
      except
         idHTTP.Disconnect;
         CloseTable(dm.tblTrack);
         CloseTable(dm.tblTSNDownload);
         CloseTable(dm.tblVendor);
         CloseTable(dm.tblProcessed);
         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
         lblServerPath.Visible := False;
         lblLocalPath.Visible := False;
         Exit;
      end;

      idHTTP.Disconnect;
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTSNDownload);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   finally
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTSNDownload);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      idHTTP.Disconnect;
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   end;


end;



procedure TMainForm.btnProcessTSNResultsClick(Sender: TObject);
begin

   TimerOn(False);
   //   ImportTSNResults(Sender, dm.tblRH, dm.tblHH);
   ImportHDWResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
   ///  ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
   TimerOn(True);

end;

procedure TMainForm.btnReprocessTsnResultsClick(Sender: TObject);
var
   iniFile: TIniFile;

begin
   TimerOn(False);

   dtAltFirstDateToProcess := edtAltFirstDateToProcess.Date;
   dtAltLastDateToProcess := edtAltLastDateToProcess.Date;

   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'AltFirstDateToProcess', edtAltFirstDateToProcess.Date);
   finally
      FreeAndNil(iniFile);
   end;

   try
      iniFile := TIniFile.Create(INI_FILE);
      iniFile.WriteDate('Process', 'AltLastDateToProcess', edtAltLastDateToProcess.Date);
   finally
      FreeAndNil(iniFile);
   end;

   try
      edtOverrideDate.Date := dtAltFirstDateToProcess;
      OpenTable(dm.tblRH);
      OpenTable(dm.tblHH);
      gbOpenCloseFiles := False;
      repeat
         try
            // ImportTSNResults(Sender, dm.tblRH, dm.tblHH, );
            ImportHDWResults(Sender, dm.tblRH, dm.tblHH);
            //        ProcessPicksAndResults(dm.tblRH, OVERRIDE_DATE_TRUE);
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
         edtOverrideDate.Date := edtOverrideDate.Date + 1;
      until (edtOverrideDate.Date > dtAltLastDateToProcess);
   finally // wrap up
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      gbOpenCloseFiles := True;
      try
         iniFile := TIniFile.Create(INI_FILE);
         iniFile.WriteDate('Process', 'AltFirstDateToProcess', edtAltLastDateToProcess.Date);
         edtAltFirstDateToProcess.Date := edtAltLastDateToProcess.Date;
      finally
         FreeAndNil(iniFile);
      end;
      edtOverrideDate.Date := Now();
   end; // try/finally

   //try
   //   UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, TRN_STAT_DAYS);
   //except
   //   on E: Exception do hLog.AddToLog(E.Message, msevException);
   //end;

   TimerOn(True);
end;

procedure TMainForm.btnLoadBloodHorseLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + BLOODHORSE_LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + BLOODHORSE_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnLoadEquibaseLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + EQUIBASE_LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + EQUIBASE_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnLoadTSNLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + TSN_LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + TSN_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnLoadStatsLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + STATS_LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + STATS_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnLoadAxcisLogClick(Sender: TObject);
begin

   cxRtfLog.Clear;
   try
      if FileExists(LOG_PATH + AXCIS_LOG_FILENAME) then begin
         cxRtfLog.Lines.LoadFromFile(LOG_PATH + AXCIS_LOG_FILENAME);
      end;
   except
   end;

end;

procedure TMainForm.btnQueryPrevDayFormClick(Sender: TObject);
begin

   try
      if not assigned(WagerQueryForm) then begin
         WagerQueryForm := TWagerQueryForm.Create(Application);
      end;
      WagerQueryForm.bPreviousDay := True;
      WagerQueryForm.ShowModal
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;



end;


procedure TMainForm.btnTrainerConnectionsClick(Sender: TObject);
begin

   try
      if not assigned(TrainerConnectionsForm) then begin
         TrainerConnectionsForm := TTrainerConnectionsForm.Create(Application);
      end;
      TrainerConnectionsForm.ShowModal
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
   FreeAndNil(hLog);
end;

procedure TMainForm.edtOverrideDatePropertiesChange(Sender: TObject);
begin
   gedtOverrideDate := edtOverrideDate.Date;

end;

procedure TMainForm.btnCreateJustResultReportsClick(Sender: TObject);
begin

   // Reports
   if (chkPreviousDays.Checked) then begin

      if (chkExoticResultReports.Checked) then begin
         try
            if not assigned(ContestReportForm) then begin
               ContestResultReportForm := TContestResultReportForm.Create(Application);
            end;
            try
               ContestResultReportForm.bPreviousDay := True;
               ContestResultReportForm.ShowModal;
            finally
               FreeAndNil(ContestResultReportForm);
               ContestResultReportForm := nil;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      if (chkWagerResultsReports.Checked) then begin
         try
            if not assigned(WagerResultsReportForm) then begin
               WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
            end;
            try
               WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);
               WagerResultsReportForm.bPreviousDay := True;
               WagerResultsReportForm.bPrintOdds := False;
               WagerResultsReportForm.bPrintPower := True;
               WagerResultsReportForm.bPrintTodaysWager := False;
               WagerResultsReportForm.bPrintOwnerBred := False;
               WagerResultsReportForm.bOwnerWagerSelected := True;

               WagerResultsReportForm.ShowModal;
            finally
               FreeAndNil(WagerResultsReportForm);
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;
   end;

   //Last 21
   if (chkPrevious21Days.Checked) then begin

      if (chkExoticResultReports.Checked) then begin
         try
            if not assigned(ContestReportForm) then begin
               ContestResultReportForm := TContestResultReportForm.Create(Application);
            end;
            try
               ContestResultReportForm.bPreviousDay := False;
               ContestResultReportForm.ShowModal;
            finally
               FreeAndNil(ContestResultReportForm);
               ContestResultReportForm := nil;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

      try
         if not assigned(WagerResultsReportForm) then begin
            WagerResultsReportForm := TWagerResultsReportForm.Create(Application);
         end;
         try
            WagerResultsReportForm.varStartDate.Caption := 'For : ' + DateToStr(edtOverrideDate.Date);
            WagerResultsReportForm.varEndDate.Caption := DateToStr(edtOverrideDate.Date);

            WagerResultsReportForm.bPrintDetail := False;
            WagerResultsReportForm.bPreviousDay := False;
            WagerResultsReportForm.bPrintOdds := False;
            WagerResultsReportForm.bPrintPower := True;
            WagerResultsReportForm.bPrintTodaysWager := False;
            WagerResultsReportForm.bPrintOwnerBred := False;
            WagerResultsReportForm.bOwnerWagerSelected := False;
            WagerResultsReportForm.ShowModal;
         finally
            FreeAndNil(WagerResultsReportForm);
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   end;

end;

procedure TMainForm.btnHHTestClick(Sender: TObject);
begin
   Update_HH_PK_SK_DK_Keys(1000, false, 10000);

   //   OpenTableExclusive(dm.tblEntries);

      //     try
     //         dm.tblEntries.AddIndex('ByQSP1stCallRank', 'TrkCode;RaceDate;RaceNbr;QSP1stCall;KSP1stCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'QSP1stCall', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
     //      try
     //         dm.tblEntries.AddIndex('ByQSP2ndCallRank', 'TrkCode;RaceDate;RaceNbr;QSP2ndCall;KSP2ndCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'QSP2ndCall', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
     //      try
     //         dm.tblEntries.AddIndex('ByKSP1stCallRank', 'TrkCode;RaceDate;RaceNbr;KSP1stCall;QSP1stCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], 'QSP1stCall', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
     //      try
     //         dm.tblEntries.AddIndex('ByKSP2ndCallRank', 'TrkCode;RaceDate;RaceNbr;KSP2ndCall;QSP2ndCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], 'QSP2ndCall', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;

      //     try
     //         dm.tblEntries.AddIndex('ByEarlyPaceRank', 'TrkCode;RaceDate;RaceNbr;EarlyPace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'EarlyPace', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
     //      try
     //         dm.tblEntries.AddIndex('ByMiddlePaceRank', 'TrkCode;RaceDate;RaceNbr;MiddlePace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'MiddlePace', icFull);
     //      except
     //         on E: Exception do hLog.AddToLog(E.Message, msevException);
     //      end;
     //
   try
      dm.tblEntries.AddIndex('ByLatePaceRank', 'TrkCode;RaceDate;RaceNbr;LatePace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'LatePace', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   //
   //      try
   //         dm.tblEntries.AddIndex('ByEarlyPacePosRank', 'TrkCode;RaceDate;RaceNbr;EarlyPacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
   //      except
   //         on E: Exception do hLog.AddToLog(E.Message, msevException);
   //      end;
   //
   //      try
   //         dm.tblEntries.AddIndex('ByMiddlePacePosRank', 'TrkCode;RaceDate;RaceNbr;MiddlePacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
   //      except
   //         on E: Exception do hLog.AddToLog(E.Message, msevException);
   //      end;
   //
   //      try
   //         dm.tblEntries.AddIndex('ByLatePacePosRank', 'TrkCode;RaceDate;RaceNbr;LatePacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
   //      except
   //         on E: Exception do hLog.AddToLog(E.Message, msevException);
   //      end;

      //   try
      //      dm.tblEntries.AddIndex('ByTotalTrnJkyWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnJkyWinPct;TotalTrnJkyWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnJkyWinPct', icFull);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;
      //
      //
      //   try
      //      dm.tblEntries.AddIndex('ByTotalTrnTurfWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnTurfWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnTurfWinPct', icFull);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;

   //   try
   //      dm.tblEntries.AddIndex('ByTotalTrn30WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrn30WinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrn30WinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   try
   //      dm.tblEntries.AddIndex('ByTotalJky30WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalJky30WinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalJky30WinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   try
   //      dm.tblEntries.AddIndex('ByTotalTrnOddsWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnOddsWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnOddsWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   try
   //      dm.tblEntries.AddIndex('ByTotalJkyOddsWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalJkyOddsWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalJkyOddsWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //
   //   try
   //      dm.tblEntries.AddIndex('ByMorningLineTo1Rank', 'TrkCode;RaceDate;RaceNbr;MorningLineTo1;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //
   //   try
   //      dm.tblEntries.AddIndex('ByTrnTodayWinPctRank', 'TrkCode;RaceDate;RaceNbr;TrnTodayWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TrnTodayWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   //   //   try
      //      dm.tblEntries.AddIndex('ByTotalTrnWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnWinPct', icFull);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;
      //
      //   try
      //      dm.tblEntries.AddIndex('ByTotalTrnWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnWinPct', icFull);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;
      //
      //   try
      //      dm.tblEntries.AddIndex('ByTotalTrnWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TotalTrnWinPct', icFull);
      //   except
      //      on E: Exception do hLog.AddToLog(E.Message, msevException);
      //   end;

   CloseTableExclusive(dm.tblEntries);


   exit;
   try
      GenerateRankingStats(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
      GenerateRankingStatsByTrack(ONE_DAY_FALSE, FINAL_ORDER_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   //  try
  //      UpdateSummaryTables(BATCH_SIZE, CREATE_ALL_TRUE, ONE_DAY_FALSE, TRN_STAT_DAYS);
  //   except
  //      on E: Exception do hLog.AddToLog(E.Message, msevException);
  //   end;

   try
      Create_FO_PK_SK_DK_Keys(BATCH_SIZE, CREATE_ALL_TRUE, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
      Create_FO_LINER_Keys(BATCH_SIZE, LINER_ORDER_DAYS, LINER_ORDER_DAYS);
      Create_FinalOrder_Key(BATCH_SIZE, False, FINAL_ORDER_DAYS, FINAL_ORDER_DAYS);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure TMainForm.btnContendersClick(Sender: TObject);
begin

   TimerOn(False);

   //   qryDeleteNonContenders();
 //  try
//      UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   try
//      UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;


  // UpdateTodayContenders(Sender);

   TimerOn(True);

end;

//procedure TMainForm.UpdateTodayContenders(Sender: TObject);
//var
//   iEndPos: Integer;
//   iStartPos: Integer;
//   iAttributes: Integer;
//
//   sTmp: string;
//   sSearch: string;
//
//   tsFile: TSearchRec;
//   dtDownLoadDate: TDateTime;
//   dtPresent: TDateTime;
//
//   wYear: Word;
//   wMonth: Word;
//   wDay: Word;
//   sPath: string;
//   sFileName: string;
//   sRaceMM: string;
//   sRaceDD: string;
//   iLen: Integer;
//   bOk: boolean;
//   bDebug: boolean;
//begin
//
//   try
//      gbOpenCloseFiles := True;
//      OpenTable(dm.tblBank);
//      OpenTable(dm.tblRaces);
//      OpenTable(dm.tblEntries);
//      OpenTable(dm.tblPP);
//      OpenTable(dm.tblRH);
//      OpenTable(dm.tblHH);
//      OpenTable(dm.tblRankingStats);
//      OpenTable(dm.tblRankingStatsByTrk);
//      OpenTable(dm.tblFinalOrder);
//      OpenTable(dm.tblTrack);
//      OpenTable(dm.tblTrainer);
//      OpenTable(dm.tblJockey);
//      OpenTable(dm.tblOwner);
//      OpenTable(dm.tblSire);
//      OpenTable(dm.tblTrackLeaders);
//      OpenTable(dm.tblGimmicks);
//      OpenTable(dm.tblWagers);
//      gbOpenCloseFiles := False;
//
//
//      // This uses fields update in UpdateTipSelections
//      try
//         UpdateContenderWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//
//      try
//         UpdateContenderWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//
//
//
//   finally
//      gbOpenCloseFiles := True;
//      CloseTable(dm.tblRaces);
//      CloseTable(dm.tblEntries);
//      CloseTable(dm.tblRH);
//      CloseTable(dm.tblHH);
//      CloseTable(dm.tblPP);
//      CloseTable(dm.tblRankingStats);
//      CloseTable(dm.tblRankingStatsByTrk);
//      CloseTable(dm.tblFinalOrder);
//      CloseTable(dm.tblTrack);
//      CloseTable(dm.tblTrainer);
//      CloseTable(dm.tblJockey);
//      CloseTable(dm.tblOwner);
//      CloseTable(dm.tblSire);
//      CloseTable(dm.tblTrackLeaders);
//      CloseTable(dm.tblGimmicks);
//      CloseTable(dm.tblWagers);
//      CloseTable(dm.tblBank);
//   end;
//end;

procedure TMainForm.btnProcessAfterTomorrowClick(Sender: TObject);
begin
   hLog.AddToLog('ProcessTomorrow', msevOperation);
   TimerOn(False);

   try
      edtOverrideDate.Date := Now() + 2;
      if (chkDownloadAxcis.Checked) then begin
         btnDownloadAxcisClick(Sender);
      end;

      btnStartOfDayClick(Sender);
      btnImportClick(Sender);
      //if (chkDownloadAxcis.Checked) then begin
//         try
//            btnDownloadTSNClick(Sender);
//         except
//            on E: Exception do hLog.AddToLog(E.Message, msevException);
//         end;
//      end;
      btnCreateTodaysRatingsClick(Sender);
      btnImportTodayClick(Sender);

      //if (chkCreateReports.Checked) then begin
      //   btnCreateReportsClick(Sender);
      //end;
      //if (chkFTPReports.Checked) then begin
      //   btnFtpReportsClick(Sender);
      //end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True);

end;

procedure TMainForm.ImportTSNOldToday(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sMCPFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try

      try
         hLog.AddToLog('Import Todays TSN For Reports ', msevOperation);

         bDebug := False;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         OpenTable(dm.tblRaces);
         OpenTable(dm.tblEntries);
         OpenTable(dm.tblRatings);

         OpenTable(dm.tblTrack);
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblJockey);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.zip';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + 's.zip';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            //TrkCode
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               //FileName
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;
               sFileName := UpperCase(sFileName);

               vZip.ZipName := sFileName;
               vZip.DestDir := TSN_MCP_PATH;
               if IsValidZip(sFileName) then begin
                  try
                     vZip.UnZip;
                  except
                     on E: Exception do begin
                        hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                     end;
                  end;
                  dtPresent := Now();
                  DecodeDate(dtPresent, wYear, wMonth, wDay);
                  wDay := atow(sRaceDD);
                  wMonth := atow(sRaceMM);
                  if bProcessAllDates then begin
                     dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                  end else begin
                     dtAxcisRaceDate := dtDownloadDate;
                  end;
               end;
            end;

            while (FindNext(tsFile) = 0) do begin
               // TrkCode
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;
               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);

               if (sFileTrkCode <> '') then begin
                  //FileName
                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);
                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);

                  vZip.ZipName := sFileName;
                  vZip.DestDir := TSN_MCP_PATH;
                  if IsValidZip(sFileName) then begin
                     try
                        vZip.UnZip;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                        end;
                     end;
                     dtPresent := Now();
                     DecodeDate(dtPresent, wYear, wMonth, wDay);
                     wDay := atow(sRaceDD);
                     wMonth := atow(sRaceMM);
                     if bProcessAllDates then begin
                        dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                     end else begin
                        dtAxcisRaceDate := dtDownloadDate;
                     end;
                  end;

               end;
            end;
            FindClose(tsFile);
         end;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.mcp';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.mcp';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     ImportMCPFile(dm.tblRaces, dm.tblEntries, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin

            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     ImportMCPFile(dm.tblRaces, dm.tblEntries, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;
         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRatings);
            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblRatings);
      ClearPrgStatusBars();
   end;
end;

procedure TMainForm.ImportHDWToday(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sMCPFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try

      try
         hLog.AddToLog('Import Todays TSN For Reports ', msevOperation);

         bDebug := False;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         OpenTable(dm.tblRaces);
         OpenTable(dm.tblEntries);
         OpenTable(dm.tblRatings);

         OpenTable(dm.tblTrack);
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblJockey);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.zip';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + 's.zip';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            //TrkCode
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               //FileName
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;
               sFileName := UpperCase(sFileName);

               vZip.ZipName := sFileName;
               vZip.DestDir := TSN_MCP_PATH;
               if IsValidZip(sFileName) then begin
                  try
                     vZip.UnZip;
                  except
                     on E: Exception do begin
                        hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                     end;
                  end;
                  dtPresent := Now();
                  DecodeDate(dtPresent, wYear, wMonth, wDay);
                  wDay := atow(sRaceDD);
                  wMonth := atow(sRaceMM);
                  if bProcessAllDates then begin
                     dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                  end else begin
                     dtAxcisRaceDate := dtDownloadDate;
                  end;
               end;
            end;

            while (FindNext(tsFile) = 0) do begin
               // TrkCode
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;
               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);

               if (sFileTrkCode <> '') then begin
                  //FileName
                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);
                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);

                  vZip.ZipName := sFileName;
                  vZip.DestDir := TSN_MCP_PATH;
                  if IsValidZip(sFileName) then begin
                     try
                        vZip.UnZip;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                        end;
                     end;
                     dtPresent := Now();
                     DecodeDate(dtPresent, wYear, wMonth, wDay);
                     wDay := atow(sRaceDD);
                     wMonth := atow(sRaceMM);
                     if bProcessAllDates then begin
                        dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                     end else begin
                        dtAxcisRaceDate := dtDownloadDate;
                     end;
                  end;

               end;
            end;
            FindClose(tsFile);
         end;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.mcp';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.mcp';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     ImportMCPFile(dm.tblRaces, dm.tblEntries, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin

            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     ImportMCPFile(dm.tblRaces, dm.tblEntries, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;
         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRatings);
            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblRatings);
      ClearPrgStatusBars();
   end;
end;


//

procedure TMainForm.ImportTSNOldResults(Sender: TObject;
   tblR: TDBISAMTable;
   tblE: TDBISAMTable
   );
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sXRDFileName: string;

   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try
      if (gbOpenCloseFiles) then begin
         OpenTable(tblR);
         OpenTable(dm.tblEntries);
         gbOpenCloseFiles := False;
      end;

      try
         hLog.AddToLog('Import TSN XRD Results ', msevOperation);

         bDebug := False;

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;
         sPath := TSN_XRD_PATH;

         if bProcessAllDates then begin
            sSearch := sProcessAllDatesPath + sProcessAllDatesSearch;
            sPath := sProcessAllDatesPath;
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'z*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + 'x.zip';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;
               sFileName := UpperCase(sFileName);
               vZip.ZipName := sFileName;
               vZip.DestDir := sPath; //TSN_XRD_PATH;
               if IsValidZip(sFileName) then begin
                  try
                     vZip.UnZip;
                  except
                     on E: Exception do begin
                        hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                     end;
                  end;
               end else begin
                  DeleteFile(sFileName);
                  hLog.AddToLog('Bad Zip ' + sFileName, msevOperation);
               end;
            end;

            while (FindNext(tsFile) = 0) do begin
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;
               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);

               if (sFileTrkCode <> '') then begin
                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);

                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);

                  vZip.ZipName := sFileName;
                  vZip.DestDir := sPath; //TSN_XRD_PATH;
                  if IsValidZip(sFileName) then begin
                     try
                        vZip.UnZip;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                        end;
                     end;
                  end else begin
                     DeleteFile(sFileName);
                     hLog.AddToLog('Bad Zip ' + sFileName, msevOperation);
                  end;
               end;
            end;
            FindClose(tsFile);
         end;

         iAttributes := faAnyFile;
         sPath := TSN_XRD_PATH;
         if bProcessAllDates then begin
            sSearch := sProcessAllDatesPath + sProcessAllDatesSearchXrd;
            sPath := sProcessAllDatesPath;
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.xrd';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sXRDFileName := UpperCase(sFileName);
               if FileExists(sXRDFileName) then begin
                  try
                     ImportXRDFile(tblR, tblE, sXRDFileName);
                  except
                     on E: Exception do begin
                        DeleteFile(sFileName);
                        hLog.AddToLog('Bad Zip ' + sFileName + ' ' + E.Message, msevOperation);
                     end;
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sXRDFileName := UpperCase(sFileName);
               if FileExists(sXRDFileName) then begin
                  try
                     ImportXRDFile(tblR, tblE, sXRDFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      if (not gbOpenCloseFiles) then begin
         gbOpenCloseFiles := True;
         CloseTable(tblR);
         CloseTable(dm.tblEntries);
      end;
      ClearPrgStatusBars();
   end;
end;


procedure TMainForm.ImportHDWResults(Sender: TObject;
   tblR: TDBISAMTable;
   tblE: TDBISAMTable
   );
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sXRDFileName: string;

   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try
      if (gbOpenCloseFiles) then begin
         OpenTable(tblR);
         OpenTable(dm.tblEntries);
         gbOpenCloseFiles := False;
      end;

      try
         hLog.AddToLog('Import TSN XRD Results ', msevOperation);

         bDebug := False;

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;
         sPath := TSN_XRD_PATH;

         if bProcessAllDates then begin
            sSearch := sProcessAllDatesPath + sProcessAllDatesSearch;
            sPath := sProcessAllDatesPath;
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'z*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + 'x.zip';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;
               sFileName := UpperCase(sFileName);
               vZip.ZipName := sFileName;
               vZip.DestDir := sPath; //TSN_XRD_PATH;
               if IsValidZip(sFileName) then begin
                  try
                     vZip.UnZip;
                  except
                     on E: Exception do begin
                        hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                     end;
                  end;
               end else begin
                  DeleteFile(sFileName);
                  hLog.AddToLog('Bad Zip ' + sFileName, msevOperation);
               end;
            end;

            while (FindNext(tsFile) = 0) do begin
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;
               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);

               if (sFileTrkCode <> '') then begin
                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);

                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);

                  vZip.ZipName := sFileName;
                  vZip.DestDir := sPath; //TSN_XRD_PATH;
                  if IsValidZip(sFileName) then begin
                     try
                        vZip.UnZip;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                        end;
                     end;
                  end else begin
                     DeleteFile(sFileName);
                     hLog.AddToLog('Bad Zip ' + sFileName, msevOperation);
                  end;
               end;
            end;
            FindClose(tsFile);
         end;

         iAttributes := faAnyFile;
         sPath := TSN_XRD_PATH;
         if bProcessAllDates then begin
            sSearch := sProcessAllDatesPath + sProcessAllDatesSearchXrd;
            sPath := sProcessAllDatesPath;
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.xrd';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sXRDFileName := UpperCase(sFileName);
               if FileExists(sXRDFileName) then begin
                  try
                     ImportXRDFile(tblR, tblE, sXRDFileName);
                  except
                     on E: Exception do begin
                        DeleteFile(sFileName);
                        hLog.AddToLog('Bad Zip ' + sFileName + ' ' + E.Message, msevOperation);
                     end;
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sXRDFileName := UpperCase(sFileName);
               if FileExists(sXRDFileName) then begin
                  try
                     ImportXRDFile(tblR, tblE, sXRDFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      if (not gbOpenCloseFiles) then begin
         gbOpenCloseFiles := True;
         CloseTable(tblR);
         CloseTable(dm.tblEntries);
      end;
      ClearPrgStatusBars();
   end;
end;

//

procedure TMainForm.ImportHDWHistory(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sJCPFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try

      try
         hLog.AddToLog('Import Todays HDW For History ', msevOperation);

         bDebug := False;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         OpenTable(dm.tblRaces);
         OpenTable(dm.tblEntries);
         OpenTable(dm.tblRatings);

         OpenTable(dm.tblTrack);
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblATrainerList);
         OpenTable(dm.tblTrainerCategory);
         OpenTable(dm.tblTrainerJockeySummary);
         OpenTable(dm.tblTrainerOwnerSummary);
         OpenTable(dm.tblJockey);

         OpenTable(dm.tblRH);
         OpenTable(dm.tblHH);


         OpenTable(dm.tblPP);


         OpenTable(dm.tblRatingSireClass);
         OpenTable(dm.tblRatingSireTurf);

         OpenTable(dm.tblRatingSireMud);
         OpenTable(dm.tblRatingSireAW);

         OpenTable(dm.tblRatingSireSprint);
         OpenTable(dm.tblRatingSireRoute);


         OpenTable(dm.tblRatingDamSireClass);
         OpenTable(dm.tblRatingDamSireTurf);

         OpenTable(dm.tblRatingDamSireMud);
         OpenTable(dm.tblRatingDamSireAW);

         OpenTable(dm.tblRatingDamSireSprint);
         OpenTable(dm.tblRatingDamSireRoute);


         OpenTable(dm.tblRatingTrainer);
         OpenTable(dm.tblRatingTrainerTrack);
         OpenTable(dm.tblRatingTrainerJockey);
         OpenTable(dm.tblRatingTrainerOwner);

         OpenTable(dm.tblRatingJockey);
         OpenTable(dm.tblRatingJockeyTrack);
         OpenTable(dm.tblRatingJockeyOwner);

         OpenTable(dm.tblRatingOwner);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;

         iAttributes := faAnyFile;
         sPath := HDW_JCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.jcp';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.jcp';
            //sFileName := sFileName + '.mcp';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sJCPFileName := UpperCase(sFileName);
               if FileExists(sJCPFileName) then begin
                  try
                     UpdateStatusBar(sJCPFileName);
                     HDWImportJCP(dm.tblRaces,
                        dm.tblEntries,
                        dm.tblRH,
                        dm.tblHH,
                        dm.tblPP,
                        dm.tblRatingSireClass,
                        dm.tblRatingSireTurf,
                        dm.tblRatingSireSprint,
                        dm.tblRatingSireRoute,
                        dm.tblRatingSireMud,
                        dm.tblRatingSireAW,
                        dm.tblRatingDamSireClass,
                        dm.tblRatingDamSireTurf,
                        dm.tblRatingDamSireSprint,
                        dm.tblRatingDamSireRoute,
                        dm.tblRatingDamSireMud,
                        dm.tblRatingDamSireAW,
                        dm.tblRatingTrainer,
                        dm.tblRatingTrainerJockey,
                        dm.tblRatingTrainerOwner,
                        dm.tblRatingTrainerTrack,
                        dm.tblRatingJockey,
                        dm.tblRatingJockeyOwner,
                        dm.tblRatingJockeyTrack,
                        dm.tblRatingOwner,
                        sJCPFileName);


                     UpdateHDW(dm.tblRaces, dm.tblEntries, dm.tblTrainerCategory, dm.tblATrainerList, dm.tblTrainerJockeySummary, dm.tblTrainerOwnerSummary, sJCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sJCPFileName := UpperCase(sFileName);
               if FileExists(sJCPFileName) then begin
                  try
                     UpdateStatusBar(sJCPFileName);
                     HDWImportJCP(dm.tblRaces,
                        dm.tblEntries,
                        dm.tblRH,
                        dm.tblHH,
                        dm.tblPP,
                        dm.tblRatingSireClass,
                        dm.tblRatingSireTurf,
                        dm.tblRatingSireSprint,
                        dm.tblRatingSireRoute,
                        dm.tblRatingSireMud,
                        dm.tblRatingSireAW,
                        dm.tblRatingDamSireClass,
                        dm.tblRatingDamSireTurf,
                        dm.tblRatingDamSireSprint,
                        dm.tblRatingDamSireRoute,
                        dm.tblRatingDamSireMud,
                        dm.tblRatingDamSireAW,
                        dm.tblRatingTrainer,
                        dm.tblRatingTrainerJockey,
                        dm.tblRatingTrainerOwner,
                        dm.tblRatingTrainerTrack,
                        dm.tblRatingJockey,
                        dm.tblRatingJockeyOwner,
                        dm.tblRatingJockeyTrack,
                        dm.tblRatingOwner,
                        sJCPFileName);

                     UpdateHDW(dm.tblRaces, dm.tblEntries, dm.tblTrainerCategory, dm.tblATrainerList, dm.tblTrainerJockeySummary, dm.tblTrainerOwnerSummary, sJCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;
            end;
         end;
         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblATrainerList);
            CloseTable(dm.tblTrainerCategory);
            CloseTable(dm.tblTrainerJockeySummary);
            CloseTable(dm.tblTrainerOwnerSummary);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRatings);

            CloseTable(dm.tblRatingSireClass);
            CloseTable(dm.tblRatingSireTurf);

            CloseTable(dm.tblRatingSireMud);
            CloseTable(dm.tblRatingSireAW);

            CloseTable(dm.tblRatingSireSprint);
            CloseTable(dm.tblRatingSireRoute);


            CloseTable(dm.tblRatingDamSireClass);
            CloseTable(dm.tblRatingDamSireTurf);

            CloseTable(dm.tblRatingDamSireMud);
            CloseTable(dm.tblRatingDamSireAW);

            CloseTable(dm.tblRatingDamSireSprint);
            CloseTable(dm.tblRatingDamSireRoute);

            CloseTable(dm.tblRatingTrainer);
            CloseTable(dm.tblRatingTrainerTrack);
            CloseTable(dm.tblRatingTrainerJockey);
            CloseTable(dm.tblRatingTrainerOwner);

            CloseTable(dm.tblRatingJockey);
            CloseTable(dm.tblRatingJockeyTrack);
            CloseTable(dm.tblRatingJockeyOwner);

            CloseTable(dm.tblRatingOwner);

            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPP);
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainerCategory);
      CloseTable(dm.tblATrainerList);
      CloseTable(dm.tblTrainerJockeySummary);
      CloseTable(dm.tblTrainerOwnerSummary);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblRatings);

      CloseTable(dm.tblRatingSireClass);
      CloseTable(dm.tblRatingSireTurf);

      CloseTable(dm.tblRatingSireMud);
      CloseTable(dm.tblRatingSireAW);

      CloseTable(dm.tblRatingSireSprint);
      CloseTable(dm.tblRatingSireRoute);

      CloseTable(dm.tblRatingDamSireClass);
      CloseTable(dm.tblRatingDamSireTurf);

      CloseTable(dm.tblRatingDamSireMud);
      CloseTable(dm.tblRatingDamSireAW);

      CloseTable(dm.tblRatingDamSireSprint);
      CloseTable(dm.tblRatingDamSireRoute);

      CloseTable(dm.tblRatingTrainer);
      CloseTable(dm.tblRatingTrainerTrack);
      CloseTable(dm.tblRatingTrainerJockey);
      CloseTable(dm.tblRatingTrainerOwner);

      CloseTable(dm.tblRatingJockey);
      CloseTable(dm.tblRatingJockeyTrack);
      CloseTable(dm.tblRatingJockeyOwner);

      CloseTable(dm.tblRatingOwner);

      ClearPrgStatusBars();
   end;
end;

procedure TMainForm.ImportHDWForToday(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
begin

   try

      try
         hLog.AddToLog('Import Todays HDW For Reports ', msevOperation);
         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         try
            gbOpenCloseFiles := True;
            OpenTable(dm.tblBank);
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblPP);
            OpenTable(dm.tblRH);
            OpenTable(dm.tblHH);
            OpenTable(dm.tblRankingStats);
            OpenTable(dm.tblRankingStatsByTrk);
            OpenTable(dm.tblFinalOrder);
            OpenTable(dm.tblTrack);
            OpenTable(dm.tblTrainer);
            OpenTable(dm.tblJockey);
            OpenTable(dm.tblOwner);
            OpenTable(dm.tblSire);
            OpenTable(dm.tblTrackLeaders);
            OpenTable(dm.tblGimmicks);
            OpenTable(dm.tblWagers);
            gbOpenCloseFiles := False;

            try
               UpdateQSPAndKSP(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            SetRanking(dm.tblEntries, 'ByQSP1stCallRank', 'QSP1stCallRank', 'QSP1stCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByQSP2ndCallRank', 'QSP2ndCallRank', 'QSP2ndCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByKSP1stCallRank', 'KSP1stCallRank', 'KSP1stCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRanking(dm.tblEntries, 'ByKSP2ndCallRank', 'KSP2ndCallRank', 'KSP2ndCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);

            SetRankingDouble(dm.tblEntries, 'ByEarlyPacePosRank', 'EarlyPacePosRank', 'EarlyPacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRankingDouble(dm.tblEntries, 'ByMiddlePacePosRank', 'MiddlePacePosRank', 'MiddlePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRankingDouble(dm.tblEntries, 'ByLatePacePosRank', 'LatePacePosRank', 'LatePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);

            SetRankingDouble(dm.tblEntries, 'ByEarlyPaceRank', 'EarlyPaceRank', 'EarlyPace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByMiddlePaceRank', 'MiddlePaceRank', 'MiddlePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByLatePaceRank', 'LatePaceRank', 'LatePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);

            SetRanking(dm.tblEntries, 'ByTotalTrn30WinPctRank', 'TotalTrn30WinPctRank', 'TotalTrn30WinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalJky30WinPctRank', 'TotalJky30WinPctRank', 'TotalJky30WinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalTrnOddsWinPctRank', 'TotalTrnOddsWinPctRank', 'TotalTrnOddsWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalJkyOddsWinPctRank', 'TotalJkyOddsWinPctRank', 'TotalJkyOddsWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByMorningLineTo1Rank', 'MorningLineTo1Rank', 'MorningLineTo1', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRanking(dm.tblEntries, 'ByTrnTodayWinPctRank', 'TrnTodayWinPctRank', 'TrnTodayWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByLastSpeedRank', 'LastSpeedRank', 'LastSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByBackSpeedRank', 'BackSpeedRank', 'BackSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByPowerRank', 'PowerRank', 'Power', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);


            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);

            try
               IndexToday(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            try
               IndexPedigree(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            gbOpenCloseFiles := False;

            //Paired
            qryUpdateEntryOwnerFromXrefTrainer();
            try
               UpdateTrnJkyOwnSireRanks(dm.tblRaces, dm.tblEntries, dm.tblTrack, dm.tblTrainer, dm.tblJockey, dm.tblOwner, dm.tblSire, dm.tblTrackLeaders, dm.tblOwnerSummary, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateATrainerList(dm.tblRaces, dm.tblEntries, dm.tblATrainerList, pnlPrgBar, prgBar, staBar);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            // Has to be run this way - start
            try
               UpdateNbrOfStarters(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               SetLiners(dm.tblRaces, dm.tblEntries, dm.tblRankingStats, dm.tblRankingStatsByTrk, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               UpdateTopFigures(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               UpdatePaceAdvantage(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            try
               UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            // This uses fields update in UpdateTipSelections
            //HAS TO RUN TWICE
            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, ALT_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            // This uses TodaysWagerChoices
            try
               UpdateReportSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblGimmicks);
            try
               UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblGimmicks);
            gbOpenCloseFiles := False;

            try
               UpdateATrainerList(dm.tblRaces, dm.tblEntries, dm.tblATrainerList, pnlPrgBar, prgBar, staBar);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //      try
      //               Update_FinalOrder_WinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
      //            except
      //               on E: Exception do hLog.AddToLog(E.Message, msevException);
      //            end;
      //
      //            try
      //               Update_FinalOrder_WinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
      //            except
      //               on E: Exception do hLog.AddToLog(E.Message, msevException);
      //            end;


            try
               UpdateHHFromToday(dm.tblRaces, dm.tblEntries, dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         finally
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);

            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;

   finally
      gbOpenCloseFiles := True;
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPP);
      CloseTable(dm.tblRankingStats);
      CloseTable(dm.tblRankingStatsByTrk);
      CloseTable(dm.tblFinalOrder);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblOwner);
      CloseTable(dm.tblSire);
      CloseTable(dm.tblTrackLeaders);
      CloseTable(dm.tblGimmicks);
      CloseTable(dm.tblWagers);
      CloseTable(dm.tblBank);
      ClearPrgStatusBars();
   end;

end;

//

procedure TMainForm.ImportTSNHistory(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sMCPFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
   iFilesExtracted: integer;

begin

   try

      try
         hLog.AddToLog('Import Todays TSN For History ', msevOperation);

         bDebug := False;

         CloseTable(dm.tblRaces);
         CloseTable(dm.tblEntries);

         OpenTable(dm.tblRaces);
         OpenTable(dm.tblEntries);
         OpenTable(dm.tblRatings);

         OpenTable(dm.tblTrack);
         OpenTable(dm.tblTrainer);
         OpenTable(dm.tblATrainerList);
         OpenTable(dm.tblTrainerCategory);
         OpenTable(dm.tblTrainerJockeySummary);
         OpenTable(dm.tblTrainerOwnerSummary);
         OpenTable(dm.tblJockey);

         OpenTable(dm.tblRH);
         OpenTable(dm.tblHH);


         OpenTable(dm.tblPP);


         OpenTable(dm.tblRatingSireClass);
         OpenTable(dm.tblRatingSireTurf);

         OpenTable(dm.tblRatingSireMud);
         OpenTable(dm.tblRatingSireAW);

         OpenTable(dm.tblRatingSireSprint);
         OpenTable(dm.tblRatingSireRoute);


         OpenTable(dm.tblRatingDamSireClass);
         OpenTable(dm.tblRatingDamSireTurf);

         OpenTable(dm.tblRatingDamSireMud);
         OpenTable(dm.tblRatingDamSireAW);

         OpenTable(dm.tblRatingDamSireSprint);
         OpenTable(dm.tblRatingDamSireRoute);


         OpenTable(dm.tblRatingTrainer);
         OpenTable(dm.tblRatingTrainerTrack);
         OpenTable(dm.tblRatingTrainerJockey);
         OpenTable(dm.tblRatingTrainerOwner);

         OpenTable(dm.tblRatingJockey);
         OpenTable(dm.tblRatingJockeyTrack);
         OpenTable(dm.tblRatingJockeyOwner);

         OpenTable(dm.tblRatingOwner);

         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.zip';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + 'r.zip';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            //TrkCode
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               //FileName
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;
               sFileName := UpperCase(sFileName);

               vZip.ZipName := sFileName;
               vZip.DestDir := TSN_MCP_PATH;
               if IsValidZip(sFileName) then begin
                  try
                     vZip.UnZip;
                  except
                     on E: Exception do begin
                        hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                     end;
                  end;
                  dtPresent := Now();
                  DecodeDate(dtPresent, wYear, wMonth, wDay);
                  wDay := atow(sRaceDD);
                  wMonth := atow(sRaceMM);
                  if bProcessAllDates then begin
                     dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                  end else begin
                     dtAxcisRaceDate := dtDownloadDate;
                  end;
               end;
            end;

            while (FindNext(tsFile) = 0) do begin
               // TrkCode
               iEndPos := SmartPos('.', tsFile.Name);
               iStartPos := iEndPos - 5;
               sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
               sFileTrkCode := UpperCase(sFileTrkCode);

               if (sFileTrkCode <> '') then begin
                  //FileName
                  sTmp := CopyStr(tsFile.Name, iStartPos, 4);
                  sRaceMM := CopyStr(sTmp, 1, 2);
                  sRaceDD := CopyStr(sTmp, 3, 2);
                  sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
                  iLen := Length(sTmp);
                  sTmp := CopyStr(sTmp, 9, iLen - 8);
                  sFileName := sPath + sTmp;
                  sFileName := UpperCase(sFileName);

                  vZip.ZipName := sFileName;
                  vZip.DestDir := TSN_MCP_PATH;
                  if IsValidZip(sFileName) then begin
                     try
                        vZip.UnZip;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(sFileName + ' ' + E.Message, msevException);
                        end;
                     end;
                     dtPresent := Now();
                     DecodeDate(dtPresent, wYear, wMonth, wDay);
                     wDay := atow(sRaceDD);
                     wMonth := atow(sRaceMM);
                     if bProcessAllDates then begin
                        dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
                     end else begin
                        dtAxcisRaceDate := dtDownloadDate;
                     end;
                  end;

               end;
            end;
            FindClose(tsFile);
         end;

         iAttributes := faAnyFile;
         sPath := TSN_MCP_PATH;
         if bProcessAllDates then begin
            sSearch := sPath + '*.mcp';
         end else begin
            DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
            if gbTest then begin
               sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end else begin
               sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
            end;
            sFileName := sFileName + '.mcp';
            //sFileName := sFileName + '.mcp';
            sSearch := sPath + sFileName;
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);
               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     UpdateStatusBar(sMCPFileName);
                  //   TSNImportMCP(dm.tblRaces,
//                        dm.tblEntries,
//                        dm.tblRH,
//                        dm.tblHH,
//                        dm.tblPP,
//                        dm.tblRatingSireClass,
//                        dm.tblRatingSireTurf,
//                        dm.tblRatingSireSprint,
//                        dm.tblRatingSireRoute,
//                        dm.tblRatingSireMud,
//                        dm.tblRatingSireAW,
//                        dm.tblRatingDamSireClass,
//                        dm.tblRatingDamSireTurf,
//                        dm.tblRatingDamSireSprint,
//                        dm.tblRatingDamSireRoute,
//                        dm.tblRatingDamSireMud,
//                        dm.tblRatingDamSireAW,
//                        dm.tblRatingTrainer,
//                        dm.tblRatingTrainerJockey,
//                        dm.tblRatingTrainerOwner,
//                        dm.tblRatingTrainerTrack,
//                        dm.tblRatingJockey,
//                        dm.tblRatingJockeyOwner,
//                        dm.tblRatingJockeyTrack,
//                        dm.tblRatingOwner,
//                        sMCPFileName);


                     UpdateTSN(dm.tblRaces, dm.tblEntries, dm.tblTrainerCategory, dm.tblATrainerList, dm.tblTrainerJockeySummary, dm.tblTrainerOwnerSummary, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;

            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 4;
            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            if (sFileTrkCode <> '') then begin
               sTmp := CopyStr(tsFile.Name, iStartPos, 4);
               sRaceMM := CopyStr(sTmp, 1, 2);
               sRaceDD := CopyStr(sTmp, 3, 2);

               sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
               iLen := Length(sTmp);
               sTmp := CopyStr(sTmp, 9, iLen - 8);
               sFileName := sPath + sTmp;

               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);

               sMCPFileName := UpperCase(sFileName);
               if FileExists(sMCPFileName) then begin
                  try
                     UpdateStatusBar(sMCPFileName);
                  //   TSNImportMCP(dm.tblRaces,
//                        dm.tblEntries,
//                        dm.tblRH,
//                        dm.tblHH,
//                        dm.tblPP,
//                        dm.tblRatingSireClass,
//                        dm.tblRatingSireTurf,
//                        dm.tblRatingSireSprint,
//                        dm.tblRatingSireRoute,
//                        dm.tblRatingSireMud,
//                        dm.tblRatingSireAW,
//                        dm.tblRatingDamSireClass,
//                        dm.tblRatingDamSireTurf,
//                        dm.tblRatingDamSireSprint,
//                        dm.tblRatingDamSireRoute,
//                        dm.tblRatingDamSireMud,
//                        dm.tblRatingDamSireAW,
//                        dm.tblRatingTrainer,
//                        dm.tblRatingTrainerJockey,
//                        dm.tblRatingTrainerOwner,
//                        dm.tblRatingTrainerTrack,
//                        dm.tblRatingJockey,
//                        dm.tblRatingJockeyOwner,
//                        dm.tblRatingJockeyTrack,
//                        dm.tblRatingOwner,
//                        sMCPFileName);

                     UpdateTSN(dm.tblRaces, dm.tblEntries, dm.tblTrainerCategory, dm.tblATrainerList, dm.tblTrainerJockeySummary, dm.tblTrainerOwnerSummary, sMCPFileName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;
            end;
         end;
         FindClose(tsFile);

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblATrainerList);
            CloseTable(dm.tblTrainerCategory);
            CloseTable(dm.tblTrainerJockeySummary);
            CloseTable(dm.tblTrainerOwnerSummary);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRatings);

            CloseTable(dm.tblRatingSireClass);
            CloseTable(dm.tblRatingSireTurf);

            CloseTable(dm.tblRatingSireMud);
            CloseTable(dm.tblRatingSireAW);

            CloseTable(dm.tblRatingSireSprint);
            CloseTable(dm.tblRatingSireRoute);


            CloseTable(dm.tblRatingDamSireClass);
            CloseTable(dm.tblRatingDamSireTurf);

            CloseTable(dm.tblRatingDamSireMud);
            CloseTable(dm.tblRatingDamSireAW);

            CloseTable(dm.tblRatingDamSireSprint);
            CloseTable(dm.tblRatingDamSireRoute);

            CloseTable(dm.tblRatingTrainer);
            CloseTable(dm.tblRatingTrainerTrack);
            CloseTable(dm.tblRatingTrainerJockey);
            CloseTable(dm.tblRatingTrainerOwner);

            CloseTable(dm.tblRatingJockey);
            CloseTable(dm.tblRatingJockeyTrack);
            CloseTable(dm.tblRatingJockeyOwner);

            CloseTable(dm.tblRatingOwner);

            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;
   finally
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPP);
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainerCategory);
      CloseTable(dm.tblATrainerList);
      CloseTable(dm.tblTrainerJockeySummary);
      CloseTable(dm.tblTrainerOwnerSummary);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblRatings);

      CloseTable(dm.tblRatingSireClass);
      CloseTable(dm.tblRatingSireTurf);

      CloseTable(dm.tblRatingSireMud);
      CloseTable(dm.tblRatingSireAW);

      CloseTable(dm.tblRatingSireSprint);
      CloseTable(dm.tblRatingSireRoute);

      CloseTable(dm.tblRatingDamSireClass);
      CloseTable(dm.tblRatingDamSireTurf);

      CloseTable(dm.tblRatingDamSireMud);
      CloseTable(dm.tblRatingDamSireAW);

      CloseTable(dm.tblRatingDamSireSprint);
      CloseTable(dm.tblRatingDamSireRoute);

      CloseTable(dm.tblRatingTrainer);
      CloseTable(dm.tblRatingTrainerTrack);
      CloseTable(dm.tblRatingTrainerJockey);
      CloseTable(dm.tblRatingTrainerOwner);

      CloseTable(dm.tblRatingJockey);
      CloseTable(dm.tblRatingJockeyTrack);
      CloseTable(dm.tblRatingJockeyOwner);

      CloseTable(dm.tblRatingOwner);

      ClearPrgStatusBars();
   end;
end;


procedure TMainForm.ImportTSNForToday(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;
   bDebug: boolean;
begin

   try

      try
         hLog.AddToLog('Import Todays Axcis For Reports ', msevOperation);
         prgBar.Position := 0;
         pnlPrgBar.Visible := False;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now();
         end;

         iGimmicksRace := 0;

         iDDRace := 0;
         iPk3Race := 0;
         iPk4Race := 0;
         iPk6Race := 0;

         iExaRace := 0;
         iQuiRace := 0;
         iTriRace := 0;
         iSuperRace := 0;

         try
            gbOpenCloseFiles := True;
            OpenTable(dm.tblBank);
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblPP);
            OpenTable(dm.tblRH);
            OpenTable(dm.tblHH);
            OpenTable(dm.tblRankingStats);
            OpenTable(dm.tblRankingStatsByTrk);
            OpenTable(dm.tblFinalOrder);
            OpenTable(dm.tblTrack);
            OpenTable(dm.tblTrainer);
            OpenTable(dm.tblJockey);
            OpenTable(dm.tblOwner);
            OpenTable(dm.tblSire);
            OpenTable(dm.tblTrackLeaders);
            OpenTable(dm.tblGimmicks);
            OpenTable(dm.tblWagers);
            gbOpenCloseFiles := False;

            try
               UpdateQSPAndKSP(dm.tblRaces, dm.tblEntries, dm.tblPP, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            SetRanking(dm.tblEntries, 'ByQSP1stCallRank', 'QSP1stCallRank', 'QSP1stCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByQSP2ndCallRank', 'QSP2ndCallRank', 'QSP2ndCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByKSP1stCallRank', 'KSP1stCallRank', 'KSP1stCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRanking(dm.tblEntries, 'ByKSP2ndCallRank', 'KSP2ndCallRank', 'KSP2ndCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);

            SetRankingDouble(dm.tblEntries, 'ByEarlyPacePosRank', 'EarlyPacePosRank', 'EarlyPacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRankingDouble(dm.tblEntries, 'ByMiddlePacePosRank', 'MiddlePacePosRank', 'MiddlePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRankingDouble(dm.tblEntries, 'ByLatePacePosRank', 'LatePacePosRank', 'LatePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);

            SetRankingDouble(dm.tblEntries, 'ByEarlyPaceRank', 'EarlyPaceRank', 'EarlyPace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByMiddlePaceRank', 'MiddlePaceRank', 'MiddlePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByLatePaceRank', 'LatePaceRank', 'LatePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);

            SetRanking(dm.tblEntries, 'ByTotalTrn30WinPctRank', 'TotalTrn30WinPctRank', 'TotalTrn30WinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalJky30WinPctRank', 'TotalJky30WinPctRank', 'TotalJky30WinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalTrnOddsWinPctRank', 'TotalTrnOddsWinPctRank', 'TotalTrnOddsWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByTotalJkyOddsWinPctRank', 'TotalJkyOddsWinPctRank', 'TotalJkyOddsWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByMorningLineTo1Rank', 'MorningLineTo1Rank', 'MorningLineTo1', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, True);
            SetRanking(dm.tblEntries, 'ByTrnTodayWinPctRank', 'TrnTodayWinPctRank', 'TrnTodayWinPct', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByLastSpeedRank', 'LastSpeedRank', 'LastSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRanking(dm.tblEntries, 'ByBackSpeedRank', 'BackSpeedRank', 'BackSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
            SetRankingDouble(dm.tblEntries, 'ByPowerRank', 'PowerRank', 'Power', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);


            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);

            try
               IndexToday(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            try
               IndexPedigree(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 10);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            gbOpenCloseFiles := False;

            //Paired
            qryUpdateEntryOwnerFromXrefTrainer();
            try
               UpdateTrnJkyOwnSireRanks(dm.tblRaces, dm.tblEntries, dm.tblTrack, dm.tblTrainer, dm.tblJockey, dm.tblOwner, dm.tblSire, dm.tblTrackLeaders, dm.tblOwnerSummary, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateATrainerList(dm.tblRaces, dm.tblEntries, dm.tblATrainerList, pnlPrgBar, prgBar, staBar);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            // Has to be run this way - start
            try
               UpdateNbrOfStarters(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               SetLiners(dm.tblRaces, dm.tblEntries, dm.tblRankingStats, dm.tblRankingStatsByTrk, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               UpdateTopFigures(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //
            try
               UpdatePaceAdvantage(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            try
               UpdateTipSheetSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            // This uses fields update in UpdateTipSelections
            //HAS TO RUN TWICE
            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, ALT_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, dm.tblTrainerCategory, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS, NORMAL_ORDER);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            try
               UpdateTodaysWagerWinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, True, STAT_DAYS);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;


            // This uses TodaysWagerChoices
            try
               UpdateReportSelections(dm.tblRaces, dm.tblEntries, dm.tblTrack, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblGimmicks);
            try
               UpdateGimmicks(dm.tblRaces, dm.tblEntries, dm.tblGimmicks, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;
            OpenTable(dm.tblRaces);
            OpenTable(dm.tblEntries);
            OpenTable(dm.tblGimmicks);
            gbOpenCloseFiles := False;

            try
               UpdateATrainerList(dm.tblRaces, dm.tblEntries, dm.tblATrainerList, pnlPrgBar, prgBar, staBar);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            //      try
      //               Update_FinalOrder_WinPct(dm.tblRaces, dm.tblEntries, dm.tblFinalOrder, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
      //            except
      //               on E: Exception do hLog.AddToLog(E.Message, msevException);
      //            end;
      //
      //            try
      //               Update_FinalOrder_WinPctRank(dm.tblRaces, dm.tblEntries, pnlPrgBar, prgBar, staBar, BATCH_SIZE, False, RANKING_DAYS);
      //            except
      //               on E: Exception do hLog.AddToLog(E.Message, msevException);
      //            end;


            try
               UpdateHHFromToday(dm.tblRaces, dm.tblEntries, dm.tblRH, dm.tblHH, pnlPrgBar, prgBar, staBar, 100);
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         finally
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            gbOpenCloseFiles := True;
            CloseTable(dm.tblRaces);
            CloseTable(dm.tblEntries);
            CloseTable(dm.tblRH);
            CloseTable(dm.tblHH);
            CloseTable(dm.tblPP);
            CloseTable(dm.tblRankingStats);
            CloseTable(dm.tblRankingStatsByTrk);
            CloseTable(dm.tblFinalOrder);
            CloseTable(dm.tblTrack);
            CloseTable(dm.tblTrainer);
            CloseTable(dm.tblJockey);
            CloseTable(dm.tblOwner);
            CloseTable(dm.tblSire);
            CloseTable(dm.tblTrackLeaders);
            CloseTable(dm.tblGimmicks);
            CloseTable(dm.tblWagers);
            CloseTable(dm.tblBank);

            ClearPrgStatusBars();
            FindClose(tsFile);
         end;
      end;

   finally
      gbOpenCloseFiles := True;
      CloseTable(dm.tblRaces);
      CloseTable(dm.tblEntries);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblPP);
      CloseTable(dm.tblRankingStats);
      CloseTable(dm.tblRankingStatsByTrk);
      CloseTable(dm.tblFinalOrder);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTrainer);
      CloseTable(dm.tblJockey);
      CloseTable(dm.tblOwner);
      CloseTable(dm.tblSire);
      CloseTable(dm.tblTrackLeaders);
      CloseTable(dm.tblGimmicks);
      CloseTable(dm.tblWagers);
      CloseTable(dm.tblBank);
      ClearPrgStatusBars();
   end;

end;



procedure TMainForm.btnImportTodayClick(Sender: TObject);
begin

   TimerOn(False);
   ImportToday(Sender);
   TimerOn(True);

end;

procedure TMainForm.DownloadTSNLSC(Sender: TObject);
var
   dtDownLoadDate: TDateTime;
   iAttributes: integer;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadFullFileName: string;
   sDownloadLocation: string;
   sFileName: string;
   sFormatString: string;
   sOutputFileType: string;
   sOverrideDownloadLocation: string;
   sServerFullFileName: string;

   tsFile: TSearchRec;
   wDay: Word;
   wMonth: Word;
   wYear: Word;

   wPrevDay: Word;
   wPrevMonth: Word;
   wPrevYear: Word;

   procedure DownloadIt();
   begin
      iAttributes := faAnyFile;
      if (FindFirst(sDownloadFullFileName, iAttributes, tsFile) = 0) then begin
         DeleteFile(sDownloadFullFileName);
         Application.ProcessMessages();
      end;
      FindClose(tsFile);
      lblServerPath.Caption := sServerFullFileName;
      lblLocalPath.Caption := sDownloadFullFileName;
      if not FileExists(sDownloadFullFileName) then begin
         DownLoadLSCFile(sServerFullFileName, sDownloadFullFileName);
         staBar.SimpleText := sDownloadFullFileName;
         Application.ProcessMessages();
         Sleep(SLEEP_LONG);
      end;
   end;

begin

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=O&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=O&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=J&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=J&CNT=250

   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2004&STAT=T&CNT=250
   //http://www.equibase.com/premium/eqbTop50ByWins.cfm?YR=2005&STAT=T&CNT=250

   hLog.AddToLog('DownloadTSNScratches', msevOperation);
   CheckProxy();

   try
      try
         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;

         sStatusBar := 'Download Scratches';
         Application.ProcessMessages();


         sDownloadLocation := TSN_LSC_PATH;
         idHTTP.Request.Host := 'www.brisnet.com';

         idHTTP.Request.Host := INTERNET_TSN_HOME_PAGE;
         idHTTP.Request.Username := INTERNET_TSN_USER_CODE;
         idHTTP.Request.Password := INTERNET_TSN_PASS_WORD;

         if gbUseOverrideDate then begin
            dtDownloadDate := edtOverrideDate.Date;
         end else begin
            dtDownloadDate := Now() - 1;
         end;

         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         DecodeDate(dtDownloadDate - 365, wPrevYear, wPrevMonth, wPrevDay);

         sFileName := 'LSCFiles';
         sDownloadFullFileName := sDownloadLocation + sFilename + '.html';
         sServerFullFileName := 'http://www.brisnet.com/cgi-bin/trk_report.cgi?scr';
         DownloadIt();
         hLog.AddToLog(sDownloadFullFileName, msevOperation);

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
      ClearPrgStatusBars();
   end;

end;


procedure TMainForm.DIHtmlLinksPlugin1Link(
   const Sender: TDIHtmlLinksPlugin; const TagID, AttribId: Cardinal;
   var Link: WideString; var Accept, Show: Boolean);
begin
   hLog.AddToLog(Link, msevOperation);

end;

procedure TMainForm.btnDownloadTSNLSCClick(Sender: TObject);
begin
   hLog.AddToLog('btnDownloadTsnResults', msevOperation);
   TimerOn(False);
   hLog.LogFileName := LOG_PATH + TSN_LOG_FILENAME;
   qryDeleteLSC();

   //   DownloadTSNLSC(Sender);
   //   ProcessTSNLists(dm.dbSireRate, dm.tblTSNDownload, LSC_FILE);
   //   DownloadTsnLate(Sender);
   //   hLog.LogFileName := LOG_PATH + LOG_FILENAME;
   TimerOn(True);
end;

procedure TMainForm.DownloadTsnLate(Sender: TObject);
var
   sTrkCode: string;
   sTsnTrkCode: string;
   sNormalTrkCode: string;
   iAttributes: integer;
   tsFile: TSearchRec;
   sBaseImportPath: string;
   sCompressionMethod: string;
   sDownloadFileType: string;
   sDownloadLocation: string;
   sOutputFileType: string;
   sFormatString: string;
   sOverrideDownloadLocation: string;
   dtDownLoadDate: TDateTime;
   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sFileName: string;
   sDownloadFullFileName: string;
   sServerFullFileName: string;
   sTsnFileName: string;
   bMultiTrack: boolean;

   sMM: string;
   sDD: string;
   dtTSNFileDate: TDateTime;

   function DownLoadLCSFile(sURL: string; sLocalFile: string): boolean;
   var
      iAttributes: integer;
      tsFile: TSearchRec;
      fsIn: TFileStream;
   begin

      try
         Result := False;
         UpdateStatusBar(sURL + ' ' + sLocalFile);
         fsIn := TFileStream.Create(sLocalFile, fmCreate);
         idHTTP.Get(sURL, fsIn);
      except
         Result := False;
         fsIn.Destroy;
         DeleteFile(sLocalFile);
         UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
         Exit;
      end;

      fsIn.Destroy;
      //      iAttributes := faAnyFile;
      //      if (FindFirst(sLocalFile, iAttributes, tsFile) = 0) then begin
      //         if (tsFile.Size < MIN_TSN_XRD_FILE_SIZE) then begin
      //            Result := False;
      //            DeleteFile(sLocalFile);
      //            FindClose(tsFile);
      //            UpdateStatusBar('NO ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end else begin
      //            Result := True;
      //            FindClose(tsFile);
      //            UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      //            Exit;
      //         end;
      //      end;

      UpdateStatusBar('YES ' + sURL + ' ' + sLocalFile);
      Result := True;
   end;

begin

   hLog.AddToLog('DownloadTsnResults', msevOperation);

   CheckProxy();

   OpenTable(dm.tblTrack);
   OpenTable(dm.tblVendor);
   OpenTable(dm.tblProcessed);
   OpenTable(dm.tblTSNDownload);

   try
      try

         lblServerPath.Visible := True;
         lblLocalPath.Visible := True;
         dm.tblTSNDownload.Filter := 'FileType=' + QuotedStr('LSC');
         dm.tblTSNDownload.Filtered := True;

         dm.tblTSNDownload.First();
         while not dm.tblTSNDownload.Eof do begin
            IncPrgBar();
            if (dm.tblTSNDownload.FieldByName('FileType').AsString = 'LSC') then begin

               // if not (dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean) then begin

               sFileName := dm.tblTSNDownload.FieldByName('FileName').AsString;
               sServerFullFileName := dm.tblTSNDownload.FieldByName('ServerURL').AsString; ;

               sDownloadLocation := TSN_LSC_PATH;

               idHTTP.Request.Host := INTERNET_TSN_HOME_PAGE;
               idHTTP.Request.Username := INTERNET_TSN_USER_CODE;
               idHTTP.Request.Password := INTERNET_TSN_PASS_WORD;

               sTSNTrkCode := LeftStr(UpperCase(dm.tblTSNDownload.FieldByName('FileName').AsString), 3);
               DecodeDate(edtOverrideDate.date, wYear, wMonth, wDay);
               sMM := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 4, 2);
               sDD := CopyStr(dm.tblTSNDownload.FieldByName('FileName').AsString, 6, 2);
               if ((sMM = '09') and (sDD = '31')) then begin
                  sDD := '30';
               end;
               if ((sMM = '02') and (sDD = '31')) then begin
                  sDD := '28';
               end;

               try
                  dtTSNFileDate := EncodeDate(wYear, atow(sMM), atow(sDD));
               except
               end;
               sDownloadFullFileName := sDownloadLocation + sFileName;
               if FileExists(sDownloadFullFileName) then begin
                  vZip.ZipName := sDownloadFullFileName;
                  vZip.DestDir := TSN_LSC_PATH;
                  if IsValidZip(sDownloadFullFileName) then begin
                     dm.tblTSNDownload.Edit();
                     dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                     hLog.AddToLog(sDownloadFullFileName, msevOperation);
                     dm.tblTSNDownload.Post();
                     dm.tblTSNDownload.FlushBuffers();
                     dm.tblProcessed.IndexName := '';
                     dm.tblProcessed.SetKey();
                     dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                     dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                     if (not dm.tblProcessed.GotoKey()) then begin
                        dm.tblProcessed.Append();
                        dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                        dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                        dm.tblProcessed.FieldByName('IsTSNLSCDownloaded').Value := true;
                        dm.tblProcessed.Post();
                     end else begin
                        dm.tblProcessed.Edit();
                        dm.tblProcessed.FieldByName('IsTSNLSCDownloaded').Value := true;
                        dm.tblProcessed.Post();
                     end;
                     hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                  end else begin
                     vZip.ZipName := '';
                     DeleteFile(sDownloadFullFileName);
                  end;
               end;

               if not FileExists(sDownloadFullFileName) then begin
                  lblServerPath.Caption := sServerFullFileName;
                  lblLocalPath.Caption := sDownloadFullFileName;
                  DownLoadLSCFile(sServerFullFileName, sDownloadFullFileName);
                  if FileExists(sDownloadFullFileName) then begin
                     //     vZip.ZipName := sDownloadFullFileName;
                    //      vZip.DestDir := TSN_LSC_PATH;
                    //      if IsValidZip(sDownloadFullFileName) then begin
                     dm.tblTSNDownload.Edit();
                     dm.tblTSNDownload.FieldByName('IsDownloaded').AsBoolean := True;
                     hLog.AddToLog(sDownloadFullFileName, msevOperation);
                     dm.tblTSNDownload.Post();
                     dm.tblTSNDownload.FlushBuffers();

                     dm.tblProcessed.IndexName := '';
                     dm.tblProcessed.SetKey();
                     dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                     dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;

                     if (not dm.tblProcessed.GotoKey()) then begin
                        dm.tblProcessed.Append();
                        dm.tblProcessed.FieldByName('TrkCode').AsString := sTSNTrkCode;
                        dm.tblProcessed.FieldByName('RaceDate').Value := dtTsnFileDate;
                        dm.tblProcessed.FieldByName('IsTSNLSCDownloaded').Value := true;
                        dm.tblProcessed.Post();
                     end else begin
                        dm.tblProcessed.Edit();
                        dm.tblProcessed.FieldByName('IsTSNLSCDownloaded').Value := true;
                        dm.tblProcessed.Post();
                     end;

                     hLog.AddToLog('Downloaded' + sDownloadFullFileName, msevOperation);
                     //end else begin
                     //   vZip.ZipName := '';
                     //   DeleteFile(sDownloadFullFileName);
                     //end;
                  end;
                  staBar.SimpleText := sDownloadFullFileName;
                  Application.ProcessMessages();
               end;
            end;
            //      end;
            Sleep(1);
            dm.tblTSNDownload.Next();
         end;
         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
      except
         idHTTP.Disconnect;
         CloseTable(dm.tblTrack);
         CloseTable(dm.tblTSNDownload);
         CloseTable(dm.tblVendor);
         CloseTable(dm.tblProcessed);
         lblServerPath.Caption := '';
         lblLocalPath.Caption := '';
         lblServerPath.Visible := False;
         lblLocalPath.Visible := False;
         Exit;
      end;

      idHTTP.Disconnect;
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTSNDownload);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   finally
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblTSNDownload);
      CloseTable(dm.tblVendor);
      CloseTable(dm.tblProcessed);
      idHTTP.Disconnect;
      lblServerPath.Caption := '';
      lblLocalPath.Caption := '';
      lblServerPath.Visible := False;
      lblLocalPath.Visible := False;
   end;

end;

procedure TMainForm.btnProcessLateScratchesClick(Sender: TObject);
begin

   hLog.AddToLog('ProcessLateScratches', msevOperation);
   TimerOn(False);

   try
      btnDownloadTSNLSCClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      btnProcessLateChangesClick(sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      //ImportTSNForToday(Sender);
      ImportHDWForToday(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   try
      chkCreateHospitalReport.Checked := True;
      chkCreateValueReport.Checked := True;
      chkCreateTipReport.Checked := True;
      chkCreateWagerReport.Checked := False;
      chkCreateContestReport.Checked := False;
      chkFTPHospitalReport.Checked := False;
      chkFTPValueReport.Checked := False;
      chkFTPTipReport.Checked := False;

      chkCreateExportFiles.Checked := True;

      bCreateAll := False;
      btnCreateReportsClick(Sender);

      chkFTPHospitalReport.Checked := True;
      chkFTPValueReport.Checked := True;
      chkFTPTipReport.Checked := True;

      //btnFTPReportsClick(Sender);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   TimerOn(True);

end;

procedure TMainForm.btnProcessLateChangesClick(Sender: TObject);
begin
   TimerOn(False);
   ProcessTSNChanges(dm.tblRaces, dm.tblEntries);
   TimerOn(True);
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
   TimerOn(True);
   try
      if (chkCreatePreviousDaysResultTable.Checked) then begin
         TimerOn(False);
         edtOverrideDate.Date := edtOverrideDate.Date - 1;
         ClearRaceResults(dm.tblPrevDayRH);
         // ImportTSNResults(Sender, dm.tblPrevDayRH, dm.tblPrevDayHH);
         ImportHDWResults(Sender, dm.tblPrevDayRH, dm.tblPrevDayHH);
         UpdateMultiRaceResults(dm.tblPrevDayRH);
         ProcessPicksAndResults(dm.tblPrevDayRH, OVERRIDE_DATE_FALSE);
         TimerOn(True);
      end;

      if (chkCreatePrevious21DaysResultTable.Checked) then begin
         TimerOn(False);
         try
            edtOverrideDate.Date := edtOverrideDate.Date - PREV_WEEK_DAYS;
            repeat
               ClearRaceResults(dm.tblPrevWeekRH);
               ImportHDWResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
               // ImportTSNResults(Sender, dm.tblPrevWeekRH, dm.tblPrevWeekHH);
               UpdateMultiRaceResults(dm.tblPrevWeekRH);
               ProcessPicksAndResults(dm.tblPrevWeekRH, OVERRIDE_DATE_FALSE);
               edtOverrideDate.Date := edtOverrideDate.Date + 1;
            until (edtOverrideDate.Date > (Now() - 1));
         finally // wrap up
            edtOverrideDate.Date := Now();
         end;
         TimerOn(True);
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   TimerOn(False);
end;

procedure TMainForm.btnQueryPrevWeekFormClick(Sender: TObject);
begin
   try
      if not assigned(WagerQueryForm) then begin
         WagerQueryForm := TWagerQueryForm.Create(Application);
      end;
      WagerQueryForm.bPreviousDay := False;
      WagerQueryForm.ShowModal
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


end;

procedure TMainForm.btnResultsExportClick(Sender: TObject);
var
   sFileName: string;
begin
   //
   dm.tblPrevDayRH.Active := True;
   dm.tblPrevDayRH.First();
   sFileName := dm.tblPrevDayRH.FieldByName('RaceDate').AsString + '.xls';
   sFileName := FastReplace(sFileName, '/', '-', True);
   sFileName := 'd:\RatingsReports\Export\RH' + sFileName;
   csvOut.DataSet := dm.tblPrevDayRH;
   csvOut.SaveToFile(sFileName);
   dm.tblPrevDayRH.Active := False;

   //
   dm.tblPrevDayHH.Active := True;
   dm.tblPrevDayHH.First();
   sFileName := dm.tblPrevDayHH.FieldByName('RaceDate').AsString + '.xls';
   sFileName := FastReplace(sFileName, '/', '-', True);
   sFileName := 'd:\RatingsReports\Export\HH' + sFileName;
   csvOut.DataSet := dm.tblPrevDayHH;

   csvOut.SaveToFile(sFileName);
   dm.tblPrevDayHH.Active := False;

   FTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);

end;

procedure TMainForm.Button87Click(Sender: TObject);
begin
   DeleteFTPExport(FTP_EXPORT_DIR, EXPORT_REPORT_PATH, FTP_HOST, FTP_USERNAME, FTP_PASSWORD);

end;

procedure TMainForm.btnCreatePTCFileClick(Sender: TObject);
var
   sFileName: string;
begin
   //
   dm.tblEntries.Active := True;
   dm.tblEntries.First();
   sFileName := dm.tblEntries.FieldByName('RaceDate').AsString + '.csv';
   sFileName := FastReplace(sFileName, '/', '-', True);
   sFileName := 'd:\RatingsReports\PdfValueReport\E' + sFileName;
   dm.tblEntries.ExportTable(sFileName, ',', True);
   dm.tblEntries.Active := False;

   dm.tblRaces.Active := True;
   dm.tblRaces.First();
   sFileName := dm.tblRaces.FieldByName('RaceDate').AsString + '.csv';
   sFileName := FastReplace(sFileName, '/', '-', True);
   sFileName := 'd:\RatingsReports\PdfValueReport\R' + sFileName;
   dm.tblRaces.ExportTable(sFileName, ',', True);
   dm.tblRaces.Active := False;

end;

procedure TMainForm.ExportFiles(Sender: TObject);
var
   sFileName: string;
   sBaseFileName: string;
begin

   dm.tblEntries.Active := True;
   dm.tblEntries.First();
   sBaseFileName := dm.tblEntries.FieldByName('RaceDate').AsString + '.csv';
   sBaseFileName := FastReplace(sBaseFileName, '/', '-', True);
   sFileName := EXPORT_REPORT_PATH + 'E' + sBaseFileName;
   dm.tblEntries.ExportTable(sFileName, ',', True);
   dm.tblEntries.Active := False;

   dm.tblTrainerJockeySummary.Active := True;
   dm.tblTrainerJockeySummary.First();
   sFileName := EXPORT_REPORT_PATH + 'TJ' + sBaseFileName;
   dm.tblTrainerJockeySummary.ExportTable(sFileName, ',', True);
   dm.tblTrainerJockeySummary.Active := False;

   dm.tblTrainerOwnerSummary.Active := True;
   dm.tblTrainerOwnerSummary.First();
   sFileName := EXPORT_REPORT_PATH + 'TO' + sBaseFileName;
   dm.tblTrainerOwnerSummary.ExportTable(sFileName, ',', True);
   dm.tblTrainerOwnerSummary.Active := False;

   //   dm.tblTrainerSummary.Active := True;
   //   dm.tblTrainerSummary.First();
   //   sFileName := EXPORT_REPORT_PATH + 'TRNSUMM' + sBaseFileName;
   //   dm.tblTrainerSummary.ExportTable(sFileName, ',', True);
   //   dm.tblTrainerSummary.Active := False;
   //
   //   dm.tblTrainer.Active := True;
   //   dm.tblTrainer.First();
   //   sFileName := EXPORT_REPORT_PATH + 'TRN' + sBaseFileName;
   //   dm.tblTrainer.ExportTable(sFileName, ',', True);
   //   dm.tblTrainer.Active := False;
   //
   //   dm.tblJockeySummary.Active := True;
   //   dm.tblJockeySummary.First();
   //   sFileName := EXPORT_REPORT_PATH + 'JKYSUMM' + sBaseFileName;
   //   dm.tblJockeySummary.ExportTable(sFileName, ',', True);
   //   dm.tblJockeySummary.Active := False;
   //
   //   dm.tblJockey.Active := True;
   //   dm.tblJockey.First();
   //   sFileName := EXPORT_REPORT_PATH + 'JKY' + sBaseFileName;
   //   dm.tblJockey.ExportTable(sFileName, ',', True);
   //   dm.tblJockey.Active := False;
   //
   //   dm.tblTrainerCategory.Active := True;
   //   dm.tblTrainerCategory.First();
   //   sFileName := EXPORT_REPORT_PATH + 'TC' + sBaseFileName;
   //   dm.tblTrainerCategory.ExportTable(sFileName, ',', True);
   //   dm.tblTrainerCategory.Active := False;


   dm.tblRaces.Active := True;
   dm.tblRaces.First();
   sFileName := EXPORT_REPORT_PATH + 'R' + sBaseFileName;
   dm.tblRaces.ExportTable(sFileName, ',', True);
   dm.tblRaces.Active := False;

   dm.tblRankingStats.Active := True;
   dm.tblRankingStats.First();
   sFileName := EXPORT_REPORT_PATH + 'RANK' + '.csv';
   dm.tblRankingStats.ExportTable(sFileName, ',', True);
   dm.tblRankingStats.Active := False;

   dm.tblRankingStatsByTrk.Active := True;
   dm.tblRankingStatsByTrk.First();
   sFileName := EXPORT_REPORT_PATH + 'RANKBYTRK' + '.csv';
   dm.tblRankingStatsByTrk.ExportTable(sFileName, ',', True);
   dm.tblRankingStatsByTrk.Active := False;

   CreatePTCWagers(dm.tblRaces, dm.tblEntries, dm.tblPTCTrack, dm.tblPTCWager, pnlPrgBar, prgBar, staBar, BATCH_SIZE);

   dm.tblPTCWager.Active := True;
   dm.tblPTCWager.First();
   sFileName := EXPORT_REPORT_PATH + 'W' + sBaseFileName;
   dm.tblPTCWager.ExportTable(sFileName, ',', True);
   dm.tblPTCWager.Active := False;

   dm.tblPTCTrack.Active := True;
   dm.tblPTCTrack.First();
   sFileName := EXPORT_REPORT_PATH + 'T' + sBaseFileName;
   dm.tblPTCTrack.ExportTable(sFileName, ',', True);
   dm.tblPTCTrack.Active := False;


end;

procedure TMainForm.MadExceptionHandler1ExceptAction(action: TExceptAction;
   const exceptIntf: IMEException; var handled: Boolean);
begin
   handled := true;

end;

procedure TMainForm.MadExceptionHandler1Exception(
   const exceptIntf: IMEException; var handled: Boolean);
begin
   handled := true;
end;

initialization
   { Register the Html tags and attributes so the parser is able to correctly detect
     preformatted text, scrpts, and styles. }
   RegisterHtmlTags; RegisterHtmlAttribs;
   // RegisterSsiTags; RegisterSsiAttribs;
   { Also register the Html entities to convert to their character represenation.
     &amul; --> ä }
   RegisterHtmlDecodingEntities;
   { Register the HTML entities to convert to their character represenation:
     ä --> &auml;. }
   RegisterHtmlEncodingEntities;
   { Register the character sets for automatic adjustment by the DIHtmlCharSetPlugin. }
   RegisterCharSets;


end.

