UPDATE HorseHistory 
  set HorseHistory.IsX2yoBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.IsX2yoBred = True
FROM                              
  HorseHistory
WHERE 
(HorseHistory.Is2yoBred=True) AND
(HorseHistory.IsTrn2yoPlus=True) AND 
(HorseHistory.RaceDate >= '2006-01-01');
