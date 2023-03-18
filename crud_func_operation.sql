
select * from avg_each_price_product()

CREATE OR REPLACE FUNCTION  avg_each_price_product()
RETURNS TABLE (Contact_name varchar(40),avg_price float) AS $$
BEGIN
  RETURN QUERY select  c.contact_name,avg(p.unit_price)
		from orders o 
		natural join customers c
		natural join order_details 
		natural join products p  
		group by c.contact_name;
END;
$$ LANGUAGE plpgsql; 


select * from avg_each_price_product('update',23,'ism_fam');


create table person( 
	id serial primary key, 
	name varchar(50),
	age integer 

) 
select * from insert_person('Bob',22);

select * from delete_person(2);  


select * from person




create or replace function insert_person(p_name varchar(50),p_age integer) 
returns table (id INT, name VARCHAR(50),age integer) as $$ 
begin 
 insert into person(name,age) values (p_name,p_age);
 return query select * from person ;
 end; 
 $$ language plpgsql; 
 
 create or replace function update_person(p_id integer,p_name varchar(50),p_age integer) 
 returns table (id INT, name VARCHAR(50),age integer) as $$ 
begin 
  update person 
  set name = p_name, age = p_age 
  where person.id = p_id; 
  return query select * from person; 
  end;
  $$ language plpgsql;
 
 
 
  create or replace function delete_person(p_id integer) 
 returns table (id INT, name VARCHAR(50),age integer) as $$ 
begin 
  delete from person 
  where person.id = p_id; 
  return query select * from person; 
  end;
  $$ language plpgsql; 
  
select * from person
 
create or replace function crud_person
(operation varchar(20) default 'select',p_id integer default 0,p_name varchar(50) default '',p_age integer default 0) 
returns table (id INT, name VARCHAR(50),age integer) as $$ 
begin 
case 
when operation = 'insert' then return query select * from insert_person(p_name,p_age);
when operation = 'select' then return query select * from select_person();
when operation = 'update' then return query select * from update_person(p_id,p_name,p_age);
when operation = 'delete' then return query select * from delete_person(p_id);
  end case;
 
  end;
  $$ language plpgsql; 

  
select * from crud_person('delete',5,'fff');
  




