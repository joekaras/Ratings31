SELECT 
  Entry.TrkCode,
  Entry.LinerByTrkKey,
  Entry.IsFrontDoubleLiner,
  Entry.IsFrontDoubleLiner0,
  Entry.IsFrontDoubleLiner1,
  Entry.IsFrontDoubleLiner2,
  Entry.IsFrontDoubleLiner3,
  Entry.EarlyPaceRank,
  Entry.MiddlePaceRank,
  Entry.LatePaceRank,
  Entry.EarlyPacePosRank,
  Entry.MiddlePacePosRank,
  Entry.LatePacePosRank
FROM
  Entry
WHERE
  (Entry.LinerWinPctByTrk > 0)
