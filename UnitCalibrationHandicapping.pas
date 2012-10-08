unit UnitCalibrationHandicapping;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure UpdateCalibration
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure UpdateCalibration
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

   fDistanceDiff: double;

   bPPRouteRace: boolean;
   bPPSprintRace: boolean;

   fPPDistanceInFurlongs: double;
   fTodaysDistanceInFurlongs: double;

   sPPSurface: string;
   sTodaysSurface: string;

   iLen: integer;
   sTmp: string;
   iBegPos: integer;


   bIsLastOutMoveOnTurn: boolean;
   fDaysLastOutMoveOnTurn: double;

   bIsLastOutFFMove: boolean;
   fDaysLastOutFFMove: double;

   bIsPriorToLastOutMoveOnTurn: boolean;
   fDaysPriorToLastOutMoveOnTurn: double;

   bIsPriorToLastOutFFMove: boolean;
   fDaysPriorToLastOutFFMove: double;

   fBL1stCall: double;
   fBL2ndCall: double;
   fBLStrCall: double;
   fBLFinCall: double;

   fPos1stCall: double;
   fPos2ndCall: double;
   fPosStrCall: double;
   fPosFinCall: double;

   fBLGain1stTo2ndCall: double;
   fBLGainStrToFinCall: double;

   bPosGain1stTo2ndCall: boolean;
   bPosGainStrToFinCall: boolean;

   fDaysFromTodaysRace: double;

   procedure CalcMoves();
   begin

      bIsLastOutMoveOnTurn := False;
      fDaysLastOutMoveOnTurn := 0;

      bIsLastOutFFMove := False;
      fDaysLastOutFFMove := 0;

      bIsPriorToLastOutMoveOnTurn := False;
      fDaysPriorToLastOutMoveOnTurn := 0;

      bIsPriorToLastOutFFMove := False;
      fDaysPriorToLastOutFFMove := 0;

      fBL1stCall := 0;
      fBL2ndCall := 0;
      fBLStrCall := 0;
      fBLFinCall := 0;

      fPos1stCall := 0;
      fPos2ndCall := 0;
      fPosStrCall := 0;
      fPosFinCall := 0;

      fBLGain1stTo2ndCall := 0;
      fBLGainStrToFinCall := 0;

      bPosGain1stTo2ndCall := False;
      bPosGainStrToFinCall := False; ;


      iPPNbr := 1;


      while (iPPNbr <= 2) do begin
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

            fBL1stCall := tblPP.FieldByName('BL1stCall').AsFloat;
            fBL2ndCall := tblPP.FieldByName('BL2ndCall').AsFloat;
            fBLStrCall := tblPP.FieldByName('BLStrCall').AsFloat;
            fBLFinCall := tblPP.FieldByName('BLFinCall').AsFloat;

            fPos1stCall := tblPP.FieldByName('Pos1stCall').AsFloat;
            fPos2ndCall := tblPP.FieldByName('Pos2ndCall').AsFloat;
            fPosStrCall := tblPP.FieldByName('PosStrCall').AsFloat;
            fPosFinCall := tblPP.FieldByName('PosFinCall').AsFloat;

            fDaysFromTodaysRace := tblPP.FieldByName('DaysFromTodaysRace').AsFloat;

            // First Turn Move
            fBLGain1stTo2ndCall := 0;
            bPosGain1stTo2ndCall := False;
            if (fDaysFromTodaysRace <= 45) then begin
               // 1st Call To 2nd Call
               if (fPos1stCall = 1) and (fPos2ndCall = 1) then begin
                  fBLGain1stTo2ndCall := fBL2ndCall - fBL1stCall;
               end;
               if (fPos1stCall > 1) and (fPos2ndCall > 1) then begin
                  fBLGain1stTo2ndCall := fBL1stCall - fBL2ndCall;
                  if (fPos2ndCall < fPos1stCall) then begin
                     bPosGain1stTo2ndCall := False;
                  end;
               end;
               if (fPos1stCall > 1) and (fPos2ndCall = 1) then begin
                  fBLGain1stTo2ndCall := fBL1stCall + fBL2ndCall;
                  bPosGain1stTo2ndCall := True;
               end;
               if (fPos1stCall = 1) and (fPos2ndCall > 1) then begin
                  fBLGain1stTo2ndCall := (fBL1stCall + fBL2ndCall) * -1;
               end;

               // Str Call To Final Call
               fBLGainStrToFinCall := 0;
               bPosGainStrToFinCall := False;
               if (fPosStrCall = 1) and (fPosFinCall = 1) then begin
                  fBLGainStrToFinCall := fBLFinCall - fBLStrCall;
               end;
               if (fPosStrCall > 1) and (fPosFinCall > 1) then begin
                  fBLGainStrToFinCall := fBLStrCall - fBLFinCall;
                  bPosGainStrToFinCall := False;
                  if (fPosFinCall < fPosStrCall) then begin
                     bPosGainStrToFinCall := True;
                  end;
               end;
               if (fPosStrCall > 1) and (fPosFinCall = 1) then begin
                  fBLGainStrToFinCall := fBLStrCall + fBLFinCall;
                  bPosGainStrToFinCall := True;
               end;
               if (fPosStrCall = 1) and (fPosFinCall > 1) then begin
                  fBLGainStrToFinCall := (fBLStrCall + fBLFinCall) * -1;
               end;

               // 1st Call To 2nd Call
               if (fPosFinCall > 1) then begin
                  if (fBLGain1stTo2ndCall >= 1) then begin
                     if (bPosGain1stTo2ndCall) then begin
                        if (iPPNbr = 1) then begin
                           bIsLastOutMoveOnTurn := True;
                           fDaysLastOutMoveOnTurn := fDaysFromTodaysRace;
                        end;
                     end;
                  end;
               end;

               // Str Call To Final Call
               if (fPosFinCall > 1) then begin
                  if (fBLGainStrToFinCall >= 1) then begin
                     if (bPosGainStrToFinCall) then begin
                        if (iPPNbr = 1) then begin
                           bIsLastOutFFMove := True;
                           fDaysLastOutFFMove := fDaysFromTodaysRace;
                        end;
                     end;
                  end;
               end;

            end; // If <= 45 days


            if ((fDaysFromTodaysRace > 45) and (fDaysFromTodaysRace <= 90)) then begin
               // 1st Call To 2nd Call
               if (fPos1stCall = 1) and (fPos2ndCall = 1) then begin
                  fBLGain1stTo2ndCall := fBL2ndCall - fBL1stCall;
               end;
               if (fPos1stCall > 1) and (fPos2ndCall > 1) then begin
                  fBLGain1stTo2ndCall := fBL1stCall - fBL2ndCall;
                  if (fPos2ndCall < fPos1stCall) then begin
                     bPosGain1stTo2ndCall := False;
                  end;
               end;
               if (fPos1stCall > 1) and (fPos2ndCall = 1) then begin
                  fBLGain1stTo2ndCall := fBL1stCall + fBL2ndCall;
                  bPosGain1stTo2ndCall := True;
               end;
               if (fPos1stCall = 1) and (fPos2ndCall > 1) then begin
                  fBLGain1stTo2ndCall := (fBL1stCall + fBL2ndCall) * -1;
               end;

               // Str Call To Final Call
               fBLGainStrToFinCall := 0;
               bPosGainStrToFinCall := False;
               if (fPosStrCall = 1) and (fPosFinCall = 1) then begin
                  fBLGainStrToFinCall := fBLFinCall - fBLStrCall;
               end;
               if (fPosStrCall > 1) and (fPosFinCall > 1) then begin
                  fBLGainStrToFinCall := fBLStrCall - fBLFinCall;
                  bPosGainStrToFinCall := False;
                  if (fPosFinCall < fPosStrCall) then begin
                     bPosGainStrToFinCall := True;
                  end;
               end;
               if (fPosStrCall > 1) and (fPosFinCall = 1) then begin
                  fBLGainStrToFinCall := fBLStrCall + fBLFinCall;
                  bPosGainStrToFinCall := True;
               end;
               if (fPosStrCall = 1) and (fPosFinCall > 1) then begin
                  fBLGainStrToFinCall := (fBLStrCall + fBLFinCall) * -1;
               end;

               // 1st Call To 2nd Call
               if (fPosFinCall > 1) then begin
                  if (fBLGain1stTo2ndCall >= 1) then begin
                     if (bPosGain1stTo2ndCall) then begin
                        if (iPPNbr = 2) then begin
                           bIsPriorToLastOutMoveOnTurn := True;
                           fDaysPriorToLastOutMoveOnTurn := fDaysFromTodaysRace;
                        end;
                     end;
                  end;
               end;

               // Str Call To Final Call
               if (fPosFinCall > 1) then begin
                  if (fBLGainStrToFinCall >= 1) then begin
                     if (bPosGainStrToFinCall) then begin
                        if (iPPNbr = 2) then begin
                           bIsPriorToLastOutFFMove := True;
                           fDaysPriorToLastOutFFMove := fDaysFromTodaysRace;
                        end;
                     end;
                  end;
               end;
            end; // If > 45 days and <= 90

         end; //If goto key

         Inc(iPPNbr);
      end; // While
   end;



