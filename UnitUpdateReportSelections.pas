unit UnitUpdateReportSelections;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateReportSelections(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer;
   bLast30Days: boolean
   );

procedure UpdateWagerSelectedRank
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitSetRanking;

procedure UpdateReportSelections
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblTrk: TDBISAMTable;
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
   bSpeedSheetSelected: boolean;

   bPrintedOnValueSheet: boolean;

   b2yoBred: boolean;
   b1stBred: boolean;
   bTurfBred: boolean;

   fNormalMorningLineProbability: double;
   fNormalTodaysWagerProbability: double;

   fNormalMorningLineProbabilitySquared: double;
   fNormalTodaysWagerProbabilitySquared: double;

   fNormalMorningLineOdds: double;
   fNormalTodaysWagerOdds: double;

   fNormalMorningLineOddsSquared: double;
   fNormalTodaysWagerOddsSquared: double;

   bDollar: boolean;
   bDoubleDollar: boolean;

   iStaCnt: integer;
   iTotalCnt: integer;

   iPointsRank: integer;

   iTotalConnectionsRank: integer;
   iTotalPedigreeRank: integer;
   iTotalPaceRank: integer;
   iTotalSpdClsRank: integer;

   iTotalConnections: integer;
   iTotalPedigree: integer;
   iTotalPace: integer;
   iTotalSpdCls: integer;

   iFinalWinPctRank: integer;
   iMorningLineTo1Rank: integer;
   iTodaysWagerWinPctRank: integer;

   iOwnWinsRank: integer;
   iOwnEarningsRank: integer;
   iLatePaceRank: integer;

   bXS: boolean;
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

   bTopOwnerSheetSelected: boolean;

   bSpecialSheetSelected: boolean;

   iQSP1stCall: integer;
   iQSP1stCallRank: integer;
   iKSP1stCall: integer;
   iKSP1stCallRank: integer;
   sQSP1stCallRunStyle: string;

   iQSP2ndCall: integer;
   iQSP2ndCallRank: integer;
   iKSP2ndCall: integer;
   iKSP2ndCallRank: integer;
   sQSP2ndCallRunStyle: string;


   bQSP: boolean;
   bKSP: boolean;

   bQSP2: boolean;
   bKSP2: boolean;

   iDollarCnt: integer;

   sSurface: string;
   sRaceType: string;
   sTurfIndicator: string;
   sDebutIndicator: string;
   sRouteIndicator: string;
   iAge: integer;

   sTodaysWagerTopChoice: string;
   sTodaysWagerSecondChoice: string;
   sTodaysWagerThirdChoice: string;
   sTodaysWagerFourthChoice: string;
   sTodaysWagerFifthChoice: string;
   sTodaysWagerSixthChoice: string;
   sTodaysWagerSeventhChoice: string;

   sProgramNbr: string;
