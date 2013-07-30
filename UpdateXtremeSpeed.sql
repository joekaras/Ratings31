UPDATE HorseHistory 
  set IsXtremeSpeed = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set IsXtremeSpeed = True
FROM                              
  HorseHistory
WHERE 
(QSP1stCallRank = 1) AND
(KSP1stCallRank = 1) AND
(EarlyPacePosRank = 1) AND
(EarlyPaceRank = 1) AND
(RaceDate >= '2006-01-01');


UPDATE HorseHistory 
  set IsXtremeSpeed2 = False
WHERE 
(HorseHistory.RaceDate >= '2006-01-01');
  
UPDATE HorseHistory 
  set IsXtremeSpeed2 = True
FROM                              
  HorseHistory
WHERE 
(QSP2ndCallRank = 1) AND
(KSP2ndCallRank = 1) AND
(MiddlePacePosRank = 1) AND
(MiddlePaceRank = 1) AND
(RaceDate >= '2006-01-01');
