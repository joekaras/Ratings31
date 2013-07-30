update Track
set IsPTCTrack = False
where
trkcode = 'LAD'
;

update entry
set IsPTCTrack = False
where trkcode = 'LAD'
;

update race
set IsPTCTrack = False
where
trkcode = 'LAD'
;


