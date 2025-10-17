-- Create a table
CREATE TABLE TestTable (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);
GO

-- Insert some sample data
INSERT INTO TestTable (Name) VALUES ('Ankit');
INSERT INTO TestTable (Name) VALUES ('Shukla');
GO

-- Select all data
SELECT * FROM TestTable;
GO

-- Update a record
UPDATE TestTable
SET Name = 'Ankit Updated'
WHERE Name = 'Ankit';
GO

-- Verify the update
SELECT * FROM TestTable;
GO

-- Drop the table
DROP TABLE TestTable;
GO
