CREATE TABLE t_student2 (
    i_student number,
    nm varchar2(15) not null,
    age number(10,2) not null,
    primary key(i_student)
);

commit;

INSERT INTO t_student
(i_student, nm, age)
VALUES
(3,'���ϱ�',20);

INSERT INTO t_student
(i_student, nm, age)
VALUES
(5,'������',24);

INSERT INTO t_student
(i_student, nm, age)
VALUES
(6,'������',24);

INSERT INTO t_student
(i_student, nm, age)
VALUES
(7,'������',26);

INSERT INTO t_student
(i_student, nm, age)
VALUES
(8,'���缷',23);

INSERT INTO t_student
(i_student, nm, age)
VALUES
(9,'��ȿ��',23);

UPDATE t_student 
SET age=22
WHERE i_student=5;

DELETE FROM t_student
WHERE i_student=3;

SELECT * FROM t_student 
WHERE (i_student <=3 and age<=21) or i_student=5
ORDER BY i_student;

SELECT * FROM t_student order by nm asc, age desc;

SELECT * FROM t_student order by age desc, nm;

select 1+1 as result from dual;

select 2 as dd, 'ȣȣ' as nm, i_student from t_student
union all
select 1 as dd, '����' as nm, i_student from t_student;

select * from t_student where nm like '��%';




--employees ���̺��� ��ȭ��ȣ(PHONE_NUMBER) 423�� ���Ե� ����� ��� ��������.

select * from employees where phone_number like '%.423.%';

commit;