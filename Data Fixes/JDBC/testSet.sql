-- Create a test table
IF OBJECT_ID('tempdb..#TestGo') IS NOT NULL
    DROP TABLE #TestGo;
GO

CREATE TABLE #TestGo (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);
GO

-- Insert some sample data
INSERT INTO #TestGo (Name) VALUES ('Ankit');
INSERT INTO #TestGo (Name) VALUES ('Shukla');
GO

-- Select data to confirm inserts
SELECT * FROM #TestGo;
GO

-- Drop the table to clean up
DROP TABLE #TestGo;
GO
