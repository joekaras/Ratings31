/* SQL-92 Table Creation Script with DBISAM Extensions */

CREATE TABLE IF NOT EXISTS "C:\RatingsData31\BankWagers"
(
   "TrkCode" VARCHAR(3) NOT NULL,
   "RaceDate" DATE NOT NULL,
   "RaceNbr" SMALLINT NOT NULL,
   "PostPos" SMALLINT NOT NULL, 
   "WagerType" VarChar(10),
   "WagerAmt" FLOAT DEFAULT 0,
   "Refund" FLOAT DEFAULT 0,
   "Payout" FLOAT DEFAULT 0

PRIMARY KEY ("TrkCode","MorningLineTo1") COMPRESS FULL
LOCALE CODE 0
USER MAJOR VERSION 1
);

