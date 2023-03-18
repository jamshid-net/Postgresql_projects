create table reviewer( 
	rev_id integer primary key, 
	rev_name varchar(30) not null
	

); 
create table rating(
	id integer primary key,
	mov_id integer references movie(mov_id),
	rev_id integer references reviewer(rev_id),
	rev_stars integer not null



);


create table movie( 
	mov_id integer primary key,
	mov_title varchar(50) ,
	mov_date date not null,
	mov_rel_country varchar(50)
	
); 

create table director( 
	dir_id integer primary key,
	dir_firstname varchar(20),
	dir_lastname varchar(20)

)
create table movie_direction(
	id integer primary key,
	dir_id integer references director(dir_id),
	mov_id integer references movie(mov_id)


);  

create table actor( 
     act_id integer primary key,
	 act_firstname varchar(20),
	act_lastname varchar(20)

);

create table movie_cast(
	id integer primary key, 
	act_id integer references actor(act_id),
	mov_id integer references movie(mov_id)

)  

create table categories(
	category_id integer primary key,
	category_title varchar(20)

) 

create table movie_categories(
	id integer primary key,
	mov_id integer references movie(mov_id),
	category_id integer references categories(category_id)


)


create table movie_total_rating( 
	id serial primary key, 
	mov_id integer references movie(mov_id),
	total_rating float not null


) 

create table rating_log(
	id_table serial primary key,
	mov_id integer, 
	rev_id integer,
	rev_stars integer,
	 who_changed VARCHAR(20) DEFAULT current_user,
	changed_time TIMESTAMP DEFAULT now()
) 

create table movie_changes_log(
	id_table serial primary key,
	mov_id integer,
	mov_title varchar(50),
	mov_date date,
	mov_rel_country varchar(50),
	 who_changed VARCHAR(20) DEFAULT current_user,
	changed_time TIMESTAMP DEFAULT now()
) 

create or replace function movie_changes_log_function() 
returns trigger as $$ 
begin 
insert into movie_changes_log(mov_id,mov_title,mov_date,mov_rel_country) 
values(old.mov_id,old.mov_title,old.mov_date,old.mov_rel_country) ;
return new;
end;
$$ language plpgsql; 

create or replace trigger movie_changes_log_trigger 
after update or delete 
on movie 
for each row 
execute function movie_changes_log_function();


create or replace function rating_table_changes_log_function()
returns trigger as $$ 
begin 
insert into rating_log(mov_id,rev_id,rev_stars) 
values(old.mov_id,old.rev_id,old.rev_stars);
return new;
end;
$$ LANGUAGE plpgsql; 

create or replace trigger my_rating_table_changes_trigger 
after update or delete 
on rating 
for each row 
execute function rating_table_changes_log_function();



select current_user

create or replace function movie_rating_setter()
returns trigger as $$
begin 

insert into movie_total_rating(mov_id, total_rating)
  select new.mov_id, avg(rev_stars)
  from rating
  where mov_id = new.mov_id
  group by mov_id;
  
  return new; 
  
  end; 
$$ LANGUAGE plpgsql; 

create or replace trigger my_movie_rating_setter_trigger
after insert or update 
on rating 
for each row 
execute function movie_rating_setter();


--- insert values ----




-- movie table


-- director table

INSERT INTO movie_categories (id,mov_id, category_id)
VALUES
  (1,1, 1),
  (2,1, 2),
  (3,2, 1),
  (4,2, 3),
  (5,3, 2),
  (6,3, 3),
  (7,4, 1),
  (8,5, 3),
  (9,6, 1),
  (10,7, 2); 
  
  
 

select * from movie_total_rating


select * from movie_changes_log





