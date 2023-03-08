select * from orders  
select * from customers

select * from employees   

select o.order_id, o.customer_id, e.last_name 
from orders as o 
inner join employees as e  
on o.employee_id = e.employee_id

select o.order_id, o.customer_id, e.last_name 
from orders as o 
left join employees as e  
on o.employee_id = e.employee_id 


select o.order_id, o.customer_id, e.last_name 
from orders as o 
right join employees as e  
on o.employee_id = e.employee_id 

SELECT o.customer_id, o.employee_id, c.country, e.country FROM orders as o
INNER JOIN employees as e ON o.employee_id = e.employee_id AND e.country = 'USA'
INNER JOIN customers as c ON o.customer_id = c.customer_id AND c.country = 'Canada'; 



select * from products
