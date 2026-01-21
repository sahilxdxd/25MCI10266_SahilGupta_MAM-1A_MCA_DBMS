
-- 1. Create Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) UNIQUE NOT NULL
);

-- 2. Create Employee table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    emp_email VARCHAR(40) UNIQUE NOT NULL,
    emp_phone VARCHAR(15) UNIQUE NOT NULL,
    emp_address VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

-- 3. Create Project table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(40) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    assigned_emp INT,
    FOREIGN KEY (assigned_emp) REFERENCES Employee(emp_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);

-- 4. Insert values into Department
INSERT INTO Department VALUES
(11, 'AI Research'),
(22, 'Software Development'),
(33, 'Marketing'),
(44, 'Administration');

-- 5. Insert values into Employee
INSERT INTO Employee VALUES
(301, 'Sahil Gupta', 'sahil.gupta@gmail.com', '9811111111', 'Chandigarh', 22),
(302, 'Aman Verma', 'aman@gmail.com', '9822222222', 'Delhi', 22),
(303, 'Riya Sharma', 'riya@gmail.com', '9833333333', 'Jaipur', 33),
(304, 'Neha Singh', 'neha@gmail.com', '9844444444', 'Bhopal', 11),
(305, 'Karan Malhotra', 'karan@gmail.com', '9855555555', 'Noida', 44);

-- 6. Insert values into Project
INSERT INTO Project VALUES
(101, 'AI Chatbot System', '2026-01-10', '2026-06-30', 301),
(102, 'Online Learning Platform', '2026-02-15', '2026-07-20', 302),
(103, 'Marketing Analytics Tool', '2026-03-01', '2026-05-31', 303),
(104, 'Research Data Portal', '2026-01-25', '2026-04-30', 304),
(105, 'Office Automation System', '2026-02-05', '2026-08-10', 305);

-- 7. Display tables
SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

-- 8. Update employee department
UPDATE Employee
SET dept_id = 44
WHERE emp_id = 303;

-- 9. Delete an employee
DELETE FROM Employee WHERE emp_id = 305;

-- 10. Create role and grant permissions
CREATE ROLE HR LOGIN PASSWORD 'HR';

GRANT SELECT, INSERT, UPDATE ON Employee TO HR;
GRANT SELECT ON Department TO HR;
GRANT SELECT, INSERT, UPDATE ON Project TO HR;

-- 11. Revoke permissions
REVOKE SELECT ON Employee FROM HR;
REVOKE UPDATE ON Employee FROM HR;
