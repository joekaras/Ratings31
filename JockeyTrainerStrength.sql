SELECT 
  Jockey, Trainer, AVG(HorseHistory."Power") AS JockeyRating,                       AVG(HorseHistory."FinishPos") AS AvgFin,
                    Count(HorseHistory."FinishPos") AS Starts
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)

Group By Jockey, Trainer