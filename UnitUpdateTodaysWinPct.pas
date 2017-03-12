unit UnitUpdateTodaysWinPct;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateTodaysWagerWinPct
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   tblTC: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bOneDay: boolean;
   iNbrOfDays: integer;
   bAltOrder: boolean
   );

procedure UpdateTodaysWagerWinPctRank
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking, UnitGetHandicappingKeys;

procedure UpdateTodaysWagerWinPct
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblF: TDBISAMTable;
   tblTC: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bOneDay: boolean;
   iNbrOfDays: integer;
   bAltOrder: boolean

   );
var

   sSurface: string;
   sRaceType: string;
   sTurfIndicator: string;
   sDebutIndicator: string;
   sRouteIndicator: string;
   iAge: integer;

   sPrimaryOrderKey: string;
   sTodaysKey: string;
   sTodaysSpdKey: string;

   sPowerAdvantageAllKey: string;
   sPowerAdvantageClsKey: string;

   sEarlyPaceAdvantageAllKey: string;
   sMiddlePaceAdvantageAllKey: string;
   sLatePaceAdvantageAllKey: string;

   sEarlyPaceAdvantageTrkKey: string;
   sMiddlePaceAdvantageTrkKey: string;
   sLatePaceAdvantageTrkKey: string;

   sEarlyPaceAdvantageClsKey: string;
   sMiddlePaceAdvantageClsKey: string;
   sLatePaceAdvantageClsKey: string;

   sSpdClsKey: string;
   sXS2Key: string;
   sXSKey: string;

   sPostPosKey: string;
   sPaceIndicatorKey: string;

   sCombinedPaceAdvantageTrkKey: string;

   iEarlyPaceAdvantage: integer;
   iMiddlePaceAdvantage: integer;
   iCombinedPaceAdvantage: integer;

   fEarlyPaceAdvantageValueBet: double;
   fMiddlePaceAdvantageValueBet: double;

   bPlayMe: boolean;

   fSaveWinPct: double;
   iSaveStarts: integer;
   sSaveOrderKey: string;
   fMorningLineTo1: double;
   fMorningLineTo1Probability: double;

   procedure SetFlds();
   begin

      tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
      tblE.FieldByName('TodaysWagerValueBet').AsFloat := tblF.FieldByName('ValueBet').AsFloat;

      if (UpperCase(tblE.TableName) = 'ENTRY') then begin
         tblE.FieldByName('TodaysWagerStarts').AsInteger := tblF.FieldByName('Starts').AsInteger;
         tblE.FieldByName('TodaysWagerWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
         tblE.FieldByName('TodaysWagerAvgOdds').AsFloat := tblF.FieldByName('AvgOdds').AsFloat;
         tblE.FieldByName('TodaysWagerMinOdds').AsFloat := tblF.FieldByName('MinOdds').AsFloat;
         tblE.FieldByName('TodaysWagerMaxOdds').AsFloat := tblF.FieldByName('MaxOdds').AsFloat;
         tblE.FieldByName('TodaysWagerAvgWinOdds').AsFloat := tblF.FieldByName('AvgWinOdds').AsFloat;
         tblE.FieldByName('TodaysWagerMinWinOdds').AsFloat := tblF.FieldByName('MinWinOdds').AsFloat;
         tblE.FieldByName('TodaysWagerMaxWinOdds').AsFloat := tblF.FieldByName('MaxWinOdds').AsFloat;
      end;

   end;

begin

   hLog.AddToLog('UpdateTodaysWagerWinPct', msevOperation);
   try
      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblF);
      OpenTable(tblTC);

      if (bOneDay) then begin
         tblE.IndexName := 'ByRangeRaceDate';
         tblE.SetRangeStart;
         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         tblE.KeyFieldCount := 1;

         tblE.SetRangeEnd;
         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         tblE.KeyFieldCount := 1;

         tblE.ApplyRange;
      end else begin
         tblE.IndexName := 'ByRangeRaceDate';

         tblE.SetRangeStart;
         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
         tblE.KeyFieldCount := 1;

         tblE.SetRangeEnd;
         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
         tblE.KeyFieldCount := 1;

         tblE.ApplyRange;
      end;


      try
         tblE.First();
         while not tblE.Eof do begin
            UpdateEntriesProgressStatusBar(tblE, 'Updating Todays Wager Order - ');
            SetRaceEntriesKey(tblR, tblE);

            if tblR.GotoKey() then begin

               tblR.Edit();
               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  if (bAltOrder) then begin
                     tblR.Edit();
                     // tblR.FieldByName('Surface').AsString := tblR.FieldByName('ActualSurface').AsString;
                     tblR.Post();
                  end else begin
                     tblR.Edit();
                     // tblR.FieldByName('Surface').AsString := tblR.FieldByName('ActualSurface').AsString;
                     tblR.Post();
                  end;
               end;
               sSurface := tblR.FieldByName('Surface').AsString;

               sRaceType := tblR.FieldByName('RaceType').AsString;

               iAge := tblE.FieldByName('Age').AsInteger;
               sTurfIndicator := tblE.FieldByName('TurfIndicator').AsString;
               sDebutIndicator := tblE.FieldByName('DebutIndicator').AsString;
               sRouteIndicator := tblE.FieldByName('RouteIndicator').AsString;

               sPrimaryOrderKey := '';
               sTodaysKey := '';
               sSpdClsKey := '';
               sXS2Key := '';
               sXSKey := '';

               tblE.Edit();

               fSaveWinPct := 0;
               iSaveStarts := 0;
               sSaveOrderKey := '';

               fMorningLineTo1 := tblE.FieldByName('MorningLineTo1').AsFloat;
               if (fMorningLineTo1 > 0) then begin
                  fMorningLineTo1Probability := (1 / (1 + fMorningLineTo1));
               end;
               tblE.FieldByName('TodaysWagerWinPct').AsFloat := fMorningLineTo1Probability * 100;

               // Default to morning line
               //sTodaysKey := GetMorningLineKeyTrkCodeRaceType(tblR, tblE);
               sTodaysKey := GetMorningLineKeyPower(tblR, tblE);
               if (sTodaysKey <> '') then begin
                  tblF.IndexName := '';
                  tblF.SetKey();
                  tblF.FieldByName('OrderKey').AsString := sTodaysKey;
                  if (tblF.GotoKey()) then begin

                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                        tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
                     end;
                     SetFlds();
                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                        fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                        iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                        sSaveOrderKey := sTodaysKey;
                     end;

                  end;
               end;

               // Override if enough starts
               sTodaysKey := GetMorningLineKeyTrkCodePower(tblR, tblE);
               if (sTodaysKey <> '') then begin
                  tblF.IndexName := '';
                  tblF.SetKey();
                  tblF.FieldByName('OrderKey').AsString := sTodaysKey;
                  if (tblF.GotoKey()) then begin

                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                        tblE.FieldByName('FinalOrderKey').AsString := tblF.FieldByName('OrderKey').AsString;
                        tblE.FieldByName('FinalOrderWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
                        tblE.FieldByName('FinalOrderValueBet').AsFloat := tblF.FieldByName('ValueBet').AsFloat;
                     end;

                     if (tblF.FieldByName('Starts').AsInteger >= 16) then begin
                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
                        end;
                        SetFlds();
                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                           sSaveOrderKey := sTodaysKey;
                        end;
                     end;

                  end;
               end;


               //
               //               sTodaysKey := GetTrainerPowerRank(tblR, tblE);
               //               if (sTodaysKey <> '') then begin
               //                  tblF.IndexName := '';
               //                  tblF.SetKey();
               //                  tblF.FieldByName('OrderKey').AsString := sTodaysKey;
               //                  if (tblF.GotoKey()) then begin
               //
               //                     if (tblF.FieldByName('Starts').AsInteger >= 16) then begin
               //                        if (tblF.FieldByName('WinPct').AsFloat > fSaveWinPct) then begin
               //
               //                           if (UpperCase(tblE.TableName) = 'ENTRY') then begin
               //                              tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
               //                           end;
               //
               //                           SetFlds();
               //
               //                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
               //                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
               //                           sSaveOrderKey := sTodaysKey;
               //                        end;
               //                     end;
               //
               //                  end;
               //               end;
               //
               //

                              //     if (tblE.FieldByName('DebutIndicator').AsString = '') and (tblE.FieldByName('DaysLast').AsInteger <= 90) then begin
                    //                  if ((tblE.FieldByName('EarlyPace').AsFloat < 9999) and (tblE.FieldByName('EarlyPaceRank').AsInteger = 1)) or
                    //                     ((tblE.FieldByName('MiddlePace').AsFloat < 9999) and (tblE.FieldByName('MiddlePaceRank').AsInteger = 1)) or
                    //                     ((tblE.FieldByName('LatePace').AsFloat < 9999) and (tblE.FieldByName('LatePaceRank').AsInteger = 1)) or
                    //                     (
                    //                     ((tblE.FieldByName('KSP1stCall').AsFloat > 0) and (tblE.FieldByName('KSP1stCallRank').AsInteger = 1)) and
                    //                     ((tblE.FieldByName('KSP2ndCall').AsFloat > 0) and (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) and
                    //                     ((tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1)) and
                    //                     ((tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1))
                    //                     ) then begin
                    //
                    //
                    //
                    //                     sTodaysKey := GetSpeedRankTrkCodeSpeedCount(tblR, tblE);
                    //                     if (sTodaysKey <> '') then begin
                    //                        tblF.IndexName := '';
                    //                        tblF.SetKey();
                    //                        tblF.FieldByName('OrderKey').AsString := sTodaysKey;
                    //                        if (tblF.GotoKey()) then begin
                    //
                    //                           if (tblF.FieldByName('Starts').AsInteger >= 16) then begin
                    //                              if (tblF.FieldByName('WinPct').AsFloat > fSaveWinPct) then begin
                    //                                 if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                    //                                    tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
                    //                                 end;
                    //
                    //                                 SetFlds();
                    //
                    //                                 if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                    //                                    fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                    //                                    iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                    //                                    sSaveOrderKey := sTodaysKey;
                    //                                 end;
                    //                              end;
                    //                           end;
                    //                        end;
                    //                     end;
                    //
                    //
                    //                     sTodaysKey := GetSpeedRankTrkCodeSurfaceDistanceSpeedCount(tblR, tblE);
                    //                     if (sTodaysKey <> '') then begin
                    //                        tblF.IndexName := '';
                    //                        tblF.SetKey();
                    //                        tblF.FieldByName('OrderKey').AsString := sTodaysKey;
                    //                        if (tblF.GotoKey()) then begin
                    //
                    //                           if (tblF.FieldByName('Starts').AsInteger >= 16) then begin
                    //                              if (tblF.FieldByName('WinPct').AsFloat > fSaveWinPct) then begin
                    //                                 if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                    //                                    tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
                    //                                 end;
                    //
                    //                                 SetFlds();
                    //
                    //                                 if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                    //                                    fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                    //                                    iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                    //                                    sSaveOrderKey := sTodaysKey;
                    //                                 end;
                    //                              end;
                    //                           end;
                    //
                    //                        end;
                    //                     end;
                    //
                    //                  end;
                    //               end;

               fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;

               sPostPosKey := GetPostPosKey(tblR, tblE);
               if (sPostPosKey <> '') then begin
                  tblF.IndexName := '';
                  tblF.SetKey();
                  tblF.FieldByName('OrderKey').AsString := sPostPosKey;
                  if (tblF.GotoKey()) then begin
                     tblE.FieldByName('PostPosWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
                     tblE.FieldByName('PostPosStarts').AsInteger := tblF.FieldByName('Starts').AsInteger;
                  end;
               end;


               if (tblE.FieldByName('DaysLast').AsInteger > 90) then begin
                  if (tblE.FieldByName('TotalTrn46To120Starts').AsInteger >= 4) then begin
                     if (tblE.FieldByName('TotalTrn46To120WinPct').AsFloat > fSaveWinPct) then begin
                        tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrn46To120Starts').AsFloat;
                        tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrn46To120WinPct').AsFloat;
                        tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TrnLayoff';
                        tblE.FieldByName('TodaysWagerMaxWinOdds').AsFloat := 0;
                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                           sSaveOrderKey := 'TrnLayoff';
                        end;
                     end;
                  end;
               end;


               if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
                  if (sDebutIndicator = '*') then begin
                     tblTC.IndexName := '';
                     tblTC.SetKey();
                     tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                     tblTC.FieldByName('Category').AsString := '1st time str';

                     if (tblTC.GotoKey()) then begin
                        if (tblTC.FieldByName('Starts').AsInteger >= 8) then begin
                           tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TrnDebut';
                           tblE.FieldByName('TotalTrnDebutWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                           tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                           tblE.FieldByName('TodaysWagerStarts').AsFloat := tblTC.FieldByName('Starts').AsFloat;
                           tblE.FieldByName('TodaysWagerMaxWinOdds').AsFloat := 0;
                           if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                              fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                              iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                              sSaveOrderKey := sTodaysKey;
                           end;
                        end;
                     end;
                  end;

                  if (sDebutIndicator = '**') then begin
                     tblTC.IndexName := '';
                     tblTC.SetKey();
                     tblTC.FieldByName('Trainer').AsString := tblE.FieldByName('Trainer').AsString;
                     tblTC.FieldByName('Category').AsString := '2nd career race';
                     if (tblTC.GotoKey()) then begin
                        if (tblTC.FieldByName('Starts').AsInteger >= 8) then begin
                           tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TrnTwoDebut';
                           tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                           tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblTC.FieldByName('WinPct').AsFloat;
                           tblE.FieldByName('TodaysWagerStarts').AsFloat := tblTC.FieldByName('Starts').AsFloat;
                           tblE.FieldByName('TodaysWagerMaxWinOdds').AsFloat := 0;
                           if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                              fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                              iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                              sSaveOrderKey := sTodaysKey;
                           end;
                        end;
                     end;
                  end;
               end;


               tblE.FieldByName('IsEliminated').AsBoolean := False;

               sTodaysKey := GetElimKey(tblR, tblE);
               if (sTodaysKey = 'NONE') then begin
                  tblF.IndexName := '';
                  tblF.SetKey();
                  tblF.FieldByName('OrderKey').AsString := 'NONE';
                  if (tblF.GotoKey()) then begin
                     //if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     //   tblE.FieldByName('TodaysWagerOrderKey').AsString := 'Elim-1';
                     //end;
                     //SetFlds();
                     //if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     //   fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                     //   iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                     //   sSaveOrderKey := 'Elim-1';
                     //end;
                     tblE.FieldByName('ElimWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
                  end;
               end;

               sTodaysKey := GetElim2Key(tblR, tblE);
               if (sTodaysKey = 'NONE2') then begin
                  tblF.IndexName := '';
                  tblF.SetKey();
                  tblF.FieldByName('OrderKey').AsString := 'NONE2';
                  if (tblF.GotoKey()) then begin
                     //if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     //   tblE.FieldByName('TodaysWagerOrderKey').AsString := 'Elim-2';
                     //end;
                     //SetFlds();
                     //if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                     //   fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
                     //   iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
                     //   sSaveOrderKey := 'Elim-2';
                     //end;
                     tblE.FieldByName('Elim2WinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
                  end;
               end;



               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := False;
               end;
               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := False;
               end;
               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := False;
               end;
               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := False;
               end;

               if ((tblE.FieldByName('ElimWinPct').AsFloat > 0) and
                  (tblE.FieldByName('Elim2WinPct').AsFloat > 0)) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := True;
               end;

               if ((tblE.FieldByName('TJMeetWinPct').AsInteger = 0) and
                  (tblE.FieldByName('TJ365WinPct').AsInteger = 0)) then begin
                  tblE.FieldByName('IsEliminated').AsBoolean := True;
               end;

               if (tblE.FieldByName('PostPosStarts').AsInteger > 20) then begin
                  if (tblE.FieldByName('PostPosWinPct').AsFloat < 1.0) then begin
                     tblE.FieldByName('IsEliminated').AsBoolean := True;
                  end;
               end;

               //
               sTodaysKey := sSaveOrderKey;

               tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
               tblE.FieldByName('IsWagerSheetSelected').AsBoolean := False;

               // if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
 //                  tblE.FieldByName('IsWagerSheetSelected').AsBoolean := False;
 //                  sTodaysKey := GetSpeedRankTrkCodeSpeedCount(tblR, tblE);
 //                  if (sTodaysKey <> '') then begin
 //                     tblF.IndexName := '';
 //                     tblF.SetKey();
 //                     tblF.FieldByName('OrderKey').AsString := sTodaysKey;
 //                     if (tblF.GotoKey()) then begin
 //
 //                        if ((SmartPos('E1', sTodaysKey) > 0) or (SmartPos('E2', sTodaysKey) > 0) or (SmartPos('E3', sTodaysKey) > 0)) then begin
 //                           if ((SmartPos('L1', sTodaysKey) > 0) or (SmartPos('L2', sTodaysKey) > 0)) then begin
 //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
 //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
 //                                 SetFlds();
 //                                 tblE.FieldByName('IsWagerSheetSelected').AsBoolean := True;
 //                                 tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
 //                              end;
 //                           end;
 //                        end;
 //
 //                     end;
 //                  end;
 //
 //                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
 //                  if (tblE.FieldByName('IsWagerSheetSelected').AsBoolean = True) then begin
 //                     if (tblF.FieldByName('TotalProfitLoss').AsFloat > 0) then begin
 //                        tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := True;
 //                     end;
 //                  end;
 //               end;

                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 1.0)) then begin
                //                     if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and (tblE.FieldByName('MiddlePaceRank').AsInteger = 1)) then begin
                //                        if ((tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) or (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;
                //
                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 1.0)) then begin
                //                     if ((tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1)) then begin
                //                        if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) or (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;
                //
                //
                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 1.0)) then begin
                //                     if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                //                        if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) or (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) or
                //                           (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) or (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;
                //
                //                  //
                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 10.0)) then begin
                //                     if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) and (tblE.FieldByName('MiddlePaceRank').AsInteger = 1)) then begin
                //                        if ((tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) or (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsWagerSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;
                //
                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 10.0)) then begin
                //                     if ((tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1)) then begin
                //                        if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) or (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsWagerSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;
                //
                //                  if ((tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) and (tblE.FieldByName('PostPosStarts').AsInteger > 20) and (tblE.FieldByName('PostPosWinPct').AsFloat > 10.0)) then begin
                //                     if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                //                        if ((tblE.FieldByName('EarlyPaceRank').AsInteger = 1) or (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) or
                //                           (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) or (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) or
                //                           (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) or (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                //                           if ((tblE.FieldByName('ElimWinPct').AsFloat = 0) and (tblE.FieldByName('Elim2WinPct').AsFloat = 0)) then begin
                //                              if ((tblE.FieldByName('TJMeetWinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger) or
                //                                 (tblE.FieldByName('TJ365WinPct').AsInteger > tblE.FieldByName('TotalTrnOddsWinPct').AsInteger)) then begin
                //                                 tblE.FieldByName('IsWagerSheetSelected').AsBoolean := True;
                //                              end;
                //                           end;
                //                        end;
                //                     end;
                //                  end;



               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  tblE.FieldByName('TodaysAltWagerWinPct').AsFloat := tblE.FieldByName('TrnTodayWinPct').AsFloat;
               end;

               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 90.91) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 100.01) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/10';
                  end;
                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 83.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 90.91) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 71.42) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 83.33) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '2/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 66.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 71.42) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/2';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 62.50) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 66.67) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 55.56) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 62.50) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '4/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 50.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 55.56) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 45.45) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 50.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '6/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 41.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 45.45) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 40.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 41.67) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/2';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 38.46) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 40.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '8/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 35.71) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 38.46) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/5';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 33.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 35.71) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '2/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 28.57) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 33.33) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '5/2';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 25.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 28.57) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 22.22) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 25.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/2';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 20.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 22.22) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '4/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 18.19) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 20.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/2';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 16.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 18.19) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '5/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 14.29) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 16.67) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '6/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 12.50) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 14.29) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 11.11) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 12.50) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '8/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 10.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 11.11) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 9.09) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 10.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '10/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 8.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 9.09) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '11/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 7.69) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 8.33) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '12/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 7.14) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 7.69) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '13/1';
                  end;
                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 6.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 7.14) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '14/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 6.25) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 6.67) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '15/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 5.88) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 6.25) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '16/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 5.56) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 5.88) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '17/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 5.26) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 5.56) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '18/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 5.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 5.26) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '19/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.76) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 5.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '20/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.55) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.76) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '21/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.35) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.55) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '22/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.17) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.35) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '23/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.17) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '24/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 3.85) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.00) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '25/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 3.23) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 3.85) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '30/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 2.78) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 3.23) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '35/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 2.44) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 2.78) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '40/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 2.17) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 2.44) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '45/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 1.96) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 2.17) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '50/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 1.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 1.96) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '75/1';
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 1.33) then begin
                     tblE.FieldByName('TodaysWagerOddsDesc').AsString := '90/1';
                  end;
               end;




               if (tblE.FieldByName('PowerAdvantage').AsFloat > 6.00) then begin
                  tblE.FieldByName('IsHeavyChalk').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsHeavyChalk').AsBoolean := False;
               end;

               tblE.FieldByName('MorningLineWinPct').AsFloat := 1 / (tblE.FieldByName('MorningLineTo1').AsFloat + 1);
               tblE.FieldByName('MorningLineWinPct').AsFloat := Round(tblE.FieldByName('MorningLineWinPct').AsFloat * 100);

               //
               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
               end;



               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  tblE.FieldByName('IsValueDebutSelected').AsBoolean := False;
                  if ((tblR.FieldByName('Surface').AsString = 'D') and
                     (tblE.FieldByName('DebutIndicator').AsString = '*')) and
                     (tblE.FieldByName('IsEliminated').AsBoolean = False) and
                     (tblE.FieldByName('TotalTrnDebutWinPct').AsFloat > tblE.FieldByName('TotalTrnOddsWinPct').AsFloat)
                     then begin
                     tblE.FieldByName('IsValueDebutSelected').AsBoolean := True;
                  end;

                  if ((tblR.FieldByName('Surface').AsString = 'T') and
                     (tblE.FieldByName('TurfIndicator').AsString = '*')) and
                     (tblE.FieldByName('IsEliminated').AsBoolean = False) and
                     (tblE.FieldByName('TotalTrnDebutWinPct').AsFloat > tblE.FieldByName('TotalTrnOddsWinPct').AsFloat)
                     then begin
                     tblE.FieldByName('IsValueDebutSelected').AsBoolean := True;
                  end;

                  //
                  tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := False;
                  if ((tblR.FieldByName('Surface').AsString = 'D') and
                     (tblE.FieldByName('DebutIndicator').AsString = '**')) and
                     (tblE.FieldByName('IsEliminated').AsBoolean = False) and
                     (tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat > tblE.FieldByName('TotalTrnOddsWinPct').AsFloat)
                     then begin
                     tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := True;
                  end;
                  if ((tblR.FieldByName('Surface').AsString = 'T') and
                     (tblE.FieldByName('TurfIndicator').AsString = '**')) and
                     (tblE.FieldByName('IsEliminated').AsBoolean = False) and
                     (tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat > tblE.FieldByName('TotalTrnOddsWinPct').AsFloat)
                     then begin
                     tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := True;
                  end;

                  if (tblE.FieldByName('IsFrontDoubleLiner').AsBoolean = True) then begin
                     if (tblE.FieldByName('IsEliminated').AsBoolean = False) then begin
                        tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                     end;
                  end;

                  if (tblE.FieldByName('IsTripleLiner').AsBoolean = True) then begin
                     if (tblE.FieldByName('IsEliminated').AsBoolean = False) then begin
                        tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                     end;
                  end;

                  if (tblE.FieldByName('IsEliminated').AsBoolean = True) then begin
                     tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
                     tblE.FieldByName('IsValueDebutSelected').AsBoolean := False;
                     tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := False;
                  end;




                  if (tblE.FieldByName('Trainer').AsString = 'GAINES CARLA') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;

                  if (tblE.FieldByName('Trainer').AsString = 'DOMENOSKY TAMMY') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;

                  if (tblE.FieldByName('Trainer').AsString = 'CIBELLI JANE') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;

                  if (tblE.FieldByName('Trainer').AsString = 'MASON INGRID') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'DEMASI KATHLEEN A') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'SILVERA LAURIE') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'MULHALL KRISTIN') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'MCBRIDE BARBARA I') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'LOVELL MICHELLE') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
                  if (tblE.FieldByName('Trainer').AsString = 'TARRANT AMY') then begin
                     tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := True;
                  end;
               end;

               //               if (tblE.FieldByName('MorningLineTo1').AsFloat > 15) then begin
               //                  tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := False;
               //                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
               //               end;
               //
               //               if (tblE.FieldByName('MorningLineTo1').AsFloat < 2.5) then begin
               //                  tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := False;
               //                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
               //               end;
               //
               //               if ((tblE.FieldByName('TJMeetWinPct').AsInteger = 0) and
               //                  (tblE.FieldByName('TJ365WinPct').AsInteger = 0)) then begin
               //                  tblE.FieldByName('IsTrainerSheetSelected').AsBoolean := False;
               //                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;


               tblR.FlushBuffers();


               tblE.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;


               if (tblR.FieldByName('Surface').AsString <> 'T') then begin
                  if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
                     if (sDebutIndicator = '*') then begin
                        if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                           if (tblE.FieldByName('ClassRating').AsFloat > 99.9) then begin
                              tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                           end;
                        end;
                     end;
                  end;
               end;

               if (tblR.FieldByName('Surface').AsString <> 'T') then begin
                  if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
                     if (sDebutIndicator = '**') then begin
                        if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                           if (tblE.FieldByName('ClassRating').AsFloat > 99.9) then begin
                              tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                           end;
                        end;
                     end;
                  end;
               end;

               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  if (sTurfIndicator = '*') then begin
                     if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                        if (tblE.FieldByName('TurfRating').AsFloat > 99.9) then begin
                           tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                        end;
                     end;
                  end;
               end;

               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  if (sTurfIndicator = '**') then begin
                     if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                        if (tblE.FieldByName('TurfRating').AsFloat > 99.9) then begin
                           tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                        end;
                     end;
                  end;
               end;




               tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;


               if (sRaceType <> 'MSW') then begin
                  if (sRaceType <> 'MCL') then begin
                     if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 0) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger < 4) then begin
                           if (tblE.FieldByName('PowerRank').AsInteger < 4) then begin
                              if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                                 if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                                    if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                                       if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                                          tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;

               if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                  if ((tblE.FieldByName('TJMeetWinPct').AsInteger = 0) and
                     (tblE.FieldByName('TJ365WinPct').AsInteger = 0)) then begin
                     tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
                  end;
               end;

               tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TJ365WinPct').AsFloat;
            //   if (tblE.FieldByName('TJMeetStarts').AsInteger > 16) then begin
              //    tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TJMeetWinPct').AsFloat;
              // end;

               //

               tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TotalTrn30WinPct').AsFloat;


               //if (tblE.FieldByName('DaysLast').AsInteger > 90) then begin
                //  if (tblE.FieldByName('TotalTrn46To120Starts').AsInteger > 0) then begin
                //     tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TotalTrn46To120WinPct').AsFloat;
                //  end;
              // end;
