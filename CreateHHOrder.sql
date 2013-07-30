/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "HHOrder"
(
   "TrkCode" VARCHAR(3) NOT NULL DEFAULT '0',
   "RaceDate" DATE NOT NULL,
   "RaceNbr" SMALLINT NOT NULL,
   "PostPos" SMALLINT NOT NULL,
   "RangeRaceDate" DATE,

   "OrderKey" VARCHAR(50) DEFAULT '0',

   "WinPct" FLOAT DEFAULT 0,
   "WinPctRank" SMALLINT DEFAULT 0,

   "IV" FLOAT DEFAULT 0,
   "IVRank" FLOAT DEFAULT 0,
   "IVRoi" FLOAT DEFAULT 0,

   "Starts" INTEGER DEFAULT 0,
   "Wins" INTEGER DEFAULT 0,
   "AvgOdds" FLOAT DEFAULT 0,
   "MinOdds" FLOAT DEFAULT 0,
   "MaxOdds" FLOAT DEFAULT 0,

   "AvgWinOdds" FLOAT DEFAULT 0,
   "MinWinOdds" FLOAT DEFAULT 0,
   "MaxWinOdds" FLOAT DEFAULT 0,

   "ValueOdds" FLOAT DEFAULT 0,
   "LineOddsTo1" FLOAT DEFAULT 0,

   "LineTo1" FLOAT DEFAULT 0,
   "LineTo1Fair" FLOAT DEFAULT 0,
   "LineTo1Probability" FLOAT DEFAULT 0,
   "LineTo1FairProbability" FLOAT DEFAULT 0,

   "MathExpected" FLOAT DEFAULT 0,
   "ExpectedProfitLossPct" FLOAT DEFAULT 0,

   "KellyPct" FLOAT DEFAULT 0,
   "ValueBet" FLOAT DEFAULT 0,


PRIMARY KEY ("TrkCode","RaceDate","RaceNbr","PostPos","OrderKey") COMPRESS FULL
DESCRIPTION 'Horse History Handicapping Keys'
LOCALE CODE 0
USER MAJOR VERSION 4
);

CREATE INDEX IF NOT EXISTS "ByWinPctRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","OrderKey","WinPct" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByIVRank" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","OrderKey","IV" DESC) COMPRESS FULL;
CREATE INDEX IF NOT EXISTS "ByRangeRaceDate" ON "HorseHistory" ("RangeRaceDate","TrkCode","RaceDate","RaceNbr","PostPos","OrderKey",) COMPRESS FULL;
