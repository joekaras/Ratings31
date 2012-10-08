unit UnitUpdatePace;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdatePacePos
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblPP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

procedure UpdatePaceAdvantage
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

procedure UpdateTotalPaceAndPoints
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
   FormMain, UnitCommonCode, UnitSetRanking;

procedure UpdatePacePos
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

   fEarlyPacePosH: double;
   fMiddlePacePosH: double;
   fLatePacePosH: double;
   fEarlyPacePosO: double;
   fMiddlePacePosO: double;
   fLatePacePosO: double;
   fFinishPacePosH: double;

   aEarlyPacePosH: array of double;
   aMiddlePacePosH: array of double;
   aLatePacePosH: array of double;
   aEarlyPacePosO: array of double;
   aMiddlePacePosO: array of double;
   aLatePacePosO: array of double;
   aFinishPacePosH: array of double;

   fEarlyPaceH: double;
   fMiddlePaceH: double;
   fLatePaceH: double;

   fEarlyPaceO: double;
   fMiddlePaceO: double;
   fLatePaceO: double;

   aEarlyPaceH: array of double;
   aMiddlePaceH: array of double;
   aLatePaceH: array of double;

   iIdx: integer;

   iEarlyPacePosLines: integer;
   iMiddlePacePosLines: integer;
   iLatePacePosLines: integer;
   iFinishPacePosLines: integer;

   iEarlyPaceLines: integer;
   iMiddlePaceLines: integer;
   iLatePaceLines: integer;

   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;
   fFinishPacePos: double;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   sSavePPTrkCode: string;
   dtSavePPRaceDate: TDateTime;
   iSavePPHorseNbr: integer;
   iSavePPNbr: integer;


