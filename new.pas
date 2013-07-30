unit new;

interface

   procedure CreateTables(CreateDatabaseName: string);

implementation

{$IFDEF VER170}
uses Forms, Classes, DB, DBISAMTb, SysUtils, Variants;
{$ENDIF}
{$IFDEF VER150}
uses Forms, Classes, DB, DBISAMTb, SysUtils, Variants;
{$ENDIF}
{$IFDEF VER140}
uses Forms, Classes, DB, DBISAMTb, SysUtils, Variants;
{$ENDIF}
{$IFDEF VER130}
uses Forms, Classes, DB, DBISAMTb, SysUtils;
{$ENDIF}

procedure CreateTables(CreateDatabaseName: string);
var
   TableToCreate: TDBISAMTable;
begin
   TableToCreate:=TDBISAMTable.Create(Application);
   try
      with TableToCreate do
         begin
         DatabaseName:=CreateDatabaseName;
         TableName:='horsehistory';
         Exclusive:=True;
         if (not Exists) then
            begin
            with FieldDefs do
               begin
               Clear;
               Add('TrkCode',ftString,3,True,'0');
               Add('RaceDate',ftDate,0,True);
               Add('RaceNbr',ftSmallint,0,True);
               Add('PostPos',ftSmallint,0,True);
               Add('RangeRaceDate',ftDate);
               Add('RaceType',ftString,10,False,'UNK');
               Add('TypeOfRace',ftString,1,False,'T');
               Add('Surface',ftString,1,False,'D');
               Add('TrkCond',ftString,2,False,'FT');
               Add('DistanceInFurlongs',ftFloat,0,False,'0');
               Add('Purse',ftFloat,0,False,'0');
               Add('ClaimingPrice',ftFloat,0,False,'0');
               Add('ProgramNbr',ftString,10);
               Add('ProgramNbrSort',ftSmallint,0,False,'0');
               Add('MorningLineDesc',ftString,6);
               Add('MorningLineTo1',ftFloat,0,False,'0');
               Add('MorningLineWinPct',ftFloat,0,False,'0');
               Add('MorningLineTo1Rank',ftSmallint,0,False,'0');
               Add('FinishPos',ftSmallint,0,False,'0');
               Add('Odds',ftFloat,0,False,'0');
               Add('HorseName',ftString,25);
               Add('HorseNbr',ftSmallint,0,False,'0');
               Add('Trainer',ftString,30);
               Add('Jockey',ftString,30);
               Add('Owner',ftString,30);
               Add('Sire',ftString,25);
               Add('DamSire',ftString,25);
               Add('Dam',ftString,25);
               Add('Breeder',ftString,70);
               Add('Sex',ftString,1);
               Add('Age',ftSmallint,0,False,'0');
               Add('Equip',ftString,10);
               Add('Med',ftString,5);
               Add('IsFirstTimeJuice',ftBoolean,0,False,'False');
               Add('IsDebut',ftBoolean,0,False,'False');
               Add('IsDebutTwo',ftBoolean,0,False,'False');
               Add('IsDebutThird',ftBoolean,0,False,'False');
               Add('IsTurfDebut',ftBoolean,0,False,'False');
               Add('DebutIndicator',ftString,2);
               Add('TurfIndicator',ftString,2);
               Add('MudIndicator',ftString,2);
               Add('RouteIndicator',ftString,2);
               Add('DaysLast',ftSmallint,0,False,'0');
               Add('BredIn',ftString,6);
               Add('LastSpeed',ftSmallint,0,False,'0');
               Add('LastSpeedRank',ftSmallint,0,False,'0');
               Add('Power',ftFloat,0,False,'0');
               Add('PowerRank',ftSmallint,0,False,'0');
               Add('BackSpeed',ftSmallint,0,False,'0');
               Add('BackSpeedRank',ftSmallint,0,False,'0');
               Add('EarlyPace',ftFloat,0,False,'0');
               Add('EarlyPaceRank',ftSmallint,0,False,'0');
               Add('EarlyPacePos',ftFloat,0,False,'9999');
               Add('EarlyPacePosRank',ftSmallint,0,False,'0');
               Add('MiddlePace',ftFloat,0,False,'0');
               Add('MiddlePaceRank',ftSmallint,0,False,'0');
               Add('MiddlePacePos',ftFloat,0,False,'9999');
               Add('MiddlePacePosRank',ftSmallint,0,False,'0');
               Add('LatePace',ftFloat,0,False,'0');
               Add('LatePaceRank',ftSmallint,0,False,'0');
               Add('LatePacePos',ftFloat,0,False,'9999');
               Add('LatePacePosRank',ftSmallint,0,False,'0');
               Add('FinishPacePos',ftFloat,0,False,'0');
               Add('FinishPacePosRank',ftSmallint,0,False,'0');
               Add('IsFrontDoubleLiner0',ftBoolean,0,False,'False');
               Add('IsFrontDoubleLiner1',ftBoolean,0,False,'False');
               Add('IsFrontDoubleLiner2',ftBoolean,0,False,'False');
               Add('IsFrontDoubleLiner3',ftBoolean,0,False,'False');
               Add('IsBackDoubleLiner0',ftBoolean,0,False,'False');
               Add('IsBackDoubleLiner1',ftBoolean,0,False,'False');
               Add('IsBackDoubleLiner2',ftBoolean,0,False,'False');
               Add('IsBackDoubleLiner3',ftBoolean,0,False,'False');
               Add('IsTripleLiner0',ftBoolean,0,False,'False');
               Add('IsTripleLiner1',ftBoolean,0,False,'False');
               Add('IsTripleLiner2',ftBoolean,0,False,'False');
               Add('IsTripleLiner3',ftBoolean,0,False,'False');
               Add('IsFrontDoubleLiner',ftBoolean,0,False,'False');
               Add('IsBackDoubleLiner',ftBoolean,0,False,'False');
               Add('IsTripleDot',ftBoolean,0,False,'False');
               Add('IsFrontDoubleDot',ftBoolean,0,False,'False');
               Add('IsBackDoubleDot',ftBoolean,0,False,'False');
               Add('IsTripleLiner',ftBoolean,0,False,'False');
               Add('IsBlinkersOn',ftBoolean,0,False,'False');
               Add('IsBlinkersOff',ftBoolean,0,False,'False');
               Add('LastEquip',ftString,7);
               Add('EstTimeOfRace',ftTime);
               Add('Entry',ftString,5);
               Add('Weight',ftSmallint);
               Add('QSPRunStyle',ftString,3);
               Add('QSP1stCall',ftSmallint);
               Add('QSP1stCallRank',ftSmallint);
               Add('QSP2ndCall',ftSmallint);
               Add('QSP2ndCallRank',ftSmallint);
               Add('KSP1stCall',ftInteger);
               Add('KSP1stCallRank',ftSmallint);
               Add('KSP2ndCall',ftSmallint);
               Add('KSP2ndCallRank',ftSmallint);
               Add('TrnEarningsRank',ftSmallint,0,False,'0');
               Add('TrnWinsRank',ftSmallint,0,False,'0');
               Add('TrnTrackRank',ftSmallint,0,False,'0');
               Add('JkyWinsRank',ftSmallint,0,False,'0');
               Add('JkyEarningsRank',ftSmallint,0,False,'0');
               Add('JkyTrackRank',ftSmallint,0,False,'0');
               Add('OwnWinsRank',ftSmallint,0,False,'0');
               Add('OwnEarningsRank',ftSmallint,0,False,'0');
               Add('ValueROI',ftFloat,0,False,'0');
               Add('ValueROICnt',ftSmallint,0,False,'0');
               Add('DollarCnt',ftSmallint,0,False,'0');
               Add('PowerAdvantageKey',ftInteger,0,False,'0');
               Add('PowerAdvantage',ftFloat);
               Add('EarlyPaceAdvantage',ftFloat);
               Add('MiddlePaceAdvantage',ftFloat);
               Add('LatePaceAdvantage',ftFloat);
               Add('ElimWinPct',ftFloat,0,False,'0');
               Add('Elim2WinPct',ftFloat,0,False,'0');
               Add('TodaysWagerWinPct',ftFloat,0,False,'0');
               Add('TodaysWagerValueBet',ftFloat,0,False,'0');
               Add('PaceIndicatorWinPct',ftFloat);
               Add('PowerAdvantageWinPct',ftFloat);
               Add('EarlyPaceAdvantageWinPct',ftFloat);
               Add('EarlyPaceAdvantageValueBet',ftFloat);
               Add('MiddlePaceAdvantageWinPct',ftFloat);
               Add('MiddlePaceAdvantageValueBet',ftFloat);
               Add('IsHeavyChalk',ftBoolean,0,False,'False');
               Add('IsPrintedOnValueSheet',ftBoolean,0,False,'False');
               Add('b3',ftBoolean);
               Add('b4',ftBoolean);
               Add('b5',ftBoolean);
               Add('b6',ftBoolean);
               Add('b7',ftBoolean);
               Add('f1',ftFloat);
               Add('f2',ftFloat);
               Add('f3',ftFloat);
               Add('f4',ftFloat);
               Add('f5',ftFloat);
               Add('f6',ftFloat);
               Add('f7',ftFloat);
               Add('f8',ftFloat);
               Add('s1',ftSmallint);
               Add('s2',ftSmallint);
               Add('s3',ftSmallint);
               Add('s4',ftSmallint);
               Add('s5',ftSmallint);
               Add('i1',ftInteger);
               Add('I2',ftInteger);
               Add('I3',ftInteger);
               Add('I4',ftInteger);
               Add('I5',ftInteger);
               end;
            with IndexDefs do
               begin
               Clear;
               Add('','TrkCode;RaceDate;RaceNbr;PostPos',[ixPrimary,ixUnique],'',icFull);
               Add('ByRaceDate','RangeRaceDate;RaceDate',[],'',icFull);
               Add('ByHorseName','RangeRaceDate;HorseName',[],'',icFull);
               Add('ByProgramNbr','RangeRaceDate;TrkCode;RaceDate;RaceNbr;ProgramNbr',[],'',icFull);
               Add('ByRaceDateTrkCode','RangeRaceDate;RaceDate;TrkCode;RaceNbr;PostPos',[],'',icFull);
               Add('ByRangeRaceDate','RangeRaceDate;RaceDate;TrkCode;RaceDate;RaceNbr;PostPos',[],'',icFull);
               Add('ByOdds','RangeRaceDate;Odds',[],'',icFull);
               Add('ByFinishPos','RangeRaceDate;FinishPos',[],'',icFull);
               Add('BySurfaceOrder','RangeRaceDate;Surface;TrkCode',[],'',icFull);
               Add('ByTrkCondOrder','RangeRaceDate;TrkCond;TrkCode',[],'',icFull);
               end;
            CreateTable(0,4,0,False,'','Horse History',16384,512,0)
            end;
         end;
   finally
      TableToCreate.Free;
   end;
end;

end.
