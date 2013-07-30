select * into zRaceHistory01To03
from RaceHistory
where RaceDate >= '2001-01-01' and RaceDate <= '2003-12-31';

select * into zHorseHistory01To03
from HorseHistory
where RaceDate >= '2001-01-01' and RaceDate <= '2003-12-31';

select * into zEquibase01To03
from equibase
where RaceDate >= '2001-01-01' and RaceDate <= '2003-12-31';

select * into zDrf01To03
from drf
where RaceDate >= '2001-01-01' and RaceDate <= '2003-12-31';