begin

   hLog.AddToLog('UpdatePacePos', msevOperation);
   try
      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblPP);

      iHorseNbr := 0;
      iSaveHorseNbr := 0;

      sTrkCode := '';
      sSaveTrkCode := '';

      dtRaceDate := 0;
      dtSaveRaceDate := 0;

      iEarlyPacePosLines := 0;
      iMiddlePacePosLines := 0;
      iLatePacePosLines := 0;
      iFinishPacePosLines := 0;

      iEarlyPaceLines := 0;
      iMiddlePaceLines := 0;
      iLatePaceLines := 0;

      InitPrgBar(tblPP.RecordCount);

      tblPP.First();
      while not tblPP.Eof do begin
         IncPrgBar();

         staBar.SimpleText := 'Updating Harmonic Mean - ' + tblPP.FieldByName('TrkCode').AsString;
         Application.ProcessMessages();

         iHorseNbr := tblPP.FieldByName('HorseNbr').AsInteger;
         sTrkCode := tblPP.FieldByName('TrkCode').AsString;
         dtRaceDate := tblPP.FieldByName('RaceDate').AsDateTime;

         tblE.IndexName := 'ByHorseNbr';
         tblE.SetKey();
         tblE.FieldByName('RangeRaceDate').AsDateTime := dtRaceDate;
         tblE.FieldByName('TrkCode').AsString := sTrkCode;
         tblE.FieldByName('RaceDate').AsDateTime := dtRaceDate;
         tblE.FieldByName('HorseNbr').AsInteger := iHorseNbr;

         if (tblE.GotoKey()) then begin
            tblPP.Edit();
            tblPP.FieldByName('HHRaceNbr').AsInteger := tblE.FieldByName('RaceNbr').AsInteger;
            tblPP.FieldByName('HHPostPos').AsInteger := tblE.FieldByName('PostPos').AsInteger;
            tblPP.Post();
         end;

         tblE.IndexName := '';

         if (iHorseNbr <> iSaveHorseNbr) then begin

            if (sSaveTrkCode <> '') and (iSaveHorseNbr <> 0) then begin

               if (iEarlyPacePosLines > 0) then begin
                  fEarlyPacePosH := RoundTo(HarmonicMean(aEarlyPacePosH), -2);
                  fEarlyPacePosO := RoundTo(Median(aEarlyPacePosH), -2);
               end else begin
                  fEarlyPacePosH := 9999;
                  fEarlyPacePosO := 9999;
               end;

               if (iMiddlePacePosLines > 0) then begin
                  fMiddlePacePosH := RoundTo(HarmonicMean(aMiddlePacePosH), -2);
                  fMiddlePacePosO := RoundTo(Median(aMiddlePacePosH), -2);
               end else begin
                  fMiddlePacePosH := 9999;
                  fMiddlePacePosO := 9999;
               end;

               if (iLatePacePosLines > 0) then begin
                  fLatePacePosH := RoundTo(HarmonicMean(aLatePacePosH), -2);
                  fLatePacePosO := RoundTo(Median(aLatePacePosH), -2);
               end else begin
                  fLatePacePosH := 9999;
                  fLatePacePosO := 9999;
               end;

               if (iFinishPacePosLines > 0) then begin
                  fFinishPacePosH := RoundTo(HarmonicMean(aFinishPacePosH), -2);
               end else begin
                  fFinishPacePosH := 9999;
               end;
               //
               if (iEarlyPaceLines > 0) then begin
                  fEarlyPaceH := RoundTo(HarmonicMean(aEarlyPaceH), -2);
                  fEarlyPaceO := RoundTo(Median(aEarlyPaceH), -2);
               end else begin
                  fEarlyPaceH := 0;
                  fEarlyPaceO := 0;
               end;

               if (iMiddlePaceLines > 0) then begin
                  fMiddlePaceH := RoundTo(HarmonicMean(aMiddlePaceH), -2);
                  fMiddlePaceO := RoundTo(Median(aMiddlePaceH), -2);
               end else begin
                  fMiddlePaceH := 0;
                  fMiddlePaceO := 0;
               end;

               if (iLatePaceLines > 0) then begin
                  fLatePaceH := RoundTo(HarmonicMean(aLatePaceH), -2);
                  fLatePaceO := RoundTo(Median(aLatePaceH), -2);
               end else begin
                  fLatePaceH := 0;
                  fLatePaceO := 0;
               end;

               if (iHorseNbr <> iSaveHorseNbr) or (sTrkCode <> sSaveTrkCode) then begin

                  tblE.IndexName := 'ByHorseNbr';
                  tblE.SetKey();
                  tblE.FieldByName('RangeRaceDate').AsDateTime := dtSaveRaceDate;
                  tblE.FieldByName('TrkCode').AsString := sSaveTrkCode;
                  tblE.FieldByName('RaceDate').AsDateTime := dtSaveRaceDate;
                  tblE.FieldByName('HorseNbr').AsInteger := iSaveHorseNbr;

                  if (tblE.GotoKey()) then begin
                     tblE.Edit();
                     tblE.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePosH;
                     tblE.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePosH;
                     tblE.FieldByName('LatePacePos').AsFloat := fLatePacePosH;
                     tblE.FieldByName('FinishPacePos').AsFloat := fFinishPacePosH;

                     tblE.FieldByName('EarlyPace').AsFloat := fEarlyPaceH;
                     tblE.FieldByName('MiddlePace').AsFloat := fMiddlePaceH;
                     tblE.FieldByName('LatePace').AsFloat := fLatePaceH;

                     sSavePPTrkCode := tblPP.FieldByName('TrkCode').AsString;
                     dtSavePPRaceDate := tblPP.FieldByName('RaceDate').AsDateTime;
                     iSavePPHorseNbr := tblPP.FieldByName('HorseNbr').AsInteger;
                     iSavePPNbr := tblPP.FieldByName('PPNbr').AsInteger;

                     tblPP.IndexName := '';
                     tblPP.SetKey();
                     tblPP.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
                     tblPP.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                     tblPP.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;
                     tblPP.FieldByName('PPNbr').Value := 1;
                     if (tblPP.GotoKey()) then begin
                        tblE.FieldByName('LastSpeed').AsInteger := tblPP.FieldByName('Speed').AsInteger;
                        tblE.FieldByName('LastClass').AsInteger := tblPP.FieldByName('Class').AsInteger;

                        tblE.FieldByName('LastFractionsLine').AsString := tblPP.FieldByName('FractionsLine').AsString;
                        tblE.FieldByName('LastRunningLine').AsString := tblPP.FieldByName('RunningLine').AsString;

                        tblE.FieldByName('LastPos1stCall').AsInteger := tblPP.FieldByName('Pos1stCall').AsInteger;
                        tblE.FieldByName('LastPos2ndCall').AsInteger := tblPP.FieldByName('Pos2ndCall').AsInteger;
                        tblE.FieldByName('LastPosStrCall').AsInteger := tblPP.FieldByName('PosStrCall').AsInteger;

                     end else begin
                        tblE.FieldByName('LastSpeed').AsInteger := 0;
                        tblE.FieldByName('LastClass').AsInteger := 0;

                        tblE.FieldByName('LastFractionsLine').AsString := '';
                        tblE.FieldByName('LastRunningLine').AsString := '';

                        tblE.FieldByName('LastPos1stCall').AsInteger := 0;
                        tblE.FieldByName('LastPos2ndCall').AsInteger := 0;
                        tblE.FieldByName('LastPosStrCall').AsInteger := 0;

                     end;

                     tblPP.IndexName := '';
                     tblPP.SetKey();
                     tblPP.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
                     tblPP.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                     tblPP.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;
                     tblPP.FieldByName('PPNbr').Value := 2;
                     if (tblPP.GotoKey()) then begin
                        tblE.FieldByName('Last2Speed').AsInteger := tblPP.FieldByName('Speed').AsInteger;
                        tblE.FieldByName('Last2Class').AsInteger := tblPP.FieldByName('Class').AsInteger;

                        tblE.FieldByName('Last2FractionsLine').AsString := tblPP.FieldByName('FractionsLine').AsString;
                        tblE.FieldByName('Last2RunningLine').AsString := tblPP.FieldByName('RunningLine').AsString;

                        tblE.FieldByName('Last2Pos1stCall').AsInteger := tblPP.FieldByName('Pos1stCall').AsInteger;
                        tblE.FieldByName('Last2Pos2ndCall').AsInteger := tblPP.FieldByName('Pos2ndCall').AsInteger;
                        tblE.FieldByName('Last2PosStrCall').AsInteger := tblPP.FieldByName('PosStrCall').AsInteger;
                     end else begin
                        tblE.FieldByName('Last2Speed').AsInteger := 0;
                        tblE.FieldByName('Last2Class').AsInteger := 0;

                        tblE.FieldByName('Last2FractionsLine').AsString := '';
                        tblE.FieldByName('Last2RunningLine').AsString := '';

                        tblE.FieldByName('Last2Pos1stCall').AsInteger := tblPP.FieldByName('Pos1stCall').AsInteger;
                        tblE.FieldByName('Last2Pos2ndCall').AsInteger := tblPP.FieldByName('Pos2ndCall').AsInteger;
                        tblE.FieldByName('Last2PosStrCall').AsInteger := tblPP.FieldByName('PosStrCall').AsInteger;

                     end;

                     tblPP.IndexName := '';
                     tblPP.SetKey();
                     tblPP.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
                     tblPP.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                     tblPP.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;
                     tblPP.FieldByName('PPNbr').Value := 3;
                     if (tblPP.GotoKey()) then begin
                        tblE.FieldByName('Last3Speed').AsInteger := tblPP.FieldByName('Speed').AsInteger;
                        tblE.FieldByName('Last3Class').AsInteger := tblPP.FieldByName('Class').AsInteger;

                        tblE.FieldByName('Last3FractionsLine').AsString := tblPP.FieldByName('FractionsLine').AsString;
                        tblE.FieldByName('Last3RunningLine').AsString := tblPP.FieldByName('RunningLine').AsString;

                        tblE.FieldByName('Last3Pos1stCall').AsInteger := tblPP.FieldByName('Pos1stCall').AsInteger;
                        tblE.FieldByName('Last3Pos2ndCall').AsInteger := tblPP.FieldByName('Pos2ndCall').AsInteger;
                        tblE.FieldByName('Last3PosStrCall').AsInteger := tblPP.FieldByName('PosStrCall').AsInteger;
                     end else begin
                        tblE.FieldByName('Last3Speed').AsInteger := 0;
                        tblE.FieldByName('Last3Class').AsInteger := 0;

                        tblE.FieldByName('Last3FractionsLine').AsString := '';
                        tblE.FieldByName('Last3RunningLine').AsString := '';

                        tblE.FieldByName('Last3Pos1stCall').AsInteger := tblPP.FieldByName('Pos1stCall').AsInteger;
                        tblE.FieldByName('Last3Pos2ndCall').AsInteger := tblPP.FieldByName('Pos2ndCall').AsInteger;
                        tblE.FieldByName('Last3PosStrCall').AsInteger := tblPP.FieldByName('PosStrCall').AsInteger;
                     end;
                     //
                     //                     tblPP.IndexName := 'ByBackSpeed';
                     //                     tblPP.SetKey();
                     //                     tblPP.FieldByName('HHTrkCode').Value := tblE.FieldByName('TrkCode').Value;
                     //                     tblPP.FieldByName('HHRaceDate').Value := tblE.FieldByName('RaceDate').Value;
                     //                     tblPP.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;
                     //                     tblPP.FieldByName('Speed').Value := 9999;
                     //                     tblPP.GotoNearest();
                     //                     if ((tblPP.FieldByName('HHTrkCode').Value = tblE.FieldByName('TrkCode').Value) and
                     //                        (tblPP.FieldByName('HHRaceDate').Value = tblE.FieldByName('RaceDate').Value) and
                     //                        (tblPP.FieldByName('HHRaceNbr').Value = tblE.FieldByName('RaceNbr').Value) and
                     //                        (tblPP.FieldByName('HHPostPos').Value = tblE.FieldByName('PostPos').Value)) then begin
                     //                        try
                     //                           tblE.FieldByName('BackSpeed').AsInteger := tblPP.FieldByName('Speed').AsInteger;
                     //                           // Final Adjustment
                     //                           if (tblE.FieldByName('LastSpeed').AsInteger > tblE.FieldByName('BackSpeed').AsInteger) then begin
                     //                              tblE.FieldByName('BackSpeed').AsInteger := tblE.FieldByName('LastSpeed').AsInteger;
                     //                           end;
                     //                        except
                     //                           on E: Exception do begin
                     //                              hLog.AddToLog(E.Message, msevException);
                     //                              tblE.FieldByName('BackSpeed').AsInteger := 0;
                     //                           end;
                     //                        end;
                     //                     end else begin
                     //                        tblE.FieldByName('BackSpeed').AsInteger := 0;
                     //                     end;
                     //
                     //                     tblPP.IndexName := 'ByBackClass';
                     //                     tblPP.SetKey();
                     //                     tblPP.FieldByName('HHTrkCode').Value := tblE.FieldByName('TrkCode').Value;
                     //                     tblPP.FieldByName('HHRaceDate').Value := tblE.FieldByName('RaceDate').Value;
                     //                     tblPP.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;
                     //                     tblPP.FieldByName('Class').Value := 9999;
                     //                     tblPP.GotoNearest();
                     //                     if ((tblPP.FieldByName('HHTrkCode').Value = tblE.FieldByName('TrkCode').Value) and
                     //                        (tblPP.FieldByName('HHRaceDate').Value = tblE.FieldByName('RaceDate').Value) and
                     //                        (tblPP.FieldByName('HHRaceNbr').Value = tblE.FieldByName('RaceNbr').Value) and
                     //                        (tblPP.FieldByName('HHPostPos').Value = tblE.FieldByName('PostPos').Value)) then begin
                     //                        try
                     //                           tblE.FieldByName('BackClass').AsInteger := tblPP.FieldByName('Class').AsInteger;
                     //                           // Final Adjustment
                     //                           if (tblE.FieldByName('LastClass').AsInteger > tblE.FieldByName('BackClass').AsInteger) then begin
                     //                              tblE.FieldByName('BackClass').AsInteger := tblE.FieldByName('LastClass').AsInteger;
                     //                           end;
                     //                        except
                     //                           on E: Exception do begin
                     //                              hLog.AddToLog(E.Message, msevException);
                     //                              tblE.FieldByName('BackClass').AsInteger := 0;
                     //                           end;
                     //                        end;
                     //                     end else begin
                     //                        tblE.FieldByName('BackClass').AsInteger := 0;
                     //                     end;


                     tblPP.IndexName := '';
                     tblPP.SetKey();
                     tblPP.FieldByName('TrkCode').AsString := sSavePPTrkCode;
                     tblPP.FieldByName('RaceDate').AsDateTime := dtSavePPRaceDate;
                     tblPP.FieldByName('HorseNbr').AsInteger := iSavePPHorseNbr;
                     tblPP.FieldByName('PPNbr').AsInteger := iSavePPNbr;
                     tblPP.GotoKey();

                     tblE.Post();
                  end;
               end;
            end;

            iSaveHorseNbr := iHorseNbr;
            sSaveTrkCode := sTrkCode;
            dtSaveRaceDate := dtRaceDate;

            iEarlyPacePosLines := 0;
            iMiddlePacePosLines := 0;
            iLatePacePosLines := 0;
            iFinishPacePosLines := 0;

            SetLength(aEarlyPacePosH, iEarlyPacePosLines);
            SetLength(aMiddlePacePosH, iMiddlePacePosLines);
            SetLength(aLatePacePosH, iLatePacePosLines);
            SetLength(aFinishPacePosH, iFinishPacePosLines);

            fEarlyPacePos := tblPP.FieldByName('Pos1stCall').AsFloat;
            if fEarlyPacePos > 0 then begin
               Inc(iEarlyPacePosLines);
               SetLength(aEarlyPacePosH, iEarlyPacePosLines);
               aEarlyPacePosH[iEarlyPacePosLines - 1] := fEarlyPacePos;
            end;

            fMiddlePacePos := tblPP.FieldByName('Pos2ndCall').AsFloat;
            if fMiddlePacePos > 0 then begin
               Inc(iMiddlePacePosLines);
               SetLength(aMiddlePacePosH, iMiddlePacePosLines);
               aMiddlePacePosH[iMiddlePacePosLines - 1] := fMiddlePacePos;
            end;

            fLatePacePos := tblPP.FieldByName('PosStrCall').AsFloat;
            if fLatePacePos > 0 then begin
               Inc(iLatePacePosLines);
               SetLength(aLatePacePosH, iLatePacePosLines);
               aLatePacePosH[iLatePacePosLines - 1] := fLatePacePos;
            end;

            fFinishPacePos := tblPP.FieldByName('PosFinCall').AsFloat;
            if fFinishPacePos > 0 then begin
               Inc(iFinishPacePosLines);
               SetLength(aFinishPacePosH, iFinishPacePosLines);
               aFinishPacePosH[iFinishPacePosLines - 1] := fFinishPacePos;
            end;

            //
            iEarlyPaceLines := 0;
            iMiddlePaceLines := 0;
            iLatePaceLines := 0;
            SetLength(aEarlyPaceH, iEarlyPaceLines);
            SetLength(aMiddlePaceH, iMiddlePaceLines);
            SetLength(aLatePaceH, iLatePaceLines);

            fEarlyPace := tblPP.FieldByName('EarlyPace').AsFloat;
            if fEarlyPace > 0 then begin
               Inc(iEarlyPaceLines);
               SetLength(aEarlyPaceH, iEarlyPaceLines);
               aEarlyPaceH[iEarlyPaceLines - 1] := fEarlyPace;
            end;

            fMiddlePace := tblPP.FieldByName('MiddlePace').AsFloat;
            if fMiddlePace > 0 then begin
               Inc(iMiddlePaceLines);
               SetLength(aMiddlePaceH, iMiddlePaceLines);
               aMiddlePaceH[iMiddlePaceLines - 1] := fMiddlePace;
            end;

            fLatePace := tblPP.FieldByName('LatePace').AsFloat;
            if fLatePace > 0 then begin
               Inc(iLatePaceLines);
               SetLength(aLatePaceH, iLatePaceLines);
               aLatePaceH[iLatePaceLines - 1] := fLatePace;
            end;

         end else begin

            fEarlyPacePos := tblPP.FieldByName('Pos1stCall').AsFloat;
            if fEarlyPacePos > 0 then begin
               Inc(iEarlyPacePosLines);
               SetLength(aEarlyPacePosH, iEarlyPacePosLines);
               aEarlyPacePosH[iEarlyPacePosLines - 1] := fEarlyPacePos;
            end;

            fMiddlePacePos := tblPP.FieldByName('Pos2ndCall').AsFloat;
            if fMiddlePacePos > 0 then begin
               Inc(iMiddlePacePosLines);
               SetLength(aMiddlePacePosH, iMiddlePacePosLines);
               aMiddlePacePosH[iMiddlePacePosLines - 1] := fMiddlePacePos;
            end;

            fLatePacePos := tblPP.FieldByName('PosStrCall').AsFloat;
            if fLatePacePos > 0 then begin
               Inc(iLatePacePosLines);
               SetLength(aLatePacePosH, iLatePacePosLines);
               aLatePacePosH[iLatePacePosLines - 1] := fLatePacePos;
            end;

            fFinishPacePos := tblPP.FieldByName('PosFinCall').AsFloat;
            if fFinishPacePos > 0 then begin
               Inc(iFinishPacePosLines);
               SetLength(aFinishPacePosH, iFinishPacePosLines);
               aFinishPacePosH[iFinishPacePosLines - 1] := fFinishPacePos;
            end;

            //
            fEarlyPace := tblPP.FieldByName('EarlyPace').AsFloat;
            if fEarlyPace > 0 then begin
               Inc(iEarlyPaceLines);
               SetLength(aEarlyPaceH, iEarlyPaceLines);
               aEarlyPaceH[iEarlyPaceLines - 1] := fEarlyPace;
            end;

            fMiddlePace := tblPP.FieldByName('MiddlePace').AsFloat;
            if fMiddlePace > 0 then begin
               Inc(iMiddlePaceLines);
               SetLength(aMiddlePaceH, iMiddlePaceLines);
               aMiddlePaceH[iMiddlePaceLines - 1] := fMiddlePace;
            end;

            fLatePace := tblPP.FieldByName('LatePace').AsFloat;
            if fLatePace > 0 then begin
               Inc(iLatePaceLines);
               SetLength(aLatePaceH, iLatePaceLines);
               aLatePaceH[iLatePaceLines - 1] := fLatePace;
            end;

         end;

         tblPP.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);

         tblE.IndexName := '';
         CloseTable(tblR);
         CloseTable(tblE);
         CloseTable(tblPP);
         ClearPrgStatusBars();
      end;
   end;

   tblE.IndexName := '';
   CloseTable(tblR);
   CloseTable(tblE);
   CloseTable(tblPP);
   ClearPrgStatusBars();

