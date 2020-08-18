select * from t_order;

insert into t_order (o_no, cus_no,o_data,o_price)
values (4,3,sysdate,70000);

commit;

EXEC proc_INSERT_ORDER(5,3,10200);

create or replace procedure proc_INSERT_ORDER
(
p_o_no IN T_ORDER.o_no%TYPE,                    --T_ORDER에 있는 o_no의 타입으로 p_o_no를 선언 (= p_o_no number)
p_cus_no IN T_ORDER.cus_no%TYPE,
p_o_price IN T_ORDER.o_price%TYPE
)
IS
BEGIN
INSERT INTO T_ORDER(o_no, cus_no, o_data, o_price)
VALUES (p_o_no, p_cus_no, sysdate, p_o_price);
COMMIT;
END;



CREATE OR REPLACE FUNCTION fn_GET_AGE(V_BIRTH_DATE CHAR)
RETURN NUMBER
IS
V_CURRENT_YEAR CHAR(4);
V_BIRTH_YEAR CHAR(4);
V_AGE NUMBER;
BEGIN
SELECT TO_CHAR(SYSDATE,'YYYY'), SUBSTR(V_BIRTH_DATE,1,4)
INTO V_CURRENT_YEAR, V_BIRTH_YEAR
FROM DUAL;
V_AGE := TO_NUMBER(V_CURRENT_YEAR) - TO_NUMBER(V_BIRTH_YEAR) + 1;
RETURN V_AGE;
END;


