select * from film;
select * from companyfilm;
select * from category;

--inner join--  
select com.company_name, f.film_name, c.category_name 
from film f
join companyfilm com
on f.company_id = com.company_id
join category c 
on f.category_id = c.category_id;

--left join--
select com.company_name, f.film_name, c.category_name 
from film f
left join companyfilm com
on f.company_id = com.company_id
left join category c 
on f.category_id = c.category_id;

--left outer join -- 
select com.company_name, f.film_name, c.category_name 
from film f
left join companyfilm com
on f.company_id = com.company_id
left join category c 
on f.category_id = c.category_id
where com.company_id is null or c.category_id is null
--right join--
select com.company_name, f.film_name, c.category_name 
from film f
right join companyfilm com
on f.company_id = com.company_id
right join category c 
on f.category_id = c.category_id; 

--right outer join--
select com.company_name, f.film_name, c.category_name 
from film f
right join companyfilm com
on f.company_id = com.company_id
right join category c 
on f.category_id = c.category_id
where f.company_id is null or f.category_id is null

--full join--
select com.company_name, f.film_name, c.category_name 
from film f
full join companyfilm com
on f.company_id = com.company_id
full join category c 
on f.category_id = c.category_id;  

--full outer join--
select com.company_name, f.film_name, c.category_name 
from film f
full join companyfilm com
on f.company_id = com.company_id
full join category c 
on f.category_id = c.category_id
where 
f.company_id is null or
com.company_id is null or 
f.category_id is null or 
c.category_id is null

--natural join (like inner join)--
select com.company_name, f.film_name, c.category_name 
from film f
natural join companyfilm com
natural join category c 

--natural left join--

select com.company_name, f.film_name, c.category_name 
from film f
natural left join companyfilm com
natural left join category c 

--natural right join--

select com.company_name, f.film_name, c.category_name 
from film f
natural right join companyfilm com
natural right join category c  

--natural full join-- 

select com.company_name, f.film_name, c.category_name 
from film f
natural full join companyfilm com
natural full join category c  


--using inner join-- 
select com.company_name, f.film_name ,c.category_name 
from film f
join companyfilm com Using(company_id)
join category c Using(category_id) 

--using left join--

select com.company_name, f.film_name ,c.category_name 
from film f
left join companyfilm com Using(company_id)
left join category c Using(category_id) 

--using right join--
select com.company_name, f.film_name ,c.category_name 
from film f
right join companyfilm com Using(company_id)
right join category c Using(category_id) 

--using full join--
select com.company_name, f.film_name ,c.category_name 
from film f
full join companyfilm com Using(company_id)
full join category c Using(category_id) 

--cross join -- 
select com.company_name, f.film_name ,c.category_name 
from film f
cross join companyfilm com 
cross join category c



