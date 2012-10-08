unit FormHH;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxEdit,
   DB, cxDBData, DBISAMTb, cxLookAndFeels, cxGridBandedTableView,
   cxGridCardView, cxGridTableView, cxGridCustomPopupMenu, cxGridPopupMenu,
   cxGridLevel, cxGridDBCardView, cxGridDBBandedTableView,
   cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
   cxGridCustomView, cxGrid, Grids, DBGrids, dbisamct, DBISAMExt,
   cxDataStorage, StdCtrls, cxContainer,
   ExtCtrls, cxTL, cxCalendar, cxTextEdit, cxMaskEdit, cxDropDownEdit,
   cxLabel, cxVGrid, cxPropertiesStore;

type
   THHForm = class(TForm)
      qryAngles: TDBISAMQueryExt;
      dbHHForm: TDBISAMDatabaseExt;
      dsAngles: TDataSource;
      tvAngleChoice: TcxGridDBTableView;
      grdHH: TcxGrid;
      tvTopChoice: TcxGridDBTableView;
      lvWinners: TcxGridLevel;
      dsProcessed: TDataSource;
      dsTopChoices: TDataSource;
      qryTopChoices: TDBISAMQueryExt;
      lvTopChoices: TcxGridLevel;
      lvAngles: TcxGridLevel;
      lvDollars: TcxGridLevel;
      lvValues: TcxGridLevel;
      tvWinners: TcxGridDBTableView;
      tvTopChoices: TcxGridDBTableView;
      tvAngles: TcxGridDBTableView;
      tvDollars: TcxGridDBTableView;
      tvValues: TcxGridDBTableView;
      qryWinners: TDBISAMQueryExt;
      qryDollars: TDBISAMQueryExt;
      qryValues: TDBISAMQueryExt;
      dsWinners: TDataSource;
      dsDollars: TDataSource;
      dsValues: TDataSource;
      Panel1: TPanel;
      tvAngleChoiceTrkCode: TcxGridDBColumn;
      tvAngleChoiceRaceDate: TcxGridDBColumn;
      tvAngleChoiceRaceNbr: TcxGridDBColumn;
      tvAngleChoicePostPos: TcxGridDBColumn;
      tvAngleChoiceRaceType: TcxGridDBColumn;
      tvAngleChoiceSurface: TcxGridDBColumn;
      tvAngleChoiceClaimingPrice: TcxGridDBColumn;
      tvAngleChoiceProgramNbr: TcxGridDBColumn;
      tvAngleChoiceMorningLineTo1: TcxGridDBColumn;
      tvAngleChoiceMorningLineDesc: TcxGridDBColumn;
      tvAngleChoiceFinishPos: TcxGridDBColumn;
      tvAngleChoiceOdds: TcxGridDBColumn;
      tvAngleChoiceHorseName: TcxGridDBColumn;
      tvAngleChoiceTipChoice: TcxGridDBColumn;
      tvAngleChoiceAngleChoice: TcxGridDBColumn;
      tvAngleChoiceValueChoice: TcxGridDBColumn;
      tvAngleChoiceIsBelowClaimedPrice: TcxGridDBColumn;
      tvAngleChoiceIsFirstTimeClaiming: TcxGridDBColumn;
      tvAngleChoiceIsClaimedAndDown: TcxGridDBColumn;
      tvAngleChoiceIsClaimedAndUp: TcxGridDBColumn;
      tvAngleChoiceIsLayoffAndUp: TcxGridDBColumn;
      tvAngleChoiceIsPrintedOnAngleSheet: TcxGridDBColumn;
      tvAngleChoiceIsPrintedOnValueSheet: TcxGridDBColumn;
      tvAngleChoiceIsTipSheetSelected: TcxGridDBColumn;
      tvAngleChoiceIsAngleSheetSelected: TcxGridDBColumn;
      tvAngleChoiceIsTripleLiner: TcxGridDBColumn;
      tvAngleChoiceIsTripleDot: TcxGridDBColumn;
      tvAngleChoiceIsDollar: TcxGridDBColumn;
      tvAngleChoiceIsDoubleDollar: TcxGridDBColumn;
      tvAngleChoiceIsSuperOwner: TcxGridDBColumn;
      tvAngleChoiceIsSuperJockey: TcxGridDBColumn;
      tvAngleChoiceIsSuperTrainer: TcxGridDBColumn;
      tvAngleChoiceFinalWinPct: TcxGridDBColumn;
      tvAngleChoiceFinalWinPctRank: TcxGridDBColumn;
      tvAngleChoiceFinalStarts: TcxGridDBColumn;
      tvAngleChoiceMaidenRPIRank: TcxGridDBColumn;
      tvAngleChoiceTurfRPIRank: TcxGridDBColumn;
      tvAngleChoiceTurfIVRank: TcxGridDBColumn;
      tvAngleChoiceMudIVRank: TcxGridDBColumn;
      tvAngleChoiceMaidenIVRank: TcxGridDBColumn;
      tvAngleChoiceTurfRatingRank: TcxGridDBColumn;
      tvAngleChoiceClassRatingRank: TcxGridDBColumn;
      tvAngleChoiceTotalTrnStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrnWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalJkyStarts: TcxGridDBColumn;
      tvAngleChoiceTotalJkyWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalTrnDebutWinPct_1: TcxGridDBColumn;
      tvAngleChoiceTotalTrnDebutStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrnDebutWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalTrnDebutTwoStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrnDebutTwoWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalTrn91PlusStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrn91PlusWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalTrnWork91PlusStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrnWork91PlusWinPct: TcxGridDBColumn;
      tvAngleChoiceTotalTrnAftClmStarts: TcxGridDBColumn;
      tvAngleChoiceTotalTrnAftClmWinPct: TcxGridDBColumn;
      tvAngleChoiceLastTrkCode: TcxGridDBColumn;
      tvAngleChoiceLastRaceType: TcxGridDBColumn;
      tvAngleChoiceLastSurf: TcxGridDBColumn;
      tvAngleChoiceLastTrkCond: TcxGridDBColumn;
      tvAngleChoiceLastOdds: TcxGridDBColumn;
      tvAngleChoiceLastFinishPos: TcxGridDBColumn;
      tvAngleChoiceLastFavoriteIndicator: TcxGridDBColumn;
      tvAngleChoiceLastPurse: TcxGridDBColumn;
      tvAngleChoiceLastClmPrice: TcxGridDBColumn;
      tvAngleChoiceLastClaimed: TcxGridDBColumn;
      tvAngleChoiceLastPostPos: TcxGridDBColumn;
      tvTopChoiceTrkCode: TcxGridDBColumn;
      tvTopChoiceRaceDate: TcxGridDBColumn;
      tvTopChoiceRaceNbr: TcxGridDBColumn;
      tvTopChoicePostPos: TcxGridDBColumn;
      tvTopChoiceRaceType: TcxGridDBColumn;
      tvTopChoiceSurface: TcxGridDBColumn;
      tvTopChoiceClaimingPrice: TcxGridDBColumn;
      tvTopChoiceProgramNbr: TcxGridDBColumn;
      tvTopChoiceMorningLineTo1: TcxGridDBColumn;
      tvTopChoiceMorningLineDesc: TcxGridDBColumn;
      tvTopChoiceFinishPos: TcxGridDBColumn;
      tvTopChoiceOdds: TcxGridDBColumn;
      tvTopChoiceHorseName: TcxGridDBColumn;
      tvTopChoiceTipChoice: TcxGridDBColumn;
      tvTopChoiceAngleChoice: TcxGridDBColumn;
      tvTopChoiceValueChoice: TcxGridDBColumn;
      tvTopChoiceIsBelowClaimedPrice: TcxGridDBColumn;
      tvTopChoiceIsFirstTimeClaiming: TcxGridDBColumn;
      tvTopChoiceIsClaimedAndDown: TcxGridDBColumn;
      tvTopChoiceIsClaimedAndUp: TcxGridDBColumn;
      tvTopChoiceIsLayoffAndUp: TcxGridDBColumn;
      tvTopChoiceIsPrintedOnAngleSheet: TcxGridDBColumn;
      tvTopChoiceIsPrintedOnValueSheet: TcxGridDBColumn;
      tvTopChoiceIsTipSheetSelected: TcxGridDBColumn;
      tvTopChoiceIsAngleSheetSelected: TcxGridDBColumn;
      tvTopChoiceIsTripleLiner: TcxGridDBColumn;
      tvTopChoiceIsTripleDot: TcxGridDBColumn;
      tvTopChoiceIsDollar: TcxGridDBColumn;
      tvTopChoiceIsDoubleDollar: TcxGridDBColumn;
      tvTopChoiceIsSuperOwner: TcxGridDBColumn;
      tvTopChoiceIsSuperJockey: TcxGridDBColumn;
      tvTopChoiceIsSuperTrainer: TcxGridDBColumn;
      tvTopChoiceFinalWinPct: TcxGridDBColumn;
      tvTopChoiceFinalWinPctRank: TcxGridDBColumn;
      tvTopChoiceFinalStarts: TcxGridDBColumn;
      tvTopChoiceMaidenRPIRank: TcxGridDBColumn;
      tvTopChoiceTurfRPIRank: TcxGridDBColumn;
      tvTopChoiceTurfIVRank: TcxGridDBColumn;
      tvTopChoiceMudIVRank: TcxGridDBColumn;
      tvTopChoiceMaidenIVRank: TcxGridDBColumn;
      tvTopChoiceTurfRatingRank: TcxGridDBColumn;
      tvTopChoiceClassRatingRank: TcxGridDBColumn;
      tvTopChoiceTotalTrnStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrnWinPct: TcxGridDBColumn;
      tvTopChoiceTotalJkyStarts: TcxGridDBColumn;
      tvTopChoiceTotalJkyWinPct: TcxGridDBColumn;
      tvTopChoiceTotalTrnDebutWinPct_1: TcxGridDBColumn;
      tvTopChoiceTotalTrnDebutStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrnDebutWinPct: TcxGridDBColumn;
      tvTopChoiceTotalTrnDebutTwoStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrnDebutTwoWinPct: TcxGridDBColumn;
      tvTopChoiceTotalTrn91PlusStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrn91PlusWinPct: TcxGridDBColumn;
      tvTopChoiceTotalTrnWork91PlusStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrnWork91PlusWinPct: TcxGridDBColumn;
      tvTopChoiceTotalTrnAftClmStarts: TcxGridDBColumn;
      tvTopChoiceTotalTrnAftClmWinPct: TcxGridDBColumn;
      tvTopChoiceLastTrkCode: TcxGridDBColumn;
      tvTopChoiceLastRaceType: TcxGridDBColumn;
      tvTopChoiceLastSurf: TcxGridDBColumn;
      tvTopChoiceLastTrkCond: TcxGridDBColumn;
      tvTopChoiceLastOdds: TcxGridDBColumn;
      tvTopChoiceLastFinishPos: TcxGridDBColumn;
      tvTopChoiceLastFavoriteIndicator: TcxGridDBColumn;
      tvTopChoiceLastPurse: TcxGridDBColumn;
      tvTopChoiceLastClmPrice: TcxGridDBColumn;
      tvTopChoiceLastClaimed: TcxGridDBColumn;
      tvTopChoiceLastPostPos: TcxGridDBColumn;
      tvDollarsTrkCode: TcxGridDBColumn;
      tvDollarsRaceDate: TcxGridDBColumn;
      tvDollarsRaceNbr: TcxGridDBColumn;
      tvDollarsPostPos: TcxGridDBColumn;
      tvDollarsRaceType: TcxGridDBColumn;
      tvDollarsSurface: TcxGridDBColumn;
      tvDollarsClaimingPrice: TcxGridDBColumn;
      tvDollarsProgramNbr: TcxGridDBColumn;
      tvDollarsMorningLineTo1: TcxGridDBColumn;
      tvDollarsMorningLineDesc: TcxGridDBColumn;
      tvDollarsFinishPos: TcxGridDBColumn;
      tvDollarsOdds: TcxGridDBColumn;
      tvDollarsHorseName: TcxGridDBColumn;
      tvDollarsTipChoice: TcxGridDBColumn;
      tvDollarsAngleChoice: TcxGridDBColumn;
      tvDollarsValueChoice: TcxGridDBColumn;
      tvDollarsIsBelowClaimedPrice: TcxGridDBColumn;
      tvDollarsIsFirstTimeClaiming: TcxGridDBColumn;
      tvDollarsIsClaimedAndDown: TcxGridDBColumn;
      tvDollarsIsClaimedAndUp: TcxGridDBColumn;
      tvDollarsIsLayoffAndUp: TcxGridDBColumn;
      tvDollarsIsPrintedOnAngleSheet: TcxGridDBColumn;
      tvDollarsIsPrintedOnValueSheet: TcxGridDBColumn;
      tvDollarsIsTipSheetSelected: TcxGridDBColumn;
      tvDollarsIsAngleSheetSelected: TcxGridDBColumn;
      tvDollarsIsTripleLiner: TcxGridDBColumn;
      tvDollarsIsTripleDot: TcxGridDBColumn;
      tvDollarsIsDollar: TcxGridDBColumn;
      tvDollarsIsDoubleDollar: TcxGridDBColumn;
      tvDollarsIsSuperOwner: TcxGridDBColumn;
      tvDollarsIsSuperJockey: TcxGridDBColumn;
      tvDollarsIsSuperTrainer: TcxGridDBColumn;
      tvDollarsFinalWinPct: TcxGridDBColumn;
      tvDollarsFinalWinPctRank: TcxGridDBColumn;
      tvDollarsFinalStarts: TcxGridDBColumn;
      tvDollarsMaidenRPIRank: TcxGridDBColumn;
      tvDollarsTurfRPIRank: TcxGridDBColumn;
      tvDollarsTurfIVRank: TcxGridDBColumn;
      tvDollarsMudIVRank: TcxGridDBColumn;
      tvDollarsMaidenIVRank: TcxGridDBColumn;
      tvDollarsTurfRatingRank: TcxGridDBColumn;
      tvDollarsClassRatingRank: TcxGridDBColumn;
      tvDollarsTotalTrnStarts: TcxGridDBColumn;
      tvDollarsTotalTrnWinPct: TcxGridDBColumn;
      tvDollarsTotalJkyStarts: TcxGridDBColumn;
      tvDollarsTotalJkyWinPct: TcxGridDBColumn;
      tvDollarsTotalTrnDebutWinPct_1: TcxGridDBColumn;
      tvDollarsTotalTrnDebutStarts: TcxGridDBColumn;
      tvDollarsTotalTrnDebutWinPct: TcxGridDBColumn;
      tvDollarsTotalTrnDebutTwoStarts: TcxGridDBColumn;
      tvDollarsTotalTrnDebutTwoWinPct: TcxGridDBColumn;
      tvDollarsTotalTrn91PlusStarts: TcxGridDBColumn;
      tvDollarsTotalTrn91PlusWinPct: TcxGridDBColumn;
      tvDollarsTotalTrnWork91PlusStarts: TcxGridDBColumn;
      tvDollarsTotalTrnWork91PlusWinPct: TcxGridDBColumn;
      tvDollarsTotalTrnAftClmStarts: TcxGridDBColumn;
      tvDollarsTotalTrnAftClmWinPct: TcxGridDBColumn;
      tvDollarsLastTrkCode: TcxGridDBColumn;
      tvDollarsLastRaceType: TcxGridDBColumn;
      tvDollarsLastSurf: TcxGridDBColumn;
      tvDollarsLastTrkCond: TcxGridDBColumn;
      tvDollarsLastOdds: TcxGridDBColumn;
      tvDollarsLastFinishPos: TcxGridDBColumn;
      tvDollarsLastFavoriteIndicator: TcxGridDBColumn;
      tvDollarsLastPurse: TcxGridDBColumn;
      tvDollarsLastClmPrice: TcxGridDBColumn;
      tvDollarsLastClaimed: TcxGridDBColumn;
      tvDollarsLastPostPos: TcxGridDBColumn;
      tvValuesTrkCode: TcxGridDBColumn;
      tvValuesRaceNbr: TcxGridDBColumn;
      tvValuesPostPos: TcxGridDBColumn;
      tvValuesRaceType: TcxGridDBColumn;
      tvValuesSurface: TcxGridDBColumn;
      tvValuesProgramNbr: TcxGridDBColumn;
      tvValuesMorningLineDesc: TcxGridDBColumn;
      tvValuesFinishPos: TcxGridDBColumn;
      tvValuesOdds: TcxGridDBColumn;
      tvValuesHorseName: TcxGridDBColumn;
      tvValuesValueChoice: TcxGridDBColumn;
      tblProcessed: TDBISAMTableExt;
      edtRaceDate: TcxDateEdit;
      cxLabel1: TcxLabel;
      tvTopChoicesTrkCode: TcxGridDBColumn;
      tvTopChoicesRaceNbr: TcxGridDBColumn;
      tvTopChoicesRaceType: TcxGridDBColumn;
      tvTopChoicesSurface: TcxGridDBColumn;
      tvTopChoicesProgramNbr: TcxGridDBColumn;
      tvTopChoicesMorningLineDesc: TcxGridDBColumn;
      tvTopChoicesFinishPos: TcxGridDBColumn;
      tvTopChoicesOdds: TcxGridDBColumn;
      tvTopChoicesHorseName: TcxGridDBColumn;
      tvTopChoicesFinalOrderKey: TcxGridDBColumn;
      tvTopChoicesFinalStarts: TcxGridDBColumn;
      tvTopChoicesFinalWinPct: TcxGridDBColumn;
      tvWinnersTrkCode: TcxGridDBColumn;
      tvWinnersRaceNbr: TcxGridDBColumn;
      tvWinnersRaceType: TcxGridDBColumn;
      tvWinnersSurface: TcxGridDBColumn;
      tvWinnersProgramNbr: TcxGridDBColumn;
      tvWinnersMorningLineDesc: TcxGridDBColumn;
      tvWinnersFinishPos: TcxGridDBColumn;
      tvWinnersOdds: TcxGridDBColumn;
      tvWinnersHorseName: TcxGridDBColumn;
      tvWinnersFinalWinPctRank: TcxGridDBColumn;
      tvWinnersTipChoice: TcxGridDBColumn;
      tvWinnersAngleChoice: TcxGridDBColumn;
      tvWinnersValueChoice: TcxGridDBColumn;
      tvWinnersIsDollar: TcxGridDBColumn;
      tvWinnersIsDoubleDollar: TcxGridDBColumn;
      tvWinnersIsTripleLiner: TcxGridDBColumn;
      tvWinnersIsTripleDot: TcxGridDBColumn;
      tvWinnersTotalTrnStarts: TcxGridDBColumn;
      tvWinnersTotalTrnWinPct: TcxGridDBColumn;
      tvWinnersTotalJkyStarts: TcxGridDBColumn;
      tvWinnersTotalJkyWinPct: TcxGridDBColumn;
      tvAnglesTrkCode: TcxGridDBColumn;
      tvAnglesProgramNbr: TcxGridDBColumn;
      tvAnglesRaceNbr: TcxGridDBColumn;
      tvAnglesHorseName: TcxGridDBColumn;
      tvAnglesMorningLineDesc: TcxGridDBColumn;
      tvAnglesAngleChoice: TcxGridDBColumn;
      tvAnglesFinishPos: TcxGridDBColumn;
      tvAnglesOdds: TcxGridDBColumn;
      tvWinnersPostPos: TcxGridDBColumn;
      tvValuesTotalTrnWinPct: TcxGridDBColumn;
      tvValuesFinalWinPctRank: TcxGridDBColumn;
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormCreate(Sender: TObject);
      procedure edtRaceDatePropertiesChange(Sender: TObject);
   private
      { Private declarations }
      bFirstTimeThru: boolean;
   public
      { Public declarations }
   end;

