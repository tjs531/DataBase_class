
--2020.07.17
-- max(): 최대값 min():최소값 avg():평균값 count(): 카운트 sum(): 합계 
-- group by 절
-- decode, case문




select max(salary),min(salary),round(avg(salary)),count(commission_pct) from employees where commission_pct is null;   --count()는 null은 카운트 하지 않는 듯..

--ceil(): 올림, floor():내림 , round():반올림, trunc(a,3): a가 소수점 3자리수까지만 나오게 한다.

select trunc(12,3) from dual;  --일부러 소수점 뒤에 .00이 나오게는 안됨.

--Group by 절

select job_id, max(salary) from employees group by job_id;      --그룹별로 최대 급여.

select job_id, manager_id, max(salary) from employees group by job_id, manager_id order by job_id, manager_id;      --부서별 안에서 매니저 아이디 별로 각각 값 구하기.

select job_id, max(salary) from employees group by job_id having count(*) >=5;          --Group by안에 조건 걸때는 having (5명 이상인 부서만 보여주기)

select job_id, max(salary) from employees where commission_pct is null group by job_id having count(*) >=5;    --where는 order by 앞에. where 조건으로 걸러진 애들중에 group by로 묶어줌.



--DECODE(job_id, 'IT_PROG', '프로그래머', '') : job_id에서 IT_PROG들을 '프로그래머'라고 출력, 나머지 값들은 null인데 null일 경우에는 ''(빈칸) 출력 (실제 값이 바뀌는 것은 아님)
--NVL(a,' ') : a가 null이면 ' '(빈칸) 출력 (다른 값 출력도 가능) --mysql 에서는 selese ifnull(컬럼명,'')
--nvl(컬럼명, '') as 컬럼명 : as 컬럼명 안해주면 컬럼명이 nvl(컬럼명,'')가 그대로 출력돼서 as컬럼명 해줘야 좋음.

select job_id, NVL(decode(job_id,'IT_PROG', '프로그래머'
                                 ,'FI_ACCOUNT','금융업'),' ') 
from employees;

--위에 DECODE랑 아래 CASE랑 똑같은 결과.
--(case a when b then c else d end) : a랑 b가 같으면 c를 출력. 아니면 d를 출력.
--(case a when b then c when d then e else f end) :when then을 여러번 줄 수 있음. (else는 생략 가능)
select job_id,
case job_id when 'IT_PROG' then '프로그래머'
            when 'FI_ACCOUNT' then '금융업'
            when 'AD_VP' then '에이디 브이피'
            else ' ' END
from employees;

--Case문 이런식으로도 쓸 수 있음. (조건 주고 출력. (case when 조건 then 결과 else 그 외 end))
select salary, case when salary >= 10000 then salary * 2 else salary end as calcSalary from employees;  --10000이 넘는 경우에는 salary *2 , 아닌 경우에는 그대로 출력.



