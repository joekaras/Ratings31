unit UnitProcessResults;

interface

implementation
procedure TMainForm.ProcessPicksAndResults(Sender: TObject; tblRH: TDBISAMTable; bUseOverride: boolean);
var

   lstResults: TStringList;
   lstPicks: TStringList;

   bDDFirstRaceMatched: boolean;
   bDDFirstRaceLeg1Matched: boolean;
   bDDFirstRaceLeg2Matched: boolean;

   bPk3FirstRaceMatched: boolean;
   bPk3FirstRaceLeg1Matched: boolean;
   bPk3FirstRaceLeg2Matched: boolean;
   bPk3FirstRaceLeg3Matched: boolean;

   bPk4FirstRaceMatched: boolean;
   bPk4FirstRaceLeg1Matched: boolean;
   bPk4FirstRaceLeg2Matched: boolean;
   bPk4FirstRaceLeg3Matched: boolean;
   bPk4FirstRaceLeg4Matched: boolean;

   bDDLastRaceMatched: boolean;
   bDDLastRaceLeg1Matched: boolean;
   bDDLastRaceLeg2Matched: boolean;

   bPk3LastRaceMatched: boolean;
   bPk3LastRaceLeg1Matched: boolean;
   bPk3LastRaceLeg2Matched: boolean;
   bPk3LastRaceLeg3Matched: boolean;

   bPk4LastRaceMatched: boolean;
   bPk4LastRaceLeg1Matched: boolean;
   bPk4LastRaceLeg2Matched: boolean;
   bPk4LastRaceLeg3Matched: boolean;
   bPk4LastRaceLeg4Matched: boolean;

   bExaMatched: boolean;
   bExaTopMatched: boolean;
   bExaBottomMatched: boolean;

   bQuiMatched: boolean;
   bQuiTopMatched: boolean;
   bQuiBottomMatched: boolean;

   bTriMatched: boolean;
   bTriLeg1Matched: boolean;
   bTriLeg2Matched: boolean;
   bTriLeg3Matched: boolean;

   bSfcMatched: boolean;
   bSfcLeg1Matched: boolean;
   bSfcLeg2Matched: boolean;
   bSfcLeg3Matched: boolean;
   bSfcLeg4Matched: boolean;

   sKeyHorse: string;
   sWheelHorse1: string;
   sWheelHorse2: string;
   sWheelHorse3: string;
   sWheelHorse4: string;
   sWheelHorse5: string;

   sBoxHorse1: string;
   sBoxHorse2: string;
   sBoxHorse3: string;
   sBoxHorse4: string;

   sResultsWinHorse: string;
   sResultsPlcHorse: string;
   sResultsShoHorse: string;
   sResults4thHorse: string;

   iIdx: integer;

   lstPk3: TStringList;

   iPk3Selections1stLeg: TNums;
   iPk3Selections2ndLeg: TNums;
   iPk3Selections3rdLeg: TNums;

   sPicksLeg1: string;
   sPicksLeg2: string;
   sPicksLeg3: string;
   sPicksLeg4: string;

   sResultsLeg1: string;
   sResultsLeg2: string;
   sResultsLeg3: string;
   sResultsLeg4: string;

   lstDD: TStringList;

   iDDSelections1stLeg: TNums;
   iDDSelections2ndLeg: TNums;

   lstPk4: TStringList;

   iPk4Selections1stLeg: TNums;
   iPk4Selections2ndLeg: TNums;
   iPk4Selections3rdLeg: TNums;
   iPk4Selections4thLeg: TNums;

   sTriPicks: string;
   sSuperPicks: string;
   sExactaPicks: string;
   sQuinellaPicks: string;

