unit UnitUpdateHHMisc;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

//procedure qryFldStats(sFldName: string; sType: string);
procedure qrySummaryTotals();
procedure qryUpdSummaryFlds();
procedure UpdateHHBaseRanks(Sender: TObject);
procedure UpdateHHConnectionRanks(Sender: TObject);
procedure UpdateHHPedigreeRanks(Sender: TObject);
procedure UpdateHHRatingsRanks(Sender: TObject);
procedure UpdateHHStats(Sender: TObject);
procedure UpdateLinerSheetSelected(iIncCnt: integer);
procedure UpdateIsPrintedOnValueSheet();
procedure UpdateHHSurface();

procedure UpdateAxcisRHAndHHRaceEntry(
   sRaceFileName: string;
   sEntryFileName: string;
   sDamFileName: string;
   sSireFileName: string;
   sPastFileName: string;
   sMatchupFileName: string;
   sTrainerFileName: string;
   sJockeyFileName: string);

procedure UpdateRHandHHFromAxcis(Sender: TObject);
procedure UpdateAxcisRHAndHHEntry(lRecNo: Longint);
procedure UpdateRH(Sender: TObject);

procedure ExportToNexus(t: TDBISAMTable; sPath: string);

procedure UpdateHHSuperTrainerJockey
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   tblTrn: TDBISAMTable;
   tblJky: TDBISAMTable;
   tblOwn: TDBISAMTable;
   tblRn: TDBISAMTable;
   tblRnT: TDBISAMTable;
   tblTrackLeaders: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bLast30Days: boolean
   );


implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking, DatDBF;

var
   qrySQL: TDBISAMQuery;

procedure UpdateHHBaseRanks(Sender: TObject);
begin

   try
      // TimerOn(False);
       //    //
       //    OpenTable(dm.tblHH);
       //
       //    try
       //      dm.tblHH.AddIndex('ByMorningLineTo1Rank', 'TrkCode;RaceDate;RaceNbr;MorningLineTo1;Power', []);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByMorningLineTo1Rank', 'MorningLineTo1Rank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByMorningLineTo1Rank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByAvgClassRank', 'TrkCode;RaceDate;RaceNbr;AvgClass;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByAvgClassRank', 'AvgClassRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByAvgClassRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByLastSpeedRank', 'TrkCode;RaceDate;RaceNbr;Power;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByLastSpeedRank', 'LastSpeedRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByLastSpeedRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByBackSpeedRank', 'TrkCode;RaceDate;RaceNbr;BackSpeed;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByBackSpeedRank', 'BackSpeedRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByBackSpeedRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByPowerRank', 'TrkCode;RaceDate;RaceNbr;Power;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByPowerRank', 'PowerRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByPowerRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByEarlyPaceRank', 'TrkCode;RaceDate;RaceNbr;EarlyPace;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByEarlyPaceRank', 'EarlyPaceRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByEarlyPaceRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByMiddlePaceRank', 'TrkCode;RaceDate;RaceNbr;MiddlePace;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByMiddlePaceRank', 'MiddlePaceRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByMiddlePaceRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByLatePaceRank', 'TrkCode;RaceDate;RaceNbr;LatePace;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByLatePaceRank', 'LatePaceRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByLatePaceRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);

       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByAvgSpeedRank', 'TrkCode;RaceDate;RaceNbr;AvgSpeed;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByAvgSpeedRank', 'AvgSpeedRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByAvgSpeedRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByAvgClassRatingRank', 'TrkCode;RaceDate;RaceNbr;AvgClassRating;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByAvgClassRatingRank', 'AvgClassRatingRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByAvgClassRatingRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByPastSpeedRank', 'TrkCode;RaceDate;RaceNbr;PastSpeed;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByPastSpeedRank', 'PastSpeedRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByPastSpeedRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByBackClassRank', 'TrkCode;RaceDate;RaceNbr;BackClass;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByBackClassRank', 'BackClassRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByBackClassRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByCurrClassRank', 'TrkCode;RaceDate;RaceNbr;CurrClass;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByCurrClassRank', 'CurrClassRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByCurrClassRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByBackPace1Rank', 'TrkCode;RaceDate;RaceNbr;BackPace1;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByBackPace1Rank', 'BackPace1Rank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByBackPace1Rank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByBackPace2Rank', 'TrkCode;RaceDate;RaceNbr;BackPace2;Power', [ixDescending]);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByBackPace2Rank', 'BackPace2Rank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByBackPace2Rank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByEarlyPacePosRank', 'TrkCode;RaceDate;RaceNbr;EarlyPacePos;Power', []);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByEarlyPacePosRank', 'EarlyPacePosRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByEarlyPacePosRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByMiddlePacePosRank', 'TrkCode;RaceDate;RaceNbr;MiddlePacePos;Power', []);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByMiddlePacePosRank', 'MiddlePacePosRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByMiddlePacePosRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //
       //    //
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.AddIndex('ByLatePacePosRank', 'TrkCode;RaceDate;RaceNbr;LatePacePos;Power', []);
       //    except
       //    end;
       //    CloseTable(dm.tblHH);
       //    SetRanking(dm.tblHH, 'ByLatePacePosRank', 'LatePacePosRank', pnlPrgBar, prgBar, staBar, 1000);
       //    OpenTable(dm.tblHH);
       //    try
       //      dm.tblHH.DeleteIndex('ByLatePacePosRank');
       //    except
       //    end;
       //    CloseTable(dm.tblHH);

       //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTurfRPIRank', 'TrkCode;RaceDate;RaceNbr;TurfRPI', [ixDescending], 'TurfRpi', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTurfRPIRank', 'TurfRPIRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTurfRPIRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByMaidenRPIRank', 'TrkCode;RaceDate;RaceNbr;MaidenRPI', [ixDescending], 'MaidenRpi', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByMaidenRPIRank', 'MaidenRPIRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByMaidenRPIRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByMudRPIRank', 'TrkCode;RaceDate;RaceNbr;MudRPI', [ixDescending], 'MudRpi', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByMudRPIRank', 'MudRPIRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByMudRPIRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         //         TimerOn(True);
         CloseTable(dm.tblHH);
      end;
   end;
   //   TimerOn(True);
   CloseTable(dm.tblHH);

end;

procedure UpdateHHConnectionRanks(Sender: TObject);
begin

   try
      //      TimerOn(False);

            //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTrnTodayWinPctRank', 'TrkCode;RaceDate;RaceNbr;TrnTodayWinPct;Power', [ixDescending], 'TrnTodayWinPct;Power',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTrnTodayWinPctRank', 'TrnTodayWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTrnTodayWinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
//      OpenTable(dm.tblHH);
//      try
//         dm.tblHH.AddIndex('ByTotalTrnDaysWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnDaysWinPct;Power', [ixDescending],'TotalTrnDaysWinPct', icFull);
//      except
//      end;
//      CloseTable(dm.tblHH);
//      SetRanking(dm.tblHH, 'ByTotalTrnDaysWinPctRank', 'TotalTrnDaysWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE,  STAT_DAYS);
//      OpenTable(dm.tblHH);
//      try
//         dm.tblHH.DeleteIndex('ByTotalTrnDaysWinPctRank');
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalTrnTurfWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrnTurfWinPct;Power', [ixDescending],
            'TotalTrnTurfWinPct', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalTrnTurfWinPctRank', 'TotalTrnTurfWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalTrnTurfWinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalTrn10WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrn10WinPct;Power', [ixDescending], 'TotalTrn10WinPct',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalTrn10WinPctRank', 'TotalTrn10WinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalTrn10WinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalTrn30WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalTrn30WinPct;Power', [ixDescending], 'TotalTrn30WinPct', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalTrn30WinPctRank', 'TotalTrn30WinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalTrn30WinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalJky10WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalJky10WinPct;Power', [ixDescending], 'TotalJky10WinPct',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalJky10WinPctRank', 'TotalJky10WinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalJky10WinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalJky30WinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalJky30WinPct;Power', [ixDescending], 'TotalJky30WinPct',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalJky30WinPctRank', 'TotalJky30WinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalJky30WinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
//      OpenTable(dm.tblHH);
//      try
//         dm.tblHH.AddIndex('ByTotalJkyDaysWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalJkyDaysWinPct;Power', [ixDescending],'TotalJkyDaysWinPct',icFull);
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//      CloseTable(dm.tblHH);
//      SetRanking(dm.tblHH, 'ByTotalJkyDaysWinPctRank', 'TotalTrnJkyWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE,  STAT_DAYS);
//      OpenTable(dm.tblHH);
//      try
//         dm.tblHH.DeleteIndex('ByTotalJkyDaysWinPctRank');
//      except
//         on E: Exception do hLog.AddToLog(E.Message, msevException);
//      end;
//      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalOwnWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalOwnWinPct;Power', [ixDescending], 'TotalOwnWinPct',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalOwnWinPctRank', 'TotalOwnWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalOwnWinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTotalBrdWinPctRank', 'TrkCode;RaceDate;RaceNbr;TotalBrdWinPct;Power', [ixDescending], 'TotalBrdWinPct',
            icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTotalBrdWinPctRank', 'TotalBrdWinPctRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTotalBrdWinPctRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         //         TimerOn(True);
         CloseTable(dm.tblHH);
      end;
   end;
   //   TimerOn(True);
   CloseTable(dm.tblHH);

end;

procedure UpdateHHPedigreeRanks(Sender: TObject);
var

   fDamSireAllWinPct: double;
   fDamSireAllMudWinPct: double;
   fDamSireAllTurfWinPct: double;

   fSireAllWinPct: double;
   fSireAllMudWinPct: double;
   fSireAllTurfWinPct: double;

   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;
begin

   try
      //      TimerOn(False);
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();

      while not dm.tblHH.Eof do begin
         IncPrgBar();

         //         staBar.SimpleText := 'Updating Pedigree Stats - ' +
         //            dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
         //            dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
         //            dm.tblHH.FieldByName('RaceNbr').AsString;

         Application.ProcessMessages();

         fClassRating := 0;
         fTurfRating := 0;
         fMudRating := 0;

         fDamSireAllWinPct := 0;
         fDamSireAllMudWinPct := 0;
         fDamSireAllTurfWinPct := 0;

         fSireAllWinPct := 0;
         fSireAllMudWinPct := 0;
         fSireAllTurfWinPct := 0;

         fDamSireAllWinPct := dm.tblHH.FieldByName('DamSireAllWinPct').AsFloat;
         fDamSireAllMudWinPct := dm.tblHH.FieldByName('DamSireAllMudWinPct').AsFloat;
         fDamSireAllTurfWinPct := dm.tblHH.FieldByName('DamSireAllTurfWinPct').AsFloat;

         fSireAllWinPct := dm.tblHH.FieldByName('SireAllWinPct').AsFloat;
         fSireAllMudWinPct := dm.tblHH.FieldByName('SireAllMudWinPct').AsFloat;
         fSireAllTurfWinPct := dm.tblHH.FieldByName('SireAllTurfWinPct').AsFloat;

         fClassRating := ((fDamSireAllWinPct / 100) * (fSireAllWinPct / 100)) * 1000;
         fTurfRating := ((fDamSireAllTurfWinPct / 100) * (fSireAllTurfWinPct / 100)) * 1000;
         fMudRating := ((fDamSireAllMudWinPct / 100) * (fSireAllMudWinPct / 100)) * 1000;

         dm.tblHH.Edit();

         dm.tblHH.FieldByName('ClassRating').Value := fClassRating;
         dm.tblHH.FieldByName('TurfRating').Value := fTurfRating;
         dm.tblHH.FieldByName('MudRating').Value := fMudRating;

         dm.tblHH.FieldByName('PDQPaceRating').AsFloat := Int(dm.tblHH.FieldByName('EarlyPace').AsFloat) +
            Int(dm.tblHH.FieldByName('MiddlePace').AsFloat) +
            Int(dm.tblHH.FieldByName('LatePace').AsFloat);

         if (dm.tblHH.FieldByName('EarlyPacePos').AsFloat > 9000) or (dm.tblHH.FieldByName('MiddlePacePos').AsFloat > 9000) then begin
            dm.tblHH.FieldByName('SpeedPoints').AsFloat := 0;
         end else begin
            dm.tblHH.FieldByName('SpeedPoints').AsFloat := 100 - (dm.tblHH.FieldByName('EarlyPacePos').AsFloat +
               dm.tblHH.FieldByName('MiddlePacePos').AsFloat);
         end;

         dm.tblHH.Post();

         dm.tblHH.Next();
      end;

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByClassRatingRank', 'TrkCode;RaceDate;RaceNbr;ClassRating;Power', [ixDescending], 'ClassRating;Power', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByClassRatingRank', 'ClassRatingRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByClassRatingRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByTurfRatingRank', 'TrkCode;RaceDate;RaceNbr;TurfRating;Power', [ixDescending], '', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByTurfRatingRank', 'TurfRatingRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByTurfRatingRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByMudRatingRank', 'TrkCode;RaceDate;RaceNbr;MudRating;Power', [ixDescending], '', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByMudRatingRank', 'MudRatingRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByMudRatingRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         //         TimerOn(True);
         CloseTable(dm.tblHH);
         ClearPrgStatusBars();
      end;
   end;

   //   TimerOn(True);
   CloseTable(dm.tblHH);
   ClearPrgStatusBars();

end;

procedure UpdateHHRatingsRanks(Sender: TObject);
begin

   try
      //      TimerOn(False);

            //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('BySpeedPointsRank', 'TrkCode;RaceDate;RaceNbr;SpeedPoints;Power', [ixDescending], '', icFull);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'BySpeedPointsRank', 'SpeedPointsRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('BySpeedPointsRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByPDQPaceRatingRank', 'TrkCode;RaceDate;RaceNbr;PDQPaceRating;Power', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByPDQPaceRatingRank', 'PDQPaceRatingRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByPDQPaceRatingRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByConnectionRPIRank', 'TrkCode;RaceDate;RaceNbr;ConnectionRPI', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByConnectionRPIRank', 'ConnectionRPIRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByConnectionRPIRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByConnectionIVRank', 'TrkCode;RaceDate;RaceNbr;ConnectionIV', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByConnectionIVRank', 'ConnectionIVRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByConnectionIVRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByPaceIVRank', 'TrkCode;RaceDate;RaceNbr;PaceIV', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByPaceIVRank', 'PaceIVRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByPaceIVRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByPacePosIVRank', 'TrkCode;RaceDate;RaceNbr;PacePosIV', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByPacePosIVRank', 'PacePosIVRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByPacePosIVRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('BySpeedIVRank', 'TrkCode;RaceDate;RaceNbr;SpeedIV', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'BySpeedIVRank', 'SpeedIVRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('BySpeedIVRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

      //
      OpenTable(dm.tblHH);
      try
         dm.tblHH.AddIndex('ByClassIVRank', 'TrkCode;RaceDate;RaceNbr;ClassIV', [ixDescending]);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);
      //      SetRanking(dm.tblHH, 'ByClassIVRank', 'ClassIVRank', pnlPrgBar, prgBar, staBar, BATCH_SIZE, STAT_DAYS);
      OpenTable(dm.tblHH);
      try
         dm.tblHH.DeleteIndex('ByClassIVRank');
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
      CloseTable(dm.tblHH);

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         //         TimerOn(True);
         CloseTable(dm.tblHH);
      end;
   end;
   //   TimerOn(True);
   CloseTable(dm.tblHH);

