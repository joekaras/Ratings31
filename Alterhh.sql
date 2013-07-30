
ALTER TABLE ENTRY
REDEFINE IF EXISTS IsBoolean17 IsUnexpectedEarlySpeed,
REDEFINE IF EXISTS IsBoolean18 IsTrnDebutPlus        ,
REDEFINE IF EXISTS IsBoolean19 IsTrnDebutTwoPlus     ,
REDEFINE IF EXISTS IsBoolean20 IsTrn2yoPlus          ,
REDEFINE IF EXISTS IsBoolean21 IsTrnTurfPlus         ,
REDEFINE IF EXISTS IsBoolean22 IsTrnTodayPlus        ,
REDEFINE IF EXISTS IsBoolean23 IsTrnTodayMinus       ;

ALTER TABLE HorseHistory
REDEFINE IF EXISTS IsBoolean17 IsUnexpectedEarlySpeed,
REDEFINE IF EXISTS IsBoolean18 IsTrnDebutPlus        ,
REDEFINE IF EXISTS IsBoolean19 IsTrnDebutTwoPlus     ,
REDEFINE IF EXISTS IsBoolean20 IsTrn2yoPlus          ,
REDEFINE IF EXISTS IsBoolean21 IsTrnTurfPlus         ,
REDEFINE IF EXISTS IsBoolean22 IsTrnTodayPlus        ,
REDEFINE IF EXISTS IsBoolean23 IsTrnTodayMinus       ;
