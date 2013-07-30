/* SQL-92 Table Creation Script with DBISAM Extensions */

DROP INDEX HorseHistory.ByOdds;
DROP INDEX HorseHistory.ByFinishPos;
DROP INDEX HorseHistory.ByRaceDate;
DROP INDEX HorseHistory.ByTrkCode;
DROP INDEX HorseHistory.ByRaceType;
DROP INDEX HorseHistory.ByTrkCode;
DROP INDEX HorseHistory.BySurface;
DROP INDEX HorseHistory.ByHorseName;
DROP INDEX HorseHistory.ByProgramNbr;
DROP INDEX HorseHistory.ByRaceDateTrkCode;

CREATE INDEX IF NOT EXISTS "ByOdds" ON "C:\RatingsData31\HorseHistory" ("Odds") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "C:\RatingsData31\HorseHistory" ("FinishPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "C:\RatingsData31\HorseHistory" ("RaceDate") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByTrkCode" ON "C:\RatingsData31\HorseHistory" ("TrkCode") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceType" ON "C:\RatingsData31\HorseHistory" ("RaceType") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByTrkCond" ON "C:\RatingsData31\HorseHistory" ("TrkCond") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "BySurface" ON "C:\RatingsData31\HorseHistory" ("Surface") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByHorseName" ON "C:\RatingsData31\HorseHistory" ("HorseName") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByProgramNbr" ON "C:\RatingsData31\HorseHistory" ("TrkCode","RaceDate","RaceNbr","ProgramNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDateTrkCode" ON "C:\RatingsData31\HorseHistory" ("RaceDate","TrkCode","RaceNbr","PostPos") COMPRESS FULL;

ALTER TABLE "HorseHistory"
REDEFINE PRIMARY KEY ("TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
