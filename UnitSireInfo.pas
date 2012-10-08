unit UnitSireInfo;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure SireInfo
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRt: TDBISAMTable;
   tblTr: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar
   );

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure SireInfo
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblRt: TDBISAMTable;
   tblTr: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar
   );
var
   fPower: double;
   iBackSpeed: integer;
   iLastSpeed: integer;

   fEarlyPace: double;
   fMiddlePace: double;
   fLatePace: double;
   fEarlyPacePos: double;
   fMiddlePacePos: double;
   fLatePacePos: double;

   iSpeed1Back: integer;
   iSpeed2Back: integer;
   iSpeed3Back: integer;
   iSpeed4Back: integer;
   iSpeed5Back: integer;

   bClaimed1Back: boolean;
   bClaimed2Back: boolean;

   dtLocalTimeOfRace: TDateTime;
   dtEstTimeOfRace: TDateTime;
   dtEstTimeOfFirstRace: TDateTime;

   iStarts: integer;

   iTrnTodayStarts: integer;
   iTrnTodayWins: integer;
   fTrnTodayWinPct: double;

   iTotalTrnStarts: integer;
   iTotalTrnWins: integer;
   fTotalTrnWinPct: double;


   iTotalTrnOddsStarts: integer;
   iTotalTrnOddsWins: integer;
   fTotalTrnOddsWinPct: double;

   iTotalTrnOddsLe5Starts: integer;
   iTotalTrnOddsLe5Wins: integer;
   fTotalTrnOddsLe5WinPct: double;

   iTotalTrnOddsGt5Starts: integer;
   iTotalTrnOddsGt5Wins: integer;
   fTotalTrnOddsGt5WinPct: double;

   iTotalTrnFavStarts: integer;
   iTotalTrnFavWins: integer;
   fTotalTrnFavWinPct: double;

   iTotalTrn2yoStarts: integer;
   iTotalTrn2yoWins: integer;
   fTotalTrn2yoWinPct: double;

   iTotalJkyOddsLe5Starts: integer;
   iTotalJkyOddsLe5Wins: integer;
   fTotalJkyOddsLe5WinPct: double;

   iTotalJkyOddsGt5Starts: integer;
   iTotalJkyOddsGt5Wins: integer;
   fTotalJkyOddsGt5WinPct: double;

   iTotalJkyFavStarts: integer;
   iTotalJkyFavWins: integer;
   fTotalJkyFavWinPct: double;

   iTotalJky2yoStarts: integer;
   iTotalJky2yoWins: integer;
   fTotalJky2yoWinPct: double;

   iTotalTrnJkyStarts: integer;
   iTotalTrnJkyWins: integer;
   fTotalTrnJkyStarts: double;
   fTotalTrnJkyWins: double;
   fTotalTrnJkyWinPct: double;


   iTotalTrnOwnStarts: integer;
   iTotalTrnOwnWins: integer;
   fTotalTrnOwnWinPct: double;

   iTotalTrn1To45Starts: integer;
   iTotalTrn1To45Wins: integer;
   fTotalTrn1To45WinPct: double;

   iTotalTrn46To120Starts: integer;
   iTotalTrn46To120Wins: integer;
   fTotalTrn46To120WinPct: double;

   iTotalTrn120PlusStarts: integer;
   iTotalTrn120PlusWins: integer;
   fTotalTrn120PlusWinPct: double;

   iTotalTrnWork1To45Starts: integer;
   iTotalTrnWork1To45Wins: integer;
   fTotalTrnWork1To45WinPct: double;

   iTotalTrnWork46To120Starts: integer;
   iTotalTrnWork46To120Wins: integer;
   fTotalTrnWork46To120WinPct: double;

   iTotalTrnWork120PlusStarts: integer;
   iTotalTrnWork120PlusWins: integer;
   fTotalTrnWork120PlusWinPct: double;

   iTotalTrnDebutStarts: integer;
   fTotalTrnDebutStarts: double;
   iTotalTrnDebutWins: integer;
   fTotalTrnDebutWinPct: double;

   iTotalTrnDebutTwoStarts: integer;
   iTotalTrnDebutTwoWins: integer;
   fTotalTrnDebutTwoWinPct: double;

   iTotalTrnFirstJuiceStarts: integer;
   iTotalTrnFirstJuiceWins: integer;
   fTotalTrnFirstJuiceWinPct: double;

   iTotalTrnSecondJuiceStarts: integer;
   iTotalTrnSecondJuiceWins: integer;
   fTotalTrnSecondJuiceWinPct: double;

   iTotalTrnBlinkersOnStarts: integer;
   iTotalTrnBlinkersOnWins: integer;
   fTotalTrnBlinkersOnWinPct: double;

   iTotalTrnBlinkersOffStarts: integer;
   iTotalTrnBlinkersOffWins: integer;
   fTotalTrnBlinkersOffWinPct: double;

   iTotalJkyStarts: integer;
   iTotalJkyWins: integer;
   fTotalJkyWinPct: double;

   iTotalJkyOddsStarts: integer;
   iTotalJkyOddsWins: integer;
   fTotalJkyOddsWinPct: double;

   iTotalOwnStarts: integer;
   iTotalOwnWins: integer;
   fTotalOwnWinPct: double;

   iTotalBrdStarts: integer;
   iTotalBrdWins: integer;
   fTotalBrdWinPct: double;

   dtLastRaceDate: TDateTime;

   sLastTrkCode: string;
   sLastRaceType: string;
   sLastSurf: string;
   sLastRaceConditions: string;
   sLastDistanceDesc: string;
   fLastDistance: double;

   fLastOdds: double;
   sLastFavoriteIndicator: string;
   sLastDQIndicator: string;
   sLastJockey: string;
   sLastClaimed: string;
   sLastComment: string;
   sLastComment2: string;
   sLastTopFinish1: string;
   sLastTopFinish2: string;
   sLastTopFinish3: string;
   sLastTrkCond: string;

   fLastClmPrice: double;
   fLastPurse: double;
   sLastPurse: string;
   sLastClmPrice: string;

   fBackClass: double;

   bRouteRace: boolean;
   fTimeDiff: double;

   fFldstarts: double;
   fTotalWins: double;

   sRaceType: string;
   sSurface: string;
   sTurfIndicator: string;
   sDebutIndicator: string;
   iDaysLast: integer;
   iDaysLastWork: integer;
   iDaysLastWork2: integer;
   iDaysLastWork3: integer;
   iNbrWorksLast: integer;

   iSireLifeAllStarts: integer;
   iSireLifeAllWins: integer;
   fSireLifeAllWinPct: double;

   iSireLifeTurfStarts: integer;
   iSireLifeTurfWins: integer;
   fSireLifeTurfWinPct: double;

   iSireLifeMudStarts: integer;
   iSireLifeMudWins: integer;
   fSireLifeMudWinPct: double;

   iSireLifeDebutStarts: integer;
   iSireLifeDebutWins: integer;
   fSireLifeDebutWinPct: double;

   iSireLife2yoStarts: integer;
   iSireLife2yoWins: integer;
   fSireLife2yoWinPct: double;

   iSireLifeStkStarts: integer;
   iSireLifeStkWins: integer;
   fSireLifeStkWinPct: double;

   iSireLifeDirtSprStarts: integer;
   iSireLifeDirtSprWins: integer;
   fSireLifeDirtSprWinPct: double;

   iSireLifeDirtRteStarts: integer;
   iSireLifeDirtRteWins: integer;
   fSireLifeDirtRteWinPct: double;

   iSireLifeTurfSprStarts: integer;
   iSireLifeTurfSprWins: integer;
   fSireLifeTurfSprWinPct: double;

   iSireLifeTurfRteStarts: integer;
   iSireLifeTurfRteWins: integer;
   fSireLifeTurfRteWinPct: double;

   iDamSireLifeAllStarts: integer;
   iDamSireLifeAllWins: integer;
   fDamSireLifeAllWinPct: double;

   iDamSireLifeTurfStarts: integer;
   iDamSireLifeTurfWins: integer;
   fDamSireLifeTurfWinPct: double;

   iDamSireLifeMudStarts: integer;
   iDamSireLifeMudWins: integer;
   fDamSireLifeMudWinPct: double;

   iDamSireLifeDebutStarts: integer;
   iDamSireLifeDebutWins: integer;
   fDamSireLifeDebutWinPct: double;

   iDamSireLife2yoStarts: integer;
   iDamSireLife2yoWins: integer;
   fDamSireLife2yoWinPct: double;

   iDamSireLifeStkStarts: integer;
   iDamSireLifeStkWins: integer;
   fDamSireLifeStkWinPct: double;

   iDamSireLifeDirtSprStarts: integer;
   iDamSireLifeDirtSprWins: integer;
   fDamSireLifeDirtSprWinPct: double;

   iDamSireLifeDirtRteStarts: integer;
   iDamSireLifeDirtRteWins: integer;
   fDamSireLifeDirtRteWinPct: double;

   iDamSireLifeTurfSprStarts: integer;
   iDamSireLifeTurfSprWins: integer;
   fDamSireLifeTurfSprWinPct: double;

   iDamSireLifeTurfRteStarts: integer;
   iDamSireLifeTurfRteWins: integer;
   fDamSireLifeTurfRteWinPct: double;

   iDamLifeAllStarts: integer;
   iDamLifeAllWins: integer;
   fDamLifeAllWinPct: double;

   iDamLifeTurfStarts: integer;
   iDamLifeTurfWins: integer;
   fDamLifeTurfWinPct: double;

   iDamLifeMudStarts: integer;
   iDamLifeMudWins: integer;
   fDamLifeMudWinPct: double;

   iDamLifeDebutStarts: integer;
   iDamLifeDebutWins: integer;
   fDamLifeDebutWinPct: double;

   iDamLife2yoStarts: integer;
   iDamLife2yoWins: integer;
   fDamLife2yoWinPct: double;

   iDamLifeStkStarts: integer;
   iDamLifeStkWins: integer;
   fDamLifeStkWinPct: double;

   iDamLifeDirtSprStarts: integer;
   iDamLifeDirtSprWins: integer;
   fDamLifeDirtSprWinPct: double;

   iDamLifeDirtRteStarts: integer;
   iDamLifeDirtRteWins: integer;
   fDamLifeDirtRteWinPct: double;

   iDamLifeTurfSprStarts: integer;
   iDamLifeTurfSprWins: integer;
   fDamLifeTurfSprWinPct: double;

   iDamLifeTurfRteStarts: integer;
   iDamLifeTurfRteWins: integer;
   fDamLifeTurfRteWinPct: double;

   iLifeTurfStarts: integer;
   iLifeTurfWins: integer;
   fLifeTurfWinPct: double;

   iLifeMudStarts: integer;
   iLifeMudWins: integer;
   fLifeMudWinPct: double;

   fFldsaveStarts: double;
   fFldsaveWins: double;

   fTrnTurfStarts: double;
   fTrnTurfWins: double;
   iTrnTurfStarts: integer;
   iTrnTurfWins: integer;
   fTrnTurfWinPct: double;

   fTrn10Starts: double;
   fTrn10Wins: double;
   iTrn10Starts: integer;
   iTrn10Wins: integer;
   fTrn10WinPct: double;

   fTrn30Starts: double;
   fTrn30Wins: double;
   iTrn30Starts: integer;
   iTrn30Wins: integer;
   fTrn30WinPct: double;

   fJky10Starts: double;
   fJky10Wins: double;
   iJky10Starts: integer;
   iJky10Wins: integer;
   fJky10WinPct: double;

   fJky30Starts: double;
   fJky30Wins: double;
   iJky30Starts: integer;
   iJky30Wins: integer;
   fJky30WinPct: double;

   fTrnClmStarts: double;
   fTrnClmWins: double;
   fTrnClmWinPct: double;

   fTrn1stStarts: double;
   fTrn1stWins: double;
   fTrn1stWinPct: double;

   fJkyTurfStarts: double;
   fJkyTurfWins: double;
   iJkyTurfStarts: integer;
   iJkyTurfWins: integer;
   fJkyTurfWinPct: double;

   iLastClmPrice: integer;
   iLastPurse: integer;

   sLastOdds: string;
   sLastBl: string;
   sBlSep: string;

   iTrnTurfToDirtWinPct: integer;
   iTrnDirtToTurfWinPct: integer;
   iTrnSprToRteWinPct: integer;
   iTrnRteToSprWinPct: integer;

   iTrnTurfToDirtStarts: integer;
   iTrnDirtToTurfStarts: integer;
   iTrnSprToRteStarts: integer;
   iTrnRteToSprStarts: integer;

   iTrnStkWinPct: integer;
   iTrnAlwWinPct: integer;
   iTrnClmWinPct: integer;
   iTrnMdnWinPct: integer;

   fDamAllWinPct: double;
   fDamAllMudWinPct: double;
   fDamAllTurfWinPct: double;

   fDamSireAllWinPct: double;
   fDamSireAllMudWinPct: double;
   fDamSireAllTurfWinPct: double;

   fSireAllWinPct: double;
   fSireAllMudWinPct: double;
   fSireAllTurfWinPct: double;

   fClassRating: double;
   fTurfRating: double;
   fMudRating: double;

   bPrintedOnValueSheet: boolean;
   bYouBetTrack: boolean;
   bPTCTrack: boolean;
   bTwinSpiresTrack: boolean;

   bCreateAngle: boolean;
   bCreateValue: boolean;
   bCreateTip: boolean;
   bCreateDetail: boolean;
   bCreatePk3: boolean;
   bCreateAlt: boolean;

   sLastDay: string;
   sLastMonthDesc: string;
   sLastYear: string;
   iLastRaceNbr: integer;

   fLastTime1stCall: double;
   fLastTime2ndCall: double;
   fLastTimeStrCall: double;
   fLastTimeFinCall: double;

   fLastPos1stCall: double;
   fLastPos2ndCall: double;
   fLastPosStrCall: double;
   fLastPosFinCall: double;

   fLastBL1stCall: double;
   fLastBL2ndCall: double;
   fLastBLStrCall: double;
   fLastBLFinCall: double;

   iLastPostPos: integer;
   sLastGateBreak: string;
   sLastLen1Back: string;
   sLastLen2Back: string;
   sLastStLenBack: string;
   sLastFinishBeaten: string;
   sLastFinishPos: string;
   sLastEquip: string;
   iLastWeight: integer;
   iLastTrackVariant: integer;

   iLastClass: integer;

   fLastHorseTime: double;
   fLastWinTime: double;
   iLastSRWinner: integer;

   bActive: boolean;
   bIsUsedInRankings: boolean;

   fDam2yoWinPct: double;
   fSire2yoWinPct: double;

   fDamDebutWinPct: double;
   fSireDebutWinPct: double;

   fSireTrfRteWinPct: double;
   fSireTrfSprWinPct: double;
   fSireDirtRteWinPct: double;
   fSireDirtSprWinPct: double;


   wYear, wMonth, wDay, wHour, wMin, wSec, wMSec: Word;

   sAMPM: string;

