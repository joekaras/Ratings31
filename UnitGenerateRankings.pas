unit UnitGenerateRankings;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, UnitCommonCode;

procedure GenerateRankingStats(bOneDay: boolean; iNbrOfDays: integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, ESBMaths2;


procedure AddRankingStat(sType: string; sName: string; aL: TLArray; ad: TDArray; adMin: TDArray; adMax: TDArray);
var
   iRow: integer;
   iCol: integer;
   iCnt: integer;
   fStarts: double;
   fWins: double;
   fWinPct: double;
   fWinsPlcs: double;
   fPlcPct: double;
   fWinsPlcsShos: double;

   fShoPct: double;
   fTotalOdds: double;
   fTotalWinOdds: double;
   fAvgOdds: double;
   fAvgWinOdds: double;

   fIVRunners: double;
   fIVWinners: double;

   fIVRunnersAllRaces: double;
   fIVWinnersAllRaces: double;

   fIV: double;

   fMinOdds: double;
   fMaxOdds: double;

   fMinWinOdds: double;
   fMaxWinOdds: double;

   fIVGroupWinnersPct: double;
   fIVGroupRunnersPct: double;

begin
   try

      fMinOdds := 0;
      fMaxOdds := 0;

      fMinWinOdds := 0;
      fMaxWinOdds := 0;

      fIVRunners := 0;
      fIVWinners := 0;

      fIVRunnersAllRaces := 0;
      fIVWinnersAllRaces := 0;

      // First time to write out recs and accum for IV totals
      for iRow := 1 to MAX_ROWS do begin
         // Check if anything in counters - no need to add if not
         iCnt := SumLArray(aL[iRow]);

         if (iCnt > 0) then begin

            dm.tblRankingStats.Append;
            dm.tblRankingStats.FieldByName('Name').AsString := sName;
            dm.tblRankingStats.FieldByName('Type').AsString := sType;
            dm.tblRankingStats.FieldByName('Rank').AsInteger := iRow;
            dm.tblRankingStats.FieldByName('Starts').AsInteger := SumLArray(aL[iRow]);

            for iCol := 1 to MAX_COLS do begin
               dm.tblRankingStats.Fields.FieldByNumber(iCol + FLD_OFFSET).AsInteger := aL[iRow, iCol];
               dm.tblRankingStats.Fields.FieldByNumber(iCol + FLD_OFFSET + MAX_COLS).AsFloat := RoundTo(aD[iRow, iCol], -2);
            end;

            fStarts := SumLArray(aL[iRow]);

            fTotalOdds := SumSArray(aD[iRow]);
            fTotalWinOdds := ad[iRow, 1];

            fMinWinOdds := adMin[iRow, 1];
            fMaxWinOdds := adMax[iRow, 1];

            fMinOdds := MinSArray(adMin[iRow]);
            fMaxOdds := MaxSArray(adMax[iRow]);

            fWins := aL[iRow, 1];
            fWinsPlcs := aL[iRow, 1] + aL[iRow, 3];
            fWinsPlcsShos := aL[iRow, 1] + aL[iRow, 3] + aL[iRow, 3];

            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
               fPlcPct := (fWinsPlcs / fStarts) * 100;
               fShoPct := (fWinsPlcsShos / fStarts) * 100;
            end else begin
               fWinPct := 0;
               fPlcPct := 0;
               fShoPct := 0;
            end;

            if (fStarts > 0) then begin
               fAvgOdds := fTotalOdds / fStarts;
            end else begin
               fAvgOdds := 0;
            end;

            if (fWins > 0) then begin
               fAvgWinOdds := fTotalWinOdds / fWins;
            end
            else begin
               fAvgWinOdds := 0;
            end;

            fIVWinners := aL[iRow, 1];
            fIVRunners := SumLArray(aL[iRow]);

            fIVWinnersAllRaces := fIVWinnersAllRaces + aL[iRow, 1];
            fIVRunnersAllRaces := fIVRunnersAllRaces + SumLArray(aL[iRow]);

            dm.tblRankingStats.FieldByName('WinPct').AsFloat := Round((fWinPct * 100) / 100);
            dm.tblRankingStats.FieldByName('PlcPct').AsFloat := Round((fPlcPct * 100) / 100);
            dm.tblRankingStats.FieldByName('ShoPct').AsFloat := Round((fShoPct * 100) / 100);

            dm.tblRankingStats.FieldByName('Wins').AsFloat := fWins;
            dm.tblRankingStats.FieldByName('WinsPlcs').AsFloat := fWinsPlcs;
            dm.tblRankingStats.FieldByName('WinsPlcsShos').AsFloat := fWinsPlcsShos;

            dm.tblRankingStats.FieldByName('MinOdds').AsFloat := RoundTo(fMinOdds, -2);
            if (dm.tblRankingStats.FieldByName('MinOdds').AsFloat = 9999) then begin
               dm.tblRankingStats.FieldByName('MinOdds').AsFloat := 0;
            end;
            dm.tblRankingStats.FieldByName('MaxOdds').AsFloat := RoundTo(fMaxOdds, -2);

            dm.tblRankingStats.FieldByName('MinWinOdds').AsFloat := RoundTo(fMinWinOdds, -2);
            if (dm.tblRankingStats.FieldByName('MinWinOdds').AsFloat = 9999) then begin
               dm.tblRankingStats.FieldByName('MinWinOdds').AsFloat := 0;
            end;
            dm.tblRankingStats.FieldByName('MaxWinOdds').AsFloat := RoundTo(fMaxWinOdds, -2);

            dm.tblRankingStats.FieldByName('AvgOdds').AsFloat := RoundTo(fAvgOdds, -2);
            dm.tblRankingStats.FieldByName('AvgWinOdds').AsFloat := RoundTo(fAvgWinOdds, -2);

            dm.tblRankingStats.FieldByName('TotalOdds').AsFloat := RoundTo(fTotalOdds, -2);
            dm.tblRankingStats.FieldByName('TotalWinOdds').AsFloat := RoundTo(fTotalWinOdds, -2);

            dm.tblRankingStats.FieldByName('ValueBet').AsFloat := RoundTo((fAvgWinOdds * fWinPct) / 100, -2);
            dm.tblRankingStats.FieldByName('BEWinPct').AsFloat := RoundTo((1 / (fAvgWinOdds + 1)) * 100, -2);

            dm.tblRankingStats.FieldByName('AvgWinOddsWinPct').AsFloat := RoundTo((1 / (fAvgWinOdds + 1)) * 100, -2);

            dm.tblRankingStats.FieldByName('IVRunners').AsFloat := fIVRunners;
            dm.tblRankingStats.FieldByName('IVWinners').AsFloat := fIVWinners;
            dm.tblRankingStats.FieldByName('IVRunnersAllRaces').AsFloat := fIVRunnersAllRaces;
            dm.tblRankingStats.FieldByName('IVWinnersAllRaces').AsFloat := fIVWinnersAllRaces;
            dm.tblRankingStats.FieldByName('IVGroupWinnersPct').AsFloat := fIVGroupWinnersPct;
            dm.tblRankingStats.FieldByName('IVGroupRunnersPct').AsFloat := fIVGroupRunnersPct;
            dm.tblRankingStats.FieldByName('IV').AsFloat := RoundTo(fIV, -2);

            //--******************************************************************************
            //-- ROI is calculated by summing winning wagers and subtracting from that sum,
            //-- the amount wagered (minus refunds), and
            //-- then dividing that total by the amount wagered; expressing the total as a
            //-- percentage. $1 ROI
            //--******************************************************************************
            if (fIVRunners > 0) then begin
               dm.tblRankingStats.FieldByName('IVRoi').AsFloat := RoundTo((fTotalWinOdds / fIVRunners), -2);
            end else begin
               dm.tblRankingStats.FieldByName('IVRoi').AsFloat := 0;
            end;

            dm.tblRankingStats.Post;
         end;
      end;

      // Second  time for IV
      for iRow := 1 to MAX_ROWS do begin
         // Check if anything in counters - no need to add if not
         iCnt := SumLArray(aL[iRow]);

         if (iCnt > 0) then begin

            dm.tblRankingStats.IndexName := '';
            dm.tblRankingStats.SetKey();
            dm.tblRankingStats.FieldByName('Name').AsString := sName;
            dm.tblRankingStats.FieldByName('Rank').AsInteger := iRow;

            if (dm.tblRankingStats.GotoKey()) then begin

               dm.tblRankingStats.Edit;
               if (fIVWinnersAllRaces > 0) and (fIVRunnersAllRaces > 0) then begin
                  // I.V. = (group percentage of winners) / (group percentage of runners)
                  //powerank = 1 horses won 4064
                  //all horses won 13182
                  //4064/13182 = .308%
                  //
                  //powerrank=1 starters = 13106
                  //all horse starters= 104052
                  //13106/104052= .1259%
                  //
                  //.308/.1259= 2.44

                  fIVRunners := dm.tblRankingStats.FieldByName('IVRunners').AsFloat;
                  fIVWinners := dm.tblRankingStats.FieldByName('IVWinners').AsFloat;

                  fIVGroupWinnersPct := (fIVWinners / fIVWinnersAllRaces);
                  fIVGroupRunnersPct := (fIVRunners / fIVRunnersAllRaces);
                  fIV := (fIVWinners / fIVWinnersAllRaces) / (fIVRunners / fIVRunnersAllRaces);
               end else begin
                  fIV := 0;
                  fIVGroupWinnersPct := 0;
                  fIVGroupRunnersPct := 0;
               end;

               dm.tblRankingStats.FieldByName('IVRunnersAllRaces').AsFloat := fIVRunnersAllRaces;
               dm.tblRankingStats.FieldByName('IVWinnersAllRaces').AsFloat := fIVWinnersAllRaces;
               dm.tblRankingStats.FieldByName('IVGroupWinnersPct').AsFloat := fIVGroupWinnersPct;
               dm.tblRankingStats.FieldByName('IVGroupRunnersPct').AsFloat := fIVGroupRunnersPct;
               dm.tblRankingStats.FieldByName('IV').AsFloat := RoundTo(fIV, -2);

               dm.tblRankingStats.Post;
            end;
         end;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;




procedure GenerateRankingStats(bOneDay: boolean; iNBrOfDays: integer);
var

   fOdds: double;
   iFinishPos: integer;
   sSurface: string;
   sTrkCond: string;
   sTrkCode: string;
   sRaceType: string;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   iFinalWinPctRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;



begin
   try
      try

         if (not bOneDay) then begin
            dm.tblRankingStats.Active := False;
            dm.tblRankingStats.EmptyTable();
            dm.tblRankingStats.Active := True;
         end else begin
            exit;
         end;

         OpenTable(dm.tblHH);
         OpenTable(dm.tblRH);

         if (bOneDay) then begin

            dm.tblHH.IndexName := 'ByRangeRaceDate';

            dm.tblHH.SetRangeStart;
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            dm.tblHH.KeyFieldCount := 1;

            dm.tblHH.SetRangeEnd;
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            dm.tblHH.KeyFieldCount := 1;

            dm.tblHH.ApplyRange;
         end else begin
            dm.tblHH.IndexName := 'ByRangeRaceDate';

            dm.tblHH.SetRangeStart;
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
            dm.tblHH.KeyFieldCount := 1;

            dm.tblHH.SetRangeEnd;
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

            dm.tblHH.KeyFieldCount := 1;
            dm.tblHH.ApplyRange;

         end;

         InitPrgBar(dm.tblHH.RecordCount);
         UpdateStatusBar('Updating Stats - Base');


         //
         InitRankingArrays();

         iRecordCount := dm.tblHH.RecordCount;
         InitPrgBar(iRecordCount);

         UpdateStatusBar('Updating Stats - ' +
            dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
            dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
            dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));

         dm.tblHH.First;
         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         while not dm.tblHH.Eof do begin
            Inc(iTotalCnt);
            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Updating Stats - ' +
                  dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
                  dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
                  dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(iRecordCount));
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

            IncPrgBar();


            if (dm.tblHH.FieldByName('RaceDate').AsDateTime < (Now() - iNbrOfDays)) then begin
               dm.tblHH.Next();
               continue;
            end;

            dm.tblRH.IndexName := '';
            dm.tblRH.SetKey();
            dm.tblRH.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
            dm.tblRH.FieldByName('RaceNbr').AsInteger := dm.tblHH.FieldByName('RaceNbr').AsInteger;
            dm.tblRH.FieldByName('RaceDate').AsString := dm.tblHH.FieldByName('RaceDate').AsString;

            if not (dm.tblRH.GotoKey()) then begin
               dm.tblHH.Next;
               continue;
            end;

            if SkipThisRecordForRankings(dm.tblRH, dm.tblHH) then begin
               dm.tblHH.Next;
               continue;
            end;

            IncLinerArrays(dm.tblRH, dm.tblHH);
            IncOtherArrays(dm.tblRH, dm.tblHH);

            dm.tblHH.Next;
         end;

         OpenTable(dm.tblRankingStats);

         AddRankingStat('PACE', 'LatePacePosRank', alLatePacePosRank, adLatePacePosOdds, adLatePacePosMinOdds, adLatePacePosMaxOdds);
         AddRankingStat('PACE', 'EarlyPacePosRank', alEarlyPacePosRank, adEarlyPacePosOdds, adEarlyPacePosMinOdds, adEarlyPacePosMaxOdds);
         AddRankingStat('PACE', 'MiddlePacePosRank', alMiddlePacePosRank, adMiddlePacePosOdds, adMiddlePacePosMinOdds, adMiddlePacePosMaxOdds);

         AddRankingStat('PACE', 'LatePaceRank', alLatePaceRank, adLatePaceOdds, adLatePaceMinOdds, adLatePaceMaxOdds);
         AddRankingStat('PACE', 'EarlyPaceRank', alEarlyPaceRank, adEarlyPaceOdds, adEarlyPaceMinOdds, adEarlyPaceMaxOdds);
         AddRankingStat('PACE', 'MiddlePaceRank', alMiddlePaceRank, adMiddlePaceOdds, adMiddlePaceMinOdds, adMiddlePaceMaxOdds);

         AddRankingStat('PACE', DF_ERL_A, alEarlyPaceRank, adEarlyPaceOdds, adEarlyPaceMinOdds, adEarlyPaceMaxOdds);
         AddRankingStat('PACE', DF_LATE_A, alLatePaceRank, adLatePaceOdds, adLatePaceMinOdds, adLatePaceMaxOdds);
         AddRankingStat('PACE', DF_MID_A, alMiddlePaceRank, adMiddlePaceOdds, adMiddlePaceMinOdds, adMiddlePaceMaxOdds);

         AddRankingStat('PACE-TURF', T_ERL_A, alTrfEarlyPaceRank, adTrfEarlyPaceOdds, adTrfEarlyPaceMinOdds, adTrfEarlyPaceMaxOdds);
         AddRankingStat('PACE-TURF', T_LATE_A, alTrfMiddlePaceRank, adTrfMiddlePaceOdds, adTrfMiddlePaceMinOdds, adTrfMiddlePaceMaxOdds);
         AddRankingStat('PACE-TURF', T_MID_A, alTrfLatePaceRank, adTrfLatePaceOdds, adTrfLatePaceMinOdds, adTrfLatePaceMaxOdds);

         AddRankingStat('PACE-MUD', M_ERL_A, alMudEarlyPaceRank, adMudEarlyPaceOdds, adMudEarlyPaceMinOdds, adMudEarlyPaceMaxOdds);
         AddRankingStat('PACE-MUD', M_LATE_A, alMudMiddlePaceRank, adMudMiddlePaceOdds, adMudMiddlePaceMinOdds, adMudMiddlePaceMaxOdds);
         AddRankingStat('PACE-MUD', M_MID_A, alMudLatePaceRank, adMudLatePaceOdds, adMudLatePaceMinOdds, adMudLatePaceMaxOdds);

         //
         AddRankingStat('LINER', DF_FDL_A, alFDLRank, adFDLOdds, adFDLMinOdds, adFDLMaxOdds);
         AddRankingStat('LINER', DF_FDL_0, alFDL0Rank, adFDL0Odds, adFDL0MinOdds, adFDL0MaxOdds);
         AddRankingStat('LINER', DF_FDL_1, alFDL1Rank, adFDL1Odds, adFDL1MinOdds, adFDL1MaxOdds);
         AddRankingStat('LINER', DF_FDL_2, alFDL2Rank, adFDL2Odds, adFDL2MinOdds, adFDL2MaxOdds);
         AddRankingStat('LINER', DF_FDL_3, alFDL3Rank, adFDL3Odds, adFDL3MinOdds, adFDL3MaxOdds);

         AddRankingStat('LINER', DF_BDL_A, alBDLRank, adBDLOdds, adBDLMinOdds, adBDLMaxOdds);
         AddRankingStat('LINER', DF_BDL_0, alBDL0Rank, adBDL0Odds, adBDL0MinOdds, adBDL0MaxOdds);
         AddRankingStat('LINER', DF_BDL_1, alBDL1Rank, adBDL1Odds, adBDL1MinOdds, adBDL1MaxOdds);
         AddRankingStat('LINER', DF_BDL_2, alBDL2Rank, adBDL2Odds, adBDL2MinOdds, adBDL2MaxOdds);
         AddRankingStat('LINER', DF_BDL_3, alBDL3Rank, adBDL3Odds, adBDL3MinOdds, adBDL3MaxOdds);

         AddRankingStat('LINER', DF_TL_A, alTLRank, adTLOdds, adTLMinOdds, adTLMaxOdds);
         AddRankingStat('LINER', DF_TL_0, alTL0Rank, adTL0Odds, adTL0MinOdds, adTL0MaxOdds);
         AddRankingStat('LINER', DF_TL_1, alTL1Rank, adTL1Odds, adTL1MinOdds, adTL1MaxOdds);
         AddRankingStat('LINER', DF_TL_2, alTL2Rank, adTL2Odds, adTL2MinOdds, adTL2MaxOdds);
         AddRankingStat('LINER', DF_TL_3, alTL3Rank, adTL3Odds, adTL3MinOdds, adTL3MaxOdds);

         //
         AddRankingStat('TURF-LINER', T_FDL_A, alTrfFDLRank, adTrfFDLOdds, adTrfFDLMinOdds, adTrfFDLMaxOdds);
         AddRankingStat('TURF-LINER', T_FDL_0, alTrfFDL0Rank, adTrfFDL0Odds, adTrfFDL0MinOdds, adTrfFDL0MaxOdds);
         AddRankingStat('TURF-LINER', T_FDL_1, alTrfFDL1Rank, adTrfFDL1Odds, adTrfFDL1MinOdds, adTrfFDL1MaxOdds);
         AddRankingStat('TURF-LINER', T_FDL_2, alTrfFDL2Rank, adTrfFDL2Odds, adTrfFDL2MinOdds, adTrfFDL2MaxOdds);
         AddRankingStat('TURF-LINER', T_FDL_3, alTrfFDL3Rank, adTrfFDL3Odds, adTrfFDL3MinOdds, adTrfFDL3MaxOdds);

         AddRankingStat('TURF-LINER', T_BDL_A, alTrfBDLRank, adTrfBDLOdds, adTrfBDLMinOdds, adTrfBDLMaxOdds);
         AddRankingStat('TURF-LINER', T_BDL_0, alTrfBDL0Rank, adTrfBDL0Odds, adTrfBDL0MinOdds, adTrfBDL0MaxOdds);
         AddRankingStat('TURF-LINER', T_BDL_1, alTrfBDL1Rank, adTrfBDL1Odds, adTrfBDL1MinOdds, adTrfBDL1MaxOdds);
         AddRankingStat('TURF-LINER', T_BDL_2, alTrfBDL2Rank, adTrfBDL2Odds, adTrfBDL2MinOdds, adTrfBDL2MaxOdds);
         AddRankingStat('TURF-LINER', T_BDL_3, alTrfBDL3Rank, adTrfBDL3Odds, adTrfBDL3MinOdds, adTrfBDL3MaxOdds);

         AddRankingStat('TURF-LINER', T_TL_A, alTrfTLRank, adTrfTLOdds, adTrfTLMinOdds, adTrfTLMaxOdds);
         AddRankingStat('TURF-LINER', T_TL_0, alTrfTL0Rank, adTrfTL0Odds, adTrfTL0MinOdds, adTrfTL0MaxOdds);
         AddRankingStat('TURF-LINER', T_TL_1, alTrfTL1Rank, adTrfTL1Odds, adTrfTL1MinOdds, adTrfTL1MaxOdds);
         AddRankingStat('TURF-LINER', T_TL_2, alTrfTL2Rank, adTrfTL2Odds, adTrfTL2MinOdds, adTrfTL2MaxOdds);
         AddRankingStat('TURF-LINER', T_TL_3, alTrfTL3Rank, adTrfTL3Odds, adTrfTL3MinOdds, adTrfTL3MaxOdds);

         //
         AddRankingStat('MUD-LINER', M_FDL_A, alMudFDLRank, adMudFDLOdds, adMudFDLMinOdds, adMudFDLMaxOdds);
         AddRankingStat('MUD-LINER', M_FDL_0, alMudFDL0Rank, adMudFDL0Odds, adMudFDL0MinOdds, adMudFDL0MaxOdds);
         AddRankingStat('MUD-LINER', M_FDL_1, alMudFDL1Rank, adMudFDL1Odds, adMudFDL1MinOdds, adMudFDL1MaxOdds);
         AddRankingStat('MUD-LINER', M_FDL_2, alMudFDL2Rank, adMudFDL2Odds, adMudFDL2MinOdds, adMudFDL2MaxOdds);
         AddRankingStat('MUD-LINER', M_FDL_3, alMudFDL3Rank, adMudFDL3Odds, adMudFDL3MinOdds, adMudFDL3MaxOdds);

         AddRankingStat('MUD-LINER', M_BDL_A, alMudBDLRank, adMudBDLOdds, adMudBDLMinOdds, adMudBDLMaxOdds);
         AddRankingStat('MUD-LINER', M_BDL_0, alMudBDL0Rank, adMudBDL0Odds, adMudBDL0MinOdds, adMudBDL0MaxOdds);
         AddRankingStat('MUD-LINER', M_BDL_1, alMudBDL1Rank, adMudBDL1Odds, adMudBDL1MinOdds, adMudBDL1MaxOdds);
         AddRankingStat('MUD-LINER', M_BDL_2, alMudBDL2Rank, adMudBDL2Odds, adMudBDL2MinOdds, adMudBDL2MaxOdds);
         AddRankingStat('MUD-LINER', M_BDL_3, alMudBDL3Rank, adMudBDL3Odds, adMudBDL3MinOdds, adMudBDL3MaxOdds);

         AddRankingStat('MUD-LINER', M_TL_A, alMudTLRank, adMudTLOdds, adMudTLMinOdds, adMudTLMaxOdds);
         AddRankingStat('MUD-LINER', M_TL_0, alMudTL0Rank, adMudTL0Odds, adMudTL0MinOdds, adMudTL0MaxOdds);
         AddRankingStat('MUD-LINER', M_TL_1, alMudTL1Rank, adMudTL1Odds, adMudTL1MinOdds, adMudTL1MaxOdds);
         AddRankingStat('MUD-LINER', M_TL_2, alMudTL2Rank, adMudTL2Odds, adMudTL2MinOdds, adMudTL2MaxOdds);
         AddRankingStat('MUD-LINER', M_TL_3, alMudTL3Rank, adMudTL3Odds, adMudTL3MinOdds, adMudTL3MaxOdds);

         //
         AddRankingStat('BASE', 'MorningLineTo1Rank', alMorningLineTo1Rank, adMorningLineTo1Odds, adMorningLineTo1MinOdds, adMorningLineTo1MaxOdds);
         AddRankingStat('BASE', 'PowerRank', alPowerRank, adPowerOdds, adPowerMinOdds, adPowerMaxOdds);
         AddRankingStat('BASE', 'LastSpeedRank', alLastSpeedRank, adLastSpeedOdds, adLastSpeedMinOdds, adLastSpeedMaxOdds);
         AddRankingStat('BASE', 'AvgClassRank', alAvgClassRank, adAvgClassOdds, adAvgClassMinOdds, adAvgClassMaxOdds);
         AddRankingStat('BASE', 'BackSpeedRank', alBackSpeedRank, adBackSpeedOdds, adBackSpeedMinOdds, adBackSpeedMaxOdds);
         AddRankingStat('BASE', 'AvgSpeedRank', alAvgSpeedRank, adAvgSpeedOdds, adAvgSpeedMinOdds, adAvgSpeedMaxOdds);

         //
