UPDATE RankingStats
 SET IVGroupWinnersPct = Round(IVWinners / IVWinnersAllRaces,6);
UPDATE RankingStats
 SET IVGroupRunnersPct = Round(IVRunners / IVRunnersAllRaces,6);
UPDATE RankingStats
 SET IV = Round(IVGroupWinnersPct / IVGroupRunnersPct,2);

UPDATE RankingStatsByTrk
 SET IVGroupWinnersPct = Round(IVWinners / IVWinnersAllRaces,6);
UPDATE RankingStatsByTrk
 SET IVGroupRunnersPct = Round(IVRunners / IVRunnersAllRaces,6);
UPDATE RankingStatsByTrk
 SET IV = Round(IVGroupWinnersPct / IVGroupRunnersPct,2);

UPDATE FinalOrder
  SET LossPct = 100 - WinPct;

UPDATE FinalOrder 
  SET IVRunners = 1