end;


procedure UpdatePaceAdvantage
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   fTopEarlyPace: double;
   fTopMiddlePace: double;
   fTopLatePace: double;
   fTopEarlyPacePos: double;
   fTopMiddlePacePos: double;
   fTopLatePacePos: double;
   fTopPower: double;

   fSecondEarlyPace: double;
   fSecondMiddlePace: double;
   fSecondLatePace: double;
   fSecondEarlyPacePos: double;
   fSecondMiddlePacePos: double;
   fSecondLatePacePos: double;
   fSecondTopPower: double;

   fEarlyPaceAdvantage: double;
   fMiddlePaceAdvantage: double;
   fLatePaceAdvantage: double;

   fPowerAdvantage: double;

   iStaCnt: integer;
   iTotalCnt: integer;

begin
   hLog.AddToLog('UpdatePaceAdvantage', msevOperation);
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
               staBar.SimpleText := 'Updating Pace Advantage - ' +
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

            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               fTopEarlyPace := tblR.FieldByName('TopEarlyPace').AsFloat;
               fTopMiddlePace := tblR.FieldByName('TopMiddlePace').AsFloat;
               fTopLatePace := tblR.FieldByName('TopLatePace').AsFloat;
               fTopPower := tblR.FieldByName('TopPower').AsFloat;

               fSecondEarlyPace := tblR.FieldByName('SecondEarlyPace').AsFloat;
               fSecondMiddlePace := tblR.FieldByName('SecondMiddlePace').AsFloat;
               fSecondLatePace := tblR.FieldByName('SecondLatePace').AsFloat;
               fSecondTopPower := tblR.FieldByName('SecondTopPower').AsFloat;
            end else begin
               fTopEarlyPace := 0;
               fTopMiddlePace := 0;
               fTopLatePace := 0;
               fTopPower := 0;

               fSecondEarlyPace := 0;
               fSecondMiddlePace := 0;
               fSecondLatePace := 0;
               fSecondTopPower := 0;
            end;

            //
            if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
               if (fSecondEarlyPace > 0) then begin
                  tblE.FieldByName('EarlyPaceAdvantage').AsFloat := fTopEarlyPace - fSecondEarlyPace;
               end else begin
                  tblE.FieldByName('EarlyPaceAdvantage').AsFloat := 0;
               end;
            end else begin
               tblE.FieldByName('EarlyPaceAdvantage').AsFloat := tblE.FieldByName('EarlyPace').AsFloat - tblR.FieldByName('TopEarlyPace').AsFloat;
            end;

            //
            if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
               if (fSecondMiddlePace > 0) then begin
                  tblE.FieldByName('MiddlePaceAdvantage').AsFloat := fTopMiddlePace - fSecondMiddlePace;
               end else begin
                  tblE.FieldByName('MiddlePaceAdvantage').AsFloat := 0;
               end;
            end else begin
               tblE.FieldByName('MiddlePaceAdvantage').AsFloat := tblE.FieldByName('MiddlePace').AsFloat - tblR.FieldByName('TopMiddlePace').AsFloat;
            end;

            //
            if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
               if (fSecondLatePace > 0) then begin
                  tblE.FieldByName('LatePaceAdvantage').AsFloat := fTopLatePace - fSecondLatePace;
               end else begin
                  tblE.FieldByName('LatePaceAdvantage').AsFloat := 0;
               end;
            end else begin
               tblE.FieldByName('LatePaceAdvantage').AsFloat := tblE.FieldByName('LatePace').AsFloat - tblR.FieldByName('TopLatePace').AsFloat;
            end;

            //
            if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
               if (fSecondTopPower > 0) then begin
                  tblE.FieldByName('PowerAdvantage').AsFloat := fTopPower - fSecondTopPower;
               end else begin
                  tblE.FieldByName('PowerAdvantage').AsFloat := 0;
               end;
            end else begin
               tblE.FieldByName('PowerAdvantage').AsFloat := tblE.FieldByName('Power').AsFloat - tblR.FieldByName('TopPower').AsFloat;
            end;

            if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
               tblE.FieldByName('EarlyPaceAdvantage').AsFloat := 0;
               tblE.FieldByName('MiddlePaceAdvantage').AsFloat := 0;
               tblE.FieldByName('LatePaceAdvantage').AsFloat := 0;
            end;

            if (tblE.FieldByName('EarlyPace').AsFloat = 0) then begin
               tblE.FieldByName('EarlyPaceAdvantage').AsFloat := 0;
            end;

            if (tblE.FieldByName('MiddlePace').AsFloat = 0) then begin
               tblE.FieldByName('MiddlePaceAdvantage').AsFloat := 0;
            end;

            if (tblE.FieldByName('LatePace').AsFloat = 0) then begin
               tblE.FieldByName('LatePaceAdvantage').AsFloat := 0;
            end;

            if (tblE.FieldByName('Power').AsFloat = 0) then begin
               tblE.FieldByName('PowerAdvantage').AsFloat := 0;
            end;

            tblE.FieldByName('PowerAdvantageKey').AsInteger :=
               tblE.FieldByName('PowerAdvantage').AsInteger;

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

