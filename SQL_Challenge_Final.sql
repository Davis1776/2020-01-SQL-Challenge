-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/t9Q7qU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Drop tables
DROP TABLE Departments;
DROP TABLE Dept_Emp;
DROP TABLE Dept_Manager;
DROP TABLE Employees;
DROP TABLE Salaries;
DROP TABLE Titles;

-- Create a new table
CREATE TABLE Departments (
    dept_no VARCHAR(30) NOT NULL
	,dept_name VARCHAR(30) NOT NULL
	,CONSTRAINT "pk_Departments" PRIMARY KEY ("dept_no")
);

-- Create a new table
CREATE TABLE Dept_Emp (
    emp_no INT NOT NULL
	,dept_no VARCHAR(30) NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
	);

-- Create a new table
CREATE TABLE Salaries (
    emp_no INT NOT NULL
	,salary INT NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
	,CONSTRAINT "pk_Salaries" PRIMARY KEY ("emp_no")
);

-- Create a new table
CREATE TABLE Employees (
    emp_no INT NOT NULL
	,birth_date VARCHAR(20) NOT NULL
	,first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,gender VARCHAR(5) NOT NULL
	,hire_date VARCHAR(30) NOT NULL
	,CONSTRAINT "pk_Employees" PRIMARY KEY ("emp_no")
);

-- Create a new table
CREATE TABLE Dept_Manager (
    dept_no VARCHAR(30) NOT NULL
	,emp_no INT NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);

-- Create a new table
CREATE TABLE Titles (
    emp_no INT NOT NULL
	,title VARCHAR(50) NOT NULL
	,from_date VARCHAR(30) NOT NULL
	,to_date VARCHAR(30) NOT NULL
);

ALTER TABLE Departments ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES Dept_Manager ("dept_no");

ALTER TABLE Dept_Emp ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Emp ADD CONSTRAINT "fk_Dept_Emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES Dept_Manager ("dept_no");

ALTER TABLE Salaries ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Dept_Manager ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

ALTER TABLE Titles ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES Employees ("emp_no");

--

Select * From Departments
Select * From Dept_Emp
Select * From Employees
Select * From Salaries
Select * From dept_manager
Select * From titles

--

-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON salaries.emp_no = employees.emp_no;

-- 2) List employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

-- 3) List the manager of each department with the following information: department number, 
--		department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name
	,employees.emp_no, employees.first_name, employees.last_name, employees.hire_date
	,dept_manager.to_date
FROM departments
LEFT JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4) List the department of each employee with the following information: employee number, 
--		last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM departments
LEFT JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
RIGHT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name
FROM employees
WHERE first_name LIKE 'Hercules'
AND last_name LIKE 'B%';

-- 6) List all employees in the Sales department, including their employee number, 
--		last name, first name, and department name.
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
RIGHT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their employee number, 
--		last name, first name, and department name.
-- STILL NEEDS TO WORK --
SELECT employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
FROM employees
LEFT JOIN dept_emp
ON dept_emp.emp_no = employees.emp_no
RIGHT JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';

-- 8) In descending order, list the frequency count of employee last names, 
--		i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name;

-- BONUS



-- Epilogue
-- Evidence in hand, you march into your boss's office and present the visualization.
-- With a sly grin, your boss thanks you for your work. On your way out of the office, you hear the words,
-- "Search your ID number." You look down at your badge to see that your employee ID number is 499942.
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employees
WHERE emp_no = '499942';