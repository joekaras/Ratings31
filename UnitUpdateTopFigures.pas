unit UnitUpdateTopFigures;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateTopFigures
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;

procedure UpdateTopFigures
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer
   );
begin

   hLog.AddToLog('UpdateTopFigures', msevOperation);
   try
      OpenTable(tblR);
      OpenTable(tblE);

      tblE.Filtered := False;
      tblE.First();
      while not tblE.Eof do begin
         SetRaceEntriesKey(dm.tblRaces, dm.tblEntries);
         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Top Figures - ');

         if tblR.GotoKey() then begin
            tblR.Edit();
            if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
               tblR.FieldByName('TopLastSpeed').AsInteger := tblE.FieldByName('LastSpeed').AsInteger;
            end;
            if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
               tblR.FieldByName('TopBackSpeed').AsInteger := tblE.FieldByName('BackSpeed').AsInteger;
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
         end;

         tblE.Next();
      end;
   except
      CloseTable(tblR);
      CloseTable(tblE);
      ClearPrgStatusBars();
   end;

   ClearPrgStatusBars();
   CloseTable(tblR);
   CloseTable(tblE);

end;


end.
