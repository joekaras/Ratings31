update HorseHistory
set HorseHistory.owner = XferOwner.ActualOwnerName 
from HorseHistory, XferOwner 
where HorseHistory.owner = XferOwner.Owner


