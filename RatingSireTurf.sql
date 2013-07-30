SELECT 
  Sire, AVG(HorseHistory."Power") AS SireTurfRating
INTO
  RatingSireTurf
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By sire;