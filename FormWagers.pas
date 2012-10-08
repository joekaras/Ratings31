unit FormWagers;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
   DB, cxDBData, cxNavigator, DBISAMTb, cxLookAndFeels,
   cxGridBandedTableView, cxGridCardView, cxGridTableView,
   cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel,
   cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
   cxGridCustomView, cxGrid, dxDockControl, dxDockPanel, cxDataStorage,
   cxCurrencyEdit;

type
   TWagersForm = class(TForm)
      tblWagers: TDBISAMTable;
      dsWagers: TDataSource;
      tblBank: TDBISAMTable;
      dsBank: TDataSource;
      cxBank: TcxGrid;
      dbWagers: TDBISAMDatabase;
      lvBank: TcxGridLevel;
      tvBank: TcxGridDBTableView;
      cxWagers: TcxGrid;
      lvWagers: TcxGridLevel;
      tvWagers: TcxGridDBTableView;
      tblHH: TDBISAMTable;
      dsHH: TDataSource;
      tvWagersTrkCode: TcxGridDBColumn;
      tvWagersRaceDate: TcxGridDBColumn;
      tvWagersRaceNbr: TcxGridDBColumn;
      tvWagersPostPos: TcxGridDBColumn;
      tvWagersEstTimeOfRace: TcxGridDBColumn;
      tvWagersFinishPos: TcxGridDBColumn;
      tvWagersOdds: TcxGridDBColumn;
      tvWagersRefund: TcxGridDBColumn;
      tvWagersPayout: TcxGridDBColumn;
      tvWagersScratched: TcxGridDBColumn;
      tvWagersMissed: TcxGridDBColumn;
      tvWagersStartBank: TcxGridDBColumn;
      tvWagersEdge: TcxGridDBColumn;
      tvWagersHalfKelly: TcxGridDBColumn;
      tvWagersMaxEdge: TcxGridDBColumn;
      tvWagersWagerAmt: TcxGridDBColumn;
      tvWagersEndBank: TcxGridDBColumn;
      tvBankWagerType: TcxGridDBColumn;
      tvBankWagerDate: TcxGridDBColumn;
      tvBankStartBank: TcxGridDBColumn;
      tvBankWagerAmt: TcxGridDBColumn;
      tvBankWagerRefund: TcxGridDBColumn;
      tvBankWagerPayout: TcxGridDBColumn;
      tvBankWagerPL: TcxGridDBColumn;
      tvBankEndBank: TcxGridDBColumn;
      tvBankWagerBets: TcxGridDBColumn;
      tvBankWagerBetsMissed: TcxGridDBColumn;
      tvBankWagerWins: TcxGridDBColumn;
      tvBankWagerScratches: TcxGridDBColumn;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   WagersForm: TWagersForm;

implementation

uses DatRatings, FormMain;

{$R *.dfm}

procedure TWagersForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   tblBank.Active := False;
   tblWagers.Active := False;

end;

procedure TWagersForm.FormShow(Sender: TObject);
begin

   tblBank.Active := True;
   tblWagers.Active := True;

end;

end.
