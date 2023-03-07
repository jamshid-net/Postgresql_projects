insert into users(username, enabled) values
('Franklin123',true),
('Elyor98',true),
('Bob44',true) 

select * from users

insert into books(title, author,published_date,isbn)values
('The Nightingale', 'Kristin Hannah', '2015-02-03', 577223),
('The Alchemist', 'Paulo Coelho', '1988-01-01', 122415),
('To Kill a Mockingbird', 'Harper Lee', '1960-07-11', 310789),
('The Hunger Games', 'Suzanne Collins', '2008-09-14', 023481),
('The Girl with the Dragon Tattoo', 'Stieg Larsson', '2005-08-23', 272119),
('The Hobbit', 'J.R.R. Tolkien', '1937-09-21', 260300);
 
 alter table users_books 
 alter column book_id type integer
 
 
 insert into reviews(user_id,book_id,review_content,published_date) 
 values(2,577223,'Content.....','2015-02-03'),
 (2,122415,'Content.....','1988-01-01'),
 (1,260300,'Content.....','1937-09-21') 
 
 insert into addresses(user_id,street,city,state) 
 values (1,'','newyork','usa'),
 (2,'no street','Tash','Uzb') , 
 (3,'','Washington','Usa')
 
insert into users_books(user_id,book_id,checkout_date,return_date)
values(1,260300,'07-03-2023','10-03-2023'),
(2,122415,'07-03-2023','10-03-2023'), 
(3,577223,'07-03-2023','10-03-2023')