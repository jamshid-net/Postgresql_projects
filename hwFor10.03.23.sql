select * from university

select s.student_name, count(u.teacher_id) 
from university u
natural join student s
group by s.student_name 
having length(s.student_name)>11 and count(u.teacher_id) >1