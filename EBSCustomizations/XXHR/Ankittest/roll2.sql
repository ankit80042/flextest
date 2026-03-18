-- =====================================================
-- Ankit-5 Rollback Script1
-- Package: Ankit-5_Rollback
-- Group:   Rollback pkgs
-- =====================================================

-- Step 1: Remove index first (depends on table)
DROP INDEX Ben44_EMP_DEPT_IDX;

-- Step 2: Remove the sequence
DROP SEQUENCE Ben44_EMP_SEQ;

-- Step 3: Remove the table and all its data
DROP TABLE Ben44_EMPLOYEES CASCADE CONSTRAINTS;

-- Step 4: Commit
COMMIT;

-- Verify rollback was successful
SELECT COUNT(*) FROM USER_TABLES WHERE TABLE_NAME = 'Ben44_EMPLOYEES';
-- Should return 0 if rollback was successful
