select sum(odds),
       count(*) as Totala
      
from PrevWeekHH
where TrkCode = 'AQU' and FinishPos > 0 and Odds > 0 and MorningLineTo1 = 3