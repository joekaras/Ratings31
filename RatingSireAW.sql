SELECT 
  Sire, AVG(HorseHistory."Power") AS SireAWRating
INTO
  RatingSireAW
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'A') and
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Sire;