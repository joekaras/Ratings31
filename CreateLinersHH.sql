SELECT TrkCode, 
       RaceDate, 
       RaceNbr,   
       PostPos, 
       IsPrintedOnValueSheet,
       TypeOfRace,
       Surface,
       DistanceInFurlongs,
       MorningLineTo1,
       FinishPos,
       Odds,
       DebutIndicator,
       TurfIndicator,
       NbrWorksLast,
       StartsWorks21,
       IsFrontDoubleLiner0,
       IsFrontDoubleLiner1,
       IsFrontDoubleLiner2,
       IsFrontDoubleLiner3,
       IsBackDoubleLiner0,
       IsBackDoubleLiner1,
       IsBackDoubleLiner2,
       IsBackDoubleLiner3,
       IsTripleLiner0,
       IsTripleLiner1,
       IsTripleLiner2,
       IsTripleLiner3
INTO LinerHH
FROM HorseHistory
WHERE 
   (IsPrintedOnValueSheet=True) and 
   (odds > 0) and 
   (finishPos > 0) and
   (IsFrontDoubleLiner0 = True or
   IsFrontDoubleLiner1 = True or
   IsFrontDoubleLiner2 = True or
   IsFrontDoubleLiner3= True or
   IsBackDoubleLiner0= True or
   IsBackDoubleLiner1= True or
   IsBackDoubleLiner2= True or
   IsBackDoubleLiner3= True or
   IsTripleLiner0= True or
   IsTripleLiner1= True or
   IsTripleLiner2= True or
   IsTripleLiner3= True) ;








