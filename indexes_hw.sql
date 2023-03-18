create table Persons(
	id serial primary key, 
	name varchar(50) ,
	age integer 


) 
-------------------------------                         9.999.999

do $$ 
declare 
i int := 1;
begin 
while i<10000000 LOOP 
insert into Persons(name,age) 
values('name' || i,random()*100+1);
i:=i+1;
end loop ;
end $$;

select * from Persons
where name = 'name9999111' 

select * from Persons 
where id = 9999111