CREATE INDEX IF NOT EXISTS "ByBackClass" ON "PP" ("HHTrkCode","HHRaceDate","HHRaceNbr","HHPostPos","Class" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByBackSpeed" ON "PP" ("HHTrkCode","HHRaceDate","HHRaceNbr","HHPostPos","Speed" DESC) COMPRESS FULL;

--   "EarlyPace" FLOAT,
--   "MiddlePace" FLOAT,
--   "LatePace" FLOAT,
