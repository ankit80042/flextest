DECLARE
    -- Declare variables with new names (var1, var2, var3, var4)
    v1       NUMBER := &1;  -- Variable 1 (Responsibility ID)
    v2       NUMBER := &2;  -- Variable 2 (Application ID)
    v3       NUMBER := &3;  -- Variable 3 (Login ID)
    v4       CHAR(1) := '&4'; -- Variable 4 (Error Flag)
BEGIN
    -- Display the values of the new variables
    DBMS_OUTPUT.PUT_LINE('Variable 1 (Responsibility ID): ' || v1);
    DBMS_OUTPUT.PUT_LINE('Variable 2 (Application ID): ' || v2);
    DBMS_OUTPUT.PUT_LINE('Variable 3 (Login ID): ' || v3);
    DBMS_OUTPUT.PUT_LINE('Variable 4 (Error Flag): ' || v4);
END;
/
