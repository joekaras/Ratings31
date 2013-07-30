SELECT 
  Trainer, AVG(HorseHistory."Power") AS TrainerRating         
INTO
  RatingsTrainer
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Trainer;