end;

procedure UpdateHHStats(Sender: TObject);
begin

   CloseTable(dm.tblSummaryFlds);
   dm.tblSummaryFlds.EmptyTable();
   CloseTable(dm.tblSummaryFlds);

   //   qryFldStats('AvgClassRank', 'ALL');
   //   qryFldStats('LastSpeedRank', 'ALL');
   //   qryFldStats('BackSpeedRank', 'ALL');
   //
   //   qryFldStats('PowerRank', 'ALL');
   //
   //   qryFldStats('EarlyPaceRank', 'ALL');
   //   qryFldStats('MiddlePaceRank', 'ALL');
   //   qryFldStats('LatePaceRank', 'ALL');
   //
   //   qryFldStats('MorningLineTo1Rank', 'ALL');
   //
   //   qryFldStats('TrnTodayWinPctRank', 'ALL');
   //   qryFldStats('TotalTrnWinPctRank', 'ALL');
      //   qryFldStats('TotalTrnDaysWinPctRank', 'ALL');
   //   qryFldStats('TotalTrnJkyWinPctRank', 'ALL');
      //   qryFldStats('TotalTrnJkyDaysWinPctRank', 'ALL');
   //   qryFldStats('TotalTrnOwnWinPctRank', 'ALL');
   //   qryFldStats('TotalJkyWinPctRank', 'ALL');
      //   qryFldStats('TotalJkyDaysWinPctRank', 'ALL');
   //   qryFldStats('TotalOwnWinPctRank', 'ALL');
   //   qryFldStats('TotalBrdWinPctRank', 'ALL');
   //
   //   qryFldStats('ClassRatingRank', 'MDN');
   //   qryFldStats('TurfRatingRank', 'TURF');
   //   qryFldStats('MudRatingRank', 'MUD');
   //
   //   qryFldStats('SireAllWinPctRank', 'MDN');
   //   qryFldStats('DamSireAllWinPctRank', 'MDN');
   //   qryFldStats('DamAllWinPctRank', 'MDN');
   //
   //   qryFldStats('SireAllTurfWinPctRank', 'TURF');
   //   qryFldStats('DamSireAllTurfWinPctRank', 'TURF');
   //   qryFldStats('DamAllTurfWinPctRank', 'TURF');
   //
   //   qryFldStats('SireAllMudWinPctRank', 'MUD');
   //   qryFldStats('DamSireAllMudWinPctRank', 'MUD');
   //   qryFldStats('DamAllMudWinPctRank', 'MUD');
   //
   //   CloseTable(dm.tblSummaryTotals);
   //   dm.tblSummaryTotals.EmptyTable();
   //   CloseTable(dm.tblSummaryTotals);
   //   qrySummaryTotals();
   //   qryUpdSummaryFlds();
   //
end;

//procedure qryFldStats(sFldName: string; sType: string);
//var
//   sTmp: string;
//begin
//
//   try
//      CloseTable(dm.tblSummaryFlds);
//      OpenTable(dm.tblSummaryFlds);
//
//      //      TimerOn(False);
//      qrySQL.Close;
//      qrySQL.Unprepare;
//      qrySQL.Sql.Clear();
//      sTmp := '';
//
//      if (sType = 'ALL') then begin
//         sTmp := sTmp + 'SELECT DISTINCT ' + sFldName + ', FinishPos, COUNT(FinishPos) AS TotalFinishPosCount, AVG(Odds) AS AvgOdds ';
//         sTmp := sTmp + 'FROM HorseHistory ';
//         sTmp := sTmp + 'WHERE (FinishPos > 0 AND FinishPos < 15) AND Odds > 0 AND ' + sFldName + ' > 0';
//         sTmp := sTmp + 'GROUP BY ' + sFldName + ', FinishPos; ';
//      end;
//
//      if (sType = 'TURF') then begin
//         sTmp := sTmp + 'SELECT DISTINCT ' + sFldName + ', FinishPos, COUNT(FinishPos) AS TotalFinishPosCount, AVG(Odds) AS AvgOdds ';
//         sTmp := sTmp + 'FROM HorseHistory ';
//         sTmp := sTmp + 'WHERE (FinishPos > 0 AND FinishPos < 15) AND Odds > 0 AND Surface = "T" AND ' + sFldName + ' > 0';
//         sTmp := sTmp + 'GROUP BY ' + sFldName + ', FinishPos; ';
//      end;
//
//      if (sType = 'MUD') then begin
//         sTmp := sTmp + 'SELECT DISTINCT ' + sFldName + ', FinishPos, COUNT(FinishPos) AS TotalFinishPosCount, AVG(Odds) AS AvgOdds ';
//         sTmp := sTmp + 'FROM HorseHistory ';
//         sTmp := sTmp + 'WHERE (FinishPos > 0 AND FinishPos < 15) AND Odds > 0 AND TrkCond <> "FT" AND Surface <> "T" AND ' + sFldName +
//            ' > 0';
//         sTmp := sTmp + 'GROUP BY ' + sFldName + ', FinishPos; ';
//      end;
//
//      if (sType = 'MDN') then begin
//         sTmp := sTmp + 'SELECT DISTINCT ' + sFldName + ', FinishPos, COUNT(FinishPos) AS TotalFinishPosCount, AVG(Odds) AS AvgOdds ';
//         sTmp := sTmp + 'FROM HorseHistory ';
//         sTmp := sTmp + 'WHERE (FinishPos > 0 AND FinishPos < 15) AND Odds > 0 AND (RaceType = "MDN" or RaceType = "MSW") AND ' + sFldName +
//            ' > 0';
//         sTmp := sTmp + 'GROUP BY ' + sFldName + ', FinishPos; ';
//      end;
//
//      qrySQL.Sql.Add(sTmp);
//      qrySQL.RequestLive := True;
//      qrySQL.Prepare;
//      qrySQL.Open();
//      qrySQL.First();
//
//      InitPrgBar(qrySQL.RecordCount);
//      while not qrySQL.EOF do begin
//      qrySQL.Open();
//      qrySQL.First();
//
//      InitPrgBar(qrySQL.RecordCount);
//      while not qrySQL.EOF do begin
//         IncPrgBar();
//         IncPrgBar();
//         dm.tblSummaryFlds.IndexName := '';
//         dm.tblSummaryFlds.SetKey();
//         dm.tblSummaryFlds.FieldByName('FldName').AsString := sFldName;
//         dm.tblSummaryFlds.FieldByName('Rank').AsInteger := qrySQL.FieldByName(sFldName).AsInteger;
//         dm.tblSummaryFlds.FieldByName('FinishPos').AsInteger := qrySQL.FieldByName('FinishPos').AsInteger;
//         if (dm.tblSummaryFlds.GotoKey()) then begin
//            dm.tblSummaryFlds.Edit();
//            dm.tblSummaryFlds.FieldByName('TotalFinishPosCount').AsInteger := qrySQL.FieldByName('TotalFinishPosCount').AsInteger;
//            dm.tblSummaryFlds.FieldByName('AvgOdds').AsFloat := Round(qrySQL.FieldByName('AvgOdds').AsFloat * 100) / 100;
//            dm.tblSummaryFlds.Post();
//         end else begin
//            dm.tblSummaryFlds.Append();
//            dm.tblSummaryFlds.FieldByName('FldName').AsString := sFldName;
//            dm.tblSummaryFlds.FieldByName('Rank').AsInteger := qrySQL.FieldByName(sFldName).AsInteger;
//            dm.tblSummaryFlds.FieldByName('FinishPos').AsInteger := qrySQL.FieldByName('FinishPos').AsInteger;
//            dm.tblSummaryFlds.FieldByName('TotalFinishPosCount').AsInteger := qrySQL.FieldByName('TotalFinishPosCount').AsInteger;
//            dm.tblSummaryFlds.FieldByName('AvgOdds').AsFloat := Round(qrySQL.FieldByName('AvgOdds').AsFloat * 100) / 100;
//            dm.tblSummaryFlds.Post();
//         end;
//         qrySQL.Next();
//      end;
//
//   except
//      on E: Exception do begin
//         hLog.AddToLog(E.Message, msevException);
//         qrySQL.Close();
//         CloseTable(dm.tblSummaryFlds);
//         //         TimerOn(True);
//         ClearPrgStatusBars();
//      end;
//   end;
//
//   qrySQL.Close();
//   CloseTable(dm.tblSummaryFlds);
//   //   TimerOn(True);
//   ClearPrgStatusBars();
//end;
//

procedure qrySummaryTotals();
var
   sTmp: string;
begin

   try
      CloseTable(dm.tblSummaryTotals);
      OpenTable(dm.tblSummaryTotals);

      //      TimerOn(False);
      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      sTmp := '';

      sTmp := sTmp + 'SELECT FldName, Rank, Sum(TotalFinishPosCount) as TotalFldCount ';
      sTmp := sTmp + 'FROM SummaryFlds ';
      sTmp := sTmp + 'GROUP BY FldName, Rank; ';
      qrySQL.Sql.Add(sTmp);
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.Open();
      qrySQL.First();

      InitPrgBar(qrySQL.RecordCount);
      while not qrySQL.EOF do begin
         IncPrgBar();
         dm.tblSummaryTotals.IndexName := '';
         dm.tblSummaryTotals.SetKey();
         dm.tblSummaryTotals.FieldByName('FldName').AsString := qrySQL.FieldByName('FldName').AsString;
         dm.tblSummaryTotals.FieldByName('Rank').AsInteger := qrySQL.FieldByName('Rank').AsInteger;
         if (dm.tblSummaryTotals.GotoKey()) then begin
            dm.tblSummaryTotals.Edit();
            dm.tblSummaryTotals.FieldByName('TotalFldCount').AsInteger := qrySQL.FieldByName('TotalFldCount').AsInteger;
            dm.tblSummaryTotals.Post();
         end else begin
            dm.tblSummaryTotals.Append();
            dm.tblSummaryTotals.FieldByName('FldName').AsString := qrySQL.FieldByName('FldName').AsString;
            dm.tblSummaryTotals.FieldByName('Rank').AsInteger := qrySQL.FieldByName('Rank').AsInteger;
            dm.tblSummaryTotals.FieldByName('TotalFldCount').AsInteger := qrySQL.FieldByName('TotalFldCount').AsInteger;
            dm.tblSummaryTotals.Post();
         end;
         qrySQL.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         qrySQL.Close();
         CloseTable(dm.tblSummaryTotals);
         //         TimerOn(True);
         ClearPrgStatusBars();
      end;
   end;

   qrySQL.Close();
   CloseTable(dm.tblSummaryTotals);
   //   TimerOn(True);
   ClearPrgStatusBars();
end;

procedure qryUpdSummaryFlds();
var
   sTmp: string;
   fTotalPct: double;
   fTotalFldCount: double;
   fTotalFinishPosCount: double;

begin

   try
      CloseTable(dm.tblSummaryFlds);
      OpenTable(dm.tblSummaryFlds);

      //      TimerOn(False);
      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();

      sTmp := '';
      sTmp := sTmp + 'SELECT SummaryFlds.FldName, SummaryFlds.Rank, SummaryFlds.FinishPos, SummaryTotals.TotalFldCount ';
      sTmp := sTmp + 'FROM SummaryFlds, SummaryTotals ';
      sTmp := sTmp + 'WHERE SummaryTotals.FldName = SummaryFlds.FldName AND SummaryTotals.Rank = SummaryFlds.Rank; ';

      qrySQL.Sql.Add(sTmp);
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.Open();
      qrySQL.First();

      InitPrgBar(qrySQL.RecordCount);
      while not qrySQL.EOF do begin
         IncPrgBar();

         dm.tblSummaryFlds.IndexName := '';
         dm.tblSummaryFlds.SetKey();
         dm.tblSummaryFlds.FieldByName('FldName').AsString := qrySQL.FieldByName('FldName').AsString;
         dm.tblSummaryFlds.FieldByName('Rank').AsInteger := qrySQL.FieldByName('Rank').AsInteger;
         dm.tblSummaryFlds.FieldByName('FinishPos').AsInteger := qrySQL.FieldByName('FinishPos').AsInteger;
         if (dm.tblSummaryFlds.GotoKey()) then begin
            dm.tblSummaryFlds.Edit();
            dm.tblSummaryFlds.FieldByName('TotalFldCount').AsInteger := qrySQL.FieldByName('TotalFldCount').AsInteger;
            fTotalFldCount := dm.tblSummaryFlds.FieldByName('TotalFldCount').AsFloat;
            fTotalFinishPosCount := dm.tblSummaryFlds.FieldByName('TotalFinishPosCount').AsFloat;
            if (fTotalFldCount > 0) then begin
               fTotalPct := (fTotalFinishPosCount / fTotalFldCount) * 100;
            end else begin
               fTotalPct := 0;
            end;
            dm.tblSummaryFlds.FieldByName('TotalPct').AsFloat := Round(fTotalPct * 100) / 100;
            dm.tblSummaryFlds.Post();
         end;

         qrySQL.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         qrySQL.Close();
         CloseTable(dm.tblSummaryFlds);
         //         TimerOn(True);
         ClearPrgStatusBars();
      end;
   end;

   qrySQL.Close();
   CloseTable(dm.tblSummaryFlds);
   //   TimerOn(True);
   ClearPrgStatusBars();
end;


procedure UpdateLinerSheetSelected(iIncCnt: integer);
var

   iPos: integer;
   iBegPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

   bTripleLiner0: boolean;
   bTripleLiner1: boolean;
   bTripleLiner2: boolean;
   bTripleLiner3: boolean;

   bBackDoubleLiner0: boolean;
   bBackDoubleLiner1: boolean;
   bBackDoubleLiner2: boolean;
   bBackDoubleLiner3: boolean;

   bFrontDoubleLiner0: boolean;
   bFrontDoubleLiner1: boolean;
   bFrontDoubleLiner2: boolean;
   bFrontDoubleLiner3: boolean;

   bLinerSheetSelected: boolean;

begin

   hLog.AddToLog('UpdateLinerSheetSelected', msevOperation);

   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      iStaCnt := 0;
      iTotalCnt := 0;
      iRecordCnt := dm.tblHH.RecordCount;

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin
         if (iTotalCnt > iRecordCnt) then begin
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback();
            end;
            CloseTable(dm.tblHH);
            ClearPrgStatusBars();
            exit;
         end;

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating PRIMARY/SECONDARY/DEFAULT Keys - ' +
               dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
               dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
               dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
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

         bFrontDoubleLiner0 := dm.tblHH.FieldByName('IsFrontDoubleLiner0').AsBoolean;
         bFrontDoubleLiner1 := dm.tblHH.FieldByName('IsFrontDoubleLiner1').AsBoolean;
         bFrontDoubleLiner2 := dm.tblHH.FieldByName('IsFrontDoubleLiner2').AsBoolean;
         bFrontDoubleLiner3 := dm.tblHH.FieldByName('IsFrontDoubleLiner3').AsBoolean;

         bBackDoubleLiner0 := dm.tblHH.FieldByName('IsBackDoubleLiner0').AsBoolean;
         bBackDoubleLiner1 := dm.tblHH.FieldByName('IsBackDoubleLiner1').AsBoolean;
         bBackDoubleLiner2 := dm.tblHH.FieldByName('IsBackDoubleLiner2').AsBoolean;
         bBackDoubleLiner3 := dm.tblHH.FieldByName('IsBackDoubleLiner3').AsBoolean;

         bTripleLiner0 := dm.tblHH.FieldByName('IsTripleLiner0').AsBoolean;
         bTripleLiner1 := dm.tblHH.FieldByName('IsTripleLiner1').AsBoolean;
         bTripleLiner2 := dm.tblHH.FieldByName('IsTripleLiner2').AsBoolean;
         bTripleLiner3 := dm.tblHH.FieldByName('IsTripleLiner3').AsBoolean;

         dm.tblHH.Edit();

         bLinerSheetSelected := False;
         if (bTripleLiner0 or bFrontDoubleLiner0 or bBackDoubleLiner0 or
            bTripleLiner1 or bFrontDoubleLiner1 or bBackDoubleLiner1 or
            bTripleLiner2 or bFrontDoubleLiner2 or bBackDoubleLiner2 or
            bTripleLiner3 or bFrontDoubleLiner3 or bBackDoubleLiner3) then begin
            bLinerSheetSelected := True;
         end;

         dm.tblHH.FieldByName('IsLinerSheetSelected').AsBoolean := bLinerSheetSelected;
         dm.tblHH.Post();
         dm.tblHH.Next();
      end;

   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;
      CloseTable(dm.tblHH);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   ClearPrgStatusBars();

