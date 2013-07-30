SELECT 
  H1.TrkCode TrkCode,
  H1.RaceNbr RaceNbr,
  H1.RaceType RaceType,
  H1.Surface Surface,
  H1.HorseName HorseName,
  H1.MorningLineDesc MorningLineDesc, 
  H1.FinalWinPctRank FinalWinPctRank,
  H1.TipChoice TipChoice,
  H1.ValueChoice ValueChoice,
  H1.IsDollar IsDollar,
  H1.IsDoubleDollar IsDoubleDollar,
  H1.AngleChoice AngleChoice,
  H1.AngleDesc AngleDesc,
  H1.FinishPos FinishPos,
  H1.Odds Odds,
  H1. Odds,
  
FROM
   HorseHistory H1 

WHERE
  (H1.RaceDate = '2004-06-14')  and
  (H1.Odds > 0) and
  (H1.FinishPos  > 0) and
  ((H1.FinalWinPctRank = 1) or  
  (H1.IsTipSheetSelected = True)) and
  (H1.IsPrintedOnValueSheet = True) 



