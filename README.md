# Employee Database Project

## Overview
This project involves designing a database schema and performing data analysis on employee records. It includes creating tables from provided CSV files, setting up relationships, and executing SQL queries to extract meaningful insights.

## Data Engineering Steps
1. **Create Table Schema:**
   - Define tables based on the six CSV files.
   - Specify data types, primary keys, foreign keys, and constraints.
   - Ensure primary keys are unique; use composite keys if necessary.
   - Create tables in the correct order to maintain foreign key dependencies.

2. **Import Data:**
   - Load each CSV file into its respective SQL table.

## Table Schema
```sql
CREATE TABLE departments (
  dept_no CHARACTER VARYING(45) NOT NULL,
  dept_name CHARACTER VARYING(45) NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_no CHARACTER VARYING(50) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no CHARACTER VARYING(50) NOT NULL,
  emp_no INTEGER NOT NULL
);

CREATE TABLE employees (
    emp_no INTEGER NOT NULL,
    emp_title CHARACTER VARYING(50) NOT NULL,
    birth_date DATE NOT NULL,
    first_name CHARACTER VARYING(50) NOT NULL,
    last_name CHARACTER VARYING(50) NOT NULL,
    sex CHARACTER VARYING(50) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE salaries (
  emp_no INTEGER NOT NULL,
  salary INTEGER NOT NULL
);

CREATE TABLE titles (
  title_id CHARACTER VARYING(50) NOT NULL,
  title CHARACTER VARYING(50) NOT NULL
);
```

## Data Analysis Queries

1. **List employee details with salary:**
```sql
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;
```

2. **Employees hired in 1986:**
```sql
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
```

3. **Department managers with details:**
```sql
SELECT dm.dept_no AS department_number, d.dept_name AS department_name,
       e.emp_no AS employee_number, e.first_name, e.last_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;
```

4. **Employees and their departments:**
```sql
SELECT de.dept_no AS department_number, d.dept_name AS department_name,
       e.emp_no AS employee_number, e.first_name, e.last_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no;
```

5. **Employees named Hercules with last names starting with B:**
```sql
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
```

6. **Employees in the Sales department:**
```sql
SELECT e.emp_no AS employee_number, e.first_name, e.last_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales';
```

7. **Employees in Sales and Development departments:**
```sql
SELECT d.dept_name AS department_name, e.emp_no AS employee_number, e.first_name, e.last_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';
```

8. **Frequency count of last names:**
```sql
SELECT last_name, COUNT(last_name) AS shared_names
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
```

## Conclusion
This project provides insights into employee data by designing a well-structured database and running SQL queries. The database schema ensures data integrity, and the queries enable meaningful analysis of employee details, departments, and salaries.