//
//               if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
//                  if (tblR.FieldByName('Surface').AsString = 'D') then begin
//                     if (sDebutIndicator = '*') then begin
//                        tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
//                     end;
//
//                     if (sDebutIndicator = '**') then begin
//                        tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
//                     end;
//                  end;
//               end;


               //if (tblE.FieldByName('TotalJky30Starts').AsInteger > 8) then begin
                 tblE.FieldByName('JockeyRating').AsFloat := tblE.FieldByName('TotalJky30WinPct').AsFloat;
              // end else begin
              //    tblE.FieldByName('JockeyRating').AsFloat := tblE.FieldByName('TotalJkyOddsWinPct').AsFloat;
              // end;

               tblE.FieldByName('OwnerRating').AsFloat := tblE.FieldByName('TotalTrnOwnWinPct').AsFloat;


               tblE.Post();
               tblE.FlushBuffers();
               tblE.Next();
            end else begin
               tblE.Next();
            end;
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;
   finally
      tblE.CancelRange;
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblF);
      CloseTable(tblTC);
      ClearPrgStatusBars();
   end;

end;

procedure UpdateTodaysWagerWinPctRank
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );
begin



   hLog.AddToLog('UpdateTodaysWagerWinPctRank', msevOperation);

   try
      SetRankingDouble(tblE, 'ByTodaysWagerWinPctRank', 'TodaysWagerWinPctRank', 'TodaysWagerWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOFDays, False);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;


   CloseTable(tblE);
   CloseTable(tblR);
   //
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.AddIndex('ByEarlyPaceAdvantageWinPctRank', 'TrkCode;RaceDate;RaceNbr;EarlyPaceAdvantageWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'EarlyPaceAdvantageWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);
   //   SetRankingDouble(tblE, 'ByEarlyPaceAdvantageWinPctRank', 'EarlyPaceAdvantageWinPctRank', 'EarlyPaceAdvantageWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOfDays, False);
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.DeleteIndex('ByEarlyPaceAdvantageWinPctRank');
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);
   //
   //
   //   //
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.AddIndex('ByMiddlePaceAdvantageWinPctRank', 'TrkCode;RaceDate;RaceNbr;MiddlePaceAdvantageWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'MiddlePaceAdvantageWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);
   //   SetRankingDouble(tblE, 'ByMiddlePaceAdvantageWinPctRank', 'MiddlePaceAdvantageWinPctRank', 'MiddlePaceAdvantageWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOfDays, False);
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.DeleteIndex('ByMiddlePaceAdvantageWinPctRank');
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);
   //
   //   //
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.AddIndex('ByLatePaceAdvantageWinPctRank', 'TrkCode;RaceDate;RaceNbr;LatePaceAdvantageWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'LatePaceAdvantageWinPct', icFull);
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);
   //   SetRankingDouble(tblE, 'ByLatePaceAdvantageWinPctRank', 'LatePaceAdvantageWinPctRank', 'LatePaceAdvantageWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOfDays, False);
   //   OpenTableExclusive(tblE);
   //   try
   //      tblE.DeleteIndex('ByLatePaceAdvantageWinPctRank');
   //   except
   //      on E: Exception do hLog.AddToLog(E.Message, msevException);
   //   end;
   //   CloseTableExclusive(tblE);

      //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByTrainerRatingRank', 'TrkCode;RaceDate;RaceNbr;TrainerRating;Power', [ixDescending], '', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRankingDouble(tblE, 'ByTrainerRatingRank', 'TrainerRatingRank', 'TrainerRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByTrainerRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);


   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByTrainerJockeyRatingRank', 'TrkCode;RaceDate;RaceNbr;TrainerJockeyRating;Power', [ixDescending], '', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRankingDouble(tblE, 'ByTrainerJockeyRatingRank', 'TrainerJockeyRatingRank', 'TrainerJockeyRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByTrainerJockeyRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);


   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByJockeyRatingRank', 'TrkCode;RaceDate;RaceNbr;JockeyRating;Power', [ixDescending], '', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRankingDouble(tblE, 'ByJockeyRatingRank', 'JockeyRatingRank', 'JockeyRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByJockeyRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);



   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByOwnerRatingRank', 'TrkCode;RaceDate;RaceNbr;OwnerRating;Power', [ixDescending], '', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRankingDouble(tblE, 'ByOwnerRatingRank', 'OwnerRatingRank', 'OwnerRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByOwnerRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);

   OpenTable(tblE);
   OpenTable(tblR);


