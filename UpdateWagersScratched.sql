UPDATE Wagers w
SET w.scratched = True
FROM
Wagers
where (w.odds = 0 and w.finishpos = 0) and
WHERE W.RaceDate = :RaceDateParam;


