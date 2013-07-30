/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "C:\RatingsData31\Race" 
("RaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "C:\RatingsData31\Entry" 
("RaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "C:\RatingsData31\RaceHistory" 
("RaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "C:\RatingsData31\HorseHistory" 
("RaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;

