CREATE INDEX IF NOT EXISTS "ByTodaysWagerWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","TodaysWagerWinPct" DESC) COMPRESS FULL;
alter table horsehistory
redefine ConnectionIV TodaysWagerExpectedWinRoi;