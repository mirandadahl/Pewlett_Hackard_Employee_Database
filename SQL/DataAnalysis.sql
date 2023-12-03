-- List employee information
SELECT emp_no, last_name, first_name, sex, salary FROM employees
JOIN salaries ON employees.emp_no = salaries.emp_no;

-- List employees hired in 1986
SELECT first_name, last_name, hire_date FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List department managers
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

-- List employees and their departments
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- List employees with specific first name and last name
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- List employees in Sales department
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List employees in Sales and Development departments
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- Frequency counts of employee last names
SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
