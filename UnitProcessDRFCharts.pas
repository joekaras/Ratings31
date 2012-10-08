unit UnitProcessDRFCharts;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure ProcessDRFCharts(tblR: TDBISAMTable; tblH: TDBISAMTable; tblE: TDBISAMTable; bUseOverride: boolean);

implementation
uses FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog,
   FormMain, UnitCommonCode;


function GetDRFChartRaceNbr(sLine: string): integer;
begin

   Result := 999;

   if (SmartPos('20THRACE', sLine) > 0) then begin
      Result := 20;
      Exit;
   end;
   if (SmartPos('19THRACE', sLine) > 0) then begin
      Result := 19;
      Exit;
   end;
   if (SmartPos('18THRACE', sLine) > 0) then begin
      Result := 18;
      Exit;
   end;
   if (SmartPos('17THRACE', sLine) > 0) then begin
      Result := 17;
      Exit;
   end;
   if (SmartPos('16THRACE', sLine) > 0) then begin
      Result := 16;
      Exit;
   end;
   if (SmartPos('15THRACE', sLine) > 0) then begin
      Result := 15;
      Exit;
   end;
   if (SmartPos('14THRACE', sLine) > 0) then begin
      Result := 14;
      Exit;
   end;
   if (SmartPos('13THRACE', sLine) > 0) then begin
      Result := 13;
      Exit;
   end;
   if (SmartPos('12THRACE', sLine) > 0) then begin
      Result := 12;
      Exit;
   end;
   if (SmartPos('11THRACE', sLine) > 0) then begin
      Result := 11;
      Exit;
   end;
   if (SmartPos('10THRACE', sLine) > 0) then begin
      Result := 10;
      Exit;
   end;
   if (SmartPos('9THRACE', sLine) > 0) then begin
      Result := 9;
      Exit;
   end;
   if (SmartPos('8THRACE', sLine) > 0) then begin
      Result := 8;
      Exit;
   end;
   if (SmartPos('7THRACE', sLine) > 0) then begin
      Result := 7;
      Exit;
   end;
   if (SmartPos('6THRACE', sLine) > 0) then begin
      Result := 6;
      Exit;
   end;
   if (SmartPos('5THRACE', sLine) > 0) then begin
      Result := 5;
      Exit;
   end;
   if (SmartPos('4THRACE', sLine) > 0) then begin
      Result := 4;
      Exit;
   end;
   if (SmartPos('3RDRACE', sLine) > 0) then begin
      Result := 3;
      Exit;
   end;
   if (SmartPos('2NDRACE', sLine) > 0) then begin
      Result := 2;
      Exit;
   end;
   if (SmartPos('1STRACE', sLine) > 0) then begin
      Result := 1;
      Exit;
   end;

end;


