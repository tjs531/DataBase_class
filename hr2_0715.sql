update t_student set nm='정혜선' where i_student=1;

select * from t_student;
update t_student set nm='정혜선' where age in (23,24);

rollback;

delete from t_student where i_student in (1,2,3);

select * from t_student where i_student in (select i_student from t_student where i_student > 4) 
order by age asc,i_student desc;

insert into t_student(i_student,nm,age) values (15,' ', 20);

select first_name, substr(first_name,2,3) from employees;
select first_name, instr(first_name, 'a') from employees;   --first_name에서 a의 위치값 출력

select i_student,subsrt(nm,1,2) from t_student;
