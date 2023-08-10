-- Import csv files (clicking through options in Postgres GUI) and verify data imports as expected:

-- Import from EmployeeSQL\data\titles.csv to titles table
SELECT * from titles;
-- Import from EmployeeSQL\data\departments.csv to departments table
SELECT * from departments;
-- Import from EmployeeSQL\data\employees.csv to employees table
SELECT * from employees;
-- Import from EmployeeSQL\data\salaries.csv to salaries table
SELECT * from salaries;
-- Import from EmployeeSQL\data\dept_emp.csv to dept_emp table
SELECT * from dept_emp;
-- Import from EmployeeSQL\data\.csv to dept_manager table
SELECT * from dept_manager;

-- Complete Data Analysis per Instructions in BCS/Canvas

-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	e.sex AS "Employee Sex", 
	s.salary AS "Employee Salary"
FROM employees AS e
JOIN salaries AS s ON (e.emp_no = s.emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	e.first_name AS "Employee First Name", 
	e.last_name AS "Employee Last Name", 
	e.hire_date AS "Employee Hire Date"
FROM employees AS e
WHERE (EXTRACT(YEAR FROM hire_date)) = 1986;

-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT 
	d.dept_no AS "Department No.", 
	d.dept_name AS "Department Name", 
	d_m.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name"
FROM departments AS d
JOIN dept_manager AS d_m ON (d.dept_no=d_m.dept_no)
JOIN employees AS e ON (d_m.emp_no=e.emp_no);

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name.
SELECT 
	d.dept_no AS "Department No.", 
	d_e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	d.dept_name AS "Department Name"
FROM departments AS d
JOIN dept_emp AS d_e ON (d.dept_no=d_e.dept_no)
JOIN employees AS e ON (d_e.emp_no=e.emp_no);

-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT 
	first_name AS "Employee First Name", 
	last_name AS "Employee Last Name", 
	sex AS "Employee Sex"
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';


-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
SELECT 
	emp_no AS "Employee Number", 
	last_name AS "Employee Last Name", 
	first_name AS "Employee First Name"
FROM employees
WHERE emp_no IN
(
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS d_e ON (e.emp_no=d_e.emp_no)
JOIN departments AS d ON (d_e.dept_no=d.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';


-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).
SELECT 
	last_name AS "Employee Last Name", 
	COUNT(last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name;



