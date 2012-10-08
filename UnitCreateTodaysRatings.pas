unit UnitCreateTodaysRatings;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure CreateTodaysRatings(Sender: TObject; iIncCnt: integer);


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking, UnitGetHandicappingKeys;

procedure CreateTodaysRatings(Sender: TObject; iIncCnt: integer);
var
   sRaceType: double;

   iBackSpeedStarts: integer;
   iBackSpeedWins: integer;
   fBackSpeedWinPct: double;

   fBackSpeedDefaultRating: double;
   iBackSpeedDefaultStarts: integer;
   iBackSpeedDefaultWins: integer;
   fBackSpeedDefaultWinPct: double;

   iTotalTrnStarts: integer;
   iTotalTrnWins: integer;
   fTotalTrnWinPct: double;

   iTotalTrn1To45Starts: integer;
   iTotalTrn1To45Wins: integer;
   fTotalTrn1To45WinPct: double;

   iTotalTrn46To120Starts: integer;
   iTotalTrn46To120Wins: integer;
   fTotalTrn46To120WinPct: double;

   iTotalTrn120PlusStarts: integer;
   iTotalTrn120PlusWins: integer;
   fTotalTrn120PlusWinPct: double;

   iTotalTrnWork1To45Starts: integer;
   iTotalTrnWork1To45Wins: integer;
   fTotalTrnWork1To45WinPct: double;

   iTotalTrnWork46To120Starts: integer;
   iTotalTrnWork46To120Wins: integer;
   fTotalTrnWork46To120WinPct: double;

   iTotalTrnWork120PlusStarts: integer;
   iTotalTrnWork120PlusWins: integer;
   fTotalTrnWork120PlusWinPct: double;

   iTotalTrnDebutStarts: integer;
   iTotalTrnDebutWins: integer;
   fTotalTrnDebutWinPct: double;

   iTotalTrnDebutTwoStarts: integer;
   iTotalTrnDebutTwoWins: integer;
   fTotalTrnDebutTwoWinPct: double;

   iTotalTrnFirstJuiceStarts: integer;
   iTotalTrnFirstJuiceWins: integer;
   fTotalTrnFirstJuiceWinPct: double;

   iTotalTrnSecondJuiceStarts: integer;
   iTotalTrnSecondJuiceWins: integer;
   fTotalTrnSecondJuiceWinPct: double;

   iTotalTrnBlinkersOnStarts: integer;
   iTotalTrnBlinkersOnWins: integer;
   fTotalTrnBlinkersOnWinPct: double;

   iTotalTrnBlinkersOffStarts: integer;
   iTotalTrnBlinkersOffWins: integer;
   fTotalTrnBlinkersOffWinPct: double;

   iTotalTrnJkyStarts: integer;
   iTotalTrnJkyWins: integer;
   fTotalTrnJkyWinPct: double;

   iTotalTrnOwnStarts: integer;
   iTotalTrnOwnWins: integer;
   fTotalTrnOwnWinPct: double;

   iTotalJkyStarts: integer;
   iTotalJkyWins: integer;
   fTotalJkyWinPct: double;

   iTotalOwnStarts: integer;
   iTotalOwnWins: integer;
   fTotalOwnWinPct: double;

   iTotalBrdStarts: integer;
   iTotalBrdWins: integer;
   fTotalBrdWinPct: double;

   dtLastRaceDate: TDateTime;

   fLastDistance: double;
   fLastOdds: double;

   iLastClmPrice: integer;
   iLastDistance: integer;
   iLastPostPos: integer;
   iLastPurse: integer;

   fLastHorseTime: double;

   fLastSRWinner: double;
   iLastTrackVariant: integer;

   iLastWeight: integer;
   iLastClass: integer;
   fPower: double;
   iLastSpeed: integer;
   iBackSpeed: integer;


   sLastClaimed: string;
   sLastComment: string;
   sLastComment2: string;
   sLastDistanceDesc: string;
   sLastDQIndicator: string;
   sLastFavoriteIndicator: string;


   sLastGateBreak: string;
   sLastJockey: string;

   sLastLen1Back: string;
   sLastLen2Back: string;
   sLastStLenBack: string;
   sLastFinishBeaten: string;

   fLastTime1stCall: double;
   fLastTime2ndCall: double;
   fLastTimeStrCall: double;
   fLastTimeFinCall: double;

   fLastBL1stCall: double;
   fLastBL2ndCall: double;
   fLastBLStrCall: double;
   fLastBLFinCall: double;

   fLastPos1stCall: double;
   fLastPos2ndCall: double;
   fLastPosStrCall: double;
   fLastPosFinCall: double;

   sLastRaceConditions: string;
   sLastRaceType: string;
   sLastSurf: string;

   sLastTopFinish1: string;
   sLastTopFinish2: string;
   sLastTopFinish3: string;

   sLastTrkCode: string;
   sLastTrkCond: string;

   dtLocalTimeOfRace: TDateTime;

   bRouteRace: boolean;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;

   fLifeTurfStarts: double;
   fLifeTurfWins: double;
   fLifeTurfWinPct: double;

   fLifeMudStarts: double;
   fLifeMudWins: double;
   fLifeMudWinPct: double;

   fDamAllWinPct: double;
   fDamAllMudWinPct: double;
   fDamAllTurfWinPct: double;

   fDamSireAllWinPct: double;
   fDamSireAllMudWinPct: double;
   fDamSireAllTurfWinPct: double;

   fSireAllWinPct: double;
   fSireAllMudWinPct: double;
   fSireAllTurfWinPct: double;

   iSpeed1Back: integer;
   iSpeed2Back: integer;
   iSpeed3Back: integer;
   iSpeed4Back: integer;
   iSpeed5Back: integer;

   bClaimed1Back: boolean;
   bClaimed2Back: boolean;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   sLastDay: string;
   sLastMonthDesc: string;
   sLastYear: string;
   iLastRaceNbr: integer;


