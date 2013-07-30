SELECT *
INTO PrevWeekHH
FROM HorseHistory
WHERE (RaceDate >= :RaceDateStart and RaceDate <= :RaceDateEnd);

CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByProgramNbr" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","ProgramNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCode" ON "PrevWeekHH" ("RangeRaceDate",   "TrkCode") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "PrevWeekHH" ("RangeRaceDate","RaceDate") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "BySurface" ON "PrevWeekHH" ("RangeRaceDate","Surface") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRaceType" ON "PrevWeekHH" ("RangeRaceDate","RaceType") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByOdds" ON "PrevWeekHH" ("RangeRaceDate","Odds") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevWeekHH" ("RangeRaceDate","FinishPos") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByMorningLineTo1" ON "PrevWeekHH" ("RangeRaceDate","MorningLineTo1") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCodeMorningLineTo1" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","MorningLineTo1") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByHorseName" ON "PrevWeekHH" ("RangeRaceDate","HorseName") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByFinalWinPctRank" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","FinalWinPct" DESC,"Power" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByTodaysWagerWinPctRank" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","TodaysWagerWinPct" DESC,"Power" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByEstTimeOfRace" ON "PrevWeekHH" ("RangeRaceDate","RaceDate","EstTimeOfRace","TrkCode","RaceNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "PrevWeekHH" ("RangeRaceDate","RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevWeekHH" ("FinishPos","PowerRank","Odds","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;


