-- =====================================================
-- Ankit-5 Deploy Script
-- Package: Ankit-5_Deploy
-- Group:   Implementation pkgs
-- =====================================================

WHENEVER SQLERROR EXIT FAILURE ROLLBACK
WHENEVER OSERROR EXIT FAILURE ROLLBACK

SET DEFINE OFF
SET FEEDBACK ON
SET ECHO ON

-- Step 1: Drop table if exists (idempotent)
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE BEN5_EMPLOYEES CASCADE CONSTRAINTS';
  DBMS_OUTPUT.PUT_LINE('Dropped existing BEN5_EMPLOYEES table');
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -942 THEN
      DBMS_OUTPUT.PUT_LINE('BEN5_EMPLOYEES table does not exist - skipping drop');
    ELSE
      RAISE;
    END IF;
END;
/

-- Step 2: Drop sequence if exists (idempotent)
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE BEN5_EMP_SEQ';
  DBMS_OUTPUT.PUT_LINE('Dropped existing BEN5_EMP_SEQ sequence');
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -2289 THEN
      DBMS_OUTPUT.PUT_LINE('BEN5_EMP_SEQ sequence does not exist - skipping drop');
    ELSE
      RAISE;
    END IF;
END;
/

-- Step 3: Drop index if exists (idempotent)
BEGIN
  EXECUTE IMMEDIATE 'DROP INDEX BEN5_EMP_DEPT_IDX';
  DBMS_OUTPUT.PUT_LINE('Dropped existing BEN5_EMP_DEPT_IDX index');
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -1418 THEN
      DBMS_OUTPUT.PUT_LINE('BEN5_EMP_DEPT_IDX index does not exist - skipping drop');
    ELSE
      RAISE;
    END IF;
END;
/

-- Step 4: Create the employees table
CREATE TABLE BEN5_EMPLOYEES (
    EMP_ID       NUMBER(10)    PRIMARY KEY,
    EMP_NAME     VARCHAR2(100) NOT NULL,
    EMP_EMAIL    VARCHAR2(150) UNIQUE NOT NULL,
    DEPARTMENT   VARCHAR2(50),
    SALARY       NUMBER(10,2),
    CREATED_DATE DATE DEFAULT SYSDATE,
    STATUS       VARCHAR2(20) DEFAULT 'ACTIVE'
);

-- Step 5: Create sequence for EMP_ID
CREATE SEQUENCE BEN5_EMP_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Step 6: Insert sample data
INSERT INTO BEN5_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (BEN5_EMP_SEQ.NEXTVAL, 'John Smith', 'john.smith@company.com', 'IT', 75000);

INSERT INTO BEN5_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (BEN5_EMP_SEQ.NEXTVAL, 'Jane Doe', 'jane.doe@company.com', 'HR', 65000);

INSERT INTO BEN5_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (BEN5_EMP_SEQ.NEXTVAL, 'Bob Johnson', 'bob.johnson@company.com', 'Finance', 80000);

-- Step 7: Create index for better performance
CREATE INDEX BEN5_EMP_DEPT_IDX ON BEN5_EMPLOYEES(DEPARTMENT);

COMMIT;

-- =====================================================
-- INTENTIONAL FAILURE — remove this block for real deploy
-- WHENEVER SQLERROR EXIT FAILURE ROLLBACK at top
-- ensures SQLPlus exits non-zero and FlexDeploy marks FAILED
-- =====================================================
THIS_IS_INVALID_SQL_TO_FORCE_FAILURE;

-- Step 8: Verify (only reached if failure line removed)
SELECT COUNT(*) AS TOTAL_RECORDS FROM BEN5_EMPLOYEES;