end;

//
//
//procedure UpdateContenderWinPct
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   tblF: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: Integer;
//   bOneDay: boolean;
//   iNbrOfDays: integer
//   );
//var
//
//   sSurface: string;
//   sRaceType: string;
//   sTurfIndicator: string;
//   sDebutIndicator: string;
//   sRouteIndicator: string;
//   iAge: integer;
//
//   sLinerKey: string;
//   sLinerCntKey: string;
//
//   procedure SetFlds();
//   begin
//      tblE.FieldByName('PrimaryWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
//      tblE.FieldByName('PrimaryValueBet').AsFloat := tblF.FieldByName('ValueBet').AsFloat;
//
//      if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//         tblE.FieldByName('PrimaryStarts').AsInteger := tblF.FieldByName('Starts').AsInteger;
//         tblE.FieldByName('PrimaryWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
//         tblE.FieldByName('PrimaryAvgOdds').AsFloat := tblF.FieldByName('AvgOdds').AsFloat;
//         tblE.FieldByName('PrimaryMinOdds').AsFloat := tblF.FieldByName('MinOdds').AsFloat;
//         tblE.FieldByName('PrimaryMaxOdds').AsFloat := tblF.FieldByName('MaxOdds').AsFloat;
//         tblE.FieldByName('PrimaryAvgWinOdds').AsFloat := tblF.FieldByName('AvgWinOdds').AsFloat;
//         tblE.FieldByName('PrimaryMinWinOdds').AsFloat := tblF.FieldByName('MinWinOdds').AsFloat;
//         tblE.FieldByName('PrimaryMaxWinOdds').AsFloat := tblF.FieldByName('MaxWinOdds').AsFloat;
//         tblE.FieldByName('PrimaryIV').AsFloat := tblF.FieldByName('IV').AsFloat;
//         tblE.FieldByName('PrimaryIVRoi').AsFloat := tblF.FieldByName('IVRoi').AsFloat;
//      end;
//   end;
//
//begin
//
//   hLog.AddToLog('UpdateContenderWinPct', msevOperation);
//   try
//      OpenTable(tblR);
//      OpenTable(tblE);
//      OpenTable(tblF);
//
//      if (bOneDay) then begin
//         tblE.IndexName := 'ByRangeRaceDate';
//         tblE.SetRangeStart;
//         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//         tblE.KeyFieldCount := 1;
//
//         tblE.SetRangeEnd;
//         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//         tblE.KeyFieldCount := 1;
//
//         tblE.ApplyRange;
//      end else begin
//         tblE.IndexName := 'ByRangeRaceDate';
//
//         tblE.SetRangeStart;
//         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
//         tblE.KeyFieldCount := 1;
//
//         tblE.SetRangeEnd;
//         tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
//         tblE.KeyFieldCount := 1;
//
//         tblE.ApplyRange;
//      end;
//
//
//
//      try
//         tblE.First();
//         while not tblE.Eof do begin
//            UpdateEntriesProgressStatusBar(tblE, 'Updating Todays Wager Order - ');
//            SetRaceEntriesKey(tblR, tblE);
//
//            if tblR.GotoKey() then begin
//
//               sSurface := tblR.FieldByName('Surface').AsString;
//               sRaceType := tblR.FieldByName('RaceType').AsString;
//
//               iAge := tblE.FieldByName('Age').AsInteger;
//               sTurfIndicator := tblE.FieldByName('TurfIndicator').AsString;
//               sDebutIndicator := tblE.FieldByName('DebutIndicator').AsString;
//               sRouteIndicator := tblE.FieldByName('RouteIndicator').AsString;
//
//               sLinerKey := '';
//               sLinerCntKey := '';
//
//               tblE.Edit();
//
//               //               sLinerCntKey := GetLinerCntKey(tblR, tblE);
//               //               if (sLinerCntKey <> '') then begin
//               //                  tblF.IndexName := '';
//               //                  tblF.SetKey();
//               //                  tblF.FieldByName('OrderKey').AsString := sLinerCntKey;
//               //                  if (tblF.GotoKey()) then begin
//               //                     tblE.FieldByName('PrimaryOrderKey').AsString := sLinerCntKey;
//               //                     SetFlds();
//               //                  end;
//               //               end;
//               if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
//                  if (sDebutIndicator = '*') then begin
//                     tblE.FieldByName('PrimaryOrderKey').AsString := 'TrnDebut';
//                     tblE.FieldByName('PrimaryWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutWinPct').AsFloat;
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        tblE.FieldByName('PrimaryStarts').AsInteger := tblE.FieldByName('TotalTrnDebutStarts').AsInteger;
//                        tblE.FieldByName('PrimaryWins').AsInteger := tblE.FieldByName('TotalTrnDebutWins').AsInteger;
//                     end;
//                  end;
//               end;
//
//               if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
//                  if (sDebutIndicator = '**') then begin
//                     tblE.FieldByName('PrimaryOrderKey').AsString := 'TrnDebutTwo';
//                     tblE.FieldByName('PrimaryWinPct').AsFloat := tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        tblE.FieldByName('PrimaryStarts').AsInteger := tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
//                        tblE.FieldByName('PrimaryWins').AsInteger := tblE.FieldByName('TotalTrnDebutTwoWins').AsInteger;
//                     end;
//                  end;
//               end;
//
//               if (tblE.FieldByName('PrimaryWinPct').AsFloat = 0) then begin
//                  tblE.FieldByName('PrimaryWinPct').AsFloat := 1;
//               end;
//
//
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 90.91) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 100.01) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/10';
//               end;
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 83.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 90.91) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 71.42) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 83.33) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '2/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 66.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 71.42) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/2';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 62.50) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 66.67) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 55.56) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 62.50) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '4/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 50.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 55.56) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '1/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 45.45) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 50.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '6/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 41.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 45.45) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 40.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 41.67) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/2';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 38.46) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 40.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '8/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 35.71) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 38.46) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/5';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 33.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 35.71) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '2/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 28.57) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 33.33) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '5/2';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 25.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 28.57) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '3/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 22.22) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 25.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/2';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 20.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 22.22) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '4/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 18.19) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 20.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/2';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 16.67) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 18.19) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '5/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 14.29) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 16.67) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '6/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 12.50) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 14.29) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '7/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 11.11) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 12.50) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '8/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 10.00) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 11.11) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '9/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 9.09) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 10.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '10/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 8.33) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 9.09) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '11/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 7.69) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 8.33) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '12/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 6.25) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 7.69) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '15/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 4.76) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 6.25) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '20/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 3.85) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 4.76) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '25/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 3.23) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 3.85) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '30/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat >= 1.96) and (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 3.23) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '50/1';
//               end;
//
//               if (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 1.00) then begin
//                  tblE.FieldByName('TodaysWagerOddsDesc').AsString := '99/1';
//               end;
//
//
//               //
//               if (tblE.FieldByName('IsFrontDoubleLiner').AsBoolean = True)
//                  or
//                  (tblE.FieldByName('IsHeavyChalk').AsBoolean = True)
//                  or
//                  ((tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat > 25.00) and
//                  (tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat < 50.00))
//                  or
//                  ((tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat > 25.00) and
//                  (tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat < 50.00))
//                  and
//                  ((tblE.FieldByName('IsEliminated').AsBoolean = False) and
//                  (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1))
//                  //and
////(tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean = True)
//               then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//               end else begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//               end;
//
//               //
//               if ((tblE.FieldByName('Surface').AsString = 'D') and
//                  (tblE.FieldByName('DebutIndicator').AsString = '*'))
//                  or
//                  ((tblE.FieldByName('Surface').AsString = 'T') and
//                  (tblE.FieldByName('TurfIndicator').AsString = '*'))
//                  and
//                  //   ((tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean = True) and
//               ((tblE.FieldByName('IsEliminated').AsBoolean = False) and
//                  (tblE.FieldByName('TotalTrnDebutWinPct').AsFloat > tblE.FieldByName('TotalTrnWinPct').AsFloat) and
//                  (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1)) then begin
//                  tblE.FieldByName('IsValueDebutSelected').AsBoolean := True;
//               end else begin
//                  tblE.FieldByName('IsValueDebutSelected').AsBoolean := False;
//               end;
//
//               //
//               if ((tblE.FieldByName('Surface').AsString = 'D') and
//                  (tblE.FieldByName('DebutIndicator').AsString = '**'))
//                  or
//                  ((tblE.FieldByName('Surface').AsString = 'T') and
//                  (tblE.FieldByName('TurfIndicator').AsString = '**'))
//                  and
//                  //((tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean = True) and
//               ((tblE.FieldByName('IsEliminated').AsBoolean = False) and
//                  (tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat > 14.00) and
//                  (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1)) then begin
//                  tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := True;
//               end else begin
//                  tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean := False;
//               end;
//
//               if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
//                  //if (tblR.FieldByName('NbrDebutStarters').AsInteger > 0) then begin
//                  //   tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//                 // end;
//                  if (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 1) then begin
//                     tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//                  end;
//               end;
//
//               tblE.Post();
//
//
//               tblE.FlushBuffers();
//
//
//               tblE.Next();
//
//
//            end;
//         end;
//
//      except
//         on E: Exception do begin
//            hLog.AddToLog(E.Message, msevException);
//         end;
//      end;
//   finally
//      tblE.CancelRange;
//      CloseTable(tblR);
//      CloseTable(tblE);
//      CloseTable(tblF);
//      ClearPrgStatusBars();
//   end;
//
//end;
//
//procedure UpdateContenderWinPctRank
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: integer;
//   bOneDay: boolean;
//   iNbrOfDays: integer
//   );
//
//begin
//
//   hLog.AddToLog('UpdateContenderWinPctRank', msevOperation);
//   try
//      //      SetRanking(tblE, 'ByTodaysWagerWinPctRank', 'TodaysWagerWinPctRank', 'TodaysWagerWinPct', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOFDays);
//      SetRankingOld(tblE, 'ByPrimaryWinPctRank', 'PrimaryWinPctRank', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOFDays);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//end;


