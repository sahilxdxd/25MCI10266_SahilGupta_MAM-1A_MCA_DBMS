

-- 1) Create table
CREATE TABLE Payroll (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2) CHECK (salary > 0)
);

-- 2) Insert initial records
INSERT INTO Payroll VALUES
(1, 'Amit', 30000),
(2, 'Neha', 40000),
(3, 'Ravi', 50000);

-- 3) Show table data first
SELECT * FROM Payroll;

-- step 1: Transaction with ROLLBACK

BEGIN;

-- This update will fail because salary cannot be negative
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

-- This line will not run successfully after the error in PostgreSQL
UPDATE Payroll
SET salary = 1000
WHERE emp_id = 3;

-- Check data inside transaction
SELECT * FROM Payroll;

-- Undo transaction
ROLLBACK;

-- Check data after rollback
SELECT * FROM Payroll;


-- step 2: Transaction with SAVEPOINT

BEGIN;

-- Update 1
UPDATE Payroll
SET salary = salary + 5000
WHERE emp_id = 1;

-- Savepoint created after first valid update
SAVEPOINT sp1;

-- Update 2
UPDATE Payroll
SET salary = salary + 7000
WHERE emp_id = 2;

-- This update will fail
UPDATE Payroll
SET salary = -1000
WHERE emp_id = 3;

-- Roll back only till savepoint
ROLLBACK TO sp1;

-- Commit the valid change
COMMIT;

-- Final table
SELECT * FROM Payroll;