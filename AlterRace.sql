ALTER TABLE Race
   ADD IF NOT EXISTS RaceShape VARCHAR(50),
   ADD IF NOT EXISTS TopLastSRWinner INTEGER DEFAULT 0,
   ADD IF NOT EXISTS TotalNbrScratchedStarters SMALLINT,
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