end.
//               tblE.FieldByName('Surface').AsString := tblR.FieldByName('Surface').AsString;
//               sTodaysKey := GetTrainerOwnerKey(tblR, tblE);
//               if (sTodaysKey <> '') then begin
//                  tblF.IndexName := '';
//                  tblF.SetKey();
//                  tblF.FieldByName('OrderKey').AsString := sTodaysKey;
//                  if (tblF.GotoKey()) then begin
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
//                     end;
//                     SetFlds();
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
//                        iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
//                        sSaveOrderKey := sTodaysKey;
//                     end;
//
//                     //  tblE.FieldByName('PowerAdvantageWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
//                  end;
//               end;
//
//               if (tblE.FieldByName('TodaysWagerStarts').AsInteger < 8) then begin
//                  sTodaysKey := GetTrainerOwnerAllKey(tblR, tblE);
//                  if (sTodaysKey <> '') then begin
//                     tblF.IndexName := '';
//                     tblF.SetKey();
//                     tblF.FieldByName('OrderKey').AsString := sTodaysKey;
//                     if (tblF.GotoKey()) then begin
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
//                        end;
//                        SetFlds();
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
//                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
//                           sSaveOrderKey := sTodaysKey;
//                        end;
//                     end;
//                  end;
//               end;
//
//               if (tblE.FieldByName('TodaysWagerStarts').AsInteger < 8) then begin
//                  sTodaysKey := GetTrainerJockeyKey(tblR, tblE);
//                  if (sTodaysKey <> '') then begin
//                     tblF.IndexName := '';
//                     tblF.SetKey();
//                     tblF.FieldByName('OrderKey').AsString := sTodaysKey;
//                     if (tblF.GotoKey()) then begin
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
//                        end;
//                        SetFlds();

