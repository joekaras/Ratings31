unit UnitUpdateWagers;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;


procedure CreatePTCWagers
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblT: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

procedure CreateWagers
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblB: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

procedure UpdateWagerResults
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblB: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );

procedure UpdateWagersFromHH();

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitGetHandicappingKeys;


procedure CreateWagers
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblB: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   sTrkCode: string;

   iStaCnt: integer;
   iRaceNbr: integer;
   iTotalCnt: integer;

   fEdge: double;
   fMaxEdge: double;
   fHalfKelly: double;

   fBettingBank: double;
   fTodaysWagerKellyPct: double;
   //   fTotalFinalKellyPct: double;
   //   fAdjustedFinalKellyPct: double;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;

   fStartWinBank: double;
   fEndWinBank: double;

   fYestEndWinBank: double;

   iWinWagerBets: integer;

   fWinWagerAmt: double;
   fWinWagerPayout: double;
   fWinWagerPL: double;
   fWinWagerRefund: double;


begin
   hLog.AddToLog('CreateWagers', msevOperation);

   //
   try

      if not IsSameDay(Now(), gedtOverrideDate) then begin
         exit;
      end;

      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblB);
      CloseTable(tblW);

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblB);
      OpenTable(tblW);


      // Get Yesterdays end bank (todays start bank) otherwise default to $100
      tblB.IndexName := '';
      tblB.SetKey();
      tblB.FieldByName('WagerType').Value := WIN_WAGER_KEY;
      tblB.FieldByName('WagerDate').Value := gedtOverrideDate - 1;
      if (tblB.GotoKey()) then begin
         fYestEndWinBank := tblB.FieldByName('EndBank').AsFloat;
      end else begin
         fYestEndWinBank := 100.00;
      end;

      fWinWagerAmt := 0;
      iWinWagerBets := 0;
      fStartWinBank := fYestEndWinBank;

      fYestEndWinBank := 100.00;

      try

         tblE.IndexName := 'ByEstTimeOfRace';
         tblE.First();
         tblE.Filtered := False;
         tblE.Filter := YOUBET_WAGER_FILTER;
         tblE.Filtered := True;

         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Wagers ' +
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

            fWagerAmt := 0;
            fPlcWagerAmt := 0;
            fShoWagerAmt := 0;

            fTodaysWagerKellyPct := 0;
            //            fAdjustedFinalKellyPct := 0;

            tblE.Edit();

            fHalfKelly := tblE.FieldByName('TodaysWagerKellyPct').AsFloat * 0.5;
            fMaxEdge := tblE.FieldByName('TodaysWagerLineTo1Probability').AsFloat;

            fBettingBank := fStartWinBank;
            if (fHalfKelly > fMaxEdge) then begin
               fEdge := fMaxEdge;
            end else begin
               fEdge := fHalfKelly;
            end;

            if fEdge < 0 then begin
               fEdge := 0;
               fHalfKelly := 0;
               fMaxEdge := 0;
            end;

            fWagerAmt := RoundTo((fEdge * fBettingBank), 0);

            fPlcWagerAmt := fWagerAmt;
            fShoWagerAmt := fWagerAmt;
            if (fWagerAmt < 2.00) then begin
               fWagerAmt := 1.00;
               fPlcWagerAmt := 1.00;
               fShoWagerAmt := 1.00;
            end;

            // Assume every bet is loss so bring down bank - conservative approach
            fStartWinBank := fStartWinBank - fWagerAmt;

            tblE.FieldByName('WagerAmt').AsFloat := fWagerAmt;
            // First the win bets have to show a profit :-)
            tblE.FieldByName('PlcWagerAmt').AsFloat := 0;
            tblE.FieldByName('ShoWagerAmt').AsFloat := 0;

            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               tblR.Edit();
               tblR.FieldByName('ExaWagerAmt').AsFloat := 0;
               tblR.FieldByName('QuiWagerAmt').AsFloat := 0;
               tblR.FieldByName('TriWagerAmt').AsFloat := 0;
               //               tblR.FieldByName('SfcWagerAmt').AsFloat := 0;
               tblR.FieldByName('DDWagerAmt').AsFloat := 0;
               //               tblR.FieldByName('Pk3WagerAmt').AsFloat := 0;
               tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;

               tblR.FieldByName('Exacta').AsString := '';
               tblR.FieldByName('Quinella').AsString := '';
               tblR.FieldByName('Tri').AsString := '';
               //               tblR.FieldByName('Super').AsString := '';
               tblR.FieldByName('DD').AsString := '';
               //               tblR.FieldByName('Pick3').AsString := '';
               tblR.FieldByName('Pick4').AsString := '';
               tblR.Post();
            end;

            fWinWagerAmt := fWinWagerAmt + fWagerAmt;
            Inc(iWinWagerBets);

            tblE.Post();

            // Create Detail Wager Record
            tblW.IndexName := '';
            tblW.SetKey();
            tblW.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblW.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblW.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            tblW.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;

            if tblW.GotoKey() then begin
               tblW.Edit();
               tblW.FieldByName('StartBank').AsFloat := fBettingBank;
               tblW.FieldByName('Edge').AsFloat := fEdge;
               tblW.FieldByName('HalfKelly').AsFloat := fHalfKelly;
               tblW.FieldByName('MaxEdge').AsFloat := fMaxEdge;
               tblW.FieldByName('WagerAmt').AsFloat := fWagerAmt;
               tblW.FieldByName('EndBank').AsFloat := fBettingBank - fWagerAmt;
               tblW.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;
               tblW.Post();
            end else begin
               tblW.Append();
               tblW.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               tblW.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblW.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
               tblW.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
               tblW.FieldByName('WagerType').Value := WIN_WAGER_KEY;
               tblW.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;

               tblW.FieldByName('StartBank').AsFloat := fBettingBank;
               tblW.FieldByName('Edge').AsFloat := fEdge;
               tblW.FieldByName('HalfKelly').AsFloat := fHalfKelly;
               tblW.FieldByName('MaxEdge').AsFloat := fMaxEdge;
               tblW.FieldByName('WagerAmt').AsFloat := fWagerAmt;
               tblW.FieldByName('EndBank').AsFloat := fBettingBank - fWagerAmt;

               tblW.Post();
            end;

            tblE.Next();
         end;

         // Create Todays Bank Record
         tblB.IndexName := '';
         tblB.SetKey();
         tblB.FieldByName('WagerType').Value := WIN_WAGER_KEY;
         tblB.FieldByName('WagerDate').Value := gedtOverrideDate;
         if (tblB.GotoKey()) then begin
            tblB.Edit();
            fWinWagerRefund := tblB.FieldByName('WagerRefund').AsFloat;
            fWinWagerPayout := tblB.FieldByName('WagerPayout').AsFloat;
            fWinWagerPL := (fWinWagerPayout + fWinWagerRefund) - fWinWagerAmt;
            fEndWinBank := (fYestEndWinBank + fWinWagerRefund) - fWinWagerAmt;

            tblB.FieldByName('StartBank').AsFloat := fYestEndWinBank;
            tblB.FieldByName('WagerAmt').AsFloat := fWinWagerAmt;
            tblB.FieldByName('EndBank').AsFloat := fEndWinBank;
            tblB.FieldByName('WagerPL').AsFloat := fWinWagerPL;

            tblB.FieldByName('WagerBets').AsInteger := iWinWagerBets;
            tblB.Post();
         end else begin
            tblB.Append();
            tblB.FieldByName('WagerType').Value := WIN_WAGER_KEY;
            tblB.FieldByName('WagerDate').Value := gedtOverrideDate;
            tblB.FieldByName('StartBank').AsFloat := fYestEndWinBank;
            tblB.FieldByName('WagerAmt').AsFloat := fWinWagerAmt;
            tblB.FieldByName('WagerRefund').AsFloat := 0;
            tblB.FieldByName('WagerPayout').AsFloat := 0;
            tblB.FieldByName('WagerPL').AsFloat := 0;
            tblB.FieldByName('WagerBets').AsInteger := iWinWagerBets;
            tblB.FieldByName('WagerWins').AsInteger := 0;
            tblB.FieldByName('WagerBetsMissed').AsInteger := 0;
            tblB.FieldByName('WagerScratches').AsInteger := 0;
            tblB.FieldByName('EndBank').AsFloat := fYestEndWinBank - fWinWagerAmt;
            tblB.Post();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblE.Filtered := False;
      tblE.Filter := '';
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblB);
      CloseTable(tblW);
      ClearPrgStatusBars();

   end;

