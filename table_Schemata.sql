-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

-- Insert data into departments
INSERT INTO departments (dept_no, dept_name) VALUES
('d001', 'Marketing'),
('d002', 'Finance'),
('d003', 'Human Resources'),
('d004', 'Production'),
('d005', 'Development'),
('d006', 'Quality Management'),
('d007', 'Sales'),
('d008', 'Research'),
('d009', 'Customer Service');

-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Insert data into titles
INSERT INTO titles (title_id, title) VALUES
('s0001', 'Staff'),
('s0002', 'Senior Staff'),
('e0001', 'Assistant Engineer'),
('e0002', 'Engineer'),
('e0003', 'Senior Engineer'),
('m0001', 'Manager'),
('t0001', 'Technique Leader');

-- Create the employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Insert data into employees
INSERT INTO employees (emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date) VALUES
(10001, 's0001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26'),
(10002, 's0002', '1964-06-02', 'Bezalel', 'Simmel', 'F', '1985-11-21'),
(10003, 'e0001', '1959-12-03', 'Parto', 'Bamford', 'M', '1986-08-28'),
(10004, 'e0002', '1954-05-01', 'Chirstian', 'Koblick', 'M', '1986-12-01'),
(10005, 'e0003', '1955-01-21', 'Kyoichi', 'Maliniak', 'M', '1989-09-12'),
(110022, 'm0001', '1955-02-10', 'Alice', 'Wonder', 'F', '1980-01-01'),
(110039, 'm0001', '1956-03-11', 'Bob', 'Builder', 'M', '1980-02-02'),
(110085, 'm0001', '1957-04-12', 'Charlie', 'Chaplin', 'M', '1980-03-03'),
(110114, 'm0001', '1958-05-13', 'David', 'Copperfield', 'M', '1980-04-04'),
(110183, 'm0001', '1959-06-14', 'Eve', 'Eden', 'F', '1980-05-05');

-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY(dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Insert data into dept_manager
INSERT INTO dept_manager (dept_no, emp_no) VALUES
('d001', 110022),
('d001', 110039),
('d002', 110085),
('d002', 110114),
('d003', 110183);

-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4),
    PRIMARY KEY(emp_no, dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Insert data into dept_emp
INSERT INTO dept_emp (emp_no, dept_no) VALUES
(10001, 'd005'),
(10002, 'd007'),
(10003, 'd004'),
(10004, 'd004'),
(10005, 'd003');

-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT NOT NULL,
    PRIMARY KEY(emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Insert data into salaries
INSERT INTO salaries (emp_no, salary) VALUES
(10001, 60117),
(10002, 65828),
(10003, 40006),
(10004, 40054),
(10005, 78228);