//                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
//                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
//                           sSaveOrderKey := sTodaysKey;
//                        end;
//                     end;
//                  end;
//               end;
//
//               if (tblE.FieldByName('TodaysWagerStarts').AsInteger < 8) then begin
//                  sTodaysKey := GetTrainerJockeyAllKey(tblR, tblE);
//                  if (sTodaysKey <> '') then begin
//                     tblF.IndexName := '';
//                     tblF.SetKey();
//                     tblF.FieldByName('OrderKey').AsString := sTodaysKey;
//                     if (tblF.GotoKey()) then begin
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
//                        end;
//                        SetFlds();
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
//                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
//                           sSaveOrderKey := sTodaysKey;
//                        end;
//                     end;
//                  end;
//               end;
//
//               if (tblE.FieldByName('TodaysWagerStarts').AsInteger < 8) then begin
//                  sTodaysKey := GetTrainerAllKey(tblR, tblE);
//                  if (sTodaysKey <> '') then begin
//                     tblF.IndexName := '';
//                     tblF.SetKey();
//                     tblF.FieldByName('OrderKey').AsString := sTodaysKey;
//                     if (tblF.GotoKey()) then begin
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sTodaysKey;
//                        end;
//                        SetFlds();
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           fSaveWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
//                           iSaveStarts := tblE.FieldByName('TodaysWagerStarts').AsInteger;
//                           sSaveOrderKey := sTodaysKey;
//                        end;
//                     end;
//                  end;
//               end;
// if a maiden race
// if number of debut starters > 0
//  // exit
//               if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
//                  (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
//                  if (tblR.FieldByName('NbrDebutStarters').AsInteger > 0) then begin
//                     tblE.FieldByName('TodaysWagerWinPct').AsInteger := tblE.FieldByName('MorningLineWinPct').AsInteger;
//                     tblE.FieldByName('TodaysWagerOrderKey').AsString := 'M/L';
//                  end;
//               end;

