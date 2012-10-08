unit UnitSpeedPoints;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure UpdateQSPAndKSP
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

procedure UpdateRunStyle
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure UpdateQSPAndKSP
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );
var

   sTrkCode: string;
   sSaveTrkCode: string;

   dtRaceDate: TDateTime;
   dtSaveRaceDate: TDateTime;

   iHorseNbr: integer;
   iSaveHorseNbr: integer;

   iIdx: integer;

   iStaCnt: integer;
   iTotalCnt: integer;

   bRouteRace: boolean;
   bSprintRace: boolean;

   iPPNbr: integer;
   iNbrRateableRaces: integer;

   sBL: string;
   fBL: double;
   fLH: double;

   iQSP: integer;
   fKSP: double;

   fDistanceDiff: double;

   bPPRouteRace: boolean;
   bPPSprintRace: boolean;

   fPPPos: double;
   fPPFldSize: double;
   fPPRearHalf: double;
   fPPDistanceInFurlongs: double;
   fTodaysDistanceInFurlongs: double;

   sPPSurface: string;
   sTodaysSurface: string;

   iLen: integer;
   sTmp: string;
   iBegPos: integer;

   bAddBonusPoints: boolean;
   bInRearHalfAllRaces: boolean;

   bLast5WereRoutes: boolean;
   bLast5RoutesNotWithinOneLength: boolean;
   f1stKSP: double;
   f2ndKSP: double;
   f3rdKSP: double;

   function CalcKSP(bFirstCall: boolean): double;
   begin

      f1stKSP := 9999;
      f2ndKSP := 9999;
      f3rdKSP := 9999;
      iNbrRateableRaces := 0;

      iPPNbr := 1;

      //Everyone starts with 1 point
      fKSP := 0.00;

      Result := 9999;
      while (iPPNbr <= MAX_KSP_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin
            Inc(iNbrRateableRaces);

            sPPSurface := tblPP.FieldByName('Surf').AsString;
            fPPDistanceInFurlongs := GetPastFurlongs(tblPP.FieldByName('DistanceDesc').AsString);

            sTodaysSurface := tblR.FieldByName('Surface').AsString;
            fTodaysDistanceInFurlongs := tblR.FieldByName('DistanceInFurlongs').AsFloat;

            if (fPPDistanceInFurlongs < MILE_FURLONGS) then begin
               bPPRouteRace := False;
               bPPSprintRace := True;
            end else begin
               bPPRouteRace := True;
               bPPSprintRace := False;
            end;

            // 1st Call
            if (bFirstCall) then begin
               fPPPos := tblPP.FieldByName('Pos1stCall').AsFloat;
               sTmp := tblPP.FieldByName('Len1Back').AsString;
            end else begin // 2nd Call
               fPPPos := tblPP.FieldByName('Pos2ndCall').AsFloat;
               sTmp := tblPP.FieldByName('Len2Back').AsString;
            end;

            iLen := Length(sTmp);
            iBegPos := SmartPos('-', sTmp);
            sBL := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);
            fBL := atof(sBL);
            if (sBL = 'NK') then begin
               fBL := 0.25;
            end;
            if (sBL = 'HD') then begin
               fBL := 0.10;
            end;

            // Leading so lengths are lengths ahead
            if (fPPPos = 1) then begin
               sBL := '';
               fLH := fBL;
               fBL := 0;
            end;

            fPPFldSize := tblPP.FieldByName('FldSize').AsFloat;

            //Page 19
            //Step 1
            fKSP := fPPPos + (fBL / 2);

            //Step 2
            fKSP := (fKSP / fPPFldSize);

            //Step 3
            fKSP := (fKSP * 100);

            //Step 4
            if (fPPPos = 1) then begin
               if (fLH > 2.00) then begin
                  fKSP := fKSP - 8;
               end else begin
                  fKSP := fKSP - ((fLH / 0.25) * 2);
               end;
            end;

            //Step 5
            fDistanceDiff := (fTodaysDistanceInFurlongs - fPPDistanceInFurlongs) / 2;
            if (fTodaysDistanceInFurlongs < fPPDistanceInFurlongs) then begin
               fKSP := fKSP - (fDistanceDiff * 7);
            end;
            if (fTodaysDistanceInFurlongs > fPPDistanceInFurlongs) then begin
               fKSP := fKSP + (fDistanceDiff * 7);
            end;

            //Step 6
            if ((sPPSurface = 'T') and (sTodaysSurface = 'D')) then begin
               // 80: Result := '1m';
               // 85: Result := '1 1/16m';
               // 90: Result := '1 1/8m';
               // 95: Result := '1 3/16m';
               //100: Result := '1 1/4m';
               if ((fPPDistanceInFurlongs >= 80.00) and (fPPDistanceInFurlongs < 85.00)) then begin
                  fKSP := fKSP + 10;
               end;
               if (fPPDistanceInFurlongs = 85) then begin
                  fKSP := fKSP + 20;
               end;
               if ((fPPDistanceInFurlongs >= 90.00) and (fPPDistanceInFurlongs <= 95.00)) then begin
                  fKSP := fKSP + 30;
               end;
               if (fPPDistanceInFurlongs >= 100) then begin
                  fKSP := fKSP + 40;
               end;
            end;

            if (iPPNBr = 1) then begin
               f1stKSP := fKSP;
            end;
            if (iPPNBr = 2) then begin
               f2ndKSP := fKSP;
            end;
            if (iPPNBr = 3) then begin
               f3rdKSP := fKSP;
            end;
         end; //If goto key
         Inc(iPPNbr);
      end; // While

      if (iNbrRateableRaces = 1) then begin
         Result := f1stKSP * 2;
         exit;
      end;

      if (iNbrRateableRaces = 2) then begin
         Result := f1stKSP + f2ndKSP;
         exit;
      end;

      if (iNbrRateableRaces = 3) then begin
         if ((f1stKSP > f2ndKSP) and (f1stKSP > f3rdKSP)) then begin
            Result := f2ndKSP + f3rdKSP;
            exit;
         end;
         if ((f2ndKSP > f1stKSP) and (f2ndKSP > f3rdKSP)) then begin
            Result := f1stKSP + f3rdKSP;
            exit;
         end;
         if ((f3rdKSP > f1stKSP) and (f3rdKSP > f2ndKSP)) then begin
            Result := f1stKSP + f2ndKSP;
            exit;
         end;
      end;

   end;

   procedure CalcQSP(bFirstCall: boolean);
   begin

      bAddBonusPoints := True;
      bInRearHalfAllRaces := True;
      bLast5WereRoutes := True;
      bLast5RoutesNotWithinOneLength := True;

      iPPNbr := 1;
      iNbrRateableRaces := 0;

      //Everyone starts with 1 point
      iQSP := 1;
      while (iPPNbr <= MAX_QSP_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin
            fPPDistanceInFurlongs := GetPastFurlongs(tblPP.FieldByName('DistanceDesc').AsString);

            if (fPPDistanceInFurlongs < MILE_FURLONGS) then begin
               bPPRouteRace := False;
               bPPSprintRace := True;
            end else begin
               bPPRouteRace := True;
               bPPSprintRace := False;
            end;

            // 1st Call
            if (bFirstCall) then begin
               fPPPos := tblPP.FieldByName('Pos1stCall').AsFloat;
               sTmp := tblPP.FieldByName('Len1Back').AsString;
            end else begin // 2nd Call
               fPPPos := tblPP.FieldByName('Pos2ndCall').AsFloat;
               sTmp := tblPP.FieldByName('Len2Back').AsString;
            end;


            iLen := Length(sTmp);
            iBegPos := SmartPos('-', sTmp);
            sBL := CopyStr(sTmp, (iBegPos + 1), (iLen - iBegPos) + 1);
            fBL := atof(sBL);

            if (sBL = 'NK') then begin
               fBL := 0.25;
            end;

            if (sBL = 'HD') then begin
               fBL := 0.10;
            end;

            // Leading so lengths are lengths ahead
            if (fPPPos = 1) then begin
               sBL := '';
               fBL := 0;
               fLH := fBL;
            end;

            fPPFldSize := tblPP.FieldByName('FldSize').AsFloat;
            fPPRearHalf := tblPP.FieldByName('FldSize').AsFloat / 2;

            if (iNbrRateableRaces < 3) then begin

               if (bSprintRace) then begin
                  //Calculating Speed Points in Sprint Races:
                  //Each horse starts with one point.
                  //Look at a horse’s last race. It can get from 0 to 2 points
                  //for each ratable race. If it was a route, the horse gets 0 points
                  //(Exception: If the horse was within one length at the first call
                  //of the route, pass that race and move onto the race before it).
                  if (bPPRouteRace) then begin
                     if (fBL <= 1) then begin
                        Inc(iPPNbr);
                        continue;
                     end;
                  end;

                  //If it was a sprint in which the horse was third or better at
                  //the first call, the horse gets a point.
                  //If it was within two lengths of the leader at the first call,
                  //it gets another point
                  //(Exception: for 7 furlong ratable races,
                  //the horse must have been leading at the first call).
                  //If neither of these applies, the horse gets 0 points for that
                  //ratable race.
                  if (bPPSprintRace) then begin
                     if (fPPDistanceInFurlongs <> 7) then begin
                        if (fPPPos <= 2) then begin
                           Inc(iQSP);
                        end;
                        if (fBL <= 3) then begin
                           Inc(iQSP);
                        end;
                     end else begin // 7f
                        if (fPPPos = 1) then begin
                           Inc(iQSP);
                        end;
                     end;
                  end;

                  //You then move onto the race before that,
                  //until you’ve rated three races. After rating three races for each horse,
                  //you have from 1 to 7 points for each horse. You now either add one point or
                  //subtract one point from the total.
                  //If the horse has 7 points and was within a neck of the leader at the first
                  //call of all of its ratable races, it gets a bonus point for a grand total of 8.
                  if (bPPSprintRace) then begin
                     if (fBL > 0.25) then begin
                        bAddBonusPoints := False;
                     end;
                  end;

                  //If the horse has 1 point and was in the rear half of the field in all of its
                  //ratable races, or if all its last 5 races were routes,
                  //and it was not within one length of the leader in any of them,
                  //it loses a point for a grand total of 0.
                  if (fPPPos < fPPRearHalf) then begin
                     bInRearHalfAllRaces := False;
                  end;

                  if (bPPSprintRace) then begin
                     bLast5WereRoutes := False;
                  end;

                  if (bPPRouteRace) then begin
                     if (fBL <= 1) then begin
                        bLast5RoutesNotWithinOneLength := False;
                     end;
                  end;

                  Inc(iNbrRateableRaces);
                  if (iNbrRateableRaces = 3) then begin
                     if (iQSP = 7) then begin
                        if (bAddBonusPoints) then begin
                           Inc(iQSP);
                        end;
                     end;
                     if (iQSP = 1) then begin
                        if (bInRearHalfAllRaces) then begin
                           iQSP := 0;
                        end;

                        if (bLast5WereRoutes) then begin
                           if (bLast5RoutesNotWithInOneLength) then begin
                              iQSP := 0;
                           end;
                        end;
                     end;
                  end;

               end; //Sprint race

               if (bRouteRace) then begin
                  //Calculating Speed Points in Route Races:
                  //Each horse starts with one point.

                  //Look at a horse’s last race. It can get from 0 to 2 points
                  //for each ratable race.

                  //If the ratable race was a route in which the horse was
                  //third or better at the first call, the horse gets a point.
                  //If the horse was also within three lengths at the first call,
                  //it gets a second point
                  if (bPPRouteRace) then begin
                     if (fPPPos <= 3) then begin
                        Inc(iQSP);
                     end;
                     if (fBL <= 3) then begin
                        Inc(iQSP);
                     end;
                  end;

                  //Now, if the ratable race was a sprint in which the horse was
                  //within six lengths at the first call, it gets a point.
                  //If the horse was also either third or better at the first call or
                  //within three lengths of the leader at the first call,
                  //it gets a second point.
                  if (bPPSprintRace) then begin
                     if (fBL <= 6) then begin
                        Inc(iQSP);
                     end;
                     if ((fPPPos <= 3) or (fBL <= 6)) then begin
                        Inc(iQSP);
                     end;
                  end;

                  //After rating three races for each horse, you have from 1 to 7 points
                  //for each horse. You now either add one point or subtract one point
                  //from the total. If the horse has 7 points and was within a one length
                  //of the leader at the first call of each of its ratable routes and/or
                  //within three lengths of the leader in each of its ratable sprints,
                  //it gets a bonus point for a grand total of 8.
                  if (bPPRouteRace) then begin
                     if (fBL > 1) then begin
                        bAddBonusPoints := False;
                     end;
                  end;
                  if (bPPSprintRace) then begin
                     if (fBL > 3) then begin
                        bAddBonusPoints := False;
                     end;
                  end;

                  //If the horse has 1 point and was in the rear half of the field in all
                  //of its ratable routes, it loses a point for a grand total of 0.
                  if (fPPPos <= 3) then begin
                     if (fPPPos < fPPRearHalf) then begin
                        bInRearHalfAllRaces := False;
                     end;
                  end;

                  Inc(iNbrRateableRaces);
                  if (iNbrRateableRaces = 3) then begin
                     if (iQSP = 7) then begin
                        if (bAddBonusPoints) then begin
                           Inc(iQSP);
                        end;
                     end;
                     if (iQSP = 1) then begin
                        if (bInRearHalfAllRaces) then begin
                           iQSP := 0;
                        end;
                     end;
                  end;
               end; // Route Race

            end; // Rateable races

         end; //If goto key
         Inc(iPPNbr);
      end; // While
   end;


   function AdjustQSP(iPoints: integer): integer;
   begin
      Result := 0;
      //You must make adjustments for horses who had less than three ratable races.
      //If a horse only had one ratable race and earned 1 point in that race,
      //add 2 more points to its grand total;
      //if it earned 2 points in that race, add 3 more points to its grand total.

      //If a horse had only two ratable races and earned 2 or more total points
      //in those races, add 1 more point to its grand total.
      if (iNbrRateableRaces = 1) then begin
         if (iPoints = 1) then begin
            iPoints := iPoints + 2;
         end;
         if (iPoints = 2) then begin
            iPoints := iPoints + 3;
         end;
      end;
      if (iNbrRateableRaces = 2) then begin
         if (iPoints >= 2) then begin
            iPoints := iPoints + 1;
         end;
      end;
      Result := iPoints;
   end;

   function QSPRunStyle(): string;
   var
      fBL1stCall: double;
      fBL2ndCall: double;
      fBLStrCall: double;
      fBLFinCall: double;

      fPos1stCall: double;
      fPos2ndCall: double;
      fPosStrCall: double;
      fPosFinCall: double;

   begin
      Result := 'U';

      fBL1stCall := 0;
      fBL2ndCall := 0;
      fBLStrCall := 0;
      fBLFinCall := 0;

      fPos1stCall := 0;
      fPos2ndCall := 0;
      fPosStrCall := 0;
      fPosFinCall := 0;

      iPPNbr := 1;

      //   Running Style
      while (iPPNbr < MAX_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin

            // 1st Call
            fPos1stCall := tblPP.FieldByName('Pos1stCall').AsFloat;
            fPos2ndCall := tblPP.FieldByName('Pos2ndCall').AsFloat;
            fPosStrCall := tblPP.FieldByName('PosStrCall').AsFloat;
            fPosFinCall := tblPP.FieldByName('PosFinCall').AsFloat;

            fBL1stCall := tblPP.FieldByName('BL1stCall').AsFloat;
            fBL2ndCall := tblPP.FieldByName('BL2ndCall').AsFloat;
            fBLStrCall := tblPP.FieldByName('BLStrCall').AsFloat;
            fBLFinCall := tblPP.FieldByName('BLFinCall').AsFloat;

            if (fPosFinCall = 1) then begin

               //E 	Early             	A win where the horse goes wire to wire
               if ((fPos1stCall = 1) and (fPos2ndCall = 1) and (fPosStrCall = 1)) then begin
                  Result := 'E';
                  break;
               end;

               //EP 	Early Presser 	      A win where the horse is within 1 length of the leader at the 1/4 mile call
               if (fBL1stCall <= 1) then begin
                  if (fPos1stCall > 1) then begin
                     Result := 'EP';
                     break;
                  end;
               end;

               //P 	Presser 	   A win where the horse is within 1 length of the leader at the 1/2 mile call
               if (fBL2ndCall <= 1) then begin
                  if (fPos2ndCall > 1) then begin
                     Result := 'P';
                     break;
                  end;
               end;

               //PS 	Presser Sustained 	A win where the horse is within 1 length of the leader at the stretch call
               if (fBLStrCall <= 1) then begin
                  if (fPosStrCall > 1) then begin
                     Result := 'PC';
                     break;
                  end;
               end;

               //S 	Sustained          	A win where the horse does not qualify for any of the above
               //                        but is never more
               //                        than 7 lengths off the pace
               //                        or positioned farther back than seventh
               if (fPos1stCall > 1) and (fPos1stCall <= 7) then begin
                  if (fPos2ndCall > 1) and (fPos2ndCall <= 7) then begin
                     if (fPosStrCall > 1) and (fPosStrCall <= 7) then begin
                        if ((fBL1stCall <= 7) and (fBL2ndCall <= 7) and (fBLStrCall <= 7)) then begin
                           Result := 'C';
                           break;
                        end;
                     end;
                  end;
               end;

               Result := 'C';
               break;
            end;

         end; //If goto key
         Inc(iPPNbr);
      end; // While
   end;

   function QSPRunStyle2ndCall(): string;
   var
      fBL2ndCall: double;
      fBLStrCall: double;
      fBLFinCall: double;

      fPos2ndCall: double;
      fPosStrCall: double;
      fPosFinCall: double;

   begin
      Result := 'U';

      fBL2ndCall := 0;
      fBLStrCall := 0;
      fBLFinCall := 0;

      fPos2ndCall := 0;
      fPosStrCall := 0;
      fPosFinCall := 0;

      iPPNbr := 1;

      //   Running Style
      while (iPPNbr < MAX_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin

            fPos2ndCall := tblPP.FieldByName('Pos2ndCall').AsFloat;
            fPosStrCall := tblPP.FieldByName('PosStrCall').AsFloat;
            fPosFinCall := tblPP.FieldByName('PosFinCall').AsFloat;

            fBL2ndCall := tblPP.FieldByName('BL2ndCall').AsFloat;
            fBLStrCall := tblPP.FieldByName('BLStrCall').AsFloat;
            fBLFinCall := tblPP.FieldByName('BLFinCall').AsFloat;

            if (fPosFinCall = 1) then begin

               //E 	Early             	A win where the horse goes wire to wire
               if ((fPos2ndCall = 1) and (fPosStrCall = 1)) then begin
                  Result := 'E';
                  break;
               end;


               //P 	Presser 	   A win where the horse is within 1 length of the leader at the 1/2 mile call
               if (fBL2ndCall <= 1) then begin
                  if (fPos2ndCall > 1) then begin
                     Result := 'P';
                     break;
                  end;
               end;

               //PS 	Presser Sustained 	A win where the horse is within 1 length of the leader at the stretch call
               if (fBLStrCall <= 1) then begin
                  if (fPosStrCall > 1) then begin
                     Result := 'PC';
                     break;
                  end;
               end;

               //S 	Sustained          	A win where the horse does not qualify for any of the above
               //                        but is never more
               //                        than 7 lengths off the pace
               //                        or positioned farther back than seventh
               if (fPos2ndCall > 1) and (fPos2ndCall <= 7) then begin
                  if (fPosStrCall > 1) and (fPosStrCall <= 7) then begin
                     if (fBL2ndCall <= 7) then begin
                        Result := 'C';
                        break;
                     end;
                  end;
               end;

               Result := 'C';
               break;
            end;

         end; //If goto key
         Inc(iPPNbr);
      end; // While
   end;

   function QSPRunStyleMSWMCL(): string;
   var
      fBL1stCall: double;
      fBL2ndCall: double;
      fBLStrCall: double;
      fBLFinCall: double;

      fPos1stCall: double;
      fPos2ndCall: double;
      fPosStrCall: double;
      fPosFinCall: double;


   begin
      Result := 'U';

      fBL2ndCall := 0;
      fBLStrCall := 0;
      fBLFinCall := 0;

      fPos2ndCall := 0;
      fPosStrCall := 0;
      fPosFinCall := 0;

      iPPNbr := 1;

      //   Running Style
      while (iPPNbr < MAX_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin
            // 1st Call
            fPos2ndCall := tblPP.FieldByName('Pos2ndCall').AsFloat;
            fPosStrCall := tblPP.FieldByName('PosStrCall').AsFloat;
            fPosFinCall := tblPP.FieldByName('PosFinCall').AsFloat;

            fBL2ndCall := tblPP.FieldByName('BL2ndCall').AsFloat;
            fBLStrCall := tblPP.FieldByName('BLStrCall').AsFloat;
            fBLFinCall := tblPP.FieldByName('BLFinCall').AsFloat;

            //E 	Early             	A win where the horse goes wire to wire
            if ((fPos2ndCall < 3) and (fPosStrCall < 3)) then begin
               Result := 'E';
               break;
            end;


            //P 	Presser 	            A win where the horse is within 1 length of the leader at the 1/2 mile call
            if (fBL2ndCall <= 2) then begin
               Result := 'P';
               break;
            end;

            //PS 	Presser Sustained 	A win where the horse is within 1 length of the leader at the stretch call
            if (fBLStrCall <= 2) then begin
               Result := 'PC';
               break;
            end;

            //S 	Sustained          	A win where the horse does not qualify for any of the above but is never more
             //                         than 7 lengths off the pace or positioned farther back than seventh
            if (fPos2ndCall > 2) and (fPos2ndCall <= 7) then begin
               if (fPosStrCall > 2) and (fPosStrCall <= 7) then begin
                  if (fBL2ndCall <= 7) then begin
                     Result := 'C';
                     break;
                  end;
               end;
            end;

            Result := 'C';
            break;

         end; //If goto key
         Inc(iPPNbr);
      end; // While
   end;

   function QSPRunStyleMSWMCL2ndCall(): string;
   var
      fBL2ndCall: double;
      fBLStrCall: double;
      fBLFinCall: double;

      fPos2ndCall: double;
      fPosStrCall: double;
      fPosFinCall: double;


   begin
      Result := 'U';

      fBL2ndCall := 0;
      fBLStrCall := 0;
      fBLFinCall := 0;

      fPos2ndCall := 0;
      fPosStrCall := 0;
      fPosFinCall := 0;

      iPPNbr := 1;

      //   Running Style
      while (iPPNbr < MAX_PP) do begin
         tblPP.IndexName := '';
         tblPP.SetKey();
         tblPP.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
         tblPP.FieldByName('RaceDate').AsDateTime := tblE.FieldByName('RaceDate').AsDateTime;
         tblPP.FieldByName('HorseNbr').AsInteger := tblE.FieldByName('HorseNbr').AsInteger;
         tblPP.FieldByName('PPNbr').AsInteger := iPPNbr;
         if (tblPP.GotoKey()) then begin
            // 1st Call
            fPos2ndCall := tblPP.FieldByName('Pos2ndCall').AsFloat;
            fPosStrCall := tblPP.FieldByName('PosStrCall').AsFloat;
            fPosFinCall := tblPP.FieldByName('PosFinCall').AsFloat;

            fBL2ndCall := tblPP.FieldByName('BL2ndCall').AsFloat;
            fBLStrCall := tblPP.FieldByName('BLStrCall').AsFloat;
            fBLFinCall := tblPP.FieldByName('BLFinCall').AsFloat;

            //E 	Early             	A win where the horse goes wire to wire
            if ((fPos2ndCall < 3) and (fPosStrCall < 3)) then begin
               Result := 'E';
               break;
            end;


            //P 	Presser 	            A win where the horse is within 1 length of the leader at the 1/2 mile call
            if (fBL2ndCall <= 2) then begin
               Result := 'P';
               break;
            end;

            //PS 	Presser Sustained 	A win where the horse is within 1 length of the leader at the stretch call
            if (fBLStrCall <= 2) then begin
               Result := 'PC';
               break;
            end;

            //S 	Sustained          	A win where the horse does not qualify for any of the above but is never more
             //                         than 7 lengths off the pace or positioned farther back than seventh
            if (fPos2ndCall > 2) and (fPos2ndCall <= 7) then begin
               if (fPosStrCall > 2) and (fPosStrCall <= 7) then begin
                  if ((fBL2ndCall <= 7) and (fBLStrCall <= 7)) then begin
                     Result := 'C';
                     break;
                  end;
               end;
            end;

            Result := 'C';
            break;

         end; //If goto key
         Inc(iPPNbr);
      end; // While
   end;

   function QSPRaceShape(): string;
   var
      iNbrOfU78: integer;
      iNbrOfU: integer;
      iNbrOfE: integer;
      iNbrOfP: integer;
      iNbrOfEP: integer;
      iNbrOfS: integer;
      iRaceNbr: integer;
      sTrkCode: string;

      iSaveRaceNbr: integer;
      sSaveTrkCode: string;


   begin

      iNbrOfU := 0;
      iNbrOfE := 0;
      iNbrOfP := 0;
      iNbrOfEP := 0;
      iNbrOfS := 0;

      Result := 'No Race Shape';

      // Get The Info
      tblE.IndexName := '';
      tblE.SetKey();
      tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
      tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
      tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
      tblE.FieldByName('PostPos').AsInteger := 1;

      if (tblE.GotoKey()) then begin
         iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
         sTrkCode := tblE.FieldByName('TrkCode').AsString;

         iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
         sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

         while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'U' then begin
               if tblE.FieldByName('QSP1stCall').AsInteger >= 7 then begin
                  Inc(iNbrOfU78)
               end else begin
                  Inc(iNbrOfU)
               end;
            end;

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'E' then begin
               Inc(iNbrOfE);
            end;

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'EP' then begin
               Inc(iNbrOfEP);
            end;

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'P' then begin
               Inc(iNbrOfP);
            end;

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'C' then begin
               Inc(iNbrOfS);
            end;

            if tblE.FieldByName('QSP1stCallRunStyle').AsString = 'C' then begin
               Inc(iNbrOfS);
            end;

            tblE.Next();

            if (tblE.Eof) then begin
               iRaceNbr := 0;
               sTrkCode := '';
            end else begin
               iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
               sTrkCode := tblE.FieldByName('TrkCode').AsString;
            end;
         end;
      end;


      if (iNbrOfE = 1) then begin
         Result := 'E - LONE SPEED?';
         exit;
      end;

      if (iNbrOfE = 2) then begin
         Result := '2 E SPEED';
         exit;
      end;

      if (iNbrOfE = 3) then begin
         Result := '3 E SPEED';
         exit;
      end;

      if (iNbrOfE > 3) then begin
         Result := '3+ E SPEED';
         exit;
      end;


      if (iNbrOfE = 1) and (iNbrOfEP >= 1) then begin
         Result := 'HONEST - E/EP';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP >= 2) then begin
         Result := 'HONEST - EP/EP';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 1) and (iNbrOfP >= 1) then begin
         Result := 'LONE EARLY - EP/P';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 1) and (iNbrOfP = 0) then begin
         Result := 'LONE EARLY - EP';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 0) and (iNbrOfP >= 2) and (iNbrOfS = 0) then begin
         Result := ' SLOW - PP';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 0) and (iNbrOfP >= 3) and (iNbrOfS = 0) then begin
         Result := ' SLOW - P';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 0) and (iNbrOfP = 1) then begin
         Result := ' SLOW - PS';
         exit;
      end;

      if (iNbrOfE = 0) and (iNbrOfEP = 0) and (iNbrOfP = 0) then begin
         Result := ' SLOW - S';
         exit;
      end;

      if (iNbrOfU78 >= 3) then begin
         Result := 'FAST - EEE?';
         exit;
      end;

      if (iNbrOfU78 >= 2) then begin
         Result := 'FAST - EE?';
         exit;
      end;

   end;


