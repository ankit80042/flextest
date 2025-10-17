-- Drop the table if it already exists
IF OBJECT_ID('tempdb..#TestGo') IS NOT NULL
    DROP TABLE #TestGo;
GO

-- Create the temp table
CREATE TABLE #TestGo (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);
GO

-- Insert sample data
INSERT INTO #TestGo (Name) VALUES ('Ankit');
INSERT INTO #TestGo (Name) VALUES ('Shukla');
GO

-- Select data to confirm inserts
SELECT * FROM #TestGo;
GO

-- Drop the table to clean up
DROP TABLE #TestGo;
GO
