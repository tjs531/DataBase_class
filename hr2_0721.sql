--inner ���� (������: �� ���̺��� �ְ� �� ���̺��̵� �ִ� �� �� ��Ÿ����)

select 
    A.i_student,B.nm as student_name,
    A.i_hobby,c.nm as hobby_name 
from t_student_hobby A
inner join t_student B
on A.i_student = B.i_student
inner join t_hobby C
on A.i_hobby = C.i_hobby;

--Left���� (���ʿ� �ִ� ���̺��� ����. ���� ���̺��� ������ ��´�. �����Ұ� ������ null�� ó��)
--A���̺� �ִ°� �� ��� (B�� C�� ��� A�� ������ ��Ÿ��(B�� C�� ���°Ÿ� nulló��))

select 
    A.i_student,B.nm as student_name,
    A.i_hobby,c.nm as hobby_name 
from t_student_hobby A
Left join t_student B
on A.i_student = B.i_student    --���ʿ� �ִ� �� ���� (A����)
left join t_hobby C
on A.i_hobby = C.i_hobby;       --���ʿ� �ִ� ���̺�(A) ����

--inner �� left ������ ����.
--ex> �Խ��� ���̺�� ���ƿ� ���̺��� ������, �̳������� �ɸ� ���ƿ䰡 ���� �Խ��Ǹ� ���. (1,2,3�� �Խù� �� 1�� �Խù����� ���ƿ䰡 ���ȴٸ� 1�� ���̺� ��� (������))
-- but �Խ��� ���̺� �������� left������ �ɸ� ��� �Խñ��� ������ ���ƿ䰡 ���� �Խñ��� ���ƿ� null���·� ����. (�Խù� 1,2,3�� �� ��µǰ� ���ƿ䰡 ������ ���ƿ䰪 null)



-------------���̺� ����� - ----------------------------

create table t_board(
    i_board number primary key,
    title varchar2(100) not null,
    ctnt varchar2(2000) not null,
    i_student number not null,
    foreign key (i_student) references t_student(i_student)
);

comment on column t_board.i_student IS '�ۼ���';           --�ڸ�Ʈ �޾Ƴ����� �ľ��ϱⰡ ����. (���̺��� �� ������ ���� �ڸ�Ʈ �� �� ����)

insert into t_board(i_board, title, ctnt, i_student) values (1,'�ȳ�','112122',3);
insert into t_board(i_board, title, ctnt, i_student) values (2,'�ϼ���','������',3);
insert into t_board(i_board, title, ctnt, i_student) values (3,'����','�޷�',3);
insert into t_board(i_board, title, ctnt, i_student) values (4,'����ÿ�','��',3);
insert into t_board(i_board, title, ctnt, i_student) values (5,'�ٺ�','������',3);

update t_board set i_student=2 where i_board=4;


commit;
rollback;

select * from t_board;

create table t_board_like(
    i_board number,
    i_student number,
    primary key(i_board, i_student),
    foreign key(i_board) references t_board(i_board),
    foreign key(i_student) references t_student(i_student)
);

insert into t_board_like(i_board, i_student) values (1,1);
insert into t_board_like(i_board, i_student) values (1,2);
insert into t_board_like(i_board, i_student) values (1,3);
insert into t_board_like(i_board, i_student) values (2,1);

select * from t_board_like;

select i_board, count(i_board) as like_cnt
from t_board_like
group by i_board;


--select ������ ���� ����� join�� ���� ����. (��������)

select A.i_board, A.title, C.nm, nvl(B.like_cnt,0) as like_count           -- nvl : null�� ������ ���� 0���� �ٲ��ֱ�. (���ƿ� ī��Ʈ ����ϴµ�, ���ƿ䰡 ���� �ֵ��� null��� 0 ���)
from t_board A
left join (
    select i_board, count(i_board) as like_cnt
    from t_board_like
    group by i_board
) B
on A.i_board = B.i_board
inner join t_student C          --�����ո� ���.
on A.i_student = C.i_student
--where b.i_board is null         --���ƿ䰡 ���� �� ã��
order by nvl(b.like_cnt, 0) desc;

--inner �� left ������ ����� �ᵵ ������� ��찡 ������ (���ʿ� �ִ� ���̺��� ������ �ϴ� ������ ���)
--���� ���̺��� ������ ���ϴ� ���� left, inner ����� �޶�����.