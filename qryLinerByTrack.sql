SELECT DISTINCT 
  Entry.FinalOrderKey,
  Entry.LinerStartsByTrk,
  Entry.LinerWinsByTrk,
  Entry.FinalStarts,
  Entry.FinalWins,
  Entry.MorningLineTo1Fair,
  Entry.LinerMinWinOddsByTrk,
  Entry.LinerMaxWinOddsByTrk,
  Entry.LinerAvgOddsByTrk
FROM
  Entry
WHERE
  (Entry.LinerStartsByTrk > 0)
