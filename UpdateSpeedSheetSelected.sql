update HorseHistory 
  set IsSpeedSheetSelected = False
WHERE 
(RaceDate >= '2006-01-01');
  
update HorseHistory 
  set IsSpeedSheetSelected = True
FROM                              
  HorseHistory
WHERE 
((IsXtremeSpeed=True) OR (IsXtremeSpeed2=True)) AND
((TrnTrackRank > 0) AND (TrnTrackRank < 21)) AND
((StartsWorks21 > 0) OR (NbrWorksLast > 0)) AND
(MorningLineTo1Rank > 1) AND
(MorningLineTo1 > 2) AND
(RaceDate >= '2006-01-01');
