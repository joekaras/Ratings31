SELECT DISTINCT 
  FinalOrder.OrderKey,
  FinalOrder.Starts,
  FinalOrder.Wins,
  FinalOrder.WinPct,
  FinalOrder.MinOdds,
  FinalOrder.AvgOdds,
  FinalOrder.MaxOdds,
  FinalOrder.TotalWagered,
  FinalOrder.TotalWon,
  FinalOrder.TotalProfitLoss,
  FinalOrder.TotalProfitLossPct,
  FinalOrder.ValueBet,
  FinalOrder.TrkKey
FROM
  FinalOrder
WHERE
  (FinalOrder.BaseKey = 'MLKey')
