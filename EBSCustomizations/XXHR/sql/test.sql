SET DEFINE OFF;

DECLARE
    v1 NUMBER := &var1;
    v2 NUMBER := &var2;
    v3 NUMBER := &var3;
    v4 CHAR(1) := '&var4';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Variable 1 (Responsibility ID): ' || v1);
    DBMS_OUTPUT.PUT_LINE('Variable 2 (Application ID): ' || v2);
    DBMS_OUTPUT.PUT_LINE('Variable 3 (Login ID): ' || v3);
    DBMS_OUTPUT.PUT_LINE('Variable 4 (Error Flag): ' || v4);
END;
/
