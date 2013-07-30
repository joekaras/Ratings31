SELECT 
  Sire, AVG(HorseHistory."Power") AS SireMudRating
INTO
  RatingSireMud
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'D') AND
  (HorseHistory.TrkCond <> 'FT') AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Sire;