begin

   hLog.AddToLog('UpdateReportSelections', msevOperation);

   try
      try
         OpenTable(tblR);
         OpenTable(tblE);
         OpenTable(tblTrk);

         if (bLast30Days) then begin
            tblE.IndexName := 'ByRangeRaceDate';

            tblE.SetRangeStart;
            tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - 1);
            //         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - PREV_WEEK_DAYS);
            tblE.KeyFieldCount := 1;

            tblE.SetRangeEnd;
            tblE.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblE.KeyFieldCount := 1;

            tblE.ApplyRange;

            tblR.IndexName := 'ByRangeRaceDate';

            tblR.SetRangeStart;
            tblR.FieldByName('RangeRaceDate').AsDateTime := (Now() - 1);
            //         tblE.FieldByName('RangeRaceDate').AsDateTime := (Now() - PREV_WEEK_DAYS);
            tblR.KeyFieldCount := 1;

            tblR.SetRangeEnd;
            tblR.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
            tblR.KeyFieldCount := 1;

            tblR.ApplyRange;
         end;


         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Commit;
         end;

         tblE.Filtered := False;
         InitPrgBar(tblE.RecordCount);

         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction();
         end;

         UpdateStatusBar('Report Selections ');
         while not tblE.Eof do begin
            IncPrgBar();
            Application.ProcessMessages();

            if (bLast30Days) then begin
               if tblE.FieldByName('RaceDate').AsDateTime < (Now() - PREV_WEEK_DAYS) then begin
                  tblE.Next();
                  continue;
               end;
            end;

            if (iStaCnt > BATCH_SIZE) then begin
               UpdateStatusBar('Update Report Selections ');
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


            if ((UpperCase(tblR.TableName) = 'PREVDAYRH') or (UpperCase(tblR.TableName) = 'PREVWEEKRH')) then begin
               tblR.IndexName := 'ByActualPrimary';
               tblR.SetKey();
               tblR.FieldByName('RangeRaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('TrkCode').AsString := tblE.FieldByName('TrkCode').Value;
               tblR.FieldByName('RaceNbr').AsInteger := tblE.FieldByName('RaceNbr').Value;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            end else begin
               tblR.IndexName := '';
               tblR.SetKey();
               tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
               tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
               tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            end;

            if tblR.GotoKey() then begin

               tblR.Edit();

               //Put these here again so we can plug those values to history files also
               tblE.Edit();


               bWagerSheetSelected := False;
               bLinerSheetSelected := False;
               bOverlaySheetSelected := False;
               bSpeedSheetSelected := False;
               bPrintedOnValueSheet := False;

               sSurface := tblR.FieldByName('Surface').AsString;
               sRaceType := tblR.FieldByName('RaceType').AsString;

               iAge := tblE.FieldByName('Age').AsInteger;
               sTurfIndicator := tblE.FieldByName('TurfIndicator').AsString;
               sDebutIndicator := tblE.FieldByName('DebutIndicator').AsString;
               sRouteIndicator := tblE.FieldByName('RouteIndicator').AsString;

               if (UpperCase(tblE.TableName) = 'ENTRY') then begin
                  bPrintedOnValueSheet := tblE.FieldByName('IsPrintedOnValueSheet').AsBoolean;
                  bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;

                  bFrontDoubleLiner0 := tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean;
                  bFrontDoubleLiner1 := tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean;
                  bFrontDoubleLiner2 := tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean;
                  bFrontDoubleLiner3 := tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean;

                  bBackDoubleLiner0 := tblE.FieldByName('IsBackDoubleLiner0').AsBoolean;
                  bBackDoubleLiner1 := tblE.FieldByName('IsBackDoubleLiner1').AsBoolean;
                  bBackDoubleLiner2 := tblE.FieldByName('IsBackDoubleLiner2').AsBoolean;
                  bBackDoubleLiner3 := tblE.FieldByName('IsBackDoubleLiner3').AsBoolean;

                  bTripleLiner0 := tblE.FieldByName('IsTripleLiner0').AsBoolean;
                  bTripleLiner1 := tblE.FieldByName('IsTripleLiner1').AsBoolean;
                  bTripleLiner2 := tblE.FieldByName('IsTripleLiner2').AsBoolean;
                  bTripleLiner3 := tblE.FieldByName('IsTripleLiner3').AsBoolean;

                  bLinerSheetSelected := False;
                  if (bTripleLiner0 or bFrontDoubleLiner0 or bBackDoubleLiner0 or
                     bTripleLiner1 or bFrontDoubleLiner1 or bBackDoubleLiner1 or
                     bTripleLiner2 or bFrontDoubleLiner2 or bBackDoubleLiner2 or
                     bTripleLiner3 or bFrontDoubleLiner3 or bBackDoubleLiner3) then begin
                     bLinerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                     bLinerSheetSelected := True;
                  end;
                  if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                     bLinerSheetSelected := True;
                  end;
                  if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                     bLinerSheetSelected := True;
                  end;


                  bSpeedSheetSelected := False;

                  iQSP1stCall := tblE.FieldByName('QSP1stCall').AsInteger;
                  iQSP1stCallRank := tblE.FieldByName('QSP1stCallRank').AsInteger;
                  if ((UpperCase(tblR.TableName) <> 'PREVDAYRH') and (UpperCase(tblR.TableName) <> 'PREVWEEKRH')) then begin
                     sQSP1stCallRunStyle := tblE.FieldByName('QSP1stCallRunStyle').AsString;
                  end;
                  if (iQSP1stCallRank = 1) then begin
                     bQSP := True;
                  end else begin
                     bQSP := False;
                  end;

                  iKSP1stCall := tblE.FieldByName('KSP1stCall').AsInteger;
                  iKSP1stCallRank := tblE.FieldByName('KSP1stCallRank').AsInteger;
                  if (iKSP1stCallRank = 1) then begin
                     bKSP := True;
                  end else begin
                     bKSP := False;
                  end;

                  iQSP2ndCall := tblE.FieldByName('QSP2ndCall').AsInteger;
                  iQSP2ndCallRank := tblE.FieldByName('QSP2ndCallRank').AsInteger;
                  if ((UpperCase(tblR.TableName) <> 'PREVDAYRH') and (UpperCase(tblR.TableName) <> 'PREVWEEKRH')) then begin
                     sQSP2ndCallRunStyle := tblE.FieldByName('QSP2ndCallRunStyle').AsString;
                  end;
                  if (iQSP2ndCallRank = 1) then begin
                     bQSP2 := True;
                  end else begin
                     bQSP2 := False;
                  end;

                  iKSP2ndCall := tblE.FieldByName('KSP2ndCall').AsInteger;
                  iKSP2ndCallRank := tblE.FieldByName('KSP2ndCallRank').AsInteger;
                  if (iKSP2ndCallRank = 1) then begin
                     bKSP2 := True;
                  end else begin
                     bKSP2 := False;
                  end;




                  //               bDollar := tblE.FieldByName('IsDollar').AsBoolean;
                  //               bDoubleDollar := tblE.FieldByName('IsDoubleDollar').AsBoolean;

                  b2yoBred := tblE.FieldByName('Is2yoBred').AsBoolean;
                  b1stBred := tblE.FieldByName('Is1stBred').AsBoolean;
                  bTurfBred := tblE.FieldByName('IsTurfBred').AsBoolean;

                  // if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
 //                     if (b1stBred) then begin
 //                        if ((sDebutIndicator = '*')) then begin
 //                           if (tblE.FieldByName('TotalTrnDebutStarts').AsInteger > 5) then begin
 //                              if (tblE.FieldByName('TotalTrnDebutWinPct').AsFloat > 10) then begin
 //                                 bWagerSheetSelected := True;
 //                              end;
 //                           end;
 //                        end;
 //                     end;
 //                  end;
 //
 //                  if ((sRaceType = 'MSW') or (sRaceType = 'MCL')) then begin
 //                     if (b1stBred) then begin
 //                        if ((sDebutIndicator = '**')) then begin
 //                           if (tblE.FieldByName('TotalTrnDebutTwoStarts').AsInteger > 5) then begin
 //                              if (tblE.FieldByName('TotalTrnDebutTwoWinPct').AsFloat > 10) then begin
 //                                 bWagerSheetSelected := True;
 //                              end;
 //                           end;
 //                        end;
 //                     end;
 //                  end;
 //
 //                  if (sSurface = 'T') then begin
 //                     if (bTurfBred) then begin
 //                        if ((sTurfIndicator = '**') or (sTurfIndicator = '*')) then begin
 //                           if (tblE.FieldByName('TotalTrnTurfStarts').AsInteger > 5) then begin
 //                              if (tblE.FieldByName('TotalTrnTurfWinPct').AsFloat > 10) then begin
 //                                 bWagerSheetSelected := True;
 //                              end;
 //                           end;
 //                        end;
 //                     end;
 //                  end;

                  // if (tblE.FieldByName('TotalTrnJkyStarts').AsInteger > 10) then begin
 //                     if (tblE.FieldByName('TotalTrnJkyWinPct').AsInteger > 25) then begin
 //                        bWagerSheetSelected := True;
 //                     end;
 //                  end;
 //
 //                  if (tblE.FieldByName('TotalTrnOwnStarts').AsInteger > 10) then begin
 //                     if (tblE.FieldByName('TotalTrnOwnWinPct').AsInteger > 25) then begin
 //                        bWagerSheetSelected := True;
 //                     end;
//               end;
               //if ((iOwnWinsRank > 0) and (iOwnWinsRank <> 9999)) or ((iOwnEarningsRank > 0) and (iOwnEarningsRank <> 9999)) then begin
               //
               //end;

                  iTotalSpdCls := 0;
                  if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                     Inc(iTotalSpdCls);
                     bWagerSheetSelected := True;
                  end;
                  if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                     Inc(iTotalSpdCls);
                     bWagerSheetSelected := True;
                  end;
                  if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                     Inc(iTotalSpdCls);
                     bWagerSheetSelected := True;
                  end;
                  if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                     bWagerSheetSelected := True;
                  end;


                  iMorningLineTo1Rank := tblE.FieldByName('MorningLineTo1Rank').AsInteger;
                  iTodaysWagerWinPctRank := tblE.FieldByName('TodaysWagerWinPctRank').AsInteger;
                  iLatePaceRank := tblE.FieldByName('LatePaceRank').AsInteger;

                  iOwnWinsRank := tblE.FieldByName('OwnWinsRank').AsInteger;
                  iOwnEarningsRank := tblE.FieldByName('OwnEarningsRank').AsInteger;

                  bWagerSheetSelected := False;
                  bTopOwnerSheetSelected := False;


                  //if ((bQSP) and (bQSP2)) then begin
                  //   bWagerSheetSelected := True;
                  //end;

                  //if ((bKSP) and (bKSP2)) then begin
                  //   bWagerSheetSelected := True;
                  //end;

                  //if (iTotalSpdCls > 0) then begin
                  //   bWagerSheetSelected := True;
                  //end;

                  if (bLinerSheetSelected) then begin
                     bWagerSheetSelected := True;
                  end;


                  //if ((iOwnWinsRank > 0) and (iOwnWinsRank <> 9999)) or ((iOwnEarningsRank > 0) and (iOwnEarningsRank <> 9999)) then begin
                  //   bWagerSheetSelected := True;
                  //end;

                  //if (iLatePaceRank = 1) then begin
                  //   bWagerSheetSelected := True;
                  //end;


                //  if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
   //                     (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
   //                     if (b1stBred) then begin
   //                        if (tblE.FieldByName('TotalTrnOddsWinPct').AsInteger > 7) then begin
   //                           bWagerSheetSelected := True;
   //                        end;
   //                     end;
   //                  end;
   //
   //                  if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
   //                     (tblR.FieldByName('RaceType').AsString = 'MCL')) and
   //                     (tblE.FieldByName('Age').AsInteger = 2) then begin
   //                     if (b2yoBred) then begin
   //                        if (tblE.FieldByName('TotalTrnOddsWinPct').AsInteger > 7) then begin
   //                           bWagerSheetSelected := True;
   //                        end;
   //                     end;
   //                  end;
   //
   //                  if (tblR.FieldByName('Surface').AsString = 'T') then begin
   //                     if (bTurfBred) then begin
   //                        if (tblE.FieldByName('TotalTrnTurfWinPct').AsInteger > 7) then begin
   //                           bWagerSheetSelected := True;
   //                        end;
   //                     end;
   //                  end;

                  if (tblE.FieldByName('PowerAdvantageKey').AsInteger > 0) then begin
                     bWagerSheetSelected := True;
                  end;


                  // a bad post is a bad post
                  //if (tblE.FieldByName('PostPosWinPct').AsFloat < 6.00) then begin
                  //    if (tblE.FieldByName('PostPosStarts').AsInteger > 20) then begin
                  //      bWagerSheetSelected := False;
                  //   end;
                  //end;



                  // if (tblE.FieldByName('ValueROI').AsFloat > 0.00) then begin
                  //    bWagerSheetSelected := True;
                  // end;

                  bOverlaySheetSelected := False;

                  // iDollarCnt := 0;
    //
    //               if (tblE.FieldByName('ValueROI').AsFloat > 0.00) then begin
    //                  if ((tblE.FieldByName('ValueROICnt').AsInteger > 0) and (tblE.FieldByName('ValueROICnt').AsInteger <= 1)) then begin
    //                     iDollarCnt := 1;
    //                  end;
    //                  if ((tblE.FieldByName('ValueROICnt').AsInteger >= 2) and (tblE.FieldByName('ValueROICnt').AsInteger <= 3)) then begin
    //                     iDollarCnt := 2;
    //                  end;
    //                  if ((tblE.FieldByName(tblE.FieldByName('ValueROICnt').AsInteger >= 4) and (tblE.FieldByName('ValueROICnt').AsInteger <= 9)) then begin
    //                        iDollarCnt := 3;
    //                     end;
    //               end;
    //
    //
    //               tblE.FieldByName('DollarCnt').AsInteger := iDollarCnt;

                   //if (tblE.FieldByName('ValueROICnt').AsInteger > 1) then begin
                   //   bWagerSheetSelected := True;
                   //end;

                  bOverlaySheetSelected := False;



                  //
                  if (tblE.FieldByName('PowerAdvantageKey').AsInteger > 6) then begin
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                     //tblE.FieldByName('IsEliminated').AsBoolean := False;
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('EarlyPaceAdvantageWinPctRank').AsInteger = 1) then begin
                     //tblE.FieldByName('IsEliminated').AsBoolean := False;
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('MiddlePaceAdvantageWinPctRank').AsInteger = 1) then begin
                     //tblE.FieldByName('IsEliminated').AsBoolean := False;
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('LatePaceAdvantageWinPctRank').AsInteger = 1) then begin
                     //tblE.FieldByName('IsEliminated').AsBoolean := False;
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('PowerAdvantageKey').AsInteger > 6) then begin
                     //tblE.FieldByName('IsEliminated').AsBoolean := False;
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('IsValueDebutTwoSelected').AsBoolean) then begin
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('IsValueDebutSelected').AsBoolean) then begin
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('IsValueWagerSelected').AsBoolean) then begin
                     bWagerSheetSelected := True;
                  end;

                  if (tblE.FieldByName('IsEliminated').AsBoolean = True) then begin
                     bWagerSheetSelected := False;
                  end;

                  if bWagerSheetSelected then begin
                     tblR.FieldByName('IsWagerSheetSelected').AsBoolean := True;
                  end;

                  //                 sTodaysWagerTopChoice := '';
                 //                  sTodaysWagerSecondChoice := '';
                 //                  sTodaysWagerThirdChoice := '';
                 //                  sTodaysWagerFourthChoice := '';
                 //                  sTodaysWagerFifthChoice := '';
                 //                  sTodaysWagerSixthChoice := '';
                 //
                 //                  sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                 //                     sTodaysWagerTopChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 2) then begin
                 //                     sTodaysWagerSecondChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 3) then begin
                 //                     sTodaysWagerThirdChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 4) then begin
                 //                     sTodaysWagerFourthChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 5) then begin
                 //                     sTodaysWagerFifthChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //                  if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 6) then begin
                 //                     sTodaysWagerSixthChoice := Trim(sProgramNbr);
                 //                  end;
                 //
                 //
                 //                  tblR.FieldByName('TodaysWagerOrder').AsString := sTodaysWagerTopChoice + '-' +
                 //                     sTodaysWagerSecondChoice + '-' +
                 //                     sTodaysWagerThirdChoice + '-' +
                 //                     sTodaysWagerFourthChoice + '-' +
                 //                     sTodaysWagerFifthChoice + '-' +
                 //                     sTodaysWagerSixthChoice;
                 //

                                   // No Redeeming
                  if (tblE.FieldByName('ElimWinPct').AsFloat > 0.00) then begin
                     bWagerSheetSelected := False;
                  end;

                  if (tblE.FieldByName('Elim2WinPct').AsFloat > 0.00) then begin
                     bWagerSheetSelected := False;
                  end;
                  if (tblE.FieldByName('ElimWinPct').AsFloat > 0) then begin
                     tblE.FieldByName('IsEliminated').AsBoolean := True;
                  end;

                  if (tblE.FieldByName('Elim2WinPct').AsFloat > 0) then begin
                     tblE.FieldByName('IsEliminated').AsBoolean := True;
                  end;

                  //tblE.FieldByName('IsWagerSheetSelected').AsBoolean := bWagerSheetSelected;
               end;

               tblE.Post();
               tblR.Post();
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

      tblR.CancelRange;
      tblE.CancelRange;
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblTrk);
      ClearPrgStatusBars();
   end;

end;


procedure UpdateWagerSelectedRank
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: integer;
   bOneDay: boolean;
   iNbrOfDays: integer
   );

begin

   hLog.AddToLog('UpdateWagerSelectedRank', msevOperation);
   try
      SetRankingBoolean(tblE, 'ByWagerSelected', 'WagerSelectedRank', 'IsWagerSheetSelected', pnlPrgBar, prgBar, staBar, iIncCnt, iNbrOFDays);
   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


end.

