update Track
set IsYouBetTrack = True,
   IsPrintedOnValueSheet = True,
   IsPrintedOnValueSheetMon = True,
   IsPrintedOnValueSheetTue = True,
   IsPrintedOnValueSheetMonTue = True,
   IsPrintedOnValueSheetWed = True,
   IsPrintedOnValueSheetThu = True,
   IsPrintedOnValueSheetFri = True,
   IsPrintedOnValueSheetSat = True,
   IsPrintedOnValueSheetSun = True
where trkcode = 'LS' or trkcode = 'LRL' or trkcode = 'BEU' or trkcode = 'RD' or trkcode = 'CT'  ;

update entry
set IsYouBetTrack = True,
    IsPrintedOnValueSheet = True  
where trkcode = 'LS' or trkcode = 'LRL' or trkcode = 'BEU' or trkcode = 'RD' or trkcode = 'CT'  ;


update race
set IsYouBetTrack = True,
    IsPrintedOnValueSheet = True  
where trkcode = 'LS' or trkcode = 'LRL' or trkcode = 'BEU' or trkcode = 'RD' or trkcode = 'CT'  ;

