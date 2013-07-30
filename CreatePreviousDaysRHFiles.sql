SELECT *
INTO PrevDayRH
FROM RaceHistory
WHERE RaceDate = :RaceDateParam ;

CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevDayRH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCode" ON "PrevDayRH" ("RangeRaceDate","TrkCode") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "PrevDayRH" ("RangeRaceDate","RaceDate") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "BySurface" ON "PrevDayRH" ("Surface") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRaceType" ON "PrevDayRH" ("RangeRaceDate","RaceType") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByEstTimeOfRace" ON "PrevDayRH" ("RangeRaceDate","RaceDate","EstTimeOfRace","TrkCode","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByEstTimeOfFirstRace" ON "PrevDayRH" ("RangeRaceDate","RaceDate","EstTimeOfFirstRace","TrkCode","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "PrevDayRH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByCT" ON "PrevDayRH" ("RangeRaceDate","RaceDate","CT") COMPRESS FULL;