end;


procedure UpdateWagerResults
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblB: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   sTrkCode: string;

   iStaCnt: integer;
   iRaceNbr: integer;
   iTotalCnt: integer;

   fEdge: double;
   fBettingBank: double;
   fFinalKellyPct: double;
   fTotalFinalKellyPct: double;
   fAdjustedFinalKellyPct: double;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;

   fStartWinBank: double;
   fEndWinBank: double;

   iWinWagerBets: integer;

   fWinWagerAmt: double;
   fWinWagerPayout: double;
   fWinWagerPL: double;
   fWinWagerRefund: double;

begin
   hLog.AddToLog('CreateWagers', msevOperation);

   //
   try
      if (Now() <> gedtOverrideDate) then begin
         exit;
      end;

      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblB);
      CloseTable(tblW);

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblB);
      OpenTable(tblW);

      try

         tblE.First();
         tblE.Filtered := False;
         tblE.Filter := YOUBET_WAGER_FILTER;
         tblE.Filtered := True;

         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Wagers ' +
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

            fWagerAmt := 0;
            fPlcWagerAmt := 0;
            fShoWagerAmt := 0;

            fFinalKellyPct := 0;
            fAdjustedFinalKellyPct := 0;

            tblE.Edit();

            fEdge := tblE.FieldByName('FinalKellyPct').AsFloat * 0.50;
            fBettingBank := fStartWinBank;

            fWagerAmt := RoundTo((fEdge * fBettingBank), 0);
            fPlcWagerAmt := fWagerAmt;
            fShoWagerAmt := fWagerAmt;
            if (fWagerAmt < 2.00) then begin
               fWagerAmt := 2.00;
               fPlcWagerAmt := 2.00;
               fShoWagerAmt := 2.00;
            end;

            tblE.FieldByName('WagerAmt').AsFloat := fWagerAmt;

            // First the win bets have to show a profit :-)
            tblE.FieldByName('PlcWagerAmt').AsFloat := 0;
            tblE.FieldByName('ShoWagerAmt').AsFloat := 0;
            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               tblR.Edit();
               tblR.FieldByName('ExaWagerAmt').AsFloat := 0;
               tblR.FieldByName('QuiWagerAmt').AsFloat := 0;
               tblR.FieldByName('TriWagerAmt').AsFloat := 0;
               //               tblR.FieldByName('SfcWagerAmt').AsFloat := 0;
               tblR.FieldByName('DDWagerAmt').AsFloat := 0;
               //               tblR.FieldByName('Pk3WagerAmt').AsFloat := 0;
               tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;

               tblR.FieldByName('Exacta').AsString := '';
               tblR.FieldByName('Quinella').AsString := '';
               tblR.FieldByName('Tri').AsString := '';
               //               tblR.FieldByName('Super').AsString := '';
               tblR.FieldByName('DD').AsString := '';
               //               tblR.FieldByName('Pick3').AsString := '';
               tblR.FieldByName('Pick4').AsString := '';
               tblR.Post();
            end;

            fWinWagerAmt := fWinWagerAmt + fWagerAmt;
            Inc(iWinWagerBets);

            tblE.Post();
            tblE.Next();
         end;

         // Create Todays Bank Record
         tblB.IndexName := '';
         tblB.SetKey();
         tblB.FieldByName('WagerType').Value := WIN_WAGER_KEY;
         tblB.FieldByName('WagerDate').Value := gedtOverrideDate;
         if (tblB.GotoKey()) then begin
            tblB.Edit();
            fWinWagerRefund := tblB.FieldByName('WagerRefund').AsFloat;
            fWinWagerPayout := tblB.FieldByName('WagerPayout').AsFloat;
            fWinWagerPL := (fWinWagerPayout + fWinWagerRefund) - fWinWagerAmt;
            fEndWinBank := (fStartWinBank + fWinWagerRefund) - fWinWagerAmt;

            tblB.FieldByName('StartBank').AsFloat := fStartWinBank;
            tblB.FieldByName('WagerAmt').AsFloat := fWinWagerAmt;
            tblB.FieldByName('EndBank').AsFloat := fEndWinBank;
            tblB.FieldByName('WagerPL').AsFloat := fWinWagerPL;

            tblB.FieldByName('WagerBets').AsInteger := iWinWagerBets;
            tblB.Post();
         end else begin
            tblB.Append();
            tblB.FieldByName('WagerType').Value := WIN_WAGER_KEY;
            tblB.FieldByName('WagerDate').Value := gedtOverrideDate;
            tblB.FieldByName('StartBank').AsFloat := fStartWinBank;
            tblB.FieldByName('WagerAmt').AsFloat := fWinWagerAmt;
            tblB.FieldByName('WagerRefund').AsFloat := 0;
            tblB.FieldByName('WagerPayout').AsFloat := 0;
            tblB.FieldByName('WagerPL').AsFloat := 0;
            tblB.FieldByName('WagerBets').AsInteger := iWinWagerBets;
            tblB.FieldByName('WagerWins').AsInteger := 0;
            tblB.FieldByName('WagerBetsMissed').AsInteger := 0;
            tblB.FieldByName('WagerScratches').AsInteger := 0;
            tblB.FieldByName('EndBank').AsFloat := fStartWinBank - fWinWagerAmt;
            tblB.Post();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblE.Filtered := False;
      tblE.Filter := '';
      tblE.IndexName := '';
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblB);
      CloseTable(tblW);
      ClearPrgStatusBars();

   end;

