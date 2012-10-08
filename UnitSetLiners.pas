unit UnitSetLiners;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure SetHHLiners
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblLiner: TDBISAMTable;
   tblLinerByTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

procedure SetLiners
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblLiner: TDBISAMTable;
   tblLinerByTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;

procedure SetLiners
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblLiner: TDBISAMTable;
   tblLinerByTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );
var
   bTripleDot: boolean;
   bFrontDoubleDot: boolean;
   bBackDoubleDot: boolean;

   bFrontDoubleLiner0: boolean;
   bFrontDoubleLiner1: boolean;
   bFrontDoubleLiner2: boolean;
   bFrontDoubleLiner3: boolean;

   bBackDoubleLiner0: boolean;
   bBackDoubleLiner1: boolean;
   bBackDoubleLiner2: boolean;
   bBackDoubleLiner3: boolean;

   bTripleLiner0: boolean;
   bTripleLiner1: boolean;
   bTripleLiner2: boolean;
   bTripleLiner3: boolean;

   iLinerStartsByTrkAll: integer;
   iLinerWinsByTrkAll: integer;
   fLinerWinPctByTrkAll: double;
   fLinerValueBetByTrkAll: double;
   fLinerAvgOddsByTrkAll: double;
   fLinerMinOddsByTrkAll: double;
   fLinerMaxOddsByTrkAll: double;
   fLinerAvgWinOddsByTrkAll: double;
   fLinerMinWinOddsByTrkAll: double;
   fLinerMaxWinOddsByTrkAll: double;
   fLinerIVByTrkAll: double;
   fLinerIVRoiByTrkAll: double;

   iLinerStartsByTrk0To3: integer;
   iLinerWinsByTrk0To3: integer;
   fLinerWinPctByTrk0To3: double;
   fLinerValueBetByTrk0To3: double;
   fLinerAvgOddsByTrk0To3: double;
   fLinerMinOddsByTrk0To3: double;
   fLinerMaxOddsByTrk0To3: double;
   fLinerAvgWinOddsByTrk0To3: double;
   fLinerMinWinOddsByTrk0To3: double;
   fLinerMaxWinOddsByTrk0To3: double;
   fLinerIVByTrk0To3: double;
   fLinerIVRoiByTrk0To3: double;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   sLinerKeyByTrk0To3: string;
   sLinerKeyByTrkAll: string;

   iPostPos: integer;
   sSurface: string;
   sRaceType: string;

   bTurfToDirt: boolean;
   bDirtToTurf: boolean;
   bRteToSpr: boolean;
   bSprToRte: boolean;

   bKSP: boolean;
   bQSP: boolean;

   iRouteStarts: integer;
   iSprintStarts: integer;

   iDaysLast: integer;

   iLastSpeedRank: integer;
   iBackSpeedRank: integer;
   iPastSpeedRank: integer;
   iBackPace1Rank: integer;
   iBackPace2Rank: integer;

   fDistanceInFurlongs: double;

   iStaCnt: integer;
   iTotalCnt: integer;

