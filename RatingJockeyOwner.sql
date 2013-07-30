SELECT 
  Jockey, Owner, AVG(HorseHistory."Power") AS JockeyOwnerRating
INTO 
  RatingJockeyOwner
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Jockey, Owner;