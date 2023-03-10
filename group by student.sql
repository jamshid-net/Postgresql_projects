select student_id,count(teacher_id)
from university
group by student_id 


select s.student_name, count(u.teacher_id)
from university u
join student s 
on s.student_id = u.student_id 
join teacher t 
on t.teacher_id = u.teacher_id 
group by  s.student_name 

----------------

