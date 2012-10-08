unit UnitProcessEquibaseResults;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan;

procedure ProcessEquibaseResults(tblR: TDBISAMTable; tblH: TDBISAMTable; tblE: TDBISAMTable; Sender: TObject; bUseOverride: boolean);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

function GetEquibaseChartRaceNbr(sLine: string): integer;
begin
   Result := 999;

   if (SmartPos('RACE 20', sLine) > 0) then begin
      Result := 20;
      Exit;
   end;
   if (SmartPos('RACE 19', sLine) > 0) then begin
      Result := 19;
      Exit;
   end;
   if (SmartPos('RACE 18', sLine) > 0) then begin
      Result := 18;
      Exit;
   end;
   if (SmartPos('RACE 17', sLine) > 0) then begin
      Result := 17;
      Exit;
   end;
   if (SmartPos('RACE 16', sLine) > 0) then begin
      Result := 16;
      Exit;
   end;
   if (SmartPos('RACE 15', sLine) > 0) then begin
      Result := 15;
      Exit;
   end;
   if (SmartPos('RACE 14', sLine) > 0) then begin
      Result := 14;
      Exit;
   end;
   if (SmartPos('RACE 13', sLine) > 0) then begin
      Result := 13;
      Exit;
   end;
   if (SmartPos('RACE 12', sLine) > 0) then begin
      Result := 12;
      Exit;
   end;
   if (SmartPos('RACE 11', sLine) > 0) then begin
      Result := 11;
      Exit;
   end;
   if (SmartPos('RACE 10', sLine) > 0) then begin
      Result := 10;
      Exit;
   end;
   if (SmartPos('RACE 9', sLine) > 0) then begin
      Result := 9;
      Exit;
   end;
   if (SmartPos('RACE 8', sLine) > 0) then begin
      Result := 8;
      Exit;
   end;
   if (SmartPos('RACE 7', sLine) > 0) then begin
      Result := 7;
      Exit;
   end;
   if (SmartPos('RACE 6', sLine) > 0) then begin
      Result := 6;
      Exit;
   end;
   if (SmartPos('RACE 5', sLine) > 0) then begin
      Result := 5;
      Exit;
   end;
   if (SmartPos('RACE 4', sLine) > 0) then begin
      Result := 4;
      Exit;
   end;
   if (SmartPos('RACE 3', sLine) > 0) then begin
      Result := 3;
      Exit;
   end;
   if (SmartPos('RACE 2', sLine) > 0) then begin
      Result := 2;
      Exit;
   end;
   if (SmartPos('RACE 1', sLine) > 0) then begin
      Result := 1;
      Exit;
   end;

end;




