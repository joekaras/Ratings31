SELECT 
  Entry.TrkCode,
  Entry.RaceNbr,
  Entry.WagerAmt,
  Entry.MorningLineTo1Fair,
  Entry.LinerStartsByTrk,
  Entry.LinerWinsByTrk,
  Entry.LinerWinPctByTrk,
  Entry.LinerValueBetByTrk,
  Entry.LinerAvgOddsByTrk,
  Entry.LinerMinWinOddsByTrk,
  Entry.LinerMaxWinOddsByTrk,
  Entry.LinerStarts,
  Entry.LinerWins,
  Entry.LinerWinPct,
  Entry.LinerValueBet
FROM
  Entry
WHERE
  (Entry.IsYouBetTrack = TRUE) AND 
  (Entry.IsWagerSheetSelected = TRUE)
