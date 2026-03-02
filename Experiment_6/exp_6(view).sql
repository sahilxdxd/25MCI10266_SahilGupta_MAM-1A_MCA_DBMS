CREATE TABLE Department (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

Create table employee(
     Emp_id serial primary key,
     Emp_name varchar (50),
     Salary numeric(10,2),
     Status varchar(20),
     Dept_id int references department(dept_id)
);

INSERT INTO Department (dept_name) VALUES
('HR'),
('IT'),
('Finance'),
('Sales');

INSERT INTO employee(emp_name, salary, status, dept_id) VALUES 
('Kundan',40000,'Active', 1),
('Ranjan', 10000,'Inactive',2),
('Sahil', 43000,'Active', 2),
('Ram', 25000,'Active',3),
('Laxmi', 60000,'Active', 4);

select * from department;
select * from employee;

-- Creating a Simple View for Data Filtering
CREATE VIEW Active_Employees AS
SELECT emp_id, emp_name, salary, dept_id
FROM Employee
WHERE status = 'Active';

select * from active_employees;

-- Creating a View for Joining Multiple Tables 
CREATE VIEW Employee_Department_View AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    e.status,
    d.dept_name
FROM Employee e
JOIN Department d
    ON e.dept_id = d.dept_id;

select * from Employee_Department_View;

-- Advanced Summarization View
CREATE VIEW Department_Salary_Summary AS
SELECT 
    d.dept_id,
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    COUNT(CASE WHEN e.status = 'Active' THEN 1 END) AS active_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS avg_salary,
    MAX(e.salary) AS highest_salary,
    MIN(e.salary) AS lowest_salary
FROM Department d
LEFT JOIN Employee e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

select * from Department_Salary_Summary;


