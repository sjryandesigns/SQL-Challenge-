-- List for each employee: employee number, last name, first name, gender, salary
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e 
	JOIN salaries as s ON e.emp_no = s.emp_no
ORDER BY e.emp_no; 

-- List first name, last name, and hire date for employees who were hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
WHERE DATE_PART('year', hire_date) = 1986
ORDER BY e.emp_no

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name
SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
	JOIN departments as d ON dm.dept_no = d.dept_no
	JOIN employees as e on dm.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as de ON e.emp_no = de.emp_no
	JOIN departments as d ON de.dept_no = d.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and 
-- last names begin with "B"
SELECT e.first_name, e.last_name, e.sex 
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'; 

-- List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as de ON e.emp_no = de.emp_no
	JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name='Sales';

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp as de ON e.emp_no = de.emp_no
	JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

-- In descending order, list the frequency count of employee last names, i.e., how many 
-- employees share each last name
SELECT e.last_name, COUNT(*) AS freq_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY freq_count DESC;


