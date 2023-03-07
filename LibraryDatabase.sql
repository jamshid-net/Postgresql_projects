create table users( 
	
	id serial primary key, 
	username varchar(25) not null,
	enabled boolean not null

) 

create table addresses (
    user_id serial primary key unique, 
	street varchar(30),
	city varchar(30) not null,
	state varchar(30) not null, 
	Constraint fk_users 
	foreign key (user_id)  references users(id)
	

) 

create table books 
(
	id serial primary key,
	title varchar(100),
	author varchar(100) not null,
	published_date date, 
	isbn integer unique
	

) 

create table reviews(
  id serial primary key,
	user_id integer,
	book_id integer,
	review_content varchar(255),
	published_date date , 
	constraint fk_users foreign key (user_id) references users(id),
	constraint fk_books foreign key (book_id) references books(isbn)


)


create table users_books(

	user_id serial primary key unique,
	book_id serial unique, 
	checkout_date date,
	return_date date, 
	constraint fk_user_id foreign key (user_id) references users(id),
	constraint fk_book_id foreign key (book_id) references books(isbn)


)