procedure ProcessDRFCharts(tblR: TDBISAMTable; tblH: TDBISAMTable; tblE: TDBISAMTable; bUseOverride: boolean);
var
   lstCharts: TStringList;

   iRc: integer;
   iIdx: integer;
   iRaceNbr: integer;
   iLineType: integer;

   sTmp: string;
   sPostPos: string;
   sOdds: string;
   sFinishPos: string;
   sHorseName: string;
   sProgNbr: string;

   bRoute: boolean;

   lstResults: TStringList;
   lstFinish: TStringList;
   sResults: string;
   iIdxRes: integer;
   iFinPosIdx: integer;
   iPPIdx: integer;
   iOddsIdx: integer;
   iHorseIdx: integer;
   iProgNbrIdx: integer;
   iFinishPos: integer;

   sFileName: string;

   sFootNotes: string;
   sFractionalTimes: string;
   sScratchedHorses: string;
   sOwners: string;
   sTrainers: string;
   sWeather: string;

   sDailyDoubleNbrs: string;
   iDailyDoubleWager: integer;
   fDailyDoublePayout: double;

   sExactaNbrs: string;
   iExactaWager: integer;
   fExactaPayout: double;

   sTrifectaNbrs: string;
   iTrifectaWager: integer;
   fTrifectaPayout: double;

   sSuperfectaNbrs: string;
   iSuperfectaWager: integer;
   fSuperfectaPayout: double;

   sQuinellaNbrs: string;
   iQuinellaWager: integer;
   fQuinellaPayout: double;

   sParse: string;
   sPick3Nbrs: string;
   iPick3Wager: integer;
   fPick3Payout: double;
   sPick3NbrsLeg1: string;
   sPick3NbrsLeg2: string;
   sPick3NbrsLeg3: string;

   sPick4Nbrs: string;
   iPick4Wager: integer;
   fPick4Payout: double;

   sPick6Nbrs: string;
   iPick6Wager: integer;
   fPick6Payout: double;


   sWagerNbrs: string;
   fWagerPayout: double;
   sWagerPayout: string;

   sWinNbrs: string;
   sPlcNbrs: string;
   sShoNbrs: string;

   fWinPayout: double;
   fWinPlcPayout: double;
   fWinShoPayout: double;

   fPlcPayout: double;
   fPlcShoPayout: double;
   fShoPayout: double;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   // If at wager time we chose nothing then we need to blank these
   // out so our result reports give to actual wagered
   procedure CleanDailyDouble();
   begin
      if (tblR.FieldByName('DDFirstRace').AsString = '') then begin
         tblR.FieldByName('DailyDoubleWagerFirstRace').AsInteger := 0;
         tblR.FieldByName('DailyDoublePayoutFirstRace').AsFloat := 0;
         tblR.FieldByName('DailyDoubleNbrsFirstRace').AsString := '';
      end;
      if (tblR.FieldByName('DDLastRace').AsString = '') then begin
         tblR.FieldByName('DailyDoubleWagerLastRace').AsInteger := 0;
         tblR.FieldByName('DailyDoublePayoutLastRace').AsFloat := 0;
         tblR.FieldByName('DailyDoubleNbrsLastRace').AsString := '';
      end;
   end;

   procedure CleanPick3();
   begin
      if (tblR.FieldByName('Pick3FirstRace').AsString = '') then begin
         tblR.FieldByName('Pick3WagerFirstRace').AsInteger := 0;
         tblR.FieldByName('Pick3PayoutFirstRace').AsFloat := 0;
         tblR.FieldByName('Pick3NbrsFirstRace').AsString := '';
      end;
      if (tblR.FieldByName('Pick3LastRace').AsString = '') then begin
         tblR.FieldByName('Pick3WagerLastRace').AsInteger := 0;
         tblR.FieldByName('Pick3PayoutLastRace').AsFloat := 0;
         tblR.FieldByName('Pick3NbrsLastRace').AsString := '';
      end;
   end;

   procedure CleanPick4();
   begin
      if (tblR.FieldByName('Pick4FirstRace').AsString = '') then begin
         tblR.FieldByName('Pick4WagerFirstRace').AsInteger := 0;
         tblR.FieldByName('Pick4PayoutFirstRace').AsFloat := 0;
         tblR.FieldByName('Pick4NbrsFirstRace').AsString := '';
      end;
      if (tblR.FieldByName('Pick4LastRace').AsString = '') then begin
         tblR.FieldByName('Pick4WagerLastRace').AsInteger := 0;
         tblR.FieldByName('Pick4PayoutLastRace').AsFloat := 0;
         tblR.FieldByName('Pick4NbrsLastRace').AsString := '';
      end;
   end;

   procedure CleanPick6();
   begin
      if (tblR.FieldByName('Pick6FirstRace').AsString = '') then begin
         tblR.FieldByName('Pick6WagerFirstRace').AsInteger := 0;
         tblR.FieldByName('Pick6PayoutFirstRace').AsFloat := 0;
         tblR.FieldByName('Pick6NbrsFirstRace').AsString := '';
      end;
      if (tblR.FieldByName('Pick6LastRace').AsString = '')then begin
         tblR.FieldByName('Pick6WagerLastRace').AsInteger := 0;
         tblR.FieldByName('Pick6PayoutLastRace').AsFloat := 0;
         tblR.FieldByName('Pick6NbrsLastRace').AsString := '';
      end;
   end;


   procedure RaceChange();
   begin
      if (iRaceNbr > 0) then begin
         tblR.IndexName := '';
         tblR.SetKey();
         tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblR.FieldByName('RaceNbr').AsInteger := iRaceNbr;
         tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
         if (tblR.GotoKey()) then begin
            tblR.Edit();
            tblR.FieldByName('IsDRFChartsProcessed').AsBoolean := True;
            tblR.FieldByName('Weather').AsString := sWeather;
            tblR.FieldByName('FootNotes').AsString := sFootNotes;
            tblR.FieldByName('FractionalTimes').AsString := sFractionalTimes;
            tblR.FieldByName('ScratchedHorses').AsString := sScratchedHorses;
            tblR.FieldByName('Owners').AsString := UpperCase(sOwners);
            tblR.FieldByName('Trainers').AsString := sTrainers;

            tblR.FieldByName('WinNbrs').AsString := sWinNbrs;
            tblR.FieldByName('PlcNbrs').AsString := sPlcNbrs;
            tblR.FieldByName('ShoNbrs').AsString := sShoNbrs;

            tblR.FieldByName('ExactaNbrs').AsString := sExactaNbrs;
            tblR.FieldByName('ExactaWager').AsInteger := iExactaWager;
            tblR.FieldByName('ExactaPayout').AsFloat := fExactaPayout;

            tblR.FieldByName('DailyDoubleNbrsLastRace').AsString := sDailyDoubleNbrs;
            tblR.FieldByName('DailyDoubleWagerLastRace').AsInteger := iDailyDoubleWager;
            tblR.FieldByName('DailyDoublePayoutLastRace').AsFloat := fDailyDoublePayout;

            tblR.FieldByName('TrifectaNbrs').AsString := sTrifectaNbrs;
            tblR.FieldByName('TrifectaWager').AsInteger := iTrifectaWager;
            tblR.FieldByName('TrifectaPayout').AsFloat := fTrifectaPayout;

            tblR.FieldByName('SuperfectaNbrs').AsString := sSuperfectaNbrs;
            tblR.FieldByName('SuperfectaWager').AsInteger := iSuperfectaWager;
            tblR.FieldByName('SuperfectaPayout').AsFloat := fSuperfectaPayout;

            tblR.FieldByName('QuinellaNbrs').AsString := sQuinellaNbrs;
            tblR.FieldByName('QuinellaWager').AsInteger := iQuinellaWager;
            tblR.FieldByName('QuinellaPayout').AsFloat := fQuinellaPayout;

            tblR.FieldByName('Pick3NbrsLastRace').AsString := sPick3Nbrs;
            tblR.FieldByName('Pick3WagerLastRace').AsInteger := iPick3Wager;
            tblR.FieldByName('Pick3PayoutLastRace').AsFloat := fPick3Payout;

            tblR.FieldByName('Pick3NbrsLeg1').AsString := sPick3NbrsLeg1;
            tblR.FieldByName('Pick3NbrsLeg2').AsString := sPick3NbrsLeg2;
            tblR.FieldByName('Pick3NbrsLeg3').AsString := sPick3NbrsLeg3;

            tblR.FieldByName('Pick4NbrsLastRace').AsString := sPick4Nbrs;
            tblR.FieldByName('Pick4WagerLastRace').AsInteger := iPick4Wager;
            tblR.FieldByName('Pick4PayoutLastRace').AsFloat := fPick4Payout;

            tblR.FieldByName('Pick6NbrsLastRace').AsString := sPick6Nbrs;
            tblR.FieldByName('Pick6WagerLastRace').AsInteger := iPick6Wager;
            tblR.FieldByName('Pick6PayoutLastRace').AsFloat := fPick6Payout;

            tblR.FieldByName('WinPayout').AsFloat := fWinPayout;
            tblR.FieldByName('WinPlcPayout').AsFloat := fWinPlcPayout;
            tblR.FieldByName('WinShoPayout').AsFloat := fWinShoPayout;

            tblR.FieldByName('PlcPayout').AsFloat := fPlcPayout;
            tblR.FieldByName('PlcShoPayout').AsFloat := fPlcShoPayout;

            tblR.FieldByName('ShoPayout').AsFloat := fShoPayout;

            CleanDailyDouble();
            CleanPick3();

            tblR.Post();
         end;

         if (fDailyDoublePayout > 0) then begin
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
            tblR.FieldByName('RaceNbr').AsInteger := (iRaceNbr - 1);
            tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
            if (tblR.GotoKey()) then begin
               tblR.Edit();
               tblR.FieldByName('DailyDoubleNbrsFirstRace').AsString := sDailyDoubleNbrs;
               tblR.FieldByName('DailyDoubleWagerFirstRace').AsInteger := iDailyDoubleWager;
               tblR.FieldByName('DailyDoublePayoutFirstRace').AsFloat := fDailyDoublePayout;
               CleanDailyDouble();
               tblR.Post();
            end;
         end;

         if (fPick3Payout > 0) then begin
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
            tblR.FieldByName('RaceNbr').AsInteger := (iRaceNbr - 2);
            tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
            if (tblR.GotoKey()) then begin
               tblR.Edit();
               tblR.FieldByName('Pick3NbrsFirstRace').AsString := sPick3Nbrs;
               tblR.FieldByName('Pick3WagerFirstRace').AsInteger := iPick3Wager;
               tblR.FieldByName('Pick3PayoutFirstRace').AsFloat := fPick3Payout;
               CleanPick3();
               tblR.Post();
            end;
         end;

         if (fPick4Payout > 0) then begin
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
            tblR.FieldByName('RaceNbr').AsInteger := (iRaceNbr - 3);
            tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
            if (tblR.GotoKey()) then begin
               tblR.Edit();
               tblR.FieldByName('Pick4NbrsFirstRace').AsString := sPick4Nbrs;
               tblR.FieldByName('Pick4WagerFirstRace').AsInteger := iPick4Wager;
               tblR.FieldByName('Pick4PayoutFirstRace').AsFloat := fPick4Payout;
               CleanPick4();
               tblR.Post();
            end;
         end;

         if (fPick6Payout > 0) then begin
            tblR.SetKey();
            tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
            tblR.FieldByName('RaceNbr').AsInteger := (iRaceNbr - 5);
            tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
            if (tblR.GotoKey()) then begin
               tblR.Edit();
               tblR.FieldByName('Pick6NbrsFirstRace').AsString := sPick6Nbrs;
               tblR.FieldByName('Pick6WagerFirstRace').AsInteger := iPick6Wager;
               tblR.FieldByName('Pick6PayoutFirstRace').AsFloat := fPick6Payout;
               CleanPick6();
               tblR.Post();
            end;
         end;
      end;
   end;

   procedure SplitGimmick();
   begin
      try
         sTmp := FastReplace(sTmp, 'DAILY DOUBLE', '|DAILY DOUBLE|', True);
         sTmp := FastReplace(sTmp, 'PICK THREE', '|PICK THREE|', True);
         sTmp := FastReplace(sTmp, 'PICK FOUR', '|PICK FOUR|', True);
         sTmp := FastReplace(sTmp, 'PICK SIX', '|PICK SIX|', True);
         sTmp := FastReplace(sTmp, 'WON FOUR', '|WON FOUR|', True);
         sTmp := FastReplace(sTmp, 'PAID', '|PAID|', True);
         sTmp := FastReplace(sTmp, 'QUINELLA', '|QUINELLA|', True);
         sTmp := FastReplace(sTmp, 'SUPERFECTA', '|SUPERFECTA|', True);
         sTmp := FastReplace(sTmp, 'EXACTA', '|EXACTA|', True);
         sTmp := FastReplace(sTmp, 'TRIFECTA', '|TRIFECTA|', True);
         sTmp := FastReplace(sTmp, 'EXACTOR', '|EXACTOR|', True);

         if (SmartPos('SUPERFECTA', sTmp) = 0) then begin
            sTmp := FastReplace(sTmp, 'PERFECTA', '|PERFECTA|', True);
         end;

         sTmp := FastReplace(sTmp, '$', '', True);
         sTmp := FastReplace(sTmp, ';', '', True);
         sTmp := FastReplace(sTmp, ')', '', True);
         sTmp := FastReplace(sTmp, '(', '', True);
         Split(sTmp, '|', lstResults);
         if lstResults.Count > 5 then begin
            sWagerNbrs := StringListTrim(UpperCase(lstResults[3]));
            sWagerPayout := StringListTrim(UpperCase(lstResults[5]));
            sWagerPayout := FastReplace(sWagerPayout, ',', '', True);
            sWagerPayout := FastReplace(sWagerPayout, ' ', '', True);
            sWagerPayout := FastReplace(sWagerPayout, Chr(160), ' ', False);
            fWagerPayout := atof(Trim(sWagerPayout));
         end;
      finally
         FreeAndNil(lstResults);
      end;
   end;

