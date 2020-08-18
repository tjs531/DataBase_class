create sequence seq_board;

select seq_board.nextval from dual;

drop sequence seq_board;

delete from t_board;

commit;