begin

   hLog.AddToLog('UpdateSpeedPoints', msevOperation);
   try
      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblPP);

      try
         iHorseNbr := 0;
         iSaveHorseNbr := 0;

         sTrkCode := '';
         sSaveTrkCode := '';

         dtRaceDate := 0;
         dtSaveRaceDate := 0;

         iStaCnt := 0;
         iTotalCnt := 0;


         tblE.First();
         InitPrgBar(tblE.RecordCount);

         staBar.SimpleText := 'Updating Speed Points - ' +
            tblE.FieldByName('TrkCode').AsString + ' ' +
            tblE.FieldByName('RaceDate').AsString + ' Race # ' +
            tblE.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Speed Points - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
               Application.ProcessMessages();
               iStaCnt := 0;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();


            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               if tblR.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
                  bRouteRace := False;
                  bSprintRace := True;
               end else begin
                  bRouteRace := True;
                  bSprintRace := False;
               end;


               tblE.Edit();
               if (dm.tblEntries.FieldByName('DebutIndicator').AsString <> '*') then begin
                  // Quirin Speed Points
                  CalcQSP(True); //First Call
                  tblE.FieldByName('QSP1stCall').AsInteger := AdjustQSP(iQSP);

                  CalcQSP(False); //Second Call
                  tblE.FieldByName('QSP2ndCall').AsInteger := AdjustQSP(iQSP);

                  // Klein Speed Points
                  tblE.FieldByName('KSP1stCall').AsFloat := CalcKSP(True);
                  tblE.FieldByName('KSP2ndCall').AsFloat := CalcKSP(False);

               end else begin
                  tblE.FieldByName('QSP1stCall').AsInteger := 0;
                  tblE.FieldByName('QSP2ndCall').AsInteger := 0;
                  tblE.FieldByName('KSP1stCall').AsInteger := 9999;
                  tblE.FieldByName('KSP2ndCall').AsInteger := 9999;
               end;