// if turf race
// if number of turf debut starters > 0
//  // exit
//               if ((tblR.FieldByName('Surface').AsString = 'T')) then begin
//                  if (tblR.FieldByName('NbrTurfDebutStarters').AsInteger > 0) then begin
//                     tblE.FieldByName('TodaysWagerWinPct').AsInteger := tblE.FieldByName('MorningLineWinPct').AsInteger;
//                     tblE.FieldByName('TodaysWagerOrderKey').AsString := 'M/L';
//                  end;
//               end;

//               sEarlyPaceAdvantageTrkKey := GetEarlyPaceAdvantageTrkKey(tblR, tblE);
//               if (sEarlyPaceAdvantageTrkKey <> '') then begin
//                  tblF.IndexName := '';
//                  tblF.SetKey();
//                  tblF.FieldByName('OrderKey').AsString := sEarlyPaceAdvantageTrkKey;
//                  if (tblF.GotoKey()) then begin
//                     tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
//                     fEarlyPaceAdvantageValueBet := tblF.FieldByName('ValueBet').AsFloat;
//                     if (tblF.FieldByName('Wins').AsInteger = 1) then begin
//                        tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat :=
//                           tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat * -1;
//                     end;
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        tblE.FieldByName('TodaysWagerOrderKey').AsString := sEarlyPaceAdvantageTrkKey;
//                        tblE.FieldByName('TodaysWagerWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
//                     end;
//                     //tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat;
//                  end;
//               end;
//
//               sMiddlePaceAdvantageTrkKey := GetMiddlePaceAdvantageTrkKey(tblR, tblE);
//               if (sMiddlePaceAdvantageTrkKey <> '') then begin
//                  tblF.IndexName := '';
//                  tblF.SetKey();
//                  tblF.FieldByName('OrderKey').AsString := sMiddlePaceAdvantageTrkKey;
//                  if (tblF.GotoKey()) then begin
//                     tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
//                     fMiddlePaceAdvantageValueBet := tblF.FieldByName('ValueBet').AsFloat;
//                     if (tblF.FieldByName('Wins').AsInteger = 1) then begin
//                        tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat :=
//                           tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat * -1;
//                     end;
//                     if (tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat >
//                        tblE.FieldByName('TodaysWagerWinPct').AsFloat) then begin
//                        if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := sMiddlePaceAdvantageTrkKey;
//                           tblE.FieldByName('TodaysWagerWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
//                        end;
//                        //tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat;
//                     end;
//                  end;
//               end;
//
//               sLatePaceAdvantageTrkKey := GetLatePaceAdvantageTrkKey(tblR, tblE);
//               if (sLatePaceAdvantageTrkKey <> '') then begin
//                  tblF.IndexName := '';
//                  tblF.SetKey();
//                  tblF.FieldByName('OrderKey').AsString := sLatePaceAdvantageTrkKey;
//                  if (tblF.GotoKey()) then begin
//                     tblE.FieldByName('LatePaceAdvantageWinPct').AsFloat := tblF.FieldByName('WinPct').AsFloat;
//                     if (tblF.FieldByName('Wins').AsInteger = 1) then begin
//                        tblE.FieldByName('LatePaceAdvantageWinPct').AsFloat :=
//                           tblE.FieldByName('LatePaceAdvantageWinPct').AsFloat * -1;
//                     end;
//                  end;
//                  if (tblE.FieldByName('LatePaceAdvantageWinPct').AsFloat >
//                     tblE.FieldByName('TodaysWagerWinPct').AsFloat) then begin
//                     if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                        tblE.FieldByName('TodaysWagerOrderKey').AsString := sLatePaceAdvantageTrkKey;
//                        tblE.FieldByName('TodaysWagerWins').AsInteger := tblF.FieldByName('Wins').AsInteger;
//                     end;
//                     //tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('LatePaceAdvantageWinPct').AsFloat;
//                  end;
//               end;
//              Select TrkCode,
//ProgramNbr,
//PostPos,
//TodaysWagerOrderKey ,
//TodaysWagerWinPct,
//Trainer,
//Jockey,
//Owner,
//TrnTodayWinPct,
//TotalTrnOwnStarts,
//TotalTrnOwnWinPct,
//TotalTrnJkyStarts,
//TotalTrnJkyWinPct,
//
//TrainerJockeyRating as TJ365Starts,
//Tj365WinPct,
//JockeyRating As TJMeetStarts,
//TJMeetWinPct
//JAK
//               tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TTO';
//               tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrnOddsWinPct').AsFloat;
//               tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrnOddsStarts').AsFloat;
//
//               if (tblE.FieldByName('TotalTrn30Starts').AsFloat > 8) then begin
//                  tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TTM';
//                  tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrn30Starts').AsFloat;
//                  tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrn30WinPct').AsFloat;
//               end;
//
//               if (tblE.FieldByName('TotalTrnJkyStarts').AsFloat > 16) then begin
//                  tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TJA';
//                  tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrn30Starts').AsFloat;
//                  tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrnJkyWinPct').AsFloat;
//               end;
//
//               if (tblE.FieldByName('TotalTrnOwnStarts').AsFloat > 16) then begin
//                  tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TOA';
//                  tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrnOwnStarts').AsFloat;
//                  tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrnOwnWinPct').AsFloat;
//               end;
//
//               if (tblE.FieldByName('TotalTrnJkyStarts').AsFloat > 24) then begin
//                  if (tblE.FieldByName('TotalTrnOwnStarts').AsFloat > 24) then begin
//                     if (tblE.FieldByName('TotalTrnOwnWinPct').AsFloat > tblE.FieldByName('TotalTrnJkyWinPct').AsFloat) then begin
//                        tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TTOA';
//                        tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TotalTrnOwnStarts').AsFloat;
//                        tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TotalTrnOwnWinPct').AsFloat;
//                     end;
//                  end;
//               end;
//
//               if (tblE.FieldByName('JockeyRating').AsFloat > 24) then begin
//                  if (tblE.FieldByName('TodaysWagerOrderKey').AsString <> 'TTOA') then begin
//                     tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TJM';
//                     tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('JockeyRating').AsFloat;
//                     tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TJMeetWinPct').AsFloat;
//                  end;
//               end;
//
//               if (tblE.FieldByName('TrainerJockeyRating').AsFloat > 24) then begin
//                  if (tblE.FieldByName('TodaysWagerOrderKey').AsString <> 'TTOA') then begin
//                     tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TJY';
//                     tblE.FieldByName('TodaysWagerStarts').AsFloat := tblE.FieldByName('TrainerJockeyRating').AsFloat;
//                     tblE.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TJ365WinPct').AsFloat;
//                  end;
//               end;
//
//               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                  if (tblR.FieldByName('Surface').AsString <> 'T') then begin
//                     if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
//                        if (sDebutIndicator = '*') then begin
//
//                        end;
//                        if (sDebutIndicator = '*') then begin
//                           tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TrnDebut';
//                        end;
//                     end;
//                  end else begin
//                     if (sTurfIndicator = '*') then begin
//                        tblE.FieldByName('TodaysWagerOrderKey').AsString := 'TrnTurfDebut';
//                     end;
//                  end;
//               end;



