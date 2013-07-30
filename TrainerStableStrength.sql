SELECT 
  Trainer, TrkCode, AVG(HorseHistory."Power") AS TrainerRating,                       AVG(HorseHistory."FinishPos") AS AvgFin,
                    Count(HorseHistory."FinishPos") AS Starts
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)

Group By Trainer, TrkCode