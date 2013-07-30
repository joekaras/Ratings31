SELECT *
INTO TodayRaces
FROM HarnessRace
WHERE RaceDate = :RaceDateParam;

SELECT *
INTO TodayEntries
FROM HarnessEntry
WHERE RaceDate = :RaceDateParam;

CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodayEntries" TrkCode","RaceDate","RaceNbr","ProgramNbr");
CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodaysRaces" ("TrkCode","RaceDate","RaceNbr");

