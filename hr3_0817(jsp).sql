create sequence seq_user start with 1 nocache;           --ĳ�ñ�� ���ߵ�. 1������ ����

drop sequence seq_user;

create table t_user(
    i_user number primary key,
    user_id varchar2(30) not null,
    upw varchar2(100) not null,
    nm varchar2(20) not null,
    email varchar2(40),
    profile_img varchar2(50),
    r_dt date default sysdate,      --�������?
    m_dt date default sysdate       --��������?
);

select * from t_user;

delete from t_user;

commit;