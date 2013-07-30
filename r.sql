/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "ATrainerList"
(
   "TrkCode" VARCHAR(3),
   "RaceDate" DATE,
   "RaceNbr" SMALLINT,
   "PostPos" SMALLINT,
   "ProgramNbr" VARCHAR(10),
   "Surface" VARCHAR(1),
   "DistanceDesc" VARCHAR(10),
   "Horse" VARCHAR(25),
   "Sire" VARCHAR(25),
   "SireGeneralThisYearRank" SMALLINT,
   "SireGeneralLastYearRank" SMALLINT,
   "SireTurfThisYearRank" SMALLINT,
   "SireTurfLastYearRank" SMALLINT,
   "SireJuvenileThisYearRank" SMALLINT,
   "SireJuvenileLastYearRank" SMALLINT,
   "DamSire" VARCHAR(25),
   "DamSireGeneralThisYearRank" SMALLINT,
   "DamSireGeneralLastYearRank" SMALLINT,
   "DamSireTurfThisYearRank" SMALLINT,
   "DamSireTurfLastYearRank" SMALLINT,
   "DamSireJuvenileThisYearRank" SMALLINT,
   "DamSireJuvenileLastYearRank" SMALLINT,
   "Trainer" VARCHAR(30),
   "TrnTrackRank" SMALLINT,
   "TrnWinsRank" SMALLINT,
   "TrnEarningsRank" SMALLINT,
   "Owner" VARCHAR(60),
   "OwnWinsRank" SMALLINT,
   "OwnEarningsRank" SMALLINT,
   "Jockey" VARCHAR(30),
   "JkyTrackRank" SMALLINT,
   "JkyWinsRank" SMALLINT,
   "JkyEarningsRank" SMALLINT,
   "MorningLineDesc" VARCHAR(10),
   "Category" VARCHAR(15),
   "Starts" INTEGER,
   "WinPct" FLOAT,
   "ITMPct" FLOAT,
   "ROI" FLOAT,
PRIMARY KEY ("TrkCode","RaceDate","RaceNbr","PostPos","Category","Trainer") COMPRESS NONE
LOCALE CODE 0
USER MAJOR VERSION 1
);

