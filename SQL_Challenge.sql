-- Drop tables
DROP TABLE Departments;
DROP TABLE Dept_Emp;
DROP TABLE Dept_Manager;
DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Titles;

-- Create a new table
CREATE TABLE Departments
 (
  dept_no VARCHAR(30) NOT NULL
 ,dept_name VARCHAR(30) NOT NULL
);
SELECT * FROM Departments;

-- Create a new table
CREATE TABLE Dept_Emp
	(
	emp_no INT
	,dept_no VARCHAR(30) NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);
SELECT * FROM Dept_Emp

-- Create a new table
CREATE TABLE Salaries
	(
	emp_no INT
	,salary INT
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);
SELECT * FROM Salaries

-- Create a new table
CREATE TABLE Employees
	(
	emp_no INT
	,birth_date VARCHAR(20) NOT NULL
	,first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,gender VARCHAR(5) NOT NULL
	,hire_date VARCHAR(30) NOT NULL
);
SELECT * FROM Employees

-- Create a new table
CREATE TABLE dept_manager
	(
	dept_no VARCHAR(30) NOT NULL
	,emp_no INT
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);
SELECT * FROM dept_manager

-- Create a new table
CREATE TABLE titles
	(
	emp_no INT
	,title VARCHAR(50) NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);
SELECT * FROM titles

--