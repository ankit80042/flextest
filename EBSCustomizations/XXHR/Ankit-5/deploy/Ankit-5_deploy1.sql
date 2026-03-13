-- =====================================================
-- Ankit-5 Deploy Script
-- Package: Ankit-5_Deploy
-- Group:   Implementation pkgs
-- =====================================================
SET SERVEROUTPUT ON;

BEGIN
    -- 1. Create the Table (Must use EXECUTE IMMEDIATE inside a block)
    EXECUTE IMMEDIATE 'CREATE TABLE BEN5_EMPLOYEES (
        EMP_ID NUMBER PRIMARY KEY,
        EMP_NAME VARCHAR2(100),
        EMP_EMAIL VARCHAR2(150) UNIQUE,
        DEPARTMENT VARCHAR2(50),
        SALARY NUMBER(10,2)
    )';
    DBMS_OUTPUT.PUT_LINE('Table Created...');

    -- 2. Create the Sequence
    EXECUTE IMMEDIATE 'CREATE SEQUENCE BEN5_EMP_SEQ START WITH 1';
    DBMS_OUTPUT.PUT_LINE('Sequence Created...');

    -- 3. Insert Data
    INSERT INTO BEN5_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
    VALUES (BEN5_EMP_SEQ.NEXTVAL, 'John Smith', 'john.smith@company.com', 'IT', 75000);

    -- 4. THE KILL SWITCH (This forces the failure)
    RAISE_APPLICATION_ERROR(-20001, 'MANUAL STOP: FORCING SCRIPT FAILURE');

    -- This COMMIT will never be reached
    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR DETECTED: Rolling back and cleaning up...');
        
        -- CLEANUP: Delete what we just created because the script "failed"
        BEGIN
            EXECUTE IMMEDIATE 'DROP TABLE BEN5_EMPLOYEES';
            EXECUTE IMMEDIATE 'DROP SEQUENCE BEN5_EMP_SEQ';
        EXCEPTION
            WHEN OTHERS THEN NULL; -- Ignore cleanup errors
        END;
        
        -- Re-raise the error so the tool shows a "FAILURE" status
        RAISE;
END;
/
