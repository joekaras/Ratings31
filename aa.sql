Select MorningLineTo1,
       Odds, 
       FinishPos,
       PowerRank,
       OwnWinsRank,
       OwnEarningsRank,
       TrnWinsRank,
       TrnTrackRank,  
       TrnEarningsRank,
       JkyWinsRank,
       JkyTrackRank,
       JkyEarningsRank,
       DaysLast,
       NbrWorksLast,
       StartsWorks21,
       RaceType,
       Surface,
       DistanceInFurlongs,
       Age,
       DebutIndicator,
       TurfIndicator,
       RouteIndicator,
       Is1stBred,
       IsTurfBred,
       Is2yoBred
       


into a      
from PrevWeekHH
into where ((Odds> 0) and  (finishPos > 0)) AND 
      ((OwnWinsRank <> 9999 and OwnWinsRank > 0) or 
      (OwnEarningsRank <> 9999 and OwnEarningsRank > 0))
