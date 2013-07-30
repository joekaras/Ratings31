update HorseHistory 
  set HorseHistory.TrnEarningsRank = Trainer.EarningsThisYearRank,
      HorseHistory.TrnTrackRank         = Trainer.TrackRank

FROM                              
  HorseHistory
  INNER JOIN Trainer ON (HorseHistory.TrnEquibaseKey = Trainer.TrnEquibaseKey)
  INNER JOIN Jockey ON (HorseHistory.JkyEquibaseKey = Jockey.JkyEquibaseKey)
  INNER JOIN TrainerDebutSummary ON (HorseHistory.TrnEquibaseKey = TrainerDebutSummary.TrnEquibaseKey)
  INNER JOIN TrainerDebutTwoSummary ON (HorseHistory.TrnEquibaseKey = TrainerDebutTwoSummary.TrnEquibaseKey)
  INNER JOIN Trainer1To45Summary ON (HorseHistory.TrnEquibaseKey = Trainer1To45Summary.TrnEquibaseKey)
WHERE 
(HorseHistory.RaceDate >= '2006-03-15');
