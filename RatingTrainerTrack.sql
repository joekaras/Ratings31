SELECT 
  Trainer, TrkCode, AVG(HorseHistory."Power") AS TrainerRating
INTO
  RatingTrainerTrack
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Trainer, TrkCode;