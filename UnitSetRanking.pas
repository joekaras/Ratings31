unit UnitSetRanking;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Forms,
   mlog, DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls,
   cxControls, cxContainer, cxEdit, cxProgressBar;

procedure SetRanking(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   iNbrOfDays: integer;
   bAscending: boolean
   );


procedure SetRankingDouble(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   iNbrOfDays: integer;
   bAscending: boolean
   );


procedure SetRankingOld(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   iNbrOfDays: integer
   );



procedure SetRankingBoolean(
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   iNbrOfDays: integer
   );

implementation

uses UnitCommonCode, UnitDBRoutines, DatRatings;


procedure SetRanking
   (
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   iNbrOfDays: integer;
   bAscending: boolean

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

   iValue: integer;
   iPrevValue: integer;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      try
         OpenTable(tbl);

         tbl.IndexName := sIndexName;
         InitPrgBar(tbl.RecordCount);

         tbl.First();

         iPrevRaceNbr := 0;
         sPrevTrkCode := '';
         iPrevValue := 0;

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
            iValue := tbl.FieldByName(sFldNameValue).AsInteger;

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin
               if (bAscending) then begin
                  if (iValue > iPrevValue) then Inc(iRank);
               end else begin
                  if (iValue < iPrevValue) then Inc(iRank);
               end;

               tbl.Edit();
               tbl.FieldByName(sFldName).AsInteger := iRank;
               tbl.Post();

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               iPrevValue := tbl.FieldByName(sFldNameValue).AsInteger;
            end else begin
               iRank := 1;
               tbl.Edit();
               tbl.FieldByName(sFldName).AsInteger := iRank;
               tbl.Post();
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               iPrevValue := tbl.FieldByName(sFldNameValue).AsInteger;
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
      CloseTable(tbl);
      ClearPrgStatusBars();
   end;
end;

procedure SetRankingDouble
   (
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   iNbrOfDays: integer;
   bAscending: boolean

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

   fValue: double;
   fPrevValue: double;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      try
         OpenTable(tbl);



         tbl.IndexName := sIndexName;


         InitPrgBar(tbl.RecordCount);

         tbl.First();

         iPrevRaceNbr := 0;
         sPrevTrkCode := '';
         fPrevValue := 0;

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
            fValue := tbl.FieldByName(sFldNameValue).AsFloat;

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin

               if (bAscending) then begin
                  if (fValue > fPrevValue) then Inc(iRank);
               end else begin
                  if (fValue < fPrevValue) then Inc(iRank);
               end;

               tbl.Edit();
               tbl.FieldByName(sFldName).AsInteger := iRank;
               tbl.Post();

               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               fPrevValue := tbl.FieldByName(sFldNameValue).AsFloat;
            end else begin
               iRank := 1;
               tbl.Edit();
               tbl.FieldByName(sFldName).AsInteger := iRank;
               tbl.Post();
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               fPrevValue := tbl.FieldByName(sFldNameValue).AsFloat;
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
      CloseTable(tbl);
      ClearPrgStatusBars();
   end;
end;

procedure SetRankingBoolean
   (
   tbl: TDBISAMTable;
   sIndexName: string;
   sFldName: string;
   sFldNameValue: string;
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

   iValue: integer;
   iPrevValue: integer;

begin

   iPrevRaceNbr := 0;
   sPrevTrkCode := '';
   iRank := 0;

   try
      try
         OpenTable(tbl);

         tbl.IndexName := sIndexName;
         InitPrgBar(tbl.RecordCount);

         tbl.First();

         iPrevRaceNbr := 0;
         sPrevTrkCode := '';
         iPrevValue := 0;

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
            if (tbl.FieldByName(sFldNameValue).AsBoolean) then begin
               iValue := 1;
            end else begin
               iValue := 0;
            end;

            if (iRaceNbr = iPrevRaceNbr) and (sTrkCode = sPrevTrkCode) then begin

               if (iValue <> iPrevValue) then begin
                  Inc(iRank);
               end;

               if (iRank <> tbl.FieldByName(sFldName).AsInteger) then begin
                  tbl.Edit();
                  tbl.FieldByName(sFldName).AsInteger := iRank;
                  tbl.Post();
               end;
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               if (tbl.FieldByName(sFldNameValue).AsBoolean) then begin
                  iPrevValue := 1;
               end else begin
                  iPrevValue := 0;
               end;

            end else begin
               iRank := 1;
               if (iRank <> tbl.FieldByName(sFldName).AsInteger) then begin
                  tbl.Edit();
                  tbl.FieldByName(sFldName).AsInteger := iRank;
                  tbl.Post();
               end;
               iPrevRaceNbr := iRaceNbr;
               sPrevTrkCode := sTrkCode;
               if (tbl.FieldByName(sFldNameValue).AsBoolean) then begin
                  iPrevValue := 1;
               end else begin
                  iPrevValue := 0;
               end;
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
      CloseTable(tbl);
      ClearPrgStatusBars();
   end;
end;

procedure SetRankingOld
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
         OpenTable(tbl);

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
      CloseTable(tbl);
      ClearPrgStatusBars();
   end;
end;


end.

