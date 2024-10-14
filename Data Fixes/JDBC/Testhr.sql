-- Drop the table if it exists (optional, remove if not needed)
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE HR.JOBS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN  -- Ignore if the table does not exist
            RAISE;
        END IF;
END;
/

-- Create the HR.JOBS table
CREATE TABLE HR.JOBS (
    job_id VARCHAR2(10) PRIMARY KEY,
    max_salary NUMBER(6)
);

-- Insert a sample record (if not already present)
BEGIN
    INSERT INTO HR.JOBS (job_id, max_salary) 
    VALUES ('PU_CLERK', 5000);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        -- Do nothing if the record already exists
        NULL;
END;
/

-- Update the MAX_SALARY for job_id 'PU_CLERK'
UPDATE HR.JOBS 
SET max_salary = 6000 
WHERE job_id = 'PU_CLERK';

-- Validation Check
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM HR.JOBS 
    WHERE job_id = 'PU_CLERK' AND max_salary = 6000;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Validation failed: expected 1 but found 0');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Validation succeeded: found 1 row.');
    END IF;
END;
/
