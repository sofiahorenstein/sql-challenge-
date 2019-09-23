DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE departments (
    "dept_no" VARCHAR(30) PRIMARY KEY NOT NULL,
    "dept_name" VARCHAR(30) NOT NULL
);

CREATE TABLE employees (
    "emp_no" INTEGER PRIMARY KEY NOT NULL,
    "birth_date" VARCHAR(30) NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "gender" VARCHAR(30) NOT NULL,
    "hire_date" VARCHAR(30) NOT NULL
);

CREATE TABLE dept_emp (
	"emp_no" INTEGER NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "dept_no" VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "from_date" VARCHAR(30) NOT NULL,
    "to_date" VARCHAR(30) NOT NULL
);

CREATE TABLE dept_manager (
    "dept_no" VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    "emp_no" INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "from_date" VARCHAR(30) NOT NULL,
    "to_date" VARCHAR(30) NOT NULL
);

CREATE TABLE salaries (
    "emp_no" INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "salary" INTEGER NOT NULL,
    "from_date" VARCHAR(30) NOT NULL,
    "to_date" VARCHAR(30) NOT NULL
);

CREATE TABLE titles (
    "emp_no" INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "title" VARCHAR(30) NOT NULL,
    "from_date" VARCHAR(30) NOT NULL,
    "to_date" VARCHAR(30) NOT NULL
);

SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM salaries AS s
INNER JOIN employees AS e
ON (e.emp_no = s.emp_no);

--List employees who were hired in 1986.
SELECT *
FROM employees
WHERE hire_date LIKE '1986%';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON (dm.dept_no = d.dept_no)
JOIN employees AS e 
ON e.emp_no = dm.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
JOIN departments AS d 
ON d.dept_no = de.dept_no;