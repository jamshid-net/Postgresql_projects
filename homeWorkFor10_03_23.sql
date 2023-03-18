--groupby--
select employee_id, string_agg(territory_id,', '), count(territory_id) 
from employee_territories 
group by employee_id 
order by employee_id asc

select c.contact_name, count(o.customer_id) as count_of_orders
from orders o 
natural join customers c 
group by c.contact_name 
having  count(o.customer_id)>5

select * from orders 
where ship_country in ('Mexico','Germany','Brazil') 

select * from orders 
where ship_country = any (select ship_country from orders 
						 where ship_country = 'Mexico')  
						  

select min(unit_price)
from products 
where units_in_stock > 5000

select * from customers 
where contact_name similar to '%(T|t)on%'
select * from customers 
where contact_name like '%Ton%' 


select * from suppliers 

select * from employees

select country from suppliers 
except 
select country from employees
------------------


select country from customers 
except all
select country from suppliers


select count(country) 
from suppliers where
country = 'UK' 

--all--
select *
from orders o
where   6>all( 
select length(city) from customers c
	where c.customer_id = o.customer_id 
	
) 
--any--
select *
from orders o
where   6>=any( 
select length(city) from customers c
	where c.customer_id = o.customer_id 
	
) 

select distinct c.customer_id, c.contact_name
from customers c 
join orders o using(customer_id) 
where o.freight> 40 


select customer_id, contact_name 
from customers 
where customer_id = any ( select customer_id 
						from orders 
						where freight> 40)




SELECT * FROM employees
--all-
select * from orders 
where employee_id > all ( select employee_id from orders 
					 where employee_id = 5)
order by employee_id asc

select * from orders
where employee_id > 5
order by employee_id asc


select  avg(quantity) as avg_quantity
from order_details 
group by product_id
order by product_id 


select * from products 
where units_in_stock > all ( 
select  avg(quantity) as avg_quantity
from order_details 
group by product_id
)

--exists--
select * from order_details t1
where exists ( 
	select 1 from 
products t2  where 
t1.unit_price  = t2.unit_price )  

select 'abc' similar to  '%(b|a)%'  


select company_name, contact_name
from customers c
where exists(select * from 
			orders o 
			where o.freight between 10 and 30 
			and c.customer_id = o.customer_id)


select 'abc' like '%(b|a)%'  

select 'abc' = '%(b|a)%'  

--UNION-- 

select * from orders
select * from order_details
select * from products


select od.order_id
from order_details od
union 
select o.order_id 
from orders o


--CONDITIONAL EXPRESSIONS & OPERATORS---  

select product_name,unit_price,
case 
when unit_price< 10 then  'low price' 
when unit_price> 10 and unit_price <20 then 'Medium price'
else  'High price'
end price_dis
from products 

select order_id, freight , 
case freight 
when 0.02::real then 'used case' 
else 'Case' 
end my_new_column 
from orders 
order by freight asc



---NULLIF-- 

select customer_id, contact_name, coalesce(nullif(region,''),'Unknown') as region 
from customers 
where region is null

select customer_id, contact_name, coalesce(region,'Unknown') as region from customers
where region is null 

select * from products 

select * from customers
select * from suppliers

select coalesce(nullif(c.country, s.country)),s.country
from customers c 
join orders o using(customer_id)
left join order_details od
on o.order_id = od.order_id 
left join products p
on p.product_id = od.product_id 
left join suppliers s using(supplier_id)


select customer_id, ship_name, coalesce(ship_region,'TOPILMADI') as REGION from orders


select c.contact_name,coalesce(nullif(c.country,s.country),'SAME COUNTRY') as customer_country, s.country as supplier_country
from customers c
join orders o using(customer_id)
left join order_details od
on o.order_id = od.order_id 
left join products p
on p.product_id = od.product_id 
left join suppliers s 
on p.supplier_id = s.supplier_id 


