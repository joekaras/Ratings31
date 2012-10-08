unit UnitUpdateGimmicks;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure UpdateGimmicks(
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer);

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

{-----------------------------------------------------------------------------
  Procedure: UpdateGimmicks
  Arguments: tblR: TDBISAMTable; tblE: TDBISAMTable; tblP: TDBISAMTable; pnlPrgBar: TPanel; prgBar: TcxProgressBar; staBar: TStatusBar; iIncCnt: Integer
  Result:    None
             First we clear fields in Races and Entries table
             We first mark horses as value (Timmy) or chalk plays (Gator)
             They will be automatic inclusions in Gimmicks's
             We also want to know if it just a chalk or value or both in that
             race.
             If only a chalk then it is a single key
             If is a chalk and one or more value plays we go with all of them
             If there is only one value play and ML is less then 4-1 it is a single
             key
             If multiple keys and one is less the 4-1 we will add the FinalWinPctRank = 1 horse

-----------------------------------------------------------------------------}

procedure UpdateGimmicks
   (
   tblR: TDBISAMTable;
   tblE: TDBISAMTable;
   tblP: TDBISAMTable;
   pnlPrgBar: TPanel;
   prgBar: TcxProgressBar;
   staBar: TStatusBar;
   iIncCnt: Integer);
var

   iSuperSelections: TNums;
   sSuperfectaBottom: string;
   iNbrSelections: integer;

   iLen: integer;


   sRaceType: string;
   sSurface: string;
   iRaceNbr: integer;
   sTrkCode: string;

   iSaveRaceNbr: integer;
   sSaveTrkCode: string;

   sLeg1: string;
   sLeg2: string;
   sLeg3: string;
   sLeg4: string;
   sLeg5: string;
   sLeg6: string;

   fLeg1: double;
   fLeg2: double;
   fLeg3: double;
   fLeg4: double;
   fLeg5: double;
   fLeg6: double;

   sWager1: string;
   sWager2: string;
   sWager3: string;
   sWager4: string;
   sWager5: string;
   sWager6: string;

   sAltWager1: string;
   sAltWager2: string;
   sAltWager3: string;
   sAltWager4: string;
   sAltWager5: string;
   sAltWager6: string;

   sValue: string;
   sTipSheet: string;
   sChalk: string;
   sTrifecta: string;
   sTrifecta2: string;
   sTrifecta3: string;
   sTrifecta4: string;
   sDD: string;
   sExacta: string;
   sQuinella: string;
   sSuperfecta: string;


   sTri1st: string;
   sTri2nd: string;
   sTri3rd: string;
   sTri4th: string;
   sTri5th: string;
   sTri6th: string;
   sTri7th: string;
   sTri8th: string;

   sTriDoubleLiner: string;
   sTriGator: string;
   sTriDollar: string;
   sTriHotTrainer: string;
   sTriHotJockey: string;
   sTriTopJockey: string;
   sTriTopTrainer: string;
   sTriTopChoice: string;
   sTriSecondChoice: string;
   sTriThirdChoice: string;
   sTriMLFavorite: string;
   sTopPk3: string;
   sTopTri: string;

   sEarlyPacePos: string;
   sMiddlePacePos: string;
   sLatePacePos: string;

   sDoubleLiner: string;
   sDoubleDot: string;
   sDoubleDollar: string;
   sDollar: string;
   sNoDollar: string;
   sTopTurf: string;
   sTopMud: string;
   sTopPedigree: string;

   sTopTurfSire: string;
   sTopPedigreeSire: string;
   sTopTurfDamSire: string;
   sTopPedigreeDamSire: string;
   sTopTurfDam: string;
   sTopPedigreeDam: string;

   sHotTrainer: string;
   sHotJockey: string;

   sCora: string;
   sAsh: string;
   sCole: string;
   sDana: string;

   sKasperski: string;
   sMLFavorite: string;

   sTopJockey: string;
   sTopTrainer: string;
   sTopTJ: string;
   sTopOwner: string;

   sFinalOrder: string;

   sTopChoice: string;
   sSecondChoice: string;
   sThirdChoice: string;
   sFourthChoice: string;
   sFifthChoice: string;
   sSixthChoice: string;

   sMudTopChoice: string;
   sMudSecondChoice: string;
   sMudThirdChoice: string;
   sMudFourthChoice: string;
   sMudFifthChoice: string;
   sMudSixthChoice: string;
   sMudSeventhChoice: string;

   sDistanceTopChoice: string;
   sDistanceSecondChoice: string;
   sDistanceThirdChoice: string;
   sDistanceFourthChoice: string;
   sDistanceFifthChoice: string;
   sDistanceSixthChoice: string;
   sDistanceSeventhChoice: string;

   sTurfTopChoice: string;
   sTurfSecondChoice: string;
   sTurfThirdChoice: string;
   sTurfFourthChoice: string;
   sTurfFifthChoice: string;
   sTurfSixthChoice: string;
   sTurfSeventhChoice: string;

   sMaidenTopChoice: string;
   sMaidenSecondChoice: string;
   sMaidenThirdChoice: string;
   sMaidenFourthChoice: string;
   sMaidenFifthChoice: string;
   sMaidenSixthChoice: string;
   sMaidenSeventhChoice: string;

   sAWTopChoice: string;
   sAWSecondChoice: string;
   sAWThirdChoice: string;
   sAWFourthChoice: string;
   sAWFifthChoice: string;
   sAWSixthChoice: string;
   sAWSeventhChoice: string;

   sTrainerTopChoice: string;
   sTrainerSecondChoice: string;
   sTrainerThirdChoice: string;
   sTrainerFourthChoice: string;
   sTrainerFifthChoice: string;
   sTrainerSixthChoice: string;
   sTrainerSeventhChoice: string;

   sJockeyTopChoice: string;
   sJockeySecondChoice: string;
   sJockeyThirdChoice: string;
   sJockeyFourthChoice: string;
   sJockeyFifthChoice: string;
   sJockeySixthChoice: string;
   sJockeySeventhChoice: string;

   sOwnerTopChoice: string;
   sOwnerSecondChoice: string;
   sOwnerThirdChoice: string;
   sOwnerFourthChoice: string;
   sOwnerFifthChoice: string;
   sOwnerSixthChoice: string;
   sOwnerSeventhChoice: string;

   sTrainerJockeyTopChoice: string;
   sTrainerJockeySecondChoice: string;
   sTrainerJockeyThirdChoice: string;
   sTrainerJockeyFourthChoice: string;
   sTrainerJockeyFifthChoice: string;
   sTrainerJockeySixthChoice: string;
   sTrainerJockeySeventhChoice: string;

   sBackSpeedTopChoice: string;
   sBackSpeedSecondChoice: string;
   sBackSpeedThirdChoice: string;
   sBackSpeedFourthChoice: string;
   sBackSpeedFifthChoice: string;
   sBackSpeedSixthChoice: string;

   sBackClassTopChoice: string;
   sBackClassSecondChoice: string;
   sBackClassThirdChoice: string;
   sBackClassFourthChoice: string;
   sBackClassFifthChoice: string;
   sBackClassSixthChoice: string;

   sLastSpeedTopChoice: string;
   sLastSpeedSecondChoice: string;
   sLastSpeedThirdChoice: string;
   sLastSpeedFourthChoice: string;
   sLastSpeedFifthChoice: string;
   sLastSpeedSixthChoice: string;

   sAvgClassTopChoice: string;
   sAvgClassSecondChoice: string;
   sAvgClassThirdChoice: string;
   sAvgClassFourthChoice: string;
   sAvgClassFifthChoice: string;
   sAvgClassSixthChoice: string;


   sErlPaceTopChoice: string;
   sErlPaceSecondChoice: string;
   sErlPaceThirdChoice: string;
   sErlPaceFourthChoice: string;
   sErlPaceFifthChoice: string;
   sErlPaceSixthChoice: string;
   sErlPaceSeventhChoice: string;

   sErlPaceTopGap: string;
   sErlPaceSecondGap: string;
   sErlPaceThirdGap: string;
   sErlPaceFourthGap: string;
   sErlPaceFifthGap: string;
   sErlPaceSixthGap: string;
   sErlPaceSeventhGap: string;

   sErlPacePosTopChoice: string;
   sErlPacePosSecondChoice: string;
   sErlPacePosThirdChoice: string;
   sErlPacePosFourthChoice: string;
   sErlPacePosFifthChoice: string;
   sErlPacePosSixthChoice: string;
   sErlPacePosSeventhChoice: string;

   sErlPacePosTopGap: string;
   sErlPacePosSecondGap: string;
   sErlPacePosThirdGap: string;
   sErlPacePosFourthGap: string;
   sErlPacePosFifthGap: string;
   sErlPacePosSixthGap: string;
   sErlPacePosSeventhGap: string;
   
   sMidPaceTopChoice: string;
   sMidPaceSecondChoice: string;
   sMidPaceThirdChoice: string;
   sMidPaceFourthChoice: string;
   sMidPaceFifthChoice: string;
   sMidPaceSixthChoice: string;
   sMidPaceSeventhChoice: string;

   sMidPaceTopGap: string;
   sMidPaceSecondGap: string;
   sMidPaceThirdGap: string;
   sMidPaceFourthGap: string;
   sMidPaceFifthGap: string;
   sMidPaceSixthGap: string;
   sMidPaceSeventhGap: string;

   sMidPacePosTopChoice: string;
   sMidPacePosSecondChoice: string;
   sMidPacePosThirdChoice: string;
   sMidPacePosFourthChoice: string;
   sMidPacePosFifthChoice: string;
   sMidPacePosSixthChoice: string;
   sMidPacePosSeventhChoice: string;

   sMidPacePosTopGap: string;
   sMidPacePosSecondGap: string;
   sMidPacePosThirdGap: string;
   sMidPacePosFourthGap: string;
   sMidPacePosFifthGap: string;
   sMidPacePosSixthGap: string;
   sMidPacePosSeventhGap: string;
   
   sLatePaceTopChoice: string;
   sLatePaceSecondChoice: string;
   sLatePaceThirdChoice: string;
   sLatePaceFourthChoice: string;
   sLatePaceFifthChoice: string;
   sLatePaceSixthChoice: string;
   sLatePaceSeventhChoice: string;

   sLatePaceTopGap: string;
   sLatePaceSecondGap: string;
   sLatePaceThirdGap: string;
   sLatePaceFourthGap: string;
   sLatePaceFifthGap: string;
   sLatePaceSixthGap: string;
   sLatePaceSeventhGap: string;

   sLatePacePosTopChoice: string;
   sLatePacePosSecondChoice: string;
   sLatePacePosThirdChoice: string;
   sLatePacePosFourthChoice: string;
   sLatePacePosFifthChoice: string;
   sLatePacePosSixthChoice: string;
   sLatePacePosSeventhChoice: string;

   sLatePacePosTopGap: string;
   sLatePacePosSecondGap: string;
   sLatePacePosThirdGap: string;
   sLatePacePosFourthGap: string;
   sLatePacePosFifthGap: string;
   sLatePacePosSixthGap: string;
   sLatePacePosSeventhGap: string;
   
   sPowerTopGap: string;
   sPowerSecondGap: string;
   sPowerThirdGap: string;
   sPowerFourthGap: string;
   sPowerFifthGap: string;
   sPowerSixthGap: string;
   sPowerSeventhGap: string;


   sTodaysWagerTopChoice: string;
   sTodaysWagerSecondChoice: string;
   sTodaysWagerThirdChoice: string;
   sTodaysWagerFourthChoice: string;
   sTodaysWagerFifthChoice: string;
   sTodaysWagerSixthChoice: string;
   sTodaysWagerSeventhChoice: string;

   sWagerSelected1stChoice: string;
   sWagerSelected2ndChoice: string;
   sWagerSelected3rdChoice: string;
   sWagerSelected4thChoice: string;
   sWagerSelected5thChoice: string;
   sWagerSelected6thChoice: string;
   sWagerSelected7thChoice: string;
   sWagerSelected8thChoice: string;
   sWagerSelected9thChoice: string;



   sTipChoice: string;

   sEarlyPace: string;
   sMiddlePace: string;
   sLatePace: string;

   sProgramNbr: string;

   aiLeg1: array[1..100] of integer;
   aiLeg2: array[1..100] of integer;
   aiLeg3: array[1..100] of integer;

   iLegCnt1: integer;
   iLegCnt2: integer;
   iLegCnt3: integer;

   iIdx: integer;
   bAddToArray: boolean;

   sTimmyGatorFilter: string;

   iCurrTriSelection: integer;
   iCurrPk3Selection: integer;
   iAltPk3Selection: integer;
   iTriWheelSelections: integer;

   sTriKey1: string;
   sTriKey2: string;

   sFrontDD: string;
   sBackDD: string;

   lstGimmick: TStringList;

   sKeyTop: string;
   sKeyBottom: string;
   sKeySuperBottom: string;

   iKeyTopHorses: integer;
   iKeyBottomHorses: integer;

   bFound: boolean;

   fWagerAmt: double;
   fPlcWagerAmt: double;
   fShoWagerAmt: double;

   bWagerSheetSelected: boolean;
   bOverlaySheetSelected: boolean;

   fNbrStarters: double;
   fNbrDebutStarters: double;
   fNbrDebutTwoStarters: double;
   fNbrTurfDebutStarters: double;
   fNbrRouteDebutStarters: double;
   fPctOfDebutStarters: double;

   bOwnWins: boolean;
   bOwnEarnings: boolean;
   bPowerRank: boolean;
   bBred: boolean;

