SELECT
TrkCode as Track, 
RaceDate, 
RaceNbr, 
PostPos As Post,  
RaceType As Class, 
DebutIndicator,
TurfIndicator, 
Sex,
Age,
FinishPos,
MorningLineTo1 as ML, 
Odds, 
IF (LifeStarts = 0, 'Yes','No') AS Is1stStart,
IF (LifeStarts = 1, 'Yes','No') AS Is2ndStart,
IF (TurfStarts = 0, 'Yes','No') AS Is1stTurfStart,
IF (TurfStarts = 1, 'Yes','No') AS Is2ndTurfStart,
IF (Surface = 'T', 'Turf', 'Dirt') AS Surface,
IF (Odds < MorningLineTo1, 'Yes','No') AS OddsLessML,                                                     
IF (Odds > 0 and Odds <= 1, 'Yes','No') AS OddsGt0To1,
IF (Odds > 1 and Odds <= 2, 'Yes','No') AS OddsGt1To2,
IF (Odds > 2 and Odds <= 4, 'Yes','No') AS OddsGt2LessEq4,
IF (Odds > 4 and Odds <= 10, 'Yes','No') AS OddsGt4LessEq10,
IF (Odds > 10 and Odds <= 20, 'Yes','No') AS OddsGt10LessEq20,
IF (Odds > 20 and Odds <= 30, 'Yes','No') AS OddsGt20LessEq30,
IF (Odds > 30 and Odds <= 40, 'Yes','No') AS OddsGt30LessEq40,
IF (Odds > 40 and Odds <= 50, 'Yes','No') AS OddsGt40LessEq50,
IF (Odds > 50, 'Yes','No') AS OddsGt50,
IF (MorningLineTo1 > 0 and MorningLineTo1 <= 1, 'Yes','No') AS MLGt0To1,
IF (MorningLineTo1 > 1 and MorningLineTo1 <= 2, 'Yes','No') AS MLGt1To2,
IF (MorningLineTo1 > 2 and MorningLineTo1 <= 4, 'Yes','No') AS MLGt2LessEq4,
IF (MorningLineTo1 > 4 and MorningLineTo1 <= 10, 'Yes','No') AS MLGt4LessEq10,
IF (MorningLineTo1 > 10 and  MorningLineTo1 <= 20, 'Yes','No') AS MLGt10LessEq20,
IF (MorningLineTo1 > 20 and  MorningLineTo1 <= 30, 'Yes','No') AS MLGt20LessEq30,
IF (MorningLineTo1 > 30, 'Yes','No') AS MLGt30,
IF (FinishPos = 1, 'WON','LOST') AS Finish, 
IF (DistanceInFurlongs >= 8, 'Route', 'Sprint') AS Distance,
IF (TrnTrackRank > 0,'Yes','No') AS IsTrnTop20Track,
IF (JkyTrackRank > 0,'Yes','No') AS IsJkyTop20Track,
IF (OwnWinsRank > 0,'Yes','No') AS IsOwnerTopWins,
IF (OwnEarningsRank,'Yes','No') AS IsOwnerTopEarnings,
IF (NbrWorksLast > 0,'Yes','No') AS WorkedSinceLast,
IF (StartsWorks21 > 0,'Yes','No') AS StartedWorkedLast21,
IF (NbrWorksLast > 0 or StartsWorks21 > 0,'Yes','No') AS IsActive,
IF (Is1stBred,'Yes','No') AS Is1stBred, 
IF (Is2YoBred,'Yes','No') AS Is2YoBred,
IF (IsTurfBred,'Yes','No') AS IsTurfBred,
IF (IsFirstTimeJuice,'Yes','No') AS IsFirstTimeJuice,
IF (IsSecondTimeJuice,'Yes','No') AS IsSecondTimeJuice,
IF (IsX1stBred,'Yes','No') AS IsX1stBred,
IF (IsX2YoBred,'Yes','No') AS IsX2YoBred,
IF (IsXTurfBred,'Yes','No') AS IsXTurfBred,
IF (IsTrnDebutPlus,'Yes','No') AS IsTrnDebutPlus,
IF (IsTrnDebutTwoPlus,'Yes','No') AS IsTrnDebutTwoPlus,
IF (IsTrn2yoPlus,'Yes','No') AS IsTrn2yoPlus,
IF (IsTrnTurfPlus,'Yes','No') AS IsTrnTurfPlus,
IF (IsTrnTodayPlus,'Yes','No') AS IsTrnTodayPlus, 
IF (IsTrnTodayMinus,'Yes','No') AS IsTrnTodayMinus,
IF (FinishPos < 2, Odds,0)  As WinsOdds,
IF (FinishPos > 1, Odds,0)  As OtherOdds

INTO qryBreeding
FROM  HorseHistory 
WHERE 
(RaceDate >= '2006-01-01') AND
(Odds > 0) AND
(FinishPos > 0) AND 
((RaceType='MSW') OR (RaceType='MCL')) AND

((Is1stBred=TRUE OR 
Is2YoBred=TRUE OR 
IsTurfBred=TRUE OR 
IsX1stBred=TRUE OR 
IsX2YoBred=TRUE OR 
IsXTurfBred=True)) AND
(IsYouBetTrack=True);
