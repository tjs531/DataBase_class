--inner 조인 (교집합: 내 테이블에도 있고 니 테이블이도 있는 것 만 나타낸다)

select 
    A.i_student,B.nm as student_name,
    A.i_hobby,c.nm as hobby_name 
from t_student_hobby A
inner join t_student B
on A.i_student = B.i_student
inner join t_hobby C
on A.i_hobby = C.i_hobby;

--Left조인 (왼쪽에 있는 테이블이 기준. 기준 테이블은 무조건 찍는다. 연결할게 없으면 null로 처리)
--A테이블에 있는건 다 출력 (B나 C에 없어도 A에 있으면 나타남(B나 C에 없는거면 null처리))

select 
    A.i_student,B.nm as student_name,
    A.i_hobby,c.nm as hobby_name 
from t_student_hobby A
Left join t_student B
on A.i_student = B.i_student    --왼쪽에 있는 것 기준 (A기준)
left join t_hobby C
on A.i_hobby = C.i_hobby;       --왼쪽에 있는 테이블(A) 기준

--inner 와 left 조인의 차이.
--ex> 게시판 테이블과 좋아요 테이블이 있을때, 이너조인을 걸면 좋아요가 눌린 게시판만 출력. (1,2,3번 게시물 중 1번 게시물에만 좋아요가 눌렸다면 1번 테이블만 출력 (교집합))
-- but 게시판 테이블 기준으로 left조인을 걸면 모든 게시글이 나오고 좋아요가 없는 게시글은 좋아요 null상태로 나옴. (게시물 1,2,3번 다 출력되고 좋아요가 없으면 좋아요값 null)



-------------테이블 만들기 - ----------------------------

create table t_board(
    i_board number primary key,
    title varchar2(100) not null,
    ctnt varchar2(2000) not null,
    i_student number not null,
    foreign key (i_student) references t_student(i_student)
);

comment on column t_board.i_student IS '작성자';           --코멘트 달아놓으면 파악하기가 쉽다. (테이블에서 열 정보에 들어가면 코멘트 볼 수 있음)

insert into t_board(i_board, title, ctnt, i_student) values (1,'안녕','112122',3);
insert into t_board(i_board, title, ctnt, i_student) values (2,'하세요','ㅋㅎㅋ',3);
insert into t_board(i_board, title, ctnt, i_student) values (3,'하하','메롱',3);
insert into t_board(i_board, title, ctnt, i_student) values (4,'어서오시오','뚧',3);
insert into t_board(i_board, title, ctnt, i_student) values (5,'바보','ㄴㄾㅍ',3);

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


--select 문으로 나온 결과랑 join할 수도 있음. (서브쿼리)

select A.i_board, A.title, C.nm, nvl(B.like_cnt,0) as like_count           -- nvl : null로 나오는 것을 0으로 바꿔주기. (좋아요 카운트 출력하는데, 좋아요가 없는 애들은 null대신 0 출력)
from t_board A
left join (
    select i_board, count(i_board) as like_cnt
    from t_board_like
    group by i_board
) B
on A.i_board = B.i_board
inner join t_student C          --합집합만 출력.
on A.i_student = C.i_student
--where b.i_board is null         --좋아요가 없는 것 찾기
order by nvl(b.like_cnt, 0) desc;

--inner 와 left 조인은 어느걸 써도 상관없는 경우가 있지만 (왼쪽에 있는 테이블이 참조를 하는 입장인 경우)
--왼쪽 테이블이 참조를 당하는 경우는 left, inner 결과가 달라진다.