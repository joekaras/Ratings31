SELECT DISTINCT 
   COUNT(*) as TotalWinnersAllRaces,
   SUM(TotalNbrStarters) as TotalRunnersAllRaces
FROM RaceHistory 
INNER JOIN HorseHistory ON (RaceHistory.TrkCode = HorseHistory.TrkCode) AND 
                           (RaceHistory.RaceDate = HorseHistory.RaceDate) AND 
                           (RaceHistory.RaceNbr = HorseHistory.RaceNbr)
WHERE (HorseHistory.Odds > 0) and (HorseHistory.FinishPos > 0)

