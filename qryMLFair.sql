SELECT DISTINCT 
  Entry.MorningLineDesc AS ML,
  Entry.FinalStarts AS Starts,
  Entry.FinalWins AS Wins,
  Entry.MorningLineTo1Fair AS MLFair,
  Entry.FinalLineTo1Fair AS FinalFair,
  Entry.LinerMaxWinOddsByTrk AS MaxOdds,
  Entry.MorningLineTo1,
  Entry.FinalWinPct,
  Entry.FinalKellyPct,
  Entry.FinalOrderKey
FROM
  Entry
WHERE
  (Entry.MorningLineTo1Fair > Entry.FinalLineTo1Fair)
ORDER BY
  Entry.MorningLineTo1