begin

   hLog.AddToLog('UpdateGimmicks', msevOperation);
   try
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblP);

      tblP.EmptyTable();


      OpenTable(tblR);
      OpenTable(tblE);
      OpenTable(tblP);

      //Start
      try
         InitPrgBar(tblR.RecordCount);
         tblR.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction;
         end;
         while not tblR.Eof do begin
            UpdateStatusBar('Updating Total PK3 Total Choices');
            IncPrgBar();
            Application.ProcessMessages();

            tblR.Edit();
            tblR.FieldByName('TotalPK3Choices').AsInteger := 0;
            tblR.FieldByName('TotalTriChoices').AsInteger := 0;
            tblR.FieldByName('PK3KeyType').AsInteger := NO_PK3_TYPE;
            tblR.FieldByName('PK3Selected').AsBoolean := False;
            tblR.Post();
            tblR.Next();
         end;
      except
         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Rollback;
         end;
         ClearPrgStatusBars();
      end;

      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;


      try
         InitPrgBar(tblR.RecordCount);

         tblR.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction;
         end;

         while not tblR.Eof do begin
            UpdateStatusBar('Updating Pick 3 Table');
            IncPrgBar();
            Application.ProcessMessages();

            sWager1 := '';
            sWager2 := '';
            sWager3 := '';
            sWager4 := '';
            sWager5 := '';
            sWager6 := '';

            sLeg1 := '';
            sLeg2 := '';
            sLeg3 := '';
            sLeg4 := '';
            sLeg5 := '';
            sLeg6 := '';

            fLeg1 := 0;
            fLeg2 := 0;
            fLeg3 := 0;
            fLeg4 := 0;
            fLeg5 := 0;
            fLeg6 := 0;

            sAltWager1 := '';
            sAltWager2 := '';
            sAltWager3 := '';
            sAltWager4 := '';
            sAltWager5 := '';
            sAltWager6 := '';

            sValue := '';
            sChalk := '';
            sDoubleLiner := '';
            sDoubleDot := '';
            sDoubleDollar := '';
            sDollar := '';
            sCora := '';
            sAsh := '';
            sDana := '';
            sCole := '';

            sTopOwner := '';
            sFinalOrder := '';

            sNoDollar := '';

            sTopChoice := '';
            sSecondChoice := '';
            sThirdChoice := '';
            sFourthChoice := '';
            sFifthChoice := '';
            sSixthChoice := '';

            sMudTopChoice := '';
            sMudSecondChoice := '';
            sMudThirdChoice := '';
            sMudFourthChoice := '';
            sMudFifthChoice := '';
            sMudSixthChoice := '';
            sMudSeventhChoice := '';

            sDistanceTopChoice := '';
            sDistanceSecondChoice := '';
            sDistanceThirdChoice := '';
            sDistanceFourthChoice := '';
            sDistanceFifthChoice := '';
            sDistanceSixthChoice := '';
            sDistanceSeventhChoice := '';

            sTurfTopChoice := '';
            sTurfSecondChoice := '';
            sTurfThirdChoice := '';
            sTurfFourthChoice := '';
            sTurfFifthChoice := '';
            sTurfSixthChoice := '';
            sTurfSeventhChoice := '';

            sMaidenTopChoice := '';
            sMaidenSecondChoice := '';
            sMaidenThirdChoice := '';
            sMaidenFourthChoice := '';
            sMaidenFifthChoice := '';
            sMaidenSixthChoice := '';
            sMaidenSeventhChoice := '';

            sAWTopChoice := '';
            sAWSecondChoice := '';
            sAWThirdChoice := '';
            sAWFourthChoice := '';
            sAWFifthChoice := '';
            sAWSixthChoice := '';
            sAWSeventhChoice := '';

            sTrainerTopChoice := '';
            sTrainerSecondChoice := '';
            sTrainerThirdChoice := '';
            sTrainerFourthChoice := '';
            sTrainerFifthChoice := '';
            sTrainerSixthChoice := '';
            sTrainerSeventhChoice := '';

            sJockeyTopChoice := '';
            sJockeySecondChoice := '';
            sJockeyThirdChoice := '';
            sJockeyFourthChoice := '';
            sJockeyFifthChoice := '';
            sJockeySixthChoice := '';
            sJockeySeventhChoice := '';

            sOwnerTopChoice := '';
            sOwnerSecondChoice := '';
            sOwnerThirdChoice := '';
            sOwnerFourthChoice := '';
            sOwnerFifthChoice := '';
            sOwnerSixthChoice := '';
            sOwnerSeventhChoice := '';

            sTrainerJockeyTopChoice := '';
            sTrainerJockeySecondChoice := '';
            sTrainerJockeyThirdChoice := '';
            sTrainerJockeyFourthChoice := '';
            sTrainerJockeyFifthChoice := '';
            sTrainerJockeySixthChoice := '';
            sTrainerJockeySeventhChoice := '';


            sBackSpeedTopChoice := '';
            sBackSpeedSecondChoice := '';
            sBackSpeedThirdChoice := '';
            sBackSpeedFourthChoice := '';
            sBackSpeedFifthChoice := '';
            sBackSpeedSixthChoice := '';

            sBackClassTopChoice := '';
            sBackClassSecondChoice := '';
            sBackClassThirdChoice := '';
            sBackClassFourthChoice := '';
            sBackClassFifthChoice := '';
            sBackClassSixthChoice := '';

            sLastSpeedTopChoice := '';
            sLastSpeedSecondChoice := '';
            sLastSpeedThirdChoice := '';
            sLastSpeedFourthChoice := '';
            sLastSpeedFifthChoice := '';
            sLastSpeedSixthChoice := '';

            sAvgClassTopChoice := '';
            sAvgClassSecondChoice := '';
            sAvgClassThirdChoice := '';
            sAvgClassFourthChoice := '';
            sAvgClassFifthChoice := '';
            sAvgClassSixthChoice := '';

            sErlPaceTopChoice := '';
            sErlPaceSecondChoice := '';
            sErlPaceThirdChoice := '';
            sErlPaceFourthChoice := '';
            sErlPaceFifthChoice := '';
            sErlPaceSixthChoice := '';
            sErlPaceSeventhChoice := '';

            sMidPaceTopChoice := '';
            sMidPaceSecondChoice := '';
            sMidPaceThirdChoice := '';
            sMidPaceFourthChoice := '';
            sMidPaceFifthChoice := '';
            sMidPaceSixthChoice := '';
            sMidPaceSeventhChoice := '';

            sLatePaceTopChoice := '';
            sLatePaceSecondChoice := '';
            sLatePaceThirdChoice := '';
            sLatePaceFourthChoice := '';
            sLatePaceFifthChoice := '';
            sLatePaceSixthChoice := '';
            sLatePaceSeventhChoice := '';


            sErlPaceTopGap := '';
            sErlPaceSecondGap := '';
            sErlPaceThirdGap := '';
            sErlPaceFourthGap := '';
            sErlPaceFifthGap := '';
            sErlPaceSixthGap := '';
            sErlPaceSeventhGap := '';

            sMidPaceTopGap := '';
            sMidPaceSecondGap := '';
            sMidPaceThirdGap := '';
            sMidPaceFourthGap := '';
            sMidPaceFifthGap := '';
            sMidPaceSixthGap := '';
            sMidPaceSeventhGap := '';

            sLatePaceTopGap := '';
            sLatePaceSecondGap := '';
            sLatePaceThirdGap := '';
            sLatePaceFourthGap := '';
            sLatePaceFifthGap := '';
            sLatePaceSixthGap := '';
            sLatePaceSeventhGap := '';

            sErlPacePosTopChoice := '';
            sErlPacePosSecondChoice := '';
            sErlPacePosThirdChoice := '';
            sErlPacePosFourthChoice := '';
            sErlPacePosFifthChoice := '';
            sErlPacePosSixthChoice := '';
            sErlPacePosSeventhChoice := '';

            sMidPacePosTopChoice := '';
            sMidPacePosSecondChoice := '';
            sMidPacePosThirdChoice := '';
            sMidPacePosFourthChoice := '';
            sMidPacePosFifthChoice := '';
            sMidPacePosSixthChoice := '';
            sMidPacePosSeventhChoice := '';

            sLatePacePosTopChoice := '';
            sLatePacePosSecondChoice := '';
            sLatePacePosThirdChoice := '';
            sLatePacePosFourthChoice := '';
            sLatePacePosFifthChoice := '';
            sLatePacePosSixthChoice := '';
            sLatePacePosSeventhChoice := '';


            sErlPacePosTopGap := '';
            sErlPacePosSecondGap := '';
            sErlPacePosThirdGap := '';
            sErlPacePosFourthGap := '';
            sErlPacePosFifthGap := '';
            sErlPacePosSixthGap := '';
            sErlPacePosSeventhGap := '';
                    
            sMidPacePosTopGap := '';
            sMidPacePosSecondGap := '';
            sMidPacePosThirdGap := '';
            sMidPacePosFourthGap := '';
            sMidPacePosFifthGap := '';
            sMidPacePosSixthGap := '';
            sMidPacePosSeventhGap := '';

            sLatePacePosTopGap := '';
            sLatePacePosSecondGap := '';
            sLatePacePosThirdGap := '';
            sLatePacePosFourthGap := '';
            sLatePacePosFifthGap := '';
            sLatePacePosSixthGap := '';
            sLatePacePosSeventhGap := '';

            

            sPowerTopGap := '';
            sPowerSecondGap := '';
            sPowerThirdGap := '';
            sPowerFourthGap := '';
            sPowerFifthGap := '';
            sPowerSixthGap := '';
            sPowerSeventhGap := '';

            sTipChoice := '';
            sTopTri := '';
            sTopPk3 := '';
            sTopTurf := '';
            sTopMud := '';
            sTopPedigree := '';

            sTopTurfSire := '';
            sTopPedigreeSire := '';
            sTopTurfDamSire := '';
            sTopPedigreeDamSire := '';
            sTopTurfDam := '';
            sTopPedigreeDam := '';

            sKasperski := '';
            sMLFavorite := '';
            sTopJockey := '';
            sTopTrainer := '';
            sTopTJ := '';
            sSecondChoice := '';
            sThirdChoice := '';

            sEarlyPace := '';
            sMiddlePace := '';
            sLatePace := '';

            sEarlyPacePos := '';
            sMiddlePacePos := '';
            sLatePacePos := '';

            sHotTrainer := '';
            sHotJockey := '';

            sTrifecta := '';
            sTrifecta2 := '';
            sTrifecta3 := '';
            sTrifecta4 := '';

            sTriKey1 := '';
            sTriKey2 := '';

            sDD := '';
            sExacta := '';
            sTipSheet := '';
            sQuinella := '';
            sSuperfecta := '';

            sTri1st := '';
            sTri2nd := '';
            sTri3rd := '';
            sTri4th := '';
            sTri5th := '';
            sTri6th := '';
            sTri7th := '';

            sTriDoubleLiner := '';
            sTriGator := '';
            sTriDollar := '';
            sTriHotTrainer := '';
            sTriHotJockey := '';
            sTriTopJockey := '';
            sTriTopTrainer := '';
            sTriTopChoice := '';
            sTriSecondChoice := '';
            sTriThirdChoice := '';
            sTriMLFavorite := '';

            fWagerAmt := 0;
            fPlcWagerAmt := 0;
            fShoWagerAmt := 0;

            sWagerSelected1stChoice := '';
            sWagerSelected2ndChoice := '';
            sWagerSelected3rdChoice := '';
            sWagerSelected4thChoice := '';
            sWagerSelected5thChoice := '';
            sWagerSelected6thChoice := '';
            sWagerSelected7thChoice := '';
            sWagerSelected8thChoice := '';
            sWagerSelected9thChoice := '';

            // Get The Info
            if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
               tblE.IndexName := 'ByActualPrimary';
               tblE.SetKey();
               tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
               tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RangeRaceDate').AsDateTime;
               tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
               tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
               tblE.FieldByName('PostPos').AsInteger := 1;
            end else begin
               tblE.IndexName := '';
               tblE.SetKey();
               tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
               tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
               tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
               tblE.FieldByName('PostPos').AsInteger := 1;
            end;

            if (not tblE.GotoKey()) then begin
               tblE.IndexName := '';
               tblE.SetKey();
               tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
               tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
               tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
               tblE.FieldByName('PostPos').AsInteger := 1;
               tblE.GotoNearest();
            end;

            iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
            sTrkCode := tblE.FieldByName('TrkCode').AsString;

            iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
            sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

            while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
               sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;
               //                     if sTopOwner <> '' then begin
               //                        sTopOwner := sTopOwner + ',' + Trim(sProgramNbr);
               //                     end else begin
               //                        sTopOwner := Trim(sProgramNbr);
               //                     end;
               //                  end;
               //
               //                  if (tblE.FieldByName('IsSuperTrainer').AsBoolean) then begin
               //                     if sTopTrainer <> '' then begin
               //                        sTopTrainer := sTopTrainer + ',' + Trim(sProgramNbr);
               //                     end else begin
               //                        sTopTrainer := Trim(sProgramNbr);
               //                     end;
               //                  end;
               //
               //                  if (tblE.FieldByName('IsSuperJockey').AsBoolean) then begin
               //                     if sTopJockey <> '' then begin
               //                        sTopJockey := sTopJockey + ',' + Trim(sProgramNbr);
               //                     end else begin
               //                        sTopJockey := Trim(sProgramNbr);
               //                     end;
               //                  end;
               //
               //                  if (tblE.FieldByName('TotalTrnJkyWinPctRank').AsInteger = 1) then begin
               //                     sTopTJ := Trim(sProgramNbr);
               //                  end;
               //
               if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                  sMLFavorite := Trim(sProgramNbr);
               end;


               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  sEarlyPace := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  sMiddlePace := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  sLatePace := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  sEarlyPacePos := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  sMiddlePacePos := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                  sLatePacePos := Trim(sProgramNbr);
               end;

               

               //
               //                  if (tblE.FieldByName('TotalTrnOddsWinPctRank').AsInteger = 1) then begin
               //                     sTopTrainer := Trim(sProgramNbr);
               //                  end;
               //
               //                  if (tblE.FieldByName('TotalTrn30WinPctRank').AsInteger = 1) then begin
               //                     sHotTrainer := Trim(sProgramNbr);
               //                  end;
               //
               //                  if (tblE.FieldByName('TotalJky30WinPctRank').AsInteger = 1) then begin
               //                     sHotJockey := Trim(sProgramNbr);
               //                  end;
               //
               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                  sTodaysWagerTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 2) then begin
                  sTodaysWagerSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 3) then begin
                  sTodaysWagerThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 4) then begin
                  sTodaysWagerFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 5) then begin
                  sTodaysWagerFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 6) then begin
                  sTodaysWagerSixthChoice := Trim(sProgramNbr);
               end;



               //
               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  sTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 2) then begin
                  sSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 3) then begin
                  sThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 4) then begin
                  sFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 5) then begin
                  sFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 6) then begin
                  sSixthChoice := Trim(sProgramNbr);
               end;


               //
               if (tblE.FieldByName('MudRatingRank').AsInteger = 1) then begin
                  sMudTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 2) then begin
                  sMudSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 3) then begin
                  sMudThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 4) then begin
                  sMudFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 5) then begin
                  sMudFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 6) then begin
                  sMudSixthChoice := Trim(sProgramNbr);
               end;


               //
               if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                  sMaidenTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('ClassRatingRank').AsInteger = 2) then begin
                  sMaidenSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('ClassRatingRank').AsInteger = 3) then begin
                  sMaidenThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('ClassRatingRank').AsInteger = 4) then begin
                  sMaidenFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('ClassRatingRank').AsInteger = 5) then begin
                  sMaidenFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('ClassRatingRank').AsInteger = 6) then begin
                  sMaidenSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                  sTurfTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TurfRatingRank').AsInteger = 2) then begin
                  sTurfSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TurfRatingRank').AsInteger = 3) then begin
                  sTurfThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TurfRatingRank').AsInteger = 4) then begin
                  sTurfFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TurfRatingRank').AsInteger = 5) then begin
                  sTurfFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TurfRatingRank').AsInteger = 6) then begin
                  sTurfSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('AWRatingRank').AsInteger = 1) then begin
                  sAWTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AWRatingRank').AsInteger = 2) then begin
                  sAWSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AWRatingRank').AsInteger = 3) then begin
                  sAWThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AWRatingRank').AsInteger = 4) then begin
                  sAWFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AWRatingRank').AsInteger = 5) then begin
                  sAWFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AWRatingRank').AsInteger = 6) then begin
                  sAWSixthChoice := Trim(sProgramNbr);
               end;


               //
               if (tblE.FieldByName('MudRatingRank').AsInteger = 1) then begin
                  sMudTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 2) then begin
                  sMudSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 3) then begin
                  sMudThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 4) then begin
                  sMudFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 5) then begin
                  sMudFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MudRatingRank').AsInteger = 6) then begin
                  sMudSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 1) then begin
                  sDistanceTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 2) then begin
                  sDistanceSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 3) then begin
                  sDistanceThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 4) then begin
                  sDistanceFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 5) then begin
                  sDistanceFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('DistanceRatingRank').AsInteger = 6) then begin
                  sDistanceSixthChoice := Trim(sProgramNbr);
               end;


               //
               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                  sTrainerTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 2) then begin
                  sTrainerSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 3) then begin
                  sTrainerThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 4) then begin
                  sTrainerFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 5) then begin
                  sTrainerFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerRatingRank').AsInteger = 6) then begin
                  sTrainerSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 1) then begin
                  sJockeyTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 2) then begin
                  sJockeySecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 3) then begin
                  sJockeyThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 4) then begin
                  sJockeyFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 5) then begin
                  sJockeyFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('JockeyRatingRank').AsInteger = 6) then begin
                  sJockeySixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 1) then begin
                  sOwnerTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 2) then begin
                  sOwnerSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 3) then begin
                  sOwnerThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 4) then begin
                  sOwnerFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 5) then begin
                  sOwnerFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('OwnerRatingRank').AsInteger = 6) then begin
                  sOwnerSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                  sTrainerJockeyTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 2) then begin
                  sTrainerJockeySecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 3) then begin
                  sTrainerJockeyThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 4) then begin
                  sTrainerJockeyFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 5) then begin
                  sTrainerJockeyFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 6) then begin
                  sTrainerJockeySixthChoice := Trim(sProgramNbr);
               end;


               //
               if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                  sBackSpeedTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackSpeedRank').AsInteger = 2) then begin
                  sBackSpeedSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackSpeedRank').AsInteger = 3) then begin
                  sBackSpeedThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackSpeedRank').AsInteger = 4) then begin
                  sBackSpeedFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackSpeedRank').AsInteger = 5) then begin
                  sBackSpeedFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackSpeedRank').AsInteger = 6) then begin
                  sBackSpeedSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                  sBackClassTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackClassRank').AsInteger = 2) then begin
                  sBackClassSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackClassRank').AsInteger = 3) then begin
                  sBackClassThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackClassRank').AsInteger = 4) then begin
                  sBackClassFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackClassRank').AsInteger = 5) then begin
                  sBackClassFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('BackClassRank').AsInteger = 6) then begin
                  sBackClassSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                  sLastSpeedTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LastSpeedRank').AsInteger = 2) then begin
                  sLastSpeedSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LastSpeedRank').AsInteger = 3) then begin
                  sLastSpeedThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LastSpeedRank').AsInteger = 4) then begin
                  sLastSpeedFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LastSpeedRank').AsInteger = 5) then begin
                  sLastSpeedFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LastSpeedRank').AsInteger = 6) then begin
                  sLastSpeedSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                  sAvgClassTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AvgClassRank').AsInteger = 2) then begin
                  sAvgClassSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AvgClassRank').AsInteger = 3) then begin
                  sAvgClassThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AvgClassRank').AsInteger = 4) then begin
                  sAvgClassFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AvgClassRank').AsInteger = 5) then begin
                  sAvgClassFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('AvgClassRank').AsInteger = 6) then begin
                  sAvgClassSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  sErlPaceTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 2) then begin
                  sErlPaceSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 3) then begin
                  sErlPaceThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 4) then begin
                  sErlPaceFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 5) then begin
                  sErlPaceFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 6) then begin
                  sErlPaceSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  sMidPaceTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 2) then begin
                  sMidPaceSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 3) then begin
                  sMidPaceThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 4) then begin
                  sMidPaceFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 5) then begin
                  sMidPaceFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 6) then begin
                  sMidPaceSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  sLatePaceTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 2) then begin
                  sLatePaceSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 3) then begin
                  sLatePaceThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 4) then begin
                  sLatePaceFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 5) then begin
                  sLatePaceFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 6) then begin
                  sLatePaceSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 1) then begin
                  sErlPaceTopGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 2) then begin
                  sErlPaceSecondGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 3) then begin
                  sErlPaceThirdGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 4) then begin
                  sErlPaceFourthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 5) then begin
                  sErlPaceFifthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPaceRank').AsInteger = 6) then begin
                  sErlPaceSixthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPaceAdvantage').AsFloat);
               end;

               //
               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                  sMidPaceTopGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 2) then begin
                  sMidPaceSecondGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 3) then begin
                  sMidPaceThirdGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 4) then begin
                  sMidPaceFourthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 5) then begin
                  sMidPaceFifthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePaceRank').AsInteger = 6) then begin
                  sMidPaceSixthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePaceAdvantage').AsFloat);
               end;

               //
               if (tblE.FieldByName('LatePaceRank').AsInteger = 1) then begin
                  sLatePaceTopGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 2) then begin
                  sLatePaceSecondGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 3) then begin
                  sLatePaceThirdGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 4) then begin
                  sLatePaceFourthGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 5) then begin
                  sLatePaceFifthGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('LatePaceRank').AsInteger = 6) then begin
                  sLatePaceSixthGap := FormatFloat('#0.0', tblE.FieldByName('LatePaceAdvantage').AsFloat);
               end;

                              //
               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  sErlPacePosTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 2) then begin
                  sErlPacePosSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 3) then begin
                  sErlPacePosThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 4) then begin
                  sErlPacePosFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 5) then begin
                  sErlPacePosFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 6) then begin
                  sErlPacePosSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  sMidPacePosTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 2) then begin
                  sMidPacePosSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 3) then begin
                  sMidPacePosThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 4) then begin
                  sMidPacePosFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 5) then begin
                  sMidPacePosFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 6) then begin
                  sMidPacePosSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                  sLatePacePosTopChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 2) then begin
                  sLatePacePosSecondChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 3) then begin
                  sLatePacePosThirdChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 4) then begin
                  sLatePacePosFourthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 5) then begin
                  sLatePacePosFifthChoice := Trim(sProgramNbr);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 6) then begin
                  sLatePacePosSixthChoice := Trim(sProgramNbr);
               end;

               //
               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 1) then begin
                  sErlPacePosTopGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 2) then begin
                  sErlPacePosSecondGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 3) then begin
                  sErlPacePosThirdGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 4) then begin
                  sErlPacePosFourthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 5) then begin
                  sErlPacePosFifthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               if (tblE.FieldByName('EarlyPacePosRank').AsInteger = 6) then begin
                  sErlPacePosSixthGap := FormatFloat('#0.0', tblE.FieldByName('EarlyPacePos').AsFloat);
               end;

               //
               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 1) then begin
                  sMidPacePosTopGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 2) then begin
                  sMidPacePosSecondGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 3) then begin
                  sMidPacePosThirdGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 4) then begin
                  sMidPacePosFourthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 5) then begin
                  sMidPacePosFifthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               if (tblE.FieldByName('MiddlePacePosRank').AsInteger = 6) then begin
                  sMidPacePosSixthGap := FormatFloat('#0.0', tblE.FieldByName('MiddlePacePos').AsFloat);
               end;

               //
               if (tblE.FieldByName('LatePacePosRank').AsInteger = 1) then begin
                  sLatePacePosTopGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 2) then begin
                  sLatePacePosSecondGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 3) then begin
                  sLatePacePosThirdGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 4) then begin
                  sLatePacePosFourthGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 5) then begin
                  sLatePacePosFifthGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               if (tblE.FieldByName('LatePacePosRank').AsInteger = 6) then begin
                  sLatePacePosSixthGap := FormatFloat('#0.0', tblE.FieldByName('LatePacePos').AsFloat);
               end;

               //
               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  sPowerTopGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 2) then begin
                  sPowerSecondGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 3) then begin
                  sPowerThirdGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 4) then begin
                  sPowerFourthGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 5) then begin
                  sPowerFifthGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 6) then begin
                  sPowerSixthGap := FormatFloat('#0.0', tblE.FieldByName('PowerAdvantage').AsFloat);
               end;

               //
               if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                  bOwnWins := True;
               end else begin
                  bOwnWins := False;
               end;

               if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                  bOwnEarnings := True;
               end else begin
                  bOwnEarnings := False;
               end;

               if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                  bPowerRank := True;
               end else begin
                  bPowerRank := False;
               end;

               if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                  bBred := True;
               end else begin
                  bBred := False;
               end;

               //




           //    bOverlaySheetSelected := tblE.FieldByName('IsOverlaySheetSelected').AsBoolean;
               bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;

               //
               //                  if (((tblE.FieldByName('IsOverlaySheetSelected').AsBoolean) or
               //                     (tblE.FieldByName('IsDollar').AsBoolean) or
               //                     (tblE.FieldByName('IsDoubleDollar').AsBoolean)) and
               //                     (not tblE.FieldByName('IsWagerSheetSelected').AsBoolean)) then begin
               //                     sTipSheet := Trim(sProgramNbr);
               //                  end;


               tblE.Next();
               if (tblE.Eof) then begin
                  iRaceNbr := 0;
                  sTrkCode := '';
               end else begin
                  iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sTrkCode := tblE.FieldByName('TrkCode').AsString;
               end;
            end;


            // Start Pick stuff
            if ((tblR.FieldByName('IsDDLeg1').AsBoolean = True) or
               (tblR.FieldByName('IsPK3Leg1').AsBoolean = True) or
               (tblR.FieldByName('IsPk4Leg1').AsBoolean = True) or
               (tblR.FieldByName('IsPk6Leg1').AsBoolean = True)) then begin

               for iIdx := 1 to 100 do begin
                  aiLeg1[iIdx] := 0;
                  aiLeg2[iIdx] := 0;
                  aiLeg3[iIdx] := 0;
               end;

               //First Ticket
               //      if (tblE.FieldByName('IsTopOwnerSheetSelected').AsBoolean = True) then begin
               //      if (tblE.FieldByName('IsWagerSheetSelected').AsBoolean = True) then begin
               //      if still none then just single top choice
               if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                  tblE.IndexName := 'ByActualPrimary';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end else begin
                  tblE.IndexName := '';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end;

               if (tblE.GotoKey()) then begin
                  iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iCurrPk3Selection := 0;
                  iAltPk3Selection := 0;

                  while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                     sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                     //
                     if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                        bOwnWins := True;
                     end else begin
                        bOwnWins := False;
                     end;

                     if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                        bOwnEarnings := True;
                     end else begin
                        bOwnEarnings := False;
                     end;

                     if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                        bPowerRank := True;
                     end else begin
                        bPowerRank := False;
                     end;

                     if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                        bBred := True;
                     end else begin
                        bBred := False;
                     end;


                     bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                     bWagerSheetSelected := False;

                     if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                        (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                        if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblR.FieldByName('Surface').AsString = 'T') then begin
                        if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                        sAltWager1 := Trim(sProgramNbr);
                     end;

                     //                      bWagerSheetSelected := false;
                     //                      if (tblE.FieldByName('PowerRank').AsInteger = 1) then begin
                     //                          bWagerSheetSelected := true;
                     //                      end;
                     //                      if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                     //                           bWagerSheetSelected := true;
                     //                      end;
                     //                      if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                     //                          bWagerSheetSelected := true;
                     //                       end;

                                          // First one is
                     if sLeg1 <> '' then begin
                        if (bWagerSheetSelected) then begin

                           sLeg1 := sLeg1 + '-' + '(' + Trim(sProgramNbr) + ')';
                           fLeg1 := fLeg1 + 1;
                        end;
                     end else begin
                        if (bWagerSheetSelected) then begin
                           sLeg1 := '(' + Trim(sProgramNbr) + ')';
                           fLeg1 := 1;
                        end;
                     end;

                     tblE.Next();
                     if (tblE.Eof) then begin
                        iRaceNbr := 0;
                        sTrkCode := '';
                     end else begin
                        iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                        sTrkCode := tblE.FieldByName('TrkCode').AsString;
                     end;
                  end;
               end;


               if (sLeg1 = '') then begin
                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iCurrPk3Selection := 0;
                     iAltPk3Selection := 0;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;

                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;
                        //if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                        //   bWagerSheetSelected := false;
                        //end;
