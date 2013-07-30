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
GROUP BY Sire;

SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireClassRating
INTO
  RatingDamSireClass
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;

SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireTurfRating
INTO
  RatingDamSireTurf
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;


SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireAWRating
INTO
  RatingDamSireAW
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'A') AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;

SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireMudRating
INTO
  RatingDamSireMud
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'D') AND
  (HorseHistory.TrkCond <> 'FT') AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;

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

SELECT
  DamSire, AVG(HorseHistory."Power") AS DamSireSprintRating
INTO
  RatingDamSireSprint
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs < 8) AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY DamSire;

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

SELECT
  Jockey, Owner, AVG(HorseHistory."Power") AS JockeyOwnerRating
INTO
  RatingJockeyOwner
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Jockey, Owner;

SELECT
  Jockey, TrkCode, AVG(HorseHistory."Power") AS JockeyTrackRating
INTO
  RatingJockeyTrack
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Jockey, TrkCode;

SELECT
  Sire, AVG(HorseHistory."Power") AS SireAWRating
INTO
  RatingSireAW
FROM
  HorseHistory
WHERE
  (HorseHistory.Surface = 'A') AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Sire;

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

SELECT
  Sire, AVG(HorseHistory."Power") AS SireRouteRating
INTO
  RatingSireRoute
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs >= 8) AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Sire;

SELECT
  Sire, AVG(HorseHistory."Power") AS SireSprintRating
INTO
  RatingSireSprint
FROM
  HorseHistory
WHERE
  (HorseHistory.DistanceInFurlongs < 8) AND
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Sire;

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
GROUP BY sire;

SELECT
  Trainer, AVG(HorseHistory."Power") AS TrainerRating
INTO
  RatingTrainer
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Trainer;

SELECT
  Trainer, Jockey, AVG(HorseHistory."Power") AS TrainerJockeyRating
INTO
  RatingTrainerJockey
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Trainer, Jockey;

SELECT
  Trainer, Owner, AVG(HorseHistory."Power") AS TrainerOwnerRating
INTO
  RatingTrainerOwner
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Trainer, Owner;

SELECT
  Trainer, TrkCode, AVG(HorseHistory."Power") AS TrainerTrackRating
INTO
  RatingTrainerTrack
FROM
  HorseHistory
WHERE
  (HorseHistory.TypeOfRace = 'T') AND
  (HorseHistory.Odds > 0) AND
  (HorseHistory.FinishPos > 0)
GROUP BY Trainer, TrkCode;

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