begin

   hLog.AddToLog('Set Liners', msevOperation);
   try
      try
         OpenTable(tblR);
         OpenTable(tblE);
         OpenTable(tblLiner);
         OpenTable(tblLinerByTrk);

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();


            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Setting Liners - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
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

               //Put these here again so we can plug those values to history files also
               tblE.Edit();

               bFrontDoubleDot := False;
               bBackDoubleDot := False;
               bTripleDot := False;

               bFrontDoubleLiner0 := False;
               bFrontDoubleLiner1 := False;
               bFrontDoubleLiner2 := False;
               bFrontDoubleLiner3 := False;

               bBackDoubleLiner0 := False;
               bBackDoubleLiner1 := False;
               bBackDoubleLiner2 := False;
               bBackDoubleLiner3 := False;

               bTripleLiner0 := False;
               bTripleLiner1 := False;
               bTripleLiner2 := False;
               bTripleLiner3 := False;

               iLinerStartsByTrkAll := 0;
               iLinerWinsByTrkAll := 0;
               fLinerWinPctByTrkAll := 0;
               fLinerValueBetByTrkAll := 0;
               fLinerAvgOddsByTrkAll := 0;
               fLinerMinOddsByTrkAll := 0;
               fLinerMaxOddsByTrkAll := 0;
               fLinerAvgWinOddsByTrkAll := 0;
               fLinerMinWinOddsByTrkAll := 0;
               fLinerMaxWinOddsByTrkAll := 0;
               fLinerIVByTrkAll := 0;
               fLinerIVRoiByTrkAll := 0;

               iLinerStartsByTrk0To3 := 0;
               iLinerWinsByTrk0To3 := 0;
               fLinerWinPctByTrk0To3 := 0;
               fLinerValueBetByTrk0To3 := 0;
               fLinerAvgOddsByTrk0To3 := 0;
               fLinerMinOddsByTrk0To3 := 0;
               fLinerMaxOddsByTrk0To3 := 0;
               fLinerAvgWinOddsByTrk0To3 := 0;
               fLinerMinWinOddsByTrk0To3 := 0;
               fLinerMaxWinOddsByTrk0To3 := 0;
               fLinerIVByTrk0To3 := 0;
               fLinerIVRoiByTrk0To3 := 0;

               iPostPos := 0;
               sSurface := '';

               iRouteStarts := 0;
               iSprintStarts := 0;
               fDistanceInFurlongs := 0;

               sSurface := tblR.FieldByName('Surface').AsString;
               sRaceType := tblR.FieldByName('RaceType').AsString;
               fDistanceInFurlongs := tblR.FieldByName('DistanceInFurlongs').AsFloat;

               iPostPos := tblE.FieldByName('PostPos').AsInteger;

               iRouteStarts := tblE.FieldByName('RouteStarts').AsInteger;
               iSprintStarts := tblE.FieldByName('SprintStarts').AsInteger;

               bTurfToDirt := tblE.FieldByName('IsTurfToDirt').AsBoolean;
               bDirtToTurf := tblE.FieldByName('IsDirtToTurf').AsBoolean;

               bSprToRte := tblE.FieldByName('IsSprToRte').AsBoolean;
               bRteToSpr := tblE.FieldByName('IsRteToSpr').AsBoolean;

               iDaysLast := tblE.FieldByName('DaysLast').AsInteger;

               fEarlyPace := tblE.FieldByName('EarlyPace').AsFloat;
               fMiddlePace := tblE.FieldByName('MiddlePace').AsFloat;
               fLatePace := tblE.FieldByName('LatePace').AsFloat;

               iEarlyPaceRank := tblE.FieldByName('EarlyPaceRank').AsInteger;
               iMiddlePaceRank := tblE.FieldByName('MiddlePaceRank').AsInteger;
               iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

               iEarlyPacePosRank := tblE.FieldByName('EarlyPacePosRank').AsInteger;
               iMiddlePacePosRank := tblE.FieldByName('MiddlePacePosRank').AsInteger;
               iLatePacePosRank := tblE.FieldByName('LatePacePosRank').AsInteger;

               iLastSpeedRank := tblE.FieldByName('LastSpeedRank').AsInteger;
               iBackSpeedRank := tblE.FieldByName('BackSpeedRank').AsInteger;

               //
               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bFrontDoubleDot := True;
               end;

               if (tblE.FieldByName('LatePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('LatePacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bBackDoubleDot := True;
               end;

               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('LatePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('LatePacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bTripleDot := True;
               end;

               bKSP := False;
               if (tblE.FieldByName('EarlyPace').AsFloat > 0) and
                  (tblE.FieldByName('MiddlePace').AsFloat > 0) and
                  (tblE.FieldByName('LatePace').AsFloat > 0) and
                  (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                  (tblE.FieldByName('LatePace').AsFloat < 9999) then begin
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1)) then begin
                     if ((tblE.FieldByName('KSP1stCallRank').AsInteger = 1) and
                        (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
                        bKSP := True;
                     end;
                  end;
               end;

               bQSP := False;
               if (tblE.FieldByName('EarlyPace').AsFloat > 0) and
                  (tblE.FieldByName('MiddlePace').AsFloat > 0) and
                  (tblE.FieldByName('LatePace').AsFloat > 0) and
                  (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                  (tblE.FieldByName('LatePace').AsFloat < 9999) then begin
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1)) then begin
                     if ((tblE.FieldByName('QSP1stCallRank').AsInteger = 1) and
                        (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1)) then begin
                        bQSP := True;
                     end;
                  end;
               end;

               sLinerKeyByTrk0To3 := '';
               sLinerKeyByTrkAll := '';
               if (tblE.FieldByName('EarlyPace').AsFloat > 0) and
                  (tblE.FieldByName('MiddlePace').AsFloat > 0) and
                  (tblE.FieldByName('LatePace').AsFloat > 0) and
                  (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                  (tblE.FieldByName('LatePace').AsFloat < 9999) then begin

                  // Front Double liner 0 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     //  X  X  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner0 := True;
                     end;
                  end;

                  // Front Double liner 1 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                  end;

                  // Front Double liner 2 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;
                  end;

                  // Front Double liner 3 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     //  *  *  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner3 := True;
                     end;
                  end;


                  // Back Double liner 0 dots
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     //  X  X  X
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
                        bBackDoubleLiner0 := True;
                     end;
                  end;

                  // Back Double liner 1 dot
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                  end;

                  // Back Double liner 2 dot
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bBackDoubleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner2 := True;
                     end;
                  end;

                  // Back Double liner 3 dots
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner3 := True;
                     end;
                  end;

                  // Triple liner 0 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
                        bTripleLiner0 := True;
                     end;
                  end;

                  // Triple liner 1 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bTripleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bTripleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bTripleLiner1 := True;
                     end;
                  end;

                  // Triple liner 2 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bTripleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner2 := True;
                     end;
                  end;

                  // Triple liner 3 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     //  *  *  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner3 := True;
                     end;
                  end;

                  //
                  if sSurface = 'D' then begin
                     if bFrontDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_0;
                        sLinerKeyByTrkAll := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_1;
                        sLinerKeyByTrkAll := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_2;
                        sLinerKeyByTrkAll := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_3;
                        sLinerKeyByTrkAll := DF_FDL_A;
                     end;

                     //
                     if bBackDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_0;
                        sLinerKeyByTrkAll := DF_BDL_A;
                     end;

                     if bBackDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_1;
                        sLinerKeyByTrkAll := DF_BDL_A;
                     end;

                     if bBackDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_2;
                        sLinerKeyByTrkAll := DF_BDL_A;
                     end;

                     if bBackDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_3;
                        sLinerKeyByTrkAll := DF_BDL_A;
                     end;

                     //
                     if bTripleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_TL_0;
                        sLinerKeyByTrkAll := DF_TL_A;
                     end;

                     if bTripleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_TL_1;
                        sLinerKeyByTrkAll := DF_TL_A;
                     end;

                     if bTripleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_TL_2;
                        sLinerKeyByTrkAll := DF_TL_A;
                     end;

                     if bTripleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_TL_3;
                        sLinerKeyByTrkAll := DF_TL_A;
                     end;
                  end else begin
                     if bFrontDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_FDL_0;
                        sLinerKeyByTrkAll := T_FDL_A;
                     end;

                     if bFrontDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_FDL_1;
                        sLinerKeyByTrkAll := T_FDL_A;
                     end;

                     if bFrontDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_FDL_2;
                        sLinerKeyByTrkAll := T_FDL_A;
                     end;

                     if bFrontDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_FDL_3;
                        sLinerKeyByTrkAll := T_FDL_A;
                     end;

                     //
                     if bBackDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_BDL_0;
                        sLinerKeyByTrkAll := T_BDL_A;
                     end;

                     if bBackDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_BDL_1;
                        sLinerKeyByTrkAll := T_BDL_A;
                     end;

                     if bBackDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_BDL_2;
                        sLinerKeyByTrkAll := T_BDL_A;
                     end;

                     if bBackDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_BDL_3;
                        sLinerKeyByTrkAll := T_BDL_A;
                     end;

                     //
                     if bTripleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_TL_0;
                        sLinerKeyByTrkAll := T_TL_A;
                     end;

                     if bTripleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_TL_1;
                        sLinerKeyByTrkAll := T_TL_A;
                     end;

                     if bTripleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_TL_2;
                        sLinerKeyByTrkAll := T_TL_A;
                     end;

                     if bTripleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_TL_3;
                        sLinerKeyByTrkAll := T_TL_A;
                     end;
                  end;
               end;

               iLinerStartsByTrkAll := 0;
               iLinerWinsByTrkAll := 0;
               fLinerWinPctByTrkAll := 0;
               fLinerValueBetByTrkAll := 0;
               fLinerAvgOddsByTrkAll := 0;
               fLinerMinOddsByTrkAll := 0;
               fLinerMaxOddsByTrkAll := 0;
               fLinerAvgWinOddsByTrkAll := 0;
               fLinerMinWinOddsByTrkAll := 0;
               fLinerMaxWinOddsByTrkAll := 0;
               fLinerIVByTrkAll := 0;
               fLinerIVRoiByTrkAll := 0;

               iLinerStartsByTrk0To3 := 0;
               iLinerWinsByTrk0To3 := 0;
               fLinerWinPctByTrk0To3 := 0;
               fLinerValueBetByTrk0To3 := 0;
               fLinerAvgOddsByTrk0To3 := 0;
               fLinerMinOddsByTrk0To3 := 0;
               fLinerMaxOddsByTrk0To3 := 0;
               fLinerAvgWinOddsByTrk0To3 := 0;
               fLinerMinWinOddsByTrk0To3 := 0;
               fLinerMaxWinOddsByTrk0To3 := 0;
               fLinerIVByTrk0To3 := 0;
               fLinerIVRoiByTrk0To3 := 0;

               if ((bFrontDoubleLiner0) or (bFrontDoubleLiner1) or (bFrontDoubleLiner2) or (bFrontDoubleLiner3) or
                  (bBackDoubleLiner0) or (bBackDoubleLiner1) or (bBackDoubleLiner2) or (bBackDoubleLiner3) or
                  (bTripleLiner0) or (bTripleLiner1) or (bTripleLiner2) or (bTripleLiner3)) then begin

                  // Get what all liners do at track
                  if (sLinerKeyByTrkAll <> '') then begin
                     tblLinerByTrk.IndexName := '';
                     tblLinerByTrk.SetKey();
                     tblLinerByTrk.FieldByName('Rank').AsInteger := 1;
                     tblLinerByTrk.FieldByName('Name').AsString := sLinerKeyByTrkAll;
                     tblLinerByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                     if (tblLinerByTrk.GotoKey()) then begin
                        iLinerStartsByTrkAll := tblLinerByTrk.FieldByName('Starts').AsInteger;
                        iLinerWinsByTrkAll := tblLinerByTrk.FieldByName('FP1').AsInteger;
                        fLinerWinPctByTrkAll := tblLinerByTrk.FieldByName('WinPct').AsFloat;
                        fLinerValueBetByTrkAll := tblLinerByTrk.FieldByName('ValueBet').AsFloat;

                        fLinerAvgOddsByTrkAll := tblLinerByTrk.FieldByName('AvgOdds').AsFloat;
                        fLinerMinOddsByTrkAll := tblLinerByTrk.FieldByName('MinOdds').AsFloat;
                        fLinerMaxOddsByTrkAll := tblLinerByTrk.FieldByName('MaxOdds').AsFloat;

                        fLinerAvgWinOddsByTrkAll := tblLinerByTrk.FieldByName('AvgWinOdds').AsFloat;
                        fLinerMinWinOddsByTrkAll := tblLinerByTrk.FieldByName('MinWinOdds').AsFloat;
                        fLinerMaxWinOddsByTrkAll := tblLinerByTrk.FieldByName('MaxWinOdds').AsFloat;

                        fLinerIVByTrkAll := tblLinerByTrk.FieldByName('IV').AsFloat;
                        fLinerIVRoiByTrkAll := tblLinerByTrk.FieldByName('IVRoi').AsFloat;
                     end;
                  end;

                  // Get what just that liner does at track
                  if (sLinerKeyByTrk0To3 <> '') then begin
                     tblLinerByTrk.IndexName := '';
                     tblLinerByTrk.SetKey();
                     tblLinerByTrk.FieldByName('Rank').AsInteger := 1;
                     tblLinerByTrk.FieldByName('Name').AsString := sLinerKeyByTrk0To3;
                     tblLinerByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                     if (tblLinerByTrk.GotoKey()) then begin

                        iLinerStartsByTrk0To3 := tblLinerByTrk.FieldByName('Starts').AsInteger;
                        iLinerWinsByTrk0To3 := tblLinerByTrk.FieldByName('FP1').AsInteger;
                        fLinerWinPctByTrk0To3 := tblLinerByTrk.FieldByName('WinPct').AsFloat;
                        fLinerValueBetByTrk0To3 := tblLinerByTrk.FieldByName('ValueBet').AsFloat;

                        fLinerAvgOddsByTrk0To3 := tblLinerByTrk.FieldByName('AvgOdds').AsFloat;
                        fLinerMinOddsByTrk0To3 := tblLinerByTrk.FieldByName('MinOdds').AsFloat;
                        fLinerMaxOddsByTrk0To3 := tblLinerByTrk.FieldByName('MaxOdds').AsFloat;

                        fLinerAvgWinOddsByTrk0To3 := tblLinerByTrk.FieldByName('AvgWinOdds').AsFloat;
                        fLinerMinWinOddsByTrk0To3 := tblLinerByTrk.FieldByName('MinWinOdds').AsFloat;
                        fLinerMaxWinOddsByTrk0To3 := tblLinerByTrk.FieldByName('MaxWinOdds').AsFloat;

                        fLinerIVByTrk0To3 := tblLinerByTrk.FieldByName('IV').AsFloat;
                        fLinerIVRoiByTrk0To3 := tblLinerByTrk.FieldByName('IVRoi').AsFloat;
                     end;
                  end;
               end;

               if ((bBackDoubleLiner0) or (bBackDoubleLiner1) or (bBackDoubleLiner2) or (bBackDoubleLiner3)) then begin
                  tblE.FieldByName('IsBackDoubleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsBackDoubleLiner').AsBoolean := False;
               end;

               if ((bFrontDoubleLiner1) or (bFrontDoubleLiner2) or (bFrontDoubleLiner3)) then begin
                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := False;
               end;

         //      if ((bKSP) and (bFrontDoubleLiner0)) then begin
//                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := True;
//               end;
//
//               if ((bQSP) and (bFrontDoubleLiner0)) then begin
//                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := True;
//               end;

               if ((bTripleLiner0) or (bTripleLiner1) or (bTripleLiner2) or (bTripleLiner3)) then begin
                  tblE.FieldByName('IsTripleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsTripleLiner').AsBoolean := False;
               end;

               tblE.FieldByName('IsTripleDot').AsBoolean := bTripleDot;
               tblE.FieldByName('IsBackDoubleDot').AsBoolean := bBackDoubleDot;
               tblE.FieldByName('IsFrontDoubleDot').AsBoolean := bFrontDoubleDot;

               tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean := bFrontDoubleLiner0;
               tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean := bFrontDoubleLiner1;
               tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean := bFrontDoubleLiner2;
               tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean := bFrontDoubleLiner3;

               tblE.FieldByName('IsBackDoubleLiner0').AsBoolean := bBackDoubleLiner0;
               tblE.FieldByName('IsBackDoubleLiner1').AsBoolean := bBackDoubleLiner1;
               tblE.FieldByName('IsBackDoubleLiner2').AsBoolean := bBackDoubleLiner2;
               tblE.FieldByName('IsBackDoubleLiner3').AsBoolean := bBackDoubleLiner3;

               tblE.FieldByName('IsTripleLiner0').AsBoolean := bTripleLiner0;
               tblE.FieldByName('IsTripleLiner1').AsBoolean := bTripleLiner1;
               tblE.FieldByName('IsTripleLiner2').AsBoolean := bTripleLiner2;
               tblE.FieldByName('IsTripleLiner3').AsBoolean := bTripleLiner3;


               tblR.Edit();
               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopEarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat;
               end;
               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopMiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat;
               end;
               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopLatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat;
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondEarlyPace').AsFloat := tblE.FieldByName('EarlyPace').AsFloat;
               end;
               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondMiddlePace').AsFloat := tblE.FieldByName('MiddlePace').AsFloat;
               end;
               if (tblE.FieldByName('LatePaceRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondLatePace').AsFloat := tblE.FieldByName('LatePace').AsFloat;
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopEarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat;
               end;
               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopMiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat;
               end;
               if (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopLatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat;
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondEarlyPacePos').AsFloat := tblE.FieldByName('EarlyPacePos').AsFloat;
               end;
               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondMiddlePacePos').AsFloat := tblE.FieldByName('MiddlePacePos').AsFloat;
               end;
               if (tblE.FieldByName('LatePacePosRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondLatePacePos').AsFloat := tblE.FieldByName('LatePacePos').AsFloat;
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  tblR.FieldByName('TopPower').AsFloat := tblE.FieldByName('Power').AsFloat;
               end;
               if (tblE.FieldByName('PowerRank').AsInteger = 2) then begin
                  tblR.FieldByName('SecondTopPower').AsFloat := tblE.FieldByName('Power').AsFloat;
               end;
               if (tblE.FieldByName('PowerRank').AsInteger = 3) then begin
                  tblR.FieldByName('ThirdTopPower').AsFloat := tblE.FieldByName('Power').AsFloat;
               end;
               if (tblE.FieldByName('PowerRank').AsInteger = 4) then begin
                  tblR.FieldByName('FourthTopPower').AsFloat := tblE.FieldByName('Power').AsFloat;
               end;
               tblR.Post();

               tblE.Post();

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
      CloseTable(tblLiner);
      CloseTable(tblLinerByTrk);
      ClearPrgStatusBars();
   end;

end;

procedure SetHHLiners
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblLiner: TDBISAMTable;
   tblLinerByTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

var
   bTripleDot: boolean;
   bFrontDoubleDot: boolean;
   bBackDoubleDot: boolean;

   bFrontDoubleLiner0: boolean;
   bFrontDoubleLiner1: boolean;
   bFrontDoubleLiner2: boolean;
   bFrontDoubleLiner3: boolean;

   bBackDoubleLiner0: boolean;
   bBackDoubleLiner1: boolean;
   bBackDoubleLiner2: boolean;
   bBackDoubleLiner3: boolean;

   bTripleLiner0: boolean;
   bTripleLiner1: boolean;
   bTripleLiner2: boolean;
   bTripleLiner3: boolean;

   iLinerStarts: integer;
   iLinerWins: integer;
   fLinerWinPct: double;
   fLinerValueBet: double;
   iLinerStartsByTrk: integer;
   iLinerWinsByTrk: integer;
   fLinerWinPctByTrk: double;
   fLinerValueBetByTrk: double;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   sLinerKeyByTrk0To3: string;
   sLinerKey: string;

   iPostPos: integer;
   sSurface: string;
   sRaceType: string;

   bTurfToDirt: boolean;
   bDirtToTurf: boolean;
   bRteToSpr: boolean;
   bSprToRte: boolean;

   iRouteStarts: integer;
   iSprintStarts: integer;

   iDaysLast: integer;

   iLastSpeedRank: integer;
   iBackSpeedRank: integer;
   iPastSpeedRank: integer;
   iBackPace1Rank: integer;
   iBackPace2Rank: integer;

   fDistanceInFurlongs: double;

   iStaCnt: integer;
   iTotalCnt: integer;

begin

   hLog.AddToLog('Set HH Liners', msevOperation);
   try
      try
         OpenTable(tblR);
         OpenTable(tblE);
         OpenTable(tblLiner);
         OpenTable(tblLinerByTrk);

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();


            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Setting Liners - ' +
                  tblE.FieldByName('TrkCode').AsString + ' ' +
                  tblE.FieldByName('RaceDate').AsString + ' Race # ' +
                  tblE.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tblE.RecordCount);
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

               //Put these here again so we can plug those values to history files also
               tblE.Edit();

               bFrontDoubleDot := False;
               bBackDoubleDot := False;
               bTripleDot := False;

               bFrontDoubleLiner0 := False;
               bFrontDoubleLiner1 := False;
               bFrontDoubleLiner2 := False;
               bFrontDoubleLiner3 := False;

               bBackDoubleLiner0 := False;
               bBackDoubleLiner1 := False;
               bBackDoubleLiner2 := False;
               bBackDoubleLiner3 := False;

               bTripleLiner0 := False;
               bTripleLiner1 := False;
               bTripleLiner2 := False;
               bTripleLiner3 := False;

               iLinerStarts := 0;
               iLinerWins := 0;
               fLinerWinPct := 0;
               fLinerValueBet := 0;
               iLinerStartsByTrk := 0;
               iLinerWinsByTrk := 0;
               fLinerWinPctByTrk := 0;
               fLinerValueBetByTrk := 0;

               iPostPos := 0;

               sSurface := '';

               iRouteStarts := 0;
               iSprintStarts := 0;


               fDistanceInFurlongs := 0;

               sSurface := tblR.FieldByName('Surface').AsString;
               sRaceType := tblR.FieldByName('RaceType').AsString;
               fDistanceInFurlongs := tblR.FieldByName('DistanceInFurlongs').AsFloat;


               iPostPos := tblE.FieldByName('PostPos').AsInteger;

               iRouteStarts := tblE.FieldByName('RouteStarts').AsInteger;
               iSprintStarts := tblE.FieldByName('SprintStarts').AsInteger;

               bTurfToDirt := tblE.FieldByName('IsTurfToDirt').AsBoolean;
               bDirtToTurf := tblE.FieldByName('IsDirtToTurf').AsBoolean;

               bSprToRte := tblE.FieldByName('IsSprToRte').AsBoolean;
               bRteToSpr := tblE.FieldByName('IsRteToSpr').AsBoolean;

               iDaysLast := tblE.FieldByName('DaysLast').AsInteger;

               fEarlyPace := tblE.FieldByName('EarlyPace').AsFloat;
               fMiddlePace := tblE.FieldByName('MiddlePace').AsFloat;
               fLatePace := tblE.FieldByName('LatePace').AsFloat;

               iEarlyPaceRank := tblE.FieldByName('EarlyPaceRank').AsInteger;
               iMiddlePaceRank := tblE.FieldByName('MiddlePaceRank').AsInteger;
               iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

               iEarlyPacePosRank := tblE.FieldByName('EarlyPacePosRank').AsInteger;
               iMiddlePacePosRank := tblE.FieldByName('MiddlePacePosRank').AsInteger;
               iLatePacePosRank := tblE.FieldByName('LatePacePosRank').AsInteger;

               iLastSpeedRank := tblE.FieldByName('LastSpeedRank').AsInteger;
               iBackSpeedRank := tblE.FieldByName('BackSpeedRank').AsInteger;
               iPastSpeedRank := tblE.FieldByName('PastSpeedRank').AsInteger;
               iBackPace1Rank := tblE.FieldByName('BackPace1Rank').AsInteger;
               iBackPace2Rank := tblE.FieldByName('BackPace2Rank').AsInteger;

               //
               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bFrontDoubleDot := True;
               end;

               if (tblE.FieldByName('LatePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('LatePacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bBackDoubleDot := True;
               end;

               if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('LatePacePos').AsFloat < 9999) and
                  (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('LatePacePosRank').AsInteger = 1) and
                  (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  bTripleDot := True;
               end;

               sLinerKeyByTrk0To3 := '';
               sLinerKey := '';
               if (tblE.FieldByName('EarlyPace').AsFloat > 0) and
                  (tblE.FieldByName('MiddlePace').AsFloat > 0) and
                  (tblE.FieldByName('LatePace').AsFloat > 0) and
                  (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
                  (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
                  (tblE.FieldByName('LatePace').AsFloat < 9999) then begin

                  // Front Double liner 0 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     //  X  X  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner0 := True;
                     end;
                  end;

                  // Front Double liner 1 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bFrontDoubleLiner1 := True;
                     end;
                  end;

                  // Front Double liner 2 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner2 := True;
                     end;
                  end;

                  // Front Double liner 3 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank > 1)) then begin
                     //  *  *  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bFrontDoubleLiner3 := True;
                     end;
                  end;

                  // Back Double liner 0 dots
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     //  X  X  X
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
                        bBackDoubleLiner0 := True;
                     end;
                  end;

                  // Back Double liner 1 dot
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bBackDoubleLiner1 := True;
                     end;
                  end;

                  // Back Double liner 2 dot
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bBackDoubleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner2 := True;
                     end;
                  end;

                  // Back Double liner 3 dots
                  if ((iEarlyPaceRank > 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bBackDoubleLiner3 := True;
                     end;
                  end;

                  // Triple liner 0 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1) then begin
                        bTripleLiner0 := True;
                     end;
                  end;

                  // Triple liner 1 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  X  X
                     if ((iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank > 1)) then begin
                        bTripleLiner1 := True;
                     end;
                     // X  *  X
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1)) then begin
                        bTripleLiner1 := True;
                     end;
                     // X  X  *
                     if ((iEarlyPacePosRank > 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1)) then begin
                        bTripleLiner1 := True;
                     end;
                  end;

                  // Triple liner 2 dot
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     // *  *  X
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank > 1) then begin
                        bTripleLiner2 := True;
                     end;

                     // *  X  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank > 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner2 := True;
                     end;

                     // X  *  *
                     if (iEarlyPacePosRank > 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner2 := True;
                     end;
                  end;

                  // Triple liner 3 dots
                  if ((iEarlyPaceRank = 1) and (iMiddlePaceRank = 1) and (iLatePaceRank = 1)) then begin
                     //  *  *  *
                     if (iEarlyPacePosRank = 1) and (iMiddlePacePosRank = 1) and (iLatePacePosRank = 1) then begin
                        bTripleLiner3 := True;
                     end;
                  end;

                  //
                  if sSurface = 'D' then begin
                     if bFrontDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_0;
                        sLinerKey := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_1;
                        sLinerKey := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_2;
                        sLinerKey := DF_FDL_A;
                     end;

                     if bFrontDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_FDL_3;
                        sLinerKey := DF_FDL_A;
                     end;

                     //
                     if bBackDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_0;
                        sLinerKey := DF_BDL_A;
                     end;

                     if bBackDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_1;
                        sLinerKey := DF_BDL_A;
                     end;

                     if bBackDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_2;
                        sLinerKey := DF_BDL_A;
                     end;

                     if bBackDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_BDL_3;
                        sLinerKey := DF_BDL_A;
                     end;

                     //
                     if bTripleLiner0 then begin
                        sLinerKeyByTrk0To3 := DF_TL_0;
                        sLinerKey := DF_TL_A;
                     end;

                     if bTripleLiner1 then begin
                        sLinerKeyByTrk0To3 := DF_TL_1;
                        sLinerKey := DF_TL_A;
                     end;

                     if bTripleLiner2 then begin
                        sLinerKeyByTrk0To3 := DF_TL_2;
                        sLinerKey := DF_TL_A;
                     end;

                     if bTripleLiner3 then begin
                        sLinerKeyByTrk0To3 := DF_TL_3;
                        sLinerKey := DF_TL_A;
                     end;
                  end else begin
                     if bFrontDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_FDL_0;
                        sLinerKey := T_FDL_A;
                     end;

                     if bFrontDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_FDL_1;
                        sLinerKey := T_FDL_A;
                     end;

                     if bFrontDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_FDL_2;
                        sLinerKey := T_FDL_A;
                     end;

                     if bFrontDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_FDL_3;
                        sLinerKey := T_FDL_A;
                     end;

                     //
                     if bBackDoubleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_BDL_0;
                        sLinerKey := T_BDL_A;
                     end;

                     if bBackDoubleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_BDL_1;
                        sLinerKey := T_BDL_A;
                     end;

                     if bBackDoubleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_BDL_2;
                        sLinerKey := T_BDL_A;
                     end;

                     if bBackDoubleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_BDL_3;
                        sLinerKey := T_BDL_A;
                     end;

                     //
                     if bTripleLiner0 then begin
                        sLinerKeyByTrk0To3 := T_TL_0;
                        sLinerKey := T_TL_A;
                     end;

                     if bTripleLiner1 then begin
                        sLinerKeyByTrk0To3 := T_TL_1;
                        sLinerKey := T_TL_A;
                     end;

                     if bTripleLiner2 then begin
                        sLinerKeyByTrk0To3 := T_TL_2;
                        sLinerKey := T_TL_A;
                     end;

                     if bTripleLiner3 then begin
                        sLinerKeyByTrk0To3 := T_TL_3;
                        sLinerKey := T_TL_A;
                     end;
                  end;
               end;

               //Changed this to FrontDouble liner is all info to used in compare
               iLinerStarts := 0;
               iLinerWins := 0;
               fLinerWinPct := 0;
               fLinerValueBet := 0;

               iLinerStartsByTrk := 0;
               iLinerWinsByTrk := 0;
               fLinerWinPctByTrk := 0;
               fLinerValueBetByTrk := 0;

               if ((bFrontDoubleLiner0) or (bFrontDoubleLiner1) or (bFrontDoubleLiner2) or (bFrontDoubleLiner3) or
                  (bBackDoubleLiner0) or (bBackDoubleLiner1) or (bBackDoubleLiner2) or (bBackDoubleLiner3) or
                  (bTripleLiner0) or (bTripleLiner1) or (bTripleLiner2) or (bTripleLiner3)) then begin
                  if (sLinerKeyByTrk0To3 <> '') then begin
                     tblLiner.IndexName := '';
                     tblLiner.SetKey();
                     tblLiner.FieldByName('Rank').AsInteger := 1;
                     tblLiner.FieldByName('Name').AsString := sLinerKeyByTrk0To3;
                     if (tblLiner.GotoKey()) then begin
                        iLinerStarts := tblLiner.FieldByName('Starts').AsInteger;
                        iLinerWins := tblLiner.FieldByName('FP1').AsInteger;
                        fLinerWinPct := tblLiner.FieldByName('WinPct').AsFloat;
                        fLinerValueBet := tblLiner.FieldByName('ValueBet').AsFloat;
                     end;
                  end;

                  if (sLinerKeyByTrk0To3 <> '') then begin
                     tblLinerByTrk.IndexName := '';
                     tblLinerByTrk.SetKey();
                     tblLinerByTrk.FieldByName('Rank').AsInteger := 1;
                     tblLinerByTrk.FieldByName('Name').AsString := sLinerKey;
                     tblLinerByTrk.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
                     if (tblLinerByTrk.GotoKey()) then begin
                        iLinerStartsByTrk := tblLinerByTrk.FieldByName('Starts').AsInteger;
                        iLinerWinsByTrk := tblLinerByTrk.FieldByName('FP1').AsInteger;
                        fLinerWinPctByTrk := tblLinerByTrk.FieldByName('WinPct').AsFloat;
                        fLinerValueBetByTrk := tblLinerByTrk.FieldByName('ValueBet').AsFloat;
                     end;
                  end;
               end;

               if ((bBackDoubleLiner0) or (bBackDoubleLiner1) or (bBackDoubleLiner2) or (bBackDoubleLiner3)) then begin
                  tblE.FieldByName('IsBackDoubleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsBackDoubleLiner').AsBoolean := False;
               end;


               if ((bFrontDoubleLiner0) or (bFrontDoubleLiner1) or (bFrontDoubleLiner2) or (bFrontDoubleLiner3)) then begin
                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsFrontDoubleLiner').AsBoolean := False;
               end;


               if ((bTripleLiner0) or (bTripleLiner1) or (bTripleLiner2) or (bTripleLiner3)) then begin
                  tblE.FieldByName('IsTripleLiner').AsBoolean := True;
               end else begin
                  tblE.FieldByName('IsTripleLiner').AsBoolean := False;
               end;

               tblE.FieldByName('IsTripleDot').AsBoolean := bTripleDot;
               tblE.FieldByName('IsBackDoubleDot').AsBoolean := bBackDoubleDot;
               tblE.FieldByName('IsFrontDoubleDot').AsBoolean := bFrontDoubleDot;

               tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean := bFrontDoubleLiner0;
               tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean := bFrontDoubleLiner1;
               tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean := bFrontDoubleLiner2;
               tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean := bFrontDoubleLiner3;

               tblE.FieldByName('IsBackDoubleLiner0').AsBoolean := bBackDoubleLiner0;
               tblE.FieldByName('IsBackDoubleLiner1').AsBoolean := bBackDoubleLiner1;
               tblE.FieldByName('IsBackDoubleLiner2').AsBoolean := bBackDoubleLiner2;
               tblE.FieldByName('IsBackDoubleLiner3').AsBoolean := bBackDoubleLiner3;

               tblE.FieldByName('IsTripleLiner0').AsBoolean := bTripleLiner0;
               tblE.FieldByName('IsTripleLiner1').AsBoolean := bTripleLiner1;
               tblE.FieldByName('IsTripleLiner2').AsBoolean := bTripleLiner2;
               tblE.FieldByName('IsTripleLiner3').AsBoolean := bTripleLiner3;

               tblE.FieldByName('LinerStarts').AsInteger := iLinerStarts;
               tblE.FieldByName('LinerWins').AsInteger := iLinerWins;
               tblE.FieldByName('LinerWinPct').AsFloat := fLinerWinPct;
               tblE.FieldByName('LinerValueBet').AsFloat := fLinerValueBet;

               tblE.FieldByName('LinerStartsByTrk').AsInteger := iLinerStartsByTrk;
               tblE.FieldByName('LinerWinsByTrk').AsInteger := iLinerWinsByTrk;
               tblE.FieldByName('LinerWinPctByTrk').AsFloat := fLinerWinPctByTrk;
               tblE.FieldByName('LinerValueBetByTrk').AsFloat := fLinerValueBetByTrk;

               tblE.Post();

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
      CloseTable(tblLiner);
      CloseTable(tblLinerByTrk);
      ClearPrgStatusBars();
   end;

end;

end.
