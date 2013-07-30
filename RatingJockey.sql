SELECT 
  Jockey, AVG(HorseHistory."Power") AS JockeyRating         
INTO
  RatingJockey
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Jockey;