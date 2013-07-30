SELECT *
INTO TodaysRaces
FROM HarnessRace
WHERE RaceDate = :RaceDateParam;

SELECT *
INTO TodaysEntries
FROM HarnessEntry
WHERE RaceDate = :RaceDateParam;

CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodaysRaces" ("TrkCode","RaceDate","RaceNbr");
CREATE INDEX IF NOT EXISTS "ByEstTimeOfRace" ON "TodaysRaces" ("RaceDate","EstTimeOfRace");
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "TodaysRaces" ("RangeRaceDate","TrkCode","RaceNbr");
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "TodaysRaces" ("RaceDate","TrkCode","RaceNbr");

CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "TodaysEntries" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","ProgramNbr");
CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodaysEntries" ("TrkCode","RaceDate","RaceNbr","ProgramNbr");
CREATE INDEX IF NOT EXISTS "ByFinalWinPctRank" ON "TodaysEntries" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","FinalWinPct" DESC,"WinIndex" DESC);
CREATE INDEX IF NOT EXISTS "ByTrnDrvWinPctRank" ON "C:\BuggyData\TodaysEntries" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","TrnDrvWinPct" DESC,"WinIndex" DESC);


