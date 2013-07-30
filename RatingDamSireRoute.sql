SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireRouteRating
INTO
  RatingDamSireRoute
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs >= 8) AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;