begin


   hLog.AddToLog('Process Picks And Results', msevOperation);
   try
      CloseTableExclusive(tblRH);
      OpenTableExclusive(tblRH);
      try

         if (bUseOverride) then begin
            tblRH.IndexName := 'ByRangeRaceDate';

            tblRH.SetRangeStart;
            tblRH.FieldByName('RaceDate').AsDateTime := edtOverrideDate.Date;
            tblRH.KeyFieldCount := 1;

            tblRH.SetRangeEnd;
            tblRH.FieldByName('RaceDate').AsDateTime := edtOverrideDate.Date;
            tblRH.KeyFieldCount := 1;

            tblRH.ApplyRange;
         end;

         tblRH.Filtered := False;
         InitPrgBar(tblRH.RecordCount);
         UpdateStatusBar('Processing Results');

         tblRH.First();
         while not tblRH.Eof do begin
            IncPrgBar();

            //
            bDDFirstRaceMatched := False;
            bDDFirstRaceLeg1Matched := False;
            bDDFirstRaceLeg2Matched := False;
            if (tblRH.FieldByName('DailyDoublePayoutFirstRace').AsFloat > 0) then begin
               for iIdx := 1 to 20 do begin
                  Exclude(iDDSelections1stLeg, iIdx);
                  Exclude(iDDSelections2ndLeg, iIdx);
               end;

               try
                  Split(CleanEntryNbrs(tblRH.FieldByName('DDFirstRace').AsString), 'W', lstPicks);
                  if (lstPicks.Count = 2) then begin
                     sPicksLeg1 := StringListTrim(lstPicks[0]);
                     sPicksLeg2 := StringListTrim(lstPicks[1]);

                     Split(sPicksLeg1, '-', lstDD);
                     for iIdx := 0 to lstDD.Count - 1 do begin
                        Include(iDDSelections1stLeg, atoi(lstDD[iIdx]));
                     end;
                     FreeAndNil(lstDD);

                     Split(sPicksLeg2, '-', lstDD);
                     for iIdx := 0 to lstDD.Count - 1 do begin
                        Include(iDDSelections2ndLeg, atoi(lstDD[iIdx]));
                     end;
                     FreeAndNil(lstDD);
                  end;

                  Split(tblRH.FieldByName('DailyDoubleNbrsFirstRace').AsString, '-', lstResults);
                  if (lstResults.Count = 2) then begin
                     sResultsLeg1 := StringListTrim(lstResults[0]);
                     sResultsLeg2 := StringListTrim(lstResults[1]);

                     Split(sResultsLeg1, '/', lstDD);
                     for iIdx := 0 to lstDD.Count - 1 do begin
                        if atoi(lstDD[iIdx]) in iDDSelections1stLeg then begin
                           bDDFirstRaceLeg1Matched := True;
                        end;
                     end;
                     FreeAndNil(lstDD);

                     Split(sResultsLeg2, '/', lstDD);
                     for iIdx := 0 to lstDD.Count - 1 do begin
                        if atoi(lstDD[iIdx]) in iDDSelections2ndLeg then begin
                           bDDFirstRaceLeg2Matched := True;
                        end;
                     end;
                     FreeAndNil(lstDD);
                  end;

                  if ((lstResults.Count = 2) and (lstPicks.Count = 2)) then begin
                     if (sResultsLeg1 = 'ALL') then begin
                        bDDFirstRaceLeg1Matched := True;
                     end;
                     if (sResultsLeg2 = 'ALL') then begin
                        bDDFirstRaceLeg2Matched := True;
                     end;
                     if ((bDDFirstRaceLeg1Matched) and (bDDFirstRaceLeg2Matched)) then begin
                        bDDFirstRaceMatched := True;
                     end;
                  end;
               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bPk3FirstRaceMatched := False;
            bPk3FirstRaceLeg1Matched := False;
            bPk3FirstRaceLeg2Matched := False;
            bPk3FirstRaceLeg3Matched := False;
            if (tblRH.FieldByName('Pick3PayoutFirstRace').AsFloat > 0) then begin
               for iIdx := 1 to 20 do begin
                  Exclude(iPk3Selections1stLeg, iIdx);
                  Exclude(iPk3Selections2ndLeg, iIdx);
                  Exclude(iPk3Selections3rdLeg, iIdx);
               end;

               try
                  Split(CleanEntryNbrs(tblRH.FieldByName('Pick3FirstRace').AsString), 'W', lstPicks);
                  if (lstPicks.Count = 3) then begin
                     sPicksLeg1 := StringListTrim(lstPicks[0]);
                     sPicksLeg2 := StringListTrim(lstPicks[1]);
                     sPicksLeg3 := StringListTrim(lstPicks[2]);

                     Split(sPicksLeg1, '-', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        Include(iPk3Selections1stLeg, atoi(lstPk3[iIdx]));
                     end;
                     FreeAndNil(lstPk3);

                     Split(sPicksLeg2, '-', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        Include(iPk3Selections2ndLeg, atoi(lstPk3[iIdx]));
                     end;
                     FreeAndNil(lstPk3);

                     Split(sPicksLeg3, '-', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        Include(iPk3Selections3rdLeg, atoi(lstPk3[iIdx]));
                     end;
                     FreeAndNil(lstPk3);
                  end;

                  Split(tblRH.FieldByName('Pick3NbrsFirstRace').AsString, '-', lstResults);
                  if (lstResults.Count = 3) then begin
                     sResultsLeg1 := StringListTrim(lstResults[0]);
                     sResultsLeg2 := StringListTrim(lstResults[1]);
                     sResultsLeg3 := StringListTrim(lstResults[2]);

                     Split(sResultsLeg1, '/', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        if atoi(lstPk3[iIdx]) in iPk3Selections1stLeg then begin
                           bPk3FirstRaceLeg1Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk3);

                     Split(sResultsLeg2, '/', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        if atoi(lstPk3[iIdx]) in iPk3Selections2ndLeg then begin
                           bPk3FirstRaceLeg2Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk3);

                     Split(sResultsLeg3, '/', lstPk3);
                     for iIdx := 0 to lstPk3.Count - 1 do begin
                        if atoi(lstPk3[iIdx]) in iPk3Selections3rdLeg then begin
                           bPk3FirstRaceLeg3Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk3);
                  end;

                  if ((lstResults.Count = 3) and (lstPicks.Count = 3)) then begin

                     if (sResultsLeg2 = 'ALL') then begin
                        bPk3FirstRaceLeg2Matched := True;
                     end;
                     if (sResultsLeg3 = 'ALL') then begin
                        bPk3FirstRaceLeg3Matched := True;
                     end;

                     if ((bPk3FirstRaceLeg1Matched) and (bPk3FirstRaceLeg2Matched) and (bPk3FirstRaceLeg3Matched)) then begin
                        bPk3FirstRaceMatched := True;
                     end;
                  end;

               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bPk4FirstRaceMatched := False;
            bPk4FirstRaceLeg1Matched := False;
            bPk4FirstRaceLeg2Matched := False;
            bPk4FirstRaceLeg3Matched := False;
            bPk4FirstRaceLeg4Matched := False;
            if (tblRH.FieldByName('Pick4PayoutFirstRace').AsFloat > 0) then begin
               for iIdx := 1 to 20 do begin
                  Exclude(iPk4Selections1stLeg, iIdx);
                  Exclude(iPk4Selections2ndLeg, iIdx);
                  Exclude(iPk4Selections3rdLeg, iIdx);
                  Exclude(iPk4Selections4thLeg, iIdx);
               end;

               try
                  Split(CleanEntryNbrs(tblRH.FieldByName('Pick4FirstRace').AsString), 'W', lstPicks);
                  if (lstPicks.Count = 4) then begin
                     sPicksLeg1 := StringListTrim(lstPicks[0]);
                     sPicksLeg2 := StringListTrim(lstPicks[1]);
                     sPicksLeg3 := StringListTrim(lstPicks[2]);
                     sPicksLeg4 := StringListTrim(lstPicks[3]);

                     Split(sPicksLeg1, '-', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        Include(iPk4Selections1stLeg, atoi(lstPk4[iIdx]));
                     end;
                     FreeAndNil(lstPk4);

                     Split(sPicksLeg2, '-', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        Include(iPk4Selections2ndLeg, atoi(lstPk4[iIdx]));
                     end;
                     FreeAndNil(lstPk4);

                     Split(sPicksLeg3, '-', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        Include(iPk4Selections3rdLeg, atoi(lstPk4[iIdx]));
                     end;
                     FreeAndNil(lstPk4);

                     Split(sPicksLeg4, '-', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        Include(iPk4Selections4thLeg, atoi(lstPk4[iIdx]));
                     end;
                     FreeAndNil(lstPk4);
                  end;

                  Split(tblRH.FieldByName('Pick4NbrsFirstRace').AsString, '-', lstResults);
                  if (lstResults.Count = 4) then begin
                     sResultsLeg1 := StringListTrim(lstResults[0]);
                     sResultsLeg2 := StringListTrim(lstResults[1]);
                     sResultsLeg3 := StringListTrim(lstResults[2]);
                     sResultsLeg4 := StringListTrim(lstResults[3]);

                     Split(sResultsLeg1, '/', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        if atoi(lstPk4[iIdx]) in iPk4Selections1stLeg then begin
                           bPk4FirstRaceLeg1Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk4);

                     Split(sResultsLeg2, '/', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        if atoi(lstPk4[iIdx]) in iPk4Selections2ndLeg then begin
                           bPk4FirstRaceLeg2Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk4);

                     Split(sResultsLeg3, '/', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        if atoi(lstPk4[iIdx]) in iPk4Selections3rdLeg then begin
                           bPk4FirstRaceLeg3Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk4);

                     Split(sResultsLeg4, '/', lstPk4);
                     for iIdx := 0 to lstPk4.Count - 1 do begin
                        if atoi(lstPk4[iIdx]) in iPk4Selections4thLeg then begin
                           bPk4FirstRaceLeg4Matched := True;
                        end;
                     end;
                     FreeAndNil(lstPk4);
                  end;

                  if ((lstResults.Count = 4) and (lstPicks.Count = 4)) then begin
                     if (sResultsLeg2 = 'ALL') then begin
                        bPk4FirstRaceLeg2Matched := True;
                     end;
                     if (sResultsLeg3 = 'ALL') then begin
                        bPk4FirstRaceLeg3Matched := True;
                     end;
                     if (sResultsLeg4 = 'ALL') then begin
                        bPk4FirstRaceLeg4Matched := True;
                     end;

                     if ((bPk4FirstRaceLeg1Matched) and (bPk4FirstRaceLeg2Matched) and (bPk4FirstRaceLeg3Matched) and (bPk4FirstRaceLeg4Matched)) then begin
                        bPk4FirstRaceMatched := True;
                     end;
                  end;

               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bTriMatched := False;
            bTriLeg1Matched := False;
            bTriLeg2Matched := False;
            bTriLeg3Matched := False;
            if (tblRH.FieldByName('TrifectaPayout').AsFloat > 0) then begin
               try

                  sTriPicks := tblRH.FieldByName('Tri').AsString;
                  sTriPicks := FastReplace(sTriPicks, 'W', '-', True);
                  Split(CleanEntryNbrs(sTriPicks), '-', lstPicks);

                  Split(tblRH.FieldByName('TrifectaNbrs').AsString, '-', lstResults);
                  if ((lstResults.Count = 3) and (lstPicks.Count >= 3)) then begin
                     sKeyHorse := '';
                     sWheelHorse1 := '';
                     sWheelHorse2 := '';
                     sWheelHorse3 := '';

                     sResultsWinHorse := '';
                     sResultsPlcHorse := '';
                     sResultsShoHorse := '';

                     sKeyHorse := StringListTrim(lstPicks[0]);
                     sWheelHorse1 := StringListTrim(lstPicks[1]);
                     sWheelHorse2 := StringListTrim(lstPicks[2]);

                     sResultsWinHorse := StringListTrim(lstResults[0]);
                     sResultsPlcHorse := StringListTrim(lstResults[1]);
                     sResultsShoHorse := StringListTrim(lstResults[2]);

                     if (sKeyHorse = sResultsWinHorse) then begin
                        bTriLeg1Matched := True;
                     end;

                     if (bTriLeg1Matched) then begin
                        if ((sWheelHorse1 = sResultsPlcHorse) or
                           (sWheelHorse1 = sResultsShoHorse)) then begin
                           bTriLeg2Matched := True;
                        end;
                        if (sResultsPlcHorse = 'ALL') then begin
                           bTriLeg2Matched := True;
                        end;

                        if ((sWheelHorse2 = sResultsPlcHorse) or
                           (sWheelHorse2 = sResultsShoHorse)) then begin
                           bTriLeg3Matched := True;
                        end;
                        if (sResultsShoHorse = 'ALL') then begin
                           bTriLeg3Matched := True;
                        end;
                     end;

                     if ((bTriLeg1Matched) and (bTriLeg2Matched) and (bTriLeg3Matched)) then begin
                        bTriMatched := True;
                     end;
                  end;
               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bSfcMatched := False;
            bSfcLeg1Matched := False;
            bSfcLeg2Matched := False;
            bSfcLeg3Matched := False;
            bSfcLeg4Matched := False;
            if (tblRH.FieldByName('SuperfectaPayout').AsFloat > 0) then begin
               try
                  sSuperPicks := tblRH.FieldByName('Super').AsString;
                  sSuperPicks := FastReplace(sSuperPicks, 'W', '-', True);
                  Split(CleanEntryNbrs(sSuperPicks), '-', lstPicks);

                  Split(tblRH.FieldByName('SuperfectaNbrs').AsString, '-', lstResults);
                  if ((lstResults.Count = 4) and (lstPicks.Count >= 4)) then begin
                     sKeyHorse := '';
                     sWheelHorse1 := '';
                     sWheelHorse2 := '';
                     sWheelHorse3 := '';

                     sResultsWinHorse := '';
                     sResultsPlcHorse := '';
                     sResultsShoHorse := '';
                     sResults4thHorse := '';

                     sKeyHorse := StringListTrim(lstPicks[0]);
                     sWheelHorse1 := StringListTrim(lstPicks[1]);
                     sWheelHorse2 := StringListTrim(lstPicks[2]);
                     sWheelHorse3 := StringListTrim(lstPicks[3]);

                     sResultsWinHorse := StringListTrim(lstResults[0]);
                     sResultsPlcHorse := StringListTrim(lstResults[1]);
                     sResultsShoHorse := StringListTrim(lstResults[2]);
                     sResults4thHorse := StringListTrim(lstResults[3]);

                     if (sKeyHorse = sResultsWinHorse) then begin
                        bSfcLeg1Matched := True;
                     end;

                     if (bSfcLeg1Matched) then begin
                        if ((sWheelHorse1 = sResultsPlcHorse) or
                           (sWheelHorse1 = sResultsShoHorse) or
                           (sWheelHorse1 = sResults4thHorse)) then begin
                           bSfcLeg2Matched := True;
                        end;
                        if (sResultsPlcHorse = 'ALL') then begin
                           bSfcLeg2Matched := True;
                        end;

                        if ((sWheelHorse2 = sResultsPlcHorse) or
                           (sWheelHorse2 = sResultsShoHorse) or
                           (sWheelHorse2 = sResults4thHorse)) then begin
                           bSfcLeg3Matched := True;
                        end;
                        if (sResultsShoHorse = 'ALL') then begin
                           bSfcLeg3Matched := True;
                        end;

                        if ((sWheelHorse3 = sResultsPlcHorse) or
                           (sWheelHorse3 = sResultsShoHorse) or
                           (sWheelHorse3 = sResults4thHorse)) then begin
                           bSfcLeg4Matched := True;
                        end;
                        if (sResultsShoHorse = 'ALL') then begin
                           bSfcLeg4Matched := True;
                        end;
                     end;

                     if ((bSfcLeg1Matched) and (bSfcLeg2Matched) and (bSfcLeg3Matched) and (bSfcLeg4Matched)) then begin
                        bSfcMatched := True;
                     end;
                  end;
               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bExaMatched := False;
            bExaTopMatched := False;
            bExaBottomMatched := False;
            if (tblRH.FieldByName('ExactaPayout').AsFloat > 0) then begin
               try
                  if (tblRH.FieldByName('Value').AsString <> '') then begin
                     sExactaPicks := tblRH.FieldByName('Exacta').AsString;
                     sExactaPicks := FastReplace(sExactaPicks, 'W', '-', True);
                     Split(CleanEntryNbrs(sExactaPicks), '-', lstPicks);

                     Split(tblRH.FieldByName('ExactaNbrs').AsString, '-', lstResults);

                     // Box else Key
                     if ((lstResults.Count = 2) and (lstPicks.Count = 2)) then begin
                        sBoxHorse1 := '';
                        sBoxHorse2 := '';

                        sResultsWinHorse := '';
                        sResultsPlcHorse := '';

                        sBoxHorse1 := StringListTrim(lstPicks[0]);
                        sBoxHorse2 := StringListTrim(lstPicks[1]);

                        sResultsWinHorse := StringListTrim(lstResults[0]);
                        sResultsPlcHorse := StringListTrim(lstResults[1]);

                        if ((sBoxHorse1 = sResultsWinHorse) or
                           (sBoxHorse1 = sResultsPlcHorse)) then begin
                           bExaTopMatched := True;
                        end;

                        if ((sBoxHorse2 = sResultsWinHorse) or
                           (sBoxHorse2 = sResultsPlcHorse)) then begin
                           bExaBottomMatched := True;
                        end;

                        if ((bExaTopMatched) and (bExaBottomMatched)) then begin
                           bExaMatched := True;
                        end;
                     end;

                  end else begin
                     sExactaPicks := tblRH.FieldByName('Exacta').AsString;
                     sExactaPicks := FastReplace(sExactaPicks, 'W', '-', True);
                     Split(CleanEntryNbrs(sExactaPicks), '-', lstPicks);

                     Split(tblRH.FieldByName('ExactaNbrs').AsString, '-', lstResults);

                     if ((lstResults.Count = 2) and (lstPicks.Count = 3)) then begin
                        sKeyHorse := '';
                        sWheelHorse1 := '';
                        sWheelHorse2 := '';

                        sResultsWinHorse := '';
                        sResultsPlcHorse := '';

                        sKeyHorse := StringListTrim(lstPicks[0]);
                        sWheelHorse1 := StringListTrim(lstPicks[1]);
                        sWheelHorse2 := StringListTrim(lstPicks[2]);

                        sResultsWinHorse := StringListTrim(lstResults[0]);
                        sResultsPlcHorse := StringListTrim(lstResults[1]);

                        if (sKeyHorse = sResultsWinHorse) then begin
                           bExaTopMatched := True;
                        end;

                        if (bExaTopMatched) then begin
                           if (sWheelHorse1 = sResultsPlcHorse) then begin
                              bExaBottomMatched := True;
                           end;
                           if (sWheelHorse2 = sResultsPlcHorse) then begin
                              bExaBottomMatched := True;
                           end;
                           if (sResultsPlcHorse = 'ALL') then begin
                              bExaBottomMatched := True;
                           end;
                        end;

                        if ((bExaTopMatched) and (bExaBottomMatched)) then begin
                           bExaMatched := True;
                        end;
                     end;
                  end;
               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            //
            bQuiMatched := False;
            bQuiTopMatched := False;
            bQuiBottomMatched := False;
            if (tblRH.FieldByName('QuinellaPayout').AsFloat > 0) then begin
               try
                  Split(CleanEntryNbrs(tblRH.FieldByName('Quinella').AsString), '-', lstPicks);
                  Split(tblRH.FieldByName('QuinellaNbrs').AsString, '-', lstResults);

                  if ((lstResults.Count = 2) and (lstPicks.Count = 2)) then begin
                     sBoxHorse1 := '';
                     sBoxHorse2 := '';

                     sResultsWinHorse := '';
                     sResultsPlcHorse := '';

                     sBoxHorse1 := StringListTrim(lstPicks[0]);
                     sBoxHorse2 := StringListTrim(lstPicks[1]);

                     sResultsWinHorse := StringListTrim(lstResults[0]);
                     sResultsPlcHorse := StringListTrim(lstResults[1]);

                     if ((sBoxHorse1 = sResultsWinHorse) or
                        (sBoxHorse1 = sResultsPlcHorse)) then begin
                        bQuiTopMatched := True;
                     end;
                     if ((sBoxHorse2 = sResultsWinHorse) or
                        (sBoxHorse2 = sResultsPlcHorse)) then begin
                        bQuiBottomMatched := True;
                     end;

                     if ((bQuiTopMatched) and (bQuiBottomMatched)) then begin
                        bQuiMatched := True;
                     end;
                  end;
               finally
                  FreeAndNil(lstPicks);
                  FreeAndNil(lstResults);
               end;
            end;

            tblRH.Edit();
            tblRH.FieldByName('IsExactaMatched').AsBoolean := bExaMatched;
            tblRH.FieldByName('IsQuinellaMatched').AsBoolean := bQuiMatched;
            tblRH.FieldByName('IsTrifectaMatched').AsBoolean := bTriMatched;
            tblRH.FieldByName('IsSuperfectaMatched').AsBoolean := bSfcMatched;

            tblRH.FieldByName('IsDailyDoubleMatchedFirstRace').AsBoolean := bDDFirstRaceMatched;
            tblRH.FieldByName('IsPick3MatchedFirstRace').AsBoolean := bPk3FirstRaceMatched;
            tblRH.FieldByName('IsPick4MatchedFirstRace').AsBoolean := bPk4FirstRaceMatched;

            //            tblRH.FieldByName('IsDailyDoubleMatchedLastRace').AsBoolean := bDDFirstRaceMatched;
            //            tblRH.FieldByName('IsPick3MatchedLastRace').AsBoolean := bPk3FirstRaceMatched;
            //            tblRH.FieldByName('IsPick4MatchedLastRace').AsBoolean := bPk4FirstRaceMatched;

            tblRH.Post();
            tblRH.Next();
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTableExclusive(tblRH);
      ClearPrgStatusBars();
   end;

end;


end.