//if (tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat < 0) then begin
//   tblE.FieldByName('IsEliminated').AsBoolean := True;
//   tblE.FieldByName('TodaysWagerOddsDesc').AsString := '99/1';
//end;

//if (tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat < 0) then begin
//   tblE.FieldByName('IsEliminated').AsBoolean := True;
//   tblE.FieldByName('TodaysWagerOddsDesc').AsString := '99/1';
//end;

//           if (tblE.FieldByName('TotalTrnOddsWinPct').AsFloat < 7.00) then begin
//                  tblE.FieldByName('IsEliminated').AsBoolean := True;
//               end;

//  if (UpperCase(tblE.TableName) = 'ENTRY') then begin
//                  if (tblE.FieldByName('TotalJkyOddsWinPct').AsFloat < 7.00) then begin
//                     tblE.FieldByName('IsEliminated').AsBoolean := True;
//                  end;
//               end;
//               if (tblE.FieldByName('IsHeavyChalk').AsBoolean = True) and
//                  (tblE.FieldByName('IsEliminated').AsBoolean = False) then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//               end;
//
//               if ((tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat > 25.00) and
//                  (tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat < 50.00)) and
//                  (tblE.FieldByName('IsEliminated').AsBoolean = False) then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//               end;
//
//               if ((tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat > 25.00) and
//                  (tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat < 50.00)) and
//                  (tblE.FieldByName('IsEliminated').AsBoolean = False) then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//               end;
//
//               if (tblE.FieldByName('Surface').AsString = 'T') then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//               end;
//
//               if (tblE.FieldByName('RaceType').AsString = 'MSW') then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//               end;
//
//               if (tblE.FieldByName('RaceType').AsString = 'MCL') then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//               end;
               //
