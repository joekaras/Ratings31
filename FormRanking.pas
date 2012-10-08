unit FormRanking;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms,
   Dialogs, DB, DBISAMTb, cxStyles, cxCustomData, cxGraphics, cxFilter,
   cxData, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
   cxGrid, StdCtrls, ExtCtrls, cxGridCustomPopupMenu, cxGridPopupMenu,
   cxGridCardView, cxGridDBCardView, cxGridBandedTableView,
   cxGridDBBandedTableView, cxLookAndFeels, Controls, cxDataStorage,
   cxCurrencyEdit, cxMaskEdit, cxTL;

type
   TRankingForm = class(TForm)
      tblRankingStats: TDBISAMTable;
      dsRankingStats: TDataSource;
      tblRankingStatsByTrk: TDBISAMTable;
      dsRankingStatsByTrk: TDataSource;
      cxGridRankings: TcxGrid;
      tvRankingStats: TcxGridDBTableView;
      tvRankingStatsByTrk: TcxGridDBTableView;
      lvRankingStats: TcxGridLevel;
      lvRankingStatsByTrk: TcxGridLevel;
      dbRanking: TDBISAMDatabase;
      tvRankingStatsByTrkTrkCode: TcxGridDBColumn;
      tvRankingStatsByTrkName: TcxGridDBColumn;
      tvRankingStatsByTrkRank: TcxGridDBColumn;
      tvRankingStatsByTrkStarts: TcxGridDBColumn;
      tvRankingStatsByTrkWinPct: TcxGridDBColumn;
      tvRankingStatsByTrkPlcPct: TcxGridDBColumn;
      tvRankingStatsByTrkShoPct: TcxGridDBColumn;
      tvRankingStatsByTrkAvgOdds: TcxGridDBColumn;
      tvRankingStatsByTrkAvgWinOdds: TcxGridDBColumn;
      tvRankingStatsByTrkValueBet: TcxGridDBColumn;
      tvRankingStatsByTrkBEWinPct: TcxGridDBColumn;
      tvRankingStatsByTrkFP1: TcxGridDBColumn;
      tvRankingStatsByTrkFP2: TcxGridDBColumn;
      tvRankingStatsByTrkFP3: TcxGridDBColumn;
      tvRankingStatsByTrkFP4: TcxGridDBColumn;
      tvRankingStatsByTrkFP5: TcxGridDBColumn;
      tvRankingStatsByTrkFP6: TcxGridDBColumn;
      tvRankingStatsByTrkFP7: TcxGridDBColumn;
      tvRankingStatsByTrkFP8: TcxGridDBColumn;
      tvRankingStatsByTrkFP9: TcxGridDBColumn;
      tvRankingStatsByTrkFP10: TcxGridDBColumn;
      tvRankingStatsByTrkFP11: TcxGridDBColumn;
      tvRankingStatsByTrkFP12: TcxGridDBColumn;
      tvRankingStatsByTrkFP13: TcxGridDBColumn;
      tvRankingStatsByTrkFP14: TcxGridDBColumn;
      tvRankingStatsByTrkFP15: TcxGridDBColumn;
      tvRankingStatsByTrkFP16: TcxGridDBColumn;
      tvRankingStatsByTrkFP17: TcxGridDBColumn;
      tvRankingStatsByTrkFP18: TcxGridDBColumn;
      tvRankingStatsByTrkFP19: TcxGridDBColumn;
      tvRankingStatsByTrkFP20: TcxGridDBColumn;
      tvRankingStatsByTrkTO1: TcxGridDBColumn;
      tvRankingStatsByTrkTO2: TcxGridDBColumn;
      tvRankingStatsByTrkTO3: TcxGridDBColumn;
      tvRankingStatsByTrkTO4: TcxGridDBColumn;
      tvRankingStatsByTrkTO5: TcxGridDBColumn;
      tvRankingStatsByTrkTO6: TcxGridDBColumn;
      tvRankingStatsByTrkTO7: TcxGridDBColumn;
      tvRankingStatsByTrkTO8: TcxGridDBColumn;
      tvRankingStatsByTrkTO9: TcxGridDBColumn;
      tvRankingStatsByTrkTO10: TcxGridDBColumn;
      tvRankingStatsByTrkTO11: TcxGridDBColumn;
      tvRankingStatsByTrkTO12: TcxGridDBColumn;
      tvRankingStatsByTrkTO13: TcxGridDBColumn;
      tvRankingStatsByTrkTO14: TcxGridDBColumn;
      tvRankingStatsByTrkTO15: TcxGridDBColumn;
      tvRankingStatsByTrkTO16: TcxGridDBColumn;
      tvRankingStatsByTrkTO17: TcxGridDBColumn;
      tvRankingStatsByTrkTO18: TcxGridDBColumn;
      tvRankingStatsByTrkTO19: TcxGridDBColumn;
      tvRankingStatsByTrkTO20: TcxGridDBColumn;
      tvRankingStatsByTrkType: TcxGridDBColumn;
      tvRankingStatsByTrkIVRunners: TcxGridDBColumn;
      tvRankingStatsByTrkIVWinners: TcxGridDBColumn;
      tvRankingStatsByTrkIVGroupWinnersPct: TcxGridDBColumn;
      tvRankingStatsByTrkIVRunnersAllRaces: TcxGridDBColumn;
      tvRankingStatsByTrkIVWinnersAllRaces: TcxGridDBColumn;
      tvRankingStatsByTrkIVGroupRunnersPct: TcxGridDBColumn;
      tvRankingStatsByTrkIV: TcxGridDBColumn;
      tvRankingStatsByTrkTotalOdds: TcxGridDBColumn;
      tvRankingStatsByTrkTotalWinOdds: TcxGridDBColumn;
      tvRankingStatsByTrkWins: TcxGridDBColumn;
      tvRankingStatsByTrkWinsPlcs: TcxGridDBColumn;
      tvRankingStatsByTrkWinsPlcsShos: TcxGridDBColumn;
      tvRankingStatsByTrkMinWinOdds: TcxGridDBColumn;
      tvRankingStatsByTrkMaxWinOdds: TcxGridDBColumn;
      tvRankingStatsByTrkMinOdds: TcxGridDBColumn;
      tvRankingStatsByTrkMaxOdds: TcxGridDBColumn;
      tvRankingStatsByTrkIVRoi: TcxGridDBColumn;
      tvRankingStatsByTrkAvgWinOddsWinPct: TcxGridDBColumn;
      tvRankingStatsName: TcxGridDBColumn;
      tvRankingStatsRank: TcxGridDBColumn;
      tvRankingStatsStarts: TcxGridDBColumn;
      tvRankingStatsWinPct: TcxGridDBColumn;
      tvRankingStatsPlcPct: TcxGridDBColumn;
      tvRankingStatsShoPct: TcxGridDBColumn;
      tvRankingStatsAvgOdds: TcxGridDBColumn;
      tvRankingStatsAvgWinOdds: TcxGridDBColumn;
      tvRankingStatsValueBet: TcxGridDBColumn;
      tvRankingStatsBEWinPct: TcxGridDBColumn;
      tvRankingStatsFP1: TcxGridDBColumn;
      tvRankingStatsFP2: TcxGridDBColumn;
      tvRankingStatsFP3: TcxGridDBColumn;
      tvRankingStatsFP4: TcxGridDBColumn;
      tvRankingStatsFP5: TcxGridDBColumn;
      tvRankingStatsFP6: TcxGridDBColumn;
      tvRankingStatsFP7: TcxGridDBColumn;
      tvRankingStatsFP8: TcxGridDBColumn;
      tvRankingStatsFP9: TcxGridDBColumn;
      tvRankingStatsFP10: TcxGridDBColumn;
      tvRankingStatsFP11: TcxGridDBColumn;
      tvRankingStatsFP12: TcxGridDBColumn;
      tvRankingStatsFP13: TcxGridDBColumn;
      tvRankingStatsFP14: TcxGridDBColumn;
      tvRankingStatsFP15: TcxGridDBColumn;
      tvRankingStatsFP16: TcxGridDBColumn;
      tvRankingStatsFP17: TcxGridDBColumn;
      tvRankingStatsFP18: TcxGridDBColumn;
      tvRankingStatsFP19: TcxGridDBColumn;
      tvRankingStatsFP20: TcxGridDBColumn;
      tvRankingStatsTO1: TcxGridDBColumn;
      tvRankingStatsTO2: TcxGridDBColumn;
      tvRankingStatsTO3: TcxGridDBColumn;
      tvRankingStatsTO4: TcxGridDBColumn;
      tvRankingStatsTO5: TcxGridDBColumn;
      tvRankingStatsTO6: TcxGridDBColumn;
      tvRankingStatsTO7: TcxGridDBColumn;
      tvRankingStatsTO8: TcxGridDBColumn;
      tvRankingStatsTO9: TcxGridDBColumn;
      tvRankingStatsTO10: TcxGridDBColumn;
      tvRankingStatsTO11: TcxGridDBColumn;
      tvRankingStatsTO12: TcxGridDBColumn;
      tvRankingStatsTO13: TcxGridDBColumn;
      tvRankingStatsTO14: TcxGridDBColumn;
      tvRankingStatsTO15: TcxGridDBColumn;
      tvRankingStatsTO16: TcxGridDBColumn;
      tvRankingStatsTO17: TcxGridDBColumn;
      tvRankingStatsTO18: TcxGridDBColumn;
      tvRankingStatsTO19: TcxGridDBColumn;
      tvRankingStatsTO20: TcxGridDBColumn;
      tvRankingStatsType: TcxGridDBColumn;
      tvRankingStatsTotalOdds: TcxGridDBColumn;
      tvRankingStatsTotalWinOdds: TcxGridDBColumn;
      tvRankingStatsIVRunners: TcxGridDBColumn;
      tvRankingStatsIVWinners: TcxGridDBColumn;
      tvRankingStatsIVGroupWinnersPct: TcxGridDBColumn;
      tvRankingStatsIVRunnersAllRaces: TcxGridDBColumn;
      tvRankingStatsIVWinnersAllRaces: TcxGridDBColumn;
      tvRankingStatsIVGroupRunnersPct: TcxGridDBColumn;
      tvRankingStatsIV: TcxGridDBColumn;
      tvRankingStatsWins: TcxGridDBColumn;
      tvRankingStatsWinsPlcs: TcxGridDBColumn;
      tvRankingStatsWinsPlcsShos: TcxGridDBColumn;
      tvRankingStatsMinWinOdds: TcxGridDBColumn;
      tvRankingStatsMaxWinOdds: TcxGridDBColumn;
      tvRankingStatsMinOdds: TcxGridDBColumn;
      tvRankingStatsMaxOdds: TcxGridDBColumn;
      tvRankingStatsIVRoi: TcxGridDBColumn;
      tvRankingStatsAvgWinOddsWinPct: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   RankingForm: TRankingForm;

implementation

uses UnitCommonCode, DatRatings, FormMain;

{$R *.dfm}

procedure TRankingForm.FormCreate(Sender: TObject);
begin

   //  tblRankingStats.Active := True;
   //  tblRankingStatsByTrk.Active := True;
   //  tblRankingStatsByRaceType.Active := True;
   //  tblRankingStatsBySurface.Active := True;

end;

procedure TRankingForm.FormDestroy(Sender: TObject);
begin

   //   tblRankingStats.Active := False;
   //   tblRankingStatsByTrk.Active := False;
   //   tblRankingStatsByRaceType.Active := False;
   //   tblRankingStatsBySurface.Active := False;

end;

procedure TRankingForm.FormShow(Sender: TObject);
begin

   tblRankingStats.Active := True;
   tblRankingStatsByTrk.Active := True;
   //  tblRankingStatsByRaceType.Active := True;
   //  tblRankingStatsBySurface.Active := True;

end;

procedure TRankingForm.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin

   tblRankingStats.Active := False;
   tblRankingStatsByTrk.Active := False;
   //  tblRankingStatsByRaceType.Active := False;
   //  tblRankingStatsBySurface.Active := False;

end;

end.
