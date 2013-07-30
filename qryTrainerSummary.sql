SELECT 
  Trainer.Trainer,
  TrainerSummary.Starts,
  TrainerSummary.Wins,
  TrainerSummary.WinPct,
  Trainer.TrnEquibaseKey
FROM
  TrainerSummary
  INNER JOIN Trainer ON (TrainerSummary.TrnEquibaseKey = Trainer.TrnEquibaseKey)
ORDER BY
  Trainer.Trainer
