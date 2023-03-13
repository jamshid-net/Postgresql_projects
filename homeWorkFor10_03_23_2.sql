select f.film_name, c.category_name 
from film f 
natural join category c 
where f.category_id in ( 
select category_id from film 
intersect 
select category_id from category 

)


select f.film_name, c.category_name 
from film f 
natural join category c 
where f.category_id in ( 
select category_id from film 
union 
select category_id from category 

)


select student_id from university 
except
select student_id from student 



---COALESCE------

select film_id,category_id, 
coalesce(film_name,'N/A') as Film 
from film

---NULLIF---


---updatetable view--
select * from film

create view test as 
select film_name, category_id 
from film 
where category_id = 2 

select * from test 

insert into test(film_name,category_id) 
values('Donkey men',3)

update  test 
set film_name = 'unknown' 
where film_name = 'Donkey men'

