unit FormFinalOrder;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
   DB, cxDBData, cxLookAndFeels, cxGridBandedTableView, cxGridCardView,
   cxGridTableView, cxGridCustomPopupMenu, cxGridPopupMenu, DBISAMTb,
   cxGridLevel, cxGridDBCardView, cxGridDBBandedTableView,
   cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
   cxGridCustomView, cxGrid, cxNavigator, cxFilterControl, cxDataStorage,
   cxCurrencyEdit, StdCtrls, ExtCtrls;

type
   TFinalOrderForm = class(TForm)
      cxGridRankings: TcxGrid;
      qryPrimaryKey: TDBISAMQuery;
      dsPrimaryKey: TDataSource;
      lvPrimaryKey: TcxGridLevel;
      tvPrimaryKey: TcxGridDBTableView;
      dbFinalOrder: TDBISAMDatabase;
      tvPrimaryKeyOrderKey: TcxGridDBColumn;
      tvPrimaryKeyBaseKey: TcxGridDBColumn;
      tvPrimaryKeyTrkKey: TcxGridDBColumn;
      tvPrimaryKeyStarts: TcxGridDBColumn;
      tvPrimaryKeyWins: TcxGridDBColumn;
      tvPrimaryKeyWinPct: TcxGridDBColumn;
      tvPrimaryKeyAvgOdds: TcxGridDBColumn;
      tvPrimaryKeyAvgWinOdds: TcxGridDBColumn;
      tvPrimaryKeyMinOdds: TcxGridDBColumn;
      tvPrimaryKeyMaxOdds: TcxGridDBColumn;
      tvPrimaryKeyTotalWagered: TcxGridDBColumn;
      tvPrimaryKeyTotalWon: TcxGridDBColumn;
      tvPrimaryKeyTotalProfitLoss: TcxGridDBColumn;
      tvPrimaryKeyTotalProfitLossPct: TcxGridDBColumn;
      tvPrimaryKeyValueBet: TcxGridDBColumn;
      tvPrimaryKeyTotalWinOdds: TcxGridDBColumn;
      tvPrimaryKeyTotalOdds: TcxGridDBColumn;
      tvPrimaryKeyMinWinOdds: TcxGridDBColumn;
      tvPrimaryKeyMaxWinOdds: TcxGridDBColumn;
      Panel1: TPanel;
      Button1: TButton;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure Button1Click(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FinalOrderForm: TFinalOrderForm;

implementation

uses DatRatings, UnitCommonCode;

{$R *.dfm}

procedure TFinalOrderForm.FormCreate(Sender: TObject);
begin
   with dbFinalOrder do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;
   qryPrimaryKey.Prepare;
   qryPrimaryKey.Open;
end;

procedure TFinalOrderForm.FormDestroy(Sender: TObject);
begin
   qryPrimaryKey.Close;
   qryPrimaryKey.UnPrepare;
   with dbFinalOrder do begin
      Close;
   end;
end;

procedure TFinalOrderForm.Button1Click(Sender: TObject);
begin
   qryPrimaryKey.Close;
   qryPrimaryKey.UnPrepare;

   qryPrimaryKey.sQL.Clear();

   qryPrimaryKey.sQL.Add(' SELECT * ');
   qryPrimaryKey.sQL.Add(' FROM     ');
   qryPrimaryKey.sQL.Add(' FinalOrder');
   qryPrimaryKey.sQL.Add(' INNER JOIN Track ON (FinalOrder.TrkKey = Track.TrkCode)');
   qryPrimaryKey.sQL.Add(' WHERE ');
   //  qryPrimaryKey.sQL.Add(' Track.IsYouBetTrack = True AND');
   qryPrimaryKey.sQL.Add(' (');
   qryPrimaryKey.sQL.Add(' FinalOrder.BaseKey = ');
   qryPrimaryKey.sQL.Add(QuotedStr('FinalKey'));


   qryPrimaryKey.sQL.Add(' ');
   qryPrimaryKey.sQL.Add(')');
   qryPrimaryKey.sQL.SaveToFile('d:\test.sql');

   qryPrimaryKey.Prepare;
   qryPrimaryKey.Open;

end;

end.