begin
   try
      try
         CloseTable(tblR);
         CloseTable(tblH);
         CloseTable(tblE);

         OpenTable(tblR);
         OpenTable(tblH);
         OpenTable(tblE);

         if (bUseOverride) then begin
            tblE.IndexName := 'ByRaceDate';

            tblE.SetRangeStart;
            tblE.FieldByName('RaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.SetRangeEnd;
            tblE.FieldByName('RaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.ApplyRange;
         end;

         lstCharts := TStringList.Create;
         iRaceNbr := 0;
         bRoute := False;
         tblE.Filtered := False;

         InitPrgBar(tblE.RecordCount);
         UpdateStatusBar('Processing DRF Charts');

         tblE.First();
         while not tblE.Eof do begin
            IncPrgBar();
            try

               if (TBlobField(tblE.FieldByName('Charts')).BlobSize = 0) then begin
                  tblE.Next();
                  continue;
               end;

               if (TBlobField(tblE.FieldByName('Charts')).BlobSize < MIN_DRF_FILE_SIZE) then begin
                  tblE.Delete();
                  continue;
               end;

               sFileName := 'dcharts.txt';

               TBlobField(tblE.FieldByName('Charts')).SaveToFile(sFileName);
               lstCharts.LoadFromFile(sFileName);

               iLineType := DRF_RACE_LINE_TYPE;

               for iIdx := 0 to lstCharts.Count - 1 do begin

                  sTmp := Trim(UpperCase(lstCharts[iIdx]));
                  sTmp := FastReplace(sTmp, Chr(160), ' ', False);

                  if (sTmp = '') then begin
                     continue;
                  end;
                  if (SmartPos('-COUPLED', sTmp) > 0) then begin
                     continue;
                  end;
                  if (sTmp = '|') then begin
                     continue;
                  end;
                  if (SmartPos('INSERT_FOOTER', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('DAILY RACING FORM - HORSE RACING', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('VAR __TRACKID', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|JUMP TO RACE:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('RESULTS.CHARTS', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('ADVERT(', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('VAR PLATFORM = NAV', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('IF (PLATFORM != -1', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('DOCUMENT.WRITELN(', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('GENERATEMASTHEAD(', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('VAR __TRACKID =', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('}', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('ELSE {', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|||||', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('||', LeftStr(sTmp, 10)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('| |', LeftStr(sTmp, 10)) > 0) then begin
                     continue;
                  end;

                  //
                  if (SmartPos('ATTENDANCE:', sTmp) > 0) then begin
                     RaceChange();
                     continue;
                  end;
                  //

                  //
                  if (SmartPos('|MONDAY,', LeftStr(sTmp, 8)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|TUESDAY,', LeftStr(sTmp, 9)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|WEDNESDAY,', LeftStr(sTmp, 11)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|THURSDAY,', LeftStr(sTmp, 10)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|FRIDAY,', LeftStr(sTmp, 8)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|SATURDAY,', LeftStr(sTmp, 10)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|SUNDAY,', LeftStr(sTmp, 8)) > 0) then begin
                     continue;
                  end;

                  //
                  if (SmartPos('|6 FURLONGS', LeftStr(sTmp, 11)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|7 FURLONGS', LeftStr(sTmp, 11)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|1 1/16 MILES', LeftStr(sTmp, 13)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|1 MILE', LeftStr(sTmp, 7)) > 0) then begin
                     continue;
                  end;

                  if (SmartPos('YARDS  DIRT', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('FURLONGS  DIRT', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MILE  DIRT', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MILES  DIRT', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;

                  if (SmartPos('FURLONGS  TURF', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MILE  TURF', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MILES  TURF', LeftStr(sTmp, 30)) > 0) then begin
                     continue;
                  end;

                  if (SmartPos('VALUE OF RACE', sTmp) > 0) then begin
                     continue;
                  end;

                  if (SmartPos('WINNER-', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CLAIMED-', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CLAIMED:', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;

                  if (SmartPos('|A-COUPLED:', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|B-COUPLED:', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('|C-COUPLED:', LeftStr(sTmp, 20)) > 0) then begin
                     continue;
                  end;


                  if (SmartPos('OFF AT', LeftStr(sTmp, 7)) > 0) then begin
                     iLineType := DRF_OFF_LINE_TYPE;
                     continue;
                  end;

                  if (SmartPos('SCRATCHED:', LeftStr(sTmp, 20)) > 0) then begin
                     sScratchedHorses := sTmp;
                     continue;
                  end;

                  if (SmartPos('TRAINER-', LeftStr(sTmp, 20)) > 0) then begin
                     sTrainers := sTmp;
                     continue;
                  end;

                  iRc := GetDRFChartRaceNbr(sTmp);
                  if (iRc <> 999) then begin
                     if (iRc > 0) then begin
                        RaceChange();
                        iRaceNbr := iRc;
                        sFootNotes := '';
                        sWeather := '';
                        sFractionalTimes := '';
                        sScratchedHorses := '';
                        sOwners := '';
                        sTrainers := '';

                        sWinNbrs := '';
                        sPlcNbrs := '';
                        sShoNbrs := '';

                        sExactaNbrs := '';
                        iExactaWager := 0;
                        fExactaPayout := 0;

                        sDailyDoubleNbrs := '';
                        iDailyDoubleWager := 0;
                        fDailyDoublePayout := 0;

                        sTrifectaNbrs := '';
                        iTrifectaWager := 0;
                        fTrifectaPayout := 0;

                        sSuperfectaNbrs := '';
                        iSuperfectaWager := 0;
                        fSuperfectaPayout := 0;

                        sQuinellaNbrs := '';
                        iQuinellaWager := 0;
                        fQuinellaPayout := 0;

                        sPick3Nbrs := '';
                        iPick3Wager := 0;
                        fPick3Payout := 0;

                        sPick4Nbrs := '';
                        iPick4Wager := 0;
                        fPick4Payout := 0;

                        sPick6Nbrs := '';
                        iPick6Wager := 0;
                        fPick6Payout := 0;

                        fWinPayout := 0;
                        fWinPlcPayout := 0;
                        fWinShoPayout := 0;

                        fPlcPayout := 0;
                        fPlcShoPayout := 0;

                        fShoPayout := 0;
                        continue;
                     end;
                  end;

                  if (SmartPos('PN|HORSE', sTmp) > 0) then begin
                     iLineType := DRF_PGM_DETAIL_LINE_TYPE;

                     iPPIdx := -1;
                     iOddsIdx := -1;
                     iHorseIdx := -1;
                     iFinPosIdx := -1;
                     iProgNbrIdx := -1;
                     try
                        Split(sTmp, '|', lstResults);

                        for iIdxRes := 0 to lstResults.Count - 1 do begin
                           sResults := Trim(UpperCase(lstResults[iIdxRes]));
                           if sResults = 'PN' then begin
                              iProgNbrIdx := iIdxRes;
                           end;
                           if sResults = 'HORSE' then begin
                              iHorseIdx := iIdxRes;
                           end;
                           if sResults = 'PP' then begin
                              iPPIdx := iIdxRes;
                           end;
                           if sResults = 'FIN' then begin
                              iFinPosIdx := iIdxRes;
                           end;
                           if sResults = 'ODDS' then begin
                              iOddsIdx := iIdxRes;
                           end;
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (iLineType = DRF_PGM_DETAIL_LINE_TYPE) then begin
                     try
                        Split(sTmp, '|', lstResults);
                        if (lstResults.Count > 0) then begin
                           if ((iPPIdx > -1) and (iFinPosIdx > -1) and (iOddsIdx > -1) and (iHorseIdx > -1) and (iProgNbrIdx > -1)) then begin
                              sHorseName := StringListTrim((UpperCase(lstResults[iHorseIdx])));
                              sPostPos := StringListTrim((UpperCase(lstResults[iPPIdx])));

                              // Adjust for screwed up heading
                              if (iOddsIdx >= lstResults.Count) then begin
                                 iOddsIdx := lstResults.Count - 1;
                                 iFinPosIdx := lstResults.Count - 2;
                              end;

                              sOdds := StringListTrim((UpperCase(lstResults[iOddsIdx])));
                              sOdds := FastReplace(sOdds, '*', '', True);
                              sOdds := FastReplace(sOdds, 'A', '', True);
                              sOdds := FastReplace(sOdds, 'B', '', True);
                              sOdds := FastReplace(sOdds, 'C', '', True);
                              sOdds := FastReplace(sOdds, 'D', '', True);
                              sOdds := FastReplace(sOdds, 'E', '', True);

                              sFinishPos := StringListTrim((UpperCase(lstResults[iFinPosIdx])));
                              iFinishPos := 0;
                              try
                                 Split(sFinishPos, ' ', lstFinish);
                                 if (lstFinish.Count > 0) then begin
                                    iFinishPos := atoi(lstFinish[0]);
                                 end;
                              finally
                                 FreeAndNil(lstFinish);
                              end;

                              if (iFinishPos = 0) then begin
                                 try
                                    Split(sFinishPos, '^', lstFinish);
                                    if (lstFinish.Count > 0) then begin
                                       iFinishPos := atoi(lstFinish[0]);
                                    end;
                                 finally
                                    FreeAndNil(lstFinish);
                                 end;
                              end;

                              sProgNbr := StringListTrim((UpperCase(lstResults[iProgNbrIdx])));

                              sOdds := Trim(sOdds);
                              sPostPos := Trim(sPostPos);
                              sProgNbr := Trim(sProgNbr);

                              if (atoi(sProgNbr) < 10) then begin
                                 sProgNbr := ' ' + sProgNbr;
                              end;

                              sFinishPos := Trim(sFinishPos);
                              sHorseName := Trim(sHorseName);
                              sHorseName := FastReplace(sHorseName, 'DH-', '', True);

                              if ((atof(sOdds) = 0) and (iFinishPos = 0)) then begin
                                 hLog.AddToLog('DRF Charts ' +
                                    tblE.FieldByName('TrkCode').AsString + ' ' +
                                    tblE.FieldByName('RaceDate').AsString + ' ' +
                                    IntToStr(iRaceNbr) + ' ' +
                                    sTmp, msevException);
                              end;

                              tblH.IndexName := 'ByProgramNbr';
                              tblH.SetKey();
                              tblH.FieldByName('RangeRaceDate').Value := tblE.FieldByName('RaceDate').Value;
                              tblH.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                              tblH.FieldByName('RaceNbr').AsInteger := iRaceNbr;
                              tblH.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                              tblH.FieldByName('ProgramNbr').AsString := sProgNbr;
                              if (tblH.GotoKey()) then begin
                                 if tblH.FieldByName('HorseName').AsString = sHorseName then begin
                                    if tblH.FieldByName('Odds').AsFloat = 0 then begin
                                       if tblH.FieldByName('FinishPos').AsInteger = 0 then begin
                                          if ((atof(sOdds) > 0) and (iFinishPos > 0)) then begin
                                             tblH.Edit();
                                             tblH.FieldByName('Odds').AsFloat := atof(sOdds);
                                             tblH.FieldByName('FinishPos').AsInteger := iFinishPos;
                                             tblH.Post();
                                          end;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (SmartPos('|OFF AT', sTmp) > 0) then begin
                     iLineType := DRF_OFF_LINE_TYPE;
                     continue;
                  end;

                  if (iLineType = DRF_OFF_LINE_TYPE) then begin
                     iLineType := DRF_WPS_WIN_LINE_TYPE;
                     try
                        sTmp := FastReplace(sTmp, '-|', '|', True);
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count = 6 then begin
                           sHorsename := CopyStr(lstResults[1], 1, 10);
                           sWinNbrs := Format('%3s', [lstResults[0]]) + ' ' + Format('%-10s', [sHorseName]);
                           fWinPayout := atof(StringListTrim(lstResults[3]));
                           fWinPlcPayout := atof(StringListTrim(lstResults[4]));
                           fWinShoPayout := atof(StringListTrim(lstResults[5]));
                        end;
                        if lstResults.Count = 7 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sWinNbrs := Format('%3s', [lstResults[1]]) + ' ' + Format('%-10s', [sHorseName]);
                           fWinPayout := atof(StringListTrim(lstResults[4]));
                           fWinPlcPayout := atof(StringListTrim(lstResults[5]));
                           fWinShoPayout := atof(StringListTrim(lstResults[6]));
                        end;
                        if (lstResults.Count <> 6) and (lstResults.Count <> 7) then begin
                           hLog.AddToLog('Win Index Not 6 or 7', msevException);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (iLineType = DRF_WPS_WIN_LINE_TYPE) then begin
                     iLineType := DRF_WPS_PLC_LINE_TYPE;
                     try
                        sTmp := FastReplace(sTmp, '-|', '|', True);
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count = 6 then begin
                           sHorsename := CopyStr(lstResults[1], 1, 10);
                           sPlcNbrs := Format('%3s', [lstResults[0]]) + ' ' + Format('%-10s', [sHorseName]);
                           fPlcPayout := atof(StringListTrim(lstResults[4]));
                           fPlcShoPayout := atof(StringListTrim(lstResults[5]));
                        end;
                        if lstResults.Count = 7 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sPlcNbrs := Format('%3s', [lstResults[1]]) + ' ' + Format('%-10s', [sHorseName]);
                           fPlcPayout := atof(StringListTrim(lstResults[5]));
                           fPlcShoPayout := atof(StringListTrim(lstResults[6]));
                        end;
                        if (lstResults.Count <> 6) and (lstResults.Count <> 7) then begin
                           hLog.AddToLog('Plc Index Not 6 or 7', msevException);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (iLineType = DRF_WPS_PLC_LINE_TYPE) then begin
                     iLineType := DRF_WPS_SHO_LINE_TYPE;
                     try
                        sTmp := FastReplace(sTmp, '-|', '|', True);
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count = 6 then begin
                           sHorsename := CopyStr(lstResults[1], 1, 10);
                           sShoNbrs := Format('%3s', [lstResults[0]]) + ' ' + Format('%-10s', [sHorseName]);
                           fShoPayout := atof(StringListTrim(lstResults[5]));
                        end;
                        if lstResults.Count = 7 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sShoNbrs := Format('%3s', [lstResults[1]]) + ' ' + Format('%-10s', [sHorseName]);
                           fShoPayout := atof(StringListTrim(lstResults[6]));
                        end;
                        if (lstResults.Count <> 6) and (lstResults.Count <> 7) then begin
                           hLog.AddToLog('Win Index Not 6 or 7', msevException);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (SmartPos('|$1', LeftStr(sTmp, 3)) > 0) then begin
                     if (SmartPos('DAILY DOUBLE', sTmp) > 0) then begin
                        SplitGimmick();
                        iDailyDoubleWager := 1;
                        sDailyDoubleNbrs := Trim(sWagerNbrs);
                        fDailyDoublePayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('SUPERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iSuperfectaWager := 1;
                        sSuperfectaNbrs := Trim(sWagerNbrs);
                        fSuperfectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('EXACTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('TRIFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 1;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('EXACTOR', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('TRIACTOR', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 1;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PICK THREE', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick3Wager := 1;
                        sPick3Nbrs := Trim(sWagerNbrs);
                        sParse := sPick3Nbrs;
                        if sParse <> '' then begin
                           sPick3NbrsLeg1 := sm.Parse('-', sParse);
                           sPick3NbrsLeg1 := FastReplace(sPick3NbrsLeg1, '/', ' ', True);
                        end;
                        if sParse <> '' then begin
                           sPick3NbrsLeg2 := sm.Parse('-', sParse);
                           sPick3NbrsLeg2 := FastReplace(sPick3NbrsLeg2, '/', ' ', True);
                        end;
                        if sParse <> '' then begin
                           sPick3NbrsLeg3 := sm.Parse('-', sParse);
                           sPick3NbrsLeg3 := FastReplace(sPick3NbrsLeg3, '/', ' ', True);
                        end;
                        fPick3Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('WIN FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 1;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PICK FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 1;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PICK SIX', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick6Wager := 1;
                        sPick6Nbrs := Trim(sWagerNbrs);
                        fPick6Payout := fWagerPayout;
                        continue;
                     end;

                  end;

                  if (SmartPos('|$2', LeftStr(sTmp, 3)) > 0) then begin
                     if (SmartPos('DAILY DOUBLE', sTmp) > 0) then begin
                        SplitGimmick();
                        iDailyDoubleWager := 2;
                        sDailyDoubleNbrs := Trim(sWagerNbrs);
                        fDailyDoublePayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('SUPERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iSuperfectaWager := 2;
                        sSuperfectaNbrs := Trim(sWagerNbrs);
                        fSuperfectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('EXACTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('EXACTOR', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('QUINELLA', sTmp) > 0) then begin
                        SplitGimmick();
                        iQuinellaWager := 2;
                        sQuinellaNbrs := Trim(sWagerNbrs);
                        fQuinellaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('TRIFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 2;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('TRIACTOR', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 2;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;


                     if (SmartPos('PICK THREE', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick3Wager := 2;
                        sPick3Nbrs := sWagerNbrs;
                        sParse := sPick3Nbrs;
                        if sParse <> '' then begin
                           sPick3NbrsLeg1 := sm.Parse('-', sParse);
                           sPick3NbrsLeg1 := FastReplace(sPick3NbrsLeg1, '/', ' ', True);
                        end;
                        if sParse <> '' then begin
                           sPick3NbrsLeg2 := sm.Parse('-', sParse);
                           sPick3NbrsLeg2 := FastReplace(sPick3NbrsLeg2, '/', ' ', True);
                        end;
                        if sParse <> '' then begin
                           sPick3NbrsLeg3 := sm.Parse('-', sParse);
                           sPick3NbrsLeg3 := FastReplace(sPick3NbrsLeg3, '/', ' ', True);
                        end;
                        fPick3Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PICK FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 2;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('WIN FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 2;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('PICK SIX', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick6Wager := 2;
                        sPick6Nbrs := Trim(sWagerNbrs);
                        fPick6Payout := fWagerPayout;
                        continue;
                     end;

                  end;


                  sFootNotes := sTmp;
               end;
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

            tblE.Edit();
            tblE.FieldByName('IsChartsProcessed').AsBoolean := True;
            tblE.Post();
            tblE.Next();
         end;

      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblH);
      FreeAndNil(lstResults);
      FreeAndNil(lstCharts);
      ClearPrgStatusBars();
   end;

end;



end.
