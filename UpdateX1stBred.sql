UPDATE HorseHistory 
  set HorseHistory.IsX1stBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.IsX1stBred = True
FROM                              
  HorseHistory
WHERE 
(HorseHistory.Is1stBred=True) AND
(HorseHistory.DebutIndicator = '*') AND 
(HorseHistory.IsTrnDebutPlus=True) AND 
(HorseHistory.RaceDate >= '2006-01-01');


UPDATE HorseHistory 
  set HorseHistory.IsX1stBred = True
FROM                              
  HorseHistory
WHERE 
(HorseHistory.Is1stBred=True) AND
(HorseHistory.DebutIndicator = '**') AND 
(HorseHistory.IsTrnDebutTwoPlus=True) AND 
(HorseHistory.RaceDate >= '2006-01-01');
