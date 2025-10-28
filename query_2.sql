select sum("amount") as "total_amount", "ship-state" as "state" 
from raw 
group by "ship-state"
order by "total_amount" desc;
