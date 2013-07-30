UPDATE HorseHistory 
  set HorseHistory.Is1stBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.Is1stBred = True
FROM                              
  HorseHistory
  INNER JOIN Sire ON (HorseHistory.SireName = Sire.SireName)
WHERE 
((HorseHistory.RaceType = 'MSW') OR (HorseHistory.RaceType = 'MCL')) AND
((HorseHistory.DebutIndicator = '*') OR (HorseHistory.DebutIndicator = '**')) AND
(((Sire.GeneralThisYearRank > 0) AND (Sire.GeneralThisYearRank < 9999)) OR
((Sire.GeneralLastYearRank > 0) AND (Sire.GeneralLastYearRank < 9999))) AND 
(HorseHistory.RaceDate >= '2006-01-01');
