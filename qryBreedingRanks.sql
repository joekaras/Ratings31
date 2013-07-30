select SireName,
      TurfThisYearRank,
      TurfLastYearRank,
      GeneralThisYearRank,
      GeneralLastYearRank,
      JuvenileThisYearRank,
      JuvenileLastYearRank
from Sire
where (TurfThisYearRank > 0) or
      (TurfLastYearRank > 0) or
      (GeneralThisYearRank > 0) or
      (GeneralLastYearRank > 0) or
      (JuvenileThisYearRank > 0) or
      (JuvenileLastYearRank > 0)