end;

procedure UpdateIsPrintedOnValueSheet();
begin

   OpenTable(dm.tblRH);
   OpenTable(dm.tblHH);
   OpenTable(dm.tblTrack);

   InitPrgBar(dm.tblHH.RecordCount);

   dm.tblHH.First();
   while not dm.tblHH.Eof do begin
      IncPrgBar();

      dm.tblTrack.IndexName := '';
      dm.tblTrack.SetKey();
      dm.tblTrack.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').AsString;
      if dm.tblTrack.GotoKey() then begin

         dm.tblHH.Edit();
         gedtOverrideDate := dm.tblRH.FieldByName('RaceDate').AsDateTime;

         if (DayOfTheWeek(gedtOverrideDate) = DayMonday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DayTuesday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetTue').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DayWednesday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetWed').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DayThursday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetThu').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DayFriday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetFri').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DaySaturday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSat').AsBoolean;
         end;

         if (DayOfTheWeek(gedtOverrideDate) = DaySunday) then begin
            dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSun').AsBoolean;
         end;
         dm.tblHH.Post();


         dm.tblRH.IndexName := '';
         dm.tblRH.SetKey();
         dm.tblRH.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
         dm.tblRH.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
         dm.tblRH.FieldByName('RaceNbr').Value := dm.tblHH.FieldByName('RaceNbr').Value;
         if dm.tblRH.GotoKey() then begin
            dm.tblRH.Edit();
            dm.tblRH.FieldByName('IsPrintedOnValueSheet').AsBoolean := dm.tblHH.FieldByName('IsPrintedOnValueSheet').AsBoolean;
            dm.tblRH.Post();
         end;

      end;

      dm.tblHH.Next();
   end;

   CloseTable(dm.tblRH);
   CloseTable(dm.tblHH);
   CloseTable(dm.tblTrack);
end;


procedure UpdateHHSuperTrainerJockey
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   tblTrn: TDBISAMTable;
   tblJky: TDBISAMTable;
   tblOwn: TDBISAMTable;
   tblRn: TDBISAMTable;
   tblRnT: TDBISAMTable;
   tblTrackLeaders: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bLast30Days: boolean
   );

var
   bWagerSheetSelected: boolean;
   bLinerSheetSelected: boolean;
   bOverlaySheetSelected: boolean;

   bSuperTrainer: boolean;
   bSuperOwner: boolean;
   bSuperJockey: boolean;

   bFrontDoubleLiner: boolean;
   bBackDoubleLiner: boolean;
   bTripleDot: boolean;
   bFrontDoubleDot: boolean;
   bBackDoubleDot: boolean;
   bTripleLiner: boolean;

   bDollar: boolean;
   bDoubleDollar: boolean;

   sValueIndicator: string;
   sDollarIndicator: string;

   bFirstTimeJuice: boolean;
   bSecondTimeJuice: boolean;

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

   fMorningLineTo1: double;


   iLinerStartsByTrkAll: integer;
   iLinerWinsByTrkAll: integer;
   fLinerWinPctByTrkAll: double;
   fLinerValueBetByTrkAll: double;

   iLinerStartsByTrk0To3: integer;
   iLinerWinsByTrk0To3: integer;
   fLinerWinPctByTrk0To3: double;
   fLinerValueBetByTrk0To3: double;

   iEarlyPaceRank: integer;
   iMiddlePaceRank: integer;
   iLatePaceRank: integer;

   iEarlyPacePosRank: integer;
   iMiddlePacePosRank: integer;
   iLatePacePosRank: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;

   sWager: string;
   sOwner: string;
   sTrainer: string;
   sJockey: string;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;

   iPostPos: integer;

   bIsLayoffAndUp: boolean;
   bIsClaimedAndUp: boolean;
   bIsClaimedAndDown: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;
   sSurface: string;
   sRaceType: string;

   bTurfToDirt: boolean;
   bDirtToTurf: boolean;
   bRteToSpr: boolean;
   bSprToRte: boolean;

   fTotalTrnDebutWinPct: double;
   fTotalTrnDebutTwoWinPct: double;

   fTotalTrn120PlusWinPct: double;
   fTotalTrnWork120PlusWinPct: double;

   fTotalTrnAftClmWinPct: double;
   fTotalTrnTurfWinPct: double;

   fTotalTrnWinPct: double;
   fTotalJkyWinPct: double;
   fTotalOwnWinPct: double;

   fTrnSprToRteWinPct: double;
   fTrnRteToSprWinPct: double;

   fTrnDirtToTurfWinPct: double;
   iTrnTurfToDirtStarts: integer;

   fTrnTurfToDirtWinPct: double;
   iTrnDirtToTurfStarts: integer;

   iTrnSprToRteStarts: integer;
   iTrnRteToSprStarts: integer;

   iTotalTrnDebutStarts: integer;
   iTotalTrnDebutTwoStarts: integer;

   iTotalTrn120PlusStarts: integer;
   iTotalTrnWork120PlusStarts: integer;

   iTotalTrnAftClmStarts: integer;
   iTotalTrnTurfStarts: integer;

   iTotalTrnStarts: integer;
   iTotalJkyStarts: integer;
   iTotalTrnOddsStarts: integer;
   iTotalJkyOddsStarts: integer;
   iTotalOwnStarts: integer;

   iRouteStarts: integer;
   iSprintStarts: integer;

   iDaysLast: integer;
   iAngleChoice: integer;
   iTipChoice: integer;

   // sTrnEquibaseKey: string;
   // sJkyEquibaseKey: string;

   sAngleDesc: string;
   iLastPostPos: integer;

   sEquip: string;

   iLastSpeedRank: integer;
   iBackSpeedRank: integer;

   iFinalWinPctRank: integer;
   fFinalValueBet: double;
   fFinalWinPct: double;

   iPrimaryWinPctRank: integer;
   iSecondaryWinPctRank: integer;
   iDefaultWinPctRank: integer;

   iDamAllTurfWinPctRank: integer;
   iDamSireAllTurfWinPctRank: integer;
   iSireAllTurfWinPctRank: integer;
   iDamAllWinPctRank: integer;
   iDamSireAllWinPctRank: integer;
   iSireAllWinPctRank: integer;

   fDistanceInFurlongs: double;

   iStaCnt: integer;
   iTotalCnt: integer;

   iTrnWinsRank: integer;
   iTrnEarningsRank: integer;
   iTrnTrackRank: integer;


   iJkyWinsRank: integer;
   iJkyEarningsRank: integer;
   iJkyTrackRank: integer;

   iOwnWinsRank: integer;
   iOwnEarningsRank: integer;

   fMorningLineOddsTo1: double;

   fDamDebutWinPct: double;
   iDam2yoWinPctRank: integer;
   iSire2yoWinPctRank: integer;

   iAge: integer;

   fTotalTrn2YoWinPct: double;

   dtLocalTimeOfRace: TDateTime;
   dtEstTimeOfRace: TDateTime;
   dtEstTimeOfFirstRace: TDateTime;

   fTimeDiff: double;

   fMorningLineTo1FairProbability: double;
   fMorningLineTo1Fair: double;

   fFinalLineTo1: double;
   fFinalLineTo1Fair: double;
   fFinalLineTo1Probability: double;
   fFinalLineTo1FairProbability: double;

   fNbrStarters: double;
   fNbrDebutStarters: double;
   fNbrDebutTwoStarters: double;
   fNbrTurfDebutStarters: double;
   fNbrRouteDebutStarters: double;
   fPctOfDebutStarters: double;
   fPctOfTurfDebutStarters: double;

   fFinalME: double;
   fFinalKellyPct: double;
   fFinalExpectedProfitLossPct: double;

begin

   hLog.AddToLog('UpdateSuperJockeyTrainer', msevOperation);


   try
      try
         OpenTable(tblR);
         OpenTable(tblE);

         OpenTable(tblOwn);
         OpenTable(tblTrn);
         OpenTable(tblJky);
         OpenTable(tblTrk);

         OpenTable(tblRN);
         OpenTable(tblRNT);

         OpenTable(tblTrackLeaders);


         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;
         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();


            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Update HH Super Jockey/Trainer/Owner ');
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

               //               tblR.Edit();
               tblE.Edit();

               bSuperTrainer := False;
               bSuperJockey := False;
               bSuperOwner := False;

               //    // Trainer-Jockey-Owner rankings
    //               sTrnEquibaseKey := tblE.FieldByName('TrnEquibaseKey').AsString;
    //               tblTrn.IndexName := 'ByTrnEquibaseKey';
    //               tblTrn.SetKey();
    //               tblTrn.FieldByName('TrnEquibaseKey').AsString := sTrnEquibaseKey;
    //               iTrnWinsRank := 0;
    //               iTrnEarningsRank := 0;
    //               bSuperTrainer := False;
    //
    //               if tblTrn.GotoKey() then begin
    //                  //       tblTrn.Edit;
    //                  if (MonthOfTheYear(gedtOverrideDate) < 2) then begin
    //                     iTrnWinsRank := tblTrn.FieldByName('WinsLastYearRank').AsInteger;
    //                     iTrnEarningsRank := tblTrn.FieldByName('EarningsLastYearRank').AsInteger;
    //                     if iTrnWinsRank = 9999 then begin
    //                        iTrnWinsRank := 0;
    //                     end;
    //                     if iTrnEarningsRank = 9999 then begin
    //                        iTrnEarningsRank := 0;
    //                     end;
    //                     if (tblTrn.FieldByName('WinsLastYearRank').AsInteger < AVERAGE_T_RANK) then begin
    //                        bSuperTrainer := True;
    //                     end;
    //                     if (tblTrn.FieldByName('EarningsLastYearRank').AsInteger < AVERAGE_T_RANK) then begin
    //                        bSuperTrainer := True;
    //                     end;
    //                  end else begin
    //                     iTrnWinsRank := tblTrn.FieldByName('WinsThisYearRank').AsInteger;
    //                     iTrnEarningsRank := tblTrn.FieldByName('EarningsThisYearRank').AsInteger;
    //                     if iTrnWinsRank = 9999 then begin
    //                        iTrnWinsRank := 0;
    //                     end;
    //                     if iTrnEarningsRank = 9999 then begin
    //                        iTrnEarningsRank := 0;
    //                     end;
    //                     if (tblTrn.FieldByName('WinsThisYearRank').AsInteger < AVERAGE_T_RANK) then begin
    //                        bSuperTrainer := True;
    //                     end;
    //                     if (tblTrn.FieldByName('EarningsThisYearRank').AsInteger < AVERAGE_T_RANK) then begin
    //                        bSuperTrainer := True;
    //                     end;
    //                  end;
    //                  //                  tblTrn.FieldByName('IsSuperTrainer').AsBoolean := bSuperTrainer;
    //                  //                  tblTrn.Post;
    //               end else begin
    //                  bSuperTrainer := False;
    //               end;

               tblTrackLeaders.IndexName := '';
               tblTrackLeaders.SetKey();
               tblTrackLeaders.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblTrackLeaders.FieldByName('Name').AsString := tblTrn.FieldByName('Trainer').AsString;
               tblTrackLeaders.FieldByName('Type').AsString := 'T';
               iTrnTrackRank := 0;

               if tblTrackLeaders.GotoKey() then begin
                  iTrnTrackRank := tblTrackLeaders.FieldByName('Rank').AsInteger;
               end;

               //
             //  sJkyEquibaseKey := tblE.FieldByName('JkyEquibaseKey').AsString;
