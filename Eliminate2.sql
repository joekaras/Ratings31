SELECT
  PrevWeekHH.TrkCode,
  PrevWeekHH.RaceType,
  PrevWeekHH.Surface,
  PrevWeekHH.FinishPos,
  PrevWeekHH.Odds,
  PrevWeekHH.OwnWinsRank,
  PrevWeekHH.OwnEarningsRank,
  PrevWeekHH.JkyWinsRank,
  PrevWeekHH.TrnEarningsRank,
  PrevWeekHH.TrnTrackRank,
  PrevWeekHH.JkyEarningsRank,
  PrevWeekHH.JkyTrackRank
FROM
  PrevWeekHH
  INNER JOIN PrevWeekRH ON (PrevWeekHH.TrkCode = PrevWeekRH.TrkCode) AND (PrevWeekHH.RaceDate = PrevWeekRH.RaceDate) AND (PrevWeekHH.RaceNbr = PrevWeekRH.RaceNbr)
WHERE
  PrevWeekHH.FinishPos >  1 AND
  PrevWeekHH.OwnWinsRank = 9999 AND
  PrevWeekHH.OwnEarningsRank = 9999 AND
  PrevWeekHH.JkyWinsRank = 0 AND
  PrevWeekHH.TrnWinsRank = 0 AND
  PrevWeekHH.TrnEarningsRank = 0 AND
  PrevWeekHH.TrnTrackRank = 0 AND
  PrevWeekHH.JkyEarningsRank = 0 AND
  PrevWeekHH.JkyTrackRank = 0 



