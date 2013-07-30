  SELECT TrkCode,RaceNbr,RaceNbr, PostPos, FinalWinPct
  FROM ENTRY     
  GROUP BY  TrkCode,RaceNbr,RaceNbr, FinalWinPct 
  ORDER BY  TrkCode,RaceNbr,RaceNbr, FinalWinPct DESC