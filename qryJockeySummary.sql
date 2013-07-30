SELECT 
  Jockey.Jockey,
  JockeySummary.Starts,
  JockeySummary.Wins,
  JockeySummary.WinPct,
  Jockey.JkyEquibaseKey
FROM
  JockeySummary
  INNER JOIN Jockey ON (JockeySummary.JkyEquibaseKey = Jockey.JkyEquibaseKey)
ORDER BY
  Jockey.Jockey
