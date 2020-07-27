--인덱스
--실제 데이터 순서가 바뀌는건 아니지만 내부적으로 순서대로 관리
--어떤 조건의 데이터를(ex> 30세 이상인 사람) 찾는 경우 인덱스가 없으면 전수조사를 해야함. 인덱스가 있으면 일부만 할 수 있음. (중간부터 검사, 또 그 중간부터 검사)
--기본키와 유니크는 자동 인덱스. (나머지는 수동으로 만들어야 함)
--where 절이나 join 조건 안에서 자주 사용되는 컬럼. null값이 많이 포함되어 있는 컬럼. 인덱스 사용하면 좋음
--테이블이 작을때, 테이블이 자주 갱신될 때는 굳이 인덱스 필요없음.

--create index 인덱스명 on 테이블명(컬럼명);

create index idx_customer_age
on t_student(age);

--index 삭제
drop index idx_customer_age;

--뷰 (가상테이블)

--create view 뷰이름 as 실행할 쿼리문
--뷰를 생성하면 이제 이 쿼리문 대신 뷰를 쓸 수 있다.
create view view_boardlike_cnt
as
select i_board, count(i_board) as like_cnt
    from t_board_like
    group by i_board;

select * from view_boardlike_cnt;


--view 삭제
drop view view_boardlike_cnt;


--테이블, 인덱스, 뷰 조회 :데이터 사전
select * from USER_TABLES;
select * from user_indexes;
select * from user_views;