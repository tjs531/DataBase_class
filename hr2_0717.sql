
--2020.07.17
-- max(): �ִ밪 min():�ּҰ� avg():��հ� count(): ī��Ʈ sum(): �հ� 
-- group by ��
-- decode, case��




select max(salary),min(salary),round(avg(salary)),count(commission_pct) from employees where commission_pct is null;   --count()�� null�� ī��Ʈ ���� �ʴ� ��..

--ceil(): �ø�, floor():���� , round():�ݿø�, trunc(a,3): a�� �Ҽ��� 3�ڸ��������� ������ �Ѵ�.

select trunc(12,3) from dual;  --�Ϻη� �Ҽ��� �ڿ� .00�� �����Դ� �ȵ�.

--Group by ��

select job_id, max(salary) from employees group by job_id;      --�׷캰�� �ִ� �޿�.

select job_id, manager_id, max(salary) from employees group by job_id, manager_id order by job_id, manager_id;      --�μ��� �ȿ��� �Ŵ��� ���̵� ���� ���� �� ���ϱ�.

select job_id, max(salary) from employees group by job_id having count(*) >=5;          --Group by�ȿ� ���� �ɶ��� having (5�� �̻��� �μ��� �����ֱ�)

select job_id, max(salary) from employees where commission_pct is null group by job_id having count(*) >=5;    --where�� order by �տ�. where �������� �ɷ��� �ֵ��߿� group by�� ������.



--DECODE(job_id, 'IT_PROG', '���α׷���', '') : job_id���� IT_PROG���� '���α׷���'��� ���, ������ ������ null�ε� null�� ��쿡�� ''(��ĭ) ��� (���� ���� �ٲ�� ���� �ƴ�)
--NVL(a,' ') : a�� null�̸� ' '(��ĭ) ��� (�ٸ� �� ��µ� ����) --mysql ������ selese ifnull(�÷���,'')
--nvl(�÷���, '') as �÷��� : as �÷��� �����ָ� �÷����� nvl(�÷���,'')�� �״�� ��µż� as�÷��� ����� ����.

select job_id, NVL(decode(job_id,'IT_PROG', '���α׷���'
                                 ,'FI_ACCOUNT','������'),' ') 
from employees;

--���� DECODE�� �Ʒ� CASE�� �Ȱ��� ���.
--(case a when b then c else d end) : a�� b�� ������ c�� ���. �ƴϸ� d�� ���.
--(case a when b then c when d then e else f end) :when then�� ������ �� �� ����. (else�� ���� ����)
select job_id,
case job_id when 'IT_PROG' then '���α׷���'
            when 'FI_ACCOUNT' then '������'
            when 'AD_VP' then '���̵� ������'
            else ' ' END
from employees;

--Case�� �̷������ε� �� �� ����. (���� �ְ� ���. (case when ���� then ��� else �� �� end))
select salary, case when salary >= 10000 then salary * 2 else salary end as calcSalary from employees;  --10000�� �Ѵ� ��쿡�� salary *2 , �ƴ� ��쿡�� �״�� ���.



