/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "HHPace"
(
   "TrkCode" VARCHAR(3) NOT NULL DEFAULT '0',
   "RaceDate" DATE NOT NULL,
   "RaceNbr" SMALLINT NOT NULL,
   "PostPos" SMALLINT NOT NULL,
   "RangeRaceDate" DATE,

   "EarlyPace" FLOAT DEFAULT 0,
   "EarlyPaceRank" SMALLINT DEFAULT 0,

   "EarlyPaceO" FLOAT DEFAULT 0,
   "EarlyPaceORank" SMALLINT DEFAULT 0,

   "EarlyPaceH" FLOAT DEFAULT 0,
   "EarlyPaceHRank" SMALLINT DEFAULT 0,

   "EarlyPacePos" FLOAT DEFAULT 9999,
   "EarlyPacePosRank" SMALLINT DEFAULT 0,

   "EarlyPacePosO" FLOAT DEFAULT 0,
   "EarlyPacePosORank" SMALLINT DEFAULT 0,

   "EarlyPacePosH" FLOAT DEFAULT 0,
   "EarlyPacePosHRank" SMALLINT DEFAULT 0,

   "MiddlePace" FLOAT DEFAULT 0,
   "MiddlePaceRank" SMALLINT DEFAULT 0,

   "MIddlePaceO" FLOAT DEFAULT 0,
   "MiddlePaceORank" SMALLINT DEFAULT 0,

   "MiddlePaceH" FLOAT DEFAULT 0,
   "MiddlePaceHRank" SMALLINT DEFAULT 0,

   "MiddlePacePos" FLOAT DEFAULT 9999,
   "MiddlePacePosRank" SMALLINT DEFAULT 0,

   "MiddlePacePosO" FLOAT DEFAULT 0,
   "MiddlePacePosORank" SMALLINT DEFAULT 0,

   "MiddlePacePosH" FLOAT DEFAULT 0,
   "MiddlePacePosHRank" SMALLINT DEFAULT 0,

   "LatePace" FLOAT DEFAULT 0,
   "LatePaceRank" SMALLINT DEFAULT 0,

   "LatePaceO" FLOAT DEFAULT 0,
   "LatePaceORank" SMALLINT DEFAULT 0,

   "LatePaceH" FLOAT DEFAULT 0,
   "LatePaceHRank" SMALLINT DEFAULT 0,

   "LatePacePos" FLOAT DEFAULT 9999,
   "LatePacePosRank" SMALLINT DEFAULT 0,

   "LatePacePosO" FLOAT DEFAULT 0,
   "LatePacePosORank" SMALLINT DEFAULT 0,

   "LatePacePosH" FLOAT DEFAULT 0,
   "LatePacePosHRank" SMALLINT DEFAULT 0,

   "FinishPacePos" FLOAT DEFAULT 0,
   "FinishPacePosRank" SMALLINT DEFAULT 0,

   "AxcisEarlyPace" FLOAT DEFAULT 0,
   "AxcisEarlyPaceRank" SMALLINT DEFAULT 0,

   "AxcisMiddlePace" FLOAT DEFAULT 0,
   "AxcisMiddlePaceRank" SMALLINT DEFAULT 0,

   "AxcisLatePace" FLOAT DEFAULT 0,
   "AxcisLatePaceRank" SMALLINT DEFAULT 0,

   "AxcisEarlyPacePos" FLOAT DEFAULT 9999,
   "AxcisEarlyPacePosRank" SMALLINT DEFAULT 0,

   "AxcisMiddlePacePos" FLOAT DEFAULT 9999,
   "AxcisMiddlePacePosRank" SMALLINT DEFAULT 0,

   "AxcisLatePacePos" FLOAT DEFAULT 9999,
   "AxcisLatePacePosRank" SMALLINT DEFAULT 0,

   "EarlyPaceAdvantage" FLOAT DEFAULT 0,
   "MiddlePaceAdvantage" FLOAT DEFAULT 0,
   "LatePaceAdvantage" FLOAT DEFAULT 0,

   "QuirinSpeedPoints1stCall" FLOAT,
   "QuirnSpeedPoints1stCallRank" SMALLINT,

   "QuirinSpeedPoints2ndCall" FLOAT,
   "QuirnSpeedPoints2ndCallRank" SMALLINT,

   "KleinSpeedPoints1stCall" FLOAT,
   "KleinSpeedPoints1stCallRank" SMALLINT,

   "KleinSpeedPoints2ndCall" FLOAT,
   "KleinSpeedPoints2ndCallRank" SMALLINT,

PRIMARY KEY ("TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL
DESCRIPTION 'Horse History'
LOCALE CODE 0
USER MAJOR VERSION 4
);

CREATE INDEX IF NOT EXISTS "ByRaceDate" ON "HorseHistory" ("RangeRaceDate","RaceDate") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByHorseName" ON "HorseHistory" ("RangeRaceDate","HorseName") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinalWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","FinalWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByProgramNbr" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","ProgramNbr") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRaceDateTrkCode" ON "HorseHistory" ("RangeRaceDate","RaceDate","TrkCode","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByPrimaryWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PrimaryWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "BySecondaryWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","SecondaryWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByDefaultWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","DefaultWinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByOdds" ON "HorseHistory" ("RangeRaceDate","Odds") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByFinishPos" ON "HorseHistory" ("RangeRaceDate","FinishPos") COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByTodaysWagerWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","TodaysWagerWinPct" DESC) COMPRESS FULL;
