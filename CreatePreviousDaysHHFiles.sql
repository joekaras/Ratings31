SELECT *
INTO PrevDayHH
FROM HorseHistory
WHERE RaceDate = :RaceDateParam          ;

CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevDayHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByProgramNbr" ON "PrevDayHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","ProgramNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCode" ON "PrevDayHH" ("RangeRaceDate",   "TrkCode") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "PrevDayHH" ("RangeRaceDate","RaceDate") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "BySurface" ON "PrevDayHH" ("RangeRaceDate","Surface") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRaceType" ON "PrevDayHH" ("RangeRaceDate","RaceType") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByOdds" ON "PrevDayHH" ("RangeRaceDate","Odds") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevDayHH" ("RangeRaceDate","FinishPos") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByMorningLineTo1" ON "PrevDayHH" ("RangeRaceDate","MorningLineTo1") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTrkCodeMorningLineTo1" ON "PrevWeekHH" ("RangeRaceDate","TrkCode","MorningLineTo1") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByHorseName" ON "PrevDayHH" ("RangeRaceDate","HorseName") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByFinalWinPctRank" ON "PrevDayHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","FinalWinPct" --DESC,"Power" DESC) COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByTodaysWagerWinPctRank" ON "PrevDayHH" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","TodaysWagerWinPct" --DESC,"Power" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByEstTimeOfRace" ON "PrevDayHH" ("RangeRaceDate","RaceDate","EstTimeOfRace","TrkCode","RaceNbr") COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "PrevDayHH" ("RangeRaceDate","RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos") --COMPRESS FULL;
--CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevDayHH" ("FinishPos","PowerRank","Odds","TrkCode","RaceDate","RaceNbr","PostPos") --COMPRESS FULL;





