SELECT *
FROM HorseHistory h 
INNER JOIN RaceHistory r 
ON 
(R.RaceNbr = H.RaceNbr) AND (R.RaceDate = H.RaceDate) AND (R.TrkCode = H.TrkCode)
WHERE (((R.RaceDate)= '2005-12-31') AND ((R.RaceDate)='2006-12-31'));
