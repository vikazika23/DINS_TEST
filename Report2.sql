select accounts.Name, numbers.Phone_number,zap.c 
from accounts inner join (select UID, count(*) as c from call_logs group by UID) zap 
on zap.UID=accounts.UID inner join numbers 
on numbers.UID=accounts.UID 
order by zap.c desc 
limit 10;
