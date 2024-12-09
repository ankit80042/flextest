-- File: my_package.pks
CREATE OR REPLACE PACKAGE my_package IS
    -- Declare a public procedure
    PROCEDURE greet_user(p_name IN VARCHAR2);
END my_package;
/
