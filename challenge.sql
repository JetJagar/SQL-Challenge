-- Creating the tables for to hold the CSV data

CREATE TABLE departments (
  dept_no character varying(45) NOT NULL,
  dept_name character varying(45) NOT NULL 
);

CREATE TABLE dept_emp (
  emp_no integer NOT NULL,
  dept_no character varying(50) NOT NULL
);

CREATE TABLE dept_manager (
  dept_no character varying(50) NOT NULL,
  emp_no integer NOT NULL
);

CREATE TABLE employees (
    emp_no integer NOT NULL,
    emp_title character varying(50) NOT NULL,
    birth_date date NOT NULL,
	first_name character varying(50) NOT NULL,
	last_name character varying(50) NOT NULL,
	sex character varying(50) NOT NULL,
	hire_date date NOT NULL
);

CREATE TABLE salaries (
  emp_no integer NOT NULL,
  salary integer NOT NULL
);

CREATE TABLE titles (
  title_id character varying(50) NOT NULL,
  title character varying(50) NOT NULL
);