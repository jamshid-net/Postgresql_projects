create table book_category(

	category_id integer primary key,
	category_name varchar(20) 

) 

create table author(
	author_id integer primary key,
	author_name varchar(50) 

)  

create table author_book 
(
	id integer primary key, 
	author_id integer references author(author_id),
	book_id integer references book(book_id)
	

) 

create table book (
  book_id integer primary key, 
	book_title varchar(50), 
	category_id integer references book_category(category_id),
	book_count integer
)

create table users (
	user_id integer primary key,
	user_name varchar(50),
	IsIdentity boolean not null
) 

create table rent_book ( 
	rent_id integer primary key, 
	book_id integer references book(book_id),
	user_id integer references users(user_id),
	employee_id integer references employees(employee_id),
	start_date date,
	end_date date,
	IsReturn boolean not null
) 


create table employees(
	employee_id integer primary key,
	employee_name varchar(20),
	employee_phone character varying(24)
)

create or replace function on_delete_rent_increment_book_count() 
returns trigger 
 LANGUAGE PLPGSQL
  AS
$$
BEGIN 
update book 
set book_count = book_count + 1 

return new;
end; 
$$ 


create or replace function on_insert_rent_decrement_book_count()
returns trigger 
language plpgsql 
as $$ 
begin 
if (new.IsReturn=false) then
  update book
  set book_count = book_count -1
  where book_id = new.book_id;
else 
  update book
  set book_count = book_count + 1
  where book_id = new.book_id;
end if; 
return new;
end; 
$$ 






Create or replace trigger book_count_changes_2 
after update or insert 
on rent_book 
for each row 
execute function on_insert_rent_decrement_book_count();

CREATE OR REPLACE TRIGGER book_count_changes 
after delete 
on rent_book 
For each row 
execute function on_delete_rent_increment_book_count(); 


create table log_rent_history 
(
	log_id serial primary key,
	employee_id integer,
	user_id integer, 
	book_id integer, 
	isReturn boolean,
	changed_on TIMESTAMP(6) NOT NULL


)


CREATE OR REPLACE FUNCTION my_log_rent_changes_func()
returns trigger 
 LANGUAGE PLPGSQL
  AS
$$ 
BEGIN 
insert into log_rent_history(employee_id,user_id,book_id,isReturn,changed_on) 
values(new.employee_id,new.user_id,new.book_id,new.IsReturn,now());
return new;
end;
$$


Create or replace trigger rent_book_changes
after update or insert or delete 
on rent_book 
for each row 
execute function my_log_rent_changes_func();

INSERT INTO book_category (category_id, category_name) VALUES 
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science Fiction'),
(4, 'Romance');

-- Insert authors
INSERT INTO author (author_id, author_name) VALUES 
(1, 'J.K. Rowling'),
(2, 'Stephen King'),
(3, 'Agatha Christie'),
(4, 'Jane Austen'),
(5, 'William Shakespeare');

-- Insert books
INSERT INTO book (book_id, book_title, category_id, book_count) VALUES 
(1, 'Harry Potter and the Philosopher''s Stone', 1, 5),
(2, 'The Shining', 1, 3),
(3, 'Murder on the Orient Express', 1, 2),
(4, 'Pride and Prejudice', 2, 4),
(5, 'Hamlet', 3, 1),
(6, 'Romeo and Juliet', 4, 3);

-- Insert author_book relationships
INSERT INTO author_book (id, author_id, book_id) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 5, 6);

-- Insert users
INSERT INTO users (user_id, user_name, IsIdentity) VALUES 
(1, 'John Doe', true),
(2, 'Jane Smith', false),
(3, 'Bob Johnson', false);

-- Insert employees
INSERT INTO employees (employee_id, employee_name, employee_phone) VALUES 
(1, 'Alice Jones', '+1-555-123-4567'),
(2, 'Bob Brown', '+1-555-987-6543'),
(3, 'Charlie Davis', '+1-555-555-5555');




--------------------------------------------



select * from users 

select * from book 

select * from rent_book 


update rent_book 
set isreturn = true 
where user_id = 1 and book_id=4;



delete from rent_book 
where book_id = 6


select * from log_rent_history 
