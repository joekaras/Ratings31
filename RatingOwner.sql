SELECT
  Owner, AVG(HorseHistory."Power") AS OwnerRating
INTO
  RatingOwner
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Owner;