//               tblJky.IndexName := 'ByJkyEquibaseKey';
//               tblJky.SetKey();
//               tblJky.FieldByName('JkyEquibaseKey').AsString := sJkyEquibaseKey;
//               iJkyWinsRank := 0;
//               iJkyEarningsRank := 0;
//               bSuperJockey := False;
//
//               if tblJky.GotoKey() then begin
//                  //                  tblJky.Edit;
//
//                  if (MonthOfTheYear(gedtOverrideDate) < 2) then begin
//                     iJkyWinsRank := tblJky.FieldByName('WinsLastYearRank').AsInteger;
//                     iJkyEarningsRank := tblJky.FieldByName('EarningsLastYearRank').AsInteger;
//                     if iJkyWinsRank = 9999 then begin
//                        iJkyWinsRank := 0;
//                     end;
//                     if iJkyEarningsRank = 9999 then begin
//                        iJkyEarningsRank := 0;
//                     end;
//                     if (tblJky.FieldByName('WinsLastYearRank').AsInteger < AVERAGE_J_RANK) then begin
//                        bSuperJockey := True;
//                     end;
//                     if (tblJky.FieldByName('EarningsLastYearRank').AsInteger < AVERAGE_J_RANK) then begin
//                        bSuperJockey := True;
//                     end;
//                  end else begin
//                     iJkyWinsRank := tblJky.FieldByName('WinsThisYearRank').AsInteger;
//                     iJkyEarningsRank := tblJky.FieldByName('EarningsThisYearRank').AsInteger;
//                     if iJkyWinsRank = 9999 then begin
//                        iJkyWinsRank := 0;
//                     end;
//                     if iJkyEarningsRank = 9999 then begin
//                        iJkyEarningsRank := 0;
//                     end;
//                     if (tblJky.FieldByName('WinsThisYearRank').AsInteger < AVERAGE_J_RANK) then begin
//                        bSuperJockey := True;
//                     end;
//                     if (tblJky.FieldByName('EarningsThisYearRank').AsInteger < AVERAGE_J_RANK) then begin
//                        bSuperJockey := True;
//                     end;
//                  end;
//                  //                  tblJky.FieldByName('IsSuperJockey').AsBoolean := bSuperJockey;
//                  //                  tblJky.Post;
//               end else begin
//                  bSuperJockey := False;
//               end;

               tblTrackLeaders.IndexName := '';
               tblTrackLeaders.SetKey();
               tblTrackLeaders.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').AsString;
               tblTrackLeaders.FieldByName('Name').AsString := tblJky.FieldByName('Jockey').AsString;
               tblTrackLeaders.FieldByName('Type').AsString := 'J';
               iJkyTrackRank := 0;

               if tblTrackLeaders.GotoKey() then begin
                  iJkyTrackRank := tblTrackLeaders.FieldByName('Rank').AsInteger;
               end;


               //
               sOwner := tblE.FieldByName('Owner').AsString;
               tblOwn.IndexName := '';
               tblOwn.SetKey();
               tblOwn.FieldByName('Owner').AsString := UpperCase(sOwner);
               iOwnWinsRank := 0;
               iOwnEarningsRank := 0;
               bSuperOwner := False;

               if tblOwn.GotoKey() then begin
                  //                  tblOwn.Edit;

                  if (MonthOfTheYear(gedtOverrideDate) < 2) then begin
                     iOwnWinsRank := tblOwn.FieldByName('WinsLastYearRank').AsInteger;
                     iOwnEarningsRank := tblOwn.FieldByName('EarningsLastYearRank').AsInteger;
                     if iOwnWinsRank = 9999 then begin
                        iOwnWinsRank := 0;
                     end;
                     if iOwnEarningsRank = 9999 then begin
                        iOwnEarningsRank := 0;
                     end;
                     if (tblOwn.FieldByName('WinsLastYearRank').AsInteger < AVERAGE_O_RANK) then begin
                        bSuperOwner := True;
                     end;
                     if (tblOwn.FieldByName('EarningsLastYearRank').AsInteger < AVERAGE_O_RANK) then begin
                        bSuperOwner := True;
                     end;
                  end else begin
                     iOwnWinsRank := tblOwn.FieldByName('WinsThisYearRank').AsInteger;
                     iOwnEarningsRank := tblOwn.FieldByName('EarningsThisYearRank').AsInteger;
                     if iOwnWinsRank = 9999 then begin
                        iOwnWinsRank := 0;
                     end;
                     if iOwnEarningsRank = 9999 then begin
                        iOwnEarningsRank := 0;
                     end;
                     if (tblOwn.FieldByName('WinsThisYearRank').AsInteger < AVERAGE_O_RANK) then begin
                        bSuperOwner := True;
                     end;
                     if (tblOwn.FieldByName('EarningsThisYearRank').AsInteger < AVERAGE_O_RANK) then begin
                        bSuperOwner := True;
                     end;
                  end;
                  //                  tblOwn.FieldByName('IsSuperOwner').AsBoolean := bSuperOwner;
                  //                  tblOwn.Post;
               end else begin
                  bSuperOwner := False;
               end;

               tblE.FieldByName('IsSuperTrainer').AsBoolean := bSuperTrainer;

               tblE.FieldByName('IsSuperOwner').AsBoolean := bSuperOwner;
               tblE.FieldByName('IsSuperJockey').AsBoolean := bSuperJockey;

               tblE.FieldByName('TrnTrackRank').AsInteger := iTrnTrackRank;
               tblE.FieldByName('JkyTrackRank').AsInteger := iJkyTrackRank;

               tblE.FieldByName('TrnWinsRank').AsInteger := iTrnWinsRank;
               tblE.FieldByName('TrnEarningsRank').AsInteger := iTrnEarningsRank;

               tblE.FieldByName('JkyWinsRank').AsInteger := iJkyWinsRank;
               tblE.FieldByName('JkyEarningsRank').AsInteger := iJkyEarningsRank;

               tblE.FieldByName('OwnWinsRank').AsInteger := iOwnWinsRank;
               tblE.FieldByName('OwnEarningsRank').AsInteger := iOwnEarningsRank;

               tblE.Post();

               //               tblR.Post();

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
      CloseTable(tblTrk);
      CloseTable(tblRN);
      CloseTable(tblRNT);

      CloseTable(tblOwn);
      CloseTable(tblJky);
      CloseTable(tblTrn);

      CloseTable(tblTrackLeaders);

      ClearPrgStatusBars();
   end;

end;

procedure CleanHH();
var
   bNODRF: boolean;
   bNOEquibase: boolean;

begin

   try

      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      CloseTable(dm.tblRH);
      OpenTable(dm.tblRH);

      CloseTable(dm.tblEquibase);
      OpenTable(dm.tblEquibase);

      CloseTable(dm.tblDRF);
      OpenTable(dm.tblDRF);

      //      AddToDRFResults(False);
      //      AddToEquibaseResults(False);

      //      AddToDRFCharts(False);
      //      AddToEquibaseCharts(False);

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();
      while not dm.tblHH.Eof do begin
         IncPrgBar();

         //staBar.SimpleText := 'Syncing Horse History To Equibase/DRF Tables - ' +
         //   dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
         //   dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
         //   dm.tblHH.FieldByName('RaceNbr').AsString;

         bNODRF := True;
         bNOEquibase := True;

         dm.tblDRF.IndexName := '';
         dm.tblDRF.SetKey();
         dm.tblDRF.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').AsString;
         dm.tblDRF.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').AsDateTime;
         if (dm.tblDRF.GotoKey()) then begin
            bNODRF := False;
         end;

         dm.tblEquibase.IndexName := '';
         dm.tblEquibase.SetKey();
         dm.tblEquibase.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').AsString;
         dm.tblEquibase.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').AsDateTime;
         if (dm.tblEquibase.GotoKey()) then begin
            bNOEquibase := False;
         end;

         if ((bNODRF) and (bNoEquibase)) then begin
            dm.tblRH.IndexName := '';
            dm.tblRH.SetKey();
            dm.tblRH.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
            dm.tblRH.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
            dm.tblRH.FieldByName('RaceNbr').Value := dm.tblHH.FieldByName('RaceNbr').Value;

            if dm.tblRH.GotoKey() then begin
               dm.tblRH.Delete();
            end;

            dm.tblHH.Delete();
         end;


         dm.tblHH.Next();
      end;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         CloseTable(dm.tblHH);
         CloseTable(dm.tblRH);
         CloseTable(dm.tblDRF);
         CloseTable(dm.tblEquibase);
         ClearPrgStatusBars();
      end;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblDRF);
   CloseTable(dm.tblEquibase);
   ClearPrgStatusBars();

end;

