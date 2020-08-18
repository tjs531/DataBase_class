create table t_board4(
    i_board number primary key,
    title nvarchar2(100) not null,
    ctnt nvarchar2(2000) not null,
    hits number default 0,
    i_user number not null,
    r_dt date default sysdate,
    m_dt date default sysdate,
    foreign key(i_user) references t_user(i_user)
);