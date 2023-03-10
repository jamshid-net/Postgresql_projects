select * from science 
select * from student
select * from teacher 

--inner join--
select u.science, s.student_name, t.teacher_name 
from university u 
join student s 
on u.student_id = s.student_id
join teacher t
on u.teacher_id = t.teacher_id 

--left join--

select u.science, s.student_name, t.teacher_name 
from university u 
left join student s 
on u.student_id = s.student_id
left join teacher t
on u.teacher_id = t.teacher_id 

--left outer join--
select u.science, s.student_name, t.teacher_name 
from university u 
left join student s 
on u.student_id = s.student_id
left join teacher t
on u.teacher_id = t.teacher_id 
where s.student_id is null 
or
t.teacher_id is null 

--right join--
select u.science, s.student_name, t.teacher_name 
from university u 
right join student s 
on u.student_id = s.student_id
right join teacher t
on u.teacher_id = t.teacher_id 

--right outer join--
select u.science, s.student_name, t.teacher_name 
from university u 
right join student s 
on u.student_id = s.student_id
right join teacher t
on u.teacher_id = t.teacher_id 
where u.student_id is null 
or
u.teacher_id is null 

--full join--
select u.science, s.student_name, t.teacher_name 
from university u 
full join student s 
on u.student_id = s.student_id
full join teacher t
on u.teacher_id = t.teacher_id 

--full outer join--

select u.science, s.student_name, t.teacher_name 
from university u 
full join student s 
on u.student_id = s.student_id
full join teacher t
on u.teacher_id = t.teacher_id 
where u.student_id is null 
or s.student_id is null
or u.teacher_id is null 
or t.teacher_id is null

--using join-- 
select u.science, s.student_name, t.teacher_name 
from university u 
join student s using(student_id)
join teacher t using(teacher_id) 

--using left join--
select u.science, s.student_name, t.teacher_name 
from university u 
left join student s using(student_id)
left join teacher t using(teacher_id) 

--using right join--
select u.science, s.student_name, t.teacher_name 
from university u 
right join student s using(student_id)
right join teacher t using(teacher_id)  


--using full join--
select u.science, s.student_name, t.teacher_name 
from university u 
full join student s using(student_id)
full join teacher t using(teacher_id)  

--natural join--
select u.science, s.student_name, t.teacher_name 
from university u 
natural join student s 
natural join teacher t 

--natural left join-- 
select u.science, s.student_name, t.teacher_name 
from university u 
natural left join student s 
natural left join teacher t 

--natural right join--
select u.science, s.student_name, t.teacher_name 
from university u 
natural right join student s 
natural right join teacher t 

--cross join-- 
select u.science, s.student_name, t.teacher_name 
from university u 
cross join student s 
cross join teacher t 



