select a.name, b.cityname 
from a 
full outer join b 
on a.key = b.key 
where a.key is null or b.key is null




select a.name, b.cityname 
from a 
full outer join b 
on a.key = b.key 





select a.name, b.cityname 
from a 
right join b 
on a.key = b.key 
where a.key is null




select a.name, b.cityname 
from a 
left join b 
on a.key = b.key  
where b.key is null








select a.name, b.cityname 
from a 
right join b 
on a.key = b.key 






select a.name, b.cityname 
from a 
left join b 
on a.key = b.key 





select a.name, b.cityname 
from a 
inner join b 
on a.key = b.key 
