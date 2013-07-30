select trkcode, racedate, racenbr, postpos,  racetype, surface, morninglineto1, odds, finishpos, dayslast, dayslastwork, 
Is3rdOffLayoff,
IsDirtToTurfToDirtAfterLayoff as IsDTD,
IsTurfToDirtToTurfAfterLayoff as IsTDT,
IsRouteToSprintToRouteAfterLayoff as IsRSR,
IsSprintToRouteToSprintAfterLayoff as IsSRS

from horsehistory 
where 
(racedate >= '2006-02-01') and 
(odds > 0 and finishpos > 0) and 
(IsDirtToTurfToDirtAfterLayoff or IsTurfToDirtToTurfAfterLayoff or IsRouteToSprintToRouteAfterLayoff or IsSprintToRouteToSprintAfterLayoff)  and 
(IsYouBetTrack=True) and (IsPrintedOnValueSheet=True)
order by finishpos, odds DESC;