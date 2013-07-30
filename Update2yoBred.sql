UPDATE HorseHistory 
  set HorseHistory.Is2yoBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.Is2yoBred = True
FROM                              
  HorseHistory
  INNER JOIN Sire ON (HorseHistory.SireName = Sire.SireName)
WHERE 
(Age = 2) AND
((HorseHistory.RaceType = 'MSW') OR (HorseHistory.RaceType = 'MCL')) AND
((HorseHistory.DebutIndicator = '*') OR (HorseHistory.DebutIndicator = '**')) AND
(((Sire.JuvenileThisYearRank > 0) AND (Sire.JuvenileThisYearRank < 9999)) OR
((Sire.JuvenileLastYearRank > 0) AND (Sire.JuvenileLastYearRank < 9999))) AND 
(HorseHistory.RaceDate >= '2006-01-01');
