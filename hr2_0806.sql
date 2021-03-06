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

--함수호출 안하고 or replace 지움