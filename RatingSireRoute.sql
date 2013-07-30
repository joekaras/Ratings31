SELECT
  Sire, AVG(HorseHistory."Power") AS DamSireRouteRating
INTO
  RatingSireRoute
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs >= 8) and
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Sire;