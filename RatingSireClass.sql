SELECT
  Sire, AVG(HorseHistory."Power") AS SireClassRating
INTO
  RatingSireClass
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Sire;