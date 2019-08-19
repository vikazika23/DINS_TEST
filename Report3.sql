select accounts.Name, zap.c from accounts 
inner join (select UID, sum(0.04*(Timestamp_end - Timestamp_start)) as c 
from call_logs where call_logs.To not in (select Phone_number from numbers) 
and Call_dir="out" group by UID) as zap 
on zap.UID=accounts.UID inner join numbers 
on numbers.UID=accounts.UID 
order by zap.c desc 
limit 10;