begin

   try
      InitPrgBar(dm.tblEntries.RecordCount);

      dm.tblEntries.First();
      while not dm.tblEntries.Eof do begin
         UpdateEntriesProgressStatusBar(dm.tblEntries, 'Sire Info - ');

         sTurfIndicator := dm.tblEntries.FieldByName('TurfIndicator').AsString;
         sDebutIndicator := dm.tblEntries.FieldByName('DebutIndicator').AsString;
         iDaysLast := dm.tblEntries.FieldByName('DaysLast').AsInteger;
         iDaysLastWork := dm.tblEntries.FieldByName('DaysLastWork').AsInteger;
         //iDaysLastWork2 := dm.tblEntries.FieldByName('DaysLastWork2').AsInteger;
         //iDaysLastWork3 := dm.tblEntries.FieldByName('DaysLastWork3').AsInteger;
         iNbrWorksLast := dm.tblEntries.FieldByName('NbrWorksLast').AsInteger;

         dm.tblTrack.IndexName := '';
         dm.tblTrack.SetKey();
         dm.tblTrack.FieldByName('TrkCode').Value := dm.tblEntries.FieldByName('TrkCode').AsString;
         if dm.tblTrack.GotoKey() then begin
            fTimeDiff := dm.tblTrack.FieldByName('TimeDiff').AsFloat;

            if (DayOfTheWeek(gedtOverrideDate) = DayMonday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetMon').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DayTuesday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetTue').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DayWednesday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetWed').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DayThursday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetThu').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DayFriday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetFri').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DaySaturday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSat').AsBoolean;
            end;

            if (DayOfTheWeek(gedtOverrideDate) = DaySunday) then begin
               bPrintedOnValueSheet := dm.tblTrack.FieldByName('IsPrintedOnValueSheetSun').AsBoolean;
            end;

            bYouBetTrack := dm.tblTrack.FieldByName('IsYouBetTrack').AsBoolean;
            bPTCTrack := dm.tblTrack.FieldByName('IsPTCTrack').AsBoolean;
            bTwinSpiresTrack := dm.tblTrack.FieldByName('IsTwinSpiresTrack').AsBoolean;
            bActive := dm.tblTrack.FieldByName('IsActive').AsBoolean;

            bCreateAngle := dm.tblTrack.FieldByName('IsCreateAngle').AsBoolean;
            bCreateValue := dm.tblTrack.FieldByName('IsCreateValue').AsBoolean;
            bCreateTip := dm.tblTrack.FieldByName('IsCreateTip').AsBoolean;
            bCreateDetail := dm.tblTrack.FieldByName('IsCreateDetail').AsBoolean;
            bCreatePk3 := dm.tblTrack.FieldByName('IsCreatePk3').AsBoolean;
            bCreateAlt := dm.tblTrack.FieldByName('IsCreateAlt').AsBoolean;

            //bIsUsedInRankings:= dm.tblTrack.FieldByName('IsUsedInRankings').AsBoolean;

         end else begin
            bPrintedOnValueSheet := False;
         end;

         fClassRating := 0;
         fTurfRating := 0;
         fMudRating := 0;

         fTrnTurfStarts := 0;
         fTrnTurfWins := 0;
         iTrnTurfStarts := 0;
         iTrnTurfWins := 0;
         fTrnTurfWinPct := 0;

         fTrn10Starts := 0;
         fTrn10Wins := 0;
         iTrn10Starts := 0;
         iTrn10Wins := 0;
         fTrn10WinPct := 0;

         fTrn30Starts := 0;
         fTrn30Wins := 0;
         iTrn30Starts := 0;
         iTrn30Wins := 0;
         fTrn30WinPct := 0;

         fJky10Starts := 0;
         fJky10Wins := 0;
         iJky10Starts := 0;
         iJky10Wins := 0;
         fJky10WinPct := 0;

         fJky30Starts := 0;
         fJky30Wins := 0;
         iJky30Starts := 0;
         iJky30Wins := 0;
         fJky30WinPct := 0;

         fTrnClmStarts := 0;
         fTrnClmWins := 0;
         fTrnClmWinPct := 0;

         fTrn1stStarts := 0;
         fTrn1stWins := 0;
         fTrn1stWinPct := 0;

         fJkyTurfStarts := 0;
         fJkyTurfWins := 0;
         iJkyTurfStarts := 0;
         iJkyTurfWins := 0;
         fJkyTurfWinPct := 0;


         iTotalTrnStarts := 0;
         iTotalTrnWins := 0;
         fTotalTrnWinPct := 0;

         iTotalTrnOddsStarts := 0;
         iTotalTrnOddsWins := 0;
         fTotalTrnOddsWinPct := 0;

         iTotalTrnOddsLe5Starts := 0;
         iTotalTrnOddsLe5Wins := 0;
         fTotalTrnOddsLe5WinPct := 0;

         iTotalTrnOddsGt5Starts := 0;
         iTotalTrnOddsGt5Wins := 0;
         fTotalTrnOddsGt5WinPct := 0;

         iTotalTrnFavStarts := 0;
         iTotalTrnFavWins := 0;
         fTotalTrnFavWinPct := 0;

         iTotalTrn2yoStarts := 0;
         iTotalTrn2yoWins := 0;
         fTotalTrn2yoWinPct := 0;

         iTotalJkyOddsLe5Starts := 0;
         iTotalJkyOddsLe5Wins := 0;
         fTotalJkyOddsLe5WinPct := 0;

         iTotalJkyOddsGt5Starts := 0;
         iTotalJkyOddsGt5Wins := 0;
         fTotalJkyOddsGt5WinPct := 0;

         iTotalJkyFavStarts := 0;
         iTotalJkyFavWins := 0;
         fTotalJkyFavWinPct := 0;

         iTotalJky2yoStarts := 0;
         iTotalJky2yoWins := 0;
         fTotalJky2yoWinPct := 0;

         fTotalTrnJkyStarts := 0;
         fTotalTrnJkyWins := 0;
         iTotalTrnJkyStarts := 0;
         iTotalTrnJkyWins := 0;
         fTotalTrnJkyWinPct := 0;

         iTotalTrnOwnStarts := 0;
         iTotalTrnOwnWins := 0;
         fTotalTrnOwnWinPct := 0;

         iTotalTrn1To45Starts := 0;
         iTotalTrn1To45Wins := 0;
         fTotalTrn1To45WinPct := 0;

         iTotalTrn46To120Starts := 0;
         iTotalTrn46To120Wins := 0;
         fTotalTrn46To120WinPct := 0;

         iTotalTrn120PlusStarts := 0;
         iTotalTrn120PlusWins := 0;
         fTotalTrn120PlusWinPct := 0;

         iTotalTrnWork1To45Starts := 0;
         iTotalTrnWork1To45Wins := 0;
         fTotalTrnWork1To45WinPct := 0;

         iTotalTrnWork46To120Starts := 0;
         iTotalTrnWork46To120Wins := 0;
         fTotalTrnWork46To120WinPct := 0;

         iTotalTrnWork120PlusStarts := 0;
         iTotalTrnWork120PlusWins := 0;
         fTotalTrnWork120PlusWinPct := 0;

         iTotalTrnDebutStarts := 0;
         fTotalTrnDebutStarts := 0;
         iTotalTrnDebutWins := 0;
         fTotalTrnDebutWinPct := 0;

         iTotalTrnDebutTwoStarts := 0;
         iTotalTrnDebutTwoWins := 0;
         fTotalTrnDebutTwoWinPct := 0;

         iTotalTrnFirstJuiceStarts := 0;
         iTotalTrnFirstJuiceWins := 0;
         fTotalTrnFirstJuiceWinPct := 0;

         iTotalTrnSecondJuiceStarts := 0;
         iTotalTrnSecondJuiceWins := 0;
         fTotalTrnSecondJuiceWinPct := 0;

         iTotalTrnBlinkersOnStarts := 0;
         iTotalTrnBlinkersOnWins := 0;
         fTotalTrnBlinkersOnWinPct := 0;

         iTotalTrnBlinkersOffStarts := 0;
         iTotalTrnBlinkersOffWins := 0;
         fTotalTrnBlinkersOffWinPct := 0;

         iTrnTurfToDirtWinPct := 0;
         iTrnDirtToTurfWinPct := 0;
         iTrnSprToRteWinPct := 0;
         iTrnRteToSprWinPct := 0;

         iTrnTurfToDirtStarts := 0;
         iTrnDirtToTurfStarts := 0;
         iTrnSprToRteStarts := 0;
         iTrnRteToSprStarts := 0;

         iTrnStkWinPct := 0;
         iTrnAlwWinPct := 0;
         iTrnClmWinPct := 0;
         iTrnMdnWinPct := 0;

         iTotalJkyStarts := 0;
         iTotalJkyWins := 0;
         fTotalJkyWinPct := 0;

         iTotalOwnStarts := 0;
         iTotalOwnWins := 0;
         fTotalOwnWinPct := 0;

         iTotalBrdStarts := 0;
         iTotalBrdWins := 0;
         fTotalBrdWinPct := 0;

         sLastTrkCode := '';
         dtLastRaceDate := 0;
         sLastRaceType := '';
         sLastSurf := '';
         sLastRaceConditions := '';
         sLastDistanceDesc := '';
         fLastDistance := 0;
         fLastOdds := 0;
         sLastFavoriteIndicator := '';
         sLastDQIndicator := '';
         sLastJockey := '';
         sLastComment := '';
         sLastComment2 := '';
         sLastTopFinish1 := '';
         sLastTopFinish2 := '';
         sLastTopFinish3 := '';

         sLastDay := '';
         sLastMonthDesc := '';
         sLastYear := '';
         dtLastRaceDate := 0;
         iLastRaceNbr := 0;

         fLastTime1stCall := 0;
         fLastTime2ndCall := 0;
         fLastTimeStrCall := 0;
         fLastTimeFinCall := 0;

         iLastPostPos := 0;
         sLastGateBreak := '';
         sLastLen1Back := '';
         sLastLen2Back := '';
         sLastStLenBack := '';
         sLastFinishBeaten := '';
         sLastEquip := '';
         iLastWeight := 0;
         iLastTrackVariant := 0;
         iLastClass := 0;
         fLastHorseTime := 0;
         fLastWinTime := 0;
         iLastSRWinner := 0;

         sLastTrkCond := '';
         dtLastRaceDate := 0;
         fLastClmPrice := 0;
         fLastPurse := 0;

         sLastClmPrice := '';
         sLastPurse := '';

         fBackClass := 0;

         dtLocalTimeOfRace := 0;

         fPower := 0;
         fBackSpeed := 0;
         fLastSpeed := 0;
         iSpeed1Back := 0;
         iSpeed2Back := 0;
         iSpeed3Back := 0;
         iSpeed4Back := 0;
         iSpeed5Back := 0;

         fEarlyPace := 0;
         fMiddlePace := 0;
         fLatePace := 0;

         fEarlyPacePos := 0;
         fMiddlePacePos := 0;
         fLatePacePos := 0;

         fDamAllWinPct := 0;
         fDamAllMudWinPct := 0;
         fDamAllTurfWinPct := 0;

         fDamSireAllWinPct := 0;
         fDamSireAllMudWinPct := 0;
         fDamSireAllTurfWinPct := 0;

         fSireAllWinPct := 0;
         fSireAllMudWinPct := 0;
         fSireAllTurfWinPct := 0;

         fDam2yoWinPct := 0;
         fSire2yoWinPct := 0;

         fDamDebutWinPct := 0;
         fSireDebutWinPct := 0;

         fSireTrfRteWinPct := 0;
         fSireTrfSprWinPct := 0;
         fSireDirtRteWinPct := 0;
         fSireDirtSprWinPct := 0;

         SetRaceEntriesKey(dm.tblRaces, dm.tblEntries);
         if dm.tblRaces.GotoKey() then begin
            sRaceType := dm.tblRaces.FieldByName('RaceType').AsString;
            sRaceType := Trim(sRaceType);

            sSurface := dm.tblRaces.FieldByName('Surface').AsString;
            sSurface := Trim(sSurface);

            if dm.tblRaces.FieldByName('DistanceInFurlongs').AsFloat < MILE_FURLONGS then begin
               bRouteRace := False;
            end else begin
               bRouteRace := True;
            end;

            SetRatingsEntriesKey(dm.tblRatings, dm.tblEntries);
            if dm.tblRatings.GotoKey() then begin

               fTrnTodayWinPct := dm.tblRatings.FieldByName('TrnTodayWinPct').AsFloat;
               iTrnTodayStarts := dm.tblRatings.FieldByName('TrnTodayStarts').AsInteger;
               iTrnTodayWins := dm.tblRatings.FieldByName('TrnTodayWins').AsInteger;

               iTotalTrnStarts := dm.tblRatings.FieldByName('TotalTrnStarts').AsInteger;
               iTotalTrnWins := dm.tblRatings.FieldByName('TotalTrnWins').AsInteger;
               fTotalTrnWinPct := dm.tblRatings.FieldByName('TotalTrnWinPct').AsFloat;

               iTotalTrnOddsStarts := dm.tblRatings.FieldByName('TotalTrnOddsStarts').AsInteger;
               iTotalTrnOddsWins := dm.tblRatings.FieldByName('TotalTrnOddsWins').AsInteger;
               fTotalTrnOddsWinPct := dm.tblRatings.FieldByName('TotalTrnOddsWinPct').AsFloat;

               iTotalTrnOddsLe5Starts := dm.tblRatings.FieldByName('TotalTrnOddsLe5Starts').AsInteger;
               iTotalTrnOddsLe5Wins := dm.tblRatings.FieldByName('TotalTrnOddsLe5Wins').AsInteger;
               fTotalTrnOddsLe5WinPct := dm.tblRatings.FieldByName('TotalTrnOddsLe5WinPct').AsFloat;

               iTotalTrnOddsGt5Starts := dm.tblRatings.FieldByName('TotalTrnOddsGt5Starts').AsInteger;
               iTotalTrnOddsGt5Wins := dm.tblRatings.FieldByName('TotalTrnOddsGt5Wins').AsInteger;
               fTotalTrnOddsGt5WinPct := dm.tblRatings.FieldByName('TotalTrnOddsGt5WinPct').AsFloat;

               iTotalTrn2yoStarts := dm.tblRatings.FieldByName('TotalTrn2yoStarts').AsInteger;
               iTotalTrn2yoWins := dm.tblRatings.FieldByName('TotalTrn2yoWins').AsInteger;
               fTotalTrn2yoWinPct := dm.tblRatings.FieldByName('TotalTrn2yoWinPct').AsFloat;

               iTotalTrnFavStarts := dm.tblRatings.FieldByName('TotalTrnFavStarts').AsInteger;
               iTotalTrnFavWins := dm.tblRatings.FieldByName('TotalTrnFavWins').AsInteger;
               fTotalTrnFavWinPct := dm.tblRatings.FieldByName('TotalTrnFavWinPct').AsFloat;

               fTrnTurfStarts := dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsFloat;
               fTrnTurfWins := dm.tblRatings.FieldByName('TotalTrnTurfWins').AsFloat;
               iTrnTurfStarts := dm.tblRatings.FieldByName('TotalTrnTurfStarts').AsInteger;
               iTrnTurfWins := dm.tblRatings.FieldByName('TotalTrnTurfWins').AsInteger;
               fTrnTurfWinPct := dm.tblRatings.FieldByName('TotalTrnTurfWinPct').AsFloat;
               fTrnTurfWinPct := Round(fTrnTurfWinPct * 100) / 100;

               fTrnClmStarts := dm.tblRatings.FieldByName('TotalTrnAftClmStarts').AsFloat;
               fTrnClmWins := dm.tblRatings.FieldByName('TotalTrnAftClmWins').AsFloat;
               fTrnClmWinPct := dm.tblRatings.FieldByName('TotalTrnAftClmWinPct').AsFloat;

               fTrn10Starts := dm.tblRatings.FieldByName('TotalTrn10Starts').AsFloat;
               fTrn10Wins := dm.tblRatings.FieldByName('TotalTrn10Wins').AsFloat;
               fTrn10WinPct := dm.tblRatings.FieldByName('TotalTrn10WinPct').AsFloat;

               fTrn30Starts := dm.tblRatings.FieldByName('TotalTrn30Starts').AsFloat;
               fTrn30Wins := dm.tblRatings.FieldByName('TotalTrn30Wins').AsFloat;
               fTrn30WinPct := dm.tblRatings.FieldByName('TotalTrn30WinPct').AsFloat;

               fJky10Starts := dm.tblRatings.FieldByName('TotalJky10Starts').AsFloat;
               fJky10Wins := dm.tblRatings.FieldByName('TotalJky10Wins').AsFloat;
               fJky10WinPct := dm.tblRatings.FieldByName('TotalJky10WinPct').AsFloat;

               fJky30Starts := dm.tblRatings.FieldByName('TotalJky30Starts').AsFloat;
               fJky30Wins := dm.tblRatings.FieldByName('TotalJky30Wins').AsFloat;
               fJky30WinPct := dm.tblRatings.FieldByName('TotalJky30WinPct').AsFloat;

               fTrn1stStarts := dm.tblRatings.FieldByName('TotalTrn1stStarts').AsFloat;
               fTrn1stWins := dm.tblRatings.FieldByName('TotalTrn1stWins').AsFloat;
               fTrn1stWinPct := dm.tblRatings.FieldByName('TotalTrn1stWinPct').AsFloat;

               fJkyTurfStarts := dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsFloat;
               fJkyTurfWins := dm.tblRatings.FieldByName('TotalJkyTurfWins').AsFloat;
               iJkyTurfStarts := dm.tblRatings.FieldByName('TotalJkyTurfStarts').AsInteger;
               iJkyTurfWins := dm.tblRatings.FieldByName('TotalJkyTurfWins').AsInteger;
               fJkyTurfWinPct := dm.tblRatings.FieldByName('TotalJkyTurfWinPct').AsFloat;

               iTotalTrnJkyStarts := dm.tblRatings.FieldByName('TotalTrnJkyStarts').AsInteger;
               iTotalTrnJkyWins := dm.tblRatings.FieldByName('TotalTrnJkyWins').AsInteger;
               fTotalTrnJkyStarts := dm.tblRatings.FieldByName('TotalTrnJkyStarts').AsFloat;
               fTotalTrnJkyWins := dm.tblRatings.FieldByName('TotalTrnJkyWins').AsFloat;
               fTotalTrnJkyWinPct := dm.tblRatings.FieldByName('TotalTrnJkyWinPct').AsFloat;

               iTotalTrnOwnStarts := dm.tblRatings.FieldByName('TotalTrnOwnStarts').AsInteger;
               iTotalTrnOwnWins := dm.tblRatings.FieldByName('TotalTrnOwnWins').AsInteger;
               fTotalTrnOwnWinPct := dm.tblRatings.FieldByName('TotalTrnOwnWinPct').AsFloat;

               iTotalTrn1To45Starts := dm.tblRatings.FieldByName('TotalTrn1To45Starts').AsInteger;
               iTotalTrn1To45Wins := dm.tblRatings.FieldByName('TotalTrn1To45Wins').AsInteger;
               fTotalTrn1To45WinPct := dm.tblRatings.FieldByName('TotalTrn1To45WinPct').AsFloat;

               iTotalTrn46To120Starts := dm.tblRatings.FieldByName('TotalTrn46To120Starts').AsInteger;
               iTotalTrn46To120Wins := dm.tblRatings.FieldByName('TotalTrn46To120Wins').AsInteger;
               fTotalTrn46To120WinPct := dm.tblRatings.FieldByName('TotalTrn46To120WinPct').AsFloat;

               iTotalTrn120PlusStarts := dm.tblRatings.FieldByName('TotalTrn120PlusStarts').AsInteger;
               iTotalTrn120PlusWins := dm.tblRatings.FieldByName('TotalTrn120PlusWins').AsInteger;
               fTotalTrn120PlusWinPct := dm.tblRatings.FieldByName('TotalTrn120PlusWinPct').AsFloat;

               iTotalTrnWork1To45Starts := dm.tblRatings.FieldByName('TotalTrnWork1To45Starts').AsInteger;
               iTotalTrnWork1To45Wins := dm.tblRatings.FieldByName('TotalTrnWork1To45Wins').AsInteger;
               fTotalTrnWork1To45WinPct := dm.tblRatings.FieldByName('TotalTrnWork1To45WinPct').AsFloat;

               iTotalTrnWork46To120Starts := dm.tblRatings.FieldByName('TotalTrnWork46To120Starts').AsInteger;
               iTotalTrnWork46To120Wins := dm.tblRatings.FieldByName('TotalTrnWork46To120Wins').AsInteger;
               fTotalTrnWork46To120WinPct := dm.tblRatings.FieldByName('TotalTrnWork46To120WinPct').AsFloat;

               iTotalTrnWork120PlusStarts := dm.tblRatings.FieldByName('TotalTrnWork120PlusStarts').AsInteger;
               iTotalTrnWork120PlusWins := dm.tblRatings.FieldByName('TotalTrnWork120PlusWins').AsInteger;
               fTotalTrnWork120PlusWinPct := dm.tblRatings.FieldByName('TotalTrnWork120PlusWinPct').AsFloat;

               iTotalTrnDebutStarts := dm.tblRatings.FieldByName('TotalTrnDebutStarts').AsInteger;
               fTotalTrnDebutStarts := dm.tblRatings.FieldByName('TotalTrnDebutStarts').AsFloat;
               iTotalTrnDebutWins := dm.tblRatings.FieldByName('TotalTrnDebutWins').AsInteger;
               fTotalTrnDebutWinPct := dm.tblRatings.FieldByName('TotalTrnDebutWinPct').AsFloat;

               iTotalTrnDebutTwoStarts := dm.tblRatings.FieldByName('TotalTrnDebutTwoStarts').AsInteger;
               iTotalTrnDebutTwoWins := dm.tblRatings.FieldByName('TotalTrnDebutTwoWins').AsInteger;
               fTotalTrnDebutTwoWinPct := dm.tblRatings.FieldByName('TotalTrnDebutTwoWinPct').AsFloat;

               iTotalTrnFirstJuiceStarts := dm.tblRatings.FieldByName('TotalTrnFirstJuiceStarts').AsInteger;
               iTotalTrnFirstJuiceWins := dm.tblRatings.FieldByName('TotalTrnFirstJuiceWins').AsInteger;
               fTotalTrnFirstJuiceWinPct := dm.tblRatings.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat;

               iTotalTrnSecondJuiceStarts := dm.tblRatings.FieldByName('TotalTrnSecondJuiceStarts').AsInteger;
               iTotalTrnSecondJuiceWins := dm.tblRatings.FieldByName('TotalTrnSecondJuiceWins').AsInteger;
               fTotalTrnSecondJuiceWinPct := dm.tblRatings.FieldByName('TotalTrnSecondJuiceWinPct').AsFloat;

               iTotalTrnBlinkersOnStarts := dm.tblRatings.FieldByName('TotalTrnBlinkersOnStarts').AsInteger;
               iTotalTrnBlinkersOnWins := dm.tblRatings.FieldByName('TotalTrnBlinkersOnWins').AsInteger;
               fTotalTrnBlinkersOnWinPct := dm.tblRatings.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat;

               iTotalTrnBlinkersOffStarts := dm.tblRatings.FieldByName('TotalTrnBlinkersOffStarts').AsInteger;
               iTotalTrnBlinkersOffWins := dm.tblRatings.FieldByName('TotalTrnBlinkersOffWins').AsInteger;
               fTotalTrnBlinkersOffWinPct := dm.tblRatings.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat;

               iTrnTurfToDirtWinPct := dm.tblRatings.FieldByName('TrnTurfToDirtWinPct').AsInteger;
               iTrnDirtToTurfWinPct := dm.tblRatings.FieldByName('TrnDirtToTurfWinPct').AsInteger;
               iTrnSprToRteWinPct := dm.tblRatings.FieldByName('TrnSprToRteWinPct').AsInteger;
               iTrnRteToSprWinPct := dm.tblRatings.FieldByName('TrnRteToSprWinPct').AsInteger;

               iTrnTurfToDirtStarts := dm.tblRatings.FieldByName('TrnTurfToDirtStarts').AsInteger;
               iTrnDirtToTurfStarts := dm.tblRatings.FieldByName('TrnDirtToTurfStarts').AsInteger;
               iTrnSprToRteStarts := dm.tblRatings.FieldByName('TrnSprToRteStarts').AsInteger;
               iTrnRteToSprStarts := dm.tblRatings.FieldByName('TrnRteToSprStarts').AsInteger;

               iTrnStkWinPct := dm.tblRatings.FieldByName('TrnStkWinPct').AsInteger;
               iTrnAlwWinPct := dm.tblRatings.FieldByName('TrnAlwWinPct').AsInteger;
               iTrnClmWinPct := dm.tblRatings.FieldByName('TrnClmWinPct').AsInteger;
               iTrnMdnWinPct := dm.tblRatings.FieldByName('TrnMdnWinPct').AsInteger;

               iTotalJkyStarts := dm.tblRatings.FieldByName('TotalJkyStarts').AsInteger;
               iTotalJkyWins := dm.tblRatings.FieldByName('TotalJkyWins').AsInteger;
               fTotalJkyWinPct := dm.tblRatings.FieldByName('TotalJkyWinPct').AsFloat;

               iTotalJkyOddsLe5Starts := dm.tblRatings.FieldByName('TotalJkyOddsLe5Starts').AsInteger;
               iTotalJkyOddsLe5Wins := dm.tblRatings.FieldByName('TotalJkyOddsLe5Wins').AsInteger;
               fTotalJkyOddsLe5WinPct := dm.tblRatings.FieldByName('TotalJkyOddsLe5WinPct').AsFloat;

               iTotalJkyOddsGt5Starts := dm.tblRatings.FieldByName('TotalJkyOddsGt5Starts').AsInteger;
               iTotalJkyOddsGt5Wins := dm.tblRatings.FieldByName('TotalJkyOddsGt5Wins').AsInteger;
               fTotalJkyOddsGt5WinPct := dm.tblRatings.FieldByName('TotalJkyOddsGt5WinPct').AsFloat;

               iTotalJky2yoStarts := dm.tblRatings.FieldByName('TotalJky2yoStarts').AsInteger;
               iTotalJky2yoWins := dm.tblRatings.FieldByName('TotalJky2yoWins').AsInteger;
               fTotalJky2yoWinPct := dm.tblRatings.FieldByName('TotalJky2yoWinPct').AsFloat;

               iTotalJkyFavStarts := dm.tblRatings.FieldByName('TotalJkyFavStarts').AsInteger;
               iTotalJkyFavWins := dm.tblRatings.FieldByName('TotalJkyFavWins').AsInteger;
               fTotalJkyFavWinPct := dm.tblRatings.FieldByName('TotalJkyFavWinPct').AsFloat;

               iTotalJkyOddsStarts := dm.tblRatings.FieldByName('TotalJkyOddsStarts').AsInteger;
               iTotalJkyOddsWins := dm.tblRatings.FieldByName('TotalJkyOddsWins').AsInteger;
               fTotalJkyOddsWinPct := dm.tblRatings.FieldByName('TotalJkyOddsWinPct').AsFloat;


               iTotalOwnStarts := dm.tblRatings.FieldByName('TotalOwnStarts').AsInteger;
               iTotalOwnWins := dm.tblRatings.FieldByName('TotalOwnWins').AsInteger;
               fTotalOwnWinPct := dm.tblRatings.FieldByName('TotalOwnWinPct').AsFloat;

               iTotalBrdStarts := dm.tblRatings.FieldByName('TotalBrdStarts').AsInteger;
               iTotalBrdWins := dm.tblRatings.FieldByName('TotalBrdWins').AsInteger;
               fTotalBrdWinPct := dm.tblRatings.FieldByName('TotalBrdWinPct').AsFloat;

               fPower := dm.tblRatings.FieldByName('Power').AsFloat;

               iBackSpeed := dm.tblRatings.FieldByName('BackSpeed').AsInteger;
               iLastSpeed := dm.tblRatings.FieldByName('LastSpeed').AsInteger;

               fEarlyPace := dm.tblRatings.FieldByName('EarlyPace').AsFloat;
               fMiddlePace := dm.tblRatings.FieldByName('MiddlePace').AsFloat;
               fLatePace := dm.tblRatings.FieldByName('LatePace').AsFloat;

               fEarlyPacePos := dm.tblRatings.FieldByName('EarlyPacePos').AsFloat;
               fMiddlePacePos := dm.tblRatings.FieldByName('MiddlePacePos').AsFloat;
               fLatePacePos := dm.tblRatings.FieldByName('LatePacePos').AsFloat;

               iSpeed1Back := dm.tblRatings.FieldByName('Speed1Back').AsInteger;
               iSpeed2Back := dm.tblRatings.FieldByName('Speed2Back').AsInteger;
               iSpeed3Back := dm.tblRatings.FieldByName('Speed3Back').AsInteger;
               iSpeed4Back := dm.tblRatings.FieldByName('Speed4Back').AsInteger;
               iSpeed5Back := dm.tblRatings.FieldByName('Speed5Back').AsInteger;

               bClaimed1Back := dm.tblRatings.FieldByName('IsClaimed1Back').AsBoolean;
               bClaimed2Back := dm.tblRatings.FieldByName('IsClaimed2Back').AsBoolean;

               dtLocalTimeOfRace := dm.tblRatings.FieldByName('LocalTimeOfRace').AsDateTime;

               fDamAllWinPct := dm.tblRatings.FieldByName('DamAllWinPct').AsFloat;
               fDamAllMudWinPct := dm.tblRatings.FieldByName('DamAllMudWinPct').AsFloat;
               fDamAllTurfWinPct := dm.tblRatings.FieldByName('DamAllTurfWinPct').AsFloat;

               fDamSireAllWinPct := dm.tblRatings.FieldByName('DamSireAllWinPct').AsFloat;
               fDamSireAllMudWinPct := dm.tblRatings.FieldByName('DamSireAllMudWinPct').AsFloat;
               fDamSireAllTurfWinPct := dm.tblRatings.FieldByName('DamSireAllTurfWinPct').AsFloat;

               fSireAllWinPct := dm.tblRatings.FieldByName('SireAllWinPct').AsFloat;
               fSireAllMudWinPct := dm.tblRatings.FieldByName('SireAllMudWinPct').AsFloat;
               fSireAllTurfWinPct := dm.tblRatings.FieldByName('SireAllTurfWinPct').AsFloat;

               // Over ride with axcis stuff - add the dam sire stuff
               fDamAllWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_FOAL').AsString, 7, 3));
               fDamAllMudWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_OFFTRK').AsString, 7, 3));
               fDamAllTurfWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_TURFST').AsString, 7, 3));

               fDam2yoWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_2YR').AsString, 7, 3));
               fDamDebutWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_FTS').AsString, 7, 3));
               fSireDebutWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_FTS').AsString, 7, 3));
               fSire2yoWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_2YR').AsString, 7, 3));
               fSireTrfRteWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TR').AsString, 7, 3));
               fSireTrfSprWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TS').AsString, 7, 3));
               fSireDirtRteWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_DR').AsString, 7, 3));
               fSireDirtSprWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_DS').AsString, 7, 3));


               fSireAllWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_FOAL').AsString, 7, 3));
               fSireAllMudWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_OFFTRK').AsString, 7, 3));
               fSireAllTurfWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TURF').AsString, 7, 3));

               if fSireAllWinPct = 0 then begin
                  fSireAllWinPct := 1;
               end;
               if fSireAllTurfWinPct = 0 then begin
                  fSireAllTurfWinPct := 1;
               end;
               if fSireAllMudWinPct = 0 then begin
                  fSireAllMudWinPct := 1;
               end;

               if fDamSireAllWinPct = 0 then begin
                  fDamSireAllWinPct := 1;
               end;
               if fDamSireAllTurfWinPct = 0 then begin
                  fDamSireAllTurfWinPct := 1;
               end;
               if fDamSireAllMudWinPct = 0 then begin
                  fDamSireAllMudWinPct := 1;
               end;

               fClassRating := ((fDamSireAllWinPct / 100) * (fSireAllWinPct / 100)) * 1000;
               fTurfRating := ((fDamSireAllTurfWinPct / 100) * (fSireAllTurfWinPct / 100)) * 1000;
               fMudRating := ((fDamSireAllMudWinPct / 100) * (fSireAllMudWinPct / 100)) * 1000;

               fDamSireAllWinPct := dm.tblRatings.FieldByName('DamSireAllWinPct').AsFloat;
               fDamSireAllMudWinPct := dm.tblRatings.FieldByName('DamSireAllMudWinPct').AsFloat;
               fDamSireAllTurfWinPct := dm.tblRatings.FieldByName('DamSireAllTurfWinPct').AsFloat;

               fDamAllWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_FOAL').AsString, 7, 3));
               fDamAllMudWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_OFFTRK').AsString, 7, 3));
               fDamAllTurfWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_TURFST').AsString, 7, 3));

               fSireAllWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_FOAL').AsString, 7, 3));
               fSireAllMudWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_OFFTRK').AsString, 7, 3));
               fSireAllTurfWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TURF').AsString, 7, 3));

               fDam2yoWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_2YR').AsString, 7, 3));
               fDamDebutWinPct := atof(CopyStr(dm.tblEntries.FieldByName('DAM_REC_FTS').AsString, 7, 3));
               fSireDebutWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_FTS').AsString, 7, 3));
               fSire2yoWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_2YR').AsString, 7, 3));
               fSireTrfRteWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TR').AsString, 7, 3));
               fSireTrfSprWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_TS').AsString, 7, 3));
               fSireDirtRteWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_DR').AsString, 7, 3));
               fSireDirtSprWinPct := atof(CopyStr(dm.tblEntries.FieldByName('SIRE_REC_DS').AsString, 7, 3));

               //
               dtLastRaceDate := dm.tblRatings.FieldByName('LastRaceDate').AsDateTime;
               sLastTrkCode := dm.tblRatings.FieldByName('LastTrkCode').AsString;
               iLastRaceNbr := dm.tblRatings.FieldByName('LastRaceNbr').AsInteger;
               iLastPostPos := dm.tblRatings.FieldByName('LastPostPos').AsInteger;
               sLastRaceType := dm.tblRatings.FieldByName('LastRaceType').AsString;
               sLastSurf := dm.tblRatings.FieldByName('LastSurf').AsString;
               sLastRaceConditions := dm.tblRatings.FieldByName('LastRaceConditions').AsString;
               sLastDistanceDesc := dm.tblRatings.FieldByName('LastDistanceDesc').AsString;
               fLastDistance := dm.tblRatings.FieldByName('LastDistance').AsFloat;
               fLastOdds := dm.tblRatings.FieldByName('LastOdds').AsFloat;

               sLastFavoriteIndicator := dm.tblRatings.FieldByName('LastFavoriteIndicator').AsString;
               sLastDQIndicator := dm.tblRatings.FieldByName('LastDQIndicator').AsString;
               sLastJockey := dm.tblRatings.FieldByName('LastJockey').AsString;
               sLastClaimed := dm.tblRatings.FieldByName('LastClaimed').AsString;
               sLastComment := dm.tblRatings.FieldByName('LastComment').AsString;
               sLastComment2 := dm.tblRatings.FieldByName('LastComment2').AsString;

               sLastTopFinish1 := dm.tblRatings.FieldByName('LastTopFinish1').AsString;
               sLastTopFinish2 := dm.tblRatings.FieldByName('LastTopFinish2').AsString;
               sLastTopFinish3 := dm.tblRatings.FieldByName('LastTopFinish3').AsString;
               sLastTrkCond := dm.tblRatings.FieldByName('LastTrkCond').AsString;
               fLastClmPrice := dm.tblRatings.FieldByName('LastClmPrice').AsFloat;
               fLastPurse := dm.tblRatings.FieldByName('LastPurse').AsFloat;

               fBackClass := dm.tblRatings.FieldByName('BackClass').AsFloat;

               sLastDay := dm.tblRatings.FieldByName('LastDay').AsString;
               sLastMonthDesc := dm.tblRatings.FieldByName('LastMonthDesc').AsString;
               sLastYear := dm.tblRatings.FieldByName('LastYear').AsString;

               fLastTime1stCall := dm.tblRatings.FieldByName('LastTime1stCall').AsFloat;
               fLastTime2ndCall := dm.tblRatings.FieldByName('LastTime2ndCall').AsFloat;
               fLastTimeStrCall := dm.tblRatings.FieldByName('LastTimeStrCall').AsFloat;
               fLastTimeFinCall := dm.tblRatings.FieldByName('LastTimeFinCall').AsFloat;

               fLastPos1stCall := dm.tblRatings.FieldByName('LastPos1stCall').AsFloat;
               fLastPos2ndCall := dm.tblRatings.FieldByName('LastPos2ndCall').AsFloat;
               fLastPosStrCall := dm.tblRatings.FieldByName('LastPosStrCall').AsFloat;
               fLastPosFinCall := dm.tblRatings.FieldByName('LastPosFinCall').AsFloat;

               fLastBL1stCall := dm.tblRatings.FieldByName('LastBL1stCall').AsFloat;
               fLastBL2ndCall := dm.tblRatings.FieldByName('LastBL2ndCall').AsFloat;
               fLastBLStrCall := dm.tblRatings.FieldByName('LastBLStrCall').AsFloat;
               fLastBLFinCall := dm.tblRatings.FieldByName('LastBLFinCall').AsFloat;

               sLastGateBreak := dm.tblRatings.FieldByName('LastGateBreak').AsString;
               sLastLen1Back := dm.tblRatings.FieldByName('LastLen1Back').AsString;
               sLastLen2Back := dm.tblRatings.FieldByName('LastLen2Back').AsString;
               sLastStLenBack := dm.tblRatings.FieldByName('LastStLenBack').AsString;
               sLastFinishBeaten := dm.tblRatings.FieldByName('LastFinishBeaten').AsString;
               iLastWeight := dm.tblRatings.FieldByName('LastWeight').AsInteger;
               iLastTrackVariant := dm.tblRatings.FieldByName('LastTrackVariant').AsInteger;

               iLastClass := dm.tblRatings.FieldByName('LastClass').AsInteger;

               fLastHorseTime := dm.tblRatings.FieldByName('LastHorseTime').AsFloat;
               fLastWinTime := dm.tblRatings.FieldByName('LastWinTime').AsFloat;
               iLastSRWinner := dm.tblRatings.FieldByName('LastSRWinner').AsInteger;

               iLifeTurfStarts := dm.tblRatings.FieldByName('LifeTurfStarts').AsInteger;
               iLifeTurfWins := dm.tblRatings.FieldByName('LifeTurfWins').AsInteger;
               if iLifeTurfStarts > 0 then begin
                  fLifeTurfWinPct := (dm.tblRatings.FieldByName('LifeTurfWins').AsFloat / dm.tblRatings.FieldByName('LifeTurfStarts').AsFloat) * 100;
               end else begin
                  fLifeTurfWinPct := 0;
               end;

               iLifeMudStarts := dm.tblRatings.FieldByName('LifeMudStarts').AsInteger;
               iLifeMudWins := dm.tblRatings.FieldByName('LifeMudWins').AsInteger;
               if iLifeMudStarts > 0 then begin
                  fLifeMudWinPct := (dm.tblRatings.FieldByName('LifeMudWins').AsFloat / dm.tblRatings.FieldByName('LifeMudStarts').AsFloat) * 100;
               end else begin
                  fLifeMudWinPct := 0;
               end;
            end;
         end;

         dm.tblEntries.Edit();

         dm.tblEntries.FieldByName('TotalTrnTurfStarts').AsFloat := fTrnTurfStarts;
         dm.tblEntries.FieldByName('TotalTrnTurfWins').AsFloat := fTrnTurfWins;
         dm.tblEntries.FieldByName('TotalTrnTurfWinPct').AsFloat := Round(fTrnTurfWinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalTrnAftClmStarts').AsFloat := fTrnClmStarts;
         dm.tblEntries.FieldByName('TotalTrnAftClmWins').AsFloat := fTrnClmWins;
         dm.tblEntries.FieldByName('TotalTrnAftClmWinPct').AsFloat := Round(fTrnClmWinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalTrn1stStarts').AsFloat := fTrn1stStarts;
         dm.tblEntries.FieldByName('TotalTrn1stWins').AsFloat := fTrn1stWins;
         dm.tblEntries.FieldByName('TotalTrn1stWinPct').AsFloat := Round(fTrn1stWinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalTrn10Starts').AsFloat := fTrn10Starts;
         dm.tblEntries.FieldByName('TotalTrn10Wins').AsFloat := fTrn10Wins;
         dm.tblEntries.FieldByName('TotalTrn10WinPct').AsFloat := Round(fTrn10WinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalTrn30Starts').AsFloat := fTrn30Starts;
         dm.tblEntries.FieldByName('TotalTrn30Wins').AsFloat := fTrn30Wins;
         dm.tblEntries.FieldByName('TotalTrn30WinPct').AsFloat := Round(fTrn30WinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalJky10Starts').AsFloat := fJky10Starts;
         dm.tblEntries.FieldByName('TotalJky10Wins').AsFloat := fJky10Wins;
         dm.tblEntries.FieldByName('TotalJky10WinPct').AsFloat := Round(fJky10WinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalJky30Starts').AsFloat := fJky30Starts;
         dm.tblEntries.FieldByName('TotalJky30Wins').AsFloat := fJky30Wins;
         dm.tblEntries.FieldByName('TotalJky30WinPct').AsFloat := Round(fJky30WinPct * 100) / 100;

         dm.tblEntries.FieldByName('TotalJkyTurfStarts').AsFloat := fJkyTurfStarts;
         dm.tblEntries.FieldByName('TotalJkyTurfWins').AsFloat := fJkyTurfWins;
         dm.tblEntries.FieldByName('TotalJkyTurfWinPct').AsFloat := Round(fJkyTurfWinPct * 100) / 100;

         dm.tblEntries.FieldByName('Power').AsFloat := fPower;

         dm.tblEntries.FieldByName('BackSpeed').AsInteger := iBackSpeed;
         dm.tblEntries.FieldByName('LastSpeed').AsInteger := iLastSpeed;

         dm.tblEntries.FieldByName('EarlyPace').AsFloat := fEarlyPace;
         dm.tblEntries.FieldByName('MiddlePace').AsFloat := fMiddlePace;
         dm.tblEntries.FieldByName('LatePace').AsFloat := fLatePace;

         dm.tblEntries.FieldByName('EarlyPacePos').AsFloat := fEarlyPacePos;
         dm.tblEntries.FieldByName('MiddlePacePos').AsFloat := fMiddlePacePos;
         dm.tblEntries.FieldByName('LatePacePos').AsFloat := fLatePacePos;

         dm.tblEntries.FieldByName('IsClaimed1Back').AsBoolean := bClaimed1Back;
         dm.tblEntries.FieldByName('IsClaimed2Back').AsBoolean := bClaimed2Back;

         //         dm.tblEntries.FieldByName('Speed1Back').AsFloat := iSpeed1Back;
         //         dm.tblEntries.FieldByName('Speed2Back').AsFloat := iSpeed2Back;
         //         dm.tblEntries.FieldByName('Speed3Back').AsFloat := iSpeed3Back;
         //         dm.tblEntries.FieldByName('Speed4Back').AsFloat := iSpeed4Back;
         //         dm.tblEntries.FieldByName('Speed5Back').AsFloat := iSpeed5Back;

         //         dm.tblEntries.FieldByName('TimesSpdDeclined').AsInteger := 0;
         //         if (iSpeed1Back < iSpeed2Back) and (iSpeed2Back < iSpeed3Back) then begin
         //            dm.tblEntries.FieldByName('TimesSpdDeclined').AsInteger := 2;
         //         end;
         //         if (iSpeed1Back < iSpeed2Back) and (iSpeed2Back < iSpeed3Back) and
         //            (iSpeed3Back < iSpeed4Back) then begin
         //            dm.tblEntries.FieldByName('TimesSpdDeclined').AsInteger := 3;
         //         end;
         //         if (iSpeed1Back < iSpeed2Back) and (iSpeed2Back < iSpeed3Back) and
         //            (iSpeed3Back < iSpeed4Back) and (iSpeed4Back < iSpeed5Back) then begin
         //            dm.tblEntries.FieldByName('TimesSpdDeclined').AsInteger := 4;
         //         end;

         dm.tblEntries.FieldByName('TrnTodayStarts').AsInteger := iTrnTodayStarts;
         dm.tblEntries.FieldByName('TrnTodayWins').AsInteger := iTrnTodayWins;
         dm.tblEntries.FieldByName('TrnTodayWinPct').AsFloat := fTrnTodayWinPct;

         dm.tblEntries.FieldByName('TotalTrnStarts').AsInteger := iTotalTrnStarts;
         dm.tblEntries.FieldByName('TotalTrnWins').AsInteger := iTotalTrnWins;
         dm.tblEntries.FieldByName('TotalTrnWinPct').AsFloat := fTotalTrnWinPct;

         dm.tblEntries.FieldByName('TotalTrnOddsStarts').AsInteger := iTotalTrnOddsStarts;
         dm.tblEntries.FieldByName('TotalTrnOddsWins').AsInteger := iTotalTrnOddsWins;
         dm.tblEntries.FieldByName('TotalTrnOddsWinPct').AsFloat := fTotalTrnOddsWinPct;


         //         dm.tblEntries.FieldByName('TotalTrnOddsLe5Starts').AsInteger := iTotalTrnOddsLe5Starts;
         //         dm.tblEntries.FieldByName('TotalTrnOddsLe5Wins').AsInteger := iTotalTrnOddsLe5Wins;
         //         dm.tblEntries.FieldByName('TotalTrnOddsLe5WinPct').AsFloat := fTotalTrnOddsLe5WinPct;

         //         dm.tblEntries.FieldByName('TotalTrnOddsGt5Starts').AsInteger := iTotalTrnOddsGt5Starts;
         //         dm.tblEntries.FieldByName('TotalTrnOddsGt5Wins').AsInteger := iTotalTrnOddsGt5Wins;
         //         dm.tblEntries.FieldByName('TotalTrnOddsGt5WinPct').AsFloat := fTotalTrnOddsGt5WinPct;

         dm.tblEntries.FieldByName('TotalTrn2yoStarts').AsInteger := iTotalTrn2yoStarts;
         dm.tblEntries.FieldByName('TotalTrn2yoWins').AsInteger := iTotalTrn2yoWins;
         dm.tblEntries.FieldByName('TotalTrn2yoWinPct').AsFloat := fTotalTrn2yoWinPct;

         //         dm.tblEntries.FieldByName('TotalTrnFavStarts').AsInteger := iTotalTrnFavStarts;
         //         dm.tblEntries.FieldByName('TotalTrnFavWins').AsInteger := iTotalTrnFavWins;
         //         dm.tblEntries.FieldByName('TotalTrnFavWinPct').AsFloat := fTotalTrnFavWinPct;

         dm.tblEntries.FieldByName('TotalTrnJkyStarts').AsFloat := iTotalTrnJkyStarts;
         dm.tblEntries.FieldByName('TotalTrnJkyWins').AsInteger := iTotalTrnJkyWins;
         dm.tblEntries.FieldByName('TotalTrnJkyWinPct').AsFloat := fTotalTrnJkyWinPct;

         dm.tblEntries.FieldByName('TotalTrnOwnStarts').AsInteger := iTotalTrnOwnStarts;
         dm.tblEntries.FieldByName('TotalTrnOwnWins').AsInteger := iTotalTrnOwnWins;
         dm.tblEntries.FieldByName('TotalTrnOwnWinPct').AsFloat := fTotalTrnOwnWinPct;

         dm.tblEntries.FieldByName('TotalTrn1To45Starts').AsInteger := iTotalTrn1To45Starts;
         dm.tblEntries.FieldByName('TotalTrn1To45Wins').AsInteger := iTotalTrn1To45Wins;
         dm.tblEntries.FieldByName('TotalTrn1To45WinPct').AsFloat := fTotalTrn1To45WinPct;

         dm.tblEntries.FieldByName('TotalTrn46To120Starts').AsInteger := iTotalTrn46To120Starts;
         dm.tblEntries.FieldByName('TotalTrn46To120Wins').AsInteger := iTotalTrn46To120Wins;
         dm.tblEntries.FieldByName('TotalTrn46To120WinPct').AsFloat := fTotalTrn46To120WinPct;

         dm.tblEntries.FieldByName('TotalTrn120PlusStarts').AsInteger := iTotalTrn120PlusStarts;
         dm.tblEntries.FieldByName('TotalTrn120PlusWins').AsInteger := iTotalTrn120PlusWins;
         dm.tblEntries.FieldByName('TotalTrn120PlusWinPct').AsFloat := fTotalTrn120PlusWinPct;

         dm.tblEntries.FieldByName('TotalTrnWork1To45Starts').AsInteger := iTotalTrnWork1To45Starts;
         dm.tblEntries.FieldByName('TotalTrnWork1To45Wins').AsInteger := iTotalTrnWork1To45Wins;
         dm.tblEntries.FieldByName('TotalTrnWork1To45WinPct').AsFloat := fTotalTrnWork1To45WinPct;

         dm.tblEntries.FieldByName('TotalTrnWork46To120Starts').AsInteger := iTotalTrnWork46To120Starts;
         dm.tblEntries.FieldByName('TotalTrnWork46To120Wins').AsInteger := iTotalTrnWork46To120Wins;
         dm.tblEntries.FieldByName('TotalTrnWork46To120WinPct').AsFloat := fTotalTrnWork46To120WinPct;

         dm.tblEntries.FieldByName('TotalTrnWork120PlusStarts').AsInteger := iTotalTrnWork120PlusStarts;
         dm.tblEntries.FieldByName('TotalTrnWork120PlusWins').AsInteger := iTotalTrnWork120PlusWins;
         dm.tblEntries.FieldByName('TotalTrnWork120PlusWinPct').AsFloat := fTotalTrnWork120PlusWinPct;

         dm.tblEntries.FieldByName('TotalTrnDebutStarts').AsInteger := iTotalTrnDebutStarts;
         dm.tblEntries.FieldByName('TotalTrnDebutWins').AsInteger := iTotalTrnDebutWins;
         dm.tblEntries.FieldByName('TotalTrnDebutWinPct').AsFloat := fTotalTrnDebutWinPct;

         dm.tblEntries.FieldByName('TotalTrnDebutTwoStarts').AsInteger := iTotalTrnDebutTwoStarts;
         dm.tblEntries.FieldByName('TotalTrnDebutTwoWins').AsInteger := iTotalTrnDebutTwoWins;
         dm.tblEntries.FieldByName('TotalTrnDebutTwoWinPct').AsFloat := fTotalTrnDebutTwoWinPct;

         dm.tblEntries.FieldByName('TotalTrnFirstJuiceStarts').AsInteger := iTotalTrnFirstJuiceStarts;
         dm.tblEntries.FieldByName('TotalTrnFirstJuiceWins').AsInteger := iTotalTrnFirstJuiceWins;
         dm.tblEntries.FieldByName('TotalTrnFirstJuiceWinPct').AsFloat := fTotalTrnFirstJuiceWinPct;

         //         dm.tblEntries.FieldByName('TotalTrnSecondJuiceStarts').AsInteger := iTotalTrnSecondJuiceStarts;
         //         dm.tblEntries.FieldByName('TotalTrnSecondJuiceWins').AsInteger := iTotalTrnSecondJuiceWins;
         //         dm.tblEntries.FieldByName('TotalTrnSecondJuiceWinPct').AsFloat := fTotalTrnSecondJuiceWinPct;

         dm.tblEntries.FieldByName('TotalTrnBlinkersOnStarts').AsInteger := iTotalTrnBlinkersOnStarts;
         dm.tblEntries.FieldByName('TotalTrnBlinkersOnWins').AsInteger := iTotalTrnBlinkersOnWins;
         dm.tblEntries.FieldByName('TotalTrnBlinkersOnWinPct').AsFloat := fTotalTrnBlinkersOnWinPct;

         dm.tblEntries.FieldByName('TotalTrnBlinkersOffStarts').AsInteger := iTotalTrnBlinkersOffStarts;
         dm.tblEntries.FieldByName('TotalTrnBlinkersOffWins').AsInteger := iTotalTrnBlinkersOffWins;
         dm.tblEntries.FieldByName('TotalTrnBlinkersOffWinPct').AsFloat := fTotalTrnBlinkersOffWinPct;

         dm.tblEntries.FieldByName('TrnTurfToDirtStarts').AsInteger := iTrnTurfToDirtStarts;
         dm.tblEntries.FieldByName('TrnTurfToDirtWinPct').AsInteger := iTrnTurfToDirtWinPct;

         dm.tblEntries.FieldByName('TrnDirtToTurfStarts').AsInteger := iTrnDirtToTurfStarts;
         dm.tblEntries.FieldByName('TrnDirtToTurfWinPct').AsInteger := iTrnDirtToTurfWinPct;

         dm.tblEntries.FieldByName('TrnSprToRteStarts').AsInteger := iTrnSprToRteStarts;
         dm.tblEntries.FieldByName('TrnSprToRteWinPct').AsInteger := iTrnSprToRteWinPct;

         dm.tblEntries.FieldByName('TrnRteToSprStarts').AsInteger := iTrnRteToSprStarts;
         dm.tblEntries.FieldByName('TrnRteToSprWinPct').AsInteger := iTrnRteToSprWinPct;

         dm.tblEntries.FieldByName('TrnStkWinPct').AsInteger := iTrnStkWinPct;
         dm.tblEntries.FieldByName('TrnAlwWinPct').AsInteger := iTrnAlwWinPct;
         dm.tblEntries.FieldByName('TrnClmWinPct').AsInteger := iTrnClmWinPct;
         dm.tblEntries.FieldByName('TrnMdnWinPct').AsInteger := iTrnMdnWinPct;

         dm.tblEntries.FieldByName('TotalJkyStarts').AsInteger := iTotalJkyStarts;
         dm.tblEntries.FieldByName('TotalJkyWins').AsInteger := iTotalJkyWins;
         dm.tblEntries.FieldByName('TotalJkyWinPct').AsFloat := fTotalJkyWinPct;

         dm.tblEntries.FieldByName('TotalJkyOddsStarts').AsInteger := iTotalJkyOddsStarts;
         dm.tblEntries.FieldByName('TotalJkyOddsWins').AsInteger := iTotalJkyOddsWins;
         dm.tblEntries.FieldByName('TotalJkyOddsWinPct').AsFloat := fTotalJkyOddsWinPct;

         //         dm.tblEntries.FieldByName('TotalJkyOddsLe5Starts').AsInteger := iTotalJkyOddsLe5Starts;
         //         dm.tblEntries.FieldByName('TotalJkyOddsLe5Wins').AsInteger := iTotalJkyOddsLe5Wins;
         //         dm.tblEntries.FieldByName('TotalJkyOddsLe5WinPct').AsFloat := fTotalJkyOddsLe5WinPct;
         //
         //         dm.tblEntries.FieldByName('TotalJkyOddsGt5Starts').AsInteger := iTotalJkyOddsGt5Starts;
         //         dm.tblEntries.FieldByName('TotalJkyOddsGt5Wins').AsInteger := iTotalJkyOddsGt5Wins;
         //         dm.tblEntries.FieldByName('TotalJkyOddsGt5WinPct').AsFloat := fTotalJkyOddsGt5WinPct;
         //
         dm.tblEntries.FieldByName('TotalJky2yoStarts').AsInteger := iTotalJky2yoStarts;
         dm.tblEntries.FieldByName('TotalJky2yoWins').AsInteger := iTotalJky2yoWins;
         dm.tblEntries.FieldByName('TotalJky2yoWinPct').AsFloat := fTotalJky2yoWinPct;

         //         dm.tblEntries.FieldByName('TotalJkyFavStarts').AsInteger := iTotalJkyFavStarts;
         //         dm.tblEntries.FieldByName('TotalJkyFavWins').AsInteger := iTotalJkyFavWins;
         //         dm.tblEntries.FieldByName('TotalJkyFavWinPct').AsFloat := fTotalJkyFavWinPct;

         dm.tblEntries.FieldByName('TotalOwnStarts').AsInteger := iTotalOwnStarts;
         dm.tblEntries.FieldByName('TotalOwnWins').AsInteger := iTotalOwnWins;
         dm.tblEntries.FieldByName('TotalOwnWinPct').AsFloat := fTotalOwnWinPct;

         dm.tblEntries.FieldByName('TotalBrdStarts').AsInteger := iTotalBrdStarts;
         dm.tblEntries.FieldByName('TotalBrdWins').AsInteger := iTotalBrdWins;
         dm.tblEntries.FieldByName('TotalBrdWinPct').AsFloat := fTotalBrdWinPct;

         dm.tblEntries.FieldByName('LastTrkCode').AsString := sLastTrkCode;
         dm.tblEntries.FieldByName('LastRaceDate').AsDateTime := dtLastRaceDate;
         dm.tblEntries.FieldByName('LastPostPos').AsInteger := iLastPostPos;
         dm.tblEntries.FieldByName('LastRaceNbr').AsInteger := iLastRaceNbr;

         dm.tblEntries.FieldByName('LastSurf').AsString := sLastSurf;
         dm.tblEntries.FieldByName('LastRaceType').AsString := sLastRaceType;
         dm.tblEntries.FieldByName('LastRaceConditions').AsString := sLastRaceConditions;
         dm.tblEntries.FieldByName('LastDistanceDesc').AsString := sLastDistanceDesc;
         dm.tblEntries.FieldByName('LastDistance').AsFloat := fLastDistance;


         dm.tblEntries.FieldByName('LastOdds').AsFloat := fLastOdds;
         dm.tblEntries.FieldByName('LastFavoriteIndicator').AsString := sLastFavoriteIndicator;
         dm.tblEntries.FieldByName('LastDQIndicator').AsString := sLastDQIndicator;
         dm.tblEntries.FieldByName('LastJockey').AsString := sLastJockey;
         dm.tblEntries.FieldByName('LastComment').AsString := sLastComment;
         dm.tblEntries.FieldByName('LastComment2').AsString := sLastComment2;
         //         dm.tblEntries.FieldByName('LastTopFinish1').AsString := sLastTopFinish1;
         //         dm.tblEntries.FieldByName('LastTopFinish2').AsString := sLastTopFinish2;
         //         dm.tblEntries.FieldByName('LastTopFinish3').AsString := sLastTopFinish3;

         dm.tblEntries.FieldByName('LastTrkCond').AsString := sLastTrkCond;
         dm.tblEntries.FieldByName('LastClmPrice').AsFloat := fLastClmPrice;
         dm.tblEntries.FieldByName('LastPurse').AsFloat := fLastPurse;
         dm.tblEntries.FieldByName('LastClaimed').AsString := sLastClaimed;

         dm.tblEntries.FieldByName('LastDay').AsString := sLastDay;
         dm.tblEntries.FieldByName('LastMonthDesc').AsString := sLastMonthDesc;
         dm.tblEntries.FieldByName('LastYear').AsString := sLastYear;

         dm.tblEntries.FieldByName('LastTime1stCall').AsFloat := fLastTime1stCall;
         dm.tblEntries.FieldByName('LastTime2ndCall').AsFloat := fLastTime2ndCall;
         dm.tblEntries.FieldByName('LastTimeStrCall').AsFloat := fLastTimeStrCall;
         dm.tblEntries.FieldByName('LastTimeFinCall').AsFloat := fLastTimeFinCall;

         dm.tblEntries.FieldByName('LastPos1stCall').AsFloat := fLastPos1stCall;
         dm.tblEntries.FieldByName('LastPos2ndCall').AsFloat := fLastPos2ndCall;
         dm.tblEntries.FieldByName('LastPosStrCall').AsFloat := fLastPosStrCall;
         dm.tblEntries.FieldByName('LastPosFinCall').AsFloat := fLastPosFinCall;

         dm.tblEntries.FieldByName('LastBL1stCall').AsFloat := fLastBL1stCall;
         dm.tblEntries.FieldByName('LastBL2ndCall').AsFloat := fLastBL2ndCall;
         dm.tblEntries.FieldByName('LastBLStrCall').AsFloat := fLastBLStrCall;
         dm.tblEntries.FieldByName('LastBLFinCall').AsFloat := fLastBLFinCall;

         dm.tblEntries.FieldByName('LastGateBreak').AsString := sLastGateBreak;
         dm.tblEntries.FieldByName('LastLen1Back').AsString := sLastLen1Back;
         dm.tblEntries.FieldByName('LastLen2Back').AsString := sLastLen2Back;
         dm.tblEntries.FieldByName('LastStLenBack').AsString := sLastStLenBack;
         dm.tblEntries.FieldByName('LastFinishBeaten').AsString := sLastFinishBeaten;
         dm.tblEntries.FieldByName('LastWeight').AsInteger := iLastWeight;
         dm.tblEntries.FieldByName('LastHorseTime').AsFloat := fLastHorseTime;
         //         dm.tblEntries.FieldByName('LastSRWinner').AsInteger := iLastSRWinner;
         //         dm.tblEntries.FieldByName('LastRaceDesc').AsString := dm.tblRatings.FieldByName('LastRaceDesc').AsString;

         dm.tblEntries.FieldByName('Last2TrkCode').AsString := dm.tblRatings.FieldByName('Last2TrkCode').AsString;
         dm.tblEntries.FieldByName('Last2RaceDate').AsDateTime := dm.tblRatings.FieldByName('Last2RaceDate').AsDateTime;
         dm.tblEntries.FieldByName('Last2PostPos').AsInteger := dm.tblRatings.FieldByName('Last2PostPos').AsInteger;
         dm.tblEntries.FieldByName('Last2RaceNbr').AsInteger := dm.tblRatings.FieldByName('Last2RaceNbr').AsInteger;
         dm.tblEntries.FieldByName('Last2Surf').AsString := dm.tblRatings.FieldByName('Last2Surf').AsString;
         dm.tblEntries.FieldByName('Last2RaceType').AsString := dm.tblRatings.FieldByName('Last2RaceType').AsString;
         dm.tblEntries.FieldByName('Last2RaceConditions').AsString := dm.tblRatings.FieldByName('Last2RaceConditions').AsString;
         dm.tblEntries.FieldByName('Last2DistanceDesc').AsString := dm.tblRatings.FieldByName('Last2DistanceDesc').AsString;
         dm.tblEntries.FieldByName('Last2Distance').AsFloat := dm.tblRatings.FieldByName('Last2Distance').AsFloat;

         dm.tblEntries.FieldByName('Last2Time1stCall').AsFloat := dm.tblRatings.FieldByName('Last2Time1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last2Time2ndCall').AsFloat := dm.tblRatings.FieldByName('Last2Time2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last2TimeStrCall').AsFloat := dm.tblRatings.FieldByName('Last2TimeStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last2TimeFinCall').AsFloat := dm.tblRatings.FieldByName('Last2TimeFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last2Pos1stCall').AsFloat := dm.tblRatings.FieldByName('Last2Pos1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last2Pos2ndCall').AsFloat := dm.tblRatings.FieldByName('Last2Pos2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last2PosStrCall').AsFloat := dm.tblRatings.FieldByName('Last2PosStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last2PosFinCall').AsFloat := dm.tblRatings.FieldByName('Last2PosFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last2BL1stCall').AsFloat := dm.tblRatings.FieldByName('Last2BL1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last2BL2ndCall').AsFloat := dm.tblRatings.FieldByName('Last2BL2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last2BLStrCall').AsFloat := dm.tblRatings.FieldByName('Last2BLStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last2BLFinCall').AsFloat := dm.tblRatings.FieldByName('Last2BLFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last2Odds').AsFloat := dm.tblRatings.FieldByName('Last2Odds').AsFloat;
         dm.tblEntries.FieldByName('Last2FavoriteIndicator').AsString := dm.tblRatings.FieldByName('Last2FavoriteIndicator').AsString;
         dm.tblEntries.FieldByName('Last2DQIndicator').AsString := dm.tblRatings.FieldByName('Last2DQIndicator').AsString;
         dm.tblEntries.FieldByName('Last2Jockey').AsString := dm.tblRatings.FieldByName('Last2Jockey').AsString;

         dm.tblEntries.FieldByName('Last2Comment').AsString := dm.tblRatings.FieldByName('Last2Comment').AsString;
         dm.tblEntries.FieldByName('Last2Comment2').AsString := dm.tblRatings.FieldByName('Last2Comment2').AsString;

         //         dm.tblEntries.FieldByName('Last2TopFinish1').AsString := dm.tblRatings.FieldByName('Last2TopFinish1').AsString;
         //         dm.tblEntries.FieldByName('Last2TopFinish2').AsString := dm.tblRatings.FieldByName('Last2TopFinish2').AsString;
         //         dm.tblEntries.FieldByName('Last2TopFinish3').AsString := dm.tblRatings.FieldByName('Last2TopFinish3').AsString;

         dm.tblEntries.FieldByName('Last2TrkCond').AsString := dm.tblRatings.FieldByName('Last2TrkCond').AsString;
         dm.tblEntries.FieldByName('Last2ClmPrice').AsFloat := dm.tblRatings.FieldByName('Last2ClmPrice').AsFloat;
         dm.tblEntries.FieldByName('Last2Purse').AsFloat := dm.tblRatings.FieldByName('Last2Purse').AsFloat;
         dm.tblEntries.FieldByName('Last2Claimed').AsString := dm.tblRatings.FieldByName('Last2Claimed').AsString;
         dm.tblEntries.FieldByName('Last2Day').AsString := dm.tblRatings.FieldByName('Last2Day').AsString;
         dm.tblEntries.FieldByName('Last2MonthDesc').AsString := dm.tblRatings.FieldByName('Last2MonthDesc').AsString;
         dm.tblEntries.FieldByName('Last2Year').AsString := dm.tblRatings.FieldByName('Last2Year').AsString;


         dm.tblEntries.FieldByName('Last2GateBreak').AsString := dm.tblRatings.FieldByName('Last2GateBreak').AsString;
         dm.tblEntries.FieldByName('Last2Len1Back').AsString := dm.tblRatings.FieldByName('Last2Len1Back').AsString;
         dm.tblEntries.FieldByName('Last2Len2Back').AsString := dm.tblRatings.FieldByName('Last2Len2Back').AsString;
         dm.tblEntries.FieldByName('Last2StLenBack').AsString := dm.tblRatings.FieldByName('Last2StLenBack').AsString;
         dm.tblEntries.FieldByName('Last2FinishBeaten').AsString := dm.tblRatings.FieldByName('Last2FinishBeaten').AsString;
         dm.tblEntries.FieldByName('Last2Weight').AsString := dm.tblRatings.FieldByName('Last2Weight').AsString;
         dm.tblEntries.FieldByName('Last2TrackVariant').AsString := dm.tblRatings.FieldByName('Last2TrackVariant').AsString;
         dm.tblEntries.FieldByName('Last2HorseTime').AsString := dm.tblRatings.FieldByName('Last2HorseTime').AsString;
         //         dm.tblEntries.FieldByName('Last2SRWinner').AsString := dm.tblRatings.FieldByName('Last2SRWinner').AsString;
         //         dm.tblEntries.FieldByName('Last2RaceDesc').AsString := dm.tblRatings.FieldByName('Last2RaceDesc').AsString;


         dm.tblEntries.FieldByName('Last3TrkCode').AsString := dm.tblRatings.FieldByName('Last3TrkCode').AsString;
         dm.tblEntries.FieldByName('Last3RaceDate').AsDateTime := dm.tblRatings.FieldByName('Last3RaceDate').AsDateTime;
         dm.tblEntries.FieldByName('Last3PostPos').AsInteger := dm.tblRatings.FieldByName('Last3PostPos').AsInteger;
         dm.tblEntries.FieldByName('Last3RaceNbr').AsInteger := dm.tblRatings.FieldByName('Last3RaceNbr').AsInteger;
         dm.tblEntries.FieldByName('Last3Surf').AsString := dm.tblRatings.FieldByName('Last3Surf').AsString;
         dm.tblEntries.FieldByName('Last3RaceType').AsString := dm.tblRatings.FieldByName('Last3RaceType').AsString;
         dm.tblEntries.FieldByName('Last3RaceConditions').AsString := dm.tblRatings.FieldByName('Last3RaceConditions').AsString;
         dm.tblEntries.FieldByName('Last3DistanceDesc').AsString := dm.tblRatings.FieldByName('Last3DistanceDesc').AsString;
         dm.tblEntries.FieldByName('Last3Distance').AsFloat := dm.tblRatings.FieldByName('Last3Distance').AsFloat;

         dm.tblEntries.FieldByName('Last3Time1stCall').AsFloat := dm.tblRatings.FieldByName('Last3Time1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last3Time2ndCall').AsFloat := dm.tblRatings.FieldByName('Last3Time2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last3TimeStrCall').AsFloat := dm.tblRatings.FieldByName('Last3TimeStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last3TimeFinCall').AsFloat := dm.tblRatings.FieldByName('Last3TimeFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last3Pos1stCall').AsFloat := dm.tblRatings.FieldByName('Last3Pos1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last3Pos2ndCall').AsFloat := dm.tblRatings.FieldByName('Last3Pos2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last3PosStrCall').AsFloat := dm.tblRatings.FieldByName('Last3PosStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last3PosFinCall').AsFloat := dm.tblRatings.FieldByName('Last3PosFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last3BL1stCall').AsFloat := dm.tblRatings.FieldByName('Last3BL1stCall').AsFloat;
         dm.tblEntries.FieldByName('Last3BL2ndCall').AsFloat := dm.tblRatings.FieldByName('Last3BL2ndCall').AsFloat;
         dm.tblEntries.FieldByName('Last3BLStrCall').AsFloat := dm.tblRatings.FieldByName('Last3BLStrCall').AsFloat;
         dm.tblEntries.FieldByName('Last3BLFinCall').AsFloat := dm.tblRatings.FieldByName('Last3BLFinCall').AsFloat;

         dm.tblEntries.FieldByName('Last3Odds').AsFloat := dm.tblRatings.FieldByName('Last3Odds').AsFloat;
         dm.tblEntries.FieldByName('Last3FavoriteIndicator').AsString := dm.tblRatings.FieldByName('Last3FavoriteIndicator').AsString;
         dm.tblEntries.FieldByName('Last3DQIndicator').AsString := dm.tblRatings.FieldByName('Last3DQIndicator').AsString;
         dm.tblEntries.FieldByName('Last3Jockey').AsString := dm.tblRatings.FieldByName('Last3Jockey').AsString;
         dm.tblEntries.FieldByName('Last3Comment').AsString := dm.tblRatings.FieldByName('Last3Comment').AsString;
         dm.tblEntries.FieldByName('Last3Comment2').AsString := dm.tblRatings.FieldByName('Last3Comment2').AsString;

         //         dm.tblEntries.FieldByName('Last3TopFinish1').AsString := dm.tblRatings.FieldByName('Last3TopFinish1').AsString;
         //         dm.tblEntries.FieldByName('Last3TopFinish2').AsString := dm.tblRatings.FieldByName('Last3TopFinish2').AsString;
         //         dm.tblEntries.FieldByName('Last3TopFinish3').AsString := dm.tblRatings.FieldByName('Last3TopFinish3').AsString;

         dm.tblEntries.FieldByName('Last3TrkCond').AsString := dm.tblRatings.FieldByName('Last3TrkCond').AsString;
         dm.tblEntries.FieldByName('Last3ClmPrice').AsFloat := dm.tblRatings.FieldByName('Last3ClmPrice').AsFloat;
         dm.tblEntries.FieldByName('Last3Purse').AsFloat := dm.tblRatings.FieldByName('Last3Purse').AsFloat;
         dm.tblEntries.FieldByName('Last3Claimed').AsString := dm.tblRatings.FieldByName('Last3Claimed').AsString;
         dm.tblEntries.FieldByName('Last3Day').AsString := dm.tblRatings.FieldByName('Last3Day').AsString;
         dm.tblEntries.FieldByName('Last3MonthDesc').AsString := dm.tblRatings.FieldByName('Last3MonthDesc').AsString;
         dm.tblEntries.FieldByName('Last3Year').AsString := dm.tblRatings.FieldByName('Last3Year').AsString;

         dm.tblEntries.FieldByName('Last3GateBreak').AsString := dm.tblRatings.FieldByName('Last3GateBreak').AsString;
         dm.tblEntries.FieldByName('Last3Len1Back').AsString := dm.tblRatings.FieldByName('Last3Len1Back').AsString;
         dm.tblEntries.FieldByName('Last3Len2Back').AsString := dm.tblRatings.FieldByName('Last3Len2Back').AsString;
         dm.tblEntries.FieldByName('Last3StLenBack').AsString := dm.tblRatings.FieldByName('Last3StLenBack').AsString;
         dm.tblEntries.FieldByName('Last3FinishBeaten').AsString := dm.tblRatings.FieldByName('Last3FinishBeaten').AsString;
         dm.tblEntries.FieldByName('Last3Weight').AsString := dm.tblRatings.FieldByName('Last3Weight').AsString;
         dm.tblEntries.FieldByName('Last3TrackVariant').AsString := dm.tblRatings.FieldByName('Last3TrackVariant').AsString;
         dm.tblEntries.FieldByName('Last3HorseTime').AsString := dm.tblRatings.FieldByName('Last3HorseTime').AsString;

         //         dm.tblEntries.FieldByName('Last3SRWinner').AsString := dm.tblRatings.FieldByName('Last3SRWinner').AsString;
         //         dm.tblEntries.FieldByName('Last3RaceDesc').AsString := dm.tblRatings.FieldByName('Last3RaceDesc').AsString;

         sSurface := Trim(sSurface);

         if sLastSurf = 'T' then begin
            if sSurface = 'D' then begin
               dm.tblEntries.FieldByName('IsTurfToDirt').AsBoolean := True;
            end;
         end;
         if sLastSurf = 'D' then begin
            if sSurface = 'T' then begin
               dm.tblEntries.FieldByName('IsDirtToTurf').AsBoolean := True;
            end;
         end;

         if (fLastDistance > 0) then begin // Sprint Race
            if (fLastDistance < MILE_FURLONGS) then begin // Sprint Race
               if (bRouteRace) then begin // Today A Route
                  dm.tblEntries.FieldByName('IsSprToRte').AsBoolean := True;
               end;
            end;
         end;

         if (fLastDistance > 0) then begin // Sprint Race
            if (fLastDistance >= MILE_FURLONGS) then begin // Route Race
               if not (bRouteRace) then begin // Sprint Race
                  dm.tblEntries.FieldByName('IsRteToSpr').AsBoolean := True;
               end;
            end;
         end;


         dm.tblEntries.FieldByName('ClassRating').AsFloat := fClassRating;
         dm.tblEntries.FieldByName('TurfRating').AsFloat := fTurfRating;
         dm.tblEntries.FieldByName('MudRating').AsFloat := fMudRating;

         sLastTrkCode := CopyStr(dm.tblEntries.FieldByName('LastTrkCode').AsString, 1, 3);
         dtLastRaceDate := dm.tblEntries.FieldByName('LastRaceDate').AsDateTime;
         iLastRaceNbr := dm.tblEntries.FieldByName('LastRaceNbr').AsInteger;
         iLastPostPos := dm.tblEntries.FieldByName('LastPostPos').AsInteger;

         sLastSurf := CopyStr(dm.tblEntries.FieldByName('LastSurf').AsString, 1, 1);
         sLastTrkCond := CopyStr(dm.tblEntries.FieldByName('LastTrkCond').AsString, 1, 2);
         sLastRaceType := CopyStr(dm.tblEntries.FieldByName('LastRaceType').AsString, 1, 3);

         sLastPurse := FormatFloat('#######', dm.tblEntries.FieldByName('LastPurse').AsFloat);
         sLastClmPrice := FormatFloat('#######', dm.tblEntries.FieldByName('LastClmPrice').AsFloat);

         sLastRaceConditions := CopyStr(dm.tblEntries.FieldByName('LastRaceConditions').AsString, 1, 10);
         sLastDistanceDesc := CopyStr(dm.tblEntries.FieldByName('LastDistanceDesc').AsString, 1, 10);
         sLastOdds := FormatFloat('##0.00', dm.tblEntries.FieldByName('LastOdds').AsFloat);
         sLastBl := FormatFloat('#0.00', dm.tblEntries.FieldByName('LastBLFinCall').AsFloat);
         sLastDQIndicator := CopyStr(dm.tblEntries.FieldByName('LastDQIndicator').AsString, 1, 2);
         sLastFavoriteIndicator := CopyStr(dm.tblEntries.FieldByName('LastFavoriteIndicator').AsString, 1, 1);
         sLastFinishPos := FormatFloat('##', dm.tblEntries.FieldByName('LastPosFinCall').AsFloat);
         sLastClaimed := dm.tblEntries.FieldByName('LastClaimed').AsString;

         sLastDay := dm.tblEntries.FieldByName('LastDay').AsString;
         sLastMonthDesc := dm.tblEntries.FieldByName('LastMonthDesc').AsString;
         sLastYear := dm.tblEntries.FieldByName('LastYear').AsString;

         fLastTime1stCall := dm.tblEntries.FieldByName('LastTime1stCall').AsFloat;
         fLastTime2ndCall := dm.tblEntries.FieldByName('LastTime2ndCall').AsFloat;
         fLastTimeStrCall := dm.tblEntries.FieldByName('LastTimeStrCall').AsFloat;
         fLastTimeFinCall := dm.tblEntries.FieldByName('LastTimeFinCall').AsFloat;

         sLastGateBreak := dm.tblEntries.FieldByName('LastGateBreak').AsString;
         sLastLen1Back := dm.tblEntries.FieldByName('LastLen1Back').AsString;
         sLastLen2Back := dm.tblEntries.FieldByName('LastLen2Back').AsString;
         sLastStLenBack := dm.tblEntries.FieldByName('LastStLenBack').AsString;
         sLastFinishBeaten := dm.tblEntries.FieldByName('LastFinishBeaten').AsString;

         iLastWeight := dm.tblEntries.FieldByName('LastWeight').AsInteger;
         iLastTrackVariant := dm.tblEntries.FieldByName('LastTrackVariant').AsInteger;
         iLastClass := dm.tblEntries.FieldByName('LastClass').AsInteger;
         fLastHorseTime := dm.tblEntries.FieldByName('LastHorseTime').AsFloat;
         fLastWinTime := dm.tblEntries.FieldByName('LastTimeFinCall').AsFloat;

         if Length(sLastBL) = 1 then begin
            sLastBL := ' ' + sLastBL;
         end;
         if Length(sLastBL) = 2 then begin
            sLastBL := ' ' + sLastBL;
         end;
         if Length(sLastBL) = 3 then begin
            sLastBL := ' ' + sLastBL;
         end;
         if Length(sLastBL) = 4 then begin
            sLastBL := ' ' + sLastBL;
         end;

         if Length(sLastOdds) = 1 then begin
            sLastOdds := ' ' + sLastOdds;
         end;
         if Length(sLastOdds) = 2 then begin
            sLastOdds := ' ' + sLastOdds;
         end;
         if Length(sLastOdds) = 3 then begin
            sLastOdds := ' ' + sLastOdds;
         end;
         if Length(sLastOdds) = 4 then begin
            sLastOdds := ' ' + sLastOdds;
         end;
         if Length(sLastOdds) = 5 then begin
            sLastOdds := ' ' + sLastOdds;
         end;

         dm.tblEntries.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
         dm.tblEntries.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
         dm.tblEntries.FieldByName('IsPTCTrack').AsBoolean := bPTCTrack;
         dm.tblEntries.FieldByName('IsTwinSpiresTrack').AsBoolean := bTwinSpiresTrack;

         if dm.tblEntries.FieldByName('LastClaimed').AsString = 'C' then begin
            if dm.tblRaces.FieldByName('ClaimingPrice').AsFloat > dm.tblEntries.FieldByName('LastClmPrice').AsFloat then begin
               dm.tblEntries.FieldByName('IsClaimedAndUp').AsBoolean := True;
            end;

            if (dm.tblRaces.FieldByName('RaceType').AsString <> 'MCL') and
               (dm.tblRaces.FieldByName('RaceType').AsString <> 'CLM') and
               (dm.tblRaces.FieldByName('RaceType').AsString <> 'OCL') then begin
               dm.tblEntries.FieldByName('IsClaimedAndUp').AsBoolean := True;
            end;
         end;

         if dm.tblEntries.FieldByName('LastClaimed').AsString = 'C' then begin
            if dm.tblRaces.FieldByName('ClaimingPrice').AsFloat < dm.tblEntries.FieldByName('LastClmPrice').AsFloat then begin
               dm.tblEntries.FieldByName('IsClaimedAndDown').AsBoolean := True;
            end;
         end;

         if (dm.tblEntries.FieldByName('DaysLast').AsInteger >= 46) then begin
            if (dm.tblEntries.FieldByName('LastClmPrice').AsFloat > 0) then begin
               if dm.tblRaces.FieldByName('ClaimingPrice').AsFloat > dm.tblEntries.FieldByName('LastClmPrice').AsFloat then begin
                  dm.tblEntries.FieldByName('IsLayoffAndUp').AsBoolean := True;
               end;
               if (dm.tblRaces.FieldByName('RaceType').AsString <> 'MCL') and
                  (dm.tblRaces.FieldByName('RaceType').AsString <> 'CLM') and
                  (dm.tblRaces.FieldByName('RaceType').AsString <> 'OCL') then begin
                  dm.tblEntries.FieldByName('IsLayoffAndUp').AsBoolean := True;
               end;
            end;
         end;

         dm.tblEntries.Post();
         dm.tblEntries.FlushBuffers();

         dm.tblRaces.Edit();
         dm.tblRaces.FieldByName('EstTimeOfRace').Value := dtLocalTimeOfRace;

         dtEstTimeOfRace := AddHrs(dtLocalTimeOfRace, fTimeDiff);
         dm.tblRaces.FieldByName('EstTimeOfRace').Value := dtEstTimeOfRace;

         DecodeTime(dm.tblRaces.FieldByName('EstTimeOfRace').AsDateTime, wHour, wMin, wSec, wMSec);
         if ((wHour >= 0) and (wHour <= 9)) then begin
            wHour := wHour + 24;
            sAMPM := sm.Str(wHour, 2) + ':';
         end else begin
            sAMPM := sm.Str(wHour, 2) + ':';
         end;

         if (wHour > 12) then begin
            dm.tblRaces.FieldByName('CT').AsString := sAMPM + sm.Str(wHour - 12, 2) + ':' + sm.Str(wMin, 2);
         end else begin
            dm.tblRaces.FieldByName('CT').AsString := sAMPM + sm.Str(wHour, 2) + ':' + sm.Str(wMin, 2);
         end;

         if dm.tblRaces.FieldByName('RaceNbr').AsInteger = 1 then begin
            dtEstTimeOfFirstRace := dtEstTimeOfRace;
         end;

         //Adjust for screwed up tdn/beu combined files
         if dtEstTimeOfFirstRace > dtEstTimeOfRace then begin
            dm.tblRaces.FieldByName('EstTimeOfFirstRace').Value := dtEstTimeOfRace;
         end else begin
            dm.tblRaces.FieldByName('EstTimeOfFirstRace').Value := dtEstTimeOfFirstRace;
         end;

         if dm.tblRaces.FieldByName('Surface').AsString = 'T' then begin
            sSurface := 'TURF';
         end else begin
            sSurface := 'DIRT';
         end;

         if dm.tblRaces.FieldByName('ClaimingPrice').AsFloat > 0 then begin
            dm.tblRaces.FieldByName('RaceDesc').AsString :=
               'RACE # ' +
               dm.tblRaces.FieldByName('RaceNbr').AsString + '  ' +
               dm.tblRaces.FieldByName('DistanceDesc').AsString + '  ' +
               sSurface + '  ' +
               dm.tblRaces.FieldByName('RaceTypeDesc').AsString + '  ' +
               'CLM: ' +
               dm.tblRaces.FieldByName('ClaimingPrice').AsString + '  ' +
               'PURSE: ' +
               dm.tblRaces.FieldByName('Purse').AsString + '  ' +
               'POST: ' +
               dm.tblRaces.FieldByName('EstTimeOfRace').AsString + '  ' +
               dm.tblRaces.FieldByName('RaceDate').AsString + '  ' +
               'CLASS OF RACE: ' +
               dm.tblEntries.FieldByName('TodaysClass').AsString + '  ' +
               'PAR TIME: ' +
               dm.tblRaces.FieldByName('ParTime').AsString;

         end else begin
            dm.tblRaces.FieldByName('RaceDesc').AsString :=
               'RACE # ' +
               dm.tblRaces.FieldByName('RaceNbr').AsString + '  ' +
               dm.tblRaces.FieldByName('DistanceDesc').AsString + '  ' +
               sSurface + '  ' +
               dm.tblRaces.FieldByName('RaceTypeDesc').AsString + '  ' +
               'PURSE: ' +
               dm.tblRaces.FieldByName('Purse').AsString + '  ' +
               'POST: ' +
               dm.tblRaces.FieldByName('EstTimeOfRace').AsString + '  ' +
               dm.tblRaces.FieldByName('RaceDate').AsString + '  ' +
               'CLASS OF RACE: ' +
               dm.tblEntries.FieldByName('TodaysClass').AsString + '  ' +
               'PAR TIME: ' +
               dm.tblRaces.FieldByName('ParTime').AsString;
         end;

         dm.tblRaces.FieldByName('IsPrintedOnValueSheet').AsBoolean := bPrintedOnValueSheet;
         dm.tblRaces.FieldByName('IsYouBetTrack').AsBoolean := bYouBetTrack;
         dm.tblRaces.FieldByName('IsPTCTrack').AsBoolean := bPTCTrack;
         dm.tblRaces.FieldByName('IsTwinSpiresTrack').AsBoolean := bTwinSpiresTrack;

         dm.tblRaces.Post();

         dm.tblEntries.Next();
      end;
   except
      ClearPrgStatusBars();
   end;
   ClearPrgStatusBars();

end;

end.

