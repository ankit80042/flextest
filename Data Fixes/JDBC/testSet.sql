-- Create a test table
CREATE TABLE TestTable (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);
GO

-- Insert some sample rows
INSERT INTO TestTable (Name) VALUES ('Ankit');
INSERT INTO TestTable (Name) VALUES ('Shukla');
GO

-- Select all rows
SELECT * FROM TestTable;
GO

-- Update one of the rows
UPDATE TestTable
SET Name = 'Ankit Updated'
WHERE Name = 'Ankit';
GO

-- Verify the update
SELECT * FROM TestTable;
GO

-- Clean up the test table
DROP TABLE TestTable;
GO
