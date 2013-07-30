select * 
from PrevWeekHH
into where 
      (RaceType = 'MSW' or RaceType = 'MCL') 
      AND

      (      
       (Odds> 0) and  (finishPos= 1)
      ) AND 
      (
      (OwnWinsRank <> 9999 and OwnWinsRank > 0) OR
      (OwnEarningsRank <> 9999 and OwnEarningsRank > 0)
      ) 
AND
      (
      (EarlyPaceRank > 1) and
      (KSP1stCallRank > 1) and
      (KSP2ndCallRank > 1) and
      (EarlyPacePosRank > 1) and
      (MiddlePaceRank > 1) and
      (MiddlePacePosRank > 1) and
      (LatePaceRank > 1) and
      (LatePacePosRank > 1) and
      (BackSpeedRank > 1) and
      (LastSpeedRank > 1) and
      (BackClassRank > 1) and
      (LastClassRank > 1) and
      (PowerRank > 1) 

      )
order by RaceType
