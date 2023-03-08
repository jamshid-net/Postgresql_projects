select p.product_name,s.contact_name, ca.description from products  as p
inner join suppliers as s on s.supplier_id = p.supplier_id
inner join categories as ca
 on p.category_id = ca.category_id





select * from products 

select * from suppliers 


select * from categories