update HorseHistory 
  set Is1stBredSheetSelected = False
WHERE 
(RaceDate >= '2006-01-01');
  
update HorseHistory 
  set Is1stBredSheetSelected = True
FROM                              
  HorseHistory
WHERE 
(IsX1stBred=True) AND
((TrnTrackRank > 0) AND (TrnTrackRank < 21)) AND
((JkyTrackRank > 0) AND (JkyTrackRank < 21)) AND
(RaceDate >= '2006-01-01');

