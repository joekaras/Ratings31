SELECT 
  DamSire, AVG(HorseHistory."Power") AS DamSireAWRating
INTO
  RatingDamSireAW
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'A') and
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By DamSire;