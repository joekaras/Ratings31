select trkcode, racedate, racenbr, postpos,  racetype, surface, morninglineto1, odds, finishpos, dayslast, dayslastwork, 
Is1stOffLayoff, Is2ndOffLayoff,Is3rdOffLayoff



from horsehistory 
where 
(racedate >= '2006-02-01') and 
(odds > 0 and finishpos > 0) and 
(Is3rdOffLayoff=True)  and 
(IsYouBetTrack=True) and (IsPrintedOnValueSheet=True)
order by finishpos, odds DESC;