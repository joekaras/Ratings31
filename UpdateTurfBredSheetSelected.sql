update HorseHistory 
  set IsTurfBredSheetSelected = False
WHERE 
(RaceDate >= '2006-01-01');
  
update HorseHistory 
  set IsTurfBredSheetSelected = True
FROM                              
  HorseHistory
WHERE 
(IsXTurfBred=True) AND
((TrnTrackRank > 0) AND (TrnTrackRank < 21)) AND
((JkyTrackRank > 0) AND (JkyTrackRank < 21)) AND
(RaceDate >= '2006-01-01');

