SELECT 
  Entry.TrkCode AS Trk,
  Entry.RaceNbr AS RNbr,
  Entry.PostPos AS PP,
  Entry.TodaysWagerOrderKey AS TWK,
  Race.TotalTodaysWagerProbability AS TotTProb,
  Entry.TodaysWagerWinPct AS TWinPct,
  Entry.NormalTodaysWagerProbability AS NTProb,
  Entry.NormalTodaysWagerOdds AS NTO,
  Race.TotalMorningLineProbability AS TotMLProb,
  Entry.MorningLineTo1 AS MLTo1,
  Entry.MorningLineProbability AS MLProb,
  Entry.NormalMorningLineProbability AS NMLProb,
  Entry.NormalMorningLineProbabilitySquared AS NMLProbSq,
  Entry.NormalMorningLineOdds AS NMLO,
  Entry.NormalMorningLineOddsSquared AS NMLOSq
FROM
  Race
  INNER JOIN Entry ON (Race.TrkCode = Entry.TrkCode) AND (Race.RaceDate = Entry.RaceDate) AND (Race.RangeRaceDate = Entry.RangeRaceDate) AND (Race.RaceNbr = Entry.RaceNbr)
WHERE
  (Entry.TrkCode = 'DMR')
