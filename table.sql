-- Titles table
create table titles (
	title_id varchar primary key,
	title varchar
);

-- Employees table
create table employees (
	emp_no int primary key,
	emp_title_id varchar,
	birth_date date,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date date,
	foreign key (emp_title_id) references titles(title_id)
);

-- Departments table
create table departments (
	dept_no varchar primary key,
	dept_name varchar
);

-- Department employees table
create table dept_emp (
	emp_no int,
	dept_no varchar,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- Department managers table
create table dept_manager (
	dept_no varchar,
	emp_no int,
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- Salaries table 
create table salaries (
	emp_no int,
	salary int,
	foreign key (emp_no) references employees(emp_no)
);
