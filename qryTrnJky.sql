SELECT 
  ENTRY.Trainer,
  ENTRY.TotalTrnStarts,
  ENTRY.TotalTrnWinPct,
  TrainerSummary.WinPct AS TSWinPct,
  ENTRY.Jockey,
  ENTRY.TotalJkyStarts,
  ENTRY.TotalJkyWinPct,
  JockeySummary.WinPct AS JSWPct,
  ENTRY.TotalJkyOddsStarts,
  ENTRY.TotalJkyOddsWinPct,
  ENTRY.TotalTrnOddsStarts,
  ENTRY.TotalTrnOddsWinPct
FROM
  ENTRY
  INNER JOIN TrainerSummary ON (ENTRY.TrnEquibaseKey = TrainerSummary.TrnEquibaseKey)
  INNER JOIN JockeySummary ON (ENTRY.JkyEquibaseKey = JockeySummary.JkyEquibaseKey)
