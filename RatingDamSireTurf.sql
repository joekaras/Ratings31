SELECT 
  DamSire, AVG(HorseHistory."Power") AS DamSireTurfRating
INTO
  RatingDamSireTurf
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By DamSire;