end;

procedure UpdateWagersFromHH();
var
   sFileName: string;
   qrySQL: TDBISAMQuery;
begin

   hLog.AddToLog('UpdateWagersOddsFinishPosFromHH', msevOperation);
   try
      qrySQL := TDBISAMQuery.Create(Application);
      qrySQL.DatabaseName := 'dbSireRate';

      try
         sFileName := SQL_PATH + 'UpdateWagersOddsFinishPosFromHH.Sql';
         sQrySqlStatusSimpleText := sFileName;
         qrySQL.Close;
         qrySQL.Unprepare;
         qrySQL.Sql.Clear();
         qrySQL.Sql.LoadFromFile(sFileName);
         qrySQL.RequestLive := True;
         qrySQL.ParamByName('RaceDateParam').DataType := ftDate;
         qrySQL.ParamByName('RaceDateParam').AsDateTime := gedtOverrideDate;
         qrySQL.Prepare;
         qrySQL.ExecSQL;
         qrySQL.First();

         InitPrgBar(qrySQL.RecordCount);
         while not qrySQL.EOF do begin
         end;
      except
         on E: Exception do hLog.AddToLog(E.Message, msevException);
      end;

   finally
      qrySQL.Close();
      FreeAndNil(qrySQL);
   end;


end;

procedure CreatePTCWagers
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblT: TDBISAMTable;
   tblW: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer
   );