//
//                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
//                           bWagerSheetSelected := false;
//                        end;

                        if sLeg1 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg1 := sLeg1 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg1 := fLeg1 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg1 := '(' + Trim(sProgramNbr) + ')';
                              fLeg1 := 1;
                           end;
                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;
               end;


               // Second Ticket
               if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                  tblE.IndexName := 'ByActualPrimary';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 1;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end else begin
                  tblE.IndexName := '';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 1;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end;

               if (tblE.GotoKey()) then begin
                  iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iCurrPk3Selection := 0;
                  iAltPk3Selection := 0;

                  while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                     sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                     if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                        bOwnWins := True;
                     end else begin
                        bOwnWins := False;
                     end;

                     if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                        bOwnEarnings := True;
                     end else begin
                        bOwnEarnings := False;
                     end;

                     if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                        bPowerRank := True;
                     end else begin
                        bPowerRank := False;
                     end;

                     if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                        bBred := True;
                     end else begin
                        bBred := False;
                     end;

                     if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                        sAltWager2 := Trim(sProgramNbr);
                     end;

                     bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                     bWagerSheetSelected := False;

                     if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                        (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                        if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblR.FieldByName('Surface').AsString = 'T') then begin
                        if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     //if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                     //   bWagerSheetSelected := false;
                     //end;
