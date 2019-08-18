select sum(0.04*(call_logs.Timestamp_end - call_logs.Timestamp_start)) 
from call_logs 
where call_logs.Call_dir = "out" and call_logs.To not in (select Phone_number from numbers);
