-- wrapper.sql
DECLARE
    v1 NUMBER;
    v2 NUMBER;
    v3 NUMBER;
    v4 CHAR(1);
BEGIN
    -- Dynamic assignment using external parameter values
    EXECUTE IMMEDIATE 'BEGIN v1 := ' || '&var1' || '; END;';
    EXECUTE IMMEDIATE 'BEGIN v2 := ' || '&var2' || '; END;';
    EXECUTE IMMEDIATE 'BEGIN v3 := ' || '&var3' || '; END;';
    EXECUTE IMMEDIATE 'BEGIN v4 := ''' || '&var4' || '''; END;';

    DBMS_OUTPUT.PUT_LINE('Variable 1 (Responsibility ID): ' || v1);
    DBMS_OUTPUT.PUT_LINE('Variable 2 (Application ID): ' || v2);
    DBMS_OUTPUT.PUT_LINE('Variable 3 (Login ID): ' || v3);
    DBMS_OUTPUT.PUT_LINE('Variable 4 (Error Flag): ' || v4);
END;
/
