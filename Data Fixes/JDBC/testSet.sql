-- Batch 1: Switch context to a desired database (e.g., master or your existing database)
USE master;
GO

-- Batch 2: Create a simple Sample Table (Employees)
-- This table has only two columns for maximum simplicity.
IF OBJECT_ID('dbo.SimpleEmployees', 'U') IS NOT NULL 
    DROP TABLE dbo.SimpleEmployees;
GO

CREATE TABLE dbo.SimpleEmployees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName NVARCHAR(100) NOT NULL
);
GO

-- Batch 3: Insert Data into the SimpleEmployees Table
INSERT INTO dbo.SimpleEmployees (EmployeeName) VALUES 
('Alice'),
('Bob');
GO

-- Batch 4: Retrieve and display all data from the table
SELECT 
    EmployeeID, 
    EmployeeName
FROM 
    dbo.SimpleEmployees;
GO