begin

   hLog.AddToLog('UpdateCalibration', msevOperation);
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

         staBar.SimpleText := 'Updating Calibration - ' +
            tblE.FieldByName('TrkCode').AsString + ' ' +
            tblE.FieldByName('RaceDate').AsString + ' Race # ' +
            tblE.FieldByName('RaceNbr').AsString + ' ' +
            IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Calibration - ' +
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

               CalcMoves();

               tblE.FieldByName('IsLastOutMoveOnTurn').AsBoolean := bIsLastOutMoveOnTurn;
               tblE.FieldByName('IsLastOutFFMove').AsBoolean := bIsLastOutFFMove;
               tblE.FieldByName('IsPriorToLastOutMoveOnTurn').AsBoolean := bIsPriorToLastOutMoveOnTurn;
               tblE.FieldByName('IsPriorToLastOutFFMove').AsBoolean := bIsPriorToLastOutFFMove;
               tblE.FieldByName('DaysLastOutMoveOnTurn').AsFloat := fDaysLastOutMoveOnTurn;
               tblE.FieldByName('DaysLastOutFFMove').AsFloat := fDaysLastOutFFMove;
               tblE.FieldByName('DaysPriorToLastOutMoveOnTurn').AsFloat := fDaysPriorToLastOutMoveOnTurn;
               tblE.FieldByName('DaysPriorToLastOutFFMove').AsFloat := fDaysPriorToLastOutFFMove;

               tblE.Post();

            end;
            tblE.Next();
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
      CloseTable(tblPP);
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();

   end;

end;

end.

//   ADD IF NOT EXISTS IsLastOutMoveOnTurn BOOLEAN DEFAULT False,
//   ADD IF NOT EXISTS DaysLastOutMoveOnTurn INTEGER DEFAULT 0,
//   ADD IF NOT EXISTS IsLastOutFFMove BOOLEAN DEFAULT False,
//   ADD IF NOT EXISTS DaysLastOutFFMove INTEGER DEFAULT 0,
//   ADD IF NOT EXISTS IsPriorToLastOutMoveOnTurn BOOLEAN DEFAULT False,
//   ADD IF NOT EXISTS DaysPriorToLastOutMoveOnTurn INTEGER DEFAULT 0,
//   ADD IF NOT EXISTS IsPriorToLastOutFFMove BOOLEAN DEFAULT False,
//   ADD IF NOT EXISTS DaysPriorToLastOutFFMove INTEGER DEFAULT 0,
//
