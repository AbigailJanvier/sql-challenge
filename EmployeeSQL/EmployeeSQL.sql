-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
FROM "Employees"
INNER JOIN "Salaries" ON
"Employees".emp_no="Salaries".emp_no;



-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM "Employees"      
WHERE hire_date >= '01/01/1986' and
      hire_date < '01/01/1987'



-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM "Dept_manager" as m
INNER JOIN "Departments" as d ON
m.dept_no = d.dept_no
INNER JOIN "Employees" as e ON
m.emp_no = e.emp_no



-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as de
INNER JOIN "Employees" as e ON
de.emp_no = e.emp_no
INNER JOIN "Departments" as d ON
d.dept_no = de.dept_no



-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name, e.last_name, e.sex
FROM "Employees" as e
WHERE e.first_name = 'Hercules'
AND SUBSTRING (e.last_name, 1, 1) = 'B'



-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM "Dept_emp" as de
INNER JOIN "Employees" as e ON
de.emp_no = e.emp_no
INNER JOIN "Departments" as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales'



-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Dept_emp" as de
INNER JOIN "Employees" as e ON
de.emp_no = e.emp_no
INNER JOIN "Departments" as d ON
d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'



-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT count(e.last_name) as freq, e.last_name
FROM "Employees" as e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;