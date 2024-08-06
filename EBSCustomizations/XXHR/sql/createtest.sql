CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


INSERT INTO employee (employee_id, first_name, last_name, email)
VALUES (1, 'John', 'Doe', 'john.doe@example.com');