//               if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
//                  (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
//                  tblE.FieldByName('QSP1stCallRunStyle').AsString := QSPRunStyleMSWMCL();
//                  tblE.FieldByName('QSP2ndCallRunStyle').AsString := QSPRunStyleMSWMCL2ndCall();
//               end else begin
//                  tblE.FieldByName('QSP1stCallRunStyle').AsString := QSPRunStyle();
//                  tblE.FieldByName('QSP2ndCallRunStyle').AsString := QSPRunStyle2ndCall();
//               end;

               tblE.Post();


            end;
            tblE.Next();
         end;

         iStaCnt := 0;
         iTotalCnt := 0;

         tblR.First();
         InitPrgBar(tblR.RecordCount);

         staBar.SimpleText := 'Updating Race Shape - ' +
            tblR.FieldByName('TrkCode').AsString + ' ' +
            tblR.FieldByName('RaceDate').AsString + ' Race # ' +
            tblR.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);

         while not tblR.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Race Shape - ' +
                  tblR.FieldByName('TrkCode').AsString + ' ' +
                  tblR.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblR.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
               Application.ProcessMessages();
               iStaCnt := 0;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();                                        
            tblR.Edit();
            tblR.FieldByName('RaceShape').AsString := QSPRaceShape();
            tblR.Post();
            tblR.Next();
         end;

      except
         tblE.IndexName := '';
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(tblPP);
         ClearPrgStatusBars();
      end;

      tblE.IndexName := '';
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblPP);
      ClearPrgStatusBars();


   finally
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();

   end;