begin

   hLog.AddToLog('CreateTodaysRatings', msevOperation);

   try
      try

         OpenTable(dm.tblRatings);
         OpenTable(dm.tblPast);
         OpenTable(dm.tblPP);

         OpenTable(dm.tblHH);
         OpenTable(dm.tblRH);
         OpenTable(dm.tblDam);
         OpenTable(dm.tblSire);

         OpenTable(dm.tblDamSummary);
         OpenTable(dm.tblSireSummary);
         OpenTable(dm.tblDamSireSummary);

         OpenTable(dm.tblTrainerSummary);
         OpenTable(dm.tblJockeySummary);

         OpenTable(dm.tblTrainerJockeySummary);

         OpenTable(dm.tblOwnerSummary);
         OpenTable(dm.tblBreederSummary);

         OpenTable(dm.tblTrainerOwnerSummary);

         OpenTable(dm.tblTrainer1To45Summary);
         OpenTable(dm.tblTrainer46To120Summary);
         OpenTable(dm.tblTrainer120PlusSummary);

         OpenTable(dm.tblTrainer1To45WorkSummary);
         OpenTable(dm.tblTrainer46To120WorkSummary);
         OpenTable(dm.tblTrainer120PlusWorkSummary);

         OpenTable(dm.tblTrainerDebutSummary);
         OpenTable(dm.tblTrainerDebutTwoSummary);

         OpenTable(dm.tblTrainerFirstJuiceSummary);
         OpenTable(dm.tblTrainerSecondJuiceSummary);

         OpenTable(dm.tblTrainerBlinkersOnSummary);
         OpenTable(dm.tblTrainerBlinkersOffSummary);


         InitPrgBar(dm.tblRatings.RecordCount);

         dm.tblRatings.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         iStaCnt := 0;
         iTotalCnt := 0;

         while (not dm.tblRatings.Eof) do begin
            if (iStaCnt > SMALL_BATCH_SIZE) then begin
               UpdateStatusBar(dm.tblRatings.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblRatings.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblRatings.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblRatings.RecordCount));
               Application.ProcessMessages();
               iStaCnt := 0;
               if not dm.dbSireRate.InTransaction then begin
                  dm.dbSireRate.StartTransaction();
               end else begin
                  if dm.dbSireRate.InTransaction then begin
                     dm.dbSireRate.Commit;
                     dm.dbSireRate.StartTransaction();
                  end;
               end;
            end
            else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();
            dm.tblRatings.Edit();

            //***
            dm.tblHH.IndexName := '';
            dm.tblHH.SetKey();
            dm.tblHH.FieldByName('TrkCode').Value := dm.tblRatings.FieldByName('TrkCode').Value;
            dm.tblHH.FieldByName('RaceNbr').Value := dm.tblRatings.FieldByName('RaceNbr').Value;
            dm.tblHH.FieldByName('RaceDate').Value := dm.tblRatings.FieldByName('RaceDate').Value;
            dm.tblHH.FieldByName('PostPos').Value := dm.tblRatings.FieldByName('PostPos').Value;

            //***
            dm.tblRH.IndexName := '';
            dm.tblRH.SetKey();
            dm.tblRH.FieldByName('TrkCode').Value := dm.tblRatings.FieldByName('TrkCode').Value;
            dm.tblRH.FieldByName('RaceNbr').Value := dm.tblRatings.FieldByName('RaceNbr').Value;
            dm.tblRH.FieldByName('RaceDate').Value := dm.tblRatings.FieldByName('RaceDate').Value;

            if (dm.tblRH.GotoKey()) then begin
               if dm.tblRH.FieldByName('LocalTimeOfRace').IsNull then begin
                  dtLocalTimeOfRace := 0;
               end else begin
                  dtLocalTimeOfRace := dm.tblRH.FieldByName('LocalTimeOfRace').Value;
               end;
            end;

            if (dm.tblHH.GotoKey()) then begin
               if dm.tblHH.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
                  bRouteRace := False;
               end else begin
                  bRouteRace := True;
               end;

               fPower := dm.tblHH.FieldByName('Power').AsFloat;

               iLastSpeed := dm.tblHH.FieldByName('LastSpeed').AsInteger;

               fEarlyPace := dm.tblHH.FieldByName('EarlyPace').AsFloat;
               fMiddlePace := dm.tblHH.FieldByName('MiddlePace').AsFloat;
               fLatePace := dm.tblHH.FieldByName('LatePace').AsFloat;

               fEarlyPacePos := dm.tblHH.FieldByName('EarlyPacePos').AsFloat;
               fMiddlePacePos := dm.tblHH.FieldByName('MiddlePacePos').AsFloat;
               fLatePacePos := dm.tblHH.FieldByName('LatePacePos').AsFloat;

               bClaimed1Back := dm.tblHH.FieldByName('IsClaimed1Back').AsBoolean;
               bClaimed2Back := dm.tblHH.FieldByName('IsClaimed2Back').AsBoolean;

               //               iSpeed1Back := dm.tblHH.FieldByName('Speed1Back').AsInteger;
               //               iSpeed2Back := dm.tblHH.FieldByName('Speed2Back').AsInteger;
               //               iSpeed3Back := dm.tblHH.FieldByName('Speed3Back').AsInteger;
               //               iSpeed4Back := dm.tblHH.FieldByName('Speed4Back').AsInteger;
               //               iSpeed5Back := dm.tblHH.FieldByName('Speed5Back').AsInteger;


               dm.tblDamSummary.IndexName := '';
               dm.tblDamSummary.SetKey();
               dm.tblDamSummary.FieldByName('DamName').AsString := dm.tblHH.FieldByName('DamName').AsString;
               if (dm.tblDamSummary.GotoKey()) then begin
                  fDamAllWinPct := dm.tblDamSummary.FieldByName('AllWinPct').AsFloat;
                  fDamAllMudWinPct := dm.tblDamSummary.FieldByName('AllMudWinPct').AsFloat;
                  fDamAllTurfWinPct := dm.tblDamSummary.FieldByName('AllTurfWinPct').AsFloat;
               end else begin
                  fDamAllWinPct := 0;
                  fDamAllMudWinPct := 0;
                  fDamAllTurfWinPct := 0;
               end;

               // Use these from equibase
               dm.tblDam.IndexName := '';
               dm.tblDam.SetKey();
               dm.tblDam.FieldByName('DamName').AsString := dm.tblHH.FieldByName('DamName').AsString;
               if (dm.tblDam.GotoKey()) then begin
                  fDamAllWinPct := dm.tblDam.FieldByName('AllWinPct').AsFloat;
                  fDamAllMudWinPct := dm.tblDam.FieldByName('MudWinPct').AsFloat;
                  fDamAllTurfWinPct := dm.tblDam.FieldByName('TurfWinPct').AsFloat;
               end else begin
                  fDamAllWinPct := 0;
                  fDamAllMudWinPct := 0;
                  fDamAllTurfWinPct := 0;
               end;

               dm.tblDamSireSummary.IndexName := '';
               dm.tblDamSireSummary.SetKey();
               dm.tblDamSireSummary.FieldByName('DamSireName').AsString := dm.tblHH.FieldByName('DamSireName').AsString;
               if (dm.tblDamSireSummary.GotoKey()) then begin
                  fDamSireAllWinPct := dm.tblDamSireSummary.FieldByName('AllWinPct').AsFloat;
                  fDamSireAllMudWinPct := dm.tblDamSireSummary.FieldByName('AllMudWinPct').AsFloat;
                  fDamSireAllTurfWinPct := dm.tblDamSireSummary.FieldByName('AllTurfWinPct').AsFloat;
               end else begin
                  fDamSireAllWinPct := 0;
                  fDamSireAllMudWinPct := 0;
                  fDamSireAllTurfWinPct := 0;
               end;

               dm.tblSire.IndexName := '';
               dm.tblSire.SetKey();
               dm.tblSire.FieldByName('SireName').AsString := dm.tblHH.FieldByName('DamSireName').AsString;
               if (dm.tblSire.GotoKey()) then begin
                  fDamSireAllWinPct := dm.tblSire.FieldByName('AllWinPct').AsFloat;
                  fDamSireAllMudWinPct := dm.tblSire.FieldByName('MudWinPct').AsFloat;
                  fDamSireAllTurfWinPct := dm.tblSire.FieldByName('TurfWinPct').AsFloat;
               end else begin
                  fDamSireAllWinPct := 0;
                  fDamSireAllMudWinPct := 0;
                  fDamSireAllTurfWinPct := 0;
               end;

               dm.tblSireSummary.IndexName := '';
               dm.tblSireSummary.SetKey();
               dm.tblSireSummary.FieldByName('SireName').AsString := dm.tblHH.FieldByName('SireName').AsString;
               if (dm.tblSireSummary.GotoKey()) then begin
                  fSireAllWinPct := dm.tblSireSummary.FieldByName('AllWinPct').AsFloat;
                  fSireAllMudWinPct := dm.tblSireSummary.FieldByName('AllMudWinPct').AsFloat;
                  fSireAllTurfWinPct := dm.tblSireSummary.FieldByName('AllTurfWinPct').AsFloat;
               end else begin
                  fSireAllWinPct := 0;
                  fSireAllMudWinPct := 0;
                  fSireAllTurfWinPct := 0;
               end;

               // Use these from equibase
               dm.tblSire.IndexName := '';
               dm.tblSire.SetKey();
               dm.tblSire.FieldByName('SireName').AsString := dm.tblHH.FieldByName('SireName').AsString;
               if (dm.tblSire.GotoKey()) then begin
                  fSireAllWinPct := dm.tblSire.FieldByName('AllWinPct').AsFloat;
                  fSireAllMudWinPct := dm.tblSire.FieldByName('MudWinPct').AsFloat;
                  fSireAllTurfWinPct := dm.tblSire.FieldByName('TurfWinPct').AsFloat;
               end else begin
                  fSireAllWinPct := 0;
                  fSireAllMudWinPct := 0;
                  fSireAllTurfWinPct := 0;
               end;


               dm.tblTrainerSummary.IndexName := '';
               dm.tblTrainerSummary.SetKey();
               dm.tblTrainerSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerSummary.GotoKey()) then begin
                  iTotalTrnStarts := dm.tblTrainerSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnWins := dm.tblTrainerSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnWinPct := dm.tblTrainerSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnStarts := 0;
                  iTotalTrnWins := 0;
                  fTotalTrnWinPct := 0;
               end;


               dm.tblTrainerJockeySummary.IndexName := '';
               dm.tblTrainerJockeySummary.SetKey();
               dm.tblTrainerJockeySummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               dm.tblTrainerJockeySummary.FieldByName('JkyEquibaseKey').Value := dm.tblHH.FieldByName('JkyEquibaseKey').AsString;
               if (dm.tblTrainerJockeySummary.GotoKey()) then begin
                  iTotalTrnJkyStarts := dm.tblTrainerJockeySummary.FieldByName('Starts').AsInteger;
                  iTotalTrnJkyWins := dm.tblTrainerJockeySummary.FieldByName('Wins').AsInteger;
                  fTotalTrnJkyWinPct := dm.tblTrainerJockeySummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnJkyStarts := 0;
                  iTotalTrnJkyWins := 0;
                  fTotalTrnJkyWinPct := 0;
               end;

               dm.tblTrainer1To45Summary.IndexName := '';
               dm.tblTrainer1To45Summary.SetKey();
               dm.tblTrainer1To45Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer1To45Summary.GotoKey()) then begin
                  iTotalTrn1To45Starts := dm.tblTrainer1To45Summary.FieldByName('Starts').AsInteger;
                  iTotalTrn1To45Wins := dm.tblTrainer1To45Summary.FieldByName('Wins').AsInteger;
                  fTotalTrn1To45WinPct := dm.tblTrainer1To45Summary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrn1To45Starts := 0;
                  iTotalTrn1To45Wins := 0;
                  fTotalTrn1To45WinPct := 0;
               end;

               dm.tblTrainer46To120Summary.IndexName := '';
               dm.tblTrainer46To120Summary.SetKey();
               dm.tblTrainer46To120Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer46To120Summary.GotoKey()) then begin
                  iTotalTrn46To120Starts := dm.tblTrainer46To120Summary.FieldByName('Starts').AsInteger;
                  iTotalTrn46To120Wins := dm.tblTrainer46To120Summary.FieldByName('Wins').AsInteger;
                  fTotalTrn46To120WinPct := dm.tblTrainer46To120Summary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrn46To120Starts := 0;
                  iTotalTrn46To120Wins := 0;
                  fTotalTrn46To120WinPct := 0;
               end;

               dm.tblTrainer120PlusSummary.IndexName := '';
               dm.tblTrainer120PlusSummary.SetKey();
               dm.tblTrainer120PlusSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer120PlusSummary.GotoKey()) then begin
                  iTotalTrn120PlusStarts := dm.tblTrainer120PlusSummary.FieldByName('Starts').AsInteger;
                  iTotalTrn120PlusWins := dm.tblTrainer120PlusSummary.FieldByName('Wins').AsInteger;
                  fTotalTrn120PlusWinPct := dm.tblTrainer120PlusSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrn120PlusStarts := 0;
                  iTotalTrn120PlusWins := 0;
                  fTotalTrn120PlusWinPct := 0;
               end;

               dm.tblTrainerDebutSummary.IndexName := '';
               dm.tblTrainerDebutSummary.SetKey();
               dm.tblTrainerDebutSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerDebutSummary.GotoKey()) then begin
                  iTotalTrnDebutStarts := dm.tblTrainerDebutSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnDebutWins := dm.tblTrainerDebutSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnDebutWinPct := dm.tblTrainerDebutSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnDebutStarts := 0;
                  iTotalTrnDebutWins := 0;
                  fTotalTrnDebutWinPct := 0;
               end;

               dm.tblTrainerDebutTwoSummary.IndexName := '';
               dm.tblTrainerDebutTwoSummary.SetKey();
               dm.tblTrainerDebutTwoSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerDebutTwoSummary.GotoKey()) then begin
                  iTotalTrnDebutTwoStarts := dm.tblTrainerDebutTwoSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnDebutTwoWins := dm.tblTrainerDebutTwoSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnDebutTwoWinPct := dm.tblTrainerDebutTwoSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnDebutTwoStarts := 0;
                  iTotalTrnDebutTwoWins := 0;
                  fTotalTrnDebutTwoWinPct := 0;
               end;

               dm.tblTrainerFirstJuiceSummary.IndexName := '';
               dm.tblTrainerFirstJuiceSummary.SetKey();
               dm.tblTrainerFirstJuiceSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerFirstJuiceSummary.GotoKey()) then begin
                  iTotalTrnFirstJuiceStarts := dm.tblTrainerFirstJuiceSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnFirstJuiceWins := dm.tblTrainerFirstJuiceSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnFirstJuiceWinPct := dm.tblTrainerFirstJuiceSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnFirstJuiceStarts := 0;
                  iTotalTrnFirstJuiceWins := 0;
                  fTotalTrnFirstJuiceWinPct := 0;
               end;

               dm.tblTrainerSecondJuiceSummary.IndexName := '';
               dm.tblTrainerSecondJuiceSummary.SetKey();
               dm.tblTrainerSecondJuiceSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerSecondJuiceSummary.GotoKey()) then begin
                  iTotalTrnSecondJuiceStarts := dm.tblTrainerSecondJuiceSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnSecondJuiceWins := dm.tblTrainerSecondJuiceSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnSecondJuiceWinPct := dm.tblTrainerSecondJuiceSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnSecondJuiceStarts := 0;
                  iTotalTrnSecondJuiceWins := 0;
                  fTotalTrnSecondJuiceWinPct := 0;
               end;

               dm.tblTrainerBlinkersOnSummary.IndexName := '';
               dm.tblTrainerBlinkersOnSummary.SetKey();
               dm.tblTrainerBlinkersOnSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerBlinkersOnSummary.GotoKey()) then begin
                  iTotalTrnBlinkersOnStarts := dm.tblTrainerBlinkersOnSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnBlinkersOnWins := dm.tblTrainerBlinkersOnSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnBlinkersOnWinPct := dm.tblTrainerBlinkersOnSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnBlinkersOnStarts := 0;
                  iTotalTrnBlinkersOnWins := 0;
                  fTotalTrnBlinkersOnWinPct := 0;
               end;

               dm.tblTrainerBlinkersOffSummary.IndexName := '';
               dm.tblTrainerBlinkersOffSummary.SetKey();
               dm.tblTrainerBlinkersOffSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainerBlinkersOffSummary.GotoKey()) then begin
                  iTotalTrnBlinkersOffStarts := dm.tblTrainerBlinkersOffSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnBlinkersOffWins := dm.tblTrainerBlinkersOffSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnBlinkersOffWinPct := dm.tblTrainerBlinkersOffSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnBlinkersOffStarts := 0;
                  iTotalTrnBlinkersOffWins := 0;
                  fTotalTrnBlinkersOffWinPct := 0;
               end;

               dm.tblTrainer1To45WorkSummary.IndexName := '';
               dm.tblTrainer1To45WorkSummary.SetKey();
               dm.tblTrainer1To45WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer1To45WorkSummary.GotoKey()) then begin
                  iTotalTrnWork1To45Starts := dm.tblTrainer1To45WorkSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnWork1To45Wins := dm.tblTrainer1To45WorkSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnWork1To45WinPct := dm.tblTrainer1To45WorkSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnWork1To45Starts := 0;
                  iTotalTrnWork1To45Wins := 0;
                  fTotalTrnWork1To45WinPct := 0;
               end;


               dm.tblTrainer46To120WorkSummary.IndexName := '';
               dm.tblTrainer46To120WorkSummary.SetKey();
               dm.tblTrainer46To120WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer46To120WorkSummary.GotoKey()) then begin
                  iTotalTrnWork46To120Starts := dm.tblTrainer46To120WorkSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnWork46To120Wins := dm.tblTrainer46To120WorkSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnWork46To120WinPct := dm.tblTrainer46To120WorkSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnWork46To120Starts := 0;
                  iTotalTrnWork46To120Wins := 0;
                  fTotalTrnWork46To120WinPct := 0;
               end;

               dm.tblTrainer120PlusWorkSummary.IndexName := '';
               dm.tblTrainer120PlusWorkSummary.SetKey();
               dm.tblTrainer120PlusWorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               if (dm.tblTrainer120PlusWorkSummary.GotoKey()) then begin
                  iTotalTrnWork120PlusStarts := dm.tblTrainer120PlusWorkSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnWork120PlusWins := dm.tblTrainer120PlusWorkSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnWork120PlusWinPct := dm.tblTrainer120PlusWorkSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnWork120PlusStarts := 0;
                  iTotalTrnWork120PlusWins := 0;
                  fTotalTrnWork120PlusWinPct := 0;
               end;

               dm.tblTrainerOwnerSummary.IndexName := '';
               dm.tblTrainerOwnerSummary.SetKey();
               dm.tblTrainerOwnerSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
               dm.tblTrainerOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
               if (dm.tblTrainerOwnerSummary.GotoKey()) then begin
                  iTotalTrnOwnStarts := dm.tblTrainerOwnerSummary.FieldByName('Starts').AsInteger;
                  iTotalTrnOwnWins := dm.tblTrainerOwnerSummary.FieldByName('Wins').AsInteger;
                  fTotalTrnOwnWinPct := dm.tblTrainerOwnerSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalTrnOwnStarts := 0;
                  iTotalTrnOwnWins := 0;
                  fTotalTrnOwnWinPct := 0;
               end;

               dm.tblOwnerSummary.IndexName := '';
               dm.tblOwnerSummary.SetKey();
               dm.tblOwnerSummary.FieldByName('Owner').AsString := UpperCase(dm.tblHH.FieldByName('Owner').AsString);
               if (dm.tblOwnerSummary.GotoKey()) then begin
                  iTotalOwnStarts := dm.tblOwnerSummary.FieldByName('Starts').AsInteger;
                  iTotalOwnWins := dm.tblOwnerSummary.FieldByName('Wins').AsInteger;
                  fTotalOwnWinPct := dm.tblOwnerSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalOwnStarts := 0;
                  iTotalOwnWins := 0;
                  fTotalOwnWinPct := 0;
               end;

               dm.tblBreederSummary.IndexName := '';
               dm.tblBreederSummary.SetKey();
               dm.tblBreederSummary.FieldByName('Breeder').AsString := UpperCase(dm.tblHH.FieldByName('Breeder').AsString);
               if (dm.tblBreederSummary.GotoKey()) then begin
                  iTotalBrdStarts := dm.tblBreederSummary.FieldByName('Starts').AsInteger;
                  iTotalBrdWins := dm.tblBreederSummary.FieldByName('Wins').AsInteger;
                  fTotalBrdWinPct := dm.tblBreederSummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalBrdStarts := 0;
                  iTotalBrdWins := 0;
                  fTotalBrdWinPct := 0;
               end;

               dm.tblJockeySummary.IndexName := '';
               dm.tblJockeySummary.SetKey();
               dm.tblJockeySummary.FieldByName('JkyEquibaseKey').AsString := dm.tblHH.FieldByName('JkyEquibaseKey').AsString;
               if (dm.tblJockeySummary.GotoKey()) then begin
                  iTotalJkyStarts := dm.tblJockeySummary.FieldByName('Starts').AsInteger;
                  iTotalJkyWins := dm.tblJockeySummary.FieldByName('Wins').AsInteger;
                  fTotalJkyWinPct := dm.tblJockeySummary.FieldByName('WinPct').AsFloat;
               end else begin
                  iTotalJkyStarts := 0;
                  iTotalJkyWins := 0;
                  fTotalJkyWinPct := 0;
               end;



               dm.tblRatings.FieldByName('TotalJkyStarts').AsInteger := iTotalJkyStarts;
               dm.tblRatings.FieldByName('TotalJkyWins').AsInteger := iTotalJkyWins;
               dm.tblRatings.FieldByName('TotalJkyWinPct').AsFloat := Round(fTotalJkyWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnStarts').AsInteger := iTotalTrnStarts;
               dm.tblRatings.FieldByName('TotalTrnWins').AsInteger := iTotalTrnWins;
               dm.tblRatings.FieldByName('TotalTrnWinPct').AsFloat := Round(fTotalTrnWinPct * 100) / 100;


               dm.tblRatings.FieldByName('TotalTrnJkyStarts').AsInteger := iTotalTrnJkyStarts;
               dm.tblRatings.FieldByName('TotalTrnJkyWins').AsInteger := iTotalTrnJkyWins;
               dm.tblRatings.FieldByName('TotalTrnJkyWinPct').AsFloat := Round(fTotalTrnJkyWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnOwnStarts').AsInteger := iTotalTrnOwnStarts;
               dm.tblRatings.FieldByName('TotalTrnOwnWins').AsInteger := iTotalTrnOwnWins;
               dm.tblRatings.FieldByName('TotalTrnOwnWinPct').AsFloat := Round(fTotalTrnOwnWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrn1To45Starts').AsInteger := iTotalTrn1To45Starts;
               dm.tblRatings.FieldByName('TotalTrn1To45Wins').AsInteger := iTotalTrn1To45Wins;
               dm.tblRatings.FieldByName('TotalTrn1To45WinPct').AsFloat := Round(fTotalTrn1To45WinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrn46To120Starts').AsInteger := iTotalTrn46To120Starts;
               dm.tblRatings.FieldByName('TotalTrn46To120Wins').AsInteger := iTotalTrn46To120Wins;
               dm.tblRatings.FieldByName('TotalTrn46To120WinPct').AsFloat := Round(fTotalTrn46To120WinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrn120PlusStarts').AsInteger := iTotalTrn120PlusStarts;
               dm.tblRatings.FieldByName('TotalTrn120PlusWins').AsInteger := iTotalTrn120PlusWins;
               dm.tblRatings.FieldByName('TotalTrn120PlusWinPct').AsFloat := Round(fTotalTrn120PlusWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnWork1To45Starts').AsInteger := iTotalTrnWork1To45Starts;
               dm.tblRatings.FieldByName('TotalTrnWork1To45Wins').AsInteger := iTotalTrnWork1To45Wins;
               dm.tblRatings.FieldByName('TotalTrnWork1To45WinPct').AsFloat := Round(fTotalTrnWork1To45WinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnWork46To120Starts').AsInteger := iTotalTrnWork46To120Starts;
               dm.tblRatings.FieldByName('TotalTrnWork46To120Wins').AsInteger := iTotalTrnWork46To120Wins;
               dm.tblRatings.FieldByName('TotalTrnWork46To120WinPct').AsFloat := Round(fTotalTrnWork46To120WinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnWork120PlusStarts').AsInteger := iTotalTrnWork120PlusStarts;
               dm.tblRatings.FieldByName('TotalTrnWork120PlusWins').AsInteger := iTotalTrnWork120PlusWins;
               dm.tblRatings.FieldByName('TotalTrnWork120PlusWinPct').AsFloat := Round(fTotalTrnWork120PlusWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnDebutStarts').AsInteger := iTotalTrnDebutStarts;
               dm.tblRatings.FieldByName('TotalTrnDebutWins').AsInteger := iTotalTrnDebutWins;
               dm.tblRatings.FieldByName('TotalTrnDebutWinPct`').AsFloat := Round(fTotalTrnDebutWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iTotalTrnDebutTwoStarts;
               dm.tblRatings.FieldByName('TotalTrnDebutTwoWins').AsInteger := iTotalTrnDebutTwoWins;
               dm.tblRatings.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := Round(fTotalTrnDebutTwoWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnFirstJuiceStarts').AsInteger := iTotalTrnFirstJuiceStarts;
               dm.tblRatings.FieldByName('TotalTrnFirstJuiceWins').AsInteger := iTotalTrnFirstJuiceWins;
               dm.tblRatings.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat := Round(fTotalTrnFirstJuiceWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnSecondJuiceStarts').AsInteger := iTotalTrnSecondJuiceStarts;
               dm.tblRatings.FieldByName('TotalTrnSecondJuiceWins').AsInteger := iTotalTrnSecondJuiceWins;
               dm.tblRatings.FieldByName('TotalTrnSecondJuiceWinPct').AsFloat := Round(fTotalTrnSecondJuiceWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iTotalTrnBlinkersOnStarts;
               dm.tblRatings.FieldByName('TotalTrnBlinkersOnWins').AsInteger := iTotalTrnBlinkersOnWins;
               dm.tblRatings.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := Round(fTotalTrnBlinkersOnWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iTotalTrnBlinkersOffStarts;
               dm.tblRatings.FieldByName('TotalTrnBlinkersOffWins').AsInteger := iTotalTrnBlinkersOffWins;
               dm.tblRatings.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := Round(fTotalTrnBlinkersOffWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalOwnStarts').AsInteger := iTotalOwnStarts;
               dm.tblRatings.FieldByName('TotalOwnWins').AsInteger := iTotalOwnWins;
               dm.tblRatings.FieldByName('TotalOwnWinPct').AsFloat := Round(fTotalOwnWinPct * 100) / 100;

               dm.tblRatings.FieldByName('TotalBrdStarts').AsInteger := iTotalBrdStarts;
               dm.tblRatings.FieldByName('TotalBrdWins').AsInteger := iTotalBrdWins;
               dm.tblRatings.FieldByName('TotalBrdWinPct').AsFloat := Round(fTotalBrdWinPct * 100) / 100;

               dm.tblRatings.FieldByName('DamAllWinPct').AsFloat := fDamAllWinPct;
               dm.tblRatings.FieldByName('DamAllMudWinPct').AsFloat := fDamAllMudWinPct;
               dm.tblRatings.FieldByName('DamAllTurfWinPct').AsFloat := fDamAllTurfWinPct;

               dm.tblRatings.FieldByName('DamSireAllWinPct').AsFloat := fDamSireAllWinPct;
               dm.tblRatings.FieldByName('DamSireAllMudWinPct').AsFloat := fDamSireAllMudWinPct;
               dm.tblRatings.FieldByName('DamSireAllTurfWinPct').AsFloat := fDamSireAllTurfWinPct;

               dm.tblRatings.FieldByName('SireAllWinPct').AsFloat := fSireAllWinPct;
               dm.tblRatings.FieldByName('SireAllMudWinPct').AsFloat := fSireAllMudWinPct;
               dm.tblRatings.FieldByName('SireAllTurfWinPct').AsFloat := fSireAllTurfWinPct;

               if (sLastSurf = 'N') then begin
                  sLastSurf := 'D';
               end;
               if (sLastSurf = 'I') then begin
                  sLastSurf := 'T';
               end;
               if (sLastSurf = 'C') then begin
                  sLastSurf := 'T';
               end;
               if (sLastSurf = 'O') then begin
                  sLastSurf := 'T';
               end;


               //
               dm.tblRatings.FieldByName('LocalTimeOfRace').Value := dtLocalTimeOfRace;

               dm.tblRatings.FieldByName('Power').AsFloat := fPower;
               dm.tblRatings.FieldByName('LastSpeed').AsInteger := iLastSpeed;


               dm.tblRatings.FieldByName('EarlyPace').AsFloat := fEarlyPace;
               dm.tblRatings.FieldByName('MiddlePace').AsFloat := fMiddlePace;
               dm.tblRatings.FieldByName('LatePace').AsFloat := fLatePace;

               dm.tblRatings.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePos;
               dm.tblRatings.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePos;
               dm.tblRatings.FieldByName('LatePacePos').AsFloat := fLatePacePos;

               dm.tblRatings.FieldByName('Speed1Back').AsInteger := iSpeed1Back;
               dm.tblRatings.FieldByName('Speed2Back').AsInteger := iSpeed2Back;
               dm.tblRatings.FieldByName('Speed3Back').AsInteger := iSpeed3Back;
               dm.tblRatings.FieldByName('Speed4Back').AsInteger := iSpeed4Back;
               dm.tblRatings.FieldByName('Speed5Back').AsInteger := iSpeed5Back;

               dm.tblRatings.FieldByName('IsClaimed1Back').AsBoolean := bClaimed1Back;
               dm.tblRatings.FieldByName('IsClaimed2Back').AsBoolean := bClaimed2Back;



               dm.tblPast.IndexName := '';
               dm.tblPast.SetKey();
               dm.tblPast.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPast.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPast.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPast.FieldByName('PPNbr').Value := 1;
               if dm.tblPast.GotoKey() then begin
                  sLastTrkCode := dm.tblPast.FieldByName('LastTrkCode').AsString;
                  iLastRaceNbr := dm.tblPast.FieldByName('LastRaceNbr').AsInteger;
                  dtLastRaceDate := dm.tblPast.FieldByName('LastRaceDate').AsDateTime;
                  iLastPostPos := dm.tblPast.FieldByName('LastPostPos').AsInteger;

                  sLastRaceType := dm.tblPast.FieldByName('LastRaceType').AsString;
                  sLastRaceConditions := dm.tblPast.FieldByName('LastRaceConditions').AsString;
                  sLastSurf := dm.tblPast.FieldByName('LastSurf').AsString;
                  if sLastSurf = 'y' then begin
                     iLastDistance := atoi(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetYardDistanceDesc(iLastDistance);
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString) / YARDS_IN_FURLONG;
                     sLastSurf := 'D';
                  end else begin
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetFurlongDistanceDesc(fLastDistance);
                  end;

                  sLastTrkCond := dm.tblPast.FieldByName('LastTrkCond').AsString;
                  fLastOdds := dm.tblPast.FieldByName('LastOdds').AsFloat;

                  fLastTime1stCall := dm.tblPast.FieldByName('LastTime1stCall').AsFloat;
                  fLastTime2ndCall := dm.tblPast.FieldByName('LastTime2ndCall').AsFloat;
                  fLastTimeStrCall := dm.tblPast.FieldByName('LastTimeStrCall').AsFloat;
                  fLastTimeFinCall := dm.tblPast.FieldByName('LastTimeFinCall').AsFloat;

                  fLastBL1stCall := dm.tblPast.FieldByName('LastBL1stCall').AsFloat;
                  fLastBL2ndCall := dm.tblPast.FieldByName('LastBL2ndCall').AsFloat;
                  fLastBLStrCall := dm.tblPast.FieldByName('LastBLStrCall').AsFloat;
                  fLastBLFinCall := dm.tblPast.FieldByName('LastBLFinCall').AsFloat;

                  fLastPos1stCall := dm.tblPast.FieldByName('LastPos1stCall').AsFloat;
                  fLastPos2ndCall := dm.tblPast.FieldByName('LastPos2ndCall').AsFloat;
                  fLastPosStrCall := dm.tblPast.FieldByName('LastPosStrCall').AsFloat;
                  fLastPosFinCall := dm.tblPast.FieldByName('LastPosFinCall').AsFloat;

                  sLastComment := dm.tblPast.FieldByName('LastComment').AsString;
                  sLastComment2 := dm.tblPast.FieldByName('LastComment2').AsString;
                  sLastTopFinish1 := dm.tblPast.FieldByName('LastTopFinish1').AsString;
                  sLastTopFinish2 := dm.tblPast.FieldByName('LastTopFinish2').AsString;
                  sLastTopFinish3 := dm.tblPast.FieldByName('LastTopFinish3').AsString;
                  sLastDQIndicator := dm.tblPast.FieldByName('LastDQIndicator').AsString;
                  sLastFavoriteIndicator := dm.tblPast.FieldByName('LastFavoriteIndicator').AsString;

                  iLastPurse := dm.tblPast.FieldByName('LastPurse').AsInteger;
                  iLastClmPrice := dm.tblPast.FieldByName('LastClmPrice').AsInteger;
                  sLastJockey := dm.tblPast.FieldByName('LastJockey').AsString;
                  sLastClaimed := dm.tblPast.FieldByName('LastClaimed').AsString;

                  sLastDay := dm.tblPast.FieldByName('LastDay').AsString;
                  sLastMonthDesc := dm.tblPast.FieldByName('LastMonthDesc').AsString;
                  sLastYear := dm.tblPast.FieldByName('LastYear').AsString;

                  sLastGateBreak := dm.tblPast.FieldByName('LastGateBreak').AsString;
                  sLastLen1Back := dm.tblPast.FieldByName('LastLen1Back').AsString;
                  sLastLen2Back := dm.tblPast.FieldByName('LastLen2Back').AsString;
                  sLastStLenBack := dm.tblPast.FieldByName('LastStLenBack').AsString;
                  sLastFinishBeaten := dm.tblPast.FieldByName('LastFinishBeaten').AsString;

                  iLastWeight := dm.tblPast.FieldByName('LastWeight').AsInteger;
                  iLastTrackVariant := dm.tblPast.FieldByName('LastTrackVariant').AsInteger;

                  fLastHorseTime := dm.tblPast.FieldByName('LastHorseTime').AsFloat;
                  fLastSRWinner := dm.tblPast.FieldByName('LastSRWinner').AsFloat;

               end else begin
                  sLastTrkCode := '';
                  dtLastRaceDate := 0;
                  sLastRaceType := '';
                  sLastRaceConditions := '';
                  fLastDistance := 0;
                  sLastDistanceDesc := '';
                  sLastSurf := '';
                  sLastTrkCond := '';
                  fLastOdds := 0;

                  sLastComment2 := '';
                  sLastTopFinish1 := '';
                  sLastTopFinish2 := '';
                  sLastTopFinish3 := '';
                  sLastDQIndicator := '';
                  sLastFavoriteIndicator := '';

                  sLastDay := '';
                  sLastMonthDesc := '';
                  sLastYear := '';
                  iLastRaceNbr := 0;

                  fLastPos1stCall := 0;
                  fLastPos2ndCall := 0;
                  fLastPosStrCall := 0;
                  fLastPosFinCall := 0;

                  fLastBL1stCall := 0;
                  fLastBL2ndCall := 0;
                  fLastBLStrCall := 0;
                  fLastBLFinCall := 0;

                  fLastTime1stCall := 0;
                  fLastTime2ndCall := 0;
                  fLastTimeStrCall := 0;
                  fLastTimeFinCall := 0;

                  iLastPostPos := 0;

                  sLastGateBreak := '';
                  sLastLen1Back := '';
                  sLastLen2Back := '';
                  sLastStLenBack := '';
                  sLastFinishBeaten := '';

                  iLastWeight := 0;
                  iLastTrackVariant := 0;
                  fLastHorseTime := 0;
                  fLastSRWinner := 0;

                  iLastPurse := 0;
                  iLastClmPrice := 0;
                  sLastJockey := '';
                  sLastClaimed := '';
               end;

               dm.tblRatings.FieldByName('LastTrkCode').AsString := sLastTrkCode;
               dm.tblRatings.FieldByName('LastRaceDate').AsDateTime := dtLastRaceDate;
               dm.tblRatings.FieldByName('LastRaceNbr').AsInteger := iLastRaceNbr;
               dm.tblRatings.FieldByName('LastPostPos').AsInteger := iLastPostPos;

               dm.tblRatings.FieldByName('LastRaceType').AsString := sLastRaceType;
               dm.tblRatings.FieldByName('LastRaceConditions').AsString := sLastRaceConditions;
               dm.tblRatings.FieldByName('LastDistanceDesc').AsString := sLastDistanceDesc;
               dm.tblRatings.FieldByName('LastDistance').AsFloat := fLastDistance;

               dm.tblRatings.FieldByName('LastSurf').AsString := sLastSurf;
               dm.tblRatings.FieldByName('LastTrkCond').AsString := sLastTrkCond;
               dm.tblRatings.FieldByName('LastOdds').AsFloat := fLastOdds;

               dm.tblRatings.FieldByName('LastComment').AsString := sLastComment;
               dm.tblRatings.FieldByName('LastComment2').AsString := sLastComment2;

               dm.tblRatings.FieldByName('LastTopFinish1').AsString := sLastTopFinish1;
               dm.tblRatings.FieldByName('LastTopFinish2').AsString := sLastTopFinish2;
               dm.tblRatings.FieldByName('LastTopFinish3').AsString := sLastTopFinish3;

               dm.tblRatings.FieldByName('LastDQIndicator').AsString := sLastDQIndicator;
               dm.tblRatings.FieldByName('LastFavoriteIndicator').AsString := sLastFavoriteIndicator;
               dm.tblRatings.FieldByName('LastPurse').AsInteger := iLastPurse;
               dm.tblRatings.FieldByName('LastClmPrice').AsInteger := iLastClmPrice;
               dm.tblRatings.FieldByName('LastJockey').AsString := sLastJockey;
               dm.tblRatings.FieldByName('LastClaimed').AsString := sLastClaimed;

               dm.tblRatings.FieldByName('LastDay').AsString := sLastDay;
               dm.tblRatings.FieldByName('LastMonthDesc').AsString := sLastMonthDesc;
               dm.tblRatings.FieldByName('LastYear').AsString := sLastYear;

               dm.tblRatings.FieldByName('LastBL1stCall').AsFloat := fLastBL1stCall;
               dm.tblRatings.FieldByName('LastBL2ndCall').AsFloat := fLastBL2ndCall;
               dm.tblRatings.FieldByName('LastBLStrCall').AsFloat := fLastBLStrCall;
               dm.tblRatings.FieldByName('LastBLFinCall').AsFloat := fLastBLFinCall;

               dm.tblRatings.FieldByName('LastPos1stCall').AsFloat := fLastPos1stCall;
               dm.tblRatings.FieldByName('LastPos2ndCall').AsFloat := fLastPos2ndCall;
               dm.tblRatings.FieldByName('LastPosStrCall').AsFloat := fLastPosStrCall;
               dm.tblRatings.FieldByName('LastPosFinCall').AsFloat := fLastPosFinCall;

               dm.tblRatings.FieldByName('LastTime1stCall').AsFloat := fLastTime1stCall;
               dm.tblRatings.FieldByName('LastTime2ndCall').AsFloat := fLastTime2ndCall;
               dm.tblRatings.FieldByName('LastTimeStrCall').AsFloat := fLastTimeStrCall;
               dm.tblRatings.FieldByName('LastTimeFinCall').AsFloat := fLastTimeFinCall;

               dm.tblRatings.FieldByName('LastGateBreak').AsString := sLastGateBreak;
               dm.tblRatings.FieldByName('LastLen1Back').AsString := sLastLen1Back;
               dm.tblRatings.FieldByName('LastLen2Back').AsString := sLastLen2Back;
               dm.tblRatings.FieldByName('LastStLenBack').AsString := sLastStLenBack;
               dm.tblRatings.FieldByName('LastFinishBeaten').AsString := sLastFinishBeaten;

               dm.tblRatings.FieldByName('LastWeight').AsInteger := iLastWeight;
               dm.tblRatings.FieldByName('LastTrackVariant').AsInteger := iLastTrackVariant;
               dm.tblRatings.FieldByName('LastHorseTime').AsFloat := fLastHorseTime;
               dm.tblRatings.FieldByName('LastSRWinner').AsFloat := fLastSRWinner;

               //
               dm.tblPast.IndexName := '';
               dm.tblPast.SetKey();
               dm.tblPast.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPast.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPast.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPast.FieldByName('PPNbr').Value := 2;
               if dm.tblPast.GotoKey() then begin
                  sLastTrkCode := dm.tblPast.FieldByName('LastTrkCode').AsString;
                  iLastRaceNbr := dm.tblPast.FieldByName('LastRaceNbr').AsInteger;
                  dtLastRaceDate := dm.tblPast.FieldByName('LastRaceDate').AsDateTime;
                  iLastPostPos := dm.tblPast.FieldByName('LastPostPos').AsInteger;

                  sLastRaceType := dm.tblPast.FieldByName('LastRaceType').AsString;
                  sLastRaceConditions := dm.tblPast.FieldByName('LastRaceConditions').AsString;
                  sLastSurf := dm.tblPast.FieldByName('LastSurf').AsString;
                  if sLastSurf = 'y' then begin
                     iLastDistance := atoi(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetYardDistanceDesc(iLastDistance);
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString) / YARDS_IN_FURLONG;
                     sLastSurf := 'D';
                  end else begin
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetFurlongDistanceDesc(fLastDistance);
                  end;

                  sLastTrkCond := dm.tblPast.FieldByName('LastTrkCond').AsString;
                  fLastOdds := dm.tblPast.FieldByName('LastOdds').AsFloat;

                  fLastTime1stCall := dm.tblPast.FieldByName('LastTime1stCall').AsFloat;
                  fLastTime2ndCall := dm.tblPast.FieldByName('LastTime2ndCall').AsFloat;
                  fLastTimeStrCall := dm.tblPast.FieldByName('LastTimeStrCall').AsFloat;
                  fLastTimeFinCall := dm.tblPast.FieldByName('LastTimeFinCall').AsFloat;

                  fLastBL1stCall := dm.tblPast.FieldByName('LastBL1stCall').AsFloat;
                  fLastBL2ndCall := dm.tblPast.FieldByName('LastBL2ndCall').AsFloat;
                  fLastBLStrCall := dm.tblPast.FieldByName('LastBLStrCall').AsFloat;
                  fLastBLFinCall := dm.tblPast.FieldByName('LastBLFinCall').AsFloat;

                  fLastPos1stCall := dm.tblPast.FieldByName('LastPos1stCall').AsFloat;
                  fLastPos2ndCall := dm.tblPast.FieldByName('LastPos2ndCall').AsFloat;
                  fLastPosStrCall := dm.tblPast.FieldByName('LastPosStrCall').AsFloat;
                  fLastPosFinCall := dm.tblPast.FieldByName('LastPosFinCall').AsFloat;

                  sLastComment := dm.tblPast.FieldByName('LastComment').AsString;
                  sLastComment2 := dm.tblPast.FieldByName('LastComment2').AsString;
                  sLastTopFinish1 := dm.tblPast.FieldByName('LastTopFinish1').AsString;
                  sLastTopFinish2 := dm.tblPast.FieldByName('LastTopFinish2').AsString;
                  sLastTopFinish3 := dm.tblPast.FieldByName('LastTopFinish3').AsString;
                  sLastDQIndicator := dm.tblPast.FieldByName('LastDQIndicator').AsString;
                  sLastFavoriteIndicator := dm.tblPast.FieldByName('LastFavoriteIndicator').AsString;

                  iLastPurse := dm.tblPast.FieldByName('LastPurse').AsInteger;
                  iLastClmPrice := dm.tblPast.FieldByName('LastClmPrice').AsInteger;
                  sLastJockey := dm.tblPast.FieldByName('LastJockey').AsString;
                  sLastClaimed := dm.tblPast.FieldByName('LastClaimed').AsString;

                  sLastDay := dm.tblPast.FieldByName('LastDay').AsString;
                  sLastMonthDesc := dm.tblPast.FieldByName('LastMonthDesc').AsString;
                  sLastYear := dm.tblPast.FieldByName('LastYear').AsString;

                  sLastGateBreak := dm.tblPast.FieldByName('LastGateBreak').AsString;
                  sLastLen1Back := dm.tblPast.FieldByName('LastLen1Back').AsString;
                  sLastLen2Back := dm.tblPast.FieldByName('LastLen2Back').AsString;
                  sLastStLenBack := dm.tblPast.FieldByName('LastStLenBack').AsString;
                  sLastFinishBeaten := dm.tblPast.FieldByName('LastFinishBeaten').AsString;

                  iLastWeight := dm.tblPast.FieldByName('LastWeight').AsInteger;
                  iLastTrackVariant := dm.tblPast.FieldByName('LastTrackVariant').AsInteger;

                  fLastHorseTime := dm.tblPast.FieldByName('LastHorseTime').AsFloat;
                  fLastSRWinner := dm.tblPast.FieldByName('LastSRWinner').AsFloat;

               end else begin
                  sLastTrkCode := '';
                  dtLastRaceDate := 0;
                  sLastRaceType := '';
                  sLastRaceConditions := '';
                  fLastDistance := 0;
                  sLastDistanceDesc := '';
                  sLastSurf := '';
                  sLastTrkCond := '';
                  fLastOdds := 0;

                  sLastComment2 := '';
                  sLastTopFinish1 := '';
                  sLastTopFinish2 := '';
                  sLastTopFinish3 := '';
                  sLastDQIndicator := '';
                  sLastFavoriteIndicator := '';

                  sLastDay := '';
                  sLastMonthDesc := '';
                  sLastYear := '';
                  iLastRaceNbr := 0;

                  fLastPos1stCall := 0;
                  fLastPos2ndCall := 0;
                  fLastPosStrCall := 0;
                  fLastPosFinCall := 0;

                  fLastBL1stCall := 0;
                  fLastBL2ndCall := 0;
                  fLastBLStrCall := 0;
                  fLastBLFinCall := 0;

                  fLastTime1stCall := 0;
                  fLastTime2ndCall := 0;
                  fLastTimeStrCall := 0;
                  fLastTimeFinCall := 0;

                  iLastPostPos := 0;

                  sLastGateBreak := '';
                  sLastLen1Back := '';
                  sLastLen2Back := '';
                  sLastStLenBack := '';
                  sLastFinishBeaten := '';

                  iLastWeight := 0;
                  iLastTrackVariant := 0;
                  fLastHorseTime := 0;
                  fLastSRWinner := 0;

                  iLastPurse := 0;
                  iLastClmPrice := 0;
                  sLastJockey := '';
                  sLastClaimed := '';
               end;

               dm.tblRatings.FieldByName('Last2TrkCode').AsString := sLastTrkCode;
               dm.tblRatings.FieldByName('Last2RaceDate').AsDateTime := dtLastRaceDate;
               dm.tblRatings.FieldByName('Last2RaceNbr').AsInteger := iLastRaceNbr;
               dm.tblRatings.FieldByName('Last2PostPos').AsInteger := iLastPostPos;

               dm.tblRatings.FieldByName('Last2RaceType').AsString := sLastRaceType;
               dm.tblRatings.FieldByName('Last2RaceConditions').AsString := sLastRaceConditions;
               dm.tblRatings.FieldByName('Last2DistanceDesc').AsString := sLastDistanceDesc;
               dm.tblRatings.FieldByName('Last2Distance').AsFloat := fLastDistance;

               dm.tblRatings.FieldByName('Last2Surf').AsString := sLastSurf;
               dm.tblRatings.FieldByName('Last2TrkCond').AsString := sLastTrkCond;
               dm.tblRatings.FieldByName('Last2Odds').AsFloat := fLastOdds;

               dm.tblRatings.FieldByName('Last2Comment').AsString := sLastComment;
               dm.tblRatings.FieldByName('Last2Comment2').AsString := sLastComment2;

               dm.tblRatings.FieldByName('Last2TopFinish1').AsString := sLastTopFinish1;
               dm.tblRatings.FieldByName('Last2TopFinish2').AsString := sLastTopFinish2;
               dm.tblRatings.FieldByName('Last2TopFinish3').AsString := sLastTopFinish3;

               dm.tblRatings.FieldByName('Last2DQIndicator').AsString := sLastDQIndicator;
               dm.tblRatings.FieldByName('Last2FavoriteIndicator').AsString := sLastFavoriteIndicator;
               dm.tblRatings.FieldByName('Last2Purse').AsInteger := iLastPurse;
               dm.tblRatings.FieldByName('Last2ClmPrice').AsInteger := iLastClmPrice;
               dm.tblRatings.FieldByName('Last2Jockey').AsString := sLastJockey;
               dm.tblRatings.FieldByName('Last2Claimed').AsString := sLastClaimed;

               dm.tblRatings.FieldByName('Last2Day').AsString := sLastDay;
               dm.tblRatings.FieldByName('Last2MonthDesc').AsString := sLastMonthDesc;
               dm.tblRatings.FieldByName('Last2Year').AsString := sLastYear;

               dm.tblRatings.FieldByName('Last2BL1stCall').AsFloat := fLastBL1stCall;
               dm.tblRatings.FieldByName('Last2BL2ndCall').AsFloat := fLastBL2ndCall;
               dm.tblRatings.FieldByName('Last2BLStrCall').AsFloat := fLastBLStrCall;
               dm.tblRatings.FieldByName('Last2BLFinCall').AsFloat := fLastBLFinCall;

               dm.tblRatings.FieldByName('Last2Pos1stCall').AsFloat := fLastPos1stCall;
               dm.tblRatings.FieldByName('Last2Pos2ndCall').AsFloat := fLastPos2ndCall;
               dm.tblRatings.FieldByName('Last2PosStrCall').AsFloat := fLastPosStrCall;
               dm.tblRatings.FieldByName('Last2PosFinCall').AsFloat := fLastPosFinCall;

               dm.tblRatings.FieldByName('Last2Time1stCall').AsFloat := fLastTime1stCall;
               dm.tblRatings.FieldByName('Last2Time2ndCall').AsFloat := fLastTime2ndCall;
               dm.tblRatings.FieldByName('Last2TimeStrCall').AsFloat := fLastTimeStrCall;
               dm.tblRatings.FieldByName('Last2TimeFinCall').AsFloat := fLastTimeFinCall;

               dm.tblRatings.FieldByName('Last2GateBreak').AsString := sLastGateBreak;
               dm.tblRatings.FieldByName('Last2Len1Back').AsString := sLastLen1Back;
               dm.tblRatings.FieldByName('Last2Len2Back').AsString := sLastLen2Back;
               dm.tblRatings.FieldByName('Last2StLenBack').AsString := sLastStLenBack;
               dm.tblRatings.FieldByName('Last2FinishBeaten').AsString := sLastFinishBeaten;

               dm.tblRatings.FieldByName('Last2Weight').AsInteger := iLastWeight;
               dm.tblRatings.FieldByName('Last2TrackVariant').AsInteger := iLastTrackVariant;
               dm.tblRatings.FieldByName('Last2HorseTime').AsFloat := fLastHorseTime;
               dm.tblRatings.FieldByName('Last2SRWinner').AsFloat := fLastSRWinner;

               //
               dm.tblPast.IndexName := '';
               dm.tblPast.SetKey();
               dm.tblPast.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPast.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPast.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPast.FieldByName('PPNbr').Value := 3;
               if dm.tblPast.GotoKey() then begin
                  sLastTrkCode := dm.tblPast.FieldByName('LastTrkCode').AsString;
                  iLastRaceNbr := dm.tblPast.FieldByName('LastRaceNbr').AsInteger;
                  dtLastRaceDate := dm.tblPast.FieldByName('LastRaceDate').AsDateTime;
                  iLastPostPos := dm.tblPast.FieldByName('LastPostPos').AsInteger;

                  sLastRaceType := dm.tblPast.FieldByName('LastRaceType').AsString;
                  sLastRaceConditions := dm.tblPast.FieldByName('LastRaceConditions').AsString;
                  sLastSurf := dm.tblPast.FieldByName('LastSurf').AsString;
                  if sLastSurf = 'y' then begin
                     iLastDistance := atoi(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetYardDistanceDesc(iLastDistance);
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString) / YARDS_IN_FURLONG;
                     sLastSurf := 'D';
                  end else begin
                     fLastDistance := atof(dm.tblPast.FieldByName('LastDistanceDesc').AsString);
                     sLastDistanceDesc := GetFurlongDistanceDesc(fLastDistance);
                  end;

                  sLastTrkCond := dm.tblPast.FieldByName('LastTrkCond').AsString;
                  fLastOdds := dm.tblPast.FieldByName('LastOdds').AsFloat;

                  fLastTime1stCall := dm.tblPast.FieldByName('LastTime1stCall').AsFloat;
                  fLastTime2ndCall := dm.tblPast.FieldByName('LastTime2ndCall').AsFloat;
                  fLastTimeStrCall := dm.tblPast.FieldByName('LastTimeStrCall').AsFloat;
                  fLastTimeFinCall := dm.tblPast.FieldByName('LastTimeFinCall').AsFloat;

                  fLastBL1stCall := dm.tblPast.FieldByName('LastBL1stCall').AsFloat;
                  fLastBL2ndCall := dm.tblPast.FieldByName('LastBL2ndCall').AsFloat;
                  fLastBLStrCall := dm.tblPast.FieldByName('LastBLStrCall').AsFloat;
                  fLastBLFinCall := dm.tblPast.FieldByName('LastBLFinCall').AsFloat;

                  fLastPos1stCall := dm.tblPast.FieldByName('LastPos1stCall').AsFloat;
                  fLastPos2ndCall := dm.tblPast.FieldByName('LastPos2ndCall').AsFloat;
                  fLastPosStrCall := dm.tblPast.FieldByName('LastPosStrCall').AsFloat;
                  fLastPosFinCall := dm.tblPast.FieldByName('LastPosFinCall').AsFloat;

                  sLastComment := dm.tblPast.FieldByName('LastComment').AsString;
                  sLastComment2 := dm.tblPast.FieldByName('LastComment2').AsString;
                  sLastTopFinish1 := dm.tblPast.FieldByName('LastTopFinish1').AsString;
                  sLastTopFinish2 := dm.tblPast.FieldByName('LastTopFinish2').AsString;
                  sLastTopFinish3 := dm.tblPast.FieldByName('LastTopFinish3').AsString;
                  sLastDQIndicator := dm.tblPast.FieldByName('LastDQIndicator').AsString;
                  sLastFavoriteIndicator := dm.tblPast.FieldByName('LastFavoriteIndicator').AsString;

                  iLastPurse := dm.tblPast.FieldByName('LastPurse').AsInteger;
                  iLastClmPrice := dm.tblPast.FieldByName('LastClmPrice').AsInteger;
                  sLastJockey := dm.tblPast.FieldByName('LastJockey').AsString;
                  sLastClaimed := dm.tblPast.FieldByName('LastClaimed').AsString;

                  sLastDay := dm.tblPast.FieldByName('LastDay').AsString;
                  sLastMonthDesc := dm.tblPast.FieldByName('LastMonthDesc').AsString;
                  sLastYear := dm.tblPast.FieldByName('LastYear').AsString;

                  sLastGateBreak := dm.tblPast.FieldByName('LastGateBreak').AsString;
                  sLastLen1Back := dm.tblPast.FieldByName('LastLen1Back').AsString;
                  sLastLen2Back := dm.tblPast.FieldByName('LastLen2Back').AsString;
                  sLastStLenBack := dm.tblPast.FieldByName('LastStLenBack').AsString;
                  sLastFinishBeaten := dm.tblPast.FieldByName('LastFinishBeaten').AsString;

                  iLastWeight := dm.tblPast.FieldByName('LastWeight').AsInteger;
                  iLastTrackVariant := dm.tblPast.FieldByName('LastTrackVariant').AsInteger;

                  fLastHorseTime := dm.tblPast.FieldByName('LastHorseTime').AsFloat;
                  fLastSRWinner := dm.tblPast.FieldByName('LastSRWinner').AsFloat;

               end else begin
                  sLastTrkCode := '';
                  dtLastRaceDate := 0;
                  sLastRaceType := '';
                  sLastRaceConditions := '';
                  fLastDistance := 0;
                  sLastDistanceDesc := '';
                  sLastSurf := '';
                  sLastTrkCond := '';
                  fLastOdds := 0;

                  sLastComment2 := '';
                  sLastTopFinish1 := '';
                  sLastTopFinish2 := '';
                  sLastTopFinish3 := '';
                  sLastDQIndicator := '';
                  sLastFavoriteIndicator := '';

                  sLastDay := '';
                  sLastMonthDesc := '';
                  sLastYear := '';
                  iLastRaceNbr := 0;

                  fLastPos1stCall := 0;
                  fLastPos2ndCall := 0;
                  fLastPosStrCall := 0;
                  fLastPosFinCall := 0;

                  fLastBL1stCall := 0;
                  fLastBL2ndCall := 0;
                  fLastBLStrCall := 0;
                  fLastBLFinCall := 0;

                  fLastTime1stCall := 0;
                  fLastTime2ndCall := 0;
                  fLastTimeStrCall := 0;
                  fLastTimeFinCall := 0;

                  iLastPostPos := 0;

                  sLastGateBreak := '';
                  sLastLen1Back := '';
                  sLastLen2Back := '';
                  sLastStLenBack := '';
                  sLastFinishBeaten := '';

                  iLastWeight := 0;
                  iLastTrackVariant := 0;
                  fLastHorseTime := 0;
                  fLastSRWinner := 0;

                  iLastPurse := 0;
                  iLastClmPrice := 0;
                  sLastJockey := '';
                  sLastClaimed := '';
               end;

               dm.tblRatings.FieldByName('Last3TrkCode').AsString := sLastTrkCode;
               dm.tblRatings.FieldByName('Last3RaceDate').AsDateTime := dtLastRaceDate;
               dm.tblRatings.FieldByName('Last3RaceNbr').AsInteger := iLastRaceNbr;
               dm.tblRatings.FieldByName('Last3PostPos').AsInteger := iLastPostPos;

               dm.tblRatings.FieldByName('Last3RaceType').AsString := sLastRaceType;
               dm.tblRatings.FieldByName('Last3RaceConditions').AsString := sLastRaceConditions;
               dm.tblRatings.FieldByName('Last3DistanceDesc').AsString := sLastDistanceDesc;
               dm.tblRatings.FieldByName('Last3Distance').AsFloat := fLastDistance;

               dm.tblRatings.FieldByName('Last3Surf').AsString := sLastSurf;
               dm.tblRatings.FieldByName('Last3TrkCond').AsString := sLastTrkCond;
               dm.tblRatings.FieldByName('Last3Odds').AsFloat := fLastOdds;

               dm.tblRatings.FieldByName('Last3Comment').AsString := sLastComment;
               dm.tblRatings.FieldByName('Last3Comment2').AsString := sLastComment2;

               dm.tblRatings.FieldByName('Last3TopFinish1').AsString := sLastTopFinish1;
               dm.tblRatings.FieldByName('Last3TopFinish2').AsString := sLastTopFinish2;
               dm.tblRatings.FieldByName('Last3TopFinish3').AsString := sLastTopFinish3;

               dm.tblRatings.FieldByName('Last3DQIndicator').AsString := sLastDQIndicator;
               dm.tblRatings.FieldByName('Last3FavoriteIndicator').AsString := sLastFavoriteIndicator;
               dm.tblRatings.FieldByName('Last3Purse').AsInteger := iLastPurse;
               dm.tblRatings.FieldByName('Last3ClmPrice').AsInteger := iLastClmPrice;
               dm.tblRatings.FieldByName('Last3Jockey').AsString := sLastJockey;
               dm.tblRatings.FieldByName('Last3Claimed').AsString := sLastClaimed;

               dm.tblRatings.FieldByName('Last3Day').AsString := sLastDay;
               dm.tblRatings.FieldByName('Last3MonthDesc').AsString := sLastMonthDesc;
               dm.tblRatings.FieldByName('Last3Year').AsString := sLastYear;

               dm.tblRatings.FieldByName('Last3BL1stCall').AsFloat := fLastBL1stCall;
               dm.tblRatings.FieldByName('Last3BL2ndCall').AsFloat := fLastBL2ndCall;
               dm.tblRatings.FieldByName('Last3BLStrCall').AsFloat := fLastBLStrCall;
               dm.tblRatings.FieldByName('Last3BLFinCall').AsFloat := fLastBLFinCall;

               dm.tblRatings.FieldByName('Last3Pos1stCall').AsFloat := fLastPos1stCall;
               dm.tblRatings.FieldByName('Last3Pos2ndCall').AsFloat := fLastPos2ndCall;
               dm.tblRatings.FieldByName('Last3PosStrCall').AsFloat := fLastPosStrCall;
               dm.tblRatings.FieldByName('Last3PosFinCall').AsFloat := fLastPosFinCall;

               dm.tblRatings.FieldByName('Last3Time1stCall').AsFloat := fLastTime1stCall;
               dm.tblRatings.FieldByName('Last3Time2ndCall').AsFloat := fLastTime2ndCall;
               dm.tblRatings.FieldByName('Last3TimeStrCall').AsFloat := fLastTimeStrCall;
               dm.tblRatings.FieldByName('Last3TimeFinCall').AsFloat := fLastTimeFinCall;

               dm.tblRatings.FieldByName('Last3GateBreak').AsString := sLastGateBreak;
               dm.tblRatings.FieldByName('Last3Len1Back').AsString := sLastLen1Back;
               dm.tblRatings.FieldByName('Last3Len2Back').AsString := sLastLen2Back;
               dm.tblRatings.FieldByName('Last3StLenBack').AsString := sLastStLenBack;
               dm.tblRatings.FieldByName('Last3FinishBeaten').AsString := sLastFinishBeaten;

               dm.tblRatings.FieldByName('Last3Weight').AsInteger := iLastWeight;
               dm.tblRatings.FieldByName('Last3TrackVariant').AsInteger := iLastTrackVariant;
               dm.tblRatings.FieldByName('Last3HorseTime').AsFloat := fLastHorseTime;
               dm.tblRatings.FieldByName('Last3SRWinner').AsFloat := fLastSRWinner;

               dm.tblPP.IndexName := '';
               dm.tblPP.SetKey();
               dm.tblPP.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPP.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPP.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPP.FieldByName('PPNbr').Value := 1;
               if dm.tblPP.GotoKey() then begin
                  dm.tblRatings.FieldByName('LastRaceDesc').AsString := dm.tblPP.FieldByName('RaceDesc').AsString;
                  dm.tblRatings.FieldByName('LastSpeed').AsInteger := dm.tblPP.FieldByName('Speed').AsInteger;
                  dm.tblRatings.FieldByName('LastClass').AsInteger := dm.tblPP.FieldByName('Class').AsInteger;
               end else begin
                  dm.tblRatings.FieldByName('LastRaceDesc').AsString := '';
               end;

               dm.tblPP.IndexName := '';
               dm.tblPP.SetKey();
               dm.tblPP.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPP.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPP.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPP.FieldByName('PPNbr').Value := 2;
               if dm.tblPP.GotoKey() then begin
                  dm.tblRatings.FieldByName('Last2RaceDesc').AsString := dm.tblPP.FieldByName('RaceDesc').AsString;
                  dm.tblRatings.FieldByName('Last2Speed').AsInteger := dm.tblPP.FieldByName('Speed').AsInteger;
                  dm.tblRatings.FieldByName('Last2Class').AsInteger := dm.tblPP.FieldByName('Class').AsInteger;
               end else begin
                  dm.tblRatings.FieldByName('Last2RaceDesc').AsString := '';
               end;

               dm.tblPP.IndexName := '';
               dm.tblPP.SetKey();
               dm.tblPP.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
               dm.tblPP.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
               dm.tblPP.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
               dm.tblPP.FieldByName('PPNbr').Value := 3;
               if dm.tblPP.GotoKey() then begin
                  dm.tblRatings.FieldByName('Last3RaceDesc').AsString := dm.tblPP.FieldByName('RaceDesc').AsString;
                  dm.tblRatings.FieldByName('Last3Speed').AsInteger := dm.tblPP.FieldByName('Speed').AsInteger;
                  dm.tblRatings.FieldByName('Last3Class').AsInteger := dm.tblPP.FieldByName('Class').AsInteger;
               end else begin
                  dm.tblRatings.FieldByName('Last3RaceDesc').AsString := '';
               end;
            end;

            dm.tblRatings.Post();
            dm.tblRatings.Next();
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback;
            end;

            ClearPrgStatusBars();
         end;
      end;

      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;
   finally
      CloseTable(dm.tblRatings);
      CloseTable(dm.tblPast);
      CloseTable(dm.tblPP);

      CloseTable(dm.tblHH);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblDam);
      CloseTable(dm.tblSire);

      CloseTable(dm.tblDamSummary);
      CloseTable(dm.tblSireSummary);
      CloseTable(dm.tblDamSireSummary);

      CloseTable(dm.tblTrainerSummary);
      CloseTable(dm.tblJockeySummary);
      CloseTable(dm.tblTrainerJockeySummary);

      CloseTable(dm.tblOwnerSummary);
      CloseTable(dm.tblBreederSummary);

      CloseTable(dm.tblTrainerOwnerSummary);

      CloseTable(dm.tblTrainer1To45Summary);
      CloseTable(dm.tblTrainer46To120Summary);
      CloseTable(dm.tblTrainer120PlusSummary);

      CloseTable(dm.tblTrainer1To45WorkSummary);
      CloseTable(dm.tblTrainer46To120WorkSummary);
      CloseTable(dm.tblTrainer120PlusWorkSummary);

      CloseTable(dm.tblTrainerDebutSummary);
      CloseTable(dm.tblTrainerDebutTwoSummary);

      CloseTable(dm.tblTrainerFirstJuiceSummary);
      CloseTable(dm.tblTrainerSecondJuiceSummary);

      CloseTable(dm.tblTrainerBlinkersOnSummary);
      CloseTable(dm.tblTrainerBlinkersOffSummary);

      ClearPrgStatusBars();
   end;

end;

end.
