-- List employee number, last name, first name, sex, and salary.
select emp.emp_no, emp.last_name, emp.first_name, emp.sex, salaries.salary
from employees as emp
join salaries on emp.emp_no = salaries.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where date_part('year', hire_date) = 1986;

-- List the manager of each department with: department number, department name, employee number, last name, first name.
select man.dept_no, departments.dept_name, man.emp_no, emp.last_name, emp.first_name
from dept_manager as man
join employees as emp on emp.emp_no = man.emp_no
join departments on departments.dept_no = man.dept_no;


