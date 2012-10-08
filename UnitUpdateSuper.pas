unit UnitUpdateSuper;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateATrainerList
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblATL: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar
   );


procedure UpdateTrnJkyOwnSireRanks
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   tblTrn: TDBISAMTable;
   tblJky: TDBISAMTable;
   tblOwn: TDBISAMTable;
   tblSire: TDBISAMTable;
   tblTrackLeaders: TDBISAMTable;
   tblOwnSummary: TDBISAMTable;

   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;

var
   qrySQL: TDBISAMQuery;


procedure UpdateTrnJkyOwnSireRanks
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   tblTrn: TDBISAMTable;
   tblJky: TDBISAMTable;
   tblOwn: TDBISAMTable;
   tblSire: TDBISAMTable;
   tblTrackLeaders: TDBISAMTable;
   tblOwnSummary: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

var

   bSuperTrainer: boolean;
   bSuperOwner: boolean;
   bSuperJockey: boolean;

   sOwner: string;
   sTrnKey: string;
   sJkyKey: string;

   iStaCnt: integer;
   iTotalCnt: integer;

   iTrnWinsRank: integer;
   iTrnEarningsRank: integer;
   iTrnTrackRank: integer;

   iJkyWinsRank: integer;
   iJkyEarningsRank: integer;
   iJkyTrackRank: integer;

   iOwnWinsRank: integer;
   iOwnEarningsRank: integer;

   iSireTurfLastYearRank: integer;
   iSireTurfLastYearPctOfEarnings: integer;
   iSireGeneralLastYearRank: integer;
   iSireJuvenileLastYearRank: integer;

   iSireTurfThisYearRank: integer;
   iSireTurfThisYearPctOfEarnings: integer;
   iSireGeneralThisYearRank: integer;
   iSireJuvenileThisYearRank: integer;

   iDamSireTurfLastYearRank: integer;
   iDamSireTurfLastYearPctOfEarnings: integer;
   iDamSireGeneralLastYearRank: integer;
   iDamSireJuvenileLastYearRank: integer;

   iDamSireTurfThisYearRank: integer;
   iDamSireTurfThisYearPctOfEarnings: integer;
   iDamSireGeneralThisYearRank: integer;
   iDamSireJuvenileThisYearRank: integer;

   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;

   iAge: integer;


   iTotalOwnStarts: integer;
   iTotalOwnWins: integer;
   fTotalOwnWinPct: double;
   iTotalOwnTop3WinPct: integer;

   iPowerRank: integer;
