SELECT *
INTO PrevWeekRH
FROM RaceHistory
WHERE (RaceDate >= :RaceDateStart  and RaceDate <= :RaceDateEnd) ;


CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevWeekRH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCode" ON "PrevWeekRH" ("RangeRaceDate","TrkCode") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "PrevWeekRH" ("RangeRaceDate","RaceDate") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "BySurface" ON "PrevWeekRH" ("Surface") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRaceType" ON "PrevWeekRH" ("RangeRaceDate","RaceType") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByEstTimeOfRace" ON "PrevWeekRH" ("RangeRaceDate","RaceDate","EstTimeOfRace","TrkCode","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByEstTimeOfFirstRace" ON "PrevWeekRH" ("RangeRaceDate","RaceDate","EstTimeOfFirstRace","TrkCode","RaceNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "PrevWeekRH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByCT" ON "PrevWeekRH" ("RangeRaceDate","RaceDate","CT") COMPRESS FULL;






