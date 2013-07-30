SELECT 
  DamSire, AVG(HorseHistory."Power") AS DamSireSprintRating
INTO
  RatingDamSireSprint
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs < 8) AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;