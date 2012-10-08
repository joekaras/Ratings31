unit UnitUpdateNbrOfStarters;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateNbrOfStarters
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


procedure UpdateNbrOfStarters
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;

   iStaCnt: integer;
   iTotalCnt: integer;

   iNbrStarters: integer;
   iNbrDebutStarters: integer;
   iNbrDebutTwoStarters: integer;
   iNbrTurfDebutStarters: integer;
   iNbrRouteDebutStarters: integer;
   iNbrScratchedStarters: integer;


begin
   hLog.AddToLog('UpdateNbrOfStarters', msevOperation);

   // Get the sum of probabilities
   try
      CloseTable(tblR);
      CloseTable(tblE);

      OpenTable(tblR);
      OpenTable(tblE);

      try
         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         iNbrStarters := 0;
         iNbrDebutStarters := 0;
         iNbrDebutTwoStarters := 0;
         iNbrTurfDebutStarters := 0;
         iNbrRouteDebutStarters := 0;
         iNbrScratchedStarters := 0;

         tblE.First();
         iPrevRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
         sPrevTrkCode := tblE.FieldByName('TrkCode').AsString;

         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Nbr Of First Starters Etc - ' +
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

            IncPrgBar();


            iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
            sTrkCode := tblE.FieldByName('TrkCode').AsString;

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
               if tblR.GotoKey() then begin
                  Inc(iNbrStarters);

                  if ((tblE.FieldByName('Odds').AsFloat = 0) and
                     (tblE.FieldByName('FinishPos').AsInteger = 0)) then begin
                     Inc(iNbrScratchedStarters);
                  end;

                  if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                     (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                     if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
                        Inc(iNbrDebutStarters);
                     end;

                     if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
                        Inc(iNbrDebutTwoStarters);
                     end;
                  end;

                  if (tblR.FieldByName('Surface').AsString = 'T') then begin
                     if (tblE.FieldByName('TurfIndicator').AsString = '*') then begin
                        Inc(iNbrTurfDebutStarters);
                     end;
                  end;

                  if tblR.FieldByName('DistanceInFeet').AsInteger >= 5280 then begin
                     if (tblE.FieldByName('RouteIndicator').AsString = '*') then begin
                        Inc(iNbrRouteDebutStarters);
                     end;
                  end;
               end;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

            end else begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
               if tblR.GotoKey() then begin
                  tblR.Edit();
                  tblR.FieldByName('NbrStarters').AsInteger := iNbrStarters;
                  tblR.FieldByName('NbrDebutStarters').AsInteger := iNbrDebutStarters;
                  tblR.FieldByName('NbrDebutTwoStarters').AsInteger := iNbrDebutTwoStarters;
                  tblR.FieldByName('NbrTurfDebutStarters').AsInteger := iNbrTurfDebutStarters;
                  tblR.FieldByName('NbrRouteDebutStarters').AsInteger := iNbrRouteDebutStarters;
                  tblR.FieldByName('NbrScratchedStarters').AsInteger := iNbrScratchedStarters;
                  tblR.FieldByName('NbrRunners').AsInteger := iNbrStarters - iNbrScratchedStarters;
                  tblR.Post();
               end;

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;

               iNbrStarters := 0;
               iNbrDebutStarters := 0;
               iNbrDebutTwoStarters := 0;
               iNbrTurfDebutStarters := 0;
               iNbrRouteDebutStarters := 0;
               iNbrScratchedStarters := 0;

               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

               if tblR.GotoKey() then begin
                  Inc(iNbrStarters);

                  if ((tblE.FieldByName('Odds').AsFloat = 0) and
                     (tblE.FieldByName('FinishPos').AsInteger = 0)) then begin
                     Inc(iNbrScratchedStarters);
                  end;

                  if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                     (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                     if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
                        Inc(iNbrDebutStarters);
                     end;

                     if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
                        Inc(iNbrDebutTwoStarters);
                     end;
                  end;

                  if (tblR.FieldByName('Surface').AsString = 'T') then begin
                     if (tblE.FieldByName('TurfIndicator').AsString = '*') then begin
                        Inc(iNbrTurfDebutStarters);
                     end;
                  end;

                  if tblR.FieldByName('DistanceInFeet').AsInteger >= 5280 then begin
                     if (tblE.FieldByName('RouteIndicator').AsString = '*') then begin
                        Inc(iNbrRouteDebutStarters);
                     end;
                  end;
               end;
            end; //else

            tblE.Next();
         end;

      except
         on E: Exception do begin
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.RollBack();
            end;
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblR.IndexName := '';
      tblR.SetKey();
      tblR.FieldByName('TrkCode').Value := sPrevTrkCode;
      tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
      tblR.FieldByName('RaceNbr').Value := iPrevRaceNbr;
      if tblR.GotoKey() then begin
         tblR.Edit();
         tblR.FieldByName('NbrStarters').AsInteger := iNbrStarters;
         tblR.FieldByName('NbrDebutStarters').AsInteger := iNbrDebutStarters;
         tblR.FieldByName('NbrDebutTwoStarters').AsInteger := iNbrDebutTwoStarters;
         tblR.FieldByName('NbrTurfDebutStarters').AsInteger := iNbrTurfDebutStarters;
         tblR.FieldByName('NbrRouteDebutStarters').AsInteger := iNbrRouteDebutStarters;
         tblR.FieldByName('NbrScratchedStarters').AsInteger := iNbrScratchedStarters;
         tblR.FieldByName('NbrRunners').AsInteger := iNbrStarters - iNbrScratchedStarters;
         tblR.Post();
      end;
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit();
      end;
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();
   end;

end;

end.
