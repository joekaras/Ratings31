SELECT DISTINCT 
  Race.TrkCode,
  Race.RaceDate,
  Race.RaceNbr,
  Race.TotalMorningLineTo1Probability,
  Race.TotalFinalLineTo1Probability,
  Entry.MorningLineDesc,
  Entry.MorningLineTo1,
  Entry.MorningLineTo1Fair,
  Entry.MorningLineTo1Probability,
  Entry.MorningLineTo1FairProbability,
  Entry.MorningLineTo1Rank,
  Entry.FinalLineTo1,
  Entry.FinalWinPct,
  Entry.FinalLineTo1Fair,
  Entry.FinalLineTo1Probability,
  Entry.FinalLineTo1FairProbability
FROM
  Race
  INNER JOIN Entry ON (Race.TrkCode = Entry.TrkCode) AND (Race.RaceDate = Entry.RaceDate) AND (Race.RaceNbr = Entry.RaceNbr)