procedure UpdateTotalPaceAndPoints
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var

   iStaCnt: integer;
   iTotalCnt: integer;
   iTotalPace: integer;
   iTotalConnections: integer;
   iTotalSpdCls: integer;
   iTotalPedigree: integer;

   iOwnWinsRank: integer;
   iOwnEarningsRank: integer;

begin
   hLog.AddToLog('UpdateTotalPaceAndPoints', msevOperation);
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
               staBar.SimpleText := 'Updating Pace Advantage - ' +
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
               tblE.Edit();

               iTotalPace := 0;
               iTotalConnections := 0;
               iTotalSpdCls := 0;
               iTotalPedigree := 0;

               //   tblE.FieldByName('TotalPace').AsInteger := 0;
               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  Inc(iTotalPace);
                  if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                     Inc(iTotalPace);
                  end;
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  Inc(iTotalPace);
                  if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                     Inc(iTotalPace);
                  end;
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  Inc(iTotalPace);
                  if (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                     Inc(iTotalPace);
                  end;
               end;


               if (tblE.FieldByName('QSP1stCallRank').AsInteger = 1) then begin
                  if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
                     Inc(iTotalPace);
                  end;
               end;

               if (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1) then begin
                  if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
                     Inc(iTotalPace);
                  end;
               end;

               //
               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  Inc(iTotalSpdCls);
               end;
               if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                  Inc(iTotalSpdCls);
               end;
               if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                  Inc(iTotalSpdCls);
               end;
               if (tblE.FieldByName('LastClassRank').AsInteger = 1) then begin
                  Inc(iTotalSpdCls);
               end;
               if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                  Inc(iTotalSpdCls);
               end;

               if ((tblE.FieldByName('TrnWinsRank').AsInteger >= 1) and (tblE.FieldByName('TrnWinsRank').AsInteger <= 50) or
                  (tblE.FieldByName('TrnTrackRank').AsInteger >= 1) and (tblE.FieldByName('TrnTrackRank').AsInteger <= 10) or
                  (tblE.FieldByName('TrnEarningsRank').AsInteger >= 1) and (tblE.FieldByName('TrnEarningsRank').AsInteger <= 50)) then begin
                  Inc(iTotalConnections);
               end;

               if ((tblE.FieldByName('JkyWinsRank').AsInteger >= 1) and (tblE.FieldByName('JkyWinsRank').AsInteger <= 50) or
                  (tblE.FieldByName('JkyTrackRank').AsInteger >= 1) and (tblE.FieldByName('JkyTrackRank').AsInteger <= 5) or
                  (tblE.FieldByName('JkyEarningsRank').AsInteger >= 1) and (tblE.FieldByName('JkyEarningsRank').AsInteger <= 50)) then begin
                  Inc(iTotalConnections);
               end;

               iOwnWinsRank := tblE.FieldByName('OwnWinsRank').AsInteger;
               iOwnEarningsRank := tblE.FieldByName('OwnEarningsRank').AsInteger;


               if ((iOwnWinsRank > 0) and (iOwnWinsRank <> 9999)) or ((iOwnEarningsRank > 0) and (iOwnEarningsRank <> 9999)) then begin
                  Inc(iTotalConnections);
               end;

               if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                  (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin

                  if (tblE.FieldByName('ClassRating').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('SireAllWinPctRank').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;

                  if (tblE.FieldByName('SireGeneralThisYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('SireGeneralLastYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;

                  if (Trim(tblE.FieldByName('DebutIndicator').AsString) <> '') then begin
                     if ((tblE.FieldByName('SireDebutWinPctRank').AsInteger = 1) and
                        (tblE.FieldByName('SireDebutWinPct').AsInteger > 0)) then begin
                        Inc(iTotalPedigree);
                     end;
                     if ((tblE.FieldByName('DamDebutWinPctRank').AsInteger = 1) and
                        (tblE.FieldByName('DamDebutWinPct').AsInteger > 0)) then begin
                        Inc(iTotalPedigree);
                     end;
                  end;
               end;

               if (tblE.FieldByName('Age').AsInteger = 2) then begin
                  if (tblE.FieldByName('SireJuvenileThisYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('SireJuvenileLastYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('Dam2yoWinPctRank').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('Sire2yoWinPctRank').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;
               end;

               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  if (tblE.FieldByName('TurfRating').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;

                  if (tblE.FieldByName('DamAllTurfWinPctRank').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('SireAllTurfWinPctRank').AsInteger = 1) then begin
                     Inc(iTotalPedigree);
                  end;

                  if (tblE.FieldByName('SireTurfThisYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;
                  if (tblE.FieldByName('SireTurfLastYearRank').AsInteger > 0) then begin
                     Inc(iTotalPedigree);
                  end;
               end;

               tblE.FieldByName('TotalPace').AsInteger := iTotalPace;
               tblE.FieldByName('TotalSpdCls').AsInteger := iTotalSpdCls;
               tblE.FieldByName('TotalConnections').AsInteger := iTotalConnections;
               tblE.FieldByName('TotalPedigree').AsInteger := iTotalPedigree;
               tblE.FieldByName('Points').AsInteger := iTotalPace + iTotalConnections + iTotalSpdCls + iTotalPedigree;

               tblE.Post();
               tblE.Next();
            end;
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

   SetRanking(tblE, 'ByTotalPaceRank', 'TotalPaceRank', 'TotalPace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   SetRanking(tblE, 'ByTotalSpdClsRank', 'TotalSpdClsRank', 'TotalSpdCls', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   SetRanking(tblE, 'ByTotalConnectionsRank', 'TotalConnectionsRank', 'TotalConnections', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   SetRanking(tblE, 'ByTotalPedigreeRank', 'TotalPedigreeRank', 'TotalPedigree', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   SetRanking(tblE, 'ByPointsRank', 'PointsRank', 'Points', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);

end;


end.
