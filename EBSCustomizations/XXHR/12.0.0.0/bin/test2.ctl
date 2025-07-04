OPTIONS (SKIP=1)
LOAD DATA
INFILE 'employee_data.csv'
BADFILE 'employee_data.bad'
DISCARDFILE 'employee_data.dsc'
INTO TABLE employees
APPEND
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
  employee_id     INTEGER EXTERNAL,
  first_name      CHAR,
  last_name       CHAR,
  email           CHAR,
  hire_date       DATE "YYYY-MM-DD",
  salary          DECIMAL EXTERNAL
)
-- njnuuun
