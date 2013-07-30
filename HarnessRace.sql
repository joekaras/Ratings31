/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "HarnessRace"
(
   "TrkCode" VARCHAR(5) NOT NULL,
   "RaceDate" DATE NOT NULL,
   "RangeRaceDate" DATE,
   "RaceNbr" SMALLINT NOT NULL,
   "WagerInfo" VARCHAR(250),
   "PostTime" VARCHAR(15),
   "Distance" VARCHAR(10),
   "Gait" VARCHAR(5),
   "RaceDesc" VARCHAR(250),
   "Purse" VARCHAR(25),
   "ClassRating" VARCHAR(25),
   "EstTimeOfRace" TIME,
   "LocalTimeOfRace" TIME,
   "TimeDiff" FLOAT,
   "TrkFullName" VARCHAR(30),
   "IsPrintedOnValueSheet" BOOLEAN DEFAULT True,
   "IsYouBetTrack" BOOLEAN DEFAULT False,
PRIMARY KEY ("TrkCode","RaceDate","RaceNbr") COMPRESS NONE
DESCRIPTION 'Harness Races'
INDEX PAGE SIZE 16384
BLOB BLOCK SIZE 1024
LOCALE CODE 0
USER MAJOR VERSION 1
);

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "HarnessRace" ("RangeRaceDate","TrkCode","RaceNbr");
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "HarnessRace" ("RaceDate","TrkCode","RaceNbr");
