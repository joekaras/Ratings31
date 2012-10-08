unit FormConnection;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxGridLevel, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
   DBISAMTb, DB, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
   cxDataStorage, cxEdit, cxDBData, cxCheckBox;

type
   TConnectionForm = class(TForm)
      tblOwner: TDBISAMTable;
      dsOwner: TDataSource;
      tblTrainer: TDBISAMTable;
      tblJockey: TDBISAMTable;
      dsTrainer: TDataSource;
      dsJockey: TDataSource;
      dsXFEROwner: TDataSource;
      tblXFEROwner: TDBISAMTable;
      cxConnection: TcxGrid;
      tvOwner: TcxGridDBTableView;
      tvOwnerOwner: TcxGridDBColumn;
      tvOwnerActualOwnerName: TcxGridDBColumn;
      tvOwnerIsSuperOwner: TcxGridDBColumn;
      tvOwnerWinsThisYearRank: TcxGridDBColumn;
      tvOwnerWinsLastYearRank: TcxGridDBColumn;
      tvOwnerEarningsThisYearRank: TcxGridDBColumn;
      tvOwnerEarningsLastYearRank: TcxGridDBColumn;
      tvTrainer: TcxGridDBTableView;
      tvTrainerTrainer: TcxGridDBColumn;
      tvTrainerIsSuperTrainer: TcxGridDBColumn;
      tvTrainerTrnEquibaseKey: TcxGridDBColumn;
      tvTrainerWinsThisYearRank: TcxGridDBColumn;
      tvTrainerWinsLastYearRank: TcxGridDBColumn;
      tvTrainerEarningsThisYearRank: TcxGridDBColumn;
      tvTrainerEarningsLastYearRank: TcxGridDBColumn;
      tvJockey: TcxGridDBTableView;
      tvJockeyJockey: TcxGridDBColumn;
      tvJockeyIsSuperJockey: TcxGridDBColumn;
      tvJockeyJkyEquibaseKey: TcxGridDBColumn;
      tvJockeyWinsThisYearRank: TcxGridDBColumn;
      tvJockeyWinsLastYearRank: TcxGridDBColumn;
      tvJockeyEarningsThisYearRank: TcxGridDBColumn;
      tvJockeyEarningsLastYearRank: TcxGridDBColumn;
      tvOwnerXFER: TcxGridDBTableView;
      lvOwner: TcxGridLevel;
      lvTrainer: TcxGridLevel;
      lvJockey: TcxGridLevel;
      lvOwnerXFER: TcxGridLevel;
      tvOwnerXFEROwner: TcxGridDBColumn;
      tvOwnerXFERActualOwnerName: TcxGridDBColumn;
      dbConnections: TDBISAMDatabase;
      tblTrainerOwnerSummary: TDBISAMTable;
      dsTrainerOwnerSummary: TDataSource;
      lvTrainerOwner: TcxGridLevel;
      tvTrainerOwner: TcxGridDBTableView;
      tblTrainerCategory: TDBISAMTable;
      dsTrainerCateory: TDataSource;
      cxConnectionLevel1: TcxGridLevel;
      cxConnectionDBTableView1: TcxGridDBTableView;
      cxConnectionDBTableView1Trainer: TcxGridDBColumn;
      cxConnectionDBTableView1Category: TcxGridDBColumn;
      cxConnectionDBTableView1Starts: TcxGridDBColumn;
      cxConnectionDBTableView1WinPct: TcxGridDBColumn;
      cxConnectionDBTableView1ITMPct: TcxGridDBColumn;
      cxConnectionDBTableView1ROI: TcxGridDBColumn;
      tblSire: TDBISAMTable;
      dsSire: TDataSource;
      csSire: TcxGridLevel;
      tvSire: TcxGridDBTableView;
      tvSireSireName: TcxGridDBColumn;
      tvSireAllStarts: TcxGridDBColumn;
      tvSireAllWins: TcxGridDBColumn;
      tvSireAllWinPct: TcxGridDBColumn;
      tvSireTurfStarts: TcxGridDBColumn;
      tvSireTurfWins: TcxGridDBColumn;
      tvSireTurfWinPct: TcxGridDBColumn;
      tvSireMudStarts: TcxGridDBColumn;
      tvSireMudWins: TcxGridDBColumn;
      tvSireMudWinPct: TcxGridDBColumn;
      tvSireTurfLastYearRank: TcxGridDBColumn;
      tvSireTurfLastYearStarts: TcxGridDBColumn;
      tvSireTurfLastYearWins: TcxGridDBColumn;
      tvSireTurfLastYearStakeWins: TcxGridDBColumn;
      tvSireTurfLastYearPctOfEarnings: TcxGridDBColumn;
      tvSireGeneralLastYearRank: TcxGridDBColumn;
      tvSireGeneralLastYearStudFee: TcxGridDBColumn;
      tvSireJuvenileLastYearRank: TcxGridDBColumn;
      tvSireJuvenileLastYearStudFee: TcxGridDBColumn;
      tvSireTurfThisYearRank: TcxGridDBColumn;
      tvSireTurfThisYearStarts: TcxGridDBColumn;
      tvSireTurfThisYearWins: TcxGridDBColumn;
      tvSireTurfThisYearStakeWins: TcxGridDBColumn;
      tvSireTurfThisYearPctOfEarnings: TcxGridDBColumn;
      tvSireGeneralThisYearRank: TcxGridDBColumn;
      tvSireGeneralThisYearStudFee: TcxGridDBColumn;
      tvSireJuvenileThisYearRank: TcxGridDBColumn;
      tvSireStandingIn: TcxGridDBColumn;
      tvSireStandingInRank: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   ConnectionForm: TConnectionForm;

implementation

uses DatRatings, UnitCommonCode;

{$R *.dfm}

procedure TConnectionForm.FormCreate(Sender: TObject);
begin

   with dbConnections do begin
      Close;
      Directory := DATA_PATH;
      Open;
   end;

   //   tblOwner.Active := True;
   //   tblTrainer.Active := True;
   //   tblJockey.Active := True;
   //   tblXFEROwner.Active := True;
   tblTrainerCategory.Active := True;

end;

procedure TConnectionForm.FormDestroy(Sender: TObject);
begin

   //   tblOwner.Active := False;
   tblTrainer.Active := False;
   tblJockey.Active := False;
   tblXFEROwner.Active := False;
   tblTrainerCategory.Active := False;

   with dbConnections do begin
      Close;
   end;

end;

end.
