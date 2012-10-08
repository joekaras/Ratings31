unit UnitUpdateHHFromToday;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateHHFromToday(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRH: TDBISAMTable;
   tblHH: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, UnitGetHandicappingKeys;

procedure UpdateHHFromToday(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRH: TDBISAMTable;
   tblHH: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer);
var
   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCount: integer;

   procedure FldHHFromToday(tblR: TDBISAMTable;
      tblE: TDBISAMTable;
      tblRH: TDBISAMTable;
      tblHH: TDBISAMTable
      );
   var
      sRaceType: string;
   begin

      tblHH.FieldByName('TypeOfRace').Value := tblR.FieldByName('TypeOfRace').Value;
      //      tblHH.FieldByName('EstTimeOfFirstRace').Value := tblR.FieldByName('EstTimeOfFirstRace').Value;
      tblHH.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;

      sRaceType := tblR.FieldByName('RaceType').AsString;

      if sRaceType = 'HCP' then begin
         sRaceType := 'STK';
      end;
      if sRaceType = 'OCLM' then begin
         sRaceType := 'CLM';
      end;
      if sRaceType = 'SHCP' then begin
         sRaceType := 'STK';
      end;
      if sRaceType = 'UNK' then begin
         sRaceType := 'CLM';
      end;
      if sRaceType = '' then begin
         sRaceType := 'CLM';
      end;

      tblHH.FieldByName('RangeRaceDate').Value := tblE.FieldByName('RangeRaceDate').Value;
      tblHH.FieldByName('RaceType').Value := sRaceType;
      tblHH.FieldByName('Surface').Value := GetAxcisSurface(dm.tblRaces.FieldByName('Surface').AsString);
      tblHH.FieldByName('ClaimingPrice').Value := dm.tblRaces.FieldByName('ClaimingPrice').Value;
      tblHH.FieldByName('Purse').Value := dm.tblRaces.FieldByName('Purse').Value;
      if tblHH.FieldByName('Surface').Value = 'D' then begin
         tblHH.FieldByName('TrkCond').AsString := 'FT';
      end else begin
         tblHH.FieldByName('TrkCond').AsString := 'FM';
      end;

      //      tblHH.FieldByName('AvgPurse').Value := tblE.FieldByName('AvgPurse').Value;
      tblHH.FieldByName('Entry').Value := tblE.FieldByName('Entry').Value;
      tblHH.FieldByName('ProgramNbr').Value := tblE.FieldByName('ProgramNbr').Value;
      tblHH.FieldByName('ProgramNbrSort').Value := tblE.FieldByName('ProgramNbrSort').Value;
      tblHH.FieldByName('MorningLineDesc').Value := tblE.FieldByName('MorningLineDesc').Value;

      tblHH.FieldByName('HorseName').Value := tblE.FieldByName('HorseName').Value;
      tblHH.FieldByName('Med').Value := tblE.FieldByName('Med').Value;
      tblHH.FieldByName('Equip').Value := tblE.FieldByName('Equip').Value;

      //
      // tblHH.FieldByName('IsDebut').Value := tblE.FieldByName('IsDebut').Value;
      // tblHH.FieldByName('IsDebutTwo').Value := tblE.FieldByName('IsDebutTwo').Value;

      //
      tblHH.FieldByName('IsFirstTimeJuice').Value := tblE.FieldByName('IsFirstTimeJuice').Value;

      //
      tblHH.FieldByName('IsBlinkersOn').Value := tblE.FieldByName('IsBlinkersOn').Value;
      tblHH.FieldByName('IsBlinkersOff').Value := tblE.FieldByName('IsBlinkersOff').Value;

      //
      tblHH.FieldByName('TurfIndicator').Value := tblE.FieldByName('TurfIndicator').Value;
      tblHH.FieldByName('DebutIndicator').Value := tblE.FieldByName('DebutIndicator').Value;
      tblHH.FieldByName('RouteIndicator').Value := tblE.FieldByName('RouteIndicator').Value;
      tblHH.FieldByName('MudIndicator').Value := tblE.FieldByName('MudIndicator').Value;

      //      tblHH.FieldByName('IsScratched').Value := tblE.FieldByName('IsScratched').Value;
      tblHH.FieldByName('Age').Value := tblE.FieldByName('Age').Value;
      tblHH.FieldByName('Sex').Value := tblE.FieldByName('Sex').Value;
      //      tblHH.FieldByName('Color').Value := tblE.FieldByName('Color').Value;
      tblHH.FieldByName('Weight').Value := tblE.FieldByName('Weight').Value;


      //
      tblHH.FieldByName('Owner').Value := tblE.FieldByName('Owner').Value;
      tblHH.FieldByName('Trainer').Value := tblE.FieldByName('Trainer').Value;
      tblHH.FieldByName('Jockey').Value := tblE.FieldByName('Jockey').Value;
      tblHH.FieldByName('Breeder').Value := tblE.FieldByName('Breeder').Value;
      tblHH.FieldByName('BredIn').Value := tblE.FieldByName('BredIn').Value;
      tblHH.FieldByName('Sire').Value := tblE.FieldByName('Sire').Value;
      tblHH.FieldByName('Dam').Value := tblE.FieldByName('Dam').Value;
      tblHH.FieldByName('DamSire').Value := tblE.FieldByName('DamSire').Value;

      //
      tblHH.FieldByName('TrnWinsRank').Value := tblE.FieldByName('TrnWinsRank').Value;
      tblHH.FieldByName('TrnEarningsRank').Value := tblE.FieldByName('TrnEarningsRank').Value;
      tblHH.FieldByName('TrnTrackRank').Value := tblE.FieldByName('TrnTrackRank').Value;
      tblHH.FieldByName('JkyWinsRank').Value := tblE.FieldByName('JkyWinsRank').Value;
      tblHH.FieldByName('JkyEarningsRank').Value := tblE.FieldByName('JkyEarningsRank').Value;
      tblHH.FieldByName('JkyTrackRank').Value := tblE.FieldByName('JkyTrackRank').Value;
      tblHH.FieldByName('OwnWinsRank').Value := tblE.FieldByName('OwnWinsRank').Value;
      tblHH.FieldByName('OwnEarningsRank').Value := tblE.FieldByName('OwnEarningsRank').Value;

      //
      tblHH.FieldByName('DaysLast').Value := tblE.FieldByName('DaysLast').Value;
      //      tblHH.FieldByName('DaysLastWork').Value := tblE.FieldByName('DaysLastWork').Value;
      //      tblHH.FieldByName('DaysLastWork2').Value := tblE.FieldByName('DaysLastWork2').Value;
      //      tblHH.FieldByName('DaysLastWork3').Value := tblE.FieldByName('DaysLastWork3').Value;
            //
      //      tblHH.FieldByName('NbrWorksLast').Value := tblE.FieldByName('NbrWorksLast').Value;
      //      tblHH.FieldByName('StartsWorks21').Value := tblE.FieldByName('StartsWorks21').Value;


      //      tblHH.FieldByName('TodaysWagerOrderKey').Value := tblE.FieldByName('TodaysWagerOrderKey').Value;
      tblHH.FieldByName('TodaysWagerWinPct').Value := tblE.FieldByName('TodaysWagerWinPct').Value;
      tblHH.FieldByName('TodaysWagerWinPctRank').Value := tblE.FieldByName('TodaysWagerWinPctRank').Value;
      tblHH.FieldByName('TodaysWagerValueBet').Value := tblE.FieldByName('TodaysWagerValueBet').Value;
      //      tblHH.FieldByName('TodaysWagerLineTo1Fair').AsFloat := tblE.FieldByName('TodaysWagerLineTo1Fair').Value;

      tblHH.FieldByName('MorningLineTo1').Value := tblE.FieldByName('MorningLineTo1').Value;
      tblHH.FieldByName('MorningLineTo1Rank').Value := tblE.FieldByName('MorningLineTo1Rank').Value;

      //      tblHH.FieldByName('IsDirtToTurf').Value := tblE.FieldByName('IsDirtToTurf').Value;
      //      tblHH.FieldByName('IsTurfToDirt').Value := tblE.FieldByName('IsTurfToDirt').Value;
      //      tblHH.FieldByName('IsSprToRte').Value := tblE.FieldByName('IsSprToRte').Value;
      //      tblHH.FieldByName('IsRteToSpr').Value := tblE.FieldByName('IsRteToSpr').Value;

            //
      tblHH.FieldByName('LastSpeed').Value := tblE.FieldByName('LastSpeed').Value;
      tblHH.FieldByName('LastSpeedRank').Value := tblE.FieldByName('LastSpeedRank').Value;

      tblHH.FieldByName('Power').Value := tblE.FieldByName('Power').Value;
      tblHH.FieldByName('PowerRank').Value := tblE.FieldByName('PowerRank').Value;

      tblHH.FieldByName('BackSpeed').Value := tblE.FieldByName('BackSpeed').Value;
      tblHH.FieldByName('BackSpeedRank').Value := tblE.FieldByName('BackSpeedRank').Value;

      //      tblHH.FieldByName('AvgClass').Value := tblE.FieldByName('AvgClass').Value;
      //      tblHH.FieldByName('AvgClassRank').Value := tblE.FieldByName('AvgClassRank').Value;

      //      tblHH.FieldByName('AvgSpeed').Value := tblE.FieldByName('AvgSpeed').Value;
      //      tblHH.FieldByName('AvgSpeedRank').Value := tblE.FieldByName('AvgSpeedRank').Value;

      //      tblHH.FieldByName('AvgClassRating').Value := tblE.FieldByName('AvgClassRating').Value;
      //      tblHH.FieldByName('AvgClassRatingRank').Value := tblE.FieldByName('AvgClassRatingRank').Value;
      //
      //      tblHH.FieldByName('BackClass').Value := tblE.FieldByName('BackClass').Value;
      //      tblHH.FieldByName('BackClassRank').Value := tblE.FieldByName('BackClassRank').Value;
      //
      //      tblHH.FieldByName('LastClass').Value := tblE.FieldByName('LastClass').Value;
      //      tblHH.FieldByName('LastClassRank').Value := tblE.FieldByName('LastClassRank').Value;

            //
      tblHH.FieldByName('EarlyPace').Value := tblE.FieldByName('EarlyPace').Value;
      tblHH.FieldByName('EarlyPaceRank').Value := tblE.FieldByName('EarlyPaceRank').Value;

      tblHH.FieldByName('EarlyPacePos').Value := tblE.FieldByName('EarlyPacePos').Value;
      tblHH.FieldByName('EarlyPacePosRank').Value := tblE.FieldByName('EarlyPacePosRank').Value;

      //
      tblHH.FieldByName('MiddlePace').Value := tblE.FieldByName('MiddlePace').Value;
      tblHH.FieldByName('MiddlePaceRank').Value := tblE.FieldByName('MiddlePaceRank').Value;

      tblHH.FieldByName('MiddlePacePos').Value := tblE.FieldByName('MiddlePacePos').Value;
      tblHH.FieldByName('MiddlePacePosRank').Value := tblE.FieldByName('MiddlePacePosRank').Value;

      //
      tblHH.FieldByName('LatePace').Value := tblE.FieldByName('LatePace').Value;
      tblHH.FieldByName('LatePaceRank').Value := tblE.FieldByName('LatePaceRank').Value;

      tblHH.FieldByName('LatePacePos').Value := tblE.FieldByName('LatePacePos').Value;
      tblHH.FieldByName('LatePacePosRank').Value := tblE.FieldByName('LatePacePosRank').Value;

      //
//      tblHH.FieldByName('FinishPacePos').Value := tblE.FieldByName('FinishPacePos').Value;
//      tblHH.FieldByName('FinishPacePosRank').Value := tblE.FieldByName('FinishPacePosRank').Value;

      //
//      tblHH.FieldByName('EarlyPaceAdvantage').Value := tblE.FieldByName('EarlyPaceAdvantage').Value;
//      tblHH.FieldByName('MiddlePaceAdvantage').Value := tblE.FieldByName('MiddlePaceAdvantage').Value;
//      tblHH.FieldByName('LatePaceAdvantage').Value := tblE.FieldByName('LatePaceAdvantage').Value;

      //
//      tblHH.FieldByName('IsClaimed1Back').Value := tblE.FieldByName('IsClaimed1Back').Value;
//      tblHH.FieldByName('IsClaimed2Back').Value := tblE.FieldByName('IsClaimed2Back').Value;
//      tblHH.FieldByName('IsLayoffAndUp').Value := tblE.FieldByName('IsLayoffAndUp').Value;
//      tblHH.FieldByName('IsClaimedAndUp').Value := tblE.FieldByName('IsClaimedAndUp').Value;
//      tblHH.FieldByName('IsClaimedAndDown').Value := tblE.FieldByName('IsClaimedAndDown').Value;

      //
//      tblHH.FieldByName('IsFirstTimeClaiming').Value := tblE.FieldByName('IsFirstTimeClaiming').Value;
//      tblHH.FieldByName('IsBelowClaimedPrice').Value := tblE.FieldByName('IsBelowClaimedPrice').Value;

      //
//      tblHH.FieldByName('LifeStarts').Value := tblE.FieldByName('LifeStarts').Value;
//      tblHH.FieldByName('LifeWins').Value := tblE.FieldByName('LifeWins').Value;
//
//      tblHH.FieldByName('TurfStarts').Value := tblE.FieldByName('TurfStarts').Value;
//      tblHH.FieldByName('TurfWins').Value := tblE.FieldByName('TurfWins').Value;
//
//      tblHH.FieldByName('MudStarts').Value := tblE.FieldByName('MudStarts').Value;
//      tblHH.FieldByName('MudWins').Value := tblE.FieldByName('MudWins').Value;
//
//      tblHH.FieldByName('TrkStarts').Value := tblE.FieldByName('TrkStarts').Value;
//      tblHH.FieldByName('TrkWins').Value := tblE.FieldByName('TrkWins').Value;
//
//      tblHH.FieldByName('RouteStarts').Value := tblE.FieldByName('RouteStarts').Value;
//      tblHH.FieldByName('RouteWins').Value := tblE.FieldByName('RouteWins').Value;
//
//      tblHH.FieldByName('SprintStarts').Value := tblE.FieldByName('SprintStarts').Value;
//      tblHH.FieldByName('SprintWins').Value := tblE.FieldByName('SprintWins').Value;
//
      tblHH.FieldByName('HorseNbr').Value := tblE.FieldByName('HorseNbr').Value;


      //
//      tblHH.FieldByName('IsDollar').Value := tblE.FieldByName('IsDollar').Value;
//      tblHH.FieldByName('IsDoubleDollar').Value := tblE.FieldByName('IsDoubleDollar').Value;
      tblHH.FieldByName('IsFrontDoubleLiner').Value := tblE.FieldByName('IsFrontDoubleLiner').Value;
      tblHH.FieldByName('IsBackDoubleLiner').Value := tblE.FieldByName('IsBackDoubleLiner').Value;
      tblHH.FieldByName('IsTripleLiner').Value := tblE.FieldByName('IsTripleLiner').Value;
      tblHH.FieldByName('IsFrontDoubleDot').Value := tblE.FieldByName('IsFrontDoubleDot').Value;
      tblHH.FieldByName('IsBackDoubleDot').Value := tblE.FieldByName('IsBackDoubleDot').Value;
      tblHH.FieldByName('IsTripleDot').Value := tblE.FieldByName('IsTripleDot').Value;
      tblHH.FieldByName('IsFrontDoubleLiner0').Value := tblE.FieldByName('IsFrontDoubleLiner0').Value;
      tblHH.FieldByName('IsBackDoubleLiner0').Value := tblE.FieldByName('IsBackDoubleLiner0').Value;
      tblHH.FieldByName('IsTripleLiner0').Value := tblE.FieldByName('IsTripleLiner0').Value;
      tblHH.FieldByName('IsFrontDoubleLiner1').Value := tblE.FieldByName('IsFrontDoubleLiner1').Value;
      tblHH.FieldByName('IsBackDoubleLiner1').Value := tblE.FieldByName('IsBackDoubleLiner1').Value;
      tblHH.FieldByName('IsTripleLiner1').Value := tblE.FieldByName('IsTripleLiner1').Value;
      tblHH.FieldByName('IsFrontDoubleLiner2').Value := tblE.FieldByName('IsFrontDoubleLiner2').Value;
      tblHH.FieldByName('IsBackDoubleLiner2').Value := tblE.FieldByName('IsBackDoubleLiner2').Value;
      tblHH.FieldByName('IsTripleLiner2').Value := tblE.FieldByName('IsTripleLiner2').Value;
      tblHH.FieldByName('IsFrontDoubleLiner3').Value := tblE.FieldByName('IsFrontDoubleLiner3').Value;
      tblHH.FieldByName('IsBackDoubleLiner3').Value := tblE.FieldByName('IsBackDoubleLiner3').Value;
      tblHH.FieldByName('IsTripleLiner3').Value := tblE.FieldByName('IsTripleLiner3').Value;

      //
      tblHH.FieldByName('QSP1stCall').AsInteger := tblE.FieldByName('QSP1stCall').AsInteger;
      tblHH.FieldByName('QSP1stCallRank').AsInteger := tblE.FieldByName('QSP1stCallRank').AsInteger;
      tblHH.FieldByName('QSPRunStyle').AsString := tblE.FieldByName('QSP1stCallRunStyle').AsString;
      tblHH.FieldByName('KSP1stCall').AsInteger := tblE.FieldByName('KSP1stCall').AsInteger;
      tblHH.FieldByName('KSP1stCallRank').AsInteger := tblE.FieldByName('KSP1stCallRank').AsInteger;

      //
      tblHH.FieldByName('QSP2ndCall').AsInteger := tblE.FieldByName('QSP2ndCall').AsInteger;
      tblHH.FieldByName('QSP2ndCallRank').AsInteger := tblE.FieldByName('QSP2ndCallRank').AsInteger;
      //      tblHH.FieldByName('QSP2ndCallRunStyle').AsString := tblE.FieldByName('QSP2ndCallRunStyle').AsString;
      tblHH.FieldByName('KSP2ndCall').AsInteger := tblE.FieldByName('KSP2ndCall').AsInteger;
      tblHH.FieldByName('KSP2ndCallRank').AsInteger := tblE.FieldByName('KSP2ndCallRank').AsInteger;

      tblHH.FieldByName('ValueROICnt').AsInteger := tblE.FieldByName('ValueRoiCnt').AsInteger;
      tblHH.FieldByName('ValueROI').AsFloat := tblE.FieldByName('ValueRoi').AsFloat;
      tblHH.FieldByName('DollarCnt').AsInteger := tblE.FieldByName('DollarCnt').AsInteger;

      tblHH.FieldByName('PowerAdvantageKey').AsInteger := tblE.FieldByName('PowerAdvantageKey').AsInteger;
      tblHH.FieldByName('PowerAdvantage').AsInteger := tblE.FieldByName('PowerAdvantage').AsInteger;
      tblHH.FieldByName('PowerAdvantageWinPct').AsFloat := tblE.FieldByName('PowerAdvantageWinPct').AsFloat;

      tblHH.FieldByName('EarlyPaceAdvantage').AsFloat := tblE.FieldByName('EarlyPaceAdvantage').AsFloat;
      tblHH.FieldByName('MiddlePaceAdvantage').AsFloat := tblE.FieldByName('MiddlePaceAdvantage').AsFloat;
      tblHH.FieldByName('LatePaceAdvantage').AsFloat := tblE.FieldByName('LatePaceAdvantage').AsFloat;

      tblHH.FieldByName('ElimWinPct').AsFloat := tblE.FieldByName('ElimWinPct').AsFloat;
      tblHH.FieldByName('Elim2WinPct').AsFloat := tblE.FieldByName('Elim2WinPct').AsFloat;

      tblHH.FieldByName('TodaysWagerWinPct').AsFloat := tblE.FieldByName('TodaysWagerWinPct').AsFloat;
      tblHH.FieldByName('TodaysWagerValueBet').AsFloat := tblE.FieldByName('TodaysWagerValueBet').AsFloat;

      tblHH.FieldByName('PaceIndicatorWinPct').AsFloat := tblE.FieldByName('PaceIndicatorWinPct').AsFloat;

      tblHH.FieldByName('EarlyPaceAdvantageWinPct').AsFloat := tblE.FieldByName('EarlyPaceAdvantageWinPct').AsFloat;
      //tblHH.FieldByName('EarlyPaceAdvantageValueBet').AsFloat := tblE.FieldByName('EarlyPaceAdvantageValueBet').AsFloat;

      tblHH.FieldByName('MiddlePaceAdvantageWinPct').AsFloat := tblE.FieldByName('MiddlePaceAdvantageWinPct').AsFloat;
      //tblHH.FieldByName('MiddlePaceAdvantageValueBet').AsFloat := tblE.FieldByName('MiddlePaceAdvantageValueBet').AsFloat;

      tblHH.FieldByName('MorningLineWinPct').AsFloat := tblE.FieldByName('MorningLineWinPct').AsFloat;

      tblHH.FieldByName('IsHeavyChalk').AsBoolean := tblE.FieldByName('IsHeavyChalk').AsBoolean;
      tblHH.FieldByName('IsEliminated').AsBoolean := tblE.FieldByName('isEliminated').AsBoolean;

      tblHH.FieldByName('MorningLineWinPct').AsFloat := tblE.FieldByName('MorningLineWinPct').Value;

      tblHH.FieldByName('b3').AsBoolean := False;
      tblHH.FieldByName('b4').AsBoolean := False;
      tblHH.FieldByName('b5').AsBoolean := False;
      tblHH.FieldByName('b6').AsBoolean := False;
      tblHH.FieldByName('TotalTrnOddsWinPct').AsFloat := tblHH.FieldByName('TotalTrnOddsWinPct').AsFloat;
      tblHH.FieldByName('TotalTrnOwnWinPct').AsFloat := tblHH.FieldByName('TotalTrnOwnWinPct').AsFloat;
      tblHH.FieldByName('TotalTrnJkyWinPct').AsFloat := tblHH.FieldByName('TotalTrnJkyWinPct').AsFloat;
      tblHH.FieldByName('TotalOwnWinPct').AsFloat := tblHH.FieldByName('TotalOwnWinPct').AsFloat;
      //      tblHH.FieldByName('f5').AsFloat := 0;
    //  tblHH.FieldByName('f6').AsFloat := 0;
//      tblHH.FieldByName('f7').AsFloat := 0;
//      tblHH.FieldByName('f8').AsFloat := 0;
//      tblHH.FieldByName('s1').AsInteger := 0;
//      tblHH.FieldByName('s2').AsInteger := 0;
//      tblHH.FieldByName('s3').AsInteger := 0;
//      tblHH.FieldByName('s4').AsInteger := 0;
//      tblHH.FieldByName('s5').AsInteger := 0;
//      tblHH.FieldByName('i1').AsInteger := 0;
//      tblHH.FieldByName('I2').AsInteger := 0;
//      tblHH.FieldByName('I3').AsInteger := 0;
//      tblHH.FieldByName('I4').AsInteger := 0;
//      tblHH.FieldByName('I5').AsInteger := 0;

      //
//      tblHH.FieldByName('AngleDesc').AsString := tblE.FieldByName('AngleDesc').AsString;

      //
      tblHH.FieldByName('IsPrintedOnValueSheet').Value := tblE.FieldByName('IsPrintedOnValueSheet').Value;
      //      tblHH.FieldByName('IsWagerSheetSelected').Value := tblE.FieldByName('IsWagerSheetSelected').Value;
      //      tblHH.FieldByName('IsOverlaySheetSelected').Value := tblE.FieldByName('IsOverLaysheetSelected').Value;
      //      tblHH.FieldByName('IsTopOwnerSheetSelected').Value := tblE.FieldByName('IsTopOwnerSheetSelected').Value;
      //      tblHH.FieldByName('IsTopOwnerOddsSheetSelected').Value := tblE.FieldByName('IsTopOwnerOddsSheetSelected').Value;
            //      tblHH.FieldByName('IsLinerSheetSelected').Value := tblE.FieldByName('IsLInerSheetSelected').Value;
            //      tblHH.FieldByName('IsSpeedSheetSelected').Value := tblE.FieldByName('IsSpeedSheetSelected').Value;
            //      tblHH.FieldByName('Is1stBredSheetSelected').Value := tblE.FieldByName('Is1stBredSheetSelected').Value;
            //      tblHH.FieldByName('IsTurfBredSheetSelected').Value := tblE.FieldByName('IsTurfBredSheetSelected').Value;
            //      tblHH.FieldByName('Is2yoBredSheetSelected').Value := tblE.FieldByName('Is2yoBredSheetSelected').Value;
            //
      //      tblHH.FieldByName('IsYouBetTrack').Value := tblE.FieldByName('IsYouBetTrack').Value;

            //      //
            //      tblHH.FieldByName('IsUpInClass').Value := tblE.FieldByName('IsUpInClass').Value;
            //      tblHH.FieldByName('IsDownInClass').Value := tblE.FieldByName('IsDownInClass').Value;
            //      tblHH.FieldByName('Is1stClaiming').Value := tblE.FieldByName('Is1stClaiming').Value;
            //      tblHH.FieldByName('Is1stMCL').Value := tblE.FieldByName('Is1stMCL').Value;
            //      tblHH.FieldByName('IsHiddenWorkout').Value := tblE.FieldByName('IsHiddenWorkout').Value;

            //      //
            //      tblHH.FieldByName('Is1stAfterLayoff').Value := tblE.FieldByName('Is1stAfterLayoff').Value;
            //      tblHH.FieldByName('Is2ndAfterLayoff').Value := tblE.FieldByName('Is2ndAfterLayoff').Value;
            //      tblHH.FieldByName('Is3rdAfterLayoff').Value := tblE.FieldByName('Is3rdAfterLayoff').Value;

            //      //
            //      tblHH.FieldByName('IsDirtToTurfToDirtAfterLayoff').Value := tblE.FieldByName('IsDirtToTurfToDirtAfterLayoff').Value;
            //      tblHH.FieldByName('IsTurfToDirtToTurfAfterLayoff').Value := tblE.FieldByName('IsTurfToDirtToTurfAfterLayoff').Value;
            //      tblHH.FieldByName('IsRouteToSprintToRouteAfterLayoff').Value := tblE.FieldByName('IsRouteToSprintToRouteAfterLayoff').Value;
            //      tblHH.FieldByName('IsSprintToRouteToSprintAfterLayoff').Value := tblE.FieldByName('IsSprintToRouteToSprintAfterLayoff').Value;

            //      //
            //      tblHH.FieldByName('IsProvenSpeed').Value := tblE.FieldByName('IsProvenSpeed').Value;
            //      tblHH.FieldByName('IsProvenSpeedPlus').Value := tblE.FieldByName('IsProvenSpeedPlus').Value;
            //      tblHH.FieldByName('IsOnlySpeed').Value := tblE.FieldByName('IsOnlySpeed').Value;
      //      tblHH.FieldByName('IsXtremeSpeed').Value := tblE.FieldByName('IsXtremeSpeed').Value;

            //tblHH.FieldByName('IsOnlySpeed2').Value := tblE.FieldByName('IsOnlySpeed2').Value;
      //      tblHH.FieldByName('IsXtremeSpeed2').Value := tblE.FieldByName('IsXtremeSpeed2').Value;

            //
      //      tblHH.FieldByName('IsLastRaceTurnMove').Value := tblE.FieldByName('IsLastRaceTurnMove').Value;
      //      tblHH.FieldByName('IsLastRaceFinalFurlongMove').Value := tblE.FieldByName('IsLastRaceFinalFurlongMove').Value;
      //      tblHH.FieldByName('IsPrevToLastRaceTurnMove').Value := tblE.FieldByName('IsPrevToLastRaceTurnMove').Value;
      //      tblHH.FieldByName('IsPrevToLastRaceFinalFurlongMove').Value := tblE.FieldByName('IsPrevToLastRaceFinalFurlongMove').Value;

            //
      //      tblHH.FieldByName('Is2yoBred').Value := tblE.FieldByName('Is2yoBred').Value;
      //      tblHH.FieldByName('Is1stBred').Value := tblE.FieldByName('Is1stBred').Value;
      //      tblHH.FieldByName('IsTurfBred').Value := tblE.FieldByName('IsTurfBred').Value;
            //
            //      //
            //      tblHH.FieldByName('IsX2yoBred').Value := tblE.FieldByName('IsX2yoBred').Value;
            //      tblHH.FieldByName('IsX1stBred').Value := tblE.FieldByName('IsX1stBred').Value;
            //      tblHH.FieldByName('IsXTurfBred').Value := tblE.FieldByName('IsXTurfBred').Value;
            //
            //      //
            //      tblHH.FieldByName('IsQuirinSpeed').Value := tblE.FieldByName('IsQuirinSpeed').Value;
            //      tblHH.FieldByName('IsKleinSpeed').Value := tblE.FieldByName('IsKleinSpeed').Value;
            //      tblHH.FieldByName('IsQuirinSpeed2').Value := tblE.FieldByName('IsQuirinSpeed2').Value;
            //      tblHH.FieldByName('IsKleinSpeed2').Value := tblE.FieldByName('IsKleinSpeed2').Value;
            //
            //      //
            //      tblHH.FieldByName('IsKeyRace').Value := tblE.FieldByName('IsKeyRace').Value;
            //      tblHH.FieldByName('IsBouncyBouncy').Value := tblE.FieldByName('IsBouncyBouncy').Value;
            //      tblHH.FieldByName('IsBestEffortLast').Value := tblE.FieldByName('IsBestEffortLast').Value;
            //      tblHH.FieldByName('IsShipIn').Value := tblE.FieldByName('IsShipIn').Value;
            //      tblHH.FieldByName('IsVerifiedClaim').Value := tblE.FieldByName('IsVerifiedClaim').Value;
            //      tblHH.FieldByName('IsUltimateFormFactor').Value := tblE.FieldByName('IsUltimateFormFactor').Value;
            //      tblHH.FieldByName('IsBetLast').Value := tblE.FieldByName('IsBetLast').Value;
            //      tblHH.FieldByName('IsFormConsistent').Value := tblE.FieldByName('IsFormConsistent').Value;
            //      tblHH.FieldByName('IsUnexpectedEarlySpeed').Value := tblE.FieldByName('IsUnexpectedEarlySpeed').Value;
            //
            //      //
            //      tblHH.FieldByName('Is1stOffLayoff').Value := tblE.FieldByName('Is1stOffLayoff').Value;
            //      tblHH.FieldByName('Is2ndOffLayoff').Value := tblE.FieldByName('Is2ndOffLayoff').Value;
            //      tblHH.FieldByName('Is3rdOffLayoff').Value := tblE.FieldByName('Is3rdOffLayoff').Value;
            //
            //      //
            //      tblHH.FieldByName('IsTrnDebutPlus').Value := tblE.FieldByName('IsTrnDebutPlus').Value;
            //      tblHH.FieldByName('IsTrnDebutTwoPlus').Value := tblE.FieldByName('IsTrnDebutTwoPlus').Value;
            //      tblHH.FieldByName('IsTrn2yoPlus').Value := tblE.FieldByName('IsTrn2yoPlus').Value;
            //      tblHH.FieldByName('IsTrnTurfPlus').Value := tblE.FieldByName('IsTrnTurfPlus').Value;
            //      tblHH.FieldByName('IsTrnTodayPlus').Value := tblE.FieldByName('IsTrnTodayPlus').Value;
            //      tblHH.FieldByName('IsTrnTodayMinus').Value := tblE.FieldByName('IsTrnTodayMinus').Value;

      tblHH.FieldByName('TotalOwnWinPct').Value := tblE.FieldByName('TotalOwnWinPct').Value;
      tblHH.FieldByName('TotalTrnJkyWinPct').Value := tblE.FieldByName('TotalTrnJkyWinPct').Value;
      tblHH.FieldByName('TotalTrnOwnWinPct').Value := tblE.FieldByName('TotalTrnOwnWinPct').Value;
      tblHH.FieldByName('TotalTrnOddsWinPct').Value := tblE.FieldByName('TotalTrnOddsWinPct').Value;

      //      tblHH.FieldByName('TotalOwnWinPct').Value := tblE.FieldByName('TotalOwnWinPct').Value;
//      tblHH.FieldByName('TotalOwnWinPctRank').Value := tblE.FieldByName('TotalOwnWinPctRank').Value;
//      tblHH.FieldByName('WagerSelectedRank').Value := tblE.FieldByName('WagerSelectedRank').Value;

   end;


begin

   hLog.AddToLog('UpdateHHFromToday', msevOperation);

   try
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblHH);
      CloseTable(tblRH);

      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblHH);
      OpenTable(tblRH);

      InitPrgBar(tblE.RecordCount);

      tblE.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end;

      while not tblE.Eof do begin
         //IncPrgBar();
         UpdateEntriesProgressStatusBar(tblE, 'Updating Horse History - ');

         if (iStaCnt > BATCH_SIZE) then begin
            staBar.SimpleText := 'Updating Horse History - ' +
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
         tblR.FieldByName('TrkCode').AsString := dm.tblEntries.FieldByName('TrkCode').AsString;
         tblR.FieldByName('RaceDate').AsDateTime := dm.tblEntries.FieldByName('RaceDate').AsDateTime;
         tblR.FieldByName('RaceNbr').AsInteger := dm.tblEntries.FieldByName('RaceNbr').AsInteger;
         if tblR.GotoKey() then begin

            tblRH.IndexName := '';
            tblRH.SetKey();
            tblRH.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
            tblRH.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
            tblRH.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;

            if (tblRH.GotoKey()) then begin
               tblRH.Edit();

               tblRH.FieldByName('WinNbrs').AsString := '';
               tblRH.FieldByName('PlcNbrs').AsString := '';
               tblRH.FieldByName('ShoNbrs').AsString := '';

               tblRH.FieldByName('ExactaNbrs').AsString := '';
               tblRH.FieldByName('ExactaWager').AsInteger := 0;
               tblRH.FieldByName('ExactaPayout').AsFloat := 0;

               tblRH.FieldByName('DailyDoubleNbrsFirstRace').AsString := '';
               tblRH.FieldByName('DailyDoubleWagerFirstRace').AsInteger := 0;
               tblRH.FieldByName('DailyDoublePayoutFirstRace').AsFloat := 0;

               tblRH.FieldByName('DailyDoubleNbrsLastRace').AsString := '';
               tblRH.FieldByName('DailyDoubleWagerLastRace').AsInteger := 0;
               tblRH.FieldByName('DailyDoublePayoutLastRace').AsFloat := 0;

               tblRH.FieldByName('TrifectaNbrs').AsString := '';
               tblRH.FieldByName('TrifectaWager').AsInteger := 0;
               tblRH.FieldByName('TrifectaPayout').AsFloat := 0;

               tblRH.FieldByName('SuperfectaNbrs').AsString := '';
               tblRH.FieldByName('SuperfectaWager').AsInteger := 0;
               tblRH.FieldByName('SuperfectaPayout').AsFloat := 0;

               tblRH.FieldByName('QuinellaNbrs').AsString := '';
               tblRH.FieldByName('QuinellaWager').AsInteger := 0;
               tblRH.FieldByName('QuinellaPayout').AsFloat := 0;

               tblRH.FieldByName('Pick3NbrsFirstRace').AsString := '';
               tblRH.FieldByName('Pick3WagerFirstRace').AsInteger := 0;
               tblRH.FieldByName('Pick3PayoutFirstRace').AsFloat := 0;

               tblRH.FieldByName('Pick3NbrsLastRace').AsString := '';
               tblRH.FieldByName('Pick3WagerLastRace').AsInteger := 0;
               tblRH.FieldByName('Pick3PayoutLastRace').AsFloat := 0;

               tblRH.FieldByName('Pick3NbrsLeg1').AsString := '';
               tblRH.FieldByName('Pick3NbrsLeg2').AsString := '';
               tblRH.FieldByName('Pick3NbrsLeg3').AsString := '';

               tblRH.FieldByName('Pick4NbrsFirstRace').AsString := '';
               tblRH.FieldByName('Pick4WagerFirstRace').AsInteger := 0;
               tblRH.FieldByName('Pick4PayoutFirstRace').AsFloat := 0;

               tblRH.FieldByName('Pick4NbrsLastRace').AsString := '';
               tblRH.FieldByName('Pick4WagerLastRace').AsInteger := 0;
               tblRH.FieldByName('Pick4PayoutLastRace').AsFloat := 0;

               tblRH.FieldByName('Pick6NbrsLastRace').AsString := '';
               tblRH.FieldByName('Pick6WagerLastRace').AsInteger := 0;
               tblRH.FieldByName('Pick6PayoutLastRace').AsFloat := 0;

               tblRH.FieldByName('Pick6NbrsFirstRace').AsString := '';
               tblRH.FieldByName('Pick6WagerFirstRace').AsInteger := 0;
               tblRH.FieldByName('Pick6PayoutFirstRace').AsFloat := 0;

               tblRH.FieldByName('WinPayout').AsFloat := 0;
               tblRH.FieldByName('WinPlcPayout').AsFloat := 0;
               tblRH.FieldByName('WinShoPayout').AsFloat := 0;

               tblRH.FieldByName('PlcPayout').AsFloat := 0;
               tblRH.FieldByName('PlcShoPayout').AsFloat := 0;

               tblRH.FieldByName('ShoPayout').AsFloat := 0;

               tblRH.FieldByName('RangeRaceDate').Value := tblR.FieldByName('RangeRaceDate').Value;
               tblRH.FieldByName('Surface').Value := GetAxcisSurface(tblR.FieldByName('Surface').Value);
               //               tblRH.FieldByName('IsEquibaseChartsProcessed').Value := tblR.FieldByName('IsEquibaseChartsProcessed').Value;
               //               tblRH.FieldByName('IsDRFChartsProcessed').Value := tblR.FieldByName('IsDRFChartsProcessed').Value;
               tblRH.FieldByName('RaceType').Value := tblR.FieldByName('RaceType').Value;
               tblRH.FieldByName('TypeOfRace').Value := tblR.FieldByName('TypeOfRace').Value;
               tblRH.FieldByName('Surface').Value := tblR.FieldByName('Surface').Value;
               tblRH.FieldByName('OrigSurface').Value := tblR.FieldByName('OrigSurface').Value;
               tblRH.FieldByName('DistanceInFeet').Value := tblR.FieldByName('DistanceInFeet').Value;
               tblRH.FieldByName('DistanceInFurlongs').Value := tblR.FieldByName('DistanceInFurlongs').Value;
               tblRH.FieldByName('DistanceInYards').Value := tblR.FieldByName('DistanceInYards').Value;
               tblRH.FieldByName('IsPk3Race').Value := tblR.FieldByName('IsPk3Race').Value;
               tblRH.FieldByName('Pk3RaceNbr').Value := tblR.FieldByName('Pk3RaceNbr').Value;
               tblRH.FieldByName('IsPk4Race').Value := tblR.FieldByName('IsPk4Race').Value;
               tblRH.FieldByName('Pk4RaceNbr').Value := tblR.FieldByName('Pk4RaceNbr').Value;
               tblRH.FieldByName('IsPk6Race').Value := tblR.FieldByName('IsPk6Race').Value;
               tblRH.FieldByName('Pk6RaceNbr').Value := tblR.FieldByName('Pk6RaceNbr').Value;
               tblRH.FieldByName('IsTriRace').Value := tblR.FieldByName('IsTriRace').Value;
               tblRH.FieldByName('IsSuperRace').Value := tblR.FieldByName('IsSuperRace').Value;
               tblRH.FieldByName('IsPk9Place').Value := tblR.FieldByName('IsPk9Place').Value;
               tblRH.FieldByName('Pk9RaceNbr').Value := tblR.FieldByName('Pk9RaceNbr').Value;
               tblRH.FieldByName('IsExaRace').Value := tblR.FieldByName('IsExaRace').Value;
               tblRH.FieldByName('IsQuiRace').Value := tblR.FieldByName('IsQuiRace').Value;
               tblRH.FieldByName('IsDDRace').Value := tblR.FieldByName('IsDDRace').Value;
               tblRH.FieldByName('DDRaceNbr').Value := tblR.FieldByName('DDRaceNbr').Value;
               tblRH.FieldByName('IsPk3Leg1').Value := tblR.FieldByName('IsPk3Leg1').Value;
               tblRH.FieldByName('IsPk4Leg1').Value := tblR.FieldByName('IsPk4Leg1').Value;
               tblRH.FieldByName('IsPk6Leg1').Value := tblR.FieldByName('IsPk6Leg1').Value;
               tblRH.FieldByName('IsPk9Leg1').Value := tblR.FieldByName('IsPk9Leg1').Value;
               tblRH.FieldByName('IsDDLeg1').Value := tblR.FieldByName('IsDDLeg1').Value;
               tblRH.FieldByName('RaceCondition1').Value := tblR.FieldByName('RaceCondition1').Value;
               tblRH.FieldByName('RaceCondition2').Value := tblR.FieldByName('RaceCondition2').Value;
               tblRH.FieldByName('RaceCondition3').Value := tblR.FieldByName('RaceCondition3').Value;
               tblRH.FieldByName('RaceCondition4').Value := tblR.FieldByName('RaceCondition4').Value;
               tblRH.FieldByName('RaceCondition5').Value := tblR.FieldByName('RaceCondition5').Value;
               tblRH.FieldByName('RaceCondition6').Value := tblR.FieldByName('RaceCondition6').Value;
               //               tblRH.FieldByName('RaceCondition7').Value := tblR.FieldByName('RaceCondition7').Value;
               //               tblRH.FieldByName('RaceCondition8').Value := tblR.FieldByName('RaceCondition8').Value;
               //               tblRH.FieldByName('RaceCondition9').Value := tblR.FieldByName('RaceCondition9').Value;
               //               tblRH.FieldByName('RaceCondition10').Value := tblR.FieldByName('RaceCondition10').Value;
               tblRH.FieldByName('BetLine').Value := tblR.FieldByName('BetLine').Value;
               tblRH.FieldByName('Purse').Value := tblR.FieldByName('Purse').Value;
               tblRH.FieldByName('ClaimingPrice').Value := tblR.FieldByName('ClaimingPrice').Value;
               //               tblRH.FieldByName('RaceConditions').Value := tblR.FieldByName('RaceConditions').Value;
               tblRH.FieldByName('TrkCond').Value := tblR.FieldByName('TrkCond').Value;
               tblRH.FieldByName('DistanceDesc').Value := tblR.FieldByName('DistanceDesc').Value;
               //               tblRH.FieldByName('OrigDistanceDesc').Value := tblR.FieldByName('OrigDistanceDesc').Value;
               //               tblRH.FieldByName('LocalTimeOfRace').Value := tblR.FieldByName('LocalTimeOfRace').Value;
               tblRH.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;
               //               tblRH.FieldByName('EstTimeOfFirstRace').Value := tblR.FieldByName('EstTimeOfFirstRace').Value;
               //               tblRH.FieldByName('IsFinalValue').Value := tblR.FieldByName('IsFinalValue').Value;
               //               tblRH.FieldByName('IsActive').Value := tblR.FieldByName('IsActive').Value;
               //               tblRH.FieldByName('IsPPValue').Value := tblR.FieldByName('IsPPValue').Value;
               //               tblRH.FieldByName('IsMLValue').Value := tblR.FieldByName('IsMLValue').Value;
               //               tblRH.FieldByName('IsChalkValue').Value := tblR.FieldByName('IsChalkValue').Value;
               //               tblRH.FieldByName('IsPlayableValue').Value := tblR.FieldByName('IsPlayableValue').Value;
               tblRH.FieldByName('IsPrintedOnValueSheet').Value := tblR.FieldByName('IsPrintedOnValueSheet').Value;
               //               tblRH.FieldByName('IsLinerSheetSelected').Value := tblR.FieldByName('IsLinerSheetSelected').Value;
               //               tblRH.FieldByName('IsOverlaySheetSelected').Value := tblR.FieldByName('IsOverlaySheetSelected').Value;
               //               tblRH.FieldByName('IsWagerSheetSelected').Value := tblR.FieldByName('IsWagerSheetSelected').Value;
               //               tblRH.FieldByName('IsTopOwnerSheetSelected').Value := tblR.FieldByName('IsTopOwnerSheetSelected').Value;
               //               tblRH.FieldByName('IsTopOwnerOddsSheetSelected').Value := tblR.FieldByName('IsTopOwnerOddsSheetSelected').Value;
               tblRH.FieldByName('IsYouBetTrack').Value := tblR.FieldByName('IsYouBetTrack').Value;
               tblRH.FieldByName('IsPTCTrack').Value := tblR.FieldByName('IsPTCTrack').Value;
               tblRH.FieldByName('IsTwinSpiresTrack').Value := tblR.FieldByName('IsTwinSpiresTrack').Value;
               //               tblRH.FieldByName('FootNotes').Value := tblR.FieldByName('FootNotes').Value;
               //               tblRH.FieldByName('Trainers').Value := tblR.FieldByName('Trainers').Value;
               //               tblRH.FieldByName('Owners').Value := tblR.FieldByName('Owners').Value;
               //               tblRH.FieldByName('ScratchedHorses').Value := tblR.FieldByName('ScratchedHorses').Value;
               //               tblRH.FieldByName('FractionalTimes').Value := tblR.FieldByName('FractionalTimes').Value;
               tblRH.FieldByName('IsExactaMatched').Value := tblR.FieldByName('IsExactaMatched').Value;
               tblRH.FieldByName('Exacta').Value := tblR.FieldByName('Exacta').Value;
               tblRH.FieldByName('ExactaNbrs').Value := tblR.FieldByName('ExactaNbrs').Value;
               tblRH.FieldByName('ExactaWager').Value := tblR.FieldByName('ExactaWager').Value;
               tblRH.FieldByName('ExactaPayout').Value := tblR.FieldByName('ExactaPayout').Value;
               tblRH.FieldByName('IsTrifectaMatched').Value := tblR.FieldByName('IsTrifectaMatched').Value;
               tblRH.FieldByName('Tri').Value := tblR.FieldByName('Tri').Value;
               tblRH.FieldByName('TrifectaNbrs').Value := tblR.FieldByName('TrifectaNbrs').Value;
               tblRH.FieldByName('TrifectaWager').Value := tblR.FieldByName('TrifectaWager').Value;
               tblRH.FieldByName('TrifectaPayout').Value := tblR.FieldByName('TrifectaPayout').Value;
               tblRH.FieldByName('IsSuperfectaMatched').Value := tblR.FieldByName('IsSuperfectaMatched').Value;
               tblRH.FieldByName('Super').Value := tblR.FieldByName('Super').Value;
               tblRH.FieldByName('SuperfectaNbrs').Value := tblR.FieldByName('SuperfectaNbrs').Value;
               tblRH.FieldByName('SuperfectaWager').Value := tblR.FieldByName('SuperfectaWager').Value;
               tblRH.FieldByName('SuperfectaPayout').Value := tblR.FieldByName('SuperfectaPayout').Value;
               tblRH.FieldByName('IsDailyDoubleMatchedFirstRace').Value := tblR.FieldByName('IsDailyDoubleMatchedFirstRace').Value;
               tblRH.FieldByName('IsDailyDoubleMatchedLastRace').Value := tblR.FieldByName('IsDailyDoubleMatchedLastRace').Value;
               tblRH.FieldByName('DDFirstRace').Value := tblR.FieldByName('DDFirstRace').Value;
               tblRH.FieldByName('DDLastRace').Value := tblR.FieldByName('DDLastRace').Value;
               tblRH.FieldByName('DailyDoubleNbrsFirstRace').Value := tblR.FieldByName('DailyDoubleNbrsFirstRace').Value;
               tblRH.FieldByName('DailyDoubleNbrsLastRace').Value := tblR.FieldByName('DailyDoubleNbrsLastRace').Value;
               tblRH.FieldByName('DailyDoubleWagerFirstRace').Value := tblR.FieldByName('DailyDoubleWagerFirstRace').Value;
               tblRH.FieldByName('DailyDoubleWagerLastRace').Value := tblR.FieldByName('DailyDoubleWagerLastRace').Value;
               tblRH.FieldByName('DailyDoublePayoutFirstRace').Value := tblR.FieldByName('DailyDoublePayoutFirstRace').Value;
               tblRH.FieldByName('DailyDoublePayoutLastRace').Value := tblR.FieldByName('DailyDoublePayoutLastRace').Value;
               tblRH.FieldByName('IsQuinellaMatched').Value := tblR.FieldByName('IsQuinellaMatched').Value;
               tblRH.FieldByName('Quinella').Value := tblR.FieldByName('Quinella').Value;
               tblRH.FieldByName('QuinellaNbrs').Value := tblR.FieldByName('QuinellaNbrs').Value;
               tblRH.FieldByName('QuinellaWager').Value := tblR.FieldByName('QuinellaWager').Value;
               tblRH.FieldByName('QuinellaPayout').Value := tblR.FieldByName('QuinellaPayout').Value;
               tblRH.FieldByName('IsPick3MatchedFirstRace').Value := tblR.FieldByName('IsPick3MatchedFirstRace').Value;
               tblRH.FieldByName('IsPick3MatchedLastRace').Value := tblR.FieldByName('IsPick3MatchedLastRace').Value;
               tblRH.FieldByName('Pick3FirstRace').Value := tblR.FieldByName('Pick3FirstRace').Value;
               tblRH.FieldByName('Pick3LastRace').Value := tblR.FieldByName('Pick3LastRace').Value;
               tblRH.FieldByName('Pick3NbrsFirstRace').Value := tblR.FieldByName('Pick3NbrsFirstRace').Value;
               tblRH.FieldByName('Pick3NbrsLastRace').Value := tblR.FieldByName('Pick3NbrsLastRace').Value;
               tblRH.FieldByName('Pick3WagerFirstRace').Value := tblR.FieldByName('Pick3WagerFirstRace').Value;
               tblRH.FieldByName('Pick3WagerLastRace').Value := tblR.FieldByName('Pick3WagerLastRace').Value;
               tblRH.FieldByName('Pick3PayoutFirstRace').Value := tblR.FieldByName('Pick3PayoutFirstRace').Value;
               tblRH.FieldByName('Pick3PayoutLastRace').Value := tblR.FieldByName('Pick3PayoutLastRace').Value;
               tblRH.FieldByName('Pick3NbrsLeg1').Value := tblR.FieldByName('Pick3NbrsLeg1').Value;
               tblRH.FieldByName('Pick3NbrsLeg2').Value := tblR.FieldByName('Pick3NbrsLeg2').Value;
               tblRH.FieldByName('Pick3NbrsLeg3').Value := tblR.FieldByName('Pick3NbrsLeg3').Value;
               tblRH.FieldByName('IsPick4MatchedFirstRace').Value := tblR.FieldByName('IsPick4MatchedFirstRace').Value;
               tblRH.FieldByName('IsPick4MatchedLastRace').Value := tblR.FieldByName('IsPick4MatchedLastRace').Value;
               tblRH.FieldByName('Pick4FirstRace').Value := tblR.FieldByName('Pick4FirstRace').Value;
               tblRH.FieldByName('Pick4LastRace').Value := tblR.FieldByName('Pick4LastRace').Value;
               tblRH.FieldByName('Pick4NbrsFirstRace').Value := tblR.FieldByName('Pick4NbrsFirstRace').Value;
               tblRH.FieldByName('Pick4NbrsLastRace').Value := tblR.FieldByName('Pick4NbrsLastRace').Value;
               tblRH.FieldByName('Pick4WagerFirstRace').Value := tblR.FieldByName('Pick4WagerFirstRace').Value;
               tblRH.FieldByName('Pick4WagerLastRace').Value := tblR.FieldByName('Pick4WagerLastRace').Value;
               tblRH.FieldByName('Pick4PayoutFirstRace').Value := tblR.FieldByName('Pick4PayoutFirstRace').Value;
               tblRH.FieldByName('Pick4PayoutLastRace').Value := tblR.FieldByName('Pick4PayoutLastRace').Value;
               tblRH.FieldByName('Pick4NbrsLeg1').Value := tblR.FieldByName('Pick4NbrsLeg1').Value;
               tblRH.FieldByName('Pick4NbrsLeg2').Value := tblR.FieldByName('Pick4NbrsLeg2').Value;
               tblRH.FieldByName('Pick4NbrsLeg3').Value := tblR.FieldByName('Pick4NbrsLeg3').Value;
               tblRH.FieldByName('Pick4NbrsLeg4').Value := tblR.FieldByName('Pick4NbrsLeg4').Value;
               tblRH.FieldByName('IsPick6MatchedFirstRace').Value := tblR.FieldByName('IsPick6MatchedFirstRace').Value;
               tblRH.FieldByName('IsPick6MatchedLastRace').Value := tblR.FieldByName('IsPick6MatchedLastRace').Value;
               tblRH.FieldByName('Pick6FirstRace').Value := tblR.FieldByName('Pick6FirstRace').Value;
               tblRH.FieldByName('Pick6LastRace').Value := tblR.FieldByName('Pick6LastRace').Value;
               tblRH.FieldByName('Pick6NbrsFirstRace').Value := tblR.FieldByName('Pick6NbrsFirstRace').Value;
               tblRH.FieldByName('Pick6NbrsLastRace').Value := tblR.FieldByName('Pick6NbrsLastRace').Value;
               tblRH.FieldByName('Pick6WagerFirstRace').Value := tblR.FieldByName('Pick6WagerFirstRace').Value;
               tblRH.FieldByName('Pick6WagerLastRace').Value := tblR.FieldByName('Pick6WagerLastRace').Value;
               tblRH.FieldByName('Pick6PayoutFirstRace').Value := tblR.FieldByName('Pick6PayoutFirstRace').Value;
               tblRH.FieldByName('Pick6PayoutLastRace').Value := tblR.FieldByName('Pick6PayoutLastRace').Value;
               tblRH.FieldByName('IsWinMatched').Value := tblR.FieldByName('IsWinMatched').Value;
               tblRH.FieldByName('WinNbrs').Value := tblR.FieldByName('WinNbrs').Value;
               tblRH.FieldByName('WinPayout').Value := tblR.FieldByName('WinPayout').Value;
               tblRH.FieldByName('WinPlcPayout').Value := tblR.FieldByName('WinPlcPayout').Value;
               tblRH.FieldByName('WinShoPayout').Value := tblR.FieldByName('WinShoPayout').Value;
               tblRH.FieldByName('IsPlcMatched').Value := tblR.FieldByName('IsPlcMatched').Value;
               tblRH.FieldByName('PlcNbrs').Value := tblR.FieldByName('PlcNbrs').Value;
               tblRH.FieldByName('PlcPayout').Value := tblR.FieldByName('PlcPayout').Value;
               tblRH.FieldByName('PlcShoPayout').Value := tblR.FieldByName('PlcShoPayout').Value;
               tblRH.FieldByName('IsShoMatched').Value := tblR.FieldByName('IsShoMatched').Value;
               tblRH.FieldByName('ShoNbrs').Value := tblR.FieldByName('ShoNbrs').Value;
               tblRH.FieldByName('ShoPayout').Value := tblR.FieldByName('ShoPayout').Value;
               //          tblRH.FieldByName('Weather').Value := tblR.FieldByName('Weather').Value;
               tblRH.FieldByName('Value').Value := tblR.FieldByName('Value').Value;
               //          tblRH.FieldByName('Chalk').Value := tblR.FieldByName('Chalk').Value;
          ////               tblRH.FieldByName('Wager1').Value := tblR.FieldByName('Wager1').Value;
          //               tblRH.FieldByName('Wager2').Value := tblR.FieldByName('Wager2').Value;
          //               tblRH.FieldByName('Wager3').Value := tblR.FieldByName('Wager3').Value;
          //               tblRH.FieldByName('Wager4').Value := tblR.FieldByName('Wager4').Value;
          //               tblRH.FieldByName('Wager5').Value := tblR.FieldByName('Wager5').Value;
          //               tblRH.FieldByName('Wager6').Value := tblR.FieldByName('Wager6').Value;
          //               tblRH.FieldByName('AltWager1').Value := tblR.FieldByName('AltWager1').Value;
          //               tblRH.FieldByName('AltWager2').Value := tblR.FieldByName('AltWager2').Value;
          //               tblRH.FieldByName('AltWager3').Value := tblR.FieldByName('AltWager3').Value;
          //               tblRH.FieldByName('AltWager4').Value := tblR.FieldByName('AltWager4').Value;
          //               tblRH.FieldByName('AltWager5').Value := tblR.FieldByName('AltWager5').Value;
          //               tblRH.FieldByName('AltWager6').Value := tblR.FieldByName('AltWager6').Value;
          //               tblRH.FieldByName('WagerFinalOrder').Value := tblR.FieldByName('WagerFinalOrder').Value;
          //               tblRH.FieldByName('WagerSheetOrder').Value := tblR.FieldByName('WagerSheetOrder').Value;
               tblRH.FieldByName('TodaysWagerOrder').Value := tblR.FieldByName('TodaysWagerOrder').Value; tblRH.FieldByName('WPSWagerAmt').Value := tblR.FieldByName('WPSWagerAmt').Value;
               tblRH.FieldByName('ExaWagerAmt').Value := tblR.FieldByName('ExaWagerAmt').Value;
               tblRH.FieldByName('QuiWagerAmt').Value := tblR.FieldByName('QuiWagerAmt').Value;
               tblRH.FieldByName('DDWagerAmt').Value := tblR.FieldByName('DDWagerAmt').Value;
               tblRH.FieldByName('Pk3WagerAmt').Value := tblR.FieldByName('Pk3WagerAmt').Value;
               tblRH.FieldByName('Pk4WagerAmt').Value := tblR.FieldByName('Pk4WagerAmt').Value;
               tblRH.FieldByName('Pk6WagerAmt').Value := tblR.FieldByName('Pk6WagerAmt').Value;
               tblRH.FieldByName('TriWagerAmt').Value := tblR.FieldByName('TriWagerAmt').Value;
               tblRH.FieldByName('SfcWagerAmt').Value := tblR.FieldByName('SfcWagerAmt').Value;
               tblRH.FieldByName('NbrStarters').Value := tblR.FieldByName('NbrStarters').Value;
               tblRH.FieldByName('NbrDebutStarters').Value := tblR.FieldByName('NbrDebutStarters').Value;
               tblRH.FieldByName('NbrDebutTwoStarters').Value := tblR.FieldByName('NbrDebutTwoStarters').Value;
               tblRH.FieldByName('NbrTurfDebutStarters').Value := tblR.FieldByName('NbrTurfDebutStarters').Value;
               tblRH.FieldByName('NbrRouteDebutStarters').Value := tblR.FieldByName('NbrRouteDebutStarters').Value;
               tblRH.FieldByName('NbrScratchedStarters').Value := tblR.FieldByName('NbrScratchedStarters').Value;
               tblRH.FieldByName('NbrRunners').Value := tblR.FieldByName('NbrRunners').Value;
               tblRH.FieldByName('RaceTypeDesc').Value := tblR.FieldByName('RaceTypeDesc').Value;
               tblRH.FieldByName('RaceDesc').Value := tblR.FieldByName('RaceDesc').Value;
               tblRH.FieldByName('RaceCondition').Value := tblR.FieldByName('RaceCondition').Value;
               tblRH.FieldByName('IsTurfRace').Value := tblR.FieldByName('IsTurfRace').Value;
               tblRH.FieldByName('IsRouteRace').Value := tblR.FieldByName('IsRouteRace').Value;
               tblRH.FieldByName('IsMaidenSpecialRace').Value := tblR.FieldByName('IsMaidenSpecialRace').Value;
               tblRH.FieldByName('IsMaidenClaimingRace').Value := tblR.FieldByName('IsMaidenClaimingRace').Value;
               tblRH.FieldByName('IsMaidenOrTurfRace').Value := tblR.FieldByName('IsMaidenOrTurfRace').Value;
               tblRH.FieldByName('IsTwoYearOldRace').Value := tblR.FieldByName('IsTwoYearOldRace').Value;
               tblRH.FieldByName('IsClaimingRace').Value := tblR.FieldByName('IsClaimingRace').Value;
               tblRH.FieldByName('AgeSexRestriction').Value := tblR.FieldByName('AgeSexRestriction').Value;
               tblRH.FieldByName('SimulcastTrkCode').Value := tblR.FieldByName('SimulcastTrkCode').Value;
               tblRH.FieldByName('SimulcastRaceNbr').Value := tblR.FieldByName('SimulcastRaceNbr').Value;
               tblRH.FieldByName('RaceAutoInc').Value := tblR.FieldByName('RaceAutoInc').Value;
               tblRH.FieldByName('TimeDiff').Value := tblR.FieldByName('TimeDiff').Value;
               //               tblRH.FieldByName('WagerType').Value := tblR.FieldByName('WagerType').Value;
               tblRH.FieldByName('NbrTriKey').Value := tblR.FieldByName('NbrTriKey').Value;
               tblRH.FieldByName('TotalPk3Choices').Value := tblR.FieldByName('TotalPk3Choices').Value;
               tblRH.FieldByName('Pk3KeyType').Value := tblR.FieldByName('Pk3KeyType').Value;
               tblRH.FieldByName('Pk3Selected').Value := tblR.FieldByName('Pk3Selected').Value;
               tblRH.FieldByName('TotalTriChoices').Value := tblR.FieldByName('TotalTriChoices').Value;
               tblRH.FieldByName('TotalSuperChoices').Value := tblR.FieldByName('TotalSuperChoices').Value;
               tblRH.FieldByName('TotalDDChoices').Value := tblR.FieldByName('TotalDDChoices').Value;
               tblRH.FieldByName('TopLastSpeed').Value := tblR.FieldByName('TopLastSpeed').Value;
               tblRH.FieldByName('TopBackSpeed').Value := tblR.FieldByName('TopBackSpeed').Value;
               //               tblRH.FieldByName('TopLastClass').Value := tblR.FieldByName('TopLastClass').Value;
               //               tblRH.FieldByName('TopBackClass').Value := tblR.FieldByName('TopBackClass').Value;
               tblRH.FieldByName('DD').Value := tblR.FieldByName('DD').Value;
               tblRH.FieldByName('Pick3').Value := tblR.FieldByName('Pick3').Value;
               tblRH.FieldByName('Pick4').Value := tblR.FieldByName('Pick4').Value;
               tblRH.FieldByName('Pick6').Value := tblR.FieldByName('Pick6').Value;
               //              tblRH.FieldByName('ParTime').Value := tblR.FieldByName('ParTime').Value;
              //               tblRH.FieldByName('IsCreateAngle').Value := tblR.FieldByName('IsCreateAngle').Value;
              //               tblRH.FieldByName('IsCreateValue').Value := tblR.FieldByName('IsCreateValue').Value;
              //               tblRH.FieldByName('IsCreateTip').Value := tblR.FieldByName('IsCreateTip').Value;
              //               tblRH.FieldByName('IsCreatePk3').Value := tblR.FieldByName('IsCreatePk3').Value;
              //               tblRH.FieldByName('IsCreateDetail').Value := tblR.FieldByName('IsCreateDetail').Value;
              //               tblRH.FieldByName('IsCreateAlt').Value := tblR.FieldByName('IsCreateAlt').Value;
              //               tblRH.FieldByName('RacePicks').Value := tblR.FieldByName('RacePicks').Value;
              //               tblRH.FieldByName('IsRacePicksAvailable').Value := tblR.FieldByName('IsRacePicksAvailable').Value;
              // tblRH.FieldByName('TopPower').Value := tblR.FieldByName('TopPower').Value;
               tblRH.FieldByName('TopEarlyPace').Value := tblR.FieldByName('TopEarlyPace').Value;
               tblRH.FieldByName('TopMiddlePace').Value := tblR.FieldByName('TopMiddlePace').Value;
               tblRH.FieldByName('TopLatePace').Value := tblR.FieldByName('TopLatePace').Value;
               tblRH.FieldByName('TopEarlyPacePos').Value := tblR.FieldByName('TopEarlyPacePos').Value;
               tblRH.FieldByName('TopMiddlePacePos').Value := tblR.FieldByName('TopMiddlePacePos').Value;
               tblRH.FieldByName('TopLatePacePos').Value := tblR.FieldByName('TopLatePacePos').Value;
               //  tblRH.FieldByName('SecondEarlyPower').Value := tblR.FieldByName('SecondEarlyPower').Value;
               tblRH.FieldByName('SecondEarlyPace').Value := tblR.FieldByName('SecondEarlyPace').Value;
               tblRH.FieldByName('SecondMiddlePace').Value := tblR.FieldByName('SecondMiddlePace').Value;
               tblRH.FieldByName('SecondLatePace').Value := tblR.FieldByName('SecondLatePace').Value;
               tblRH.FieldByName('SecondEarlyPacePos').Value := tblR.FieldByName('SecondEarlyPacePos').Value;
               tblRH.FieldByName('SecondMiddlePacePos').Value := tblR.FieldByName('SecondMiddlePacePos').Value;
               tblRH.FieldByName('SecondLatePacePos').Value := tblR.FieldByName('SecondLatePacePos').Value;
               //               tblRH.FieldByName('TotalMorningLineTo1Probability').Value := tblR.FieldByName('TotalMorningLineTo1Probability').Value;
               //               tblRH.FieldByName('TotalFinalLineTo1Probability').Value := tblR.FieldByName('TotalFinalLineTo1Probability').Value;
               //               tblRH.FieldByName('MaxWPSBet').Value := tblR.FieldByName('MaxWPSBet').Value;
               //               tblRH.FieldByName('MaxGimmickBet').Value := tblR.FieldByName('MaxGimmickBet').Value;

               tblRH.FieldByName('Is10CentSuperfectaRace').Value := tblR.FieldByName('Is10CentSuperfectaRace').Value;
               tblRH.FieldByName('CT').Value := tblR.FieldByName('CT').Value;
               tblRH.FieldByName('MT').Value := tblR.FieldByName('MT').Value;
               tblRH.FieldByName('PT').Value := tblR.FieldByName('PT').Value;
               tblRH.FieldByName('ET').Value := tblR.FieldByName('ET').Value;

               if tblR.FieldByName('RaceType').AsString = 'HCP' then begin
                  tblRH.FieldByName('RaceType').AsString := 'STK';
               end;
               if tblR.FieldByName('RaceType').AsString = 'OCLM' then begin
                  tblRH.FieldByName('RaceType').AsString := 'CLM';
               end;
               if tblR.FieldByName('RaceType').AsString = 'SHCP' then begin
                  tblRH.FieldByName('RaceType').AsString := 'STK';
               end;
               if tblR.FieldByName('RaceType').AsString = 'UNK' then begin
                  tblRH.FieldByName('RaceType').AsString := 'CLM';
               end;
               if tblR.FieldByName('RaceType').AsString = '' then begin
                  tblRH.FieldByName('RaceType').AsString := 'CLM';
               end;

               //Store these in first leg and last also?
               tblRH.FieldByName('DDFirstRace').AsString := tblR.FieldByName('DD').AsString;
               tblRH.FieldByName('Pick3FirstRace').AsString := tblR.FieldByName('Pick3').AsString;
               tblRH.FieldByName('Pick4FirstRace').AsString := tblR.FieldByName('Pick4').AsString;
               tblRH.FieldByName('Pick6FirstRace').AsString := tblR.FieldByName('Pick6').AsString;


               tblRH.Post();

               tblRH.IndexName := '';
               tblRH.SetKey();
               tblRH.FieldByName('TrkCode').Value := dm.tblEntries.FieldByName('TrkCode').Value;
               tblRH.FieldByName('RaceDate').Value := dm.tblEntries.FieldByName('RaceDate').Value;
               tblRH.FieldByName('RaceNbr').Value := dm.tblEntries.FieldByName('RaceNbr').AsInteger + 1;
               if (tblRH.GotoKey()) then begin
                  tblRH.Edit();
                  tblRH.FieldByName('DDLastRace').AsString := tblR.FieldByName('DD').AsString;
                  tblRH.Post();
               end;

               tblRH.IndexName := '';
               tblRH.SetKey();
               tblRH.FieldByName('TrkCode').Value := dm.tblEntries.FieldByName('TrkCode').Value;
               tblRH.FieldByName('RaceDate').Value := dm.tblEntries.FieldByName('RaceDate').Value;
               tblRH.FieldByName('RaceNbr').Value := dm.tblEntries.FieldByName('RaceNbr').AsInteger + 2;
               if (tblRH.GotoKey()) then begin
                  tblRH.Edit();
                  tblRH.FieldByName('Pick3LastRace').AsString := tblR.FieldByName('Pick3').AsString;
                  tblRH.Post();
               end;

               tblRH.IndexName := '';
               tblRH.SetKey();
               tblRH.FieldByName('TrkCode').Value := dm.tblEntries.FieldByName('TrkCode').Value;
               tblRH.FieldByName('RaceDate').Value := dm.tblEntries.FieldByName('RaceDate').Value;
               tblRH.FieldByName('RaceNbr').Value := dm.tblEntries.FieldByName('RaceNbr').AsInteger + 3;
               if (tblRH.GotoKey()) then begin
                  tblRH.Edit();
                  tblRH.FieldByName('Pick4LastRace').AsString := tblR.FieldByName('Pick4').AsString;
                  tblRH.Post();
               end;

               tblRH.IndexName := '';
               tblRH.SetKey();
               tblRH.FieldByName('TrkCode').Value := dm.tblEntries.FieldByName('TrkCode').Value;
               tblRH.FieldByName('RaceDate').Value := dm.tblEntries.FieldByName('RaceDate').Value;
               tblRH.FieldByName('RaceNbr').Value := dm.tblEntries.FieldByName('RaceNbr').AsInteger + 5;
               if tblRH.GotoKey() then begin
                  tblRH.Edit();
                  tblRH.FieldByName('Pick6LastRace').AsString := tblR.FieldByName('Pick6').AsString;
                  tblRH.Post();
               end;

            end;

            tblHH.IndexName := '';
            tblHH.SetKey();
            tblHH.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
            tblHH.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
            tblHH.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
            tblHH.FieldByName('PostPos').Value := tblE.FieldByName('PostPos').Value;

            if tblHH.GotoKey() then begin
               tblHH.Edit();
               FldHHFromToday(tblR, tblE, tblRH, tblHH);
               tblHH.Post();
            end;
         end;

         tblE.Next();
      end;
   except
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.RollBack();
      end;
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblHH);
      CloseTable(tblRH);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit();
   end;
   CloseTable(tblR);
   CloseTable(tblE);
   CloseTable(tblHH);
   CloseTable(tblRH);
   ClearPrgStatusBars();

end;


end.
