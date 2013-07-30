SELECT 
  FinalOrder.TrkKey,
  FinalOrder.BaseKey,
  FinalOrder.Starts,
  FinalOrder.Wins,
  FinalOrder.TotalWon,
  FinalOrder.TotalProfitLoss,
  FinalOrder.MinWinOdds,
  FinalOrder.AvgWinOdds,
  FinalOrder.MaxWinOdds,
  FinalOrder.ValueBet

FROM
  FinalOrder

--WHERE BaseKey = '1stBred' 

ORDER by BaseKey, TotalProfitLoss DESC
