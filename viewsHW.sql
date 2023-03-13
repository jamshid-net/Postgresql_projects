create view simple_view as 
select * from orders 
where freight> 20



select customer_id, avg(freight) 
from orders 
group by customer_id




create view complec_view  as
select s.company_name,p.product_name, p.unit_price,  
case 
when unit_price < 20 then 'Low price'
when unit_price >=20 and unit_price < 50  then 'Medium price' 
when unit_price >= 50 then 'High price' 
end price_dis 
from products p 
join suppliers s using(supplier_id) 



create view inline_view as 

select customer_id, avg(freight) as avg_of_freight 
from (  
	select *
	from orders c
) ord
group by customer_id  

create MATERIALIZED VIEW my_mater_view as 
select c.contact_name,coalesce(nullif(c.country,s.country),'SAME COUNTRY') as customer_country, s.country as supplier_country
from customers c
join orders o using(customer_id)
left join order_details od
on o.order_id = od.order_id 
left join products p
on p.product_id = od.product_id 
left join suppliers s 
on p.supplier_id = s.supplier_id 
with no data

select * from orders

--. Managing PostgreSQL Views-- 
create or replace view upatable_exaple as 
select customer_id, ship_country
from orders
where ship_country = 'Mexico'

select * from upatable_exaple 

insert into upatable_exaple(customer_id,ship_country) 
values('CENTC','Mexico')





