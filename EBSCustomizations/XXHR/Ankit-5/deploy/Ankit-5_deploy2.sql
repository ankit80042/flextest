-- 1. THIS IS THE KEY: Tells the shell to exit with failure if SQL fails
WHENEVER SQLERROR EXIT 1;

-- =====================================================
-- Ankit-5 Deploy Script
-- =====================================================

-- Step 1: Create Table
CREATE TABLE BEN5_EMPLOYEES (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(100)
);

-- Step 2: Insert 
INSERT INTO BEN5_EMPLOYEES (EMP_ID, EMP_NAME) VALUES (1, 'John Smith', 'uyfyufuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuyyyyyyyyyyyyy' ufufuyfyufyuuuuuuuuuuuuuuuuuuuuu);

-- Step 3: THE FORCED ERROR
-- This invalid block will trigger the "EXIT 1" above
BEGIN
   RAISE_APPLICATION_ERROR(-20001, 'Failing for FlexDeploy Test');
END;
/

-- This will never be reached, and the deployment will turn RED
COMMIT;
