UPDATE Wagers w
SET w.odds = h.odds,
    w.finishpos = h.finishpos,
    w.scratched = False
FROM
Wagers
  LEFT OUTER JOIN HorseHistory H ON (W.TrkCode = H.TrkCode) AND (W.RaceDate = H.RaceDate) AND (W.RaceNbr = H.RaceNbr) AND (W.PostPos = H.PostPos)
WHERE W.RaceDate = :RaceDateParam



