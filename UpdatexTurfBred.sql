UPDATE HorseHistory 
  set HorseHistory.IsXTurfBred = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set HorseHistory.IsXTurfBred = True
FROM                              
  HorseHistory
WHERE 
(HorseHistory.IsTurfBred=True) AND
(HorseHistory.IsTrnTurfPlus=True) AND 
(HorseHistory.RaceDate >= '2006-01-01');
