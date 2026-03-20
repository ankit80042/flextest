-- =====================================================
-- Ankit-5 Deploy Script
-- Package: Ankit-5_Deploy
-- Group:   Implementation pkgs
-- =====================================================

-- Step 1: Create the employees table
CREATE TABLE Ben423_EMPLOYEES (
    EMP_ID       NUMBER(10)    PRIMARY KEY,
    EMP_NAME     VARCHAR2(100) NOT NULL,
    EMP_EMAIL    VARCHAR2(150) UNIQUE NOT NULL,
    DEPARTMENT   VARCHAR2(50),
    SALARY       NUMBER(10,2),
    CREATED_DATE DATE DEFAULT SYSDATE,
    STATUS       VARCHAR2(20) DEFAULT 'ACTIVE'
);
