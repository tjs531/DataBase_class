delete from t_customer where cus_no =3;

select * from t_order;


CREATE OR REPLACE TRIGGER trg_DEL_CUSTOMER
BEFORE DELETE ON T_CUSTOMER
FOR EACH ROW                --여러개가 있더라도 다 실행
DECLARE
BEGIN
    DELETE FROM t_order
    WHERE cus_no = :old.cus_no;         --old.cus_no : 지워지기 전 cus_no
END;

--or replace 지움, for each row 지움