//
//                     if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
//                        bWagerSheetSelected := false;
//                     end;

                     if sLeg2 <> '' then begin
                        if (bWagerSheetSelected) then begin
                           sLeg2 := sLeg2 + '-' + '(' + Trim(sProgramNbr) + ')';
                           fLeg2 := fLeg2 + 1;
                        end;
                     end else begin
                        if (bWagerSheetSelected) then begin
                           sLeg2 := '(' + Trim(sProgramNbr) + ')';
                           fLeg2 := 1;
                        end;
                     end;

                     tblE.Next();
                     if (tblE.Eof) then begin
                        iRaceNbr := 0;
                        sTrkCode := '';
                     end else begin
                        iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                        sTrkCode := tblE.FieldByName('TrkCode').AsString;
                     end;
                  end;
               end;

               if (sLeg2 = '') then begin
                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 1;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 1;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iCurrPk3Selection := 0;
                     iAltPk3Selection := 0;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;

                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        //if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                        //   bWagerSheetSelected := false;
                        //end;

                     //   if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
//                           bWagerSheetSelected := false;
//                        end;

                        if sLeg2 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg2 := sLeg2 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg2 := fLeg2 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg2 := '(' + Trim(sProgramNbr) + ')';
                              fLeg2 := 1;
                           end;
                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;
               end;

               // Third Ticket
               if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                  tblE.IndexName := 'ByActualPrimary';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 2;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end else begin
                  tblE.IndexName := '';
                  tblE.SetKey();
                  tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 2;
                  tblE.FieldByName('PostPos').AsInteger := 1;
               end;

               if (tblE.GotoKey()) then begin
                  iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                  sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                  iCurrPk3Selection := 0;
                  iAltPk3Selection := 0;

                  while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                     sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                     if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                        bOwnWins := True;
                     end else begin
                        bOwnWins := False;
                     end;

                     if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                        bOwnEarnings := True;
                     end else begin
                        bOwnEarnings := False;
                     end;

                     if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                        bPowerRank := True;
                     end else begin
                        bPowerRank := False;
                     end;

                     if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                        bBred := True;
                     end else begin
                        bBred := False;
                     end;

                     if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                        sAltWager3 := Trim(sProgramNbr);
                     end;

                     bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                     bWagerSheetSelected := False;

                     if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                        if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;
                     if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                        bWagerSheetSelected := True;
                     end;

                     if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                        (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                        if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     if (tblR.FieldByName('Surface').AsString = 'T') then begin
                        if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                     end;

                     //if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                     //   bWagerSheetSelected := false;
                     //end;

                 //    if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
//                        bWagerSheetSelected := false;
//                     end;
                     if sLeg3 <> '' then begin
                        if (bWagerSheetSelected) then begin
                           sLeg3 := sLeg3 + '-' + '(' + Trim(sProgramNbr) + ')';
                           fLeg3 := fLeg3 + 1;
                        end;
                     end else begin
                        if (bWagerSheetSelected) then begin
                           sLeg3 := '(' + Trim(sProgramNbr) + ')';
                           fLeg3 := 1;
                        end;
                     end;

                     tblE.Next();
                     if (tblE.Eof) then begin
                        iRaceNbr := 0;
                        sTrkCode := '';
                     end else begin
                        iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                        sTrkCode := tblE.FieldByName('TrkCode').AsString;
                     end;
                  end;
               end;


               if (sLeg3 = '') then begin
                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 2;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 2;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iCurrPk3Selection := 0;
                     iAltPk3Selection := 0;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;

                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;

                        //if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
                        //   bWagerSheetSelected := false;
                        //end;
//
//                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
//                           bWagerSheetSelected := false;
//                        end;

                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;
                        if sLeg3 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg3 := sLeg3 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg3 := fLeg3 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg3 := '(' + Trim(sProgramNbr) + ')';
                              fLeg3 := 1;
                           end;
                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;
               end;

               //4th Ticker
               if ((tblR.FieldByName('IsPk4Leg1').AsBoolean = True) or
                  (tblR.FieldByName('IsPk6Leg1').AsBoolean = True)) then begin
                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 3;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 3;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;

                        //
                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;


                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        //       if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
       //                           bWagerSheetSelected := false;
       //                        end;
       //
       //                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
       //                           bWagerSheetSelected := false;
       //                        end;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;
                        if sLeg4 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg4 := sLeg4 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg4 := fLeg4 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg4 := '(' + Trim(sProgramNbr) + ')';
                              fLeg4 := 1;
                           end;
                        end;

                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                           sAltWager4 := Trim(sProgramNbr);
                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;
               end;

               if (tblR.FieldByName('IsPk6Leg1').AsBoolean = True) then begin
                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 4;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 4;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;
                        //
                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;

                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;

                        //   if (tblE.FieldByName('MorningLineTo1Rank').AsInteger = 1) then begin
   //                           bWagerSheetSelected := false;
   //                        end;
   //
   //                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger > 4) then begin
   //                           bWagerSheetSelected := false;
   //                        end;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;
                        if sLeg5 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg5 := sLeg5 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg5 := fLeg5 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg5 := '(' + Trim(sProgramNbr) + ')';
                              fLeg5 := 1;
                           end;
                        end;

                        if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
                           sAltWager5 := Trim(sProgramNbr);
                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;

                  if ((UpperCase(tblE.TableName) = 'PREVDAYHH') or (UpperCase(tblE.TableName) = 'PREVWEEKHH')) then begin
                     tblE.IndexName := 'ByActualPrimary';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RangeRaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 5;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end else begin
                     tblE.IndexName := '';
                     tblE.SetKey();
                     tblE.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                     tblE.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                     tblE.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger + 5;
                     tblE.FieldByName('PostPos').AsInteger := 1;
                  end;

                  if (tblE.GotoKey()) then begin
                     iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sTrkCode := tblE.FieldByName('TrkCode').AsString;

                     iSaveRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                     sSaveTrkCode := tblE.FieldByName('TrkCode').AsString;

                     while (iRaceNbr = iSaveRaceNbr) and (sTrkCode = sSaveTrkCode) do begin
                        sProgramNbr := tblE.FieldByName('ProgramNbr').AsString;
                        //
                        if ((tblE.FieldByName('OwnWinsRank').AsInteger > 0) and (tblE.FieldByName('OwnWinsRank').AsInteger < 9999)) then begin
                           bOwnWins := True;
                        end else begin
                           bOwnWins := False;
                        end;

                        if ((tblE.FieldByName('OwnEarningsRank').AsInteger > 0) and (tblE.FieldByName('OwnEarningsRank').AsInteger < 9999)) then begin
                           bOwnEarnings := True;
                        end else begin
                           bOwnEarnings := False;
                        end;

                        if ((tblE.FieldByName('PowerRank').AsInteger >= 1) and (tblE.FieldByName('PowerRank').AsInteger <= 3)) then begin
                           bPowerRank := True;
                        end else begin
                           bPowerRank := False;
                        end;

                        if ((tblE.FieldByName('IsTurfBred').AsBoolean) or (tblE.FieldByName('Is1stBred').AsBoolean) or (tblE.FieldByName('Is2yoBred').AsBoolean)) then begin
                           bBred := True;
                        end else begin
                           bBred := False;
                        end;

                        bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;
                        bWagerSheetSelected := False;

                        if (tblE.FieldByName('IsValueWagerSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsSpeedSheetSelected').AsBoolean = True) then begin
                           if (tblE.FieldByName('MorningLineTo1Rank').AsInteger > 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblE.FieldByName('IsTrainerSheetSelected').AsBoolean = True) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('AvgClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackClassRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('LastSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;
                        if (tblE.FieldByName('BackSpeedRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('MiddlePaceRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if (tblE.FieldByName('TrainerJockeyRatingRank').AsInteger = 1) then begin
                           bWagerSheetSelected := True;
                        end;

                        if ((tblR.FieldByName('RaceType').AsString = 'MSW') or
                           (tblR.FieldByName('RaceType').AsString = 'MCL')) then begin
                           if (tblE.FieldByName('ClassRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;

                        if (tblR.FieldByName('Surface').AsString = 'T') then begin
                           if (tblE.FieldByName('TurfRatingRank').AsInteger = 1) then begin
                              bWagerSheetSelected := True;
                           end;
                        end;
                        if sLeg6 <> '' then begin
                           if (bWagerSheetSelected) then begin
                              sLeg6 := sLeg6 + '-' + '(' + Trim(sProgramNbr) + ')';
                              fLeg6 := fLeg6 + 1;
                           end;
                        end else begin
                           if (bWagerSheetSelected) then begin
                              sLeg6 := '(' + Trim(sProgramNbr) + ')';
                              fLeg6 := 1;
                           end;
                        end;

                        //                     if (tblE.FieldByName('FinalWinPctRank').AsInteger = 1) then begin
                        //                        sWager6 := Trim(sProgramNbr);
                        //                     end;
                       // if (tblE.FieldByName('TodaysWagerWinPctRank').AsInteger = 1) then begin
//                           sAltWager6 := Trim(sProgramNbr);
//                        end;

                        tblE.Next();
                        if (tblE.Eof) then begin
                           iRaceNbr := 0;
                           sTrkCode := '';
                        end else begin
                           iRaceNbr := tblE.FieldByName('RaceNbr').AsInteger;
                           sTrkCode := tblE.FieldByName('TrkCode').AsString;
                        end;
                     end;
                  end;
               end;

            end;

            //
            sLeg1 := FastReplace(sLeg1, '(', '');
            sLeg1 := FastReplace(sLeg1, ')', '');

            sLeg2 := FastReplace(sLeg2, '(', '');
            sLeg2 := FastReplace(sLeg2, ')', '');

            sLeg3 := FastReplace(sLeg3, '(', '');
            sLeg3 := FastReplace(sLeg3, ')', '');

            sLeg4 := FastReplace(sLeg4, '(', '');
            sLeg4 := FastReplace(sLeg4, ')', '');

            sLeg5 := FastReplace(sLeg5, '(', '');
            sLeg5 := FastReplace(sLeg5, ')', '');

            sLeg6 := FastReplace(sLeg6, '(', '');
            sLeg6 := FastReplace(sLeg6, ')', '');


            // Make sure each leg has at least one selection if none are wager selected .i.e Top Choice
            if (sLeg1 = '') then begin
               sLeg1 := sAltWager1;
            end;

            if (sLeg2 = '') then begin
               sLeg2 := sAltWager2;
            end;

            if (sLeg3 = '') then begin
               sLeg3 := sAltWager3;
            end;

            if (sLeg4 = '') then begin
               sLeg4 := sAltWager4;
            end;

            if (sLeg5 = '') then begin
               sLeg5 := sAltWager5;
            end;

            if (sLeg6 = '') then begin
               sLeg6 := sAltWager6;
            end;

            //
            fNbrStarters := tblR.FieldByName('NbrStarters').AsFloat;
            fNbrDebutStarters := tblR.FieldByName('NbrDebutStarters').AsFloat;
            fNbrDebutTwoStarters := tblR.FieldByName('NbrDebutTwoStarters').AsFloat;
            fNbrTurfDebutStarters := tblR.FieldByName('NbrTurfDebutStarters').AsFloat;
            fNbrRouteDebutStarters := tblR.FieldByName('NbrRouteDebutStarters').AsFloat;
            if (fNbrStarters > 0) then begin
               fPctOfDebutStarters := (fNbrDebutStarters / fNbrStarters) * 100;
            end else begin
               fPctOfDebutStarters := 0;
            end;

            tblR.Edit();

            tblR.FieldByName('Wager1').AsString := sWager1;
            tblR.FieldByName('Wager2').AsString := sWager2;
            tblR.FieldByName('Wager3').AsString := sWager3;
            tblR.FieldByName('Wager4').AsString := sWager4;
            tblR.FieldByName('Wager5').AsString := sWager5;
            tblR.FieldByName('Wager6').AsString := sWager6;


            //
            tblR.FieldByName('AltWager4').AsString := sWagerSelected1stChoice;
            tblR.FieldByName('AltWager5').AsString := sTodaysWagerTopChoice;

            tblR.FieldByName('DDWagerAmt').AsFloat := 0;
            tblR.FieldByName('DD').AsString := '';
            if (tblR.FieldByName('IsDDLeg1').AsBoolean) then begin
               if (sValue <> '') then begin
                  if (sLeg1 <> '') and (sLeg2 <> '') then begin
                     tblR.FieldByName('DD').AsString := sValue + 'W' + sLeg2;
                     tblR.FieldByName('DDWagerAmt').AsFloat := (fLeg1 * fLeg2) * 2.00;
                  end;
               end else begin
                  tblR.FieldByName('DD').AsString := sLeg1 + 'W' + sLeg2;
                  tblR.FieldByName('DDWagerAmt').AsFloat := (fLeg1 * fLeg2) * 2.00;
               end;
            end;
            tblR.FieldByName('DDFirstRace').AsString := tblR.FieldByName('DD').AsString;

            tblR.FieldByName('Pick3').AsString := '';
            tblR.FieldByName('PK3WagerAmt').AsFloat := 0;
            if (tblR.FieldByName('IsPK3Leg1').AsBoolean) then begin
               tblR.FieldByName('Pick3').AsString := sLeg1 + 'W' + sLeg2 + 'W' + sLeg3;
               tblR.FieldByName('Pk3WagerAmt').AsFloat := (fLeg1 * fLeg2 * fLeg3) * 2.00;
            end;
            tblR.FieldByName('Pick3FirstRace').AsString := tblR.FieldByName('Pick3').AsString;


            tblR.FieldByName('Pick4').AsString := '';
            tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;
            if (tblR.FieldByName('IsPK4Leg1').AsBoolean) then begin
               tblR.FieldByName('Pick4').AsString := sLeg1 + 'W' + sLeg2 + 'W' + sLeg3 + 'W' + sLeg4;
               tblR.FieldByName('Pk4WagerAmt').AsFloat := (fLeg1 * fLeg2 * fLeg3 * fLeg4) * 2.00;
            end;
            tblR.FieldByName('Pick4FirstRace').AsString := tblR.FieldByName('Pick4').AsString;

            if (tblR.FieldByName('IsPK6Leg1').AsBoolean) then begin
               tblR.FieldByName('Pick6').AsString := sLeg1 + 'W' + sLeg2 + 'W' + sLeg3 + 'W' + sLeg4 + 'W' + sLeg5 + 'W' + sLeg6;
               tblR.FieldByName('Pk6WagerAmt').AsFloat := (fLeg1 * fLeg2 * fLeg3 * fLeg4 * fLeg5 * fLeg6) * 1.00;
            end else begin
               tblR.FieldByName('Pk6WagerAmt').AsFloat := 0;
               tblR.FieldByName('Pick6').AsString := '';
            end;
            tblR.FieldByName('Pick6FirstRace').AsString := tblR.FieldByName('Pick6').AsString;


            sExacta := sTopChoice + '-' +
               sMaidenTopChoice + '-' +
               sTurfTopChoice + '-' +
               sTrainerTopChoice + '-' +
               sJockeyTopChoice + '-' +
               sOwnerTopChoice + '-' +
               sTrainerJockeyTopChoice + '-' +
               sErlPaceTopChoice + '-' +

            sMidPaceTopChoice + '-' +

            sLatePaceTopChoice;

            //
            //if (sValue <> '') then begin
            //   if (sTopChoice = sValue) then begin
            //      sTrifecta := sValue + 'W' + sSecondChoice + '-' + sThirdChoice;
            //
            //      tblR.FieldByName('TriWagerAmt').AsFloat := 2.00;
            //      tblR.FieldByName('SfcWagerAmt').AsFloat := 2.40;
            //   end else begin
            //      sTrifecta := sValue + 'W' + sTopChoice;
            //      iKeyBottomHorses := 1;
            //      if (sSecondChoice <> sValue) then begin
            //         sTrifecta := sTrifecta + '-' + sSecondChoice;
            //         Inc(iKeyBottomHorses);
            //      end;
            //      if (iKeyBottomHorses < 2) then begin
            //         sTrifecta := sTrifecta + '-' + sThirdChoice;
            //      end;
            //
                  //sSuperfecta := sValue + 'W' + sTopChoice;
                  //iKeyBottomHorses := 1;
                  //if (sSecondChoice <> sValue) then begin
                  //   sSuperfecta := sSuperfecta + '-' + sSecondChoice;
                  //   Inc(iKeyBottomHorses);
                  //end;
                  //if (iKeyBottomHorses < 4) then begin
                  //   if (sThirdChoice <> sValue) then begin
                  //      sSuperfecta := sSuperfecta + '-' + sThirdChoice;
                  //      Inc(iKeyBottomHorses);
                  //   end;
                  //end;
                  //if (iKeyBottomHorses < 4) then begin
                  //   if (sFourthChoice <> sValue) then begin
                  //      sSuperfecta := sSuperfecta + '-' + sFourthChoice;
                  //      Inc(iKeyBottomHorses);
                  //   end;
                  //end;
                  //if (iKeyBottomHorses < 4) then begin
                  //   if (sFifthChoice <> sValue) then begin
                  //      sSuperfecta := sSuperfecta + '-' + sFifthChoice;
                  //      Inc(iKeyBottomHorses);
                  //   end;
                  //end;
                  //tblR.FieldByName('TriWagerAmt').AsFloat := 2.00;
                  //tblR.FieldByName('SfcWagerAmt').AsFloat := 2.40;
            //   end;
            //end else begin
            //   sTrifecta := sTopChoice + 'W' + sSecondChoice + '-' + sThirdChoice;
            //   sSuperfecta := sTopChoice + 'W' + sSecondChoice + '-' + sThirdChoice + '-' + sFourthChoice + '-' + sFifthChoice;
            //   tblR.FieldByName('TriWagerAmt').AsFloat := 2.00;
            //   tblR.FieldByName('SfcWagerAmt').AsFloat := 2.40;
            //end;

            tblR.FieldByName('TriWagerAmt').AsFloat := 2.00;

            if (tblR.FieldByName('IsTriRace').AsBoolean) then begin
               tblR.FieldByName('Tri').AsString := sTrifecta;
            end else begin
               tblR.FieldByName('Tri').AsString := '';
               tblR.FieldByName('TriWagerAmt').AsFloat := 0;
            end;

            if (tblR.FieldByName('IsExaRace').AsBoolean) then begin
               tblR.FieldByName('Exacta').AsString := sExacta;
            end else begin
               tblR.FieldByName('Exacta').AsString := '';
               tblR.FieldByName('ExaWagerAmt').AsFloat := 0;
            end;

            if (tblR.FieldByName('IsQuiRace').AsBoolean) then begin
               tblR.FieldByName('Quinella').AsString := sQuinella;
            end else begin
               tblR.FieldByName('Quinella').AsString := '';
               tblR.FieldByName('QuiWagerAmt').AsFloat := 0;
            end;

            if (tblR.FieldByName('QuiWagerAmt').AsFloat > 0) then begin
               tblR.FieldByName('Exacta').AsString := '';
               tblR.FieldByName('ExaWagerAmt').AsFloat := 0;
            end;

            if (sValue <> '') then begin
               tblR.FieldByName('WPSWagerAmt').AsFloat := fWagerAmt;
            end else begin
               tblR.FieldByName('WPSWagerAmt').AsFloat := 0;
            end;

            //
            tblR.FieldByName('WagerSheetOrder').AsString := sTopChoice + '-' + sSecondChoice + '-' + sThirdChoice + '-' + sFourthChoice;
            tblR.FieldByName('ErlPaceSheetOrder').AsString := sErlPaceTopChoice + '-' + sErlPaceSecondChoice + '-' + sErlPaceThirdChoice + '-' + sErlPaceFourthChoice;
            tblR.FieldByName('MidPaceSheetOrder').AsString := sMidPaceTopChoice + '-' + sMidPaceSecondChoice + '-' + sMidPaceThirdChoice + '-' + sMidPaceFourthChoice;
            tblR.FieldByName('LatePaceSheetOrder').AsString := sLatePaceTopChoice + '-' + sLatePaceSecondChoice + '-' + sLatePaceThirdChoice + '-' + sLatePaceFourthChoice;

            tblR.FieldByName('ErlPacePosSheetOrder').AsString := sErlPacePosTopChoice + '-' + sErlPacePosSecondChoice + '-' + sErlPacePosThirdChoice + '-' + sErlPacePosFourthChoice;
            tblR.FieldByName('MidPacePosSheetOrder').AsString := sMidPacePosTopChoice + '-' + sMidPacePosSecondChoice + '-' + sMidPacePosThirdChoice + '-' + sMidPacePosFourthChoice;
            tblR.FieldByName('LatePacePosSheetOrder').AsString := sLatePacePosTopChoice + '-' + sLatePacePosSecondChoice + '-' + sLatePacePosThirdChoice + '-' + sLatePacePosFourthChoice;
            
            tblR.FieldByName('ErlPaceGapOrder').AsString := sErlPaceTopGap + '|' + sErlPaceSecondGap + '|' + sErlPaceThirdGap + '|' + sErlPaceFourthGap;
            tblR.FieldByName('MidPaceGapOrder').AsString := sMidPaceTopGap + '|' + sMidPaceSecondGap + '|' + sMidPaceThirdGap + '|' + sMidPaceFourthGap;
            tblR.FieldByName('LatePaceGapOrder').AsString := sLatePaceTopGap + '|' + sLatePaceSecondGap + '|' + sLatePaceThirdGap + '|' + sLatePaceFourthGap;

            tblR.FieldByName('ErlPacePosGapOrder').AsString := sErlPacePosTopGap + '|' + sErlPacePosSecondGap + '|' + sErlPacePosThirdGap + '|' + sErlPacePosFourthGap;
            tblR.FieldByName('MidPacePosGapOrder').AsString := sMidPacePosTopGap + '|' + sMidPacePosSecondGap + '|' + sMidPacePosThirdGap + '|' + sMidPacePosFourthGap;
            tblR.FieldByName('LatePacePosGapOrder').AsString := sLatePacePosTopGap + '|' + sLatePacePosSecondGap + '|' + sLatePacePosThirdGap + '|' + sLatePacePosFourthGap;
            
            tblR.FieldByName('PowerGapOrder').AsString := sPowerTopGap + '|' + sPowerSecondGap + '|' + sPowerThirdGap + '|' + sPowerFourthGap;

            tblR.FieldByName('TrainerSheetOrder').AsString := sTrainerTopChoice + '-' + sTrainerSecondChoice + '-' + sTrainerThirdChoice + '-' + sTrainerFourthChoice;
            tblR.FieldByName('JockeySheetOrder').AsString := sJockeyTopChoice + '-' + sJockeySecondChoice + '-' + sJockeyThirdChoice + '-' + sJockeyFourthChoice;
            tblR.FieldByName('OwnerSheetOrder').AsString := sOwnerTopChoice + '-' + sOwnerSecondChoice + '-' + sOwnerThirdChoice + '-' + sOwnerFourthChoice;
            tblR.FieldByName('TrainerJockeySheetOrder').AsString := sTrainerJockeyTopChoice + '-' + sTrainerJockeySecondChoice + '-' + sTrainerJockeyThirdChoice + '-' + sTrainerJockeyFourthChoice;

            tblR.FieldByName('MudSheetOrder').AsString := sMudTopChoice + '-' + sMudSecondChoice + '-' + sMudThirdChoice + '-' + sMudFourthChoice;
            tblR.FieldByName('AWSheetOrder').AsString := sAWTopChoice + '-' + sAWSecondChoice + '-' + sAWThirdChoice + '-' + sAWFourthChoice;
            tblR.FieldByName('TurfSheetOrder').AsString := sTurfTopChoice + '-' + sTurfSecondChoice + '-' + sTurfThirdChoice + '-' + sTurfFourthChoice;

            tblR.FieldByName('MaidenSheetOrder').AsString := sMaidenTopChoice + '-' + sMaidenSecondChoice + '-' + sMaidenThirdChoice + '-' + sMaidenFourthChoice;
            tblR.FieldByName('DistanceSheetOrder').AsString := sDistanceTopChoice + '-' + sDistanceSecondChoice + '-' + sDistanceThirdChoice + '-' + sDistanceFourthChoice;


            //
            tblR.FieldByName('WagerFinalOrder').AsString := sWagerSelected1stChoice + '-' +
               sWagerSelected2ndChoice + '-' +
               sWagerSelected3rdChoice + '-' +
               sWagerSelected4thChoice + '-' +
               sWagerSelected5thChoice + '-' +
               sWagerSelected6thChoice;

            tblR.FieldByName('TodaysWagerOrder').AsString := sTodaysWagerTopChoice + '-' +
               sTodaysWagerSecondChoice + '-' +
               sTodaysWagerThirdChoice + '-' +
               sTodaysWagerFourthChoice + '-' +
               sTodaysWagerFifthChoice + '-' +
               sTodaysWagerSixthChoice;

            if (CleanEntryNbrs(sWagerSelected1stChoice) = CleanEntryNbrs(sTodaysWagerTopChoice)) then begin

               for iIdx := 1 to 20 do begin
                  Exclude(iSuperSelections, iIdx);
                  Exclude(iSuperSelections, iIdx);
               end;

               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected2ndChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected2ndChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected3rdChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected3rdChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected4thChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected4thChoice)));
               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected5thChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected5thChoice)));
               //               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected6thChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected6thChoice)));
               //               end;


               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerSecondChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerSecondChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerThirdChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerThirdChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerFourthChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerFourthChoice)));
               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerFifthChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerFifthChoice)));
               //               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerSixthChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerSixthChoice)));
               //               end;


               Exclude(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerTopChoice)));
               Exclude(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected1stChoice)));

               sSuperfectaBottom := '';
               iNbrSelections := 0;
               for iIdx := 1 to 15 do begin
                  if iIdx in iSuperSelections then begin
                     sSuperfectaBottom := sSuperfectaBottom + IntToStr(iIdx) + '-';
                     Inc(iNbrSelections);
                  end;
               end;

               if (Length(sSuperfectaBottom) > 2) then begin
                  sSuperfectaBottom := LeftStr(sSuperfectaBottom, Length(sSuperfectaBottom) - 1);
               end;

               sSuperfecta := sWagerSelected1stChoice + 'W' + sSuperfectaBottom;
               case iNbrSelections of
                  3: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 12.00;
                     end;
                  4: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 48.00;
                     end;
                  5: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 120.00;
                     end;
                  6: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 240.00;
                     end;
                  7: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 420.00;
                     end;
                  8: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 672.00;
                     end;
                  9: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 1008.00;
                     end;
               else
                  tblR.FieldByName('SfcWagerAmt').AsFloat := 0.00;
               end;
            end else begin
               for iIdx := 1 to 20 do begin
                  Exclude(iSuperSelections, iIdx);
                  Exclude(iSuperSelections, iIdx);
               end;

               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected2ndChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected2ndChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected3rdChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected3rdChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected4thChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected4thChoice)));
               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected5thChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected5thChoice)));
               //               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sWagerSelected6thChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected6thChoice)));
               //               end;


               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerSecondChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerSecondChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerThirdChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerThirdChoice)));
               end;
               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerFourthChoice)) then begin
                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerFourthChoice)));
               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerFifthChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerFifthChoice)));
               //               end;
               //               if (CleanEntryNbrs(sWagerSelected1stChoice) <> CleanEntryNbrs(sTodaysWagerSixthChoice)) then begin
               //                  Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerSixthChoice)));
               //               end;

               Include(iSuperSelections, atoi(CleanEntryNbrs(sTodaysWagerTopChoice)));
               Include(iSuperSelections, atoi(CleanEntryNbrs(sWagerSelected1stChoice)));

               sSuperfectaBottom := '';
               iNbrSelections := 0;
               for iIdx := 1 to 15 do begin
                  if iIdx in iSuperSelections then begin
                     sSuperfectaBottom := sSuperfectaBottom + IntToStr(iIdx) + '-';
                     Inc(iNbrSelections);
                  end;
               end;

               if (Length(sSuperfectaBottom) > 2) then begin
                  sSuperfectaBottom := LeftStr(sSuperfectaBottom, Length(sSuperfectaBottom) - 1);
               end;

               sSuperfecta := sWagerSelected1stChoice + '-' + sTodaysWagerTopChoice + 'W' + sSuperfectaBottom;
               case iNbrSelections of
                  4: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 24.00;
                     end;
                  5: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 96.00;
                     end;
                  6: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 240.00;
                     end;
                  7: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 480.00;
                     end;
                  8: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 840.00;
                     end;
                  9: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 1344.00;
                     end;
                  10: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 2016.00;
                     end;
                  11: begin
                        tblR.FieldByName('SfcWagerAmt').AsFloat := 2880.00;
                     end;
               else
                  tblR.FieldByName('SfcWagerAmt').AsFloat := 0.00;

               end;

            end;

            if (tblR.FieldByName('IsSuperRace').AsBoolean) then begin
               tblR.FieldByName('Super').AsString := sSuperfecta;
               //   tblR.FieldByName('SfcWagerAmt').AsFloat := 120.00;
            end else begin
               tblR.FieldByName('Super').AsString := '';
               tblR.FieldByName('SfcWagerAmt').AsFloat := 0;
            end;


            //if (sValue <> '') then begin
            //   tblR.FieldByName('WagerSheetOrder').AsString := sValue;
            //end else begin
            //   tblR.FieldByName('WagerSheetOrder').AsString := sTopChoice;
           // end;

            //if (tblR.FieldByName('DDWagerAmt').AsFloat > 4.00) then begin
            //   tblR.FieldByName('DD').AsString := '';
            //   tblR.FieldByName('DDWagerAmt').AsFloat := 0;
            //end;
            //
            //if (tblR.FieldByName('TriWagerAmt').AsFloat > 4.00) then begin
            //   tblR.FieldByName('Tri').AsString := '';
            //   tblR.FieldByName('TriWagerAmt').AsFloat := 0;
            //end;
            //
            //if (tblR.FieldByName('Pk3WagerAmt').AsFloat > 4.00) then begin
            //   tblR.FieldByName('Pick3').AsString := '';
            //   tblR.FieldByName('Pk3WagerAmt').AsFloat := 0;
            //end;

            //if (tblR.FieldByName('Pk4WagerAmt').AsFloat > 4.00) then begin
            //   tblR.FieldByName('Pick4').AsString := '';
            //   tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;
            //end;
            //
            //
            //if ((fWagerAmt = 0) and (fPlcWagerAmt = 0) and (fShoWagerAmt = 0)) then begin
            //
            //   tblR.FieldByName('Quinella').AsString := '';
            //   tblR.FieldByName('QuiWagerAmt').AsFloat := 0;
            //
            //   tblR.FieldByName('Tri').AsString := '';
            //   tblR.FieldByName('TriWagerAmt').AsFloat := 0;
            //
            //   tblR.FieldByName('Super').AsString := '';
            //   tblR.FieldByName('SfcWagerAmt').AsFloat := 0;
            //
            //   tblR.FieldByName('DD').AsString := '';
            //   tblR.FieldByName('DDWagerAmt').AsFloat := 0;
            //
            //   tblR.FieldByName('Pick3').AsString := '';
            //   tblR.FieldByName('Pk3WagerAmt').AsFloat := 0;
            //
            //   tblR.FieldByName('Pick4').AsString := '';
            //   tblR.FieldByName('Pk4WagerAmt').AsFloat := 0;
            //end;


            //      tblR.FieldByName('Value').AsString := sValue;
            //      tblR.FieldByName('Chalk').AsString := sChalk;

            tblR.FieldByName('Wager1').AsString := sBackSpeedTopChoice + '-' + sBackSpeedSecondChoice + '-' + sBackSpeedThirdChoice + '-' + sBackSpeedFourthChoice;
            tblR.FieldByName('Wager2').AsString := sBackClassTopChoice + '-' + sBackClassSecondChoice + '-' + sBackClassThirdChoice + '-' + sBackClassFourthChoice;
            tblR.FieldByName('Wager3').AsString := sLastSpeedTopChoice + '-' + sLastSpeedSecondChoice + '-' + sLastSpeedThirdChoice + '-' + sLastSpeedFourthChoice;
            tblR.FieldByName('Wager4').AsString := sAvgClassTopChoice + '-' + sAvgClassSecondChoice + '-' + sAvgClassThirdChoice + '-' + sAvgClassFourthChoice;
            tblR.FieldByName('Wager5').AsString := sWager5;
            tblR.FieldByName('Wager6').AsString := sWager6;
            tblR.Post();


            if (sTopChoice <> '') then begin
               tblP.IndexName := '';
               tblP.SetKey();
               tblP.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
               tblP.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
               tblP.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;
               if not tblP.GotoKey() then begin
                  tblP.Append();
                  tblP.FieldByName('TrkCode').AsString := tblR.FieldByName('TrkCode').AsString;
                  tblP.FieldByName('RaceDate').AsDateTime := tblR.FieldByName('RaceDate').AsDateTime;
                  tblP.FieldByName('RaceNbr').AsInteger := tblR.FieldByName('RaceNbr').AsInteger;

                  tblP.FieldByName('FinalOrder').AsString := tblR.FieldByName('WagerFinalOrder').AsString;

                  if (sValue <> '') then begin
                     tblP.FieldByName('Value').AsString := sValue;
                     tblP.FieldByName('WagerAmt').AsFloat := fWagerAmt;
                     tblP.FieldByName('PlcWagerAmt').AsFloat := fPlcWagerAmt;
                     tblP.FieldByName('ShoWagerAmt').AsFloat := fShoWagerAmt;
                  end;

                  if (sChalk <> '') then begin
                     tblP.FieldByName('Chalk').AsString := sChalk;
                  end;

                  if (tblR.FieldByName('Tri').AsString <> '') then begin
                     tblP.FieldByName('Tri').AsString := tblR.FieldByName('Tri').AsString;
                     tblP.FieldByName('Tri2').AsString := sTrifecta2;
                     tblP.FieldByName('Tri3').AsString := sTrifecta3;
                     tblP.FieldByName('Tri4').AsString := sTrifecta4;
                  end;

                  if (sExacta <> '') then begin
                     tblP.FieldByName('Exacta').AsString := sExacta;
                  end;

                  if (tblR.FieldByName('Super').AsString <> '') then begin
                     tblP.FieldByName('Super').AsString := tblR.FieldByName('Super').AsString;
                  end;

                  tblP.FieldByName('Wager1').AsString := tblR.FieldByName('Pick3').AsString;
                  tblP.FieldByName('Wager2').AsString := tblR.FieldByName('Pick4').AsString;
                  tblP.FieldByName('Wager3').AsString := tblR.FieldByName('Pick6').AsString;

                  tblP.FieldByName('AltWager1').AsString := tblR.FieldByName('DD').AsString;
                  tblP.FieldByName('AltWager2').AsString := sAltWager2;
                  tblP.FieldByName('AltWager3').AsString := sAltWager3;


                  tblP.FieldByName('DoubleDot').AsString := sDoubleDot;
                  tblP.FieldByName('DoubleLiner').AsString := sDoubleLiner;

                  tblP.FieldByName('DoubleDollar').AsString := sDoubleDollar;
                  tblP.FieldByName('Dollar').AsString := sDollar;
                  tblP.FieldByName('NoDollar').AsString := sNoDollar;
                  tblP.FieldByName('TopPk3').AsString := sTopPk3;
                  tblP.FieldByName('TopTri').AsString := sTopTri;

                  tblP.FieldByName('TopTurf').AsString := sTopTurf;
                  tblP.FieldByName('TopMud').AsString := sTopMud;
                  tblP.FieldByName('TopPedigree').AsString := sTopPedigree;

                  tblP.FieldByName('Cole').AsString := sCole;
                  tblP.FieldByName('Ash').AsString := sAsh;
                  tblP.FieldByName('Dana').AsString := sDana;
                  tblP.FieldByName('Cora').AsString := sCora;

                  tblP.FieldByName('HotTrainer').AsString := sHotTrainer;
                  tblP.FieldByName('HotJockey').AsString := sHotJockey;

                  tblP.FieldByName('Kasperski').AsString := sKasperski;
                  tblP.FieldByName('MLFavorite').AsString := sMLFavorite;

                  tblP.FieldByName('TopJockey').AsString := sTopJockey;
                  tblP.FieldByName('TopTrainer').AsString := sTopTrainer;
                  tblP.FieldByName('TopOwner').AsString := sTopOwner;

                  tblP.FieldByName('TopTJ').AsString := sTopTJ;

                  tblP.FieldByName('TopChoice').AsString := sTopChoice;
                  tblP.FieldByName('SecondChoice').AsString := sSecondChoice;
                  tblP.FieldByName('ThirdChoice').AsString := sThirdChoice;

                  tblP.FieldByName('EarlyPace').AsString := sEarlyPace;
                  tblP.FieldByName('MiddlePace').AsString := sMiddlePace;
                  tblP.FieldByName('LatePace').AsString := sLatePace;

                  tblP.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;
                  tblP.FieldByName('EstTimeOfFirstRace').Value := tblR.FieldByName('EstTimeOfFirstRace').Value;
                  tblP.FieldByName('LocalTimeOfRace').Value := tblR.FieldByName('LocalTimeOfRace').Value;

                  tblP.Post();
               end
               else begin
                  tblP.Edit();

                  tblP.FieldByName('FinalOrder').AsString := tblR.FieldByName('WagerFinalOrder').AsString;

                  if (sValue <> '') then begin
                     tblP.FieldByName('Value').AsString := sValue;
                     tblP.FieldByName('WagerAmt').AsFloat := fWagerAmt;
                     tblP.FieldByName('PlcWagerAmt').AsFloat := fPlcWagerAmt;
                     tblP.FieldByName('ShoWagerAmt').AsFloat := fShoWagerAmt;
                  end;

                  if (sChalk <> '') then begin
                     tblP.FieldByName('Chalk').AsString := sChalk;
                  end;

                  if (tblR.FieldByName('Tri').AsString <> '') then begin
                     tblP.FieldByName('Tri').AsString := tblR.FieldByName('Tri').AsString;
                     tblP.FieldByName('Tri2').AsString := sTrifecta2;
                     tblP.FieldByName('Tri3').AsString := sTrifecta3;
                     tblP.FieldByName('Tri4').AsString := sTrifecta4;
                  end;

                  if (sExacta <> '') then begin
                     tblP.FieldByName('Exacta').AsString := sExacta;
                  end;

                  if (tblR.FieldByName('Super').AsString <> '') then begin
                     tblP.FieldByName('Super').AsString := tblR.FieldByName('Super').AsString;
                  end;

                  tblP.FieldByName('Wager1').AsString := tblR.FieldByName('Pick3').AsString;
                  tblP.FieldByName('Wager2').AsString := tblR.FieldByName('Pick4').AsString;
                  tblP.FieldByName('Wager3').AsString := tblR.FieldByName('Pick6').AsString;

                  tblP.FieldByName('AltWager1').AsString := tblR.FieldByName('DD').AsString;
                  tblP.FieldByName('AltWager2').AsString := sAltWager2;
                  tblP.FieldByName('AltWager3').AsString := sAltWager3;


                  tblP.FieldByName('DoubleDot').AsString := sDoubleDot;
                  tblP.FieldByName('DoubleLiner').AsString := sDoubleLiner;
                  tblP.FieldByName('DoubleDollar').AsString := sDoubleDollar;
                  tblP.FieldByName('Dollar').AsString := sDollar;
                  tblP.FieldByName('NoDollar').AsString := sNoDollar;
                  tblP.FieldByName('TopPk3').AsString := sTopPk3;
                  tblP.FieldByName('TopTri').AsString := sTopTri;

                  tblP.FieldByName('TopTurf').AsString := sTopTurf;
                  tblP.FieldByName('TopMud').AsString := sTopMud;
                  tblP.FieldByName('TopPedigree').AsString := sTopPedigree;
                  tblP.FieldByName('TopOwner').AsString := sTopOwner;

                  tblP.FieldByName('Cole').AsString := sCole;
                  tblP.FieldByName('Ash').AsString := sAsh;
                  tblP.FieldByName('Dana').AsString := sDana;
                  tblP.FieldByName('Cora').AsString := sCora;

                  tblP.FieldByName('HotTrainer').AsString := sHotTrainer;
                  tblP.FieldByName('HotJockey').AsString := sHotJockey;

                  tblP.FieldByName('Kasperski').AsString := sKasperski;
                  tblP.FieldByName('MLFavorite').AsString := sMLFavorite;

                  tblP.FieldByName('TopJockey').AsString := sTopJockey;
                  tblP.FieldByName('TopTrainer').AsString := sTopTrainer;
                  tblP.FieldByName('TopTJ').AsString := sTopTJ;

                  tblP.FieldByName('TopChoice').AsString := sTopChoice;
                  tblP.FieldByName('SecondChoice').AsString := sSecondChoice;
                  tblP.FieldByName('ThirdChoice').AsString := sThirdChoice;

                  tblP.FieldByName('EarlyPace').AsString := sEarlyPace;
                  tblP.FieldByName('MiddlePace').AsString := sMiddlePace;
                  tblP.FieldByName('LatePace').AsString := sLatePace;

                  tblP.FieldByName('EstTimeOfRace').Value := tblR.FieldByName('EstTimeOfRace').Value;
                  tblP.FieldByName('EstTimeOfFirstRace').Value := tblR.FieldByName('EstTimeOfFirstRace').Value;
                  tblP.FieldByName('LocalTimeOfRace').Value := tblR.FieldByName('LocalTimeOfRace').Value;

                  tblP.Post();
               end;
            end;

            tblR.Next();

         end;

      except
         on E: Exception do begin
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback;
            end;
            hLog.AddToLog(E.Message, msevException);
         end;
      end;

      //Start
      try

         InitPrgBar(tblE.RecordCount);
         tblE.First();
         if not dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.StartTransaction;
         end;
         while not tblE.Eof do begin
            UpdateStatusBar('Clearing Choices');
            IncPrgBar();
            Application.ProcessMessages();
            //
            //
            //            if ((tblE.FieldByName('ShoWagerAmt').AsFloat) > 0) then begin
            //               fShoWagerAmt := tblE.FieldByName('ShoWagerAmt').AsFloat;
            //            end;
            //
            //            if ((tblE.FieldByName('PlcWagerAmt').AsFloat) > 0) then begin
            //               fPlcWagerAmt := tblE.FieldByName('PlcWagerAmt').AsFloat;
            //            end;
            //
            //            if ((tblE.FieldByName('WagerAmt').AsFloat) > 0) then begin
            //               fWagerAmt := tblE.FieldByName('WagerAmt').AsFloat;
            //            end;
            //
            //            bWagerSheetSelected := tblE.FieldByName('IsWagerSheetSelected').AsBoolean;

                        //if (bWagerSheetSelected) then begin
                        //
                        //   tblR.IndexName := '';
                        //   tblR.SetKey();
                        //   tblR.FieldByName('TrkCode').Value := tblE.FieldByName('TrkCode').Value;
                        //   tblR.FieldByName('RaceDate').Value := tblE.FieldByName('RaceDate').Value;
                        //   tblR.FieldByName('RaceNbr').Value := tblE.FieldByName('RaceNbr').Value;
                           //if tblR.GotoKey() then begin
                           //
                           //   tblE.Edit();
                           //
                           //   //if tblR.FieldByName('SfcWagerAmt').AsFloat > 0 then begin
                           //   //   fWagerAmt := fWagerAmt + 3;
                           //   //end;
                           //   //
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('QuiWagerAmt').AsFloat;
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('ExaWagerAmt').AsFloat;
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('TriWagerAmt').AsFloat;
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('DDWagerAmt').AsFloat;
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('Pk3WagerAmt').AsFloat;
                           //   //fWagerAmt := fWagerAmt + tblR.FieldByName('Pk4WagerAmt').AsFloat;
                           //   //
                           //   //tblE.FieldByName('WagerAmt').AsFloat := fWagerAmt;
                           //   //tblE.FieldByName('PlcWagerAmt').AsFloat := fWagerAmt;
                           //   //tblE.FieldByName('ShoWagerAmt').AsFloat := fWagerAmt;
                           //   tblE.Post();
                           //end;
                        //end;

            tblE.Next();
         end;
      except
         if dm.dbSireRate.InTransaction then begin
            dm.dbSireRate.Rollback;
         end;
         ClearPrgStatusBars();
      end;
      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;

   finally

      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Commit;
      end;
      CloseTable(tblR);
      CloseTable(tblE);
      CloseTable(tblP);

      ClearPrgStatusBars();
   end;



end;

end.

