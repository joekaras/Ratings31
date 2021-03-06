unit UnitGetHandicappingKeys;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

function GetTrainerPowerPsrRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetSpeedRankTrkCodeSurfaceDistanceSpeedCount(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetSpeedRankTrkCodeSpeedCount(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetPostPosKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetFinalOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetElimKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetElim2Key(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetMorningLineKeyTrkCodePowerPsr(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetMorningLineKeyPowerPsr(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
function GetMorningLineKeyTrkCodeRaceType(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetDefaultOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPrimaryOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetSecondaryOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetRunStyleKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetPowerAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPowerAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPowerAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetCombinedPaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetCombinedPaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetEarlyPaceAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetEarlyPaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetEarlyPaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetMiddlePaceAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetMiddlePaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetMiddlePaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetPsrAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPsrAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPsrAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetOnlyMorningLineKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetLinerMorningLineKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetMorningLineKeyFinalWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetMorningLineKeyDefaultWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTodaysWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetQSPRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetQSPRank2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetKSPRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetKSPRank2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

//function GetOS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetOS2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetXS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetXS2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetXS3(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetXS4(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetLP2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetPS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetPSPlus(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function Get2yoBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetX2yoBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetTurfBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetXTurfBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function Get1stBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetX1stBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTodaysKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTrainerAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTrainerOwnerAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTrainerJockeyAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTrainerOwnerKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetTrainerJockeyKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetSpdKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetSpdClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetTrnTrackKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetJkyTrackKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//
//function GetLinerKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//function GetLinerCntKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

function GetMorningLineKeyTrkCodePowerPsr(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin

      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
      sBaseKey := FastReplace(sBaseKey, '+', '', True);
      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
      sBaseKey := Format('%-3s', [tblR.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
         (tblE.FieldByName('PowerRank').AsInteger <= 8)) then begin
         sBaseKey := sBaseKey + '-PL-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
         if ((tblE.FieldByName('PsrRank').AsInteger > 0) and
            (tblE.FieldByName('PsrRank').AsInteger <= 4)) then begin
            sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);
         end else begin
            sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         end
      end else begin
         sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);

      end;


   end;

   Result := sBaseKey;
end;

function GetMorningLineKeyPowerPsr(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin

      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
      sBaseKey := FastReplace(sBaseKey, '+', '', True);
      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
         (tblE.FieldByName('PowerRank').AsInteger <= 8)) then begin
         sBaseKey := sBaseKey + '-PL-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
         if ((tblE.FieldByName('PsrRank').AsInteger > 0) and
            (tblE.FieldByName('PsrRank').AsInteger <= 4)) then begin
            sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);
         end else begin
            sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         end
      end else begin
         sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);
      end;
   end;

   Result := sBaseKey;
end;

function GetMorningLineKeyTrkCodeRaceType(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;

begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
      sBaseKey := FastReplace(sBaseKey, '+', '', True);
      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
      sBaseKey := Format('%-3s', [tblR.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
      sBaseKey := Format('%-5s', [tblR.FieldByName('RaceType').AsString]) + '/' + sBaseKey;
   end;

   Result := sBaseKey;
end;



function GetTrainerPowerPsrRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin

      sBaseKey := '';
      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
         (tblE.FieldByName('PowerRank').AsInteger < 4)) then begin
         sBaseKey := sBaseKey + tblE.FieldByName('Trainer').AsString;
         sBaseKey := sBaseKey + '-PL-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
         if ((tblE.FieldByName('PsrRank').AsInteger > 0) and
            (tblE.FieldByName('PsrRank').AsInteger <= 4)) then begin
            sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);
         end else begin
            sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         end;
      end else begin
         sBaseKey := sBaseKey + tblE.FieldByName('Trainer').AsString;
         sBaseKey := sBaseKey + '-PL-' + sm.str(99, 2);
         if ((tblE.FieldByName('PsrRank').AsInteger > 0) and
            (tblE.FieldByName('PsrRank').AsInteger <= 4)) then begin
            sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('PsrRank').AsInteger, 2);
         end else begin
            sBaseKey := sBaseKey + '/' + sm.str(99, 2);
         end;
      end;

      Result := sBaseKey;

   end;
end;

function GetSpeedRankTrkCodeSurfaceDistanceSpeedCount(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   iNbrEarlyCnt: integer;
   iNbrMiddleCnt: integer;
   iNbrLateCnt: integer;
   sBaseKey: string;
   bOwner: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;

   iDaysLast: integer;
   //sWorkLine: string;
begin

   iNbrEarlyCnt := 0;
   iNbrMiddleCnt := 0;
   iNbrLateCnt := 0;


   if (sDebutIndicator = '*') then begin
      Result := '';
      exit;
   end;

   //
   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('KSP1stCall').AsFloat > 0) and
      (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   //
   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;

      if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;

      if (tblE.FieldByName('KSP2ndCall').AsFloat > 0) and
         (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;
   end;
   //
   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   sBaseKey := '';
   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
   sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
   sBaseKey := sBaseKey + sm.Str(tblR.FieldByName('DistanceInYards').AsInteger, 4) + '/';
   sBaseKey := sBaseKey + 'E' + sm.Str(iNbrEarlyCnt, 1);
   sBaseKey := sBaseKey + 'M' + sm.Str(iNbrMiddleCnt, 1);
   sBaseKey := sBaseKey + 'L' + sm.Str(iNbrLateCnt, 1);

   Result := sBaseKey;


end;

function GetSpeedRankTrkCodeSpeedCount(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   iNbrEarlyCnt: integer;
   iNbrMiddleCnt: integer;
   iNbrLateCnt: integer;
   sBaseKey: string;
   bOwner: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;

   iDaysLast: integer;
   //sWorkLine: string;
begin

   iNbrEarlyCnt := 0;
   iNbrMiddleCnt := 0;
   iNbrLateCnt := 0;


   if (sDebutIndicator = '*') then begin
      Result := '';
      exit;
   end;



   //
   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('KSP1stCall').AsFloat > 0) and
      (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;


   //
   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;

      if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;

      if (tblE.FieldByName('KSP2ndCall').AsFloat > 0) and
         (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;
   end;

   //
   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   sBaseKey := '';
   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
   sBaseKey := sBaseKey + 'E' + sm.Str(iNbrEarlyCnt, 1);
   sBaseKey := sBaseKey + 'M' + sm.Str(iNbrMiddleCnt, 1);
   sBaseKey := sBaseKey + 'L' + sm.Str(iNbrLateCnt, 1);

   Result := sBaseKey;


end;



function GetPostPosKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;
begin

   sBaseKey := '';

   tblR.IndexName := '';
   tblR.SetKey();
   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;

   if tblR.GotoKey() then begin
      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
      sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
      sBaseKey := sBaseKey + Format('%2.2f', [tblR.FieldByName('DistanceInFurlongs').AsFloat]) + '/';

      if (tblE.FieldByName('PostPos').AsInteger = 1) then begin
         sBaseKey := sBaseKey + 'RAIL';
      end;

      if (tblE.FieldByName('PostPos').AsInteger >= 2) and (tblE.FieldByName('PostPos').AsInteger <= 4) then begin
         sBaseKey := sBaseKey + '2-4';
      end;
      if (tblE.FieldByName('PostPos').AsInteger >= 5) and (tblE.FieldByName('PostPos').AsInteger <= 8) then begin
         sBaseKey := sBaseKey + '5-8';
      end;
      if (tblE.FieldByName('PostPos').AsInteger >= 9) and (tblE.FieldByName('PostPos').AsInteger <= 50) then begin
         sBaseKey := sBaseKey + '9+';
      end;
   end;

   Result := sBaseKey;

end;


function GetFinalOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   iNbrEarlyCnt: integer;
   iNbrMiddleCnt: integer;
   iNbrLateCnt: integer;
   sBaseKey: string;
   bOwner: boolean;
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

   bQSP: boolean;
   bKSP: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;

   iDaysLast: integer;
   //sWorkLine: string;
begin

   iNbrEarlyCnt := 0;
   iNbrMiddleCnt := 0;
   iNbrLateCnt := 0;

   if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
      (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
      if (tblR.FieldByName('NbrDebutStarters').AsInteger > 0) then begin
         Result := '';
         exit;
      end;
   end;

   if (sDebutIndicator = '*') then begin
      Result := '';
      exit;
   end;

   if (sDebutIndicator = '**') then begin
      Result := '';
      exit;
   end;

   iDaysLast := tblE.FieldByName('DaysLast').AsInteger;
   if (iDaysLast > 90) then begin
      Result := '';
      exit;
   end;


   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
         Inc(iNbrEarlyCnt);
      end;
   end;

   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
      Inc(iNbrMiddleCnt);
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;
   end;

   if (tblE.FieldByName('KSP1stCall').AsFloat > 0) and
      (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
      Inc(iNbrEarlyCnt);
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('KSP2ndCall').AsFloat > 0) and
         (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
         Inc(iNbrMiddleCnt);
      end;
   end;

   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      Inc(iNbrLateCnt);
   end;

   sBaseKey := '';
   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
   sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
   sBaseKey := sBaseKey + sm.Str(tblR.FieldByName('DistanceInYards').AsInteger, 4) + '/';
   sBaseKey := sBaseKey + 'E' + sm.Str(iNbrEarlyCnt, 2);
   sBaseKey := sBaseKey + 'M' + sm.Str(iNbrMiddleCnt, 2);
   sBaseKey := sBaseKey + 'L' + sm.Str(iNbrLateCnt, 2);

   Result := sBaseKey;


end;


function GetTodaysKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   iNbrEarlyCnt: integer;
   iNbrMiddleCnt: integer;
   iNbrLateCnt: integer;
   sBaseKey: string;
   bOwner: boolean;
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

   bQSP: boolean;
   bKSP: boolean;

   sTurfIndicator: string;
   sDebutIndicator: string;

   iDaysLast: integer;
   //sWorkLine: string;
begin

   //   iNbrEarlyCnt := 0;
   //   iNbrMiddleCnt := 0;
   //   iNbrLateCnt := 0;
   //   // if a maiden race
   //// if number of debut starters > 0
   //// exit
   // //  if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
   ////      (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
   ////      if (tblR.FieldByName('NbrDebutStarters').AsInteger > 0) then begin
   ////         Result := '';
   ////         exit;
   ////      end;
   ////   end;
   //
   //   // if turf race
   //  // if number of turf debut starters > 0
   //  // exit
   //  // if ((tblR.FieldByName('Surface').AsString = 'T')) then begin
   ////      if (tblR.FieldByName('NbrTurfDebutStarters').AsInteger > 0) then begin
   ////         Result := '';
   ////         exit;
   ////      end;
   ////   end;
   //
   //
   //   // if off layoff > 90 rexit
   //   // if 1st/2nd start exit and dirt race
   //   // if 1st/2nd turf exit and turf race
   //   // ratings are by if had work in between last race or no
   //  // sTurfIndicator := tblE.FieldByName('TurfIndicator').AsString;
   ////   sDebutIndicator := tblE.FieldByName('DebutIndicator').AsString;
   ////
   ////   if (sDebutIndicator = '*') then begin
   ////      Result := '';
   ////      exit;
   ////   end;
   ////
   ////   if (sDebutIndicator = '**') then begin
   ////      Result := '';
   ////      exit;
   ////   end;
   ////
   ////   if (sTurfIndicator = '*') then begin
   ////      Result := '';
   ////      exit;
   ////   end;
   ////
   ////   iDaysLast := tblE.FieldByName('DaysLast').AsInteger;
   ////   if (iDaysLast > 90) then begin
   ////      Result := '';
   ////      exit;
   ////   end;
   //
   //   //
   //   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
   //      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
   //      Inc(iNbrEarlyCnt);
   //   end;
   //   if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
   //      (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
   //      Inc(iNbrEarlyCnt);
   //   end;
   //
   //   //
   //   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
   //      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
   //      Inc(iNbrMiddleCnt);
   //   end;
   //   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
   //      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
   //      Inc(iNbrMiddleCnt);
   //   end;
   //
   //   //
   //   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
   //      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
   //      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
   //         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
   //         if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
   //            (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
   //            if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
   //               (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
   //               Inc(iNbrMiddleCnt);
   //            end;
   //         end;
   //      end;
   //   end;
   //
   //   //
   //   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
   //      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
   //      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
   //         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
   //         if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
   //            (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
   //            if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
   //               (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
   //               if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
   //                  if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
   //                     Inc(iNbrMiddleCnt);
   //                  end;
   //               end;
   //            end;
   //         end;
   //      end;
   //   end;
   //
   //   //
   //   if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
   //      Inc(iNbrEarlyCnt);
   //   end;
   //
   //   if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
   //      Inc(iNbrMiddleCnt);
   //   end;
   //
   //   bKSP := false;
   //   if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
   //      if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
   //         bKSP := true;
   //      end;
   //   end;
   //
   //   bQSP := false;
   //   if (tblE.FieldByName('QSP1stCallRank').AsInteger = 1) then begin
   //      if (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1) then begin
   //         bQSP := true;
   //      end;
   //   end;
   //
   //   if (tblE.FieldByName('Psr').AsFloat < 9999) and
   //      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
   //      Inc(iNbrLateCnt);
   //   end;
   //   if (tblE.FieldByName('PsrPos').AsFloat < 9999) and
   //      (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
   //      Inc(iNbrLateCnt);
   //   end;
   //
   //   sBaseKey := '';
   //
   //   tblR.IndexName := '';
   //   tblR.SetKey();
   //   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
   //   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
   //   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
   //
   //   if tblR.GotoKey() then begin
   //
   //      bFrontDoubleLiner0 := tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean;
   //      bFrontDoubleLiner1 := tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean;
   //      bFrontDoubleLiner2 := tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean;
   //      bFrontDoubleLiner3 := tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean;
   //
   //      bBackDoubleLiner0 := tblE.FieldByName('IsBackDoubleLiner0').AsBoolean;
   //      bBackDoubleLiner1 := tblE.FieldByName('IsBackDoubleLiner1').AsBoolean;
   //      bBackDoubleLiner2 := tblE.FieldByName('IsBackDoubleLiner2').AsBoolean;
   //      bBackDoubleLiner3 := tblE.FieldByName('IsBackDoubleLiner3').AsBoolean;
   //
   //      bTripleLiner0 := tblE.FieldByName('IsTripleLiner0').AsBoolean;
   //      bTripleLiner1 := tblE.FieldByName('IsTripleLiner1').AsBoolean;
   //      bTripleLiner2 := tblE.FieldByName('IsTripleLiner2').AsBoolean;
   //      bTripleLiner3 := tblE.FieldByName('IsTripleLiner3').AsBoolean;
   //
   //      if (bTripleLiner0 or bFrontDoubleLiner0 or bBackDoubleLiner0 or
   //         bTripleLiner1 or bFrontDoubleLiner1 or bBackDoubleLiner1 or
   //         bTripleLiner2 or bFrontDoubleLiner2 or bBackDoubleLiner2 or
   //         bTripleLiner3 or bFrontDoubleLiner3 or bBackDoubleLiner3) then begin
   //
   //         //sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
   //         //sBaseKey := FastReplace(sBaseKey, 'B', '', True);
   //         //sBaseKey := FastReplace(sBaseKey, '+', '', True);
   //         //sBaseKey := FastReplace(sBaseKey, 'L', '', True);
   //
   //         //sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
   //         //sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]);
   //         //sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
   //
   //         sBaseKey := Format('%-3s / ', [tblR.FieldByName('TrkCode').AsString]);
   //         sBaseKey := sBaseKey + Format('%-1s', [tblR.FieldByName('Surface').AsString]);
   //
   //
   //         //
   //         if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
   //            (tblE.FieldByName('Power').AsFloat > 0) and
   //            (tblE.FieldByName('PowerRank').AsInteger <= ORDER_KEY_MAX)) then begin
   //            sBaseKey := sBaseKey + '/ PW-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
   //         end else begin
   //            sBaseKey := sBaseKey + '/ PW-' + sm.str(99, 2);
   //         end;
   //
   //
   //         if (bFrontDoubleLiner0) then begin
   //            sBaseKey := sBaseKey + '/' + 'FDL0';
   //         end;
   //
   //         if (bFrontDoubleLiner1) then begin
   //            sBaseKey := sBaseKey + '/' + 'FDL1';
   //         end;
   //
   //         if (bFrontDoubleLiner2) then begin
   //            sBaseKey := sBaseKey + '/' + 'FDL2';
   //         end;
   //
   //         if (bFrontDoubleLiner3) then begin
   //            sBaseKey := sBaseKey + '/' + 'FDL3';
   //         end;
   //
   //         //
   //         if (bBackDoubleLiner0) then begin
   //            sBaseKey := sBaseKey + '/' + 'BDL0';
   //         end;
   //
   //         if (bBackDoubleLiner1) then begin
   //            sBaseKey := sBaseKey + '/' + 'BDL1';
   //         end;
   //
   //         if (bBackDoubleLiner2) then begin
   //            sBaseKey := sBaseKey + '/' + 'BDL2';
   //         end;
   //
   //         if (bBackDoubleLiner3) then begin
   //            sBaseKey := sBaseKey + '/' + 'BDL3';
   //         end;
   //
   //         if (bTripleLiner0) then begin
   //            sBaseKey := sBaseKey + '/' + 'TL0';
   //         end;
   //
   //         if (bTripleLiner1) then begin
   //            sBaseKey := sBaseKey + '/' + 'TL1';
   //         end;
   //
   //         if (bTripleLiner2) then begin
   //            sBaseKey := sBaseKey + '/' + 'TL2';
   //         end;
   //
   //         if (bTripleLiner3) then begin
   //            sBaseKey := sBaseKey + '/' + 'TL3';
   //         end;
   //
   //         if (bKSP) then begin
   //            sBaseKey := sBaseKey + '/' + 'KSP';
   //         end;
   //
   //         if (bQSP) then begin
   //            sBaseKey := sBaseKey + '/' + 'QSP';
   //         end;
   //
   //
   //
   //      end else begin
   //         //sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
   //         //sBaseKey := FastReplace(sBaseKey, 'B', '', True);
   //         //sBaseKey := FastReplace(sBaseKey, '+', '', True);
   //         //sBaseKey := FastReplace(sBaseKey, 'L', '', True);
   //
   //         //sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
   //         //sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]);
   //         //sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
   //
   //         sBaseKey := Format('%-3s / ', [tblR.FieldByName('TrkCode').AsString]);
   //         sBaseKey := sBaseKey + Format('%-1s', [tblR.FieldByName('Surface').AsString]);
   //         //
   //         if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
   //            (tblE.FieldByName('Power').AsFloat > 0) and
   //            (tblE.FieldByName('PowerRank').AsInteger <= ORDER_KEY_MAX)) then begin
   //            sBaseKey := sBaseKey + '/ PW-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
   //         end else begin
   //            sBaseKey := sBaseKey + '/ PW-' + sm.str(99, 2);
   //         end;
   //
   //      end;
   //
   //      Result := sBaseKey;
   //   end;

      //sBaseKey := '';

      //   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';


   //sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
   //sBaseKey := sBaseKey + sm.Str(tblR.FieldByName('DistanceInYards').AsInteger, 4) + '/';
   //sBaseKey := sBaseKey + 'E' + sm.Str(iNbrEarlyCnt, 2);
   //sBaseKey := sBaseKey + 'M' + sm.Str(iNbrMiddleCnt, 2);
   // sBaseKey := sBaseKey + 'L' + sm.Str(iNbrLateCnt, 2);

      //Result := sBaseKey;
   sBaseKey := '';
   tblR.IndexName := '';
   //  tblR.SetKey();
  //   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
  //   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
  //   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
  //
  //   if tblR.GotoKey() then begin

   sBaseKey := Format('%-3s', [tblR.FieldByName('TrkCode').AsString]);
   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;

   //      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
   //         (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
   //         sBaseKey := sBaseKey + '/P-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
   //      end else begin
   //         sBaseKey := sBaseKey + '/P-' + sm.str(99, 2);
   //      end;
   //      sBaseKey := sBaseKey + '/' + sm.str(tblE.FieldByName('MorningLineWinPct').AsInteger, 2);


// end;
   Result := sBaseKey;

end;

//
//
//function GetAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//
//   if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + 'P-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + 'P-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-LS-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-LS-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('LastClassRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-LC-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-LC-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-BS-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-BS-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-BC-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-BC-' + sm.Str(0, 1);
//   end;
//
//   Result := sBaseKey;
//
//end;
//

function GetElimKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   iNbrPaceCnt: integer;
   sBaseKey: string;

   bBadTrainerJockey: boolean;
   bBadTrainerOwner: boolean;
   bBadTrainer: boolean;
   bBadOwner: boolean;

   bBadSpeed: boolean;
   bBadPower: boolean;
   bBadClass: boolean;
   bNoEarlyDot: boolean;
   bNoMiddleDot: boolean;
   bNoLateDot: boolean;

   bNoEarlyLiner: boolean;
   bNoMiddleLiner: boolean;
   bNoLateLiner: boolean;

   bNoQSP: boolean;
   bNoKSP: boolean;

   bNoQSP2: boolean;
   bNoKSP2: boolean;
begin

   iNbrPaceCnt := 0;


   bNoEarlyDot := True;
   bNoMiddleDot := True;
   bNoLateDot := True;

   bNoEarlyLiner := True;
   bNoMiddleLiner := True;
   bNoLateLiner := True;

   bNoQSP := True;
   bNoQSP2 := True;

   bNoKSP := True;
   bNoKSP2 := True;

   if (tblR.FieldByName('RaceType').AsString = 'MSW') or (tblR.FieldByName('RaceType').AsString = 'MCL') then begin
      if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
         sBaseKey := sBaseKey + 'SOME';
         Result := sBaseKey;
         exit;
      end;

      if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
         sBaseKey := sBaseKey + 'SOME';
         Result := sBaseKey;
         exit;
      end;
   end;

   if (tblR.FieldByName('Surface').AsString = 'T') then begin
      if (tblE.FieldByName('TurfIndicator').AsString = '*') then begin
         sBaseKey := sBaseKey + 'SOME';
         Result := sBaseKey;
         exit;
      end;

      if (tblE.FieldByName('TurfIndicator').AsString = '**') then begin
         sBaseKey := sBaseKey + 'SOME';
         Result := sBaseKey;
         exit;
      end;
   end;


   //
   bBadPower := False;
   if (tblE.FieldByName('Power').AsFloat > 0.00) then begin
      if (tblE.FieldByName('PowerAdvantageKey').AsInteger < -4) then begin
         bBadPower := True;
      end;
   end;

   bBadSpeed := False;
   if ((tblE.FieldByName('LastSpeedRank').AsInteger > 3) and
      (tblE.FieldByName('BackSpeedRank').AsInteger > 3) and
      (tblE.FieldByName('BackSpeed').AsInteger > 0) and
      (tblE.FieldByName('LastSpeed').AsInteger > 0)) then begin
      bBadSpeed := True;
   end;

   //
   bBadTrainer := True;
   if (tblE.FieldByName('TotalTrnOddsWinPct').AsInteger > 4) then begin
      bBadTrainer := False;
   end;

   //
   bBadOwner := True;
   if (tblE.FieldByName('TotalOwnWinPct').AsInteger > 4) then begin
      bBadTrainer := False;
   end;

   //
   bBadTrainerOwner := True;
   if (tblE.FieldByName('TotalTrnOwnWinPct').AsInteger > 4) then begin
      bBadOwner := False;
   end;

   bBadTrainerJockey := True;
   if (tblE.FieldByName('TotalTrnJkyWinPct').AsInteger > 4) then begin
      bBadTrainerJockey := False;
   end;



   //
   sBaseKey := '';
   if (
      (bBadPower) and
      (bBadOwner) and
      (bBadTrainer) and
      (bBadTrainerOwner) and
      (bBadTrainerJockey) and
      (bBadSpeed)
      ) then begin
      sBaseKey := sBaseKey + 'NONE';
   end else begin
      sBaseKey := sBaseKey + 'SOME';
   end;

   Result := sBaseKey;

end;

function GetElim2Key(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
var
   sBaseKey: string;

   bBadSpeed: boolean;
   bBadPower: boolean;

   bNoEarlyDot: boolean;
   bNoMiddleDot: boolean;
   bNoLateDot: boolean;

   bNoEarlyLiner: boolean;
   bNoMiddleLiner: boolean;
   bNoLateLiner: boolean;

   bNoQSP: boolean;
   bNoKSP: boolean;

   bNoQSP2: boolean;
   bNoKSP2: boolean;




begin




   bNoEarlyDot := True;
   bNoMiddleDot := True;
   bNoLateDot := True;

   bNoEarlyLiner := True;
   bNoMiddleLiner := True;
   bNoLateLiner := True;

   bNoQSP := True;
   bNoQSP2 := True;

   bNoKSP := True;
   bNoKSP2 := True;

   bBadPower := True;
   bBadSpeed := True;

   if (tblR.FieldByName('RaceType').AsString = 'MSW') or (tblR.FieldByName('RaceType').AsString = 'MCL') then begin
      if (tblE.FieldByName('DebutIndicator').AsString = '*') then begin
         sBaseKey := sBaseKey + 'SOME2';
         Result := sBaseKey;
         exit;
      end;

      if (tblE.FieldByName('DebutIndicator').AsString = '**') then begin
         sBaseKey := sBaseKey + 'SOME2';
         Result := sBaseKey;
         exit;
      end;
   end;

   if (tblR.FieldByName('Surface').AsString = 'T') then begin
      if (tblE.FieldByName('TurfIndicator').AsString = '*') then begin
         sBaseKey := sBaseKey + 'SOME2';
         Result := sBaseKey;
         exit;
      end;

      if (tblE.FieldByName('TurfIndicator').AsString = '**') then begin
         sBaseKey := sBaseKey + 'SOME2';
         Result := sBaseKey;
         exit;
      end;
   end;



   if ((tblE.FieldByName('LastSpeedRank').AsInteger >= 1) and
      (tblE.FieldByName('LastSpeedRank').AsInteger <= 2)) then begin
      bBadSpeed := False;
   end;

   if ((tblE.FieldByName('BackSpeedRank').AsInteger >= 1) and
      (tblE.FieldByName('BackSpeedRank').AsInteger <= 2)) then begin
      bBadSpeed := False;
   end;

   if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and
      (tblE.FieldByName('PowerRank').AsInteger <= 2)) then begin
      bBadSpeed := False;
   end;

   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
      bNoEarlyDot := False;
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
         bNoMiddleDot := False;
      end;
   end;

   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      bNoLateDot := False;
   end;

   //
   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
      bNoEarlyLiner := False;
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
         bNoMiddleLiner := False;
      end;
   end;


   if (tblE.FieldByName('Psr').AsFloat < 9999) and
      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
      bNoLateLiner := False;
   end;

   //
   if (tblE.FieldByName('QSP1stCallRank').AsInteger = 1) then begin
      bNoQSP := False;
   end;

   if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
      bNoKSP := False;
   end;

   if (tblE.FieldByName('DistanceInFurlongs').AsFloat < 6.0) then begin
      if (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1) then begin
         bNoQSP2 := False;
      end;


      if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
         bNoKSP2 := False;
      end;
   end;

   sBaseKey := '';

   if (
      (bBadSpeed) and
      (bBadPower) and
      (bNoEarlyDot) and
      (bNoMiddleDot) and
      (bNoLateDot) and
      (bNoEarlyLiner) and
      (bNoMiddleLiner) and
      (bNoLateLiner) and
      (bNoKSP) and
      (bNoKSP2) and
      (bNoQSP) and
      (bNoQSP2)
      ) then begin
      sBaseKey := sBaseKey + 'NONE2';
   end else begin
      sBaseKey := sBaseKey + 'SOME2';
   end;

   Result := sBaseKey;

end;


//function GetRunStyleKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   bTrainerTrack: boolean;
//   bTrainer: boolean;
//   bOwner: boolean;
//
//begin
//
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + Format('%-3s', [tblR.FieldByName('TrkCode').AsString]) + '/';
//   sBaseKey := sBaseKey + sm.str(tblE.FieldByName('PostPos').AsInteger, 2) + '/';
//   sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
//   sBaseKey := sBaseKey + Format('%2.2f', [tblR.FieldByName('DistanceInFurlongs').AsFloat]) + '/';
//   sBaseKey := sBaseKey + Format('%-2s', [tblE.FieldByName('QSPRunStyle').AsString]);
//
//   Result := sBaseKey;
//
//end;
//

//function GetTrainerAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;
//   Result := sBaseKey;
//
//end;
//
//function GetTrainerOwnerKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblR.FieldByName('TrkCode').AsString]);
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Owner').AsString;
//   Result := sBaseKey;
//
//end;
//
//function GetTrainerJockeyKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblR.FieldByName('TrkCode').AsString]);
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Jockey').AsString;
//   Result := sBaseKey;
//
//end;
//
//function GetTrainerOwnerAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Owner').AsString;
//   Result := sBaseKey;
//
//end;
//
//function GetTrainerJockeyAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Trainer').AsString;
//   sBaseKey := sBaseKey + '/' + tblE.FieldByName('Jockey').AsString;
//   Result := sBaseKey;
//
//end;


end.
//function GetPrimaryOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-SPD';
//
//      if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-LS-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-LS-' + sm.Str(0, 1);
//      end;
//
//      if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-BS-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-BS-' + sm.Str(0, 1);
//      end;
//
//      if (tblE.FieldByName('LastClassRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-LC-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-LC-' + sm.Str(0, 1);
//      end;
//
//      if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-BC-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-BC-' + sm.Str(0, 1);
//      end;
//
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetSecondaryOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
//
//      //
//      if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-E-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-E-' + sm.Str(0, 1);
//      end;
//      if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '/' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '/' + sm.Str(0, 1);
//      end;
//
//      //
//      if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-M-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-M-' + sm.Str(0, 1);
//      end;
//      if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '/' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '/' + sm.Str(0, 1);
//      end;
//
//      //
//      if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-L-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-L-' + sm.Str(0, 1);
//      end;
//      if (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '/' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '/' + sm.Str(0, 1);
//      end;
//
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetDefaultOrderKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//      sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]);
//
//      //
//      if ((tblE.FieldByName('PowerRank').AsInteger > 0) and
//         (tblE.FieldByName('Power').AsFloat > 0) and
//         (tblE.FieldByName('PowerRank').AsInteger <= ORDER_KEY_MAX)) then begin
//         sBaseKey := sBaseKey + '-PW-' + sm.str(tblE.FieldByName('PowerRank').AsInteger, 2);
//      end else begin
//         sBaseKey := sBaseKey + '-PW-' + sm.str(99, 2);
//      end;
//
//   end;
//
//   Result := sBaseKey;
//
//end;
//

//function GetLinerMorningLineKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//   bFrontDoubleLiner0: boolean;
//   bFrontDoubleLiner1: boolean;
//   bFrontDoubleLiner2: boolean;
//   bFrontDoubleLiner3: boolean;
//
//   bBackDoubleLiner0: boolean;
//   bBackDoubleLiner1: boolean;
//   bBackDoubleLiner2: boolean;
//   bBackDoubleLiner3: boolean;
//
//   bTripleLiner0: boolean;
//   bTripleLiner1: boolean;
//   bTripleLiner2: boolean;
//   bTripleLiner3: boolean;
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//
//      bFrontDoubleLiner0 := tblE.FieldByName('IsFrontDoubleLiner0').AsBoolean;
//      bFrontDoubleLiner1 := tblE.FieldByName('IsFrontDoubleLiner1').AsBoolean;
//      bFrontDoubleLiner2 := tblE.FieldByName('IsFrontDoubleLiner2').AsBoolean;
//      bFrontDoubleLiner3 := tblE.FieldByName('IsFrontDoubleLiner3').AsBoolean;
//
//      bBackDoubleLiner0 := tblE.FieldByName('IsBackDoubleLiner0').AsBoolean;
//      bBackDoubleLiner1 := tblE.FieldByName('IsBackDoubleLiner1').AsBoolean;
//      bBackDoubleLiner2 := tblE.FieldByName('IsBackDoubleLiner2').AsBoolean;
//      bBackDoubleLiner3 := tblE.FieldByName('IsBackDoubleLiner3').AsBoolean;
//
//      bTripleLiner0 := tblE.FieldByName('IsTripleLiner0').AsBoolean;
//      bTripleLiner1 := tblE.FieldByName('IsTripleLiner1').AsBoolean;
//      bTripleLiner2 := tblE.FieldByName('IsTripleLiner2').AsBoolean;
//      bTripleLiner3 := tblE.FieldByName('IsTripleLiner3').AsBoolean;
//
//      if (bTripleLiner0 or bFrontDoubleLiner0 or bBackDoubleLiner0 or
//         bTripleLiner1 or bFrontDoubleLiner1 or bBackDoubleLiner1 or
//         bTripleLiner2 or bFrontDoubleLiner2 or bBackDoubleLiner2 or
//         bTripleLiner3 or bFrontDoubleLiner3 or bBackDoubleLiner3) then begin
//
//         sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
//         sBaseKey := FastReplace(sBaseKey, 'B', '', True);
//         sBaseKey := FastReplace(sBaseKey, '+', '', True);
//         sBaseKey := FastReplace(sBaseKey, 'L', '', True);
//         sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
//
//         if (bFrontDoubleLiner0) then begin
//            sBaseKey := sBaseKey + '/' + 'FDL0';
//         end;
//
//         if (bFrontDoubleLiner1) then begin
//            sBaseKey := sBaseKey + '/' + 'FDL1';
//         end;
//
//         if (bFrontDoubleLiner2) then begin
//            sBaseKey := sBaseKey + '/' + 'FDL2';
//         end;
//
//         if (bFrontDoubleLiner3) then begin
//            sBaseKey := sBaseKey + '/' + 'FDL3';
//         end;
//
//         //
//         if (bBackDoubleLiner0) then begin
//            sBaseKey := sBaseKey + '/' + 'BDL0';
//         end;
//
//         if (bBackDoubleLiner1) then begin
//            sBaseKey := sBaseKey + '/' + 'BDL1';
//         end;
//
//         if (bBackDoubleLiner2) then begin
//            sBaseKey := sBaseKey + '/' + 'BDL2';
//         end;
//
//         if (bBackDoubleLiner3) then begin
//            sBaseKey := sBaseKey + '/' + 'BDL3';
//         end;
//
//         if (bTripleLiner0) then begin
//            sBaseKey := sBaseKey + '/' + 'TL0';
//         end;
//
//         if (bTripleLiner1) then begin
//            sBaseKey := sBaseKey + '/' + 'TL1';
//         end;
//
//         if (bTripleLiner2) then begin
//            sBaseKey := sBaseKey + '/' + 'TL2';
//         end;
//
//         if (bTripleLiner3) then begin
//            sBaseKey := sBaseKey + '/' + 'TL3';
//         end;
//
//      end;
//
//      Result := sBaseKey;
//   end;
//end;
//
//
//function GetOnlyMorningLineKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//
//      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
//      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
//      sBaseKey := FastReplace(sBaseKey, '+', '', True);
//      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
//
//   end;
//
//   Result := sBaseKey;
//
//end;
//


//function GetMorningLineKeyFinalWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//
//      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
//      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
//      sBaseKey := FastReplace(sBaseKey, '+', '', True);
//      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
//
//      if ((tblE.FieldByName('FinalWinPctRank').AsInteger > 0) and
//         (tblE.FieldByName('FinalWinPctRank').AsInteger <= ORDER_KEY_MAX)) then begin
//         sBaseKey := sBaseKey + '-F-' + sm.Str(tblE.FieldByName('FinalWinPctRank').AsInteger, 2);
//      end else begin
//         sBaseKey := sBaseKey + '-F-' + sm.Str(99, 2);
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetTodaysWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//      //      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]);
//      sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]);
//      sBaseKey := sBaseKey + '-F-' + sm.Str(tblE.FieldByName('TodaysWagerWinPctRank').AsInteger, 2);
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//
//function GetMorningLineKeyDefaultWinPctRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//
//   tblR.IndexName := '';
//   tblR.SetKey();
//   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
//   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
//   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
//
//   if tblR.GotoKey() then begin
//
//      sBaseKey := tblE.FieldByName('MorningLineDesc').AsString;
//      sBaseKey := FastReplace(sBaseKey, 'B', '', True);
//      sBaseKey := FastReplace(sBaseKey, '+', '', True);
//      sBaseKey := FastReplace(sBaseKey, 'L', '', True);
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/' + sBaseKey;
//
//      if ((tblE.FieldByName('DefaultWinPctRank').AsInteger > 0) and
//         (tblE.FieldByName('DefaultWinPctRank').AsInteger <= ORDER_KEY_MAX)) then begin
//         sBaseKey := sBaseKey + '-D-' + sm.Str(tblE.FieldByName('DefaultWinPctRank').AsInteger, 2);
//      end else begin
//         sBaseKey := sBaseKey + '-D-' + sm.Str(99, 2);
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetQSPRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-QSP-' + sm.Str(tblE.FieldByName('QSP1stCallRank').AsInteger, 2);
//   Result := sBaseKey;
//
//end;
//
//
//
//function GetKSPRank(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-KSP-' + sm.Str(tblE.FieldByName('KSP1stCallRank').AsInteger, 2);
//   Result := sBaseKey;
//
//end;
//
//function GetQSPRank2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-QSP2-' + sm.Str(tblE.FieldByName('QSP2ndCallRank').AsInteger, 2);
//   Result := sBaseKey;
//
//end;
//
//function GetKSPRank2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-KSP2-' + sm.Str(tblE.FieldByName('KSP2ndCallRank').AsInteger, 2);
//   Result := sBaseKey;
//
//end;
//
//
//function GetXS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   bXS: boolean;
//   bEarlyDot: boolean;
//   bMiddleDot: boolean;
//   bLateDot: boolean;
//
//   bEarlyLiner: boolean;
//   bMiddleLiner: boolean;
//   bLateLiner: boolean;
//
//   bQSP: boolean;
//   bKSP: boolean;
//
//   bQSP2: boolean;
//   bKSP2: boolean;
//
//   sBaseKey: string;
//
//begin
//
//   bEarlyDot := False;
//   bMiddleDot := False;
//   bLateDot := False;
//
//   bEarlyLiner := False;
//   bMiddleLiner := False;
//   bLateLiner := False;
//
//   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//      bEarlyDot := True;
//   end;
//
//   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//      bMiddleDot := True;
//   end;
//
//   if (tblE.FieldByName('PsrPos').AsFloat < 9999) and
//      (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
//      bLateDot := True;
//   end;
//
//   //
//   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      bEarlyLiner := True;
//   end;
//
//   if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      bMiddleLiner := True;
//   end;
//
//   if (tblE.FieldByName('Psr').AsFloat < 9999) and
//      (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      bLateLiner := True;
//   end;
//
//   if (tblE.FieldByName('QSP1stCallRank').AsInteger = 1) then begin
//      bQSP := True;
//   end else begin
//      bQSP := False;
//   end;
//
//   if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
//      bKSP := True;
//   end else begin
//      bKSP := False;
//   end;
//
//   if (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1) then begin
//      bQSP2 := True;
//   end else begin
//      bQSP2 := False;
//   end;
//
//   if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
//      bKSP2 := True;
//   end else begin
//      bKSP2 := False;
//   end;
//
//   bXS := False;
//   if (bEarlyLiner and bMiddleLiner and bQSP and bKSP and bQSP2 and bKSP2) then begin
//      bXS := True;
//   end;
//
//   sBaseKey := '';
//   if (bXS) then begin
//      sBaseKey := tblR.FieldByName('Surface').AsString + '/' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-XS';
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//
//function GetXS2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   bXS2: boolean;
//
//   iNbrPaceCnt: integer;
//
//   sBaseKey: string;
//
//begin
//
//   iNbrPaceCnt := 0;
//
//   //If modified Change in Update Tip Selections
//   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
//         (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
//         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if ((tblE.FieldByName('QSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   if ((tblE.FieldByName('KSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   bXS2 := False;
//   if (iNbrPaceCnt >= XS2_COUNT) then begin
//      bXS2 := True;
//   end;
//
//   sBaseKey := '';
//   if (bXS2) then begin
//      sBaseKey := tblR.FieldByName('Surface').AsString + '/' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-XS2-' + sm.Str(iNbrPaceCnt, 2);
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetXS3(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   bXS3: boolean;
//
//   iNbrPaceCnt: integer;
//
//   sBaseKey: string;
//
//begin
//
//   iNbrPaceCnt := 0;
//
//   //If modified Change in Update Tip Selections
//   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
//         (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
//         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if ((tblE.FieldByName('QSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   if ((tblE.FieldByName('KSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   bXS3 := False;
//   if (iNbrPaceCnt >= XS2_COUNT) then begin
//      bXS3 := True;
//   end;
//
//   sBaseKey := '';
//   if (bXS3) then begin
//      sBaseKey := tblR.FieldByName('RaceType').AsString + '/' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-XS3-' + sm.Str(iNbrPaceCnt, 2);
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetXS4(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   bXS4: boolean;
//
//   iNbrPaceCnt: integer;
//
//   sBaseKey: string;
//
//begin
//
//   iNbrPaceCnt := 0;
//
//   //If modified Change in Update Tip Selections
//   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
//         (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
//         (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   if ((tblE.FieldByName('QSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('QSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   if ((tblE.FieldByName('KSP1stCallRank').AsInteger = 1) and (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1)) then begin
//      Inc(iNbrPaceCnt);
//   end;
//
//   bXS4 := False;
//   if (iNbrPaceCnt >= XS2_COUNT) then begin
//      bXS4 := True;
//   end;
//
//   sBaseKey := '';
//   if (bXS4) then begin
//      sBaseKey := tblR.FieldByName('RaceType').AsString + '/' + '-XS4-' + sm.Str(iNbrPaceCnt, 2);
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//
//
//function GetLP2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//
//   iNbrPaceCnt: integer;
//   sBaseKey: string;
//
//begin
//
//   iNbrPaceCnt := 0;
//
//   //If modified Change in Update Tip Selections
//   if (tblE.FieldByName('PsrPos').AsFloat < 9999) and
//      (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('Psr').AsFloat < 9999) and
//         (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//         Inc(iNbrPaceCnt);
//      end;
//   end;
//
//   sBaseKey := '';
//   sBaseKey := tblR.FieldByName('Surface').AsString + '/' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-LP2-' + sm.Str(iNbrPaceCnt, 2);
//
//   Result := sBaseKey;
//
//end;
//
//
//
//
//function GetOS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-OS';
//   Result := sBaseKey;
//
//end;
//
//
//function GetOS2(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-OS2';
//   Result := sBaseKey;
//
//end;
//
//
//
//function GetPS(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-PS';
//   Result := sBaseKey;
//
//end;
//
//
//function GetPSPlus(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-PSPlus';
//   Result := sBaseKey;
//
//end;
//
//function Get2yoBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-2yoBred';
//   Result := sBaseKey;
//
//end;
//
//function Get1stBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-1stBred';
//   Result := sBaseKey;
//
//end;
//
//function GetTurfBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-TurfBred';
//   Result := sBaseKey;
//
//end;
//
//function GetX2yoBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-X2yoBred';
//   if ((tblE.FieldByName('TrnTrackRank').AsInteger >= 1) and (tblE.FieldByName('TrnTrackRank').AsInteger <= 20)) then begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//function GetX1stBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-X1stBred';
//   if ((tblE.FieldByName('TrnTrackRank').AsInteger >= 1) and (tblE.FieldByName('TrnTrackRank').AsInteger <= 20)) then begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//function GetXTurfBred(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '-XTurfBred';
//   if ((tblE.FieldByName('TrnTrackRank').AsInteger > 0) and (tblE.FieldByName('TrnTrackRank').AsInteger < 21)) then begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//
//function GetSpdKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-SPD';
//   if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-LS-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-LS-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-BS-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-BS-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//function GetClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-CLS';
//   if (tblE.FieldByName('LastClassRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-LC-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-LC-' + sm.Str(0, 1);
//   end;
//
//   if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
//      sBaseKey := sBaseKey + '-BC-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-BC-' + sm.Str(0, 1);
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetSpdClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iTotalSpdCls: integer;
//
//begin
//
//   iTotalSpdCls := 0;
//
//   if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
//      Inc(iTotalSpdCls);
//   end;
//   if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
//      Inc(iTotalSpdCls);
//   end;
//   if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
//      Inc(iTotalSpdCls);
//   end;
//
//   sBaseKey := '';
//   if ((tblE.FieldByName('LastSpeedRank').AsInteger > 0) and
//      (tblE.FieldByName('BackSpeedRank').AsInteger > 0) and
//      (tblE.FieldByName('PowerRank').AsInteger > 0)) then begin
//      if (iTotalSpdCls > 0) then begin
//         sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-SpdClsPwr-' + sm.Str(iTotalSpdCls, 2);
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;

//function GetEarlyPaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iEarlyPaceAdvantage: integer;
//
//begin
//
//   iEarlyPaceAdvantage := 0;
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      iEarlyPaceAdvantage := tblR.FieldByName('TopEarlyPace').AsInteger - tblR.FieldByName('SecondEarlyPace').AsInteger;
//   end else begin
//      iEarlyPaceAdvantage := tblE.FieldByName('EarlyPace').AsInteger - tblR.FieldByName('TopEarlyPace').AsInteger;
//   end;
//
//   sBaseKey := '';
//   if (iEarlyPaceAdvantage >= 0) and (iEarlyPaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'ErlPlus:' + sm.Str(iEarlyPaceAdvantage, 3);
//   end;
//   if (iEarlyPaceAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'ErlPlus:11+';
//   end;
//
//   if (iEarlyPaceAdvantage < 0) then begin
//      if ((iEarlyPaceAdvantage * -1) >= 0) and ((iEarlyPaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'ErlMinus:' + sm.Str((iEarlyPaceAdvantage * -1), 3);
//      end;
//      if ((iEarlyPaceAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'ErlMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetEarlyPaceAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iEarlyPaceAdvantage: integer;
//
//begin
//
//
//   iEarlyPaceAdvantage := 0;
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      iEarlyPaceAdvantage := tblR.FieldByName('TopEarlyPace').AsInteger - tblR.FieldByName('SecondEarlyPace').AsInteger;
//   end else begin
//      iEarlyPaceAdvantage := tblE.FieldByName('EarlyPace').AsInteger - tblR.FieldByName('TopEarlyPace').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iEarlyPaceAdvantage >= 0) and (iEarlyPaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/ErlPlus:' + sm.Str(iEarlyPaceAdvantage, 3);
//   end;
//   if (iEarlyPaceAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/ErlPlus:11+';
//   end;
//
//   if (iEarlyPaceAdvantage < 0) then begin
//      if ((iEarlyPaceAdvantage * -1) >= 0) and ((iEarlyPaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/ErlMinus:' + sm.Str((iEarlyPaceAdvantage * -1), 3);
//      end;
//      if ((iEarlyPaceAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/ErlMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;

//
//function GetEarlyPaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iEarlyPaceAdvantage: integer;
//   iPostPos: integer;
//
//begin
//
//   iPostPos := tblE.FieldByName('PostPos').AsInteger;
//
//   if ((tblE.FieldByName('EarlyPace').AsInteger = 0) or
//      (tblE.FieldByName('EarlyPace').AsInteger = 9999)) then begin
//      Result := '';
//      Exit;
//   end;
//
//   iEarlyPaceAdvantage := 0;
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      iEarlyPaceAdvantage := tblR.FieldByName('TopEarlyPace').AsInteger -
//         tblR.FieldByName('SecondEarlyPace').AsInteger;
//      if (iEarlyPaceAdvantage < 0) then begin
//         iEarlyPaceAdvantage := 0;
//      end;
//   end else begin
//      iEarlyPaceAdvantage := tblE.FieldByName('EarlyPace').AsInteger -
//         tblR.FieldByName('TopEarlyPace').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iEarlyPaceAdvantage >= 0) and (iEarlyPaceAdvantage <= 4) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus0-4:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus0-4:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus0-4:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus0-4:Post 8+';
//      end;
//   end;
//
//   if (iEarlyPaceAdvantage >= 5) and (iEarlyPaceAdvantage <= 10) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus5-10:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus5-10:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus5-10:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus5-10:Post 8+';
//      end;
//   end;
//
//   if (iEarlyPaceAdvantage >= 11) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus11+:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus11+:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus11+:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlPlus11+:Post 8+';
//      end;
//   end;
//
//   if (iEarlyPaceAdvantage < 0) then begin
//      if ((iEarlyPaceAdvantage * -1) >= 0) and ((iEarlyPaceAdvantage * -1) <= 4) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus0-4:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus0-4:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus0-4:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus0-4:Post 8+';
//         end;
//      end;
//
//      if ((iEarlyPaceAdvantage * -1) >= 5) and ((iEarlyPaceAdvantage * -1) <= 10) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus5-10:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus5-10:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus5-10:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus5-10:Post 8+';
//         end;
//      end;
//      if ((iEarlyPaceAdvantage * -1) >= 11) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus11+:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus11+:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus11+:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlMinus11+:Post 8+';
//         end;
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//

//function GetCombinedPaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iEarlyPaceAdvantage: integer;
//   iMiddlePaceAdvantage: integer;
//   iCombinedPaceAdvantage: integer;
//   iPostPos: integer;
//
//begin
//
//   iPostPos := tblE.FieldByName('PostPos').AsInteger;
//
//   if ((tblE.FieldByName('EarlyPace').AsInteger = 0) or
//      (tblE.FieldByName('EarlyPace').AsInteger = 9999)) then begin
//      Result := '';
//      exit;
//   end;
//
//
//   iEarlyPaceAdvantage := 0;
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      iEarlyPaceAdvantage := tblR.FieldByName('TopEarlyPace').AsInteger -
//         tblR.FieldByName('SecondEarlyPace').AsInteger;
//   end else begin
//      iEarlyPaceAdvantage := tblE.FieldByName('EarlyPace').AsInteger -
//         tblR.FieldByName('TopEarlyPace').AsInteger;
//   end;
//
//   if ((tblE.FieldByName('MiddlePace').AsInteger = 0) or
//      (tblE.FieldByName('MiddlePace').AsInteger = 9999)) then begin
//      Result := '';
//      Exit;
//   end;
//
//   iMiddlePaceAdvantage := 0;
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger -
//         tblR.FieldByName('SecondMiddlePace').AsInteger;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger -
//         tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//
//   if ((iEarlyPaceAdvantage <= 0) or
//      (iMiddlePaceAdvantage <= 0)) then begin
//      Result := '';
//      exit;
//   end;
//
//   iCombinedPaceAdvantage := iEarlyPaceAdvantage + iMiddlePaceAdvantage;
//
//   sBaseKey := '';
//
//   if (iCombinedPaceAdvantage >= 0) and (iCombinedPaceAdvantage <= 4) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus0-4:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus0-4:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus0-4:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus0-4:Post 8+';
//      end;
//   end;
//
//   if (iCombinedPaceAdvantage >= 5) and (iCombinedPaceAdvantage <= 10) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus5-10:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus5-10:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus5-10:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus5-10:Post 8+';
//      end;
//   end;
//
//   if (iCombinedPaceAdvantage >= 11) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus11+:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus11+:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus11+:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/ErlAndMidPlus11+:Post 8+';
//      end;
//   end;
//
//
//   Result := sBaseKey;
//
//end;

//function GetCombinedPaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iEarlyPaceAdvantage: integer;
//   iMiddlePaceAdvantage: integer;
//   iCombinedPaceAdvantage: integer;
//
//begin
//
//
//   iEarlyPaceAdvantage := 0;
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      if (tblR.FieldByName('SecondEarlyPace').AsInteger = 0) then begin
//         iEarlyPaceAdvantage := tblR.FieldByName('TopEarlyPace').AsInteger - tblR.FieldByName('SecondEarlyPace').AsInteger;
//      end else begin
//         iEarlyPaceAdvantage := 0;
//      end;
//   end else begin
//      iEarlyPaceAdvantage := tblE.FieldByName('EarlyPace').AsInteger - tblR.FieldByName('TopEarlyPace').AsInteger;
//   end;
//
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      if (tblR.FieldByName('SecondMiddlePace').AsInteger = 0) then begin
//         iMiddlePaceAdvantage := 0;
//      end else begin
//         iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger - tblR.FieldByName('SecondMiddlePace').AsInteger;
//      end;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger - tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//   iCombinedPaceAdvantage := iEarlyPaceAdvantage + iMiddlePaceAdvantage;
//
//
//   sBaseKey := '';
//   if (iCombinedPaceAdvantage >= 0) and (iCombinedPaceAdvantage <= 2) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComPlus:0-2';
//   end;
//
//   if (iCombinedPaceAdvantage >= 3) and (iCombinedPaceAdvantage <= 5) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComPlus:3-5';
//   end;
//
//   if (iCombinedPaceAdvantage >= 6) and (iCombinedPaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComPlus:6-10';
//   end;
//
//   if (iCombinedPaceAdvantage >= 11) and (iCombinedPaceAdvantage <= 15) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComPlus:11-15';
//   end;
//
//   if (iCombinedPaceAdvantage >= 16) and (iCombinedPaceAdvantage <= 20) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComPlus:16-20';
//   end;
//
//   if (iCombinedPaceAdvantage >= 21) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '/ComPlus:20+';
//   end;
//
//   if (iCombinedPaceAdvantage < 0) then begin
//      if ((iCombinedPaceAdvantage * -1) >= 0) and ((iCombinedPaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComMinus:' + sm.Str((iCombinedPaceAdvantage * -1), 3);
//      end;
//      if ((iCombinedPaceAdvantage * -1) >= 11) and ((iCombinedPaceAdvantage * -1) <= 15) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComMinus:11-15';
//      end;
//      if ((iCombinedPaceAdvantage * -1) >= 16) and ((iCombinedPaceAdvantage * -1) <= 20) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComMinus:16-20';
//      end;
//      if ((iCombinedPaceAdvantage * -1) >= 21) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-/ComMinus:20+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetMiddlePaceAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iMiddlePaceAdvantage: integer;
//
//begin
//
//   iMiddlePaceAdvantage := 0;
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      if (tblR.FieldByName('SecondMiddlePace').AsInteger = 0) then begin
//         iMiddlePaceAdvantage := 0;
//      end else begin
//         iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger - tblR.FieldByName('SecondMiddlePace').AsInteger;
//      end;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger - tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//   sBaseKey := '';
//   if (iMiddlePaceAdvantage >= 0) and (iMiddlePaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'MidPlus:' + sm.Str(iMiddlePaceAdvantage, 3);
//   end;
//   if (iMiddlePaceAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'MidPlus:11+';
//   end;
//
//   if (iMiddlePaceAdvantage < 0) then begin
//      if ((iMiddlePaceAdvantage * -1) >= 0) and ((iMiddlePaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'MidMinus:' + sm.Str((iMiddlePaceAdvantage * -1), 3);
//      end;
//      if ((iMiddlePaceAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'MidMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetMiddlePaceAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iMiddlePaceAdvantage: integer;
//
//begin
//
//
//   iMiddlePaceAdvantage := 0;
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      if (tblR.FieldByName('SecondMiddlePace').AsInteger = 0) then begin
//         iMiddlePaceAdvantage := 0;
//      end else begin
//         iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger - tblR.FieldByName('SecondMiddlePace').AsInteger;
//      end;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger - tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iMiddlePaceAdvantage >= 0) and (iMiddlePaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/MidPlus:' + sm.Str(iMiddlePaceAdvantage, 3);
//   end;
//   if (iMiddlePaceAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/MidPlus:11+';
//   end;
//
//   if (iMiddlePaceAdvantage < 0) then begin
//      if ((iMiddlePaceAdvantage * -1) >= 0) and ((iMiddlePaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/MidMinus:' + sm.Str((iMiddlePaceAdvantage * -1), 3);
//      end;
//      if ((iMiddlePaceAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/MidMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;

//function GetMiddlePaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iMiddlePaceAdvantage: integer;
//   iPostPos: integer;
//
//begin
//
//   iPostPos := tblE.FieldByName('PostPos').AsInteger;
//
//   if ((tblE.FieldByName('MiddlePace').AsInteger = 0) or
//      (tblE.FieldByName('MiddlePace').AsInteger = 9999)) then begin
//      Result := '';
//      exit;
//   end;
//
//   iMiddlePaceAdvantage := 0;
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger -
//         tblR.FieldByName('SecondMiddlePace').AsInteger;
//      if (iMiddlePaceAdvantage < 0) then begin
//         iMiddlePaceAdvantage := 0;
//      end;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger -
//         tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iMiddlePaceAdvantage >= 0) and (iMiddlePaceAdvantage <= 4) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus0-4:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus0-4:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus0-4:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus0-4:Post 8+';
//      end;
//   end;
//
//   if (iMiddlePaceAdvantage >= 5) and (iMiddlePaceAdvantage <= 10) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus5-10:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus5-10:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus5-10:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus5-10:Post 8+';
//      end;
//   end;
//
//   if (iMiddlePaceAdvantage >= 11) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus11+:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus11+:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus11+:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus11+:Post 8+';
//      end;
//   end;
//
//   if (iMiddlePaceAdvantage < 0) then begin
//      if ((iMiddlePaceAdvantage * -1) >= 0) and ((iMiddlePaceAdvantage * -1) <= 4) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus0-4:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus0-4:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus0-4:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus0-4:Post 8+';
//         end;
//      end;
//
//      if ((iMiddlePaceAdvantage * -1) >= 5) and ((iMiddlePaceAdvantage * -1) <= 10) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus5-10:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus5-10:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus5-10:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus5-10:Post 8+';
//         end;
//      end;
//
//      if ((iMiddlePaceAdvantage * -1) >= 11) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus11+:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus11+:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus11+:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus11+:Post 8+';
//         end;
//      end;
//
//   end;
//
//   if (sBaseKey = '') then begin
//   end;
//
//   Result := sBaseKey;
//
//end;

//function GetMiddlePaceAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iMiddlePaceAdvantage: integer;
//
//begin
//
//
//   iMiddlePaceAdvantage := 0;
//   if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      if (tblR.FieldByName('SecondMiddlePace').AsInteger = 0) then begin
//         iMiddlePaceAdvantage := 0;
//      end else begin
//         iMiddlePaceAdvantage := tblR.FieldByName('TopMiddlePace').AsInteger - tblR.FieldByName('SecondMiddlePace').AsInteger;
//      end;
//   end else begin
//      iMiddlePaceAdvantage := tblE.FieldByName('MiddlePace').AsInteger - tblR.FieldByName('TopMiddlePace').AsInteger;
//   end;
//
//
//
//   sBaseKey := '';
//   if (iMiddlePaceAdvantage >= 0) and (iMiddlePaceAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus:' + sm.Str(iMiddlePaceAdvantage, 3);
//   end;
//   if (iMiddlePaceAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidPlus:11+';
//   end;
//
//   if (iMiddlePaceAdvantage < 0) then begin
//      if ((iMiddlePaceAdvantage * -1) >= 0) and ((iMiddlePaceAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus:' + sm.Str((iMiddlePaceAdvantage * -1), 3);
//      end;
//      if ((iMiddlePaceAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/MidMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//

//function GetPsrAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPsrAdvantage: integer;
//
//begin
//
//   iPsrAdvantage := 0;
//   if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      iPsrAdvantage := tblR.FieldByName('TopPsr').AsInteger - tblR.FieldByName('SecondPsr').AsInteger;
//   end else begin
//      iPsrAdvantage := tblE.FieldByName('Psr').AsInteger - tblR.FieldByName('TopPsr').AsInteger;
//   end;
//
//   sBaseKey := '';
//   if (iPsrAdvantage >= 0) and (iPsrAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'LatPlus:' + sm.Str(iPsrAdvantage, 3);
//   end;
//   if (iPsrAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'LatPlus:11+';
//   end;
//
//   if (iPsrAdvantage < 0) then begin
//      if ((iPsrAdvantage * -1) >= 0) and ((iPsrAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'LatMinus:' + sm.Str((iPsrAdvantage * -1), 3);
//      end;
//      if ((iPsrAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'LatMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetPsrAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPsrAdvantage: integer;
//
//begin
//
//
//   iPsrAdvantage := 0;
//   if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      iPsrAdvantage := tblR.FieldByName('TopPsr').AsInteger - tblR.FieldByName('SecondPsr').AsInteger;
//   end else begin
//      iPsrAdvantage := tblE.FieldByName('Psr').AsInteger - tblR.FieldByName('TopPsr').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iPsrAdvantage >= 0) and (iPsrAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/LatPlus:' + sm.Str(iPsrAdvantage, 3);
//   end;
//   if (iPsrAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/LatPlus:11+';
//   end;
//
//   if (iPsrAdvantage < 0) then begin
//      if ((iPsrAdvantage * -1) >= 0) and ((iPsrAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/LatMinus:' + sm.Str((iPsrAdvantage * -1), 3);
//      end;
//      if ((iPsrAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/LatMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//

//function GetPsrAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPsrAdvantage: integer;
//   iPostPos: integer;
//
//begin
//
//   iPostPos := tblE.FieldByName('PostPos').AsInteger;
//
//   iPsrAdvantage := 0;
//
//   if ((tblE.FieldByName('Psr').AsInteger = 0) or
//      (tblE.FieldByName('Psr').AsInteger = 9999)) then begin
//      Result := '';
//      exit;
//   end;
//
//   if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      iPsrAdvantage := tblR.FieldByName('TopPsr').AsInteger -
//         tblR.FieldByName('SecondPsr').AsInteger;
//      if (iPsrAdvantage < 0) then begin
//         iPsrAdvantage := 0;
//      end;
//   end else begin
//      iPsrAdvantage := tblE.FieldByName('Psr').AsInteger -
//         tblR.FieldByName('TopPsr').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iPsrAdvantage >= 0) and (iPsrAdvantage <= 4) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus0-4:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus0-4:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus0-4:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus0-4:Post 8+';
//      end;
//   end;
//
//   if (iPsrAdvantage >= 5) and (iPsrAdvantage <= 10) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus5-10:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus5-10:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus5-10:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus5-10:Post 8+';
//      end;
//   end;
//
//   if (iPsrAdvantage >= 11) then begin
//      if (iPostPos = 1) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus11+:Post 1';
//      end;
//      if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus11+:Post 2-4';
//      end;
//      if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus11+:Post 5-7';
//      end;
//      if (iPostPos >= 8) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus11+:Post 8+';
//      end;
//   end;
//
//   if (iPsrAdvantage < 0) then begin
//      if ((iPsrAdvantage * -1) >= 0) and ((iPsrAdvantage * -1) <= 4) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus0-4:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus0-4:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus0-4:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus0-4:Post 8+';
//         end;
//      end;
//
//      if ((iPsrAdvantage * -1) >= 5) and ((iPsrAdvantage * -1) <= 10) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus5-10:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus5-10:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus5-10:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus5-10:Post 8+';
//         end;
//      end;
//      if ((iPsrAdvantage * -1) >= 11) then begin
//         if (iPostPos = 1) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus11+:Post 1';
//         end;
//         if ((iPostPos >= 2) and (iPostPos <= 4)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus11+:Post 2-4';
//         end;
//         if ((iPostPos >= 5) and (iPostPos <= 7)) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus11+:Post 5-7';
//         end;
//         if (iPostPos >= 8) then begin
//            sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//            Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//               Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus11+:Post 8+';
//         end;
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetPsrAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPsrAdvantage: integer;
//
//begin
//
//
//   iPsrAdvantage := 0;
//   if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      iPsrAdvantage := tblR.FieldByName('TopPsr').AsInteger - tblR.FieldByName('SecondPsr').AsInteger;
//   end else begin
//      iPsrAdvantage := tblE.FieldByName('Psr').AsInteger - tblR.FieldByName('TopPsr').AsInteger;
//   end;
//
//
//   sBaseKey := '';
//   if (iPsrAdvantage >= 0) and (iPsrAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus:' + sm.Str(iPsrAdvantage, 3);
//   end;
//   if (iPsrAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatPlus:11+';
//   end;
//
//   if (iPsrAdvantage < 0) then begin
//      if ((iPsrAdvantage * -1) >= 0) and ((iPsrAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus:' + sm.Str((iPsrAdvantage * -1), 3);
//      end;
//      if ((iPsrAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/LatMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//

//function GetPowerAdvantageClsKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPowerAdvantage: integer;
//
//begin
//
//
//   iPowerAdvantage := 0;
//   iPowerAdvantage := tblE.FieldByName('PowerAdvantageKey').AsInteger;
//
//   sBaseKey := '';
//   if (iPowerAdvantage >= 0) and (iPowerAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrPlus:' + sm.Str(iPowerAdvantage, 3);
//   end;
//   //if (iPowerAdvantage >= 6) and (iPowerAdvantage <= 10) then begin
//   //   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrPlus:6-10';
//   //end;
//   if (iPowerAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrPlus:11+';
//   end;
//
//   if (iPowerAdvantage < 0) then begin
//      if ((iPowerAdvantage * -1) >= 0) and ((iPowerAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrMinus:' + sm.Str((iPowerAdvantage * -1), 3);
//      end;
//      //if ((iPowerAdvantage * -1) >= 6) and ((iPowerAdvantage * -1) <= 10) then begin
//      //   sBaseKey := Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrMinus:6-10';
//      //end;
//      if ((iPowerAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + Format('%-3s', [tblE.FieldByName('RaceType').AsString]) + '/PwrMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//function GetPowerAdvantageAllKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPowerAdvantage: integer;
//
//
//begin
//
//   iPowerAdvantage := 0;
//   iPowerAdvantage := tblE.FieldByName('PowerAdvantageKey').AsInteger;
//
//   sBaseKey := '';
//
//
//   if (iPowerAdvantage >= 0) and (iPowerAdvantage <= 10) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'PwrPlus:' + sm.Str(iPowerAdvantage, 3);
//   end;
//   //if (iPowerAdvantage >= 6) and (iPowerAdvantage <= 10) then begin
//   //   sBaseKey := 'PwrPlus:6-10';
//   //end;
//   if (iPowerAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'PwrPlus:11+';
//   end;
//
//   if (iPowerAdvantage < 0) then begin
//      if ((iPowerAdvantage * -1) >= 0) and ((iPowerAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'PwrMinus:' + sm.Str((iPowerAdvantage * -1), 3);
//      end;
//      //   if ((iPowerAdvantage * -1) >= 6) and ((iPowerAdvantage * -1) <= 10) then begin
//      //      sBaseKey := 'PwrMinus:6-10';
//      //   end;
//      if ((iPowerAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' + 'PwrMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//
//

//function GetPowerAdvantageTrkKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//   iPowerAdvantage: integer;
//
//
//begin
//
//   iPowerAdvantage := 0;
//   iPowerAdvantage := tblE.FieldByName('PowerAdvantageKey').AsInteger;
//
//   sBaseKey := '';
//
//
//   if (iPowerAdvantage >= 0) and (iPowerAdvantage <= 4) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//      Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//         Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrPlus:' + sm.Str(iPowerAdvantage, 3);
//   end;
//   if (iPowerAdvantage >= 5) and (iPowerAdvantage <= 10) then begin
//      sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrPlus:5-10';
//   end;
//   if (iPowerAdvantage >= 11) then begin
//      sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//      Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//         Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrPlus:11+';
//   end;
//
//   if (iPowerAdvantage < 0) then begin
//      if ((iPowerAdvantage * -1) >= 0) and ((iPowerAdvantage * -1) <= 4) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrMinus:' + sm.Str((iPowerAdvantage * -1), 3);
//      end;
//      if ((iPowerAdvantage * -1) >= 5) and ((iPowerAdvantage * -1) <= 10) then begin
//         sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrMinus:5-10';
//      end;
//      if ((iPowerAdvantage * -1) >= 11) then begin
//         sBaseKey := Format('%-1s', [tblR.FieldByName('Surface').AsString]) + '-' +
//         Trim(tblR.FieldByName('DistanceDesc').AsString) + '  ' +
//            Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/PwrMinus:11+';
//      end;
//   end;
//
//   Result := sBaseKey;
//
//end;
//

//function GetLinerCntKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   iNbrEarlyCnt: integer;
//   iNbrMiddleCnt: integer;
//   iNbrLateCnt: integer;
//   sBaseKey: string;
//   bOwner: boolean;
//
//begin
//
//   iNbrEarlyCnt := 0;
//   iNbrMiddleCnt := 0;
//   iNbrLateCnt := 0;
//
//   //
//   if (tblE.FieldByName('EarlyPace').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      Inc(iNbrEarlyCnt);
//   end;
//   if (tblE.FieldByName('MiddlePace').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      Inc(iNbrEarlyCnt);
//   end;
//
//   //
//   if (tblE.FieldByName('EarlyPacePos').AsFloat < 9999) and
//      (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//      Inc(iNbrMiddleCnt);
//   end;
//   if (tblE.FieldByName('MiddlePacePos').AsFloat < 9999) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//      Inc(iNbrMiddleCnt);
//   end;
//
//   //
//   if (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
//      Inc(iNbrEarlyCnt);
//   end;

//   if (tblE.FieldByName('KSP2ndCallRank').AsInteger = 1) then begin
//      Inc(iNbMiddleCnt);
//   end;
//
//
//      if ((tblE.FieldByName('PsrPosRank').AsInteger = 1)) then begin
//         if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//            Inc(iNbrLateCnt);
//         end;
//         if (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
//            Inc(iNbrLateCnt);
//         end;
//      end;
//   end;
//
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
//   sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
//   sBaseKey := sBaseKey + 'E' + sm.Str(iNbrEarlyCnt, 2);
//   sBaseKey := sBaseKey + 'M' + sm.Str(iNbrMiddleCnt, 2);
//   sBaseKey := sBaseKey + 'L' + sm.Str(iNbrLateCnt, 2);
//
//
//   Result := sBaseKey;
//
//end;
//
//function GetLinerKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := sBaseKey + Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '/';
//   sBaseKey := sBaseKey + tblR.FieldByName('Surface').AsString + '/';
//
//   //
//   if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-EE-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-E-' + sm.Str(1, 1);
//      end;
//   end else begin
//      sBaseKey := sBaseKey + '-E-' + sm.Str(0, 1);
//   end;
//
//
//   if ((tblE.FieldByName('MiddlePaceRank').AsInteger = 1) and
//      (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) and
//      (tblE.FieldByName('KSP1stCallRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-3M-' + sm.Str(1, 1);
//     end else if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-MM-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-M-' + sm.Str(1, 1);
//      end;
//   end else begin
//      sBaseKey := sBaseKey + '-M-' + sm.Str(0, 1);
//   end;
//

//
//   if (tblE.FieldByName('PsrRank').AsInteger = 1) then begin
//      if (tblE.FieldByName('PsrPosRank').AsInteger = 1) then begin
//         sBaseKey := sBaseKey + '-LL-' + sm.Str(1, 1);
//      end else begin
//         sBaseKey := sBaseKey + '-L-' + sm.Str(1, 1);
//      end;
//   end else begin
//      sBaseKey := sBaseKey + '-L-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//
//
//function GetTrnTrackKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-TrnTrack';
//   if ((tblE.FieldByName('TrnTrackRank').AsInteger >= 1) and (tblE.FieldByName('TrnTrackRank').AsInteger <= 20)) then begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-T-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//
//function GetJkyTrackKey(tblR: TDBISAMTable; tblE: TDBISAMTable): string;
//var
//   sBaseKey: string;
//
//begin
//
//   sBaseKey := '';
//   sBaseKey := Format('%-3s', [tblE.FieldByName('TrkCode').AsString]) + '-JkyTrack';
//   if ((tblE.FieldByName('JkyTrackRank').AsInteger >= 1) and (tblE.FieldByName('JkyTrackRank').AsInteger <= 20)) then begin
//      sBaseKey := sBaseKey + '-J-' + sm.Str(1, 1);
//   end else begin
//      sBaseKey := sBaseKey + '-J-' + sm.Str(0, 1);
//   end;
//   Result := sBaseKey;
//
//end;
//

