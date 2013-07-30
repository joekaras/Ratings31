DROP TABLE IF EXISTS "RH";
select * into RH from horsehistory where finishpos  > 0  and odds > 0 and TrkCode = "MNR" and surface = "D" and trkcond = "FT" and backspeedrank >0  and lastspeedrank > 0;