//tblE.FieldByName('TodaysWagerWinPct').AsFloat :=  tblE.FieldByName('EarlyPace').AsFloat;

//               if (tblE.FieldByName('Surface').AsString = 'T') then begin
//                  tblE.FieldByName('TodaysWagerWinPct').AsFloat :=
//                     tblE.FieldByName('TurfRating').AsFloat;
//               end;
//  tblE.FieldByName('TrainerRating').AsFloat := tblE.FieldByName('TotalTrnWinPct').AsFloat;
//               tblE.FieldByName('TrainerJockeyRating').AsFloat := tblE.FieldByName('TotalTrnJkyWinPct').AsFloat;
//               tblE.FieldByName('JockeyRating').AsFloat := tblE.FieldByName('TotalJkyWinPct').AsFloat;
//               tblE.FieldByName('OwnerRating').AsFloat := tblE.FieldByName('TotalOwnWinPct').AsFloat;
//
//               if (tblE.FieldByName('TotalTrnOddsWinPct').AsFloat < 5.0) then begin
//                  tblE.FieldByName('IsEliminated').AsBoolean := True;
//               end;

//               if ((tblE.FieldByName('TJMeetWinPct').AsInteger = 0) and
//                  (tblE.FieldByName('TJ365WinPct').AsInteger = 0)) then begin
//                  tblE.FieldByName('IsEliminated').AsBoolean := True;
//               end;

//               if ((tblE.FieldByName('TJMeetWinPct').AsFloat < tblE.FieldByName('TotalTrnOddsWinPct').AsFloat) and
//                  (tblE.FieldByName('TJ365WinPct').AsFloat < tblE.FieldByName('TotalTrnOddsWinPct').AsFloat)) then begin
//                  tblE.FieldByName('IsEliminated').AsBoolean := True;
//               end;

//
//               if (tblE.FieldByName('PostPosStarts').AsInteger > 9) then begin
//                  if (tblE.FieldByName('PostPosWinPct').AsFloat < 1.0) then begin
//                     tblE.FieldByName('IsEliminated').AsBoolean := True;
//                  end;
//               end;



//  if (tblR.FieldByName('NbrDebutStarters').AsInteger < 1) then begin
//                  if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//                     if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//                        if (tblE.FieldByName('MiddlePaceAdvantage').AsFloat > tblE.FieldByName('EarlyPaceAdvantage').AsFloat) then begin
//
//                           if (tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean = True) then begin
//    if (tblE.FieldByName('TrkCode').AsString 'NP') then begin
//       tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//   end;
//                              tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := True;
//                           end;
//
//                        end;
//                     end;
//                  end;
//               end;

// if (tblE.FieldByName('TodaysWagerWinPct').AsFloat <= 1.01) then begin
//    tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//   end;
//
//               if (tblE.FieldByName('TrkCode').AsString = 'MD') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'NP') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'HST') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'LNN') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'FMT') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'CBY') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'ASD') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'ARP') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;
//               if (tblE.FieldByName('TrkCode').AsString = 'RUI') then begin
//                  tblE.FieldByName('IsSpeedSheetSelected').AsBoolean := False;
//               end;

//  if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//                  if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
//                     if (tblE.FieldByName('MorningLineTo1Rank').AsInteger < 4) then begin
//                        if (tblE.FieldByName('PowerRank').AsInteger < 4) then begin
//                           if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
//                              if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
//                                 if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//                                    if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
//                                       tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//                                    end;
//                                 end;
//                              end;
//                           end;
//                        end;
//                     end;
//                  end;
//               end;

//  if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
 //                  if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
//                     if (tblE.FieldByName('MorningLineTo1Rank').AsInteger < 4) then begin
//                        if (tblE.FieldByName('PowerRank').AsInteger < 4) then begin
//                           if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
//                              if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//                                 tblE.FieldByName('IsValueWagerSelected').AsBoolean := True;
//                              end;
//                           end;
//                        end;
//                     end;
//                  end;
//               end;
   //if (tblE.FieldByName('LastSpeed').AsInteger = tblE.FieldByName('BackSpeed').AsInteger) then begin
   //   tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
  // end;
   //if (tblE.FieldByName('TodaysWagerWinPct').AsFloat < 10) then begin
   //   tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
   //end;

// if (tblR.FieldByName('Surface').AsString = 'T') then begin
//                  tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//               end;

//    if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
//               //   if (sDebutIndicator = '*') then begin
//                     tblE.FieldByName('IsValueWagerSelected').AsBoolean := False;
//                //  end;
//               end;

//
//
//
//   CloseTable(tblE);
//   CloseTable(tblR);
//   OpenTableExclusive(tblE);
//   try
//      tblE.AddIndex('ByTodaysAltWagerWinPctRank', 'TrkCode;RaceDate;RaceNbr;TodaysAltWagerWinPct;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'TodaysAltWagerWinPct', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   CloseTableExclusive(tblE);
//   SetRanking(tblE, 'ByTodaysAltWagerWinPctRank', 'TodaysAltWagerWinPctRank', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOfDays);
//   OpenTableExclusive(tblE);
//   try
//      tblE.DeleteIndex('ByTodaysAltWagerWinPctRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   CloseTableExclusive(tblE);
//

//
//
//procedure UpdateContenderWinPct
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   tblF: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: Integer;
//   bOneDay: boolean;
//   iNbrOfDays: integer
//   );
//
//
//procedure UpdateContenderWinPctRank
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: integer;
//   bOneDay: boolean;
//   iNbrOfDays: integer
//   );

