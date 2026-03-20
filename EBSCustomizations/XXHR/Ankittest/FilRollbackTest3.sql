-- =====================================================
-- Ankit-5 Rollback Script1
-- Package: Ankit-5_Rollback
-- Group:   Rollback pkgs
-- =====================================================


-- Step 3: Remove the table and all its data
DROP TABLE Ben423_EMPLOYEES CASCADE CONSTRAINTS;

-- Step 4: Commit
COMMIT;