var
   HHForm: THHForm;

implementation

uses DatRatings, Ratings31Unit;

{$R *.dfm}

procedure THHForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   qryAngles.Active := False;
   qryWinners.Active := False;
   qryTopChoices.Active := False;
   qryValues.Active := False;
   qryDollars.Active := False;

   tblProcessed.Active := False;

end;

procedure THHForm.FormCreate(Sender: TObject);
begin

   bFirstTimeThru := True;

   tblProcessed.Active := True;
   if (tblProcessed.RecordCount > 0) then begin
      tblProcessed.First();
      edtRaceDate.Date := tblProcessed.FieldByName('RaceDate').AsDateTime;
   end else begin
      edtRaceDate.Date := Now();
   end;

end;

procedure THHForm.edtRaceDatePropertiesChange(Sender: TObject);
begin


   if (bFirstTimeThru) then begin
      qryAngles.Active := False;
      qryWinners.Active := False;
      qryTopChoices.Active := False;
      qryValues.Active := False;
      qryDollars.Active := False;
      bFirstTimeThru := False;
   end else begin
      qryAngles.DisableControls();
      qryWinners.DisableControls();
      qryTopChoices.DisableControls();
      qryValues.DisableControls();
      qryDollars.DisableControls();

      qryAngles.Active := False;
      qryWinners.Active := False;
      qryTopChoices.Active := False;
      qryValues.Active := False;
      qryDollars.Active := False;

      qryAngles.Params[0].AsDateTime := edtRaceDate.Date;
      qryWinners.Params[0].AsDateTime := edtRaceDate.Date;
      qryTopChoices.Params[0].AsDateTime := edtRaceDate.Date;
      qryValues.Params[0].AsDateTime := edtRaceDate.Date;
      qryDollars.Params[0].AsDateTime := edtRaceDate.Date;

      qryAngles.RequestLive := False;
      qryWinners.RequestLive := False;
      qryTopChoices.RequestLive := False;
      qryValues.RequestLive := False;
      qryDollars.RequestLive := False;

      qryAngles.ReadOnly := True;
      qryWinners.ReadOnly := True;
      qryTopChoices.ReadOnly := True;
      qryValues.ReadOnly := True;
      qryDollars.ReadOnly := True;

      qryAngles.Active := True;
      qryWinners.Active := True;
      qryTopChoices.Active := True;
      qryValues.Active := True;
      qryDollars.Active := True;

      qryAngles.EnableControls();
      qryWinners.EnableControls();
      qryTopChoices.EnableControls();
      qryValues.EnableControls();
      qryDollars.EnableControls();
   end;

end;

end.
