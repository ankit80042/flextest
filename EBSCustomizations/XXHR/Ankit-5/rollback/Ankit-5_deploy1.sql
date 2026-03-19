-- =====================================================
-- Ankit-5 Rollback Script
-- Package: Ankit-5_Rollback
-- Group:   Rollback pkgs 1
-- =====================================================

-- Step 1: Remove index first (depends on table)
DROP INDEX Ben56_EMP_DEPT_IDX;

-- Step 2: Remove the sequence
DROP SEQUENCE Ben56_EMP_SEQ;

-- Step 3: Remove the table and all its data
DROP TABLE Ben56_EMPLOYEES CASCADE CONSTRAINTS;

-- Step 4: Commit
COMMIT;

-- Verify rollback was successful
SELECT COUNT(*) FROM USER_TABLES WHERE TABLE_NAME = 'Ben56_EMPLOYEES';
-- Should return 0 if rollback was successful
