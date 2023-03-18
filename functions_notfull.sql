create or replace function avg_of_freight() returns float8 as $$ 
select avg(freight) from orders
$$ language sql

select avg_of_freight()

create or replace function avg_price_of_product_usa() returns float8 as $$ 
select avg(p.unit_price) 
from products p 
natural join suppliers s
where s.country = 'USA'
$$ language sql

select avg_price_of_product_usa()
select * from suppliers 


create or replace function get_product_price_by_name(proc_name varchar(40)) returns float as $$ 
select unit_price from products 
where proc_name = product_name 
$$ language sql


create or replace function max_min_price_product(out max_unit_price real, out min_unit_price real)  as $$ 
select max(unit_price),min(unit_price) from products 
$$ language sql
select * from max_min_price_product()
select * from products 

select product_id, product_name from products



select * from products where product_id = 5 
--Procedures-- 





