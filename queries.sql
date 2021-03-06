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

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select dept_emp.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_emp
left join employees on dept_emp.emp_no = employees.emp_no
left join departments on departments.dept_no = dept_emp.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B"
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department with: employee number, last name, first name, and department name.
select employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no in 
(
	select dept_no from departments
	where dept_name = 'Sales'
);

-- List all employees in the Sales and Development departments with: employee number, last name, first name, and department name.
select employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
from dept_emp
join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.dept_no in 
(
	select dept_no from departments
	where dept_name = 'Sales' or dept_name = 'Finance'
);	

-- frequency count of employee last names in descending order
select last_name, count(last_name) from employees
group by last_name;
