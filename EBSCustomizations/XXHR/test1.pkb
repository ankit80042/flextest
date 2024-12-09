-- File: my_package.pkb
CREATE OR REPLACE PACKAGE BODY my_package IS
    -- Implement the procedure
    PROCEDURE greet_user(p_name IN VARCHAR2) IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Hello, ' || p_name || '!');
    END greet_user;
END my_package;
/
-- Enable output logging to ensure the confirmation is visible
SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('Package Body Created');
END;
/
