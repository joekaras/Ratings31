SELECT 
  Trainer, Jockey, AVG(HorseHistory."Power") AS TrainerJockeyRating
INTO
  RatingTrainerJockey
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Trainer, Jockey;