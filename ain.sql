
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevWeekHH" ("FinishPos",
"PowerRank","Odds","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;

CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "PrevDayHH" ("FinishPos","PowerRank","Odds","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;