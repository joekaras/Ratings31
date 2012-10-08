unit UnitIndexTodayFiles;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure IndexToday(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);

procedure IndexPedigree(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);

//procedure IndexTemp(
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: integer);
//

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;

procedure IndexToday
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);
begin

   hLog.AddToLog('IndexToday', msevOperation);

   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByBackClassRank', 'TrkCode;RaceDate;RaceNbr;BackClass;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'BackClass', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);

   SetRankingDouble(tblE, 'ByBackClassRank', 'BackClassRank', 'BackClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);

   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByBackClassRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);

   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByAvgClassRank', 'TrkCode;RaceDate;RaceNbr;AvgClass;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'AvgClass', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRankingDouble(tblE, 'ByAvgClassRank', 'AvgClassRank', 'AvgClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByAvgClassRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
end;

procedure IndexPedigree
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer);
begin
   hLog.AddToLog('IndexPedigree', msevOperation);

   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByClassRatingRank', 'TrkCode;RaceDate;RaceNbr;ClassRating;Power', [ixDescending], 'ClassRating;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRanking(tblE, 'ByClassRatingRank', 'ClassRatingRank', 'ClassRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByClassRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);



      //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByTurfRatingRank', 'TrkCode;RaceDate;RaceNbr;TurfRating;Power', [ixDescending], 'TurfRating;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRanking(tblE, 'ByTurfRatingRank', 'TurfRatingRank', 'TurfRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByTurfRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);


   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByMudRatingRank', 'TrkCode;RaceDate;RaceNbr;MudRating;Power', [ixDescending], 'MudRating;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRanking(tblE, 'ByMudRatingRank', 'MudRatingRank', 'MudRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByMudRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);


   //
   OpenTableExclusive(tblE);
   try
      tblE.AddIndex('ByDistanceRatingRank', 'TrkCode;RaceDate;RaceNbr;DistanceRating;Power', [ixDescending], 'DistanceRating;Power', icFull);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);
   SetRanking(tblE, 'ByDistanceRatingRank', 'DistanceRatingRank', 'DistanceRating', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS, False);
   OpenTableExclusive(tblE);
   try
      tblE.DeleteIndex('ByDistanceRatingRank');
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
   CloseTableExclusive(tblE);

end;

procedure SetRankingDoubleTemp
   (
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   iNbrOfDays: integer
   );
var
   iRaceNbr: integer;
   sTrkCode: string;
   iPrevRaceNbr: integer;
   sPrevTrkCode: string;
   iRank: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      try

         tbl.IndexName := sIndexName;
         InitPrgBar(tbl.RecordCount);

         tbl.First();

         iPrevRaceNbr := 0;
         sPrevTrkCode := '';

         iStaCnt := 0;
         iTotalCnt := 0;

         staBar.SimpleText := sIndexName + ' - ' +
            tbl.FieldByName('TrkCode').AsString + ' ' +
            tbl.FieldByName('RaceDate').AsString;
         Application.ProcessMessages();

         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;
         while not tbl.Eof do begin
            IncPrgBar();
            if (tbl.FieldByName('RaceDate').AsDateTime < (Now() - iNbrOfDays)) then begin
               Inc(iTotalCnt);
               tbl.Next();
               continue;
            end;

            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := sIndexName + ' - ' +
                  tbl.FieldByName('TrkCode').AsString + ' ' +
                  tbl.FieldByName('RaceDate').AsString + ' Race # ' +
                  tbl.FieldByName('RaceNbr').AsString + ' ' +
                  IntToStr(iTotalCnt) + ' of ' + IntToStr(tbl.RecordCount);
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


            iRaceNbr := tbl.FieldByName('RaceNbr').AsInteger;
            sTrkCode := tbl.FieldByName('TrkCode').AsString;

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
               Inc(iRank);
               if (iRank <> tbl.FieldByName(sFldName).AsInteger) then begin
                  tbl.Edit();
                  if (iRank <= 10) then begin
                     tbl.FieldByName(sFldName).AsInteger := iRank;
                  end else begin
                     tbl.FieldByName(sFldName).AsInteger := 11;
                  end;
                  tbl.Post();
               end;
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
            end else begin
               iRank := 1;
               if (iRank <> tbl.FieldByName(sFldName).AsInteger) then begin
                  tbl.Edit();
                  tbl.FieldByName(sFldName).AsInteger := iRank;
                  tbl.Post();
               end;
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
            end;
            tbl.Next();
            Application.ProcessMessages();
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
      tbl.IndexName := '';
      ClearPrgStatusBars();
   end;
end;


//procedure IndexTemp
//   (
//   tblR: TDBISAMTable;
//   tblE: TDBISAMTable;
//   pnlPrgBar: TPanel;
//   prgBar: TcxProgressBar;
//   staBar: TStatusBar;
//   iIncCnt: integer);
//begin
//
//   //
//   OpenTableExclusive(tblE);
//
//   try
//      tblE.AddIndex('ByLastSpeedRank', 'TrkCode;RaceDate;RaceNbr;LastSpeed;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'LastSpeed', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByLastSpeedRank', 'LastSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByLastSpeedRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   try
//      tblE.AddIndex('ByBackSpeedRank', 'TrkCode;RaceDate;RaceNbr;BackSpeed;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'BackSpeed', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByBackSpeedRank', 'BackSpeed', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByBackSpeedRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   //
//   try
//      tblE.AddIndex('ByLastClassRank', 'TrkCode;RaceDate;RaceNbr;LastClass;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'LastClass', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByLastClassRank', 'LastClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByLastClassRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByBackClassRank', 'TrkCode;RaceDate;RaceNbr;BackClass;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'BackClass', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByBackClassRank', 'BackClass', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByBackClassRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByPowerRank', 'TrkCode;RaceDate;RaceNbr;Power;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'Power', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByPowerRank', 'Power', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByPowerRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByEarlyPaceRank', 'TrkCode;RaceDate;RaceNbr;EarlyPace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'EarlyPace', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByEarlyPaceRank', 'EarlyPace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByEarlyPaceRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByMiddlePaceRank', 'TrkCode;RaceDate;RaceNbr;MiddlePace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'MiddlePace', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByMiddlePaceRank', 'MiddlePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByMiddlePaceRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByLatePaceRank', 'TrkCode;RaceDate;RaceNbr;LatePace;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [ixDescending], 'LatePace', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByLatePaceRank', 'LatePace', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByLatePaceRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//
//   //
//   try
//      tblE.AddIndex('ByKSP1stCallRank', 'TrkCode;RaceDate;RaceNbr;KSP1stCall;QSP1stCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], 'QSP1stCall', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByKSP1stCallRank', 'KSP1stCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByKSP1stCallRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByKSP2ndCallRank', 'TrkCode;RaceDate;RaceNbr;KSP2ndCall;QSP2ndCall;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], 'QSP2ndCall', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByKSP2ndCallRank', 'KSP2ndCall', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByKSP2ndCallRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByEarlyPacePosRank', 'TrkCode;RaceDate;RaceNbr;EarlyPacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByEarlyPacePosRank', 'EarlyPacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByEarlyPacePosRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByMiddlePacePosRank', 'TrkCode;RaceDate;RaceNbr;MiddlePacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByMiddlePacePosRank', 'MiddlePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByMiddlePacePosRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//
//   //
//   try
//      tblE.AddIndex('ByLatePacePosRank', 'TrkCode;RaceDate;RaceNbr;LatePacePos;TrnTrackRank;JkyTrackRank;TrnWinsRank;JkyWinsRank;OwnWinsRank', [], '', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByLatePacePosRank', 'LatePacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByLatePacePosRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//   //
//   try
//      tblE.AddIndex('ByFinishPacePosRank', 'TrkCode;RaceDate;RaceNbr;FinishPacePos;', [], '', icFull);
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//   SetRankingDoubleTemp(tblE, 'ByFinishPacePosRank', 'FinishPacePos', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
//   try
//      tblE.DeleteIndex('ByFinishPacePosRank');
//   except
//      on E: Exception do hLog.AddToLog(E.Message, msevException);
//   end;
//
//
//   CloseTableExclusive(tblE);
//
//end;
//

end.

