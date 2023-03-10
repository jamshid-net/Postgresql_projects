
select s.company_name , count(p.supplier_id) 
from suppliers s 
join products p 
on p.supplier_id = s.supplier_id
group by s.company_name 

-- har bir company nechta product jonatilvotganini gruhlanvotdi, misol uchul Heli Süßwaren GmbH & Co. KG 3ta productni yetkazib berar ekan--