-- =====================================================
-- Ankit-5 Deploy Script
-- Package: Ankit-5_Deploy
-- Group:   Implementation pkgs
-- =====================================================

-- Step 1: Create the employees table
CREATE TABLE Ben56_EMPLOYEES (
    EMP_ID       NUMBER(10)    PRIMARY KEY,
    EMP_NAME     VARCHAR2(100) NOT NULL,
    EMP_EMAIL    VARCHAR2(150) UNIQUE NOT NULL,
    DEPARTMENT   VARCHAR2(50),
    SALARY       NUMBER(10,2),
    CREATED_DATE DATE DEFAULT SYSDATE,
    STATUS       VARCHAR2(20) DEFAULT 'ACTIVE'
);

-- Step 2: Create sequence for EMP_ID
CREATE SEQUENCE Ben56_EMP_SEQ
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

-- Step 3: Insert sample data
INSERT INTO Ben56_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (Ben56_EMP_SEQ.NEXTVAL, 'John Smith', 'john.smith@company.com', 'IT', 75000);

INSERT INTO Ben56_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (Ben56_EMP_SEQ.NEXTVAL, 'Jane Doe', 'jane.doe@company.com', 'HR', 65000);

INSERT INTO Ben56_EMPLOYEES (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY)
VALUES (Ben56_EMP_SEQ.NEXTVAL, 'Bob Johnson', 'bob.johnson@company.com', 'Finance', 80000);

-- Step 4: Create index for better performance
CREATE INDEX Ben56_EMP_DEPT_IDX ON Ben56_EMPLOYEES(DEPARTMENT);

-- Step 5: Commit changes
COMMIT;

select * from invalidtest2;


-- Verify
SELECT COUNT(*) AS TOTAL_RECORDS FROM Ben56_EMPLOYEES;
