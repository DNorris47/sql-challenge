-- (1)Employee Details - emp number, last name, first name, sex, salary
 SELECT emp.emp_no,
 		emp.last_name,
		emp.first_name,
		emp.sex,
		sal.salary
 FROM employees as emp
 	LEFT JOIN salaries as sal
	ON (emp.emp_no = sal.emp_no)
 ORDER BY emp.emp_no;
 
-- (2)Employees hired in 1986
 SELECT first_name, last_name
 FROM employees
 WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
 
-- (3)Department Mgr - dept_no-name-mgrs-emp_no-lastname-firstname
 SELECT dm.dept_no,
 		d.dept_name,
		dm.emp_no,
		e.last_name,
		e.first_name
 FROM dept_mgr AS dm
 	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no);
		
-- (4)Deptartment of each Employee-no-lastname-firstname-depart
 SELECT e.emp_no,
 		e.last_name,
 		e.first_name,
 		d.dept_name
 FROM employees AS e
 	INNER JOIN dep_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
 ORDER BY e.emp_no;

--(5)List firstname,lastname,sex for all "Hercules" and last name begin with "B"
 SELECT e.first_name,
 		e.last_name,
		e.sex
 FROM employees as e
 WHERE first_name = 'Hercules'
 AND last_name LIKE 'B%';
 
--(6)List all employees in Sales Dept include emp_no-lastname-firstname-deptname
 SELECT e.emp_no,
 		e.last_name,
		e.first_name,
		d.dept_name
 FROM employees AS e
 	INNER JOIN dep_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales'
	ORDER BY e.emp_no;
	
	
--(7)List all employees in Sales/Development include emp_no-lastname-firstname-deptname
 SELECT 
 		e.emp_no,
 		e.last_name,
		e.first_name,
		d.dept_name
 FROM employees AS e
  	INNER JOIN dep_emp AS de
		ON (e.emp_no = de.emp_no)
 	INNER JOIN departments AS d
 		ON (de.dept_no = d.dept_no)
 WHERE d.dept_name IN ('Sales', 'Development')
 ORDER BY e.emp_no;
 
--(8)In descending order, list frequency count of emp lastnames - how many share lastname
 SELECT 
 	last_name,
	COUNT(last_name)
 FROM
 	employees
 GROUP BY 
 	last_name
 ORDER BY
 	COUNT(last_name) DESC;
 

