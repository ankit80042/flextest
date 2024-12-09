CREATE OR REPLACE PACKAGE BODY employee_mgmt AS

  -- Procedure to add a new employee
  PROCEDURE add_employee (
      p_emp_id    IN NUMBER,
      p_emp_name  IN VARCHAR2,
      p_emp_dept  IN VARCHAR2,
      p_emp_sal   IN NUMBER
  ) IS
  BEGIN
      INSERT INTO employees (employee_id, employee_name, department, salary)
      VALUES (p_emp_id, p_emp_name, p_emp_dept, p_emp_sal);

      DBMS_OUTPUT.PUT_LINE('Employee added successfully: ' || p_emp_name);
  END add_employee;

  -- Procedure to update an employee's salary
  PROCEDURE update_salary (
      p_emp_id    IN NUMBER,
      p_new_sal   IN NUMBER
  ) IS
  BEGIN
      UPDATE employees
      SET salary = p_new_sal
      WHERE employee_id = p_emp_id;

      IF SQL%ROWCOUNT = 0 THEN
          DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || p_emp_id);
      ELSE
          DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Employee ID: ' || p_emp_id);
      END IF;
  END update_salary;

  -- Function to retrieve an employee's details
  FUNCTION get_employee_details (
      p_emp_id    IN NUMBER
  ) RETURN VARCHAR2 IS
      v_emp_details VARCHAR2(4000);
  BEGIN
      SELECT 'ID: ' || employee_id || ', Name: ' || employee_name || 
             ', Dept: ' || department || ', Salary: ' || salary
      INTO v_emp_details
      FROM employees
      WHERE employee_id = p_emp_id;

      RETURN v_emp_details;
  EXCEPTION
      WHEN NO_DATA_FOUND THEN
          RETURN 'No employee found with ID: ' || p_emp_id;
  END get_employee_details;

END employee_mgmt;
/