//         AddRankingStat('FINAL', 'FinalWinPctRank', alFinalWinPctRank, adFinalWinPctOdds, adFinalWinPctMinOdds, adFinalWinPctMaxOdds);
         AddRankingStat('FINAL', 'TodaysWagerWinPctRank', alTodaysWagerWinPctRank, adTodaysWagerOrderOdds, adTodaysWagerOrderMinOdds, adTodaysWagerOrderMaxOdds);
//         AddRankingStat('FINAL', 'PrimaryWinPctRank', alPrimaryWinPctRank, adPrimaryWinPctOdds, adPrimaryWinPctMinOdds, adPrimaryWinPctMaxOdds);
//         AddRankingStat('FINAL', 'SecondaryWinPctRank', alSecondaryWinPctRank, adSecondaryWinPctOdds, adSecondaryWinPctMinOdds, adSecondaryWinPctMaxOdds);
//         AddRankingStat('FINAL', 'DefaultWinPctRank', alDefaultWinPctRank, adDefaultWinPctOdds, adDefaultWinPctMinOdds, adDefaultWinPctMaxOdds);

         //
         //AddRankingStat('CONNECTION', 'TrnTrackRank', alTrnTrackRank, adTrnTrackOdds, adTrnTrackMinOdds, adTrnTrackMaxOdds);
         //AddRankingStat('CONNECTION', 'TrnWinsRank', alTrnWinsRank, adTrnWinsOdds, adTrnWinsMinOdds, adTrnWinsMaxOdds);
         //AddRankingStat('CONNECTION', 'TrnEarningsRank', alTrnEarningsRank, adTrnEarningsOdds, adTrnEarningsMinOdds, adTrnEarningsMaxOdds);

         //AddRankingStat('CONNECTION', 'JkyTrackRank', alJkyTrackRank, adJkyTrackOdds, adJkyTrackMinOdds, adJkyTrackMaxOdds);
         //AddRankingStat('CONNECTION', 'JkyWinsRank', alJkyWinsRank, adJkyWinsOdds, adJkyWinsMinOdds, adJkyWinsMaxOdds);
         //AddRankingStat('CONNECTION', 'JkyEarningsRank', alJkyEarningsRank, adJkyEarningsOdds, adJkyEarningsMinOdds, adJkyEarningsMaxOdds);

         //AddRankingStat('CONNECTION', 'OwnWinsRank', alOwnWinsRank, adOwnWinsOdds, adOwnWinsMinOdds, adOwnWinsMaxOdds);
         //AddRankingStat('CONNECTION', 'OwnEarningsRank', alOwnEarningsRank, adOwnEarningsOdds, adOwnEarningsMinOdds, adOwnEarningsMaxOdds);


      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.RollBack();
            end;
         end;
      end;
   finally
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;
      CloseTable(dm.tblRH);
      CloseTable(dm.tblHH);
      CloseTable(dm.tblRankingStats);
      ClearPrgStatusBars();
   end;
end;



end.
