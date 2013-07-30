--******************************************************************************//
--I.V. = (group percentage of winners) / (group percentage of runners)
--i.e. last time out winners
--Examining 69234 runners in 6678 races on the all weather we find that 5548 were
--last time out winners. Of those last time winners 1107 went on to win this race.
--IV=% of winners that were LTO winners / % of runners that were LTO winners
--IV=(1107 / 6678) / (5548 / 69234)
--Impact Value=2.07
--This means that, on the all weather, a last time out winner is twice as likely
--to win than a horse who did not win lto.
--
-- powerank = 1 horses won 4064
-- all horses won 13182
-- 4064/13182 = .308%
-- 
-- powerrank=1 starters = 13106
-- all horse starters= 104052
-- 13106/104052= .1259%
-- 
-- .308/.1259= 2.44
--******************************************************************************//
--
UPDATE FinalOrder
   SET LossPct = 100 - WinPct,
       IVRunners = Starts,
       IVWinners = Wins;
       

DROP TABLE IF EXISTS memory\Iv;

SELECT BaseKey,
       SUM(wins) as IVWinnersAllRaces,
       SUM(starts) as IVRunnersAllRaces
INTO Memory\Iv
FROM FinalOrder 
GROUP BY BaseKey;

--Just for test display
--SELECT *
--FROM FinalOrder F, memory\IV M
--INNER JOIN memory\Iv ON F.BaseKey = m.baseKey;

UPDATE FinalOrder f
SET f.IVWinnersAllRaces = m.IVWinnersAllRaces,
    f.IVRunnersAllRaces = m.IVRunnersAllRaces
FROM FinalOrder F, memory\IV m
INNER JOIN memory\Iv ON f.BaseKey = m.baseKey;

DROP TABLE IF EXISTS memory\Iv;

UPDATE FinalOrder
   SET IVGroupWinnersPct = ROUND(IVWinners / IVWinnersAllRaces, 8),
       IVGroupRunnersPct = ROUND(IVRunners / IVRunnersAllRaces, 8);

UPDATE FinalOrder
   SET IV = ROUND(IVGroupWinnersPct / IVGroupRunnersPct, 2);



--******************************************************************************
-- ROI is calculated by summing winning wagers and subtracting from that sum,   
-- the amount wagered (minus refunds), and                                      
-- then dividing that total by the amount wagered; expressing the total as a    
-- percentage. $1 ROI   
--******************************************************************************
-- TotalWinOdds are based on to $1 so we just need to divide by runners
   UPDATE FinalOrder
     SET IVROI = ROUND((TotalWinOdds / IVRunners), 2);

--
--Value Betting is a mathematical way of calculating how good an odd is. 
--Long term, events with a high value will be profitable.
--In order to find bookmakers Value Bet 
--we multiply the bookmakers odds with event percentage-probability:
--Value = (Odds X event percentage-probability (%) ) / 100
--When value is higher then 1.00 you have a Value Bet. 
--It means that, statistically, your winning will be higher then your stake, 
--so long term you can only win. 
--The only problem with this calculation is that in sport events, 
--you can not precisely determine probabilities since too many factors involved, 
--so we use the average probabilities of all bookmakers for each event.   
--
UPDATE FinalOrder
   SET ValueBet = ROUND((AvgWinOdds * WinPct) / 100, 2);

--
-- Probability of an outcome is defined as:
--     p(x) = (chances for)/(total chances)
--     probability = 1 / (1+odds)

--

UPDATE FinalOrder
   SET AvgWinOddsWinPct = ROUND((1 / (1 + AvgWinOdds)) * 100, 2);
