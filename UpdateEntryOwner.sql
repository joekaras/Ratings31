update entry 
set entry.owner = XferOwner.ActualOwnerName 
from entry, XferOwner 
where entry.owner = XferOwner.Owner