var
   sTrkCode: string;

   iStaCnt: integer;
   iRaceNbr: integer;
   iTotalCnt: integer;

   fWinPct: double;

   sYYYY: string;
   sMM: string;
   sDD: string;

   wYear: Word;
   wDay: Word;
   wMonth: Word;

   sPTCTrkCode: string;

begin
   hLog.AddToLog('CreateWagers', msevOperation);

   //
   try


      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblT);
      CloseTable(tblW);

      tblW.EmptyTable();

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblT);
      OpenTable(tblW);



      try

         tblE.IndexName := 'ByEstTimeOfRace';
         tblE.First();
         tblE.Filtered := False;
         tblE.Filter := '(IsTrainerSheetSelected=True) or (IsSpeedSheetSelected=True)';

         //   tblE.Filter := '((IsValueDebutTwoSelected=True) or (IsValueDebutSelected=True) or (IsValueWagerSelected=True)) and (TCPlusMinus>0) and (IsEliminated=False)';
         tblE.Filtered := True;

         tblR.Filter := '(TypeOfRace=' + QuotedStr('T') + ')';
         tblR.Filtered := True;

         InitPrgBar(tblE.RecordCount);
         iStaCnt := 0;
         iTotalCnt := 0;

         while not tblE.Eof do begin
            if (iStaCnt > BATCH_SIZE) then begin
               staBar.SimpleText := 'Updating Wagers ' +
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

            tblT.IndexName := '';
            tblT.SetKey();
            tblT.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            if tblT.GotoKey() then begin
               sPTCTrkCode := tblT.FieldByName('PTCTrkCode').AsString;
            end else begin
               sPTCTrkCode := 'ADD';
            end;

            if (sPTCTrkCode = 'NO') then begin
               tblE.Next();
               continue;
            end;

            tblR.IndexName := '';
            tblR.SetKey();
            tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            if tblR.GotoKey() then begin
               tblW.Append();
               DecodeDate(tblE.FieldByName('RaceDate').AsDateTime, wYear, wMonth, wDay);
               sYYYY := sm.str(wYear, 4);
               sMM := sm.str(wMonth, 2);
               sDD := sm.str(wDay, 2);

               tblW.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;
               tblW.FieldByName('RaceDate').Value := sYYYY + '-' + sMM + '-' + sDD;
               tblW.FieldByName('PTCTrkCode').Value := sPTCTrkCode;
               tblW.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;
               tblW.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               tblW.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
               tblW.FieldByName('ProgramNbr').Value := tblE.FieldByName('ProgramNbr').Value;
               tblW.FieldByName('MorningLineTo1').Value := tblE.FieldByName('MorningLineTo1').Value;

               tblW.FieldByName('Surface').Value := tblR.FieldByName('Surface').Value;
               tblW.FieldByName('DistanceInFurlongs').Value := tblR.FieldByName('DistanceInFurlongs').Value;
               tblW.FieldByName('HorseName').Value := tblE.FieldByName('HorseName').Value;
               tblW.FieldByName('DistanceDesc').Value := tblR.FieldByName('DistanceDesc').Value;
               tblW.FieldByName('RaceType').Value := tblE.FieldByName('RaceType').Value;

               tblW.FieldByName('DebutIndicator').Value := tblE.FieldByName('DebutIndicator').Value;

               if (tblR.FieldByName('Surface').AsString = 'T') then begin
                  tblW.FieldByName('TurfIndicator').Value := tblE.FieldByName('TurfIndicator').Value;
               end;

               tblW.FieldByName('PowerRank').Value := tblE.FieldByName('PowerRank').Value;

               tblW.FieldByName('EarlyPaceRank').Value := tblE.FieldByName('EarlyPaceRank').Value;
               tblW.FieldByName('EarlyPacePosRank').Value := tblE.FieldByName('EarlyPacePosRank').Value;

               tblW.FieldByName('MiddlePaceRank').Value := tblE.FieldByName('MiddlePaceRank').Value;
               tblW.FieldByName('MiddlePacePosRank').Value := tblE.FieldByName('MiddlePacePosRank').Value;

               tblW.FieldByName('LatePaceRank').Value := tblE.FieldByName('LatePaceRank').Value;
               tblW.FieldByName('LatePacePosRank').Value := tblE.FieldByName('LatePacePosRank').Value;

               tblW.FieldByName('QSP1stCallRank').Value := tblE.FieldByName('QSP1stCallRank').Value;
               tblW.FieldByName('QSP2ndCallRank').Value := tblE.FieldByName('QSP2ndCallRank').Value;

               tblW.FieldByName('KSP1stCallRank').Value := tblE.FieldByName('KSP1stCallRank').Value;
               tblW.FieldByName('KSP2ndCallRank').Value := tblE.FieldByName('KSP2ndCallRank').Value;

               tblW.FieldByName('NbrStarters').Value := tblR.FieldByName('NbrStarters').Value;
               tblW.FieldByName('NbrDebutStarters').Value := tblR.FieldByName('NbrDebutStarters').Value;

               tblW.FieldByName('BetType').Value := 'WPS';

               tblW.FieldByName('BetAmount').AsFloat := 2.00;
               // tblE.FieldByName('TCPlusMinus').AsFloat;

                //               if ((tblW.FieldByName('TrkCode').AsString = 'AP') or
                //                  (tblW.FieldByName('TrkCode').AsString = 'CD') or
                //                  (tblW.FieldByName('TrkCode').AsString = 'FG') or
                //                  (tblW.FieldByName('TrkCode').AsString = 'CRC'))
                //                  then begin
                //
                //                  case (tblE.FieldByName('TCPlusMinus').AsInteger) of
                //                     0: begin
                //                           tblW.FieldByName('BetAmount').AsFloat := 2.00;
                //                        end;
                //                     1: begin
                //                           tblW.FieldByName('BetAmount').AsFloat := 3.00;
                //                        end;
                //                     2..6: begin
                //                           tblW.FieldByName('BetAmount').AsFloat :=
                //                              tblE.FieldByName('TCPlusMinus').AsFloat * 2;
                //                        end;
                //                  end;
                //               end else begin
                //                  case (tblE.FieldByName('TCPlusMinus').AsInteger) of
                //                     0: begin
                //                           tblW.FieldByName('BetAmount').AsFloat := 2.00;
                //                        end;
                //                     1: begin
                //                           tblW.FieldByName('BetAmount').AsFloat := 2.00;
                //                        end;
                //                     2..6: begin
                //                           tblW.FieldByName('BetAmount').AsFloat :=
                //                              tblE.FieldByName('TCPlusMinus').AsFloat + 1;
                //                        end;
                //                  end;
                //               end;

               tblW.FieldByName('ConditionalMinOdds').AsString := '98.00';

               fWinPct := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
               if (fWinPct >= 90.91) and (fWinPct < 100.01) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 83.33) and (fWinPct < 90.91) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 71.42) and (fWinPct < 83.33) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 66.67) and (fWinPct < 71.42) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 62.50) and (fWinPct < 66.67) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 55.56) and (fWinPct < 62.50) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.00';
               end;

               if (fWinPct >= 50.00) and (fWinPct < 55.56) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '1.50';
               end;

               if (fWinPct >= 45.45) and (fWinPct < 50.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.00';
               end;

               if (fWinPct >= 41.67) and (fWinPct < 45.45) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.00';
               end;

               if (fWinPct >= 40.00) and (fWinPct < 41.67) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.00';
               end;

               if (fWinPct >= 38.46) and (fWinPct < 40.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.00';
               end;

               if (fWinPct >= 35.71) and (fWinPct < 38.46) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.00';
               end;

               if (fWinPct >= 33.33) and (fWinPct < 35.71) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '2.5';
               end;

               if (fWinPct >= 28.57) and (fWinPct < 33.33) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '3.0';
               end;

               if (fWinPct >= 25.00) and (fWinPct < 28.57) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '3.5';
               end;

               if (fWinPct >= 22.22) and (fWinPct < 25.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '4.0';
               end;

               if (fWinPct >= 20.00) and (fWinPct < 22.22) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '5.0';
               end;

               if (fWinPct >= 18.19) and (fWinPct < 20.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '5.5';
               end;

               if (fWinPct >= 16.67) and (fWinPct < 18.19) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '6.0';
               end;

               if (fWinPct >= 14.29) and (fWinPct < 16.67) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '7.0';
               end;

               if (fWinPct >= 12.50) and (fWinPct < 14.29) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '8.0';
               end;

               if (fWinPct >= 11.11) and (fWinPct < 12.50) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '9.0';
               end;

               if (fWinPct >= 10.00) and (fWinPct < 11.11) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '10.0';
               end;

               if (fWinPct >= 9.09) and (fWinPct < 10.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '11.0';
               end;

               if (fWinPct >= 8.33) and (fWinPct < 9.09) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '12.0';
               end;

               if (fWinPct >= 7.69) and (fWinPct < 8.33) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '13.0';
               end;

               if (fWinPct >= 7.14) and (fWinPct < 7.69) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '14.0';
               end;
               if (fWinPct >= 6.67) and (fWinPct < 7.14) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '15.0';
               end;

               if (fWinPct >= 6.25) and (fWinPct < 6.67) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '16.0';
               end;

               if (fWinPct >= 5.88) and (fWinPct < 6.25) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '17.0';
               end;

               if (fWinPct >= 5.56) and (fWinPct < 5.88) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '18.0';
               end;

               if (fWinPct >= 5.26) and (fWinPct < 5.56) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '19.0';
               end;

               if (fWinPct >= 5.00) and (fWinPct < 5.26) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '20.0';
               end;

               if (fWinPct >= 4.76) and (fWinPct < 5.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '21.0';
               end;

               if (fWinPct >= 4.55) and (fWinPct < 4.76) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '22.0';
               end;

               if (fWinPct >= 4.35) and (fWinPct < 4.55) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '23.0';
               end;

               if (fWinPct >= 4.17) and (fWinPct < 4.35) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '24.0';
               end;

               if (fWinPct >= 4.00) and (fWinPct < 4.17) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '25.0';
               end;

               if (fWinPct >= 3.85) and (fWinPct < 4.00) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '26.0';
               end;

               if (fWinPct >= 3.23) and (fWinPct < 3.85) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '35.0';
               end;

               if (fWinPct >= 2.78) and (fWinPct < 3.23) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '40.0';
               end;

               if (fWinPct >= 2.44) and (fWinPct < 2.78) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '45.0';
               end;

               if (fWinPct >= 2.17) and (fWinPct < 2.44) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := 's50.0';
               end;

               if (fWinPct >= 1.96) and (fWinPct < 2.17) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '55.0';
               end;

               if (fWinPct >= 1.33) and (fWinPct < 1.96) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '80.0';
               end;

               if (fWinPct < 1.33) then begin
                  tblW.FieldByName('ConditionalMinOdds').AsString := '98.1';
               end;


               tblW.FieldByName('ConditionalWager').AsString := 'Y';

               if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean) then begin
                  tblW.FieldByName('ComboType').Value := 'TRAINER';
               end;
               
               if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean=True) then begin
                  tblW.FieldByName('ComboType').Value := 'SPEED';
                  if ((tblE.FieldByName('IsEliminated').AsBoolean=False) and
                     (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) and
                     (tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean=true)) then begin
                     tblW.FieldByName('ComboType').Value := 'TWINSPIRE';
                  end;
               end;

               tblW.FieldByName('BetType').Value := 'WN';

               tblW.FieldByName('Owner').Value := tblE.FieldByName('Owner').Value;
               tblW.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
               tblW.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
               tblW.FieldByName('WagerSheetOrder').Value := tblR.FieldByName('WagerSheetOrder').Value;

               tblW.FieldByName('DaysLast').Value := tblE.FieldByName('DaysLast').Value;
               tblW.FieldByName('TodaysWagerOrderKey').Value := tblE.FieldByName('TodaysWagerOrderKey').Value;
               tblW.FieldByName('TodaysWagerWinPct').Value := tblE.FieldByName('TodaysWagerWinPct').Value;
               tblW.FieldByName('MorningLineTo1Rank').Value := tblE.FieldByName('MorningLineTo1Rank').Value;

               tblW.FieldByName('Power').Value := tblE.FieldByName('Power').Value;
               tblW.FieldByName('PowerAdvantage').Value := tblE.FieldByName('PowerAdvantage').Value;

               tblW.FieldByName('PowerRank').Value := tblE.FieldByName('PowerRank').Value;
               tblW.FieldByName('LastSpeedRank').Value := tblE.FieldByName('LastSpeedRank').Value;
               tblW.FieldByName('BackSpeedRank').Value := tblE.FieldByName('BackSpeedRank').Value;
               tblW.FieldByName('AvgClassRank').Value := tblE.FieldByName('AvgClassRank').Value;

               tblW.FieldByName('WorkLine1').Value := tblE.FieldByName('WorkLine1').Value;
               tblW.FieldByName('WorkLine2').Value := tblE.FieldByName('WorkLine2').Value;

               tblW.FieldByName('LastJockey').Value := tblE.FieldByName('LastJockey').Value;
               tblW.FieldByName('LastTrkCode').Value := tblE.FieldByName('LastTrkCode').Value;
               tblW.FieldByName('LastSurface').Value := tblE.FieldByName('LastSurf').Value;
               tblW.FieldByName('LastDistanceDesc').Value := tblE.FieldByName('LastDistanceDesc').Value;

               tblW.Post();
            end;
            tblE.Next();
         end;



      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

   finally
      tblE.Filtered := False;
      tblE.Filter := '';
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblT);
      CloseTable(tblW);
      ClearPrgStatusBars();

   end;

end;


end.

