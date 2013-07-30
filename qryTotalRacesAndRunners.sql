SELECT DISTINCT 
   COUNT(*) as WinnersAllRaces,
   SUM(NbrRunners) as RunnersAllRaces
FROM RaceHistory 
WHERE NbrRunners > 0