//procedure TMainForm.HHToOH();
//var
//  dtStartRaceDate: TDateTime;
//  dtEndRaceDate: TDateTime;
//
//  fDamAllWinPct: double;
//  fDamAllMudWinPct: double;
//  fDamAllTurfWinPct: double;
//
//  fDamSireAllWinPct: double;
//  fDamSireAllMudWinPct: double;
//  fDamSireAllTurfWinPct: double;
//
//  fSireAllWinPct: double;
//  fSireAllMudWinPct: double;
//  fSireAllTurfWinPct: double;
//
//  fClassRating: double;
//  fTurfRating: double;
//  fMudRating: double;
//  iTransactionCount: integer;
//
//begin
//
//  try
//
//    CloseTable(dm.tblHH);
//    CloseTable(dm.tblOH);
//
//    dm.tblOH.EmptyTable();
//
//    OpenTable(dm.tblHH);
//    OpenTable(dm.tblOH);
//
//    dtStartRaceDate := Now() - 3000;
//    dtEndRaceDate := Now() - 180;
//
//    //    dm.tblHH.IndexName := 'ByRaceDate';
//
//    //    dm.tblHH.SetRangeStart;
//    //    dm.tblHH.FieldByName('RaceDate').AsDateTime := dtStartRaceDate;
//
//    //    dm.tblHH.SetRangeEnd;
//    //    dm.tblHH.FieldByName('RaceDate').AsDateTime := dtEndRaceDate;
//
//    //    dm.tblHH.ApplyRange;
//
//    //    dm.tblHH.Filtered := False;
//    //    dm.tblHH.Filter := 'FinishPos > 0 and Odds > 0';
//    //    dm.tblHH.Filtered := True;
//
//    InitPrgBar(dm.tblHH.RecordCount);
//
//    dm.tblHH.First();
//    iTransactionCount := 0;
//
//    while not dm.tblHH.Eof do begin
//      IncPrgBar();
//
//      if (dm.tblHH.FieldByName('RaceDate').AsDateTime <= dtEndRaceDate) then begin
//        if (dm.tblHH.FieldByName('FinishPos').AsInteger = 0) and (dm.tblHH.FieldByName('Odds').AsFloat = 0) then begin
//          dm.tblHH.Next();
//          continue;
//        end;
//      end;
//
//      if (dm.tblHH.FieldByName('HorseNbr').AsInteger = 0) then begin
//        dm.tblHH.Next();
//        continue;
//      end;
//
//      if (iTransactionCount = 0) then begin
//        if not dm.dbSireRate.InTransaction then begin
//          dm.dbSireRate.StartTransaction;
//          Inc(iTransactionCount);
//        end;
//      end;
//
//      dm.tblOH.Append();
//
//      dm.tblOH.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
//      dm.tblOH.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
//      dm.tblOH.FieldByName('RaceNbr').Value := dm.tblHH.FieldByName('RaceNbr').Value;
//      dm.tblOH.FieldByName('PostPos').Value := dm.tblHH.FieldByName('PostPos').Value;
//      dm.tblOH.FieldByName('RaceType').Value := dm.tblHH.FieldByName('RaceType').Value;
//      dm.tblOH.FieldByName('Surface').Value := dm.tblHH.FieldByName('Surface').Value;
//      dm.tblOH.FieldByName('TrkCond').Value := dm.tblHH.FieldByName('TrkCond').Value;
//      dm.tblOH.FieldByName('DistanceInFeet').Value := dm.tblHH.FieldByName('DistanceInFeet').Value;
//      dm.tblOH.FieldByName('DistanceInYards').Value := dm.tblHH.FieldByName('DistanceInYards').Value;
//      dm.tblOH.FieldByName('DistanceInFurlongs').Value := dm.tblHH.FieldByName('DistanceInFurlongs').Value;
//      dm.tblOH.FieldByName('Purse').Value := dm.tblHH.FieldByName('Purse').Value;
//      dm.tblOH.FieldByName('ClaimingPrice').Value := dm.tblHH.FieldByName('ClaimingPrice').Value;
//      dm.tblOH.FieldByName('ProgramNbr').Value := dm.tblHH.FieldByName('ProgramNbr').Value;
//      dm.tblOH.FieldByName('ProgNbrSort').Value := dm.tblHH.FieldByName('ProgNbrSort').Value;
//      dm.tblOH.FieldByName('MorningLineDesc').Value := dm.tblHH.FieldByName('MorningLineDesc').Value;
//      dm.tblOH.FieldByName('MorningLineTo1').Value := dm.tblHH.FieldByName('MorningLineTo1').Value;
//      dm.tblOH.FieldByName('MorningLineTo1Rank').Value := dm.tblHH.FieldByName('MorningLineTo1Rank').Value;
//      dm.tblOH.FieldByName('FinishPos').Value := dm.tblHH.FieldByName('FinishPos').Value;
//      dm.tblOH.FieldByName('Odds').Value := dm.tblHH.FieldByName('Odds').Value;
//      dm.tblOH.FieldByName('HorseName').Value := dm.tblHH.FieldByName('HorseName').Value;
//      dm.tblOH.FieldByName('HorseNbr').Value := dm.tblHH.FieldByName('HorseNbr').Value;
//      dm.tblOH.FieldByName('Sex').Value := dm.tblHH.FieldByName('Sex').Value;
//      dm.tblOH.FieldByName('Age').Value := dm.tblHH.FieldByName('Age').Value;
//      dm.tblOH.FieldByName('IsDebut').Value := dm.tblHH.FieldByName('IsDebut').Value;
//      dm.tblOH.FieldByName('IsDebutTwo').Value := dm.tblHH.FieldByName('IsDebutTwo').Value;
//      dm.tblOH.FieldByName('IsTurfDebut').Value := dm.tblHH.FieldByName('IsTurfDebut').Value;
//      dm.tblOH.FieldByName('JkyEquibaseKey').Value := dm.tblHH.FieldByName('JkyEquibaseKey').Value;
//      dm.tblOH.FieldByName('TrnEquibaseKey').Value := dm.tblHH.FieldByName('TrnEquibaseKey').Value;
//      dm.tblOH.FieldByName('SireName').Value := dm.tblHH.FieldByName('SireName').Value;
//      dm.tblOH.FieldByName('DamSireName').Value := dm.tblHH.FieldByName('DamSireName').Value;
//      dm.tblOH.FieldByName('DamName').Value := dm.tblHH.FieldByName('DamName').Value;
//      dm.tblOH.FieldByName('Owner').Value := dm.tblHH.FieldByName('Owner').Value;
//      dm.tblOH.FieldByName('Breeder').Value := dm.tblHH.FieldByName('Breeder').Value;
//      dm.tblOH.FieldByName('DaysLast').Value := dm.tblHH.FieldByName('DaysLast').Value;
//      dm.tblOH.FieldByName('DaysLastWork').Value := dm.tblHH.FieldByName('DaysLastWork').Value;
//      dm.tblOH.FieldByName('DaysLastWork2').Value := dm.tblHH.FieldByName('DaysLastWork2').Value;
//      dm.tblOH.FieldByName('DaysLastWork3').Value := dm.tblHH.FieldByName('DaysLastWork3').Value;
//      dm.tblOH.FieldByName('NbrWorksLast').Value := dm.tblHH.FieldByName('NbrWorksLast').Value;
//      dm.tblOH.FieldByName('StartsWorks21').Value := dm.tblHH.FieldByName('StartsWorks21').Value;
//      dm.tblOH.FieldByName('IsClaimed1Back').Value := dm.tblHH.FieldByName('IsClaimed1Back').Value;
//      dm.tblOH.FieldByName('IsClaimed2Back').Value := dm.tblHH.FieldByName('IsClaimed2Back').Value;
//      dm.tblOH.FieldByName('IsDirtToTurf').Value := dm.tblHH.FieldByName('IsDirtToTurf').Value;
//      dm.tblOH.FieldByName('IsTurfToDirt').Value := dm.tblHH.FieldByName('IsTurfToDirt').Value;
//      dm.tblOH.FieldByName('IsSprToRte').Value := dm.tblHH.FieldByName('IsSp/ToRte').Value;
//      dm.tblOH.FieldByName('IsRteToSpr').Value := dm.tblHH.FieldByName('IsRteToSpr').Value;
//      dm.tblOH.FieldByName('TrnTodayWinPct').Value := dm.tblHH.FieldByName('TrnTodayWinPct').Value;
//      dm.tblOH.FieldByName('TrnTodayWinPctRank').Value := dm.tblHH.FieldByName('TrnTodayWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnWinPct').Value := dm.tblHH.FieldByName('TotalTrnWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnJkyWinPct').Value := dm.tblHH.FieldByName('TotalTrnJkyWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnJkyWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnJkyWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnOwnWinPct').Value := dm.tblHH.FieldByName('TotalTrnOwnWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnOwnWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnOwnWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnDaysWinPct').Value := dm.tblHH.FieldByName('TotalTrnDaysWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnDaysWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnDaysWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnJkyDaysWinPct').Value := dm.tblHH.FieldByName('TotalTrnJkyDaysWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnJkyDaysWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnJkyDaysWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrnTurfWinPct').Value := dm.tblHH.FieldByName('TotalTrnTurfWinPct').Value;
//      dm.tblOH.FieldByName('TotalTrnTurfWinPctRank').Value := dm.tblHH.FieldByName('TotalTrnTurfWinPctRank').Value;
//
//      dm.tblOH.FieldByName('TotalTrn10WinPct').Value := dm.tblHH.FieldByName('TotalTrn10WinPct').Value;
//      dm.tblOH.FieldByName('TotalTrn10WinPctRank').Value := dm.tblHH.FieldByName('TotalTrn10WinPctRank').Value;
//      dm.tblOH.FieldByName('TotalTrn30WinPct').Value := dm.tblHH.FieldByName('TotalTrn30WinPct').Value;
//      dm.tblOH.FieldByName('TotalTrn30WinPctRank').Value := dm.tblHH.FieldByName('TotalTrn30WinPctRank').Value;
//
//      dm.tblOH.FieldByName('TotalJky10WinPct').Value := dm.tblHH.FieldByName('TotalJky10WinPct').Value;
//      dm.tblOH.FieldByName('TotalJky10WinPctRank').Value := dm.tblHH.FieldByName('TotalJky10WinPctRank').Value;
//      dm.tblOH.FieldByName('TotalJky30WinPct').Value := dm.tblHH.FieldByName('TotalJky30WinPct').Value;
//      dm.tblOH.FieldByName('TotalJky30WinPctRank').Value := dm.tblHH.FieldByName('TotalJky30WinPctRank').Value;
//
//      dm.tblOH.FieldByName('TotalJkyWinPct').Value := dm.tblHH.FieldByName('TotalJkyWinPct').Value;
//      dm.tblOH.FieldByName('TotalJkyWinPctRank').Value := dm.tblHH.FieldByName('TotalJkyWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalJkyDaysWinPct').Value := dm.tblHH.FieldByName('TotalJkyDaysWinPct').Value;
//      dm.tblOH.FieldByName('TotalJkyDaysWinPctRank').Value := dm.tblHH.FieldByName('TotalJkyDaysWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalOwnWinPct').Value := dm.tblHH.FieldByName('TotalOwnWinPct').Value;
//      dm.tblOH.FieldByName('TotalOwnWinPctRank').Value := dm.tblHH.FieldByName('TotalOwnWinPctRank').Value;
//      dm.tblOH.FieldByName('TotalBrdWinPct').Value := dm.tblHH.FieldByName('TotalBrdWinPct').Value;
//      dm.tblOH.FieldByName('TotalBrdWinPctRank').Value := dm.tblHH.FieldByName('TotalBrdWinPctRank').Value;
//      dm.tblOH.FieldByName('TrnDebutWinPct').Value := dm.tblHH.FieldByName('TrnDebutWinPct').Value;
//      dm.tblOH.FieldByName('TrnDebutWinPctRank').Value := dm.tblHH.FieldByName('TrnDebutWinPctRank').Value;
//      dm.tblOH.FieldByName('ClassRating').Value := dm.tblHH.FieldByName('ClassRating').Value;
//      dm.tblOH.FieldByName('ClassRatingRank').Value := dm.tblHH.FieldByName('ClassRatingRank').Value;
//      dm.tblOH.FieldByName('TurfRating').Value := dm.tblHH.FieldByName('TurfRating').Value;
//      dm.tblOH.FieldByName('TurfRatingRank').Value := dm.tblHH.FieldByName('TurfRatingRank').Value;
//      dm.tblOH.FieldByName('MudRating').Value := dm.tblHH.FieldByName('MudRating').Value;
//      dm.tblOH.FieldByName('MudRatingRank').Value := dm.tblHH.FieldByName('MudRatingRank').Value;
//      dm.tblOH.FieldByName('LastSpeed').Value := dm.tblHH.FieldByName('LastSpeed').Value;
//      dm.tblOH.FieldByName('LastSpeedRank').Value := dm.tblHH.FieldByName('LastSpeedRank').Value;
//      dm.tblOH.FieldByName('Power').Value := dm.tblHH.FieldByName('Power').Value;
//      dm.tblOH.FieldByName('PowerRank').Value := dm.tblHH.FieldByName('PowerRank').Value;
//      dm.tblOH.FieldByName('BackSpeed').Value := dm.tblHH.FieldByName('BackSpeed').Value;
//      dm.tblOH.FieldByName('BackSpeedRank').Value := dm.tblHH.FieldByName('BackSpeedRank').Value;
//      dm.tblOH.FieldByName('EarlyPace').Value := dm.tblHH.FieldByName('EarlyPace').Value;
//      dm.tblOH.FieldByName('EarlyPaceRank').Value := dm.tblHH.FieldByName('EarlyPaceRank').Value;
//      dm.tblOH.FieldByName('MiddlePace').Value := dm.tblHH.FieldByName('MiddlePace').Value;
//      dm.tblOH.FieldByName('MiddlePaceRank').Value := dm.tblHH.FieldByName('MiddlePaceRank').Value;
//      dm.tblOH.FieldByName('LatePace').Value := dm.tblHH.FieldByName('LatePace').Value;
//      dm.tblOH.FieldByName('LatePaceRank').Value := dm.tblHH.FieldByName('LatePaceRank').Value;
//
//      dm.tblOH.FieldByName('EarlyPacePos').Value := dm.tblHH.FieldByName('EarlyPacePos').Value;
//      dm.tblOH.FieldByName('EarlyPacePosRank').Value := dm.tblHH.FieldByName('EarlyPacePosRank').Value;
//      dm.tblOH.FieldByName('MiddlePacePos').Value := dm.tblHH.FieldByName('MiddlePacePos').Value;
//      dm.tblOH.FieldByName('MiddlePacePosRank').Value := dm.tblHH.FieldByName('MiddlePacePosRank').Value;
//      dm.tblOH.FieldByName('LatePacePos').Value := dm.tblHH.FieldByName('LatePacePos').Value;
//      dm.tblOH.FieldByName('LatePacePosRank').Value := dm.tblHH.FieldByName('LatePacePosRank').Value;
//
//      dm.tblOH.FieldByName('AvgClass').Value := dm.tblHH.FieldByName('AvgClass').Value;
//      dm.tblOH.FieldByName('AvgClassRank').Value := dm.tblHH.FieldByName('AvgClassRank').Value;
//      dm.tblOH.FieldByName('FinalOrderKey').Value := dm.tblHH.FieldByName('FinalOrderKey').Value;
//      dm.tblOH.FieldByName('FinalStarts').Value := dm.tblHH.FieldByName('FinalStarts').Value;
//      dm.tblOH.FieldByName('FinalWins').Value := dm.tblHH.FieldByName('FinalWins').Value;
//      dm.tblOH.FieldByName('FinalWinPct').Value := dm.tblHH.FieldByName('FinalWinPct').Value;
//      dm.tblOH.FieldByName('FinalWinPctRank').Value := dm.tblHH.FieldByName('FinalWinPctRank').Value;
//      dm.tblOH.FieldByName('FinalAvgOdds').Value := dm.tblHH.FieldByName('FinalAvgOdds').Value;
//      dm.tblOH.FieldByName('FinalTotalProfitLoss').Value := dm.tblHH.FieldByName('FinalTotalProfitLoss').Value;
//      dm.tblOH.FieldByName('FinalValueBet').Value := dm.tblHH.FieldByName('FinalValueBet').Value;
//      dm.tblOH.FieldByName('FinalValueBetRank').Value := dm.tblHH.FieldByName('FinalValueBetRank').Value;
//      dm.tblOH.FieldByName('IsFinalValue').Value := dm.tblHH.FieldByName('IsFinalValue').Value;
//      dm.tblOH.FieldByName('IsChalkValue').Value := dm.tblHH.FieldByName('IsChalkValue').Value;
//      dm.tblOH.FieldByName('IsPlayableValue').Value := dm.tblHH.FieldByName('IsPlayableValue').Value;
//      dm.tblOH.FieldByName('Speed1Back').Value := dm.tblHH.FieldByName('Speed1Back').Value;
//      dm.tblOH.FieldByName('Speed2Back').Value := dm.tblHH.FieldByName('Speed2Back').Value;
//      dm.tblOH.FieldByName('Speed3Back').Value := dm.tblHH.FieldByName('Speed3Back').Value;
//      dm.tblOH.FieldByName('Speed4Back').Value := dm.tblHH.FieldByName('Speed4Back').Value;
//      dm.tblOH.FieldByName('Speed5Back').Value := dm.tblHH.FieldByName('Speed5Back').Value;
//      dm.tblOH.FieldByName('DamAllWinPct').Value := dm.tblHH.FieldByName('DamAllWinPct').Value;
//      dm.tblOH.FieldByName('DamAllWinPctRank').Value := dm.tblHH.FieldByName('DamAllWinPctRank').Value;
//      dm.tblOH.FieldByName('DamAllTurfWinPct').Value := dm.tblHH.FieldByName('DamAllTurfWinPct').Value;
//      dm.tblOH.FieldByName('DamAllTurfWinPctRank').Value := dm.tblHH.FieldByName('DamAllTurfWinPctRank').Value;
//      dm.tblOH.FieldByName('DamAllMudWinPct').Value := dm.tblHH.FieldByName('DamAllMudWinPct').Value;
//      dm.tblOH.FieldByName('DamAllMudWinPctRank').Value := dm.tblHH.FieldByName('DamAllMudWinPctRank').Value;
//      dm.tblOH.FieldByName('SireAllWinPct').Value := dm.tblHH.FieldByName('SireAllWinPct').Value;
//      dm.tblOH.FieldByName('SireAllWinPctRank').Value := dm.tblHH.FieldByName('SireAllWinPctRank').Value;
//      dm.tblOH.FieldByName('SireAllTurfWinPct').Value := dm.tblHH.FieldByName('SireAllTurfWinPct').Value;
//      dm.tblOH.FieldByName('SireAllTurfWinPctRank').Value := dm.tblHH.FieldByName('SireAllTurfWinPctRank').Value;
//      dm.tblOH.FieldByName('SireAllMudWinPct').Value := dm.tblHH.FieldByName('SireAllMudWinPct').Value;
//      dm.tblOH.FieldByName('SireAllMudWinPctRank').Value := dm.tblHH.FieldByName('SireAllMudWinPctRank').Value;
//      dm.tblOH.FieldByName('DamSireAllWinPct').Value := dm.tblHH.FieldByName('DamSireAllWinPct').Value;
//      dm.tblOH.FieldByName('DamSireAllWinPctRank').Value := dm.tblHH.FieldByName('DamSireAllWinPctRank').Value;
//      dm.tblOH.FieldByName('DamSireAllTurfWinPct').Value := dm.tblHH.FieldByName('DamSireAllTurfWinPct').Value;
//      dm.tblOH.FieldByName('DamSireAllTurfWinPctRank').Value := dm.tblHH.FieldByName('DamSireAllTurfWinPctRank').Value;
//      dm.tblOH.FieldByName('DamSireAllMudWinPct').Value := dm.tblHH.FieldByName('DamSireAllMudWinPct').Value;
//      dm.tblOH.FieldByName('DamSireAllMudWinPctRank').Value := dm.tblHH.FieldByName('DamSireAllMudWinPctRank').Value;
//
//      fDamAllWinPct := dm.tblOH.FieldByName('DamAllWinPct').AsFloat;
//      fDamAllMudWinPct := dm.tblOH.FieldByName('DamAllMudWinPct').AsFloat;
//      fDamAllTurfWinPct := dm.tblOH.FieldByName('DamAllTurfWinPct').AsFloat;
//
//      fDamSireAllWinPct := dm.tblOH.FieldByName('DamSireAllWinPct').AsFloat;
//      fDamSireAllMudWinPct := dm.tblOH.FieldByName('DamSireAllMudWinPct').AsFloat;
//      fDamSireAllTurfWinPct := dm.tblOH.FieldByName('DamSireAllTurfWinPct').AsFloat;
//
//      fSireAllWinPct := dm.tblOH.FieldByName('SireAllWinPct').AsFloat;
//      fSireAllMudWinPct := dm.tblOH.FieldByName('SireAllMudWinPct').AsFloat;
//      fSireAllTurfWinPct := dm.tblOH.FieldByName('SireAllTurfWinPct').AsFloat;
//
//      if (fDamAllWinPct > 0) then begin
//        fClassRating := ((fDamAllWinPct / 100) * (fSireAllWinPct / 100)) * 1000;
//      end else begin
//        fClassRating := ((fDamSireAllWinPct / 100) * (fSireAllWinPct / 100)) * 1000;
//      end;
//
//      if (fDamAllTurfWinPct > 0) then begin
//        fTurfRating := ((fDamAllTurfWinPct / 100) * (fSireAllTurfWinPct / 100)) * 1000;
//      end else begin
//        fTurfRating := ((fDamSireAllTurfWinPct / 100) * (fSireAllTurfWinPct / 100)) * 1000;
//      end;
//
//      if (fDamAllMudWinPct > 0) then begin
//        fMudRating := ((fDamAllMudWinPct / 100) * (fSireAllMudWinPct / 100)) * 1000;
//      end else begin
//        fMudRating := ((fDamSireAllMudWinPct / 100) * (fSireAllMudWinPct / 100)) * 1000;
//      end;
//
//      dm.tblOH.FieldByName('ClassRating').Value := fClassRating;
//      dm.tblOH.FieldByName('TurfRating').Value := fTurfRating;
//      dm.tblOH.FieldByName('MudRating').Value := fMudRating;
//
//      dm.tblOH.Post();
//
//      if (iTransactionCount > 2000) then begin
//        if dm.dbSireRate.InTransaction then begin
//          dm.dbSireRate.Commit;
//        end;
//        iTransactionCount := 0;
//        staBar.SimpleText := 'Adding To OH - ' +
//          dm.tblHH.FieldByName('TrkCode') + ' ' +
//          dm.tblHH.FieldByName('RaceDate') + ' Race # ' +
//          dm.tblHH.FieldByName('RaceNbr');
//
//        Application.ProcessMessages();
//
//      end else begin
//        Inc(iTransactionCount);
//      end;
//
//      dm.tblHH.Next();
//    end;
//
//  except
//    if (iTransactionCount > 0) then begin
//      if dm.dbSireRate.InTransaction then begin
//        dm.dbSireRate.Rollback;
//      end;
//    end;
//
//    //    dm.tblHH.CancelRange;
//    //    dm.tblHH.Filtered := False;
//    //    dm.tblHH.IndexName := '';
//    CloseTable(dm.tblHH);
//    CloseTable(dm.tblOH);
//    ClearPrgStatusBars();
//  end;
//
//  if dm.dbSireRate.InTransaction then begin
//    dm.dbSireRate.Commit;
//  end;
//  //  dm.tblHH.CancelRange;
//  //  dm.tblHH.Filtered := False;
//  //  dm.tblHH.IndexName := '';
//
//  CloseTable(dm.tblOH);
//  CloseTable(dm.tblHH);
//  ClearPrgStatusBars();
//
//end;

procedure DeleteHH();
begin

   //TimerOn(False);

   try

      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      qrySQL.Sql.Add('DELETE ');
      qrySQL.Sql.Add('FROM HorseHistory ');
      qrySQL.Sql.Add('WHERE IsDeleteMe = True ');
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.ExecSQL;

      qrySQL.Close;
      qrySQL.Unprepare;
      qrySQL.Sql.Clear();
      qrySQL.Sql.Add('DELETE ');
      qrySQL.Sql.Add('FROM RaceHistory ');
      qrySQL.Sql.Add('WHERE IsDeleteMe = True ');
      qrySQL.RequestLive := True;
      qrySQL.Prepare;
      qrySQL.ExecSQL;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

   //   TimerOn(True);

end;

procedure UpdateRH(Sender: TObject);
var
   bActive: boolean;
   bIsUsedInRankings: boolean;
