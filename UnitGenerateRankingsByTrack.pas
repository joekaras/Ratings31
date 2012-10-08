unit UnitGenerateRankingsByTrack;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, UnitCommonCode;

procedure GenerateRankingStatsByTrack(bOneDay: boolean; iNbrOfDays: integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain;


procedure AddRankingStatByTrk(sType: string; sTrkCode: string; sName: string; aL: TLArray; ad: TDArray; adMin: TDArray; adMax: TDArray);
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

   fIVRunners: double;
   fIVWinners: double;

   fIVRunnersAllRaces: double;
   fIVWinnersAllRaces: double;

   fIV: double;

   fTotalOdds: double;
   fTotalWinOdds: double;

   fAvgOdds: double;
   fAvgWinOdds: double;

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
         iCnt := 0;
         iCnt := SumLArray(aL[iRow]);

         if (iCnt > 0) then begin
            dm.tblRankingStatsByTrk.IndexName := '';
            dm.tblRankingStatsByTrk.SetKey();
            dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := sTrkCode;
            dm.tblRankingStatsByTrk.FieldByName('Name').AsString := sName;
            dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := iRow;

            dm.tblRankingStatsByTrk.IndexName := '';
            dm.tblRankingStatsByTrk.SetKey();
            dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := sTrkCode;
            dm.tblRankingStatsByTrk.FieldByName('Name').AsString := sName;
            dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := iRow;

            if (dm.tblRankingStatsByTrk.GotoKey()) then begin
               exit;
            end;
            
            dm.tblRankingStatsByTrk.Append;
            dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := sTrkCode;
            dm.tblRankingStatsByTrk.FieldByName('Name').AsString := sName;
            dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := iRow;
            dm.tblRankingStatsByTrk.FieldByName('Type').AsString := sType;

            for iCol := 1 to MAX_COLS do begin
               dm.tblRankingStatsByTrk.Fields.FieldByNumber(iCol + FLD_TRK_OFFSET).AsInteger := aL[iRow, iCol];
               dm.tblRankingStatsByTrk.Fields.FieldByNumber(iCol + FLD_OFFSET + MAX_COLS).AsFloat := RoundTo(aD[iRow, iCol], -2);
            end;

            fStarts := SumLArray(aL[iRow]);

            fWins := aL[iRow, 1];
            fWinsPlcs := aL[iRow, 1] + aL[iRow, 3];
            fWinsPlcsShos := aL[iRow, 1] + aL[iRow, 3] + aL[iRow, 3];

            fTotalOdds := SumSArray(aD[iRow]);
            fTotalWinOdds := ad[iRow, 1];

            fMinWinOdds := adMin[iRow, 1];
            fMaxWinOdds := adMax[iRow, 1];

            fMinOdds := MinSArray(adMin[iRow]);
            fMaxOdds := MaxSArray(adMax[iRow]);

            if (fStarts > 0) then begin
               fWinPct := (fWins / fStarts) * 100;
               fPlcPct := (fWinsPlcs / fStarts) * 100;
               fShoPct := (fWinsPlcsShos / fStarts) * 100;
            end else begin
               fWinPct := 0;
               fPlcPct := 0;
               fShoPct := 0;
            end;

            fIVWinners := aL[iRow, 1];
            fIVRunners := SumLArray(aL[iRow]);

            fIVWinnersAllRaces := fIVWinnersAllRaces + aL[iRow, 1];
            fIVRunnersAllRaces := fIVRunnersAllRaces + SumLArray(aL[iRow]);

            if (fStarts > 0) then begin
               fAvgOdds := fTotalOdds / fStarts;
            end else begin
               fAvgOdds := 0;
            end;

            if (fWins > 0) then begin
               fAvgWinOdds := fTotalWinOdds / fWins;
            end else begin
               fAvgWinOdds := 0;
            end;

            dm.tblRankingStatsByTrk.FieldByName('Starts').AsFloat := fStarts;
            dm.tblRankingStatsByTrk.FieldByName('Wins').AsFloat := fWins;
            dm.tblRankingStatsByTrk.FieldByName('WinsPlcs').AsFloat := fWinsPlcs;
            dm.tblRankingStatsByTrk.FieldByName('WinsPlcsShos').AsFloat := fWinsPlcsShos;

            dm.tblRankingStatsByTrk.FieldByName('WinPct').AsFloat := Round((fWinPct * 100) / 100);
            dm.tblRankingStatsByTrk.FieldByName('PlcPct').AsFloat := Round((fPlcPct * 100) / 100);
            dm.tblRankingStatsByTrk.FieldByName('ShoPct').AsFloat := Round((fShoPct * 100) / 100);

            dm.tblRankingStatsByTrk.FieldByName('MinOdds').AsFloat := RoundTo(fMinOdds, -2);
            if (dm.tblRankingStatsByTrk.FieldByName('MinOdds').AsFloat = 9999) then begin
               dm.tblRankingStatsByTrk.FieldByName('MinOdds').AsFloat := 0;
            end;
            dm.tblRankingStatsByTrk.FieldByName('MaxOdds').AsFloat := RoundTo(fMaxOdds, -2);

            dm.tblRankingStatsByTrk.FieldByName('MinWinOdds').AsFloat := RoundTo(fMinWinOdds, -2);
            if (dm.tblRankingStatsByTrk.FieldByName('MinWinOdds').AsFloat = 9999) then begin
               dm.tblRankingStatsByTrk.FieldByName('MinWinOdds').AsFloat := 0;
            end;
            dm.tblRankingStatsByTrk.FieldByName('MaxWinOdds').AsFloat := RoundTo(fMaxWinOdds, -2);

            dm.tblRankingStatsByTrk.FieldByName('AvgOdds').AsFloat := RoundTo(fAvgOdds, -2);
            dm.tblRankingStatsByTrk.FieldByName('TotalOdds').AsFloat := RoundTo(fTotalOdds, -2);

            dm.tblRankingStatsByTrk.FieldByName('AvgWinOdds').AsFloat := RoundTo(fAvgWinOdds, -2);
            dm.tblRankingStatsByTrk.FieldByName('TotalWinOdds').AsFloat := RoundTo(fTotalWinOdds, -2);

            dm.tblRankingStatsByTrk.FieldByName('ValueBet').AsFloat := RoundTo((fAvgWinOdds * fWinPct) / 100, -2);
            dm.tblRankingStatsByTrk.FieldByName('BEWinPct').AsFloat := RoundTo((1 / (fAvgWinOdds + 1)) * 100, -2);

            dm.tblRankingStatsByTrk.FieldByName('IVRunners').AsFloat := fIVRunners;
            dm.tblRankingStatsByTrk.FieldByName('IVWinners').AsFloat := fIVWinners;
            dm.tblRankingStatsByTrk.FieldByName('IVWinnersAllRaces').AsFloat := fIVWinnersAllRaces;
            dm.tblRankingStatsByTrk.FieldByName('IVRunnersAllRaces').AsFloat := fIVRunnersAllRaces;
            dm.tblRankingStatsByTrk.FieldByName('IVGroupWinnersPct').AsFloat := fIVGroupWinnersPct;
            dm.tblRankingStatsByTrk.FieldByName('IVGroupRunnersPct').AsFloat := fIVGroupRunnersPct;
            dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat := RoundTo(fIV, -2);
            //--******************************************************************************
            //-- ROI is calculated by summing winning wagers and subtracting from that sum,
            //-- the amount wagered (minus refunds), and
            //-- then dividing that total by the amount wagered; expressing the total as a
            //-- percentage. $1 ROI
            //--******************************************************************************
            if (fIVRunners > 0) then begin
               dm.tblRankingStatsByTrk.FieldByName('IVRoi').AsFloat := RoundTo((fTotalWinOdds / fIVRunners), -2);
            end else begin
               dm.tblRankingStatsByTrk.FieldByName('IVRoi').AsFloat := 0;
            end;
            dm.tblRankingStatsByTrk.Post;
         end;
      end;

      // Second  time for IV
      for iRow := 1 to MAX_ROWS do begin
         // Check if anything in counters - no need to add if not
         iCnt := 0;
         iCnt := SumLArray(aL[iRow]);

         if (iCnt > 0) then begin
            dm.tblRankingStatsByTrk.IndexName := '';
            dm.tblRankingStatsByTrk.SetKey();
            dm.tblRankingStatsByTrk.FieldByName('TrkCode').AsString := sTrkCode;
            dm.tblRankingStatsByTrk.FieldByName('Name').AsString := sName;
            dm.tblRankingStatsByTrk.FieldByName('Rank').AsInteger := iRow;

            if (dm.tblRankingStatsByTrk.GotoKey()) then begin

               dm.tblRankingStatsByTrk.Edit;
               if (fIVWinnersAllRaces > 0) and (fIVRunnersAllRaces > 0) and (fIVRunners > 0) then begin
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
                  fIVRunners := dm.tblRankingStatsByTrk.FieldByName('IVRunners').AsFloat;
                  fIVWinners := dm.tblRankingStatsByTrk.FieldByName('IVWinners').AsFloat;

                  fIVGroupWinnersPct := (fIVWinners / fIVWinnersAllRaces);
                  fIVGroupRunnersPct := (fIVRunners / fIVRunnersAllRaces);
                  fIV := (fIVWinners / fIVWinnersAllRaces) / (fIVRunners / fIVRunnersAllRaces);
               end else begin
                  fIV := 0;
                  fIVGroupWinnersPct := 0;
                  fIVGroupRunnersPct := 0;
               end;

               dm.tblRankingStatsByTrk.FieldByName('IVRunners').AsFloat := fIVRunners;
               dm.tblRankingStatsByTrk.FieldByName('IVWinners').AsFloat := fIVWinners;
               dm.tblRankingStatsByTrk.FieldByName('IVWinnersAllRaces').AsFloat := fIVWinnersAllRaces;
               dm.tblRankingStatsByTrk.FieldByName('IVRunnersAllRaces').AsFloat := fIVRunnersAllRaces;
               dm.tblRankingStatsByTrk.FieldByName('IVGroupWinnersPct').AsFloat := fIVGroupWinnersPct;
               dm.tblRankingStatsByTrk.FieldByName('IVGroupRunnersPct').AsFloat := fIVGroupRunnersPct;
               dm.tblRankingStatsByTrk.FieldByName('IV').AsFloat := RoundTo(fIV, -2);
               dm.tblRankingStatsByTrk.Post;
            end;
         end;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;



procedure GenerateRankingStatsByTrack(bOneDay: boolean; iNbrOfDays: integer);
var

   iFinishPos: integer;
   sSurface: string;
   sTrkCond: string;
   sTrkCode: string;
   sPrevTrkCode: string;
   sRaceType: string;

   iLatePaceRank: integer;
   iLastSpeedRank: integer;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   iFinalWinPctRank: integer;

   fOdds: double;

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
            dm.tblRankingStatsByTrk.Active := False;
            dm.tblRankingStatsByTrk.EmptyTable();
            dm.tblRankingStatsByTrk.Active := True;
         end else begin //not ready
            exit;
         end;

         OpenTable(dm.tblHH);
         OpenTable(dm.tblRH);
         OpenTable(dm.tblRankingStatsByTrk);


         if (bOneDay) then begin
            dm.tblHH.IndexName := 'ByTrkCodeRangeRaceDate';

            dm.tblHH.SetRangeStart;
            dm.tblHH.FieldByName('TrkCode').AsString := 'A';
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

            dm.tblHH.SetRangeEnd;
            dm.tblHH.FieldByName('TrkCode').AsString := 'ZZZ';
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            
            dm.tblHH.KeyFieldCount := 2;

            dm.tblHH.ApplyRange;
         end else begin
            dm.tblHH.IndexName := 'ByTrkCodeRangeRaceDate';

            
            dm.tblHH.SetRangeStart;
            dm.tblHH.FieldByName('TrkCode').AsString := 'A';
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (gedtOverrideDate - iNbrOfDays);

            dm.tblHH.SetRangeEnd;
            
            dm.tblHH.FieldByName('TrkCode').AsString := 'ZZZ';
            dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;

            dm.tblHH.KeyFieldCount := 2;
            
            
            dm.tblHH.ApplyRange;

         end;

         iRecordCount := dm.tblHH.RecordCount;
         InitPrgBar(iRecordCount);

         UpdateStatusBar('Updating Stats - By Track Code - ' +
            dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
            dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
            dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(1) + ' of ' + IntToStr(iRecordCount));

         sPrevTrkCode := '';
         iStaCnt := 0;
         iTotalCnt := 0;

         dm.tblHH.First;

         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;


         while not dm.tblHH.Eof do begin
            Inc(iTotalCnt);
            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Updating Stats - By Track Code - ' +
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

            //         if dm.tblHH.FieldByName('TrkCode').AsString = 'BEL' then begin
            //            break;
            //         end;

            sTrkCode := dm.tblHH.FieldByName('TrkCode').AsString;

            if sPrevTrkCode = '' then begin
               InitRankingArrays();
               sPrevTrkCode := sTrkCode;
            end;

            if sPrevTrkCode <> sTrkCode then begin

               AddRankingStatByTrk('PACE', sPrevTrkCode, DF_ERL_A, alEarlyPaceRank, adEarlyPaceOdds, adEarlyPaceMinOdds, adEarlyPaceMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, DF_LATE_A, alLatePaceRank, adLatePaceOdds, adLatePaceMinOdds, adLatePaceMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, DF_MID_A, alMiddlePaceRank, adMiddlePaceOdds, adMiddlePaceMinOdds, adMiddlePaceMaxOdds);

               AddRankingStatByTrk('PACE', sPrevTrkCode, 'LatePacePosRank', alLatePacePosRank, adLatePacePosOdds, adLatePacePosMinOdds, adLatePacePosMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, 'EarlyPacePosRank', alEarlyPacePosRank, adEarlyPacePosOdds, adEarlyPacePosMinOdds, adEarlyPacePosMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, 'MiddlePacePosRank', alMiddlePacePosRank, adMiddlePacePosOdds, adMiddlePacePosMinOdds, adMiddlePacePosMaxOdds);

               AddRankingStatByTrk('PACE', sPrevTrkCode, 'QSP1stCallRank', alQSP1stCallRank, adQSP1stCallOdds, adQSP1stCallMinOdds, adQSP1stCallMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, 'QSP2ndCallRank', alQSP2ndCallRank, adQSP2ndCallOdds, adQSP2ndCallMinOdds, adQSP2ndCallMaxOdds);

               AddRankingStatByTrk('PACE', sPrevTrkCode, 'KSP1stCallRank', alKSP1stCallRank, adKSP1stCallOdds, adKSP1stCallMinOdds, adKSP1stCallMaxOdds);
               AddRankingStatByTrk('PACE', sPrevTrkCode, 'KSP2ndCallRank', alKSP2ndCallRank, adKSP2ndCallOdds, adKSP2ndCallMinOdds, adKSP2ndCallMaxOdds);

               AddRankingStatByTrk('PACE-TURF', sPrevTrkCode, T_ERL_A, alTrfEarlyPaceRank, adTrfEarlyPaceOdds, adTrfEarlyPaceMinOdds, adTrfEarlyPaceMaxOdds);
               AddRankingStatByTrk('PACE-TURF', sPrevTrkCode, T_LATE_A, alTrfMiddlePaceRank, adTrfMiddlePaceOdds, adTrfMiddlePaceMinOdds, adTrfMiddlePaceMaxOdds);
               AddRankingStatByTrk('PACE-TURF', sPrevTrkCode, T_MID_A, alTrfLatePaceRank, adTrfLatePaceOdds, adTrfLatePaceMinOdds, adTrfLatePaceMaxOdds);

               AddRankingStatByTrk('PACE-MUD', sPrevTrkCode, M_ERL_A, alMudEarlyPaceRank, adMudEarlyPaceOdds, adMudEarlyPaceMinOdds, adMudEarlyPaceMaxOdds);
               AddRankingStatByTrk('PACE-MUD', sPrevTrkCode, M_LATE_A, alMudMiddlePaceRank, adMudMiddlePaceOdds, adMudMiddlePaceMinOdds, adMudMiddlePaceMaxOdds);
               AddRankingStatByTrk('PACE-MUD', sPrevTrkCode, M_MID_A, alMudLatePaceRank, adMudLatePaceOdds, adMudLatePaceMinOdds, adMudLatePaceMaxOdds);


               //
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_FDL_A, alFDLRank, adFDLOdds, adFDLMinOdds, adFDLMaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_FDL_0, alFDL0Rank, adFDL0Odds, adFDL0MinOdds, adFDL0MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_FDL_1, alFDL1Rank, adFDL1Odds, adFDL1MinOdds, adFDL1MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_FDL_2, alFDL2Rank, adFDL2Odds, adFDL2MinOdds, adFDL2MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_FDL_3, alFDL3Rank, adFDL3Odds, adFDL3MinOdds, adFDL3MaxOdds);

               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_BDL_A, alBDLRank, adBDLOdds, adBDLMinOdds, adBDLMaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_BDL_0, alBDL0Rank, adBDL0Odds, adBDL0MinOdds, adBDL0MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_BDL_1, alBDL1Rank, adBDL1Odds, adBDL1MinOdds, adBDL1MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_BDL_2, alBDL2Rank, adBDL2Odds, adBDL2MinOdds, adBDL2MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_BDL_3, alBDL3Rank, adBDL3Odds, adBDL3MinOdds, adBDL3MaxOdds);

               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_TL_A, alTLRank, adTLOdds, adTLMinOdds, adTLMaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_TL_0, alTL0Rank, adTL0Odds, adTL0MinOdds, adTL0MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_TL_1, alTL1Rank, adTL1Odds, adTL1MinOdds, adTL1MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_TL_2, alTL2Rank, adTL2Odds, adTL2MinOdds, adTL2MaxOdds);
               AddRankingStatByTrk('LINER', sPrevTrkCode, DF_TL_3, alTL3Rank, adTL3Odds, adTL3MinOdds, adTL3MaxOdds);

               //
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_FDL_A, alTrfFDLRank, adTrfFDLOdds, adTrfFDLMinOdds, adTrfFDLMaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_FDL_0, alTrfFDL0Rank, adTrfFDL0Odds, adTrfFDL0MinOdds, adTrfFDL0MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_FDL_1, alTrfFDL1Rank, adTrfFDL1Odds, adTrfFDL1MinOdds, adTrfFDL1MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_FDL_2, alTrfFDL2Rank, adTrfFDL2Odds, adTrfFDL2MinOdds, adTrfFDL2MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_FDL_3, alTrfFDL3Rank, adTrfFDL3Odds, adTrfFDL3MinOdds, adTrfFDL3MaxOdds);

               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_BDL_A, alTrfBDLRank, adTrfBDLOdds, adTrfBDLMinOdds, adTrfBDLMaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_BDL_0, alTrfBDL0Rank, adTrfBDL0Odds, adTrfBDL0MinOdds, adTrfBDL0MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_BDL_1, alTrfBDL1Rank, adTrfBDL1Odds, adTrfBDL1MinOdds, adTrfBDL1MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_BDL_2, alTrfBDL2Rank, adTrfBDL2Odds, adTrfBDL2MinOdds, adTrfBDL2MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_BDL_3, alTrfBDL3Rank, adTrfBDL3Odds, adTrfBDL3MinOdds, adTrfBDL3MaxOdds);

               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_TL_A, alTrfTLRank, adTrfTLOdds, adTrfTLMinOdds, adTrfTLMaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_TL_0, alTrfTL0Rank, adTrfTL0Odds, adTrfTL0MinOdds, adTrfTL0MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_TL_1, alTrfTL1Rank, adTrfTL1Odds, adTrfTL1MinOdds, adTrfTL1MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_TL_2, alTrfTL2Rank, adTrfTL2Odds, adTrfTL2MinOdds, adTrfTL2MaxOdds);
               AddRankingStatByTrk('TURF-LINER', sPrevTrkCode, T_TL_3, alTrfTL3Rank, adTrfTL3Odds, adTrfTL3MinOdds, adTrfTL3MaxOdds);

               //
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_FDL_A, alMudFDLRank, adMudFDLOdds, adMudFDLMinOdds, adMudFDLMaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_FDL_0, alMudFDL0Rank, adMudFDL0Odds, adMudFDL0MinOdds, adMudFDL0MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_FDL_1, alMudFDL1Rank, adMudFDL1Odds, adMudFDL1MinOdds, adMudFDL1MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_FDL_2, alMudFDL2Rank, adMudFDL2Odds, adMudFDL2MinOdds, adMudFDL2MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_FDL_3, alMudFDL3Rank, adMudFDL3Odds, adMudFDL3MinOdds, adMudFDL3MaxOdds);

               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_BDL_A, alMudBDLRank, adMudBDLOdds, adMudBDLMinOdds, adMudBDLMaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_BDL_0, alMudBDL0Rank, adMudBDL0Odds, adMudBDL0MinOdds, adMudBDL0MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_BDL_1, alMudBDL1Rank, adMudBDL1Odds, adMudBDL1MinOdds, adMudBDL1MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_BDL_2, alMudBDL2Rank, adMudBDL2Odds, adMudBDL2MinOdds, adMudBDL2MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_BDL_3, alMudBDL3Rank, adMudBDL3Odds, adMudBDL3MinOdds, adMudBDL3MaxOdds);

               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_TL_A, alMudTLRank, adMudTLOdds, adMudTLMinOdds, adMudTLMaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_TL_0, alMudTL0Rank, adMudTL0Odds, adMudTL0MinOdds, adMudTL0MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_TL_1, alMudTL1Rank, adMudTL1Odds, adMudTL1MinOdds, adMudTL1MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_TL_2, alMudTL2Rank, adMudTL2Odds, adMudTL2MinOdds, adMudTL2MaxOdds);
               AddRankingStatByTrk('MUD-LINER', sPrevTrkCode, M_TL_3, alMudTL3Rank, adMudTL3Odds, adMudTL3MinOdds, adMudTL3MaxOdds);

               //
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'MorningLineTo1Rank', alMorningLineTo1Rank, adMorningLineTo1Odds, adMorningLineTo1MinOdds, adMorningLineTo1MaxOdds);
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'PowerRank', alPowerRank, adPowerOdds, adPowerMinOdds, adPowerMaxOdds);
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'LastSpeedRank', alLastSpeedRank, adLastSpeedOdds, adLastSpeedMinOdds, adLastSpeedMaxOdds);
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'BackSpeedRank', alBackSpeedRank, adBackSpeedOdds, adBackSpeedMinOdds, adBackSpeedMaxOdds);
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'AvgClassRank', alAvgClassRank, adAvgClassOdds, adAvgClassMinOdds, adAvgClassMaxOdds);
               AddRankingStatByTrk('BASE', sPrevTrkCode, 'AvgSpeedRank', alAvgSpeedRank, adAvgSpeedOdds, adAvgSpeedMinOdds, adAvgSpeedMaxOdds);

               //
               //                  AddRankingStatByTrk('FINAL', sPrevTrkCode, 'FinalWinPctRank', alFinalWinPctRank, adFinalWinPctOdds, adFinalWinPctMinOdds, adFinalWinPctMaxOdds);
               AddRankingStatByTrk('FINAL', sPrevTrkCode, 'TodaysWagerWinPctRank', alTodaysWagerWinPctRank, adTodaysWagerOrderOdds, adTodaysWagerOrderMinOdds, adTodaysWagerOrderMaxOdds);
               //                  AddRankingStatByTrk('FINAL', sPrevTrkCode, 'PrimaryWinPctRank', alPrimaryWinPctRank, adPrimaryWinPctOdds, adPrimaryWinPctMinOdds, adPrimaryWinPctMaxOdds);
               //                  AddRankingStatByTrk('FINAL', sPrevTrkCode, 'SecondaryWinPctRank', alSecondaryWinPctRank, adSecondaryWinPctOdds, adSecondaryWinPctMinOdds, adSecondaryWinPctMaxOdds);
               //                  AddRankingStatByTrk('FINAL', sPrevTrkCode, 'DefaultWinPctRank', alDefaultWinPctRank, adDefaultWinPctOdds, adDefaultWinPctMinOdds, adDefaultWinPctMaxOdds);

                                 //
                               //  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'TrnTrackRank', alTrnTrackRank, adTrnTrackOdds, adTrnTrackMinOdds, adTrnTrackMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'TrnWinsRank', alTrnWinsRank, adTrnWinsOdds, adTrnWinsMinOdds, adTrnWinsMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'TrnEarningsRank', alTrnEarningsRank, adTrnEarningsOdds, adTrnEarningsMinOdds, adTrnEarningsMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'JkyTrackRank', alJkyTrackRank, adJkyTrackOdds, adJkyTrackMinOdds, adJkyTrackMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'JkyWinsRank', alJkyWinsRank, adJkyWinsOdds, adJkyWinsMinOdds, adJkyWinsMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'JkyEarningsRank', alJkyEarningsRank, adJkyEarningsOdds, adJkyEarningsMinOdds, adJkyEarningsMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'OwnWinsRank', alOwnWinsRank, adOwnWinsOdds, adOwnWinsMinOdds, adOwnWinsMaxOdds);
               //                  AddRankingStatByTrk('CONNECTION', sPrevTrkCode, 'OwnEarningsRank', alOwnEarningsRank, adOwnEarningsOdds, adOwnEarningsMinOdds, adOwnEarningsMaxOdds);

                                 //
               InitRankingArrays();
            end;

            IncLinerArrays(dm.tblRH, dm.tblHH);
            IncOtherArrays(dm.tblRH, dm.tblHH);

            sPrevTrkCode := sTrkCode;
            dm.tblHH.Next;
         end;

         //
         AddRankingStatByTrk('PACE', sTrkCode, DF_ERL_A, alEarlyPaceRank, adEarlyPaceOdds, adEarlyPaceMinOdds, adEarlyPaceMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, DF_LATE_A, alLatePaceRank, adLatePaceOdds, adLatePaceMinOdds, adLatePaceMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, DF_MID_A, alMiddlePaceRank, adMiddlePaceOdds, adMiddlePaceMinOdds, adMiddlePaceMaxOdds);

         AddRankingStatByTrk('PACE', sTrkCode, 'LatePacePosRank', alLatePacePosRank, adLatePacePosOdds, adLatePacePosMinOdds, adLatePacePosMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, 'EarlyPacePosRank', alEarlyPacePosRank, adEarlyPacePosOdds, adEarlyPacePosMinOdds, adEarlyPacePosMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, 'MiddlePacePosRank', alMiddlePacePosRank, adMiddlePacePosOdds, adMiddlePacePosMinOdds, adMiddlePacePosMaxOdds);

         AddRankingStatByTrk('PACE', sTrkCode, 'QSP1stCallRank', alQSP1stCallRank, adQSP1stCallOdds, adQSP1stCallMinOdds, adQSP1stCallMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, 'QSP2ndCallRank', alQSP2ndCallRank, adQSP2ndCallOdds, adQSP2ndCallMinOdds, adQSP2ndCallMaxOdds);

         AddRankingStatByTrk('PACE', sTrkCode, 'KSP1stCallRank', alKSP1stCallRank, adKSP1stCallOdds, adKSP1stCallMinOdds, adKSP1stCallMaxOdds);
         AddRankingStatByTrk('PACE', sTrkCode, 'KSP2ndCallRank', alKSP2ndCallRank, adKSP2ndCallOdds, adKSP2ndCallMinOdds, adKSP2ndCallMaxOdds);

         AddRankingStatByTrk('PACE-TURF', sTrkCode, T_ERL_A, alTrfEarlyPaceRank, adTrfEarlyPaceOdds, adTrfEarlyPaceMinOdds, adTrfEarlyPaceMaxOdds);
         AddRankingStatByTrk('PACE-TURF', sTrkCode, T_LATE_A, alTrfMiddlePaceRank, adTrfMiddlePaceOdds, adTrfMiddlePaceMinOdds, adTrfMiddlePaceMaxOdds);
         AddRankingStatByTrk('PACE-TURF', sTrkCode, T_MID_A, alTrfLatePaceRank, adTrfLatePaceOdds, adTrfLatePaceMinOdds, adTrfLatePaceMaxOdds);

         AddRankingStatByTrk('PACE-MUD', sTrkCode, M_ERL_A, alMudEarlyPaceRank, adMudEarlyPaceOdds, adMudEarlyPaceMinOdds, adMudEarlyPaceMaxOdds);
         AddRankingStatByTrk('PACE-MUD', sTrkCode, M_LATE_A, alMudMiddlePaceRank, adMudMiddlePaceOdds, adMudMiddlePaceMinOdds, adMudMiddlePaceMaxOdds);
         AddRankingStatByTrk('PACE-MUD', sTrkCode, M_MID_A, alMudLatePaceRank, adMudLatePaceOdds, adMudLatePaceMinOdds, adMudLatePaceMaxOdds);

         //
         AddRankingStatByTrk('LINER', sTrkCode, DF_FDL_A, alFDLRank, adFDLOdds, adFDLMinOdds, adFDLMaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_FDL_0, alFDL0Rank, adFDL0Odds, adFDL0MinOdds, adFDL0MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_FDL_1, alFDL1Rank, adFDL1Odds, adFDL1MinOdds, adFDL1MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_FDL_2, alFDL2Rank, adFDL2Odds, adFDL2MinOdds, adFDL2MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_FDL_3, alFDL3Rank, adFDL3Odds, adFDL3MinOdds, adFDL3MaxOdds);

         AddRankingStatByTrk('LINER', sTrkCode, DF_BDL_A, alBDLRank, adBDLOdds, adBDLMinOdds, adBDLMaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_BDL_0, alBDL0Rank, adBDL0Odds, adBDL0MinOdds, adBDL0MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_BDL_1, alBDL1Rank, adBDL1Odds, adBDL1MinOdds, adBDL1MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_BDL_2, alBDL2Rank, adBDL2Odds, adBDL2MinOdds, adBDL2MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_BDL_3, alBDL3Rank, adBDL3Odds, adBDL3MinOdds, adBDL3MaxOdds);

         AddRankingStatByTrk('LINER', sTrkCode, DF_TL_A, alTLRank, adTLOdds, adTLMinOdds, adTLMaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_TL_0, alTL0Rank, adTL0Odds, adTL0MinOdds, adTL0MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_TL_1, alTL1Rank, adTL1Odds, adTL1MinOdds, adTL1MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_TL_2, alTL2Rank, adTL2Odds, adTL2MinOdds, adTL2MaxOdds);
         AddRankingStatByTrk('LINER', sTrkCode, DF_TL_3, alTL3Rank, adTL3Odds, adTL3MinOdds, adTL3MaxOdds);

         //
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_FDL_A, alTrfFDLRank, adTrfFDLOdds, adTrfFDLMinOdds, adTrfFDLMaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_FDL_0, alTrfFDL0Rank, adTrfFDL0Odds, adTrfFDL0MinOdds, adTrfFDL0MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_FDL_1, alTrfFDL1Rank, adTrfFDL1Odds, adTrfFDL1MinOdds, adTrfFDL1MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_FDL_2, alTrfFDL2Rank, adTrfFDL2Odds, adTrfFDL2MinOdds, adTrfFDL2MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_FDL_3, alTrfFDL3Rank, adTrfFDL3Odds, adTrfFDL3MinOdds, adTrfFDL3MaxOdds);

         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_BDL_A, alTrfBDLRank, adTrfBDLOdds, adTrfBDLMinOdds, adTrfBDLMaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_BDL_0, alTrfBDL0Rank, adTrfBDL0Odds, adTrfBDL0MinOdds, adTrfBDL0MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_BDL_1, alTrfBDL1Rank, adTrfBDL1Odds, adTrfBDL1MinOdds, adTrfBDL1MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_BDL_2, alTrfBDL2Rank, adTrfBDL2Odds, adTrfBDL2MinOdds, adTrfBDL2MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_BDL_3, alTrfBDL3Rank, adTrfBDL3Odds, adTrfBDL3MinOdds, adTrfBDL3MaxOdds);

         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_TL_A, alTrfTLRank, adTrfTLOdds, adTrfTLMinOdds, adTrfTLMaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_TL_0, alTrfTL0Rank, adTrfTL0Odds, adTrfTL0MinOdds, adTrfTL0MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_TL_1, alTrfTL1Rank, adTrfTL1Odds, adTrfTL1MinOdds, adTrfTL1MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_TL_2, alTrfTL2Rank, adTrfTL2Odds, adTrfTL2MinOdds, adTrfTL2MaxOdds);
         AddRankingStatByTrk('TURF-LINER', sTrkCode, T_TL_3, alTrfTL3Rank, adTrfTL3Odds, adTrfTL3MinOdds, adTrfTL3MaxOdds);

         //
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_FDL_A, alMudFDLRank, adMudFDLOdds, adMudFDLMinOdds, adMudFDLMaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_FDL_0, alMudFDL0Rank, adMudFDL0Odds, adMudFDL0MinOdds, adMudFDL0MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_FDL_1, alMudFDL1Rank, adMudFDL1Odds, adMudFDL1MinOdds, adMudFDL1MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_FDL_2, alMudFDL2Rank, adMudFDL2Odds, adMudFDL2MinOdds, adMudFDL2MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_FDL_3, alMudFDL3Rank, adMudFDL3Odds, adMudFDL3MinOdds, adMudFDL3MaxOdds);

         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_BDL_A, alMudBDLRank, adMudBDLOdds, adMudBDLMinOdds, adMudBDLMaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_BDL_0, alMudBDL0Rank, adMudBDL0Odds, adMudBDL0MinOdds, adMudBDL0MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_BDL_1, alMudBDL1Rank, adMudBDL1Odds, adMudBDL1MinOdds, adMudBDL1MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_BDL_2, alMudBDL2Rank, adMudBDL2Odds, adMudBDL2MinOdds, adMudBDL2MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_BDL_3, alMudBDL3Rank, adMudBDL3Odds, adMudBDL3MinOdds, adMudBDL3MaxOdds);

         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_TL_A, alMudTLRank, adMudTLOdds, adMudTLMinOdds, adMudTLMaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_TL_0, alMudTL0Rank, adMudTL0Odds, adMudTL0MinOdds, adMudTL0MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_TL_1, alMudTL1Rank, adMudTL1Odds, adMudTL1MinOdds, adMudTL1MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_TL_2, alMudTL2Rank, adMudTL2Odds, adMudTL2MinOdds, adMudTL2MaxOdds);
         AddRankingStatByTrk('MUD-LINER', sTrkCode, M_TL_3, alMudTL3Rank, adMudTL3Odds, adMudTL3MinOdds, adMudTL3MaxOdds);

         //
         AddRankingStatByTrk('BASE', sTrkCode, 'MorningLineTo1Rank', alMorningLineTo1Rank, adMorningLineTo1Odds, adMorningLineTo1MinOdds, adMorningLineTo1MaxOdds);
         AddRankingStatByTrk('BASE', sTrkCode, 'PowerRank', alPowerRank, adPowerOdds, adPowerMinOdds, adPowerMaxOdds);
         AddRankingStatByTrk('BASE', sTrkCode, 'LastSpeedRank', alLastSpeedRank, adLastSpeedOdds, adLastSpeedMinOdds, adLastSpeedMaxOdds);
         AddRankingStatByTrk('BASE', sTrkCode, 'AvgClassRank', alAvgClassRank, adAvgClassOdds, adAvgClassMinOdds, adAvgClassMaxOdds);
         AddRankingStatByTrk('BASE', sTrkCode, 'BackSpeedRank', alBackSpeedRank, adBackSpeedOdds, adBackSpeedMinOdds, adBackSpeedMaxOdds);
         AddRankingStatByTrk('BASE', sTrkCode, 'AvgSpeedRank', alAvgSpeedRank, adAvgSpeedOdds, adAvgSpeedMinOdds, adAvgSpeedMaxOdds);

         //
   //         AddRankingStatByTrk('FINAL', sTrkCode, 'FinalWinPctRank', alFinalWinPctRank, adFinalWinPctOdds, adFinalWinPctMinOdds, adFinalWinPctMaxOdds);
         AddRankingStatByTrk('FINAL', sTrkCode, 'TodaysWagerWinPctRank', alTodaysWagerWinPctRank, adTodaysWagerOrderOdds, adTodaysWagerOrderMinOdds, adTodaysWagerOrderMaxOdds);
         //         AddRankingStatByTrk('FINAL', sTrkCode, 'PrimaryWinPctRank', alPrimaryWinPctRank, adPrimaryWinPctOdds, adPrimaryWinPctMinOdds, adPrimaryWinPctMaxOdds);
         //         AddRankingStatByTrk('FINAL', sTrkCode, 'SecondaryWinPctRank', alSecondaryWinPctRank, adSecondaryWinPctOdds, adSecondaryWinPctMinOdds, adSecondaryWinPctMaxOdds);
         //         AddRankingStatByTrk('FINAL', sTrkCode, 'DefaultWinPctRank', alDefaultWinPctRank, adDefaultWinPctOdds, adDefaultWinPctMinOdds, adDefaultWinPctMaxOdds);

                  //
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'TrnTrackRank', alTrnTrackRank, adTrnTrackOdds, adTrnTrackMinOdds, adTrnTrackMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'TrnWinsRank', alTrnWinsRank, adTrnWinsOdds, adTrnWinsMinOdds, adTrnWinsMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'TrnEarningsRank', alTrnEarningsRank, adTrnEarningsOdds, adTrnEarningsMinOdds, adTrnEarningsMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'JkyTrackRank', alJkyTrackRank, adJkyTrackOdds, adJkyTrackMinOdds, adJkyTrackMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'JkyWinsRank', alJkyWinsRank, adJkyWinsOdds, adJkyWinsMinOdds, adJkyWinsMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'JkyEarningsRank', alJkyEarningsRank, adJkyEarningsOdds, adJkyEarningsMinOdds, adJkyEarningsMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'OwnWinsRank', alOwnWinsRank, adOwnWinsOdds, adOwnWinsMinOdds, adOwnWinsMaxOdds);
         AddRankingStatByTrk('CONNECTION', sTrkCode, 'OwnEarningsRank', alOwnEarningsRank, adOwnEarningsOdds, adOwnEarningsMinOdds, adOwnEarningsMaxOdds);


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
      CloseTable(dm.tblRankingStatsByTrk);

      ClearPrgStatusBars();
   end;

end;


end.

