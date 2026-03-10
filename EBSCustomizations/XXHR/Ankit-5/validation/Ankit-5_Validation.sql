-- =====================================================
-- Ankit-5 Validation Script
-- Package: Ankit-5_Validation
-- Group:   Validation pkgs
-- =====================================================

-- Step 1: Verify table exists
SELECT TABLE_NAME
FROM USER_TABLES
WHERE TABLE_NAME = 'BEN5_EMPLOYEES';
-- Expected: 1 row returned

-- Step 2: Verify all columns exist with correct structure
SELECT COLUMN_NAME, DATA_TYPE, NULLABLE
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'BEN5_EMPLOYEES'
ORDER BY COLUMN_ID;
-- Expected: 7 columns (EMP_ID, EMP_NAME, EMP_EMAIL, DEPARTMENT, SALARY, CREATED_DATE, STATUS)

-- Step 3: Verify primary key exists
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'BEN5_EMPLOYEES'
AND CONSTRAINT_TYPE = 'P';
-- Expected: 1 row (primary key on EMP_ID)

-- Step 4: Verify sequence exists
SELECT SEQUENCE_NAME
FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = 'BEN5_EMP_SEQ';
-- Expected: 1 row

-- Step 5: Verify index exists
SELECT INDEX_NAME, STATUS
FROM USER_INDEXES
WHERE TABLE_NAME = 'BEN5_EMPLOYEES'
AND INDEX_NAME = 'BEN5_EMP_DEPT_IDX';
-- Expected: 1 row with STATUS = VALID

-- Step 6: Verify sample data was inserted
SELECT COUNT(*) AS RECORD_COUNT
FROM BEN5_EMPLOYEES;
-- Expected: 3 records

-- Step 7: Verify data integrity
SELECT EMP_ID, EMP_NAME, DEPARTMENT, SALARY
FROM BEN5_EMPLOYEES
ORDER BY EMP_ID;
-- Expected: 3 employees listed