procedure ProcessEquibaseResults(tblR: TDBISAMTable; tblH: TDBISAMTable; tblE: TDBISAMTable; Sender: TObject; bUseOverride: boolean);
var
   lstCharts: TStringList;

   iRc: integer;
   iIdx: integer;

   iPos: integer;
   iHPos: integer;
   iFPPos: integer;

   iRaceNbr: integer;
   iLineLen: integer;
   iLineType: integer;

   sFinishPos: string;
   sHorseName: string;
   sHorseNameHH: string;
   sOdds: string;
   sPostPos: string;
   sProgNbr: string;
   sTmp: string;

   bRoute: boolean;
   msText: TMemoryStream;


   sResults: string;

   iPPIdx: integer;
   iIdxRes: integer;
   iOddsIdx: integer;
   iHorseIdx: integer;
   iFinPosIdx: integer;
   iProgNbrIdx: integer;

   //Race History
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


   sFileName: string;
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

   bFavorite: boolean;

   sKey: string;
   lstResults: TStringList;
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
      if (tblR.FieldByName('Pick6LastRace').AsString = '') then begin
         tblR.FieldByName('Pick6WagerLastRace').AsInteger := 0;
         tblR.FieldByName('Pick6PayoutLastRace').AsFloat := 0;
         tblR.FieldByName('Pick6NbrsLastRace').AsString := '';
      end;
   end;



   procedure RaceChange();
   begin
      if (iRaceNbr > 0) then begin
         if (UpperCase(tblR.TableName) = 'RACEHISTORY') then begin
            tblR.IndexName := '';
         end else begin
            tblR.IndexName := 'ByActualPrimary';
         end;


         tblR.SetKey();
         tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblR.FieldByName('RaceNbr').AsInteger := iRaceNbr;
         tblR.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         if (tblR.GotoKey()) then begin
            tblR.Edit();

            tblR.FieldByName('IsEquibaseChartsProcessed').AsBoolean := True;

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
         Split(sTmp, '|', lstResults);
         if lstResults.Count > 2 then begin
            sWagerNbrs := StringListTrim(UpperCase(lstResults[2]));
            sWagerPayout := StringListTrim(UpperCase(lstResults[3]));
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

   hLog.AddToLog('Process Equibase Charts', msevOperation);
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

         iRaceNbr := 0;
         bRoute := False;

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);
         UpdateStatusBar('Processing Equibase Charts');
         lstCharts := TStringList.Create;


         tblE.First();
         while not tblE.Eof do begin
            IncPrgBar();
            try

               if (dm.tblEquibaseResults.BlobSize = 0) then begin
                  tblE.Next();
                  continue;
               end;

               //               if (dm.tblEquibaseResults.BlobSize < MIN_EQUIBASE_FILE_SIZE) then begin
               //                  tblE.Delete();
               //                  continue;
               //               end;
               //
                              //try
                              //   msText := TMemoryStream.Create;
                              //   tblECharts.SaveToStream(msText);
                              //   lstCharts.LoadFromStream(msText);
                              //finally
               //            FreeAndNil(msText);
                              //end;


                              //sFileName := tblE.FieldByName('TrkCode').AsString + '.txt';
               sFileName := 'eresults.txt';

               //if (tblE.FieldByName('TrkCode').AsString = 'FP') then begin
               //   sFileName := 'fpcharts.txt';
               //end;

               dm.tblEquibaseCharts.SaveToFile(sFileName);
               lstCharts.LoadFromFile(sFileName);

               iLineType := EQUIBASE_RACE_LINE_TYPE;

               for iIdx := 0 to lstCharts.Count - 1 do begin

                  sTmp := Trim(UpperCase(lstCharts[iIdx]));
                  if (sTmp = '|') then begin
                     continue;
                  end;
                  if (sTmp = '') then begin
                     continue;
                  end;
                  if (SmartPos('EQUIBASE COMPANY LLC|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('HOME|HANDICAPPER', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('FUNCTION CARTON()', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('QUICK RESULTS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('SUMMARY CHARTS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CANCELLATIONS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('S STORE|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('ENTRIES|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('RESULTS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('OFFICIAL PROGRAMS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('EXPERT SELECTIONS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('DAILY RACING FORM|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CALENDAR|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('TV SCHEDULE|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('NEWS|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('RACING TODAY AT', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('STOREOFFICIAL', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('TRACK LINKSTOP LEADERSRACING', sTmp) > 0) then begin
                     continue;
                  end;
                  //
                  if (SmartPos('TRACK ATTENDANCE: ', sTmp) > 0) then begin
                     RaceChange();
                     iRaceNbr := 0;

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
                  //
                  if (SmartPos('MAIDEN -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MAIDEN SPECIAL WEIGHT - ', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CLAIMING - ', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('MAIDEN CLAIMING - ', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('ALLOWANCE -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('DERBY -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('STAKES -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('FINAL -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('FUTURITY -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CHAMPIONSHIP -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('STARTER ALLOWANCE -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('HANDICAP STAKES -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('CLAIMING STAKES -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('SPEED INDEX RACE -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('ALLOWANCE OPTIONAL CLAIMING -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('OPTIONAL CLAIMING -', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('STARTER HANDICAP -', sTmp) > 0) then begin
                     continue;
                  end;
                  //

                  //
                  if (SmartPos('PURSE:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('INCLUDES:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('PLUS:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('AVAILABLE MONEY:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('VALUE OF RACE:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('WIND SPEED:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('REVERTS:', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('WEATHER:', sTmp) > 0) then begin
                     sWeather := sTmp;
                     continue;
                  end;
                  if (SmartPos('OFF AT:', sTmp) > 0) then begin
                     continue;
                  end;
                  //

                  //
                  if (SmartPos('FRACTIONAL TIMES:', sTmp) > 0) then begin
                     iLineType := EQUIBASE_FRAC_TIME_LINE_TYPE;
                     continue;
                  end;
                  if (SmartPos('WINNER:|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_WINNER_LINE_TYPE;
                     continue;
                  end;
                  if (SmartPos('PEDIGREE:|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_PEDIGREE_LINE_TYPE;
                     continue;
                  end;
                  if (SmartPos('CLAIMING PRICES:|', sTmp) > 0) then begin
                     continue;
                  end;
                  if (SmartPos('SCRATCHED HORSES:', sTmp) > 0) then begin
                     sScratchedHorses := sTmp;
                     continue;
                  end;
                  if (SmartPos('CLAIMEDHORSE(S):', sTmp) > 0) then begin
                     continue;
                  end;
                  //

                  //
                  if (SmartPos('PGM|HORSE|WIN|PLACE|SHOW|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_WPS_LINE_TYPE;
                     continue;
                  end;
                  if (iLineType = EQUIBASE_WPS_LINE_TYPE) then begin
                     iLineType := EQUIBASE_WPS_WIN_LINE_TYPE;
                     try
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count > 5 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sWinNbrs :=
                              Format('%3s', [lstResults[1]]) + ' ' +
                              Format('%-10s', [sHorseName]);

                           fWinPayout := atof(lstResults[3]);
                           fWinPlcPayout := atof(lstResults[4]);
                           fWinShoPayout := atof(lstResults[5]);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;
                  if (iLineType = EQUIBASE_WPS_WIN_LINE_TYPE) then begin
                     iLineType := EQUIBASE_WPS_PLC_LINE_TYPE;
                     try
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count > 5 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sPlcNbrs :=
                              Format('%3s', [lstResults[1]]) + ' ' +
                              Format('%-10s', [sHorseName]);

                           fPlcPayout := atof(lstResults[4]);
                           fPlcShoPayout := atof(lstResults[5]);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;

                  if (iLineType = EQUIBASE_WPS_PLC_LINE_TYPE) then begin
                     iLineType := EQUIBASE_WPS_SHO_LINE_TYPE;
                     try
                        Split(sTmp, '|', lstResults);
                        if lstResults.Count > 5 then begin
                           sHorsename := CopyStr(lstResults[2], 1, 10);
                           sShoNbrs :=
                              Format('%3s', [lstResults[1]]) + ' ' +
                              Format('%-10s', [sHorseName]);
                           fShoPayout := atof(lstResults[5]);
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                     continue;
                  end;
                  //if (iLineType = EQUIBASE_WPS_SHO_LINE_TYPE) then begin
                  //   iLineType := EQUIBASE_WPS_OUT_LINE_TYPE;
                  //   continue;
                  //end;
                  //

                  if (iLineType = EQUIBASE_FOOTNOTES_LINE_TYPE) then begin
                     sFootNotes := sTmp;
                     iLineType := EQUIBASE_OWNERS_LINE_TYPE;
                     continue;
                  end;

                  //
                  if (SmartPos('WAGER TYPE|WINNING NUMBERS|PAYOFF|POOL|CARRYOVER|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_WAGER_LINE_TYPE;
                     continue;
                  end;
                  if (iLineType = EQUIBASE_WAGER_LINE_TYPE) then begin
                     if (SmartPos('$2 TWIN TRIFECTA', sTmp) > 0) then begin
                        continue;
                     end;

                     if (SmartPos('$2 DAILY DOUBLE|', sTmp) > 0) then begin
                        SplitGimmick();
                        iDailyDoubleWager := 2;
                        sDailyDoubleNbrs := Trim(sWagerNbrs);
                        fDailyDoublePayout := fWagerPayout;
                        continue;
                     end;


                     if (SmartPos('$1 PERFECTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 PERFECTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;


                     if (SmartPos('$1 EXACTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 EXACTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$1 EXACTOR|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 1;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 EXACTOR|', sTmp) > 0) then begin
                        SplitGimmick();
                        iExactaWager := 2;
                        sExactaNbrs := Trim(sWagerNbrs);
                        fExactaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$2 QUINELLA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iQuinellaWager := 2;
                        sQuinellaNbrs := Trim(sWagerNbrs);
                        fQuinellaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$1 TRIFECTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 1;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$2 TRIFECTA|', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 2;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$1 TRIACTOR|', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 1;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$2 TRIACTOR|', sTmp) > 0) then begin
                        SplitGimmick();
                        iTrifectaWager := 2;
                        sTrifectaNbrs := Trim(sWagerNbrs);
                        fTrifectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$1 SUPERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iSuperfectaWager := 1;
                        iHPos := SmartPos('(', sWagerNbrs);
                        if iHPos > 0 then begin
                           sWagerNbrs := CopyStr(sWagerNbrs, 1, (iHPos - 1));
                        end;
                        sSuperfectaNbrs := Trim(sWagerNbrs);
                        fSuperfectaPayout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 SUPERFECTA', sTmp) > 0) then begin
                        SplitGimmick();
                        iSuperfectaWager := 2;
                        iHPos := SmartPos('(', sWagerNbrs);
                        if iHPos > 0 then begin
                           sWagerNbrs := CopyStr(sWagerNbrs, 1, (iHPos - 1));
                        end;
                        sSuperfectaNbrs := Trim(sWagerNbrs);
                        fSuperfectaPayout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$2 PICK 3', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick3Wager := 2;
                        sPick3Nbrs := sWagerNbrs;
                        iHPos := SmartPos('(', sPick3Nbrs);
                        if iHPos > 0 then begin
                           sPick3Nbrs := CopyStr(sPick3Nbrs, 1, (iHPos - 1));
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
                        end;
                        fPick3Payout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$1 PICK 3', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick3Wager := 1;
                        sPick3Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick3Nbrs);
                        if iHPos > 0 then begin
                           sPick3Nbrs := CopyStr(sPick3Nbrs, 1, (iHPos - 1));
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
                        end;
                        fPick3Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$2 PICK 4', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 2;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick4Nbrs);
                        if iHPos > 0 then begin
                           sPick4Nbrs := CopyStr(sPick4Nbrs, 1, (iHPos - 1));
                        end;
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 WIN FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 2;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick4Nbrs);
                        if iHPos > 0 then begin
                           sPick4Nbrs := CopyStr(sPick4Nbrs, 1, (iHPos - 1));
                        end;
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$1 WIN FOUR', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 1;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick4Nbrs);
                        if iHPos > 0 then begin
                           sPick4Nbrs := CopyStr(sPick4Nbrs, 1, (iHPos - 1));
                        end;
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$1 PICK 4', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick4Wager := 1;
                        sPick4Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick4Nbrs);
                        if iHPos > 0 then begin
                           sPick4Nbrs := CopyStr(sPick4Nbrs, 1, (iHPos - 1));
                        end;
                        fPick4Payout := fWagerPayout;
                        continue;
                     end;

                     if (SmartPos('$1 PICK 6', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick6Wager := 1;
                        sPick6Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick6Nbrs);
                        if iHPos > 0 then begin
                           sPick6Nbrs := CopyStr(sPick6Nbrs, 1, (iHPos - 1));
                        end;
                        fPick6Payout := fWagerPayout;
                        continue;
                     end;
                     if (SmartPos('$2 PICK 6', sTmp) > 0) then begin
                        SplitGimmick();
                        iPick6Wager := 2;
                        sPick6Nbrs := Trim(sWagerNbrs);
                        iHPos := SmartPos('(', sPick6Nbrs);
                        if iHPos > 0 then begin
                           sPick6Nbrs := CopyStr(sPick6Nbrs, 1, (iHPos - 1));
                        end;
                        fPick6Payout := fWagerPayout;
                        continue;
                     end;
                  end;

                  //
                  if (SmartPos('PGM|COMMENT|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_PGM_COMMENT_LINE_TYPE;
                     continue;
                  end;

                  if (SmartPos('FOOTNOTES', LeftStr(sTmp, 10)) > 0) then begin
                     iLineType := EQUIBASE_FOOTNOTES_LINE_TYPE;
                     continue;
                  end;

                  if (SmartPos('OWNERS:', sTmp) > 0) then begin
                     sOwners := sTmp;
                     continue;
                  end;
                  if (SmartPos('TRAINERS:', sTmp) > 0) then begin
                     sTrainers := sTmp;
                     continue;
                  end;

                  iRc := GetEquibaseChartRaceNbr(sTmp);
                  if (iRc <> 999) then begin
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

                  if (SmartPos('PGM|HORSENAME (JOCKEY)|', sTmp) > 0) then begin
                     iLineType := EQUIBASE_PGM_DETAIL_LINE_TYPE;

                     iPPIdx := -1;
                     iOddsIdx := -1;
                     iHorseIdx := -1;
                     iFinPosIdx := -1;

                     try
                        Split(sTmp, '|', lstResults);

                        for iIdxRes := 0 to lstResults.Count - 1 do begin
                           sResults := Trim(UpperCase(lstResults[iIdxRes]));
                           if sResults = 'PGM' then begin
                              iProgNbrIdx := iIdxRes;
                           end;
                           if sResults = 'HORSENAME (JOCKEY)' then begin
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

                  if (iLineType = EQUIBASE_PGM_DETAIL_LINE_TYPE) then begin
                     try
                        Split(sTmp, '|', lstResults);
                        if (lstResults.Count > 0) then begin
                           if ((iPPIdx > -1) and (iFinPosIdx > -1) and (iOddsIdx > -1) and (iHorseIdx > -1) and (iProgNbrIdx > -1)) then begin
                              sHorseName := Trim(UpperCase(lstResults[iHorseIdx]));
                              iHPos := SmartPos('(', sHorseName);
                              sHorseName := CopyStr(sHorseName, 1, (iHPos - 1));
                              sHorseName := FastReplace(sHorseName, 'DH-', '', True);
                              sHorseName := FastReplace(sHorseName, 'DQ-', '', True);

                              if (LeftStr(sHorseName, 1) = '-') then begin
                                 iHPos := Length(sHorseName);
                                 sHorseName := CopyStr(sHorseName, 2, (iHPos - 1));
                              end;

                              sPostPos := Trim(UpperCase(lstResults[iPPIdx]));
                              sProgNbr := Trim(UpperCase(lstResults[iProgNbrIdx]));

                              sOdds := Trim(UpperCase(lstResults[iOddsIdx]));
                              iPos := SmartPos('*', sOdds);
                              if (iPos > 0) then begin
                                 bFavorite := True;
                              end else begin
                                 bFavorite := False;
                              end;
                              sOdds := FastReplace(sOdds, '*', '', True);

                              sFinishPos := Trim(UpperCase(lstResults[iFinPosIdx]));
                              iFPPos := SmartPos('-', sFinishPos);
                              if iFPPos = 2 then begin
                                 sFinishPos := CopyStr(sFinishPos, 1, 1);
                              end else begin
                                 sFinishPos := CopyStr(sFinishPos, 1, 2);
                              end;

                              sOdds := Trim(sOdds);
                              sPostPos := Trim(sPostPos);

                              sProgNbr := Trim(sProgNbr);
                              if (atoi(sProgNbr) < 10) then begin
                                 sProgNbr := ' ' + sProgNbr;
                              end;

                              sFinishPos := Trim(sFinishPos);
                              if sFinishPos = '--' then begin
                                 sFinishPos := '99';
                              end;

                              sHorseName := Trim(sHorseName);

                              tblH.IndexName := 'ByProgramNbr';
                              tblH.SetKey();
                              tblH.FieldByName('RangeRaceDate').Value := tblE.FieldByName('RaceDate').Value;
                              tblH.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                              tblH.FieldByName('RaceNbr').AsInteger := iRaceNbr;
                              tblH.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                              tblH.FieldByName('ProgramNbr').AsString := sProgNbr;
                              sKey := 'TrkCode: ' + tblH.FieldByName('TrkCode').AsString +
                                 'RaceNbr: ' + tblH.FieldByName('RaceNbr').AsString +
                                 'RaceDate: ' + tblH.FieldByName('RaceDate').AsString +
                                 'ProgramNbr: ' + tblH.FieldByName('ProgramNbr').AsString;

                              if (tblH.GotoKey()) then begin
                                 //Strip Country For Compare

                                 sHorseNameHH := tblH.FieldByName('HorseName').AsString;
                                 iHPos := SmartPos('(', sHorseNameHH);
                                 if iHPos > 0 then begin
                                    sHorseNameHH := CopyStr(sHorseNameHH, 1, (iHPos - 1));
                                 end;
                                 sHorseNameHH := Trim(sHorseNameHH);

                                 if (LeftStr(sHorseNameHH, 1) = '-') then begin
                                    iHPos := Length(sHorseNameHH);
                                    sHorseNameHH := CopyStr(sHorseNameHH, 2, (iHPos - 1));
                                 end;

                                 if Trim(sHorseNameHH) = Trim(sHorseName) then begin
                                    if (atof(sOdds) > 0) and (atoi(sFinishPos) > 0) then begin
                                       tblH.Edit();
                                       tblH.FieldByName('Odds').AsFloat := atof(sOdds);
                                       tblH.FieldByName('FinishPos').AsInteger := atoi(sFinishPos);
                                       tblH.FieldByName('IsFavorite').AsBoolean := bFavorite;
                                       tblH.Post();
                                    end else begin
                                       hLog.AddToLog(sKey + ' Odds/FinPos = 0 - ' + sOdds + ' ' + sFinishPos + ' ' + sTmp, msevOperation);
                                       //                                    MessageDlg(sOdds + ' ' + sFinishPos, mtWarning, [mbOK], 0);
                                    end;
                                 end else begin
                                    hLog.AddToLog(sKey + ' Names <> ' + '|' + Trim(sHorseNameHH) + '|' + Trim(sHorseName) + '| / ' + sTmp, msevOperation);
                                    //                                 MessageDlg('|' + Trim(sHorseNameHH)  + '-' + Trim(sHorseName) + '|' , mtWarning, [mbOK], 0);
                                 end;
                                 //                              end else begin
                                 //                                 hLog.AddToLog(sKey + ' HH Record Not Found - ' + sTmp, msevOperation);
                                                                  //                                 MessageDlg(sProgNbr, mtWarning, [mbOK], 0);
                              end;
                           end;
                        end;
                     finally
                        FreeAndNil(lstResults);
                     end;
                  end;
               end;

               RaceChange();

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