begin

   hLog.AddToLog('UpdateSuperJockeyTrainer', msevOperation);

   try
      try
         OpenTable(tblR);
         OpenTable(tblE);

         OpenTable(tblOwn);
         OpenTable(tblTrn);
         OpenTable(tblJky);
         OpenTable(tblTrk);

         OpenTable(tblTrackLeaders);
         OpenTable(tblSire);

         OpenTable(tblOwnSummary);

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();

            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Update Super Jockey/Trainer/Owner ');
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
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

            if tblR.GotoKey() then begin
               iPowerRank := tblE.FieldByName('PowerRank').AsInteger;
               sOwner := tblE.FieldByName('Owner').AsString;
               tblE.Edit();

               bSuperTrainer := False;
               bSuperJockey := False;
               bSuperOwner := False;

               // Trainer-Jockey-Owner rankings
               tblOwnSummary.IndexName := '';
               tblOwnSummary.SetKey();
               tblOwnSummary.FieldByName('Owner').AsString := UpperCase(sOwner);

               if (tblOwnSummary.GotoKey()) then begin
                  iTotalOwnStarts := tblOwnSummary.FieldByName('Starts').AsInteger;
                  iTotalOwnWins := tblOwnSummary.FieldByName('Wins').AsInteger;
                  fTotalOwnWinPct := Round(tblOwnSummary.FieldByName('WinPct').AsFloat * 100) / 100;
                  iTotalOwnTop3WinPct := 0;
               end else begin
                  iTotalOwnStarts := 0;
                  iTotalOwnWins := 0;
                  fTotalOwnWinPct := 0;
                  iTotalOwnTop3WinPct := 0;
               end;

               //
               iTrnWinsRank := 0;
               iTrnEarningsRank := 0;
               bSuperTrainer := False;

               sTrnKey := tblE.FieldByName('Trainer').AsString;
               tblTrn.IndexName := '';
               tblTrn.SetKey();
               tblTrn.FieldByName('Trainer').AsString := sTrnKey;

               if tblTrn.GotoKey() then begin
                  if (MonthOfTheYear(gedtOverrideDate) < 2) then begin
                     iTrnWinsRank := tblTrn.FieldByName('WinsLastYearRank').AsInteger;
                     iTrnEarningsRank := tblTrn.FieldByName('EarningsLastYearRank').AsInteger;
                     if iTrnWinsRank = 9999 then begin
                        iTrnWinsRank := 0;
                     end;
                     if iTrnEarningsRank = 9999 then begin
                        iTrnEarningsRank := 0;
                     end;
                     if (tblTrn.FieldByName('WinsLastYearRank').AsInteger < AVERAGE_T_RANK) then begin
                        bSuperTrainer := True;
                     end;
                     if (tblTrn.FieldByName('EarningsLastYearRank').AsInteger < AVERAGE_T_RANK) then begin
                        bSuperTrainer := True;
                     end;
                  end else begin
                     iTrnWinsRank := tblTrn.FieldByName('WinsThisYearRank').AsInteger;
                     iTrnEarningsRank := tblTrn.FieldByName('EarningsThisYearRank').AsInteger;
                     if iTrnWinsRank = 9999 then begin
                        iTrnWinsRank := 0;
                     end;
                     if iTrnEarningsRank = 9999 then begin
                        iTrnEarningsRank := 0;
                     end;
                     if (tblTrn.FieldByName('WinsThisYearRank').AsInteger < AVERAGE_T_RANK) then begin
                        bSuperTrainer := True;
                     end;
                     if (tblTrn.FieldByName('EarningsThisYearRank').AsInteger < AVERAGE_T_RANK) then begin
                        bSuperTrainer := True;
                     end;
                  end;
               end else begin
                  bSuperTrainer := False;
               end;

               //
               tblTrackLeaders.IndexName := '';
               tblTrackLeaders.SetKey();
               tblTrackLeaders.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblTrackLeaders.FieldByName('Name').AsString := tblTrn.FieldByName('Trainer').AsString;
               tblTrackLeaders.FieldByName('Type').AsString := 'T';
               iTrnTrackRank := 0;

               if tblTrackLeaders.GotoKey() then begin
                  iTrnTrackRank := tblTrackLeaders.FieldByName('Rank').AsInteger;
               end;

               //
               iJkyWinsRank := 0;
               iJkyEarningsRank := 0;
               bSuperJockey := False;

               sJkyKey := tblE.FieldByName('Jockey').AsString;
               tblJky.IndexName := '';
               tblJky.SetKey();
               tblJky.FieldByName('Jockey').AsString := sJkyKey;

               if tblJky.GotoKey() then begin
                  if (MonthOfTheYear(gedtOverrideDate) < 2) then begin
                     iJkyWinsRank := tblJky.FieldByName('WinsLastYearRank').AsInteger;
                     iJkyEarningsRank := tblJky.FieldByName('EarningsLastYearRank').AsInteger;
                     if iJkyWinsRank = 9999 then begin
                        iJkyWinsRank := 0;
                     end;
                     if iJkyEarningsRank = 9999 then begin
                        iJkyEarningsRank := 0;
                     end;
                     if (tblJky.FieldByName('WinsLastYearRank').AsInteger < AVERAGE_J_RANK) then begin
                        bSuperJockey := True;
                     end;
                     if (tblJky.FieldByName('EarningsLastYearRank').AsInteger < AVERAGE_J_RANK) then begin
                        bSuperJockey := True;
                     end;
                  end else begin
                     iJkyWinsRank := tblJky.FieldByName('WinsThisYearRank').AsInteger;
                     iJkyEarningsRank := tblJky.FieldByName('EarningsThisYearRank').AsInteger;
                     if iJkyWinsRank = 9999 then begin
                        iJkyWinsRank := 0;
                     end;
                     if iJkyEarningsRank = 9999 then begin
                        iJkyEarningsRank := 0;
                     end;
                     if (tblJky.FieldByName('WinsThisYearRank').AsInteger < AVERAGE_J_RANK) then begin
                        bSuperJockey := True;
                     end;
                     if (tblJky.FieldByName('EarningsThisYearRank').AsInteger < AVERAGE_J_RANK) then begin
                        bSuperJockey := True;
                     end;
                  end;
               end else begin
                  bSuperJockey := False;
               end;

               //
               tblTrackLeaders.IndexName := '';
               tblTrackLeaders.SetKey();
               tblTrackLeaders.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblTrackLeaders.FieldByName('Name').AsString := tblJky.FieldByName('Jockey').AsString;
               tblTrackLeaders.FieldByName('Type').AsString := 'J';
               iJkyTrackRank := 0;

               if tblTrackLeaders.GotoKey() then begin
                  iJkyTrackRank := tblTrackLeaders.FieldByName('Rank').AsInteger;
               end;

               //
               sOwner := tblE.FieldByName('Owner').AsString;
               iOwnWinsRank := 0;
               iOwnEarningsRank := 0;
               bSuperOwner := False;

               tblOwn.IndexName := '';
               tblOwn.SetKey();
               tblOwn.FieldByName('Owner').AsString := UpperCase(sOwner);

               if tblOwn.GotoKey() then begin
                  if (MonthOfTheYear(gedtOverrideDate) < 3) then begin

                     iOwnWinsRank := tblOwn.FieldByName('WinsLastYearRank').AsInteger;
                     iOwnEarningsRank := tblOwn.FieldByName('EarningsLastYearRank').AsInteger;

                     if (iOwnWinsRank < AVERAGE_O_RANK) then begin
                        if (iOwnWinsRank <> 9999) then begin
                           bSuperOwner := True;
                        end;
                     end;
                     if (iOwnEarningsRank < AVERAGE_O_RANK) then begin
                        if (iOwnEarningsRank <> 9999) then begin
                           bSuperOwner := True;
                        end;
                     end;
                     if ((iOwnWinsRank > 0) and (iOwnWinsRank <> 9999)) or ((iOwnEarningsRank > 0) and (iOwnEarningsRank <> 9999)) then begin
                        if (fTotalOwnWinPct <= 0.00) then begin
                           iTotalOwnStarts := tblOwn.FieldByName('StartsLastYear').AsInteger;
                           iTotalOwnWins := tblOwn.FieldByName('WinsLastYear').AsInteger;

                           fTotalOwnWinPct := tblOwn.FieldByName('WinPctLastYear').AsFloat;
                           iTotalOwnTop3WinPct := tblOwn.FieldByName('Top3WinPctLastYear').AsInteger;
                           //if (iPowerRank = 1) or (iPowerRank = 2) or (iPowerRank = 3) then begin
                           //   fTotalOwnWinPct := tblOwn.FieldByName('Top3WinPctLastYear').AsFloat;
                           //end;
                        end;
                     end;
                  end else begin
                     iOwnWinsRank := tblOwn.FieldByName('WinsThisYearRank').AsInteger;
                     iOwnEarningsRank := tblOwn.FieldByName('EarningsThisYearRank').AsInteger;

                     if (iOwnWinsRank < AVERAGE_O_RANK) then begin
                        if (iOwnWinsRank <> 9999) then begin
                           bSuperOwner := True;
                        end;
                     end;
                     if (iOwnEarningsRank < AVERAGE_O_RANK) then begin
                        if (iOwnEarningsRank <> 9999) then begin
                           bSuperOwner := True;
                        end;
                     end;

                     if ((iOwnWinsRank > 0) and (iOwnWinsRank <> 9999)) or ((iOwnEarningsRank > 0) and (iOwnEarningsRank <> 9999)) then begin
                        if (fTotalOwnWinPct <= 0.00) then begin
                           iTotalOwnStarts := tblOwn.FieldByName('StartsThisYear').AsInteger;
                           iTotalOwnWins := tblOwn.FieldByName('WinsThisYear').AsInteger;
                           fTotalOwnWinPct := tblOwn.FieldByName('WinPctThisYear').AsFloat;
                           iTotalOwnTop3WinPct := tblOwn.FieldByName('Top3WinPctThisYear').AsInteger;
                           //if (iPowerRank = 1) or (iPowerRank = 2) or (iPowerRank = 3) then begin
                           //   fTotalOwnWinPct := tblOwn.FieldByName('Top3WinPctThisYear').AsFloat;
                           //end;
                        end;
                     end;

                  end;
               end else begin
                  bSuperOwner := False;
               end;

               //
               tblSire.IndexName := '';
               tblSire.SetKey();
               tblSire.FieldByName('SireName').Value := LeftStr(tblE.FieldByName('Sire').AsString, 17);

               if (tblSire.GotoKey()) then begin
                  iSireTurfLastYearRank := tblSire.FieldByName('TurfLastYearRank').AsInteger;
                  iSireTurfLastYearPctOfEarnings := tblSire.FieldByName('TurfLastYearPctOfEarnings').AsInteger;
                  iSireGeneralLastYearRank := tblSire.FieldByName('GeneralLastYearRank').AsInteger;
                  iSireJuvenileLastYearRank := tblSire.FieldByName('JuvenileLastYearRank').AsInteger;

                  iSireTurfThisYearRank := tblSire.FieldByName('TurfThisYearRank').AsInteger;
                  iSireTurfThisYearPctOfEarnings := tblSire.FieldByName('TurfThisYearPctOfEarnings').AsInteger;
                  iSireGeneralThisYearRank := tblSire.FieldByName('GeneralThisYearRank').AsInteger;
                  iSireJuvenileThisYearRank := tblSire.FieldByName('JuvenileThisYearRank').AsInteger;
               end;

               tblSire.IndexName := '';
               tblSire.SetKey();
               tblSire.FieldByName('SireName').Value := LeftStr(tblE.FieldByName('DamSire').AsString, 17);

               if (tblSire.GotoKey()) then begin
                  iDamSireTurfLastYearRank := tblSire.FieldByName('TurfLastYearRank').AsInteger;
                  iDamSireTurfLastYearPctOfEarnings := tblSire.FieldByName('TurfLastYearPctOfEarnings').AsInteger;
                  iDamSireGeneralLastYearRank := tblSire.FieldByName('GeneralLastYearRank').AsInteger;
                  iDamSireJuvenileLastYearRank := tblSire.FieldByName('JuvenileLastYearRank').AsInteger;

                  iDamSireTurfThisYearRank := tblSire.FieldByName('TurfThisYearRank').AsInteger;
                  iDamSireTurfThisYearPctOfEarnings := tblSire.FieldByName('TurfThisYearPctOfEarnings').AsInteger;
                  iDamSireGeneralThisYearRank := tblSire.FieldByName('GeneralThisYearRank').AsInteger;
                  iDamSireJuvenileThisYearRank := tblSire.FieldByName('JuvenileThisYearRank').AsInteger;
               end;


               //
               tblE.FieldByName('SireTurfThisYearRank').AsInteger := iSireTurfThisYearRank;
               tblE.FieldByName('SireTurfLastYearRank').AsInteger := iSireTurfLastYearRank;

               tblE.FieldByName('SireTurfThisYearPctOfEarnings').AsInteger := iSireTurfThisYearPctOfEarnings;
               tblE.FieldByName('SireTurfLastYearPctOfEarnings').AsInteger := iSireTurfLastYearPctOfEarnings;

               tblE.FieldByName('SireGeneralThisYearRank').AsInteger := iSireGeneralThisYearRank;
               tblE.FieldByName('SireGeneralLastYearRank').AsInteger := iSireGeneralLastYearRank;

               tblE.FieldByName('SireJuvenileThisYearRank').AsInteger := iSireJuvenileThisYearRank;
               tblE.FieldByName('SireJuvenileLastYearRank').AsInteger := iSireJuvenileLastYearRank;

               //
               tblE.FieldByName('DamSireTurfThisYearRank').AsInteger := iDamSireTurfThisYearRank;
               tblE.FieldByName('DamSireTurfLastYearRank').AsInteger := iDamSireTurfLastYearRank;

               tblE.FieldByName('DamSireTurfThisYearPctOfEarnings').AsInteger := iDamSireTurfThisYearPctOfEarnings;
               tblE.FieldByName('DamSireTurfLastYearPctOfEarnings').AsInteger := iDamSireTurfLastYearPctOfEarnings;

               tblE.FieldByName('DamSireGeneralThisYearRank').AsInteger := iDamSireGeneralThisYearRank;
               tblE.FieldByName('DamSireGeneralLastYearRank').AsInteger := iDamSireGeneralLastYearRank;

               tblE.FieldByName('DamSireJuvenileThisYearRank').AsInteger := iDamSireJuvenileThisYearRank;
               tblE.FieldByName('DamSireJuvenileLastYearRank').AsInteger := iDamSireJuvenileLastYearRank;


               //
               if (tblE.FieldByName('TotalTrnOddsWinPct').AsInteger < 20) then begin
                  bSuperTrainer := False;
               end;

               //
               if (tblE.FieldByName('TotalTrnOddsWinPct').AsInteger < 20) then begin
                  bSuperTrainer := False;
               end;

               //
               if (fTotalOwnWinPct < 20) then begin
                  bSuperOwner := False;
               end;


               tblE.FieldByName('IsSuperTrainer').AsBoolean := bSuperTrainer;
               tblE.FieldByName('IsSuperOwner').AsBoolean := bSuperOwner;
               tblE.FieldByName('IsSuperJockey').AsBoolean := bSuperJockey;

               tblE.FieldByName('TrnTrackRank').AsInteger := iTrnTrackRank;
               tblE.FieldByName('JkyTrackRank').AsInteger := iJkyTrackRank;

               tblE.FieldByName('TrnWinsRank').AsInteger := iTrnWinsRank;
               tblE.FieldByName('TrnEarningsRank').AsInteger := iTrnEarningsRank;

               tblE.FieldByName('JkyWinsRank').AsInteger := iJkyWinsRank;
               tblE.FieldByName('JkyEarningsRank').AsInteger := iJkyEarningsRank;

               tblE.FieldByName('OwnWinsRank').AsInteger := iOwnWinsRank;
               tblE.FieldByName('OwnEarningsRank').AsInteger := iOwnEarningsRank;

               tblE.FieldByName('TotalOwnStarts').AsInteger := iTotalOwnStarts;
               tblE.FieldByName('TotalOwnWins').AsInteger := iTotalOwnWins;

               tblE.FieldByName('TotalOwnWinPct').AsFloat := fTotalOwnWinPct;
               tblE.FieldByName('TotalOwnTop3WinPct').AsInteger := iTotalOwnTop3WinPct;

               //
               iAge := tblE.FieldByName('Age').AsInteger;

               fClassRating := tblE.FieldByName('ClassRating').AsFloat;
               fTurfRating := tblE.FieldByName('TurfRating').AsFloat;
               fMudRating := tblE.FieldByName('MudRating').AsFloat;

               if (iSireGeneralThisYearRank > 0) and (iSireGeneralThisYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iSireGeneralLastYearRank > 0) and (iSireGeneralLastYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iAge = 2) then begin
                  if (iSireJuvenileThisYearRank > 0) and (iSireJuvenileThisYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iAge = 2) then begin
                  if (iSireJuvenileLastYearRank > 0) and (iSireJuvenileLastYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iSireTurfThisYearRank > 0) and (iSireTurfThisYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               if (iSireTurfLastYearRank > 0) and (iSireTurfLastYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               if (iDamSireGeneralThisYearRank > 0) and (iDamSireGeneralThisYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iDamSireGeneralLastYearRank > 0) and (iDamSireGeneralLastYearRank < 100) then begin
                  fClassRating := fClassRating + 1;
               end;

               if (iAge = 2) then begin
                  if (iDamSireJuvenileThisYearRank > 0) and (iDamSireJuvenileThisYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iAge = 2) then begin
                  if (iDamSireJuvenileLastYearRank > 0) and (iDamSireJuvenileLastYearRank < 100) then begin
                     fClassRating := fClassRating + 1;
                  end;
               end;

               if (iDamSireTurfThisYearRank > 0) and (iDamSireTurfThisYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               if (iDamSireTurfLastYearRank > 0) and (iDamSireTurfLastYearRank < 100) then begin
                  fTurfRating := fTurfRating + 1;
               end;

               //         tblE.FieldByName('ClassRating').AsFloat := fClassRating;
                //        tblE.FieldByName('TurfRating').AsFloat := fTurfRating;
                //        tblE.FieldByName('MudRating').AsFloat := fMudRating;


               tblE.Post();

               //               tblR.Post();

            end;

            tblE.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit();
      end;

      CloseTable(tblR);
      CloseTable(tblE);

      CloseTable(tblTrk);

      CloseTable(tblOwn);
      CloseTable(tblJky);
      CloseTable(tblTrn);

      CloseTable(tblTrackLeaders);
      CloseTable(tblSire);
      CloseTable(tblOwnSummary);

      ClearPrgStatusBars();
   end;

end;


procedure UpdateATrainerList
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblATL: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar
   );

var


   iStaCnt: integer;
   iTotalCnt: integer;


begin

   hLog.AddToLog('UpdateATL', msevOperation);

   try
      try
         OpenTable(tblR);
         OpenTable(tblE);

         OpenTable(tblATL);

         InitPrgBar(tblATL.RecordCount);

         tblATL.First();

         while not tblATL.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();


            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblATL.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblATL.FieldByName('RaceDate').Value;
            //      tblR.FieldByName('RangeRaceDate').Value := tblATL.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblATL.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin

               tblE.IndexName := '';
               tblE.SetKey();
               tblE.FieldByName('TrkCode').Value := tblATL.FieldByName('TrkCode').Value;
               tblE.FieldByName('RaceDate').Value := tblATL.FieldByName('RaceDate').Value;
               tblE.FieldByName('RaceNbr').Value := tblATL.FieldByName('RaceNbr').Value;
               tblE.FieldByName('PostPos').Value := tblATL.FieldByName('PostPos').Value;

               if tblE.GotoKey() then begin

                  tblATL.Edit();
                  //
                  tblATL.FieldByName('SireTurfThisYearRank').AsInteger := tblE.FieldByName('SireTurfThisYearRank').AsInteger;
                  tblATL.FieldByName('SireTurfLastYearRank').AsInteger := tblE.FieldByName('SireTurfLastYearRank').AsInteger;

                  tblATL.FieldByName('SireGeneralThisYearRank').AsInteger := tblE.FieldByName('SireGeneralThisYearRank').AsInteger;
                  tblATL.FieldByName('SireGeneralLastYearRank').AsInteger := tblE.FieldByName('SireGeneralLastYearRank').AsInteger;

                  tblATL.FieldByName('SireJuvenileThisYearRank').AsInteger := tblE.FieldByName('SireJuvenileThisYearRank').AsInteger;
                  tblATL.FieldByName('SireJuvenileLastYearRank').AsInteger := tblE.FieldByName('SireJuvenileLastYearRank').AsInteger;

                  //
                  tblATL.FieldByName('DamSireTurfThisYearRank').AsInteger := tblE.FieldByName('DamSireTurfThisYearRank').AsInteger;
                  tblATL.FieldByName('DamSireTurfLastYearRank').AsInteger := tblE.FieldByName('DamSireTurfLastYearRank').AsInteger;

                  tblATL.FieldByName('DamSireGeneralThisYearRank').AsInteger := tblE.FieldByName('DamSireGeneralThisYearRank').AsInteger;
                  tblATL.FieldByName('DamSireGeneralLastYearRank').AsInteger := tblE.FieldByName('DamSireGeneralLastYearRank').AsInteger;

                  tblATL.FieldByName('DamSireJuvenileThisYearRank').AsInteger := tblE.FieldByName('DamSireJuvenileThisYearRank').AsInteger;
                  tblATL.FieldByName('DamSireJuvenileLastYearRank').AsInteger := tblE.FieldByName('DamSireJuvenileLastYearRank').AsInteger;


                  //
                  tblATL.FieldByName('TrnTrackRank').AsInteger := tblE.FieldByName('TrnTrackRank').AsInteger;
                  tblATL.FieldByName('JkyTrackRank').AsInteger := tblE.FieldByName('JkyTrackRank').AsInteger;

                  tblATL.FieldByName('TrnWinsRank').AsInteger := tblE.FieldByName('TrnWinsRank').AsInteger;
                  tblATL.FieldByName('TrnEarningsRank').AsInteger := tblE.FieldByName('TrnEarningsRank').AsInteger;

                  tblATL.FieldByName('JkyWinsRank').AsInteger := tblE.FieldByName('JkyWinsRank').AsInteger;
                  tblATL.FieldByName('JkyEarningsRank').AsInteger := tblE.FieldByName('JkyEarningsRank').AsInteger;

                  tblATL.FieldByName('OwnWinsRank').AsInteger := tblE.FieldByName('OwnWinsRank').AsInteger;
                  tblATL.FieldByName('OwnEarningsRank').AsInteger := tblE.FieldByName('OwnEarningsRank').AsInteger;

                  if (tblATL.FieldByName('OwnWinsRank').AsInteger = 9999) then begin
                     tblATL.FieldByName('OwnWinsRank').AsInteger := 0;
                  end;

                  if (tblATL.FieldByName('OwnEarningsRank').AsInteger = 9999) then begin
                     tblATL.FieldByName('OwnEarningsRank').AsInteger := 0;
                  end;

                  tblATL.FieldByName('EstTimeOfRace').AsDateTime := tblE.FieldByName('EstTimeOfRace').AsDateTime;
                  tblATL.FieldByName('IsPrinted').AsBoolean := tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean;



                  tblATL.FieldByName('ValueROICnt').AsInteger := tblE.FieldByName('ValueROICnt').AsInteger;
                  tblATL.FieldByName('ValueROI').AsFloat := tblE.FieldByName('ValueROI').AsFloat;


                  tblATL.FieldByName('TodaysWagerOrder').AsString := tblR.FieldByName('TodaysWagerOrder').AsString;
                  tblATL.FieldByName('Pick3').AsString := tblR.FieldByName('Pick3').AsString;

                  tblATL.Post();
               end;
            end;
            tblATL.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally

      CloseTable(tblR);
      CloseTable(tblE);

      CloseTable(tblATL);

      ClearPrgStatusBars();


   end;
end;

end.
