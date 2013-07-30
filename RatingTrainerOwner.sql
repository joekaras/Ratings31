SELECT 
  Trainer, Owner, AVG(HorseHistory."Power") AS TrainerOwnerRating
INTO
  RatingTrainerOwner
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Trainer, Owner;