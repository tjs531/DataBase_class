--distinct : 중복제거

select distinct job_id, manager_id from employees;      --(job_id, manager_id)를 묶어서 중복이 없음.

--lpad: phone_number 를 3자리 출력하고싶다. (lpad(number,3,0) : number를 3자리로 출력하고 만약 빈자리가 있다면 0으로 채우겠다)
select lpad(phone_number,3), max(salary) from employees group by lpad(phone_number,3) having max(salary) >= 10000;

--cast('0' as number) : 형변환 함수. 문자열 0을 number로 바꿔준다.
--cast(salary as number) : salary를 number로 변환해서 출력한다.
select cast(salary as number) from employees;

--sysdate : 지금 시간 뜨게해주는 속성.
select to_char(sysdate,'mm-dd/yyyy hh:MI:ss') as 현재시간 from dual;  -- 07-20/2020 10:49:04 출력
select sysdate from dual; -- 20/07/20 현재 날짜 출력

--------------------------------------------------------------------------------

--조인

create table t_hobby(
    i_hobby number primary key,
    nm varchar2(30) not null
);

insert into t_hobby values (6,'프로그래밍');

select * from t_hobby;

commit;

create table t_student_hobby(
    i_student number,
    i_hobby number,
    r_dt date default sysdate,
    primary key(i_student,i_hobby),
    foreign key(i_student) references t_student(i_student) on delete cascade,         --외래키 지정해주면 이 테이블의 i_student 값에는 t_student(i_student)에 존재하는 값만 들어올 수 있다.
    foreign key(i_hobby) references t_hobby(i_hobby) on delete cascade                --on delete cascade 속성 지정해주면 참조하고 있는 테이블에서 값을 삭제해도 같이 삭제됨.(원래는 삭제 안됨)
);

insert into t_student_hobby(i_student, i_hobby) values (1,2);
insert into t_student_hobby(i_student, i_hobby) values (1,4);
insert into t_student_hobby(i_student, i_hobby) values (2,1);
insert into t_student_hobby(i_student, i_hobby) values (3,5);
insert into t_student_hobby(i_student, i_hobby) values (3,3);
insert into t_student_hobby(i_student, i_hobby) values (3,1);
