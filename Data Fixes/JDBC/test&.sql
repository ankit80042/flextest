-- Compile the package specification
CREATE OR REPLACE PACKAGE my_package IS
    PROCEDURE my_procedure(p_param IN VARCHAR2);
    FUNCTION my_function RETURN VARCHAR2;
END my_package;
/

-- Compile the package body
CREATE OR REPLACE PACKAGE BODY my_package IS

    PROCEDURE my_procedure(p_param IN VARCHAR2) IS
    BEGIN
        -- Example usage of & in a string
        DBMS_OUTPUT.PUT_LINE('This is an example with & character in the text');
    END my_procedure;

    FUNCTION my_function RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Return value contains & character';
    END my_function;

END my_package;
/
