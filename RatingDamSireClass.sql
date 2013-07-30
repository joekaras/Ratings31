SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireClassRating
INTO
  RatingDamSireClass
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By DamSire;