end;

procedure UpdateRunStyle
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var


   iQSP1stCallRank: integer;
   iKSP1stCallRank: integer;

   iQSP2ndCallRank: integer;
   iKSP2ndCallRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   sQSP1stCallRunStyle: string;

   sQSP2ndCallRunStyle: string;

   iStaCnt: integer;
   iTotalCnt: integer;

begin
   hLog.AddToLog('UpdateRunStyle', msevOperation);
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         tblE.First();
         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Run Style - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
               Application.ProcessMessages();
               iStaCnt := 0;
            end else begin
               Application.ProcessMessages();
               Inc(iStaCnt);
               Inc(iTotalCnt);
            end;

            IncPrgBar();

            tblE.Edit();

            iEarlyPaceRank := tblE.FieldByName('EarlyPaceRank').AsInteger;
            iMiddlePaceRank := tblE.FieldByName('MiddlePaceRank').AsInteger;
            iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

            iEarlyPacePosRank := tblE.FieldByName('EarlyPacePosRank').AsInteger;
            iMiddlePacePosRank := tblE.FieldByName('MiddlePacePosRank').AsInteger;
            iLatePacePosRank := tblE.FieldByName('LatePacePosRank').AsInteger;

            iQSP1stCallRank := tblE.FieldByName('QSP1stCallRank').AsInteger;
            iKSP1stCallRank := tblE.FieldByName('KSP1stCallRank').AsInteger;
            sQSP1stCallRunStyle := tblE.FieldByName('QSP1stCallRunStyle').AsString;

            iQSP2ndCallRank := tblE.FieldByName('QSP2ndCallRank').AsInteger;
            iKSP2ndCallRank := tblE.FieldByName('KSP2ndCallRank').AsInteger;
            sQSP2ndCallRunStyle := tblE.FieldByName('QSP2ndCallRunStyle').AsString;

//            if ((sQSP1stCallRunStyle = '') or (sQSP1stCallRunStyle = 'U')) then begin
//               if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1)) or (iKSP1stCallRank = 1) then begin
//                  tblE.FieldByName('QSP1stCallRunStyle').AsString := 'E';
//               end;
//            end;
//
//            if ((sQSP1stCallRunStyle = 'S') or (sQSP1stCallRunStyle = 'C')) then begin
//               if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1)) then begin
//                  tblE.FieldByName('QSP1stCallRunStyle').AsString := 'E';
//               end;
//            end;
//
//            if ((sQSP2ndCallRunStyle = '') or (sQSP2ndCallRunStyle = 'U')) then begin
//               if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1)) or (iKSP2ndCallRank = 1) then begin
//                  tblE.FieldByName('QSP2ndCallRunStyle').AsString := 'E';
//               end;
//            end;
//
//            if ((sQSP2ndCallRunStyle = 'S') or (sQSP2ndCallRunStyle = 'C')) then begin
//               if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1)) then begin
//                  tblE.FieldByName('QSP2ndCallRunStyle').AsString := 'E';
//               end;
//            end;

            tblE.Post();
            tblE.Next();
         end;
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();

   end;

end;


end.
