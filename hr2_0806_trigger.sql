delete from t_customer where cus_no =3;

select * from t_order;


CREATE OR REPLACE TRIGGER trg_DEL_CUSTOMER
BEFORE DELETE ON T_CUSTOMER
FOR EACH ROW                --�������� �ִ��� �� ����
DECLARE
BEGIN
    DELETE FROM t_order
    WHERE cus_no = :old.cus_no;         --old.cus_no : �������� �� cus_no
END;

--or replace ����, for each row ����