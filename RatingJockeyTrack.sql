SELECT 
  Jockey, TrkCode, AVG(HorseHistory."Power") AS JockeyRating
INTO
  RatingJockeyTrack
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
Group By Jockey, TrkCode;