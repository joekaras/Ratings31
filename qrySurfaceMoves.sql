select trkcode, racedate, racenbr, postpos,  racetype, surface, morninglineto1, odds, finishpos, dayslast, dayslastwork, 
Is1stOffLayoff, 
Is2ndOffLayoff,
Is3rdOffLayoff,
IsRouteToSprintToRouteAfterLayoff as IsRSR,
IsSprintToRouteToSprintAfterLayoff as IsSRS

from horsehistory 
where 
(racedate >= '2006-02-01') and 
(odds > 0 and finishpos > 0) and 
(IsRouteToSprintToRouteAfterLayoff or IsSprintToRouteToSprintAfterLayoff)  and 
(IsYouBetTrack=True) and (IsPrintedOnValueSheet=True)
order by finishpos, odds DESC;