begin

   try
      TimerOn(False);
      CloseTable(dm.tblRH);
      CloseTable(dm.tblTrack);
      OpenTable(dm.tblRH);
      OpenTable(dm.tblTrack);

      InitPrgBar(dm.tblRH.RecordCount);

      dm.tblRH.First();

      while not dm.tblRH.Eof do begin
         IncPrgBar();

         MainForm.staBar.SimpleText := 'Updating Race History - ' +
            dm.tblRH.FieldByName('TrkCode').AsString + ' ' +
            dm.tblRH.FieldByName('RaceDate').AsString + ' Race # ' +
            dm.tblRH.FieldByName('RaceNbr').AsString;

         Application.ProcessMessages();

         bActive := False;

         dm.tblTrack.IndexName := '';
         dm.tblTrack.SetKey();
         dm.tblTrack.FieldByName('TrkCode').Value := dm.tblRH.FieldByName('TrkCode').AsString;
         if dm.tblTrack.GotoKey() then begin
            bActive := dm.tblTrack.FieldByName('IsActive').AsBoolean;
            //            bIsUsedInRankings := dm.tblTrack.FieldByName('IsUsedInRankings').AsBoolean;
         end;

         dm.tblRH.Edit();
         //         dm.tblRH.FieldByName('IsUsedInRankings').AsBoolean := bIsUseInRankings;
         dm.tblRH.Post();

         dm.tblRH.Next();
      end;


   finally
      TimerOn(True);
      CloseTable(dm.tblTrack);
      CloseTable(dm.tblRH);
      ClearPrgStatusBars();
   end;

end;

//procedure TPreviousDaysByDayReportForm.FldWagers();
//
//if (bCreateWagerTable) then begin
//
//   tblWagersByML.IndexName := '';
//   tblWagersByML.SetKey();
//   tblWagersByML.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
//   if (tblWagersByML.GotoKey()) then begin
//      tblWagersByML.Edit();
//      FldWagers();
//      tblWagersByML.Post();
//   end else begin
//      tblWagersByML.Append();
//      tblWagersByML.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
//      FldWagers();
//      tblWagersByML.Post();
//   end;
//
//   //      tblWagersByMLTrkCode.IndexName := '';
//   //      tblWagersByMLTrkCode.SetKey();
//   //      tblWagersByMLTrkCode.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
//   //      if (tblWagersByMLTrkCode.GotoKey()) then begin
//   //         tblWagersByMLTrkCode.Edit();
//   //         FldWagersTrkCode();
//   //         tblWagersByMLTrkCode.Post();
//   //      end else begin
//   //         tblWagersByMLTrkCode.Append();
//   //         tblWagersByMLTrkCode.FieldByName('MorningLineTo1').AsFloat := varFldName.FieldValue;
//   //         FldWagersTrkCode();
//   //         tblWagersByMLTrkCode.Post();
//   //      end;
//
//
//end;


//procedure TMainForm.btnDownloadDaysClick(Sender: TObject);
//varStarts.AsInteger := 0;
//varWins.AsInteger := 0;
//varPlcs.AsInteger := 0;
//varShos.AsInteger := 0;
//
//varAvgOdds.AsDouble := 0;
//varTotalOdds.AsDouble := 0;
//
//varWinWagered.AsDouble := 0;
//varWinPL.AsDouble := 0;
//varWinPayout.AsDouble := 0;
//varWinPLPct.AsDouble := 0;
//
//varPlcWagered.AsDouble := 0;
//varPlcPL.AsDouble := 0;
//varPlcPayout.AsDouble := 0;
//varPlcPLPct.AsDouble := 0;
//
//varShoWagered.AsDouble := 0;
//varShoPL.AsDouble := 0;
//varShoPayout.AsDouble := 0;
//varShoPLPct.AsDouble := 0;
//
//varDDWagered.AsDouble := 0;
//varDDPL.AsDouble := 0;
//varDDPayout.AsDouble := 0;
//varDDPLPct.AsDouble := 0;
//varDDNbrWagers.AsInteger := 0;
//varDDWinPct.AsDouble := 0;
//varDDAvgPayout.AsDouble := 0;
//
//varSfcWagered.AsDouble := 0;
//varSfcPL.AsDouble := 0;
//varSfcPayout.AsDouble := 0;
//varSfcPLPct.AsDouble := 0;
//varSfcNbrWagers.AsInteger := 0;
//varSfcWinPct.AsDouble := 0;
//varSfcAvgPayout.AsDouble := 0;
//
//varTriWagered.AsDouble := 0;
//varTriPL.AsDouble := 0;
//varTriPayout.AsDouble := 0;
//varTriPLPct.AsDouble := 0;
//varTriNbrWagers.AsInteger := 0;
//varTriWinPct.AsDouble := 0;
//varTriAvgPayout.AsDouble := 0;
//
//varPk3Wagered.AsDouble := 0;
//varPk3PL.AsDouble := 0;
//varPk3Payout.AsDouble := 0;
//varPk3PLPct.AsDouble := 0;
//varPk3NbrWagers.AsInteger := 0;
//varPk3WinPct.AsDouble := 0;
//varPk3AvgPayout.AsDouble := 0;
//
//varPk4Wagered.AsDouble := 0;
//varPk4PL.AsDouble := 0;
//varPk4Payout.AsDouble := 0;
//varPk4PLPct.AsDouble := 0;
//varPk4NbrWagers.AsInteger := 0;
//varPk4WinPct.AsDouble := 0;
//varPk4AvgPayout.AsDouble := 0;
//
//varExaWagered.AsDouble := 0;
//varExaPL.AsDouble := 0;
//varExaPayout.AsDouble := 0;
//varExaPLPct.AsDouble := 0;
//varExaNbrWagers.AsInteger := 0;
//varExaWinPct.AsDouble := 0;
//varExaAvgPayout.AsDouble := 0;
//
//varQuiWagered.AsDouble := 0;
//varQuiPL.AsDouble := 0;
//varQuiPayout.AsDouble := 0;
//varQuiPLPct.AsDouble := 0;
//varQuiNbrWagers.AsInteger := 0;
//varQuiWinPct.AsDouble := 0;
//varQuiAvgPayout.AsDouble := 0;
//
//varWPSPL.AsDouble := 0;
//varTriSfcPL.AsDouble := 0;
//varExaQuiPL.AsDouble := 0;
//varDDPK3PL.AsDouble := 0;
//varPk4Pk6PL.AsDouble := 0;
//varWinDDPk3PL.AsDouble := 0;
//
//end;
//
//
//procedure TPreviousDaysByDayReportForm.FldWagers();
//begin
//
//   tblResults.FieldByName('Starts').AsInteger := varStarts.AsInteger;
//   tblWagersByML.FieldByName('Wins').AsInteger := varWins.AsInteger;
//   tblWagersByML.FieldByName('Plcs').AsInteger := varPlcs.AsInteger;
//   tblWagersByML.FieldByName('Shos').AsInteger := varShos.AsInteger;
//
//   tblWagersByML.FieldByName('AvgOdds').AsFloat := Round(varAvgOdds.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TotalOdds').AsFloat := Round(varTotalOdds.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('WinWagered').AsFloat := Round(varWinWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('WinPL').AsFloat := Round(varWinPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('WinPayout').AsFloat := Round(varWinPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('WinPLPct').AsFloat := Round(varWinPLPct.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('PlcWagered').AsFloat := Round(varPlcWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('PlcPL').AsFloat := Round(varPlcPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('PlcPayout').AsFloat := Round(varPlcPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('PlcPLPct').AsFloat := Round(varPlcPLPct.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('ShoWagered').AsFloat := Round(varShoWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('ShoPL').AsFloat := Round(varShoPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ShoPayout').AsFloat := Round(varShoPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ShoPLPct').AsFloat := Round(varShoPLPct.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('DDWagered').AsFloat := Round(varDDWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('DDPL').AsFloat := Round(varDDPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('DDPayout').AsFloat := Round(varDDPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('DDPLPct').AsFloat := Round(varDDPLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('DDNbrWagers').AsInteger := varDDNbrWagers.AsInteger;
//   tblWagersByML.FieldByName('DDWinPct').AsFloat := Round(varDDWinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('DDAvgPayout').AsFloat := Round(varDDAvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('SfcWagered').AsFloat := Round(varSfcWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('SfcPL').AsFloat := Round(varSfcPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('SfcPayout').AsFloat := Round(varSfcPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('SfcPLPct').AsFloat := Round(varSfcPLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('SfcNbrWagers').AsInteger := varSfcNbrWagers.AsInteger;
//   tblWagersByML.FieldByName('SfcWinPct').AsFloat := Round(varSfcWinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('SfcAvgPayout').AsFloat := Round(varSfcAvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('TriWagered').AsFloat := Round(varTriWagered.AsDouble * 100) / 100; ;
//   tblWagersByML.FieldByName('TriPL').AsFloat := Round(varTriPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TriPayout').AsFloat := Round(varTriPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TriPLPct').AsFloat := Round(varTriPLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TriNbrWagers').AsInteger := varTriNbrWagers.AsInteger;
//   tblWagersByML.FieldByName('TriWinPct').AsFloat := Round(varTriWinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TriAvgPayout').AsFloat := Round(varTriAvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('Pk3Wagered').AsFloat := Round(varPk3Wagered.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk3PL').AsFloat := Round(varPk3PL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk3Payout').AsFloat := Round(varPk3Payout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk3PLPct').AsFloat := Round(varPk3PLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk3NbrWagers').AsInteger := varPk3NbrWagers.AsInteger;
//   tblWagersByML.FieldByName('Pk3WinPct').AsFloat := Round(varPk3WinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk3AvgPayout').AsFloat := Round(varPk3AvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('Pk4Wagered').AsFloat := Round(varPk4Wagered.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4PL').AsFloat := Round(varPk4PL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4Payout').AsFloat := Round(varPk4Payout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4PLPct').AsFloat := Round(varPk4PLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4NbrWagers').AsInteger := varPk4NbrWagers.AsInteger;
//   tblWagersByML.FieldByName('Pk4WinPct').AsFloat := Round(varPk4WinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4AvgPayout').AsFloat := Round(varPk4AvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('ExaWagered').AsFloat := Round(varExaWagered.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaPL').AsFloat := Round(varExaPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaPayout').AsFloat := Round(varExaPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaPLPct').AsFloat := Round(varExaPLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaNbrWagers').AsInteger := varExaNbrWagers.AsInteger;
//   tblWagersByML.FieldByName('ExaWinPct').AsFloat := Round(varExaWinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaAvgPayout').AsFloat := Round(varExaAvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('QuiWagered').AsFloat := Round(varQuiWagered.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('QuiPL').AsFloat := Round(varQuiPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('QuiPayout').AsFloat := Round(varQuiPayout.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('QuiPLPct').AsFloat := Round(varQuiPLPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('QuiNbrWagers').AsInteger := varQuiNbrWagers.AsInteger;
//   tblWagersByML.FieldByName('QuiWinPct').AsFloat := Round(varQuiWinPct.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('QuiAvgPayout').AsFloat := Round(varQuiAvgPayout.AsDouble * 100) / 100;
//
//   tblWagersByML.FieldByName('WPSPL').AsFloat := Round(varWPSPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('TriSfcPL').AsFloat := Round(varTriSfcPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('ExaQuiPL').AsFloat := Round(varExaQuiPL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('DDPK3PL').AsFloat := Round(varDDPK3PL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('Pk4Pk6PL').AsFloat := Round(varPk4Pk6PL.AsDouble * 100) / 100;
//   tblWagersByML.FieldByName('WinDDPk3PL').AsFloat := Round(varWinDDPk3PL.AsDouble * 100) / 100;
//
//end;

procedure UpdateAxcisRHAndHHEntry(lRecNo: Longint);
var
   bFinished: boolean;
   fStarts: double;
   fWinPct: double;
   fWins: double;
   sCurrRaceNbr: string;
   sRaceNbr: string;

begin
   try

      dmDBF.dbfEntry.PhysicalRecNo := lRecNo;

      sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      sCurrRaceNbr := dmDBF.dbfRace.FieldByName('RACE').AsString;
      bFinished := False;
      while (sRaceNbr = sCurrRaceNbr) and (not bFinished) do begin

         if (sRaceNbr <> sCurrRaceNbr) then begin
            exit;
         end;
         if (dmDBF.dbfEntry.Eof) then begin
            bFinished := True;
         end;

         dm.tblHH.IndexName := '';
         dm.tblHH.SetKey();
         dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
         dm.tblHH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

         dm.tblHH.FieldByName('RaceNbr').AsInteger := atoi(dmDBF.dbfRace.FieldByName('RACE').AsString);
         dm.tblHH.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
         dm.tblHH.FieldByName('PostPos').AsInteger := atoi(dmDBF.dbfEntry.FieldByName('PP').AsString);

         try
            if (dm.tblHH.GotoKey()) then begin
               if dm.tblHH.RecordID > 0 then begin
                  dm.tblHH.Edit();
                  dm.tblHH.Post();
               end;
               Application.ProcessMessages();
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
         dmDBF.dbfEntry.Next();
         sRaceNbr := dmDBF.dbfEntry.FieldByName('RACE').AsString;
      end;
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;
end;

procedure ExportToNexus(t: TDBISAMTable; sPath: string);
begin

   try
      t.Active := True;
      try
         t.ExportTable(sPath + t.TableName + '.csv', ',', True);
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;
   finally
      t.Active := False;
   end;

end;

procedure UpdateAxcisRHAndHHRaceEntry(
   sRaceFileName: string;
   sEntryFileName: string;
   sDamFileName: string;
   sSireFileName: string;
   sPastFileName: string;
   sMatchupFileName: string;
   sTrainerFileName: string;
   sJockeyFileName: string
   );
var
   lRecNo: Longint;
   bFinished: Boolean;
   sCurrTrkCode: string;
   sSendTrkCode: string;
   sSurfDisp: string;
   sTmp: string;

