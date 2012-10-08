unit FormQuery;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, dbisamtb, kdbinfo, dbisaminf, KRFldPnl, ExtCtrls, kstdspnl,
   kdbstruc, kqrybase, kqfbase, StdCtrls, kqrycomb, KFltprov, kquerpnl,
   kdsstruc, ComCtrls, ppDB, ppDBPipe, ppParameter, ppModule, raCodMod,
   ppBands, ppVar, ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv,
   ppProd, ppReport, ppViewr, cxControls, cxContainer, cxEdit, cxTextEdit,
   cxMemo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
   cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
   Buttons, QBWindow, QBDbiWindow, dxBar, dxBarExtItems, cxMaskEdit,
   cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,
   dxStatusBar, cxVGrid, cxDBVGrid, cxInplaceContainer, cxSSheet,
   cxGridChartView, cxGridDBChartView, cxGridCardView, cxGridDBCardView,
   cxGridBandedTableView, cxGridDBBandedTableView, cxPC;

type
   TQueryForm = class(TForm)
      ElevateDBInfo: TDBISAMDBInfo;
      dbQuery: TDBISAMDatabase;
      KQueryPanel1: TKQueryPanel;
      KDBStructureElevateDB: TKDBStructure;
      ppQueryReport: TppReport;
      ppParameterList1: TppParameterList;
      plQuery: TppDBPipeline;
      ppHeaderBand1: TppHeaderBand;
      ppShape1: TppShape;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel11: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppLabel10: TppLabel;
      ppLabel12: TppLabel;
      ppLabel19: TppLabel;
      ppLabel18: TppLabel;
      ppLabel1: TppLabel;
      lblReportTitle: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      varStartDate: TppLabel;
      varEndDate: TppLabel;
      DetailBand: TppDetailBand;
      ppShape2: TppShape;
      dbRaceNbr: TppDBText;
      dbHorseName: TppDBText;
      dbTrkCode: TppDBText;
      dbProgramNbr: TppDBText;
      dbFinishPos: TppDBText;
      MorningLineDesc: TppDBText;
      dbExactaPayout: TppDBText;
      FinishNbrs: TppDBText;
      dbTrifectaPayout: TppDBText;
      dbQuinellaPayout: TppDBText;
      ppLine1: TppLine;
      ppLine3: TppLine;
      ppLine4: TppLine;
      ppLine5: TppLine;
      ppLine6: TppLine;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLine9: TppLine;
      DailyDoublePayoutLastRace: TppDBText;
      Pick4PayoutLastRace: TppDBText;
      ppLine11: TppLine;
      ppLine12: TppLine;
      dbSuperfectaPayout: TppDBText;
      ppLine13: TppLine;
      dbWinPayout: TppDBText;
      dbSheetOrder: TppDBText;
      ppLine2: TppLine;
      dbWinNbrs: TppDBText;
      dbWinPlcPayout: TppDBText;
      dbWinShoPayout: TppDBText;
      Pick3PayoutLastRace: TppDBText;
      DDLastRace: TppDBText;
      Pick3LastRace: TppDBText;
      Pick4LastRace: TppDBText;
      DailyDoubleNbrsLastRace: TppDBText;
      Pick3NbrsLastRace: TppDBText;
      Pick4NbrsLastRace: TppDBText;
      dbPlcNbrs: TppDBText;
      dbShoNbrs: TppDBText;
      dbPlcPayout: TppDBText;
      dbPlcShoPayout: TppDBText;
      dbShoPayout: TppDBText;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      Pace: TppDBText;
      lblErlPos: TppLabel;
      MidPace: TppDBText;
      lblMidPos: TppLabel;
      lblLatePos: TppLabel;
      ppDBText13: TppDBText;
      WagerAmt: TppDBText;
      detailWinWagered: TppVariable;
      detailWinPayout: TppVariable;
      detailPlcPayout: TppVariable;
      detailShoPayout: TppVariable;
      Super: TppDBText;
      Tri: TppDBText;
      Exacta: TppDBText;
      Quinella: TppDBText;
      SuperfectaNbrs: TppDBText;
      TrifectaNbrs: TppDBText;
      ExactaNbrs: TppDBText;
      QuinellaNbrs: TppDBText;
      ppLine10: TppLine;
      ppLine14: TppLine;
      EstTimeOfRace: TppDBText;
      TriWagerAmt: TppDBText;
      QuiWagerAmt: TppDBText;
      Pk3WagerAmt: TppDBText;
      ExaWagerAmt: TppDBText;
      SfcWagerAmt: TppDBText;
      Pk4WagerAmt: TppDBText;
      DDWagerAmt: TppDBText;
      PlcWagerAmt: TppDBText;
      ShoWagerAmt: TppDBText;
      ppDBText4: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      imgPk4: TppShape;
      imgTri: TppShape;
      imgSfc: TppShape;
      ppShape4: TppShape;
      ppShape3: TppShape;
      imgWin: TppShape;
      ppVarTotalWins: TppVariable;
      ppVarTotalStarts: TppVariable;
      ppVarTotalPlcs: TppVariable;
      lblStarts: TppLabel;
      lblWins: TppLabel;
      ppLabel20: TppLabel;
      ppVarTotalWinPct: TppVariable;
      ppLabel21: TppLabel;
      ppLabel22: TppLabel;
      ppVarAvgOdds: TppVariable;
      ppVarTotalOdds: TppVariable;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      varWinWagered: TppVariable;
      ppVariable2: TppVariable;
      ppVariable3: TppVariable;
      ppVariable4: TppVariable;
      ppLabel27: TppLabel;
      imgPlc: TppShape;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      varPlcWagered: TppVariable;
      ppVariable6: TppVariable;
      ppVariable7: TppVariable;
      lblSfcWagered: TppLabel;
      lblSfcPayout: TppLabel;
      lblSfcPL: TppLabel;
      varSfcPL: TppVariable;
      varSfcPayout: TppVariable;
      varSfcWagered: TppVariable;
      lblTriWagered: TppLabel;
      lblTriPayout: TppLabel;
      lblTriPL: TppLabel;
      varTriPL: TppVariable;
      varTriPayout: TppVariable;
      varTriWagered: TppVariable;
      imgExa: TppShape;
      imgQui: TppShape;
      lblQuiWagered: TppLabel;
      lblQuiPayout: TppLabel;
      lblQuiPL: TppLabel;
      varQuiPL: TppVariable;
      varQuiPayout: TppVariable;
      varQuiWagered: TppVariable;
      lblExaWagered: TppLabel;
      lblExaPayout: TppLabel;
      lblExaPL: TppLabel;
      varExaPL: TppVariable;
      varExaPayout: TppVariable;
      varExaWagered: TppVariable;
      imgDD: TppShape;
      lblDDWagered: TppLabel;
      lblDDPayout: TppLabel;
      lblDDPL: TppLabel;
      varDDPL: TppVariable;
      varDDPayout: TppVariable;
      varDDWagered: TppVariable;
      imgSho: TppShape;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      varShoWagered: TppVariable;
      varShoWon: TppVariable;
      ppVariable25: TppVariable;
      imgPk3: TppShape;
      lblPk3Wagered: TppLabel;
      lblPk3Payout: TppLabel;
      lblPk3PL: TppLabel;
      varPk3PL: TppVariable;
      varPk3Payout: TppVariable;
      varPk3Wagered: TppVariable;
      lblPk4Wagered: TppLabel;
      lblPk4Payout: TppLabel;
      lblPk4PL: TppLabel;
      varPk4PL: TppVariable;
      varPk4Payout: TppVariable;
      varPk4Wagered: TppVariable;
      lblFilter: TppLabel;
      ppLabel17: TppLabel;
      vWPSPL: TppVariable;
      vTriSfcPL: TppVariable;
      lblTriSfcPL: TppLabel;
      lblExaQuiPL: TppLabel;
      lblDDPk3PL: TppLabel;
      vExaQuiPL: TppVariable;
      vDDPk3PL: TppVariable;
      lblPk4Pk6PL: TppLabel;
      vPk4Pk6PL: TppVariable;
      ppLabel33: TppLabel;
      varPLPct: TppVariable;
      ppVariable8: TppVariable;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      ppVariable9: TppVariable;
      ppLabel36: TppLabel;
      ppVariable10: TppVariable;
      ppLabel37: TppLabel;
      ppVariable11: TppVariable;
      ppLabel38: TppLabel;
      ppVariable12: TppVariable;
      ppLabel39: TppLabel;
      ppVariable13: TppVariable;
      ppLabel40: TppLabel;
      ppVariable14: TppVariable;
      ppLabel41: TppLabel;
      ppVariable15: TppVariable;
      ppLabel42: TppLabel;
      ppVariable16: TppVariable;
      ppLabel44: TppLabel;
      varTotalPL: TppVariable;
      raCodeModule1: TraCodeModule;
      memSQL: TcxMemo;
      cxGrid1DBTableView1: TcxGridDBTableView;
      cxGrid1: TcxGrid;
      procedure FormCreate(Sender: TObject);
      procedure btnBuildSQLClick(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   QueryForm: TQueryForm;

implementation

{$R *.dfm}

procedure TQueryForm.FormCreate(Sender: TObject);
begin
   KQueryPanel1.Activate;

end;

procedure TQueryForm.btnBuildSQLClick(Sender: TObject);
begin
   KQueryPanel1.BuildQuery;
   //  Query1.Close;
   memSQL.Lines := KQueryPanel1.QResult.SQL;
   //   Query1.Open;
   //         ppQueryReport.Print;
end;

end.
