unit FormTrainerConnections;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
   cxDataStorage, cxEdit, DB, cxDBData, cxCalc, dbisamtb, cxGridLevel,
   cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
   cxControls, cxGridCustomView, cxGrid, cxGridCardView, cxGridDBCardView,
   dxExEdtr, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL, cxVGrid, cxDBVGrid,
   cxInplaceContainer, cxPC;

type
   TTrainerConnectionsForm = class(TForm)
      tblTrainers: TDBISAMTable;
      dsTrainerOwnerSummary: TDataSource;
      tblTrainerOwnerSummary: TDBISAMTable;
      dsTrainers: TDataSource;
      dbTrainerConnections: TDBISAMDatabase;
      tblOwners: TDBISAMTable;
      dsOwner: TDataSource;
      cxPageControl1: TcxPageControl;
      cxTabSheet1: TcxTabSheet;
      cxTabSheet2: TcxTabSheet;
      cxGrid1: TcxGrid;
      tvTrainers: TcxGridDBTableView;
      tvTrainersTrainer: TcxGridDBColumn;
      cxGrid1DBTableView1: TcxGridDBTableView;
      cxGrid1DBTableView1Owner: TcxGridDBColumn;
      cxGrid1DBTableView1ActualOwnerName: TcxGridDBColumn;
      cxGrid1DBTableView1IsSuperOwner: TcxGridDBColumn;
      cxGrid1DBTableView1WinsThisYearRank: TcxGridDBColumn;
      cxGrid1DBTableView1WinsLastYearRank: TcxGridDBColumn;
      cxGrid1DBTableView1EarningsThisYearRank: TcxGridDBColumn;
      cxGrid1DBTableView1EarningsLastYearRank: TcxGridDBColumn;
      lvTrainers: TcxGridLevel;
      cxGrid2: TcxGrid;
      tvGeneral: TcxGridDBTableView;
      tvGeneralOwner: TcxGridDBColumn;
      tvGeneralActualOwnerName: TcxGridDBColumn;
      tvGeneralStarts: TcxGridDBColumn;
      tvGeneralWins: TcxGridDBColumn;
      tvGeneralWinPct: TcxGridDBColumn;
      tvGeneralMinWinOdds: TcxGridDBColumn;
      tvGeneralMaxWinOdds: TcxGridDBColumn;
      tvGeneralAvgWinOdds: TcxGridDBColumn;
      lvGeneral: TcxGridLevel;
      cxGrid3: TcxGrid;
      cxGridLevel1: TcxGridLevel;
      cxGrid3DBTableView1: TcxGridDBTableView;
      cxGrid3DBTableView1Owner: TcxGridDBColumn;
      cxGrid3DBTableView1ActualOwnerName: TcxGridDBColumn;
      cxGrid3DBTableView1IsSuperOwner: TcxGridDBColumn;
      cxGrid3DBTableView1WinsThisYearRank: TcxGridDBColumn;
      cxGrid3DBTableView1WinsLastYearRank: TcxGridDBColumn;
      cxGrid3DBTableView1EarningsThisYearRank: TcxGridDBColumn;
      cxGrid3DBTableView1EarningsLastYearRank: TcxGridDBColumn;
      cxGrid4: TcxGrid;
      cxGridLevel2: TcxGridLevel;
      cxGrid4DBTableView1: TcxGridDBTableView;
      cxGrid3DBTableView1Owner1: TcxGridDBColumn;
      cxGrid3DBTableView1IsSuperOwner1: TcxGridDBColumn;
      cxGrid3DBTableView1WinsThisYearRank1: TcxGridDBColumn;
      cxGrid3DBTableView1WinsLastYearRank1: TcxGridDBColumn;
      cxGrid3DBTableView1EarningsThisYearRank1: TcxGridDBColumn;
      cxGrid3DBTableView1EarningsLastYearRank1: TcxGridDBColumn;
      cxGrid4DBTableView1Owner: TcxGridDBColumn;
      cxGrid4DBTableView1TrnEquibaseKey: TcxGridDBColumn;
      cxGrid4DBTableView1ActualOwnerName: TcxGridDBColumn;
      cxGrid4DBTableView1Starts: TcxGridDBColumn;
      cxGrid4DBTableView1Wins: TcxGridDBColumn;
      cxGrid4DBTableView1WinPct: TcxGridDBColumn;
      cxGrid4DBTableView1TotalOdds: TcxGridDBColumn;
      cxGrid4DBTableView1AvgWinOdds: TcxGridDBColumn;
      cxGrid4DBTableView1MinWinOdds: TcxGridDBColumn;
      cxGrid4DBTableView1MaxWinOdds: TcxGridDBColumn;
      cxGrid4DBTableView1Rating: TcxGridDBColumn;
      cxGrid4DBTableView1Roi: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   TrainerConnectionsForm: TTrainerConnectionsForm;

implementation

{$R *.dfm}

procedure TTrainerConnectionsForm.FormCreate(Sender: TObject);
begin
   tblTrainers.Active := True;
   tblTrainerOwnerSummary.Active := True;
   tblOwners.Active := True;
end;

procedure TTrainerConnectionsForm.FormDestroy(Sender: TObject);
begin
   tblTrainers.Active := False;
   tblTrainerOwnerSummary.Active := False;
   tblOwners.Active := False;

end;

end.
