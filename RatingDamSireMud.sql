SELECT 
  DamSire, AVG(HorseHistory."Power") AS DamSireMudRating
INTO
  RatingDamSireMud
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'D') AND
  (HorseHistory.TrkCond <> 'FT') AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;