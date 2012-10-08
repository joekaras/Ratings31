ALTER TABLE Race
ADD IF NOT EXISTS TotalNbrScratchedStarters SMALLINT;

ALTER TABLE Race
   DROP IF EXISTS TotalNbrStarters,
   DROP IF EXISTS TotalNbrDebutStarters,
   DROP IF EXISTS TotalNbrDebutTwoStarters,
   DROP IF EXISTS TotalNbrTurfDebutStarters,
   DROP IF EXISTS TotalNbrRouteDebutStarters,
   DROP IF EXISTS TotalNbrScratchedStarters,
   ADD IF NOT EXISTS NbrStarters SMALLINT,
   ADD IF NOT EXISTS NbrDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrDebutTwoStarters SMALLINT,
   ADD IF NOT EXISTS NbrTurfDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrRouteDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrScratchedStarters SMALLINT,
   ADD IF NOT EXISTS NbrRunners SMALLINT;

ALTER TABLE RaceHistory
ADD IF NOT EXISTS TotalNbrScratchedStarters SMALLINT;

ALTER TABLE RaceHistory
   DROP IF EXISTS TotalNbrStarters,
   DROP IF EXISTS TotalNbrDebutStarters,
   DROP IF EXISTS TotalNbrDebutTwoStarters,
   DROP IF EXISTS TotalNbrTurfDebutStarters,
   DROP IF EXISTS TotalNbrRouteDebutStarters,
   DROP IF EXISTS TotalNbrScratchedStarters,
   ADD IF NOT EXISTS NbrStarters SMALLINT,
   ADD IF NOT EXISTS NbrDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrDebutTwoStarters SMALLINT,
   ADD IF NOT EXISTS NbrTurfDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrRouteDebutStarters SMALLINT,
   ADD IF NOT EXISTS NbrScratchedStarters SMALLINT,
   ADD IF NOT EXISTS NbrRunners SMALLINT;


CREATE INDEX IF NOT EXISTS "ByNbrRunners" ON "RaceHistory" ("NbrRunners") COMPRESS FULL;
   
CREATE INDEX IF NOT EXISTS "ByOdds" ON "HorseHistory" ("Odds") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "HorseHistory" ("FinishPos") COMPRESS FULL;
