--�ε���
--���� ������ ������ �ٲ�°� �ƴ����� ���������� ������� ����
--� ������ �����͸�(ex> 30�� �̻��� ���) ã�� ��� �ε����� ������ �������縦 �ؾ���. �ε����� ������ �Ϻθ� �� �� ����. (�߰����� �˻�, �� �� �߰����� �˻�)
--�⺻Ű�� ����ũ�� �ڵ� �ε���. (�������� �������� ������ ��)
--where ���̳� join ���� �ȿ��� ���� ���Ǵ� �÷�. null���� ���� ���ԵǾ� �ִ� �÷�. �ε��� ����ϸ� ����
--���̺��� ������, ���̺��� ���� ���ŵ� ���� ���� �ε��� �ʿ����.

--create index �ε����� on ���̺��(�÷���);

create index idx_customer_age
on t_student(age);

--index ����
drop index idx_customer_age;

--�� (�������̺�)

--create view ���̸� as ������ ������
--�並 �����ϸ� ���� �� ������ ��� �並 �� �� �ִ�.
create view view_boardlike_cnt
as
select i_board, count(i_board) as like_cnt
    from t_board_like
    group by i_board;

select * from view_boardlike_cnt;


--view ����
drop view view_boardlike_cnt;


--���̺�, �ε���, �� ��ȸ :������ ����
select * from USER_TABLES;
select * from user_indexes;
select * from user_views;