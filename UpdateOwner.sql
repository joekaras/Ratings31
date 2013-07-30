update owner 
set Owner.ActualOwnerName = TrainerOwnerSummary.ActualOwnerName 
from owner, TrainerOwnerSummary 
where TrainerOwnerSummary.owner = Owner.Owner


