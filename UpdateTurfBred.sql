UPDATE HorseHistory 
  set HorseHistory.IsTurfBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.IsTurfBred = True
FROM                              
  HorseHistory
  INNER JOIN Sire ON (HorseHistory.SireName = Sire.SireName)
WHERE 
(Surface = 'T') AND
((HorseHistory.TurfIndicator = '*') OR (HorseHistory.TurfIndicator = '**')) AND
(((Sire.TurfThisYearRank > 0) AND (Sire.TurfThisYearRank < 9999)) OR
((Sire.TurfLastYearRank > 0) AND (Sire.TurfLastYearRank < 9999))) AND 
(HorseHistory.RaceDate >= '2006-01-01');
