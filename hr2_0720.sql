--distinct : �ߺ�����

select distinct job_id, manager_id from employees;      --(job_id, manager_id)�� ��� �ߺ��� ����.

--lpad: phone_number �� 3�ڸ� ����ϰ�ʹ�. (lpad(number,3,0) : number�� 3�ڸ��� ����ϰ� ���� ���ڸ��� �ִٸ� 0���� ä��ڴ�)
select lpad(phone_number,3), max(salary) from employees group by lpad(phone_number,3) having max(salary) >= 10000;

--cast('0' as number) : ����ȯ �Լ�. ���ڿ� 0�� number�� �ٲ��ش�.
--cast(salary as number) : salary�� number�� ��ȯ�ؼ� ����Ѵ�.
select cast(salary as number) from employees;

--sysdate : ���� �ð� �߰����ִ� �Ӽ�.
select to_char(sysdate,'mm-dd/yyyy hh:MI:ss') as ����ð� from dual;  -- 07-20/2020 10:49:04 ���
select sysdate from dual; -- 20/07/20 ���� ��¥ ���

--------------------------------------------------------------------------------

--����

create table t_hobby(
    i_hobby number primary key,
    nm varchar2(30) not null
);

insert into t_hobby values (6,'���α׷���');

select * from t_hobby;

commit;

create table t_student_hobby(
    i_student number,
    i_hobby number,
    r_dt date default sysdate,
    primary key(i_student,i_hobby),
    foreign key(i_student) references t_student(i_student) on delete cascade,         --�ܷ�Ű �������ָ� �� ���̺��� i_student ������ t_student(i_student)�� �����ϴ� ���� ���� �� �ִ�.
    foreign key(i_hobby) references t_hobby(i_hobby) on delete cascade                --on delete cascade �Ӽ� �������ָ� �����ϰ� �ִ� ���̺��� ���� �����ص� ���� ������.(������ ���� �ȵ�)
);

insert into t_student_hobby(i_student, i_hobby) values (1,2);
insert into t_student_hobby(i_student, i_hobby) values (1,4);
insert into t_student_hobby(i_student, i_hobby) values (2,1);
insert into t_student_hobby(i_student, i_hobby) values (3,5);
insert into t_student_hobby(i_student, i_hobby) values (3,3);
insert into t_student_hobby(i_student, i_hobby) values (3,1);
