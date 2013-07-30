SELECT 
  Count(*) as TotalStarts,
  Sum(Odds) as TotalOdds,
  Avg(Odds) as TotalAvgOdds,
  Min(Odds) as TotalMinOdds,
  Max(Odds) as TotalMaxOdds,
  H1.TrkCode TrkCode,
  H1.MorningLineTo1 MorningLineTo1
  

FROM
  HorseHistory H1
WHERE
  (H1.RaceDate > '2004-06-21') AND 
  (H1.FinishPos > 1) AND 
  (H1.Odds > 0) AND 
  (H1.FinalWinPctRank = 1) and
  (H1.MorningLineTo1 >= 6.0) and 
  (H1.IsTipSheetSelected = True) 


GROUP BY
  H1.TrkCode,
  H1.MorningLineTo1

ORDER BY 
  
  H1.TrkCode,
  H1.MorningLineTo1