begin

   try

      dmDBF.dbfRace.Active := False;
      dmDBF.dbfRace.TableName := sRaceFileName;
      dmDBF.dbfRace.FilePath := AXCIS_PATH;
      dmDBF.dbfRace.FilePathFull := AXCIS_PATH;
      dmDBF.dbfRace.Active := True;

      dmDBF.dbfEntry.Active := False;
      dmDBF.dbfEntry.TableName := sEntryFileName;
      dmDBF.dbfEntry.FilePath := AXCIS_PATH;
      dmDBF.dbfEntry.FilePathFull := AXCIS_PATH;
      dmDBF.dbfEntry.Active := True;

      dmDBF.dbfDam.Active := False;
      dmDBF.dbfDam.TableName := sDamFileName;
      dmDBF.dbfDam.FilePath := AXCIS_PATH;
      dmDBF.dbfDam.FilePathFull := AXCIS_PATH;
      dmDBF.dbfDam.Active := True;

      dmDBF.dbfSire.Active := False;
      dmDBF.dbfSire.TableName := sSireFileName;
      dmDBF.dbfSire.FilePath := AXCIS_PATH;
      dmDBF.dbfSire.FilePathFull := AXCIS_PATH;
      dmDBF.dbfSire.Active := True;

      dmDBF.dbfTrainer.Active := False;
      dmDBF.dbfTrainer.TableName := sTrainerFileName;
      dmDBF.dbfTrainer.FilePath := AXCIS_PATH;
      dmDBF.dbfTrainer.FilePathFull := AXCIS_PATH;
      dmDBF.dbfTrainer.Active := True;

      dmDBF.dbfJockey.Active := False;
      dmDBF.dbfJockey.TableName := sJockeyFileName;
      dmDBF.dbfJockey.FilePath := AXCIS_PATH;
      dmDBF.dbfJockey.FilePathFull := AXCIS_PATH;
      dmDBF.dbfJockey.Active := True;

      dmDBF.dbfPast.Active := False;
      dmDBF.dbfPast.TableName := sPastFileName;
      dmDBF.dbfPast.FilePath := AXCIS_PATH;
      dmDBF.dbfPast.FilePathFull := AXCIS_PATH;
      dmDBF.dbfPast.Active := True;

      dmDBF.dbfMatchup.Active := False;
      dmDBF.dbfMatchup.TableName := sMatchupFileName;
      dmDBF.dbfMatchup.FilePath := AXCIS_PATH;
      dmDBF.dbfMatchup.FilePathFull := AXCIS_PATH;
      dmDBF.dbfMatchup.Active := True;

   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         dmDBF.dbfRace.Active := False;
         dmDBF.dbfEntry.Active := False;
         dmDBF.dbfDam.Active := False;
         dmDBF.dbfSire.Active := False;
         dmDBF.dbfTrainer.Active := False;
         dmDBF.dbfJockey.Active := False;
         dmDBF.dbfPast.Active := False;
         dmDBF.dbfMatchup.Active := False;
         ClearPrgStatusBars();
      end;
   end;

   try
      OpenTable(dm.tblRH);
      OpenTable(dm.tblHH);


      UpdateStatusBar('Loading ' + sRaceFileName);

      InitPrgBar(dmDBF.dbfRace.RecordCount);

      dmDBF.dbfRace.First;

      bFinished := False;
      while (not bFinished) do begin
         IncPrgBar();

         if (dmDBF.dbfRace.Eof) then begin
            bFinished := True;
         end;

         sCurrTrkCode := dmDBF.dbfRace.FieldByName('TRACK').AsString;
         sSendTrkCode := dmDBF.dbfRace.FieldByName('SEND_TRACK').AsString;

         sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
         if (SmartPos('q', sSurfDisp) > 0) or (SmartPos('o', sSurfDisp) > 0) then begin
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'q', '', True);
            sCurrTrkCode := FastReplace(sCurrTrkCode, 'o', '', True);
            sSendTrkCode := FastReplace(sSendTrkCode, 'q', '', True);
            sSendTrkCode := FastReplace(sSendTrkCode, 'o', '', True);
         end;

         // Special For TDN, RD, BEU
         if sCurrTrkCode = 'TDN' then begin
            sFileTrkCode := 'TDN';
         end;
         if sCurrTrkCode = 'RD' then begin
            sFileTrkCode := 'RD';
         end;
         if sCurrTrkCode = 'BEU' then begin
            sFileTrkCode := 'BEU';
         end;

         if (sCurrTrkCode = sFileTrkCode) then begin
            UpdateStatusBar('Importing ' + dmDBF.dbfRace.FieldByName('TRACK').AsString + ' ' + DateToStr(dtAxcisRaceDate) + ' ' +
               dmDBF.dbfRace.FieldByName('RACE').AsString);

            lRecNo := atol(dmDBF.dbfRace.FieldByName('HORSE1').AsString);

            //*** Skip Quarter Horse Races
            sSurfDisp := dmDBF.dbfRace.FieldByName('SURF_DISP').AsString;
            dm.tblRH.IndexName := '';
            dm.tblRH.SetKey();
            dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' q', '', True);
            dm.tblRH.FieldByName('TrkCode').AsString := FastReplace(dmDBF.dbfRace.FieldByName('TRACK').AsString, ' o', '', True);

            dm.tblRH.FieldByName('RaceNbr').Value := dmDBF.dbfRace.FieldByName('RACE').AsString;
            dm.tblRH.FieldByName('RaceDate').Value := dtAxcisRaceDate;

            if (dm.tblRH.GotoKey()) then begin
               dm.tblRH.Edit();

               sTmp := UpperCase(dmDBF.dbfRace.FieldByName('BET_OPT').AsString);

               //
               dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 0;
               dm.tblRH.FieldByName('Pk3RaceNbr').AsInteger := 0;
               dm.tblRH.FieldByName('Pk4RaceNbr').AsInteger := 0;
               dm.tblRH.FieldByName('Pk6RaceNbr').AsInteger := 0;

               //
               //$2 DAILY DOUBLE
               if (SmartPos('DAILY DOUBLE', sTmp) > 0) or (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;
               // RET
               if (SmartPos('/ DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               if (SmartPos('FIRST HALF LATE DOUBLE', sTmp) > 0) or (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;


               if (SmartPos('1ST HALF $2 DAILY DOUBLE', sTmp) > 0) or (SmartPos('ROLLING DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := True;
                  iDDRace := 2;
               end;

               if (iDDRace > 0) then begin
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 3 - iDDRace;
                  Dec(iDDRace);
               end else begin
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := False;
               end;

               //MNR
               if (SmartPos('SECOND HALF $2 DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               if (SmartPos('SECOND HALF $2 LATE DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //PEN
               if (SmartPos('SECOND HALF EARLY DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;


               if (SmartPos('2ND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;


               if (SmartPos('2ND HALF EARLY DD', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;
               if (SmartPos('2ND HALF LATE DD', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //
               if (SmartPos('SECOND HALF DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;
               if (SmartPos('2ND HALF DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;

               //
               if (SmartPos('SECOND HALF LATE DAILY DOUBLE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsDDLeg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsDDRace').AsBoolean := True;
                  dm.tblRH.FieldByName('DDRaceNbr').AsInteger := 2;
                  iDDRace := 0;
               end;


               //
               if ((SmartPos('PICK 3', sTmp) > 0) or (SmartPos('PICK THREE', sTmp) > 0) or (SmartPos('PIC THREE', sTmp) > 0)) then begin
                  dm.tblRH.FieldByName('IsPK3Leg1').AsBoolean := True;
                  iPk3Race := 3;
               end;
               if (iPk3Race > 0) then begin
                  dm.tblRH.FieldByName('IsPK3Race').AsBoolean := True;
                  dm.tblRH.FieldByName('Pk3RaceNbr').AsInteger := 4 - iPk3Race;
                  Dec(iPk3Race);
               end else begin
                  dm.tblRH.FieldByName('IsPK3Race').AsBoolean := False;
               end;


               if (SmartPos('1ST LEG PICK THREE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('Pk3RaceNbr').AsInteger := 1;
                  dm.tblRH.FieldByName('IsPK3Leg1').AsBoolean := True;
                  dm.tblRH.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               if (SmartPos('2ND LEG PICK THREE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('Pk3RaceNbr').AsInteger := 3;
                  dm.tblRH.FieldByName('IsPK3Leg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               if (SmartPos('3RD LEG PICK THREE', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('Pk3RaceNbr').AsInteger := 3;
                  dm.tblRH.FieldByName('IsPK3Leg1').AsBoolean := False;
                  dm.tblRH.FieldByName('IsPK3Race').AsBoolean := True;
               end;

               //
               if (SmartPos('PICK 4', sTmp) > 0) or (SmartPos('PICK FOUR', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsPk4Leg1').AsBoolean := True;
                  iPk4Race := 4;
               end;
               if (iPk4Race > 0) then begin
                  dm.tblRH.FieldByName('IsPk4Race').AsBoolean := True;
                  dm.tblRH.FieldByName('Pk4RaceNbr').AsInteger := 5 - iPk4Race;
                  Dec(iPk4Race);
               end else begin
                  dm.tblRH.FieldByName('IsPk4Race').AsBoolean := False;
               end;

               //
               if (SmartPos('PICK 6', sTmp) > 0) or (SmartPos('PICK SIX', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsPk6Leg1').AsBoolean := True;
                  iPk6Race := 6;
               end;
               if (iPk6Race > 0) then begin
                  dm.tblRH.FieldByName('IsPk6Race').AsBoolean := True;
                  dm.tblRH.FieldByName('Pk6RaceNbr').AsInteger := 7 - iPk6Race;
                  Dec(iPk6Race);
               end else begin
                  dm.tblRH.FieldByName('IsPk6Race').AsBoolean := False;
               end;

               //
               if SmartPos('SUPERFECTA', sTmp) > 0 then begin
                  dm.tblRH.FieldByName('IsSuperRace').AsBoolean := True;
               end else begin
                  dm.tblRH.FieldByName('IsSuperRace').AsBoolean := False;
               end;

               //
               if ((SmartPos('TRIFECTA', sTmp) > 0) or (SmartPos('TRIACTOR', sTmp) > 0)) then begin
                  dm.tblRH.FieldByName('IsTriRace').AsBoolean := True;
               end else begin
                  dm.tblRH.FieldByName('IsTriRace').AsBoolean := False;
               end;

               //
               if ((SmartPos('EXACTA', sTmp) > 0) or (SmartPos('EXACTOR', sTmp) > 0) or (SmartPos('PERFECTA', sTmp) > 0)) then begin
                  dm.tblRH.FieldByName('IsExaRace').AsBoolean := True;
               end else begin
                  dm.tblRH.FieldByName('IsExaRace').AsBoolean := False;
               end;

               //
               if (SmartPos('QUINELLA', sTmp) > 0) then begin
                  dm.tblRH.FieldByName('IsQuiRace').AsBoolean := True;
               end else begin
                  dm.tblRH.FieldByName('IsQuiRace').AsBoolean := False;
               end;

               dm.tblRH.Post();
            end;

            //            UpdateAxcisRHAndHHEntry(lRecNo);

         end;
         dmDBF.dbfRace.Next();
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         dmDBF.dbfRace.Active := False;
         dmDBF.dbfEntry.Active := False;
         dmDBF.dbfDam.Active := False;
         dmDBF.dbfSire.Active := False;
         dmDBF.dbfTrainer.Active := False;
         dmDBF.dbfJockey.Active := False;
         dmDBF.dbfPast.Active := False;
         dmDBF.dbfMatchup.Active := False;
         CloseTable(dm.tblRH);
         CloseTable(dm.tblHH);
      end;
   end;

   ClearPrgStatusBars();
   dmDBF.dbfRace.Active := False;
   dmDBF.dbfEntry.Active := False;
   dmDBF.dbfDam.Active := False;
   dmDBF.dbfSire.Active := False;
   dmDBF.dbfTrainer.Active := False;
   dmDBF.dbfJockey.Active := False;
   dmDBF.dbfPast.Active := False;
   dmDBF.dbfMatchup.Active := False;
   CloseTable(dm.tblRH);
   CloseTable(dm.tblHH);
end;


procedure UpdateRHAndHHFromAxcis(Sender: TObject);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;

begin

   hLog.AddToLog('Update RH/HH from AXCIS', msevOperation);
   try

      InitPrgBar(100);

      if gbUseOverrideDate then begin
         dtDownloadDate := gedtOverrideDate;
      end else begin
         dtDownloadDate := Now();
      end;

      //******
      iAttributes := faAnyFile;
      sPath := AXCIS_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*p.exe';
      end
      else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;
         sFileName := sFileName + 'p.exe';
         sSearch := sPath + sFileName;
      end;
      UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := iEndPos - 5;

         sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
         sFileTrkCode := UpperCase(sFileTrkCode);

         sTmp := CopyStr(tsFile.Name, iStartPos, 4);
         sRaceMM := CopyStr(sTmp, 1, 2);
         sRaceDD := CopyStr(sTmp, 3, 2);

         sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
         iLen := Length(sTmp);
         sTmp := CopyStr(sTmp, 9, iLen - 8);
         sFileName := sPath + sTmp;
         sFileName := UpperCase(sFileName);
         bOk := ExtractRar(sFileName);
         if bOk then begin
            dtPresent := Now();
            DecodeDate(dtPresent, wYear, wMonth, wDay);
            wDay := atow(sRaceDD);
            wMonth := atow(sRaceMM);

            if bProcessAllDates then begin
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
            end else begin
               dtAxcisRaceDate := dtDownloadDate;
            end;

            sRaceDbfName := 'racedp.dbf';
            sEntryDbfName := 'thr2dp.dbf';
            sTrainerDbfName := 'thrtdp.dbf';
            sJockeyDbfName := 'thrjdp.dbf';
            sDamDbfName := 'thrddp.dbf';
            sSireDbfName := 'thrsdp.dbf';
            sPastDbfName := 'thrrdp.dbf';
            sMatchupDbfName := 'thrmdp.dbf';

            try
               UpdateAxcisRHAndHHRaceEntry(
                  sRaceDbfName,
                  sEntryDbfName,
                  sDamDbfName,
                  sSireDbfName,
                  sPastDbfName,
                  sMatchupDbfName,
                  sTrainerDbfName,
                  sJockeyDbfName
                  );
            except
               on E: Exception do hLog.AddToLog(E.Message, msevException);
            end;

         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;

            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            sTmp := CopyStr(tsFile.Name, iStartPos, 4);
            sRaceMM := CopyStr(sTmp, 1, 2);
            sRaceDD := CopyStr(sTmp, 3, 2);

            sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
            iLen := Length(sTmp);
            sTmp := CopyStr(sTmp, 9, iLen - 8);
            sFileName := sPath + sTmp;
            sFileName := UpperCase(sFileName);
            bOk := ExtractRar(sFileName);
            if bOk then begin
               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);

               if bProcessAllDates then begin
                  dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
               end else begin
                  dtAxcisRaceDate := dtDownloadDate;
               end;

               sRaceDbfName := 'racedp.dbf';
               sEntryDbfName := 'thr2dp.dbf';
               sTrainerDbfName := 'thrtdp.dbf';
               sJockeyDbfName := 'thrjdp.dbf';
               sDamDbfName := 'thrddp.dbf';
               sSireDbfName := 'thrsdp.dbf';
               sPastDbfName := 'thrrdp.dbf';
               sMatchupDbfName := 'thrmdp.dbf';

               try
                  UpdateAxcisRHAndHHRaceEntry(
                     sRaceDbfName,
                     sEntryDbfName,
                     sDamDbfName,
                     sSireDbfName,
                     sPastDbfName,
                     sMatchupDbfName,
                     sTrainerDbfName,
                     sJockeyDbfName
                     );

               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

            end;
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         ClearPrgStatusBars();
         FindClose(tsFile);
         dmDBF.dbfRace.Active := False;
         dmDBF.dbfEntry.Active := False;
         dmDBF.dbfDam.Active := False;
         dmDBF.dbfSire.Active := False;
         dmDBF.dbfTrainer.Active := False;
         dmDBF.dbfJockey.Active := False;
         dmDBF.dbfPast.Active := False;
         dmDBF.dbfMatchup.Active := False;
      end;
   end;

   ClearPrgStatusBars();
   dmDBF.dbfRace.Active := False;
   dmDBF.dbfEntry.Active := False;
   dmDBF.dbfDam.Active := False;
   dmDBF.dbfSire.Active := False;
   dmDBF.dbfTrainer.Active := False;
   dmDBF.dbfJockey.Active := False;
   dmDBF.dbfPast.Active := False;
   dmDBF.dbfMatchup.Active := False;

end;

function GetTrnTodayWinPct(): double;
var

   fTotalTrn1To45WinPct: double;
   fTotalTrn46To120WinPct: double;
   fTotalTrn120PlusWinPct: double;

   fTotalTrnWork1To45WinPct: double;
   fTotalTrnWork46To120WinPct: double;
   fTotalTrnWork120PlusWinPct: double;

   fTotalTrnDebutWinPct: double;
   fTotalTrnDebutTwoWinPct: double;
   fTotalTrnFirstJuiceWinPct: double;
   fTotalTrnSecondJuiceWinPct: double;

   fTotalTrnBlinkersOnWinPct: double;
   fTotalTrnBlinkersOffWinPct: double;
   fTotalTrnWithWorkWinPct: double;

   iDaysLast: integer;
   iDaysLastWork: integer;
   iDaysLastWork2: integer;
   iDaysLastWork3: integer;
   iNbrWorksLast: integer;

   bDebut: boolean;
   bDebutTwo: boolean;

begin

   dm.tblTrainer1To45Summary.IndexName := '';
   dm.tblTrainer1To45Summary.SetKey();
   dm.tblTrainer1To45Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45Summary.GotoKey()) then begin
      fTotalTrn1To45WinPct := dm.tblTrainer1To45Summary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrn1To45WinPct := 0;
   end;

   dm.tblTrainer46To120Summary.IndexName := '';
   dm.tblTrainer46To120Summary.SetKey();
   dm.tblTrainer46To120Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120Summary.GotoKey()) then begin
      fTotalTrn46To120WinPct := dm.tblTrainer46To120Summary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrn46To120WinPct := 0;
   end;

   dm.tblTrainer120PlusSummary.IndexName := '';
   dm.tblTrainer120PlusSummary.SetKey();
   dm.tblTrainer120PlusSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusSummary.GotoKey()) then begin
      fTotalTrn120PlusWinPct := dm.tblTrainer120PlusSummary.FieldByName('WinPct').AsFloat;
   end
   else begin
      fTotalTrn120PlusWinPct := 0;
   end;

   dm.tblTrainerDebutSummary.IndexName := '';
   dm.tblTrainerDebutSummary.SetKey();
   dm.tblTrainerDebutSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutSummary.GotoKey()) then begin
      fTotalTrnDebutWinPct := dm.tblTrainerDebutSummary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrnDebutWinPct := 0;
   end;

   dm.tblTrainerDebutTwoSummary.IndexName := '';
   dm.tblTrainerDebutTwoSummary.SetKey();
   dm.tblTrainerDebutTwoSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutTwoSummary.GotoKey()) then begin
      fTotalTrnDebutTwoWinPct := dm.tblTrainerDebutTwoSummary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrnDebutTwoWinPct := 0;
   end;

   dm.tblTrainer1To45WorkSummary.IndexName := '';
   dm.tblTrainer1To45WorkSummary.SetKey();
   dm.tblTrainer1To45WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45WorkSummary.GotoKey()) then begin
      fTotalTrnWork1To45WinPct := dm.tblTrainer1To45WorkSummary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrnWork1To45WinPct := 0;
   end;


   dm.tblTrainer46To120WorkSummary.IndexName := '';
   dm.tblTrainer46To120WorkSummary.SetKey();
   dm.tblTrainer46To120WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120WorkSummary.GotoKey()) then begin
      fTotalTrnWork46To120WinPct := dm.tblTrainer46To120WorkSummary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrnWork46To120WinPct := 0;
   end;

   dm.tblTrainer120PlusWorkSummary.IndexName := '';
   dm.tblTrainer120PlusWorkSummary.SetKey();
   dm.tblTrainer120PlusWorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusWorkSummary.GotoKey()) then begin
      fTotalTrnWork120PlusWinPct := dm.tblTrainer120PlusWorkSummary.FieldByName('WinPct').AsFloat;
   end else begin
      fTotalTrnWork120PlusWinPct := 0;
   end;

   iDaysLast := dm.tblHH.FieldByName('DaysLast').AsInteger;
   iDaysLastWork := dm.tblHH.FieldByName('DaysLastWork').AsInteger;
   iDaysLastWork2 := dm.tblHH.FieldByName('DaysLastWork2').AsInteger;
   iDaysLastWork3 := dm.tblHH.FieldByName('DaysLastWork3').AsInteger;
   iNbrWorksLast := dm.tblHH.FieldByName('NbrWorksLast').AsInteger;

   bDebut := dm.tblHH.FieldByName('IsDebut').AsBoolean;
   bDebutTwo := dm.tblHH.FieldByName('IsDebutTwo').AsBoolean;

   Result := 0;

   if (bDebut) then begin
      Result := fTotalTrnDebutWinPct;
      exit;
   end;

   if (bDebutTwo) then begin
      Result := fTotalTrnDebutTwoWinPct;
      exit;
   end;

   case iDaysLast of
      1..45: Result := fTotalTrn1To45WinPct;
      46..120: Result := fTotalTrn46To120WinPct;
   else
      Result := fTotalTrn120PlusWinPct;
   end;

end;

function GetTrnTodayStarts(): integer;
var

   iTotalTrnJkyDaysStarts: integer;
   iTotalTrnDaysStarts: integer;

   iTotalTrn1To45Starts: integer;
   iTotalTrn46To120Starts: integer;
   iTotalTrn120PlusStarts: integer;

   iTotalTrnWork1To45Starts: integer;
   iTotalTrnWork46To120Starts: integer;
   iTotalTrnWork120PlusStarts: integer;

   iTotalTrnDebutStarts: integer;
   iTotalTrnDebutTwoStarts: integer;
   iTotalTrnWithWorkStarts: integer;

   iDaysLast: integer;
   iDaysLastWork: integer;
   iDaysLastWork2: integer;
   iDaysLastWork3: integer;
   iNbrWorksLast: integer;

   bDebut: boolean;
   bDebutTwo: boolean;

begin


   dm.tblTrainer1To45Summary.IndexName := '';
   dm.tblTrainer1To45Summary.SetKey();
   dm.tblTrainer1To45Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45Summary.GotoKey()) then begin
      iTotalTrn1To45Starts := dm.tblTrainer1To45Summary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrn1To45Starts := 0;
   end;


   dm.tblTrainer46To120Summary.IndexName := '';
   dm.tblTrainer46To120Summary.SetKey();
   dm.tblTrainer46To120Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120Summary.GotoKey()) then begin
      iTotalTrn46To120Starts := dm.tblTrainer46To120Summary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrn46To120Starts := 0;
   end;

   dm.tblTrainer120PlusSummary.IndexName := '';
   dm.tblTrainer120PlusSummary.SetKey();
   dm.tblTrainer120PlusSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusSummary.GotoKey()) then begin
      iTotalTrn120PlusStarts := dm.tblTrainer120PlusSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrn120PlusStarts := 0;
   end;

   dm.tblTrainerDebutSummary.IndexName := '';
   dm.tblTrainerDebutSummary.SetKey();
   dm.tblTrainerDebutSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutSummary.GotoKey()) then begin
      iTotalTrnDebutStarts := dm.tblTrainerDebutSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrnDebutStarts := 0;
   end;

   dm.tblTrainerDebutTwoSummary.IndexName := '';
   dm.tblTrainerDebutTwoSummary.SetKey();
   dm.tblTrainerDebutTwoSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutTwoSummary.GotoKey()) then begin
      iTotalTrnDebutTwoStarts := dm.tblTrainerDebutTwoSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrnDebutTwoStarts := 0;
   end;

   dm.tblTrainer1To45WorkSummary.IndexName := '';
   dm.tblTrainer1To45WorkSummary.SetKey();
   dm.tblTrainer1To45WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45WorkSummary.GotoKey()) then begin
      iTotalTrnWork1To45Starts := dm.tblTrainer1To45WorkSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrnWork1To45Starts := 0;
   end;


   dm.tblTrainer46To120WorkSummary.IndexName := '';
   dm.tblTrainer46To120WorkSummary.SetKey();
   dm.tblTrainer46To120WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120WorkSummary.GotoKey()) then begin
      iTotalTrnWork46To120Starts := dm.tblTrainer46To120WorkSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrnWork46To120Starts := 0;
   end;

   dm.tblTrainer120PlusWorkSummary.IndexName := '';
   dm.tblTrainer120PlusWorkSummary.SetKey();
   dm.tblTrainer120PlusWorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusWorkSummary.GotoKey()) then begin
      iTotalTrnWork120PlusStarts := dm.tblTrainer120PlusWorkSummary.FieldByName('Starts').AsInteger;
   end else begin
      iTotalTrnWork120PlusStarts := 0;
   end;

   iDaysLast := dm.tblHH.FieldByName('DaysLast').AsInteger;
   iDaysLastWork := dm.tblHH.FieldByName('DaysLastWork').AsInteger;
   iDaysLastWork2 := dm.tblHH.FieldByName('DaysLastWork2').AsInteger;
   iDaysLastWork3 := dm.tblHH.FieldByName('DaysLastWork3').AsInteger;
   iNbrWorksLast := dm.tblHH.FieldByName('NbrWorksLast').AsInteger;
   bDebut := dm.tblHH.FieldByName('IsDebut').AsBoolean;
   bDebutTwo := dm.tblHH.FieldByName('IsDebutTwo').AsBoolean;

   Result := 0;

   if (bDebut) then begin
      Result := iTotalTrnDebutStarts;
      exit;
   end;

   if (bDebutTwo) then begin
      Result := iTotalTrnDebutTwoStarts;
      exit;
   end;

   case iDaysLast of
      1..45: Result := iTotalTrn1To45Starts;
      46..120: Result := iTotalTrn46To120Starts;
   else
      Result := iTotalTrn120PlusStarts;
   end;

end;

function GetTrnTodayWins(): integer;
var

   iTotalTrnJkyDaysWins: integer;
   iTotalTrnDaysWins: integer;
   iTotalTrn1To45Wins: integer;
   iTotalTrn46To120Wins: integer;
   iTotalTrn120PlusWins: integer;

   iTotalTrnWork1To45Wins: integer;
   iTotalTrnWork46To120Wins: integer;
   iTotalTrnWork120PlusWins: integer;

   iTotalTrnDebutWins: integer;
   iTotalTrnDebutTwoWins: integer;
   iTotalTrnWithWorkWins: integer;

   iDaysLast: integer;
   iDaysLastWork: integer;
   iDaysLastWork2: integer;
   iDaysLastWork3: integer;
   iNbrWorksLast: integer;

   bDebut: boolean;
   bDebutTwo: boolean;

begin


   dm.tblTrainer1To45Summary.IndexName := '';
   dm.tblTrainer1To45Summary.SetKey();
   dm.tblTrainer1To45Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45Summary.GotoKey()) then begin
      iTotalTrn1To45Wins := dm.tblTrainer1To45Summary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrn1To45Wins := 0;
   end;

   dm.tblTrainer46To120Summary.IndexName := '';
   dm.tblTrainer46To120Summary.SetKey();
   dm.tblTrainer46To120Summary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120Summary.GotoKey()) then begin
      iTotalTrn46To120Wins := dm.tblTrainer46To120Summary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrn46To120Wins := 0;
   end;

   dm.tblTrainer120PlusSummary.IndexName := '';
   dm.tblTrainer120PlusSummary.SetKey();
   dm.tblTrainer120PlusSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusSummary.GotoKey()) then begin
      iTotalTrn120PlusWins := dm.tblTrainer120PlusSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrn120PlusWins := 0;
   end;

   dm.tblTrainerDebutSummary.IndexName := '';
   dm.tblTrainerDebutSummary.SetKey();
   dm.tblTrainerDebutSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutSummary.GotoKey()) then begin
      iTotalTrnDebutWins := dm.tblTrainerDebutSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrnDebutWins := 0;
   end;

   dm.tblTrainerDebutTwoSummary.IndexName := '';
   dm.tblTrainerDebutTwoSummary.SetKey();
   dm.tblTrainerDebutTwoSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainerDebutTwoSummary.GotoKey()) then begin
      iTotalTrnDebutTwoWins := dm.tblTrainerDebutTwoSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrnDebutTwoWins := 0;
   end;

   dm.tblTrainer1To45WorkSummary.IndexName := '';
   dm.tblTrainer1To45WorkSummary.SetKey();
   dm.tblTrainer1To45WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer1To45WorkSummary.GotoKey()) then begin
      iTotalTrnWork1To45Wins := dm.tblTrainer1To45WorkSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrnWork1To45Wins := 0;
   end;


   dm.tblTrainer46To120WorkSummary.IndexName := '';
   dm.tblTrainer46To120WorkSummary.SetKey();
   dm.tblTrainer46To120WorkSummary.FieldByName('TrnEquibaseKey').AsString := dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer46To120WorkSummary.GotoKey()) then begin
      iTotalTrnWork46To120Wins := dm.tblTrainer46To120WorkSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrnWork46To120Wins := 0;
   end;

   dm.tblTrainer120PlusWorkSummary.IndexName := '';
   dm.tblTrainer120PlusWorkSummary.SetKey();
   dm.tblTrainer120PlusWorkSummary.FieldByName('TrnEquibaseKey').AsString :=
      dm.tblHH.FieldByName('TrnEquibaseKey').AsString;
   if (dm.tblTrainer120PlusWorkSummary.GotoKey()) then begin
      iTotalTrnWork120PlusWins :=
         dm.tblTrainer120PlusWorkSummary.FieldByName('Wins').AsInteger;
   end else begin
      iTotalTrnWork120PlusWins := 0;
   end;

   iDaysLast := dm.tblHH.FieldByName('DaysLast').AsInteger;
   iDaysLastWork := dm.tblHH.FieldByName('DaysLastWork').AsInteger;
   iDaysLastWork2 := dm.tblHH.FieldByName('DaysLastWork2').AsInteger;
   iDaysLastWork3 := dm.tblHH.FieldByName('DaysLastWork3').AsInteger;
   iNbrWorksLast := dm.tblHH.FieldByName('NbrWorksLast').AsInteger;

   bDebut := dm.tblHH.FieldByName('IsDebut').AsBoolean;
   bDebutTwo := dm.tblHH.FieldByName('IsDebutTwo').AsBoolean;

   Result := 0;

   if (bDebut) then begin
      Result := iTotalTrnDebutWins;
      exit;
   end;

   if (bDebutTwo) then begin
      Result := iTotalTrnDebutTwoWins;
      exit;
   end;

   case iDaysLast of
      0: Result := iTotalTrnDaysWins;
      1..45: Result := iTotalTrn1To45Wins;
      46..120: Result := iTotalTrn46To120Wins;
   else
      Result := iTotalTrn120PlusWins;
   end;

end;


procedure UpdateHHSurface();
begin

   OpenTable(dm.tblRH);
   OpenTable(dm.tblHH);

   InitPrgBar(dm.tblHH.RecordCount);

   dm.tblHH.First();
   while not dm.tblHH.Eof do begin
      IncPrgBar();

      dm.tblHH.Edit();

      if (dm.tblHH.FieldByName('TrkCode').Value = 'AP') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'TP') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'SA') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'WO') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'PID') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'OSA') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'GG') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'HOL') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'DMR') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;
      if (dm.tblHH.FieldByName('TrkCode').Value = 'KEE') then begin
         dm.tblHH.FieldByName('Surface').Value := 'A';
      end;

      dm.tblHH.Post();

      dm.tblRH.IndexName := '';
      dm.tblRH.SetKey();
      dm.tblRH.FieldByName('TrkCode').Value := dm.tblHH.FieldByName('TrkCode').Value;
      dm.tblRH.FieldByName('RaceDate').Value := dm.tblHH.FieldByName('RaceDate').Value;
      dm.tblRH.FieldByName('RaceNbr').Value := dm.tblHH.FieldByName('RaceNbr').Value;
      if dm.tblRH.GotoKey() then begin
         dm.tblRH.Edit();
         dm.tblRH.FieldByName('Surface').Value := dm.tblHH.FieldByName('Surface').Value;
         dm.tblRH.Post();
      end;



      dm.tblHH.Next();
   end;

   CloseTable(dm.tblRH);
   CloseTable(dm.tblHH);
end;


end.

