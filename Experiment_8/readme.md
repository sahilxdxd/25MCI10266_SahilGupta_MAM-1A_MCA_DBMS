
# WORKSHEET 8 – SQL PROCEDURE

## Student Information
- Name: Sahil Gupta
- UID: 25MCI10266
- Branch: MCA (AI & ML)  
- Section: 25MAM-1 A  
- Semester: 2nd Semester  
- Subject: Technical Skills  
- Date of Performance: 31/03/2026  

---

## AIM
To apply the concept of Stored Procedures in database operations in order to perform tasks like insertion,
updating, deletion, and retrieval of data efficiently, securely, and in a reusable manner within the database system.


---

## Software Requirement
- Oracle Database Express Edition  
- PostgreSQL  
- pgAdmin  

---

## OBJECTIVES
- Apply stored procedure concepts for database operations
---

# Practical / Experiment Steps

---

## Table Creation
```sql
CREATE TABLE Employee (
    empId INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT
);
```

## INSERT PROCEDURE
```sql
CREATE OR REPLACE PROCEDURE insert_employee(
    eid INT,
    ename VARCHAR,
    esalary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee VALUES (eid, ename, esalary);
END;
$$;

```

## UPDATE PROCEDURE

```sql
CREATE OR REPLACE PROCEDURE update_salary(
    eid INT,
    new_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employee
    SET salary = new_salary
    WHERE empId = eid;
END;
$$;
```

---

## DELETE PROCEDURE
```sql
CREATE OR REPLACE PROCEDURE delete_employee(
    eid INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employee
    WHERE empId = eid;
END;
$$;
```

---

## RETRIVE DATA USING FUNCTION
```sql
CREATE OR REPLACE FUNCTION get_employees()
RETURNS TABLE(empId INT, name VARCHAR, salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM Employee;
END;
$$;
```

---
## EXECUTION PART
### INSERT 
```sql
CALL insert_employee(1, 'John', 5000);
```

### OUTPUT
<img width="430" height="192" alt="insert_5exp" src="https://github.com/user-attachments/assets/d7bd9e74-5961-4d0e-bdf6-03939b3fb35f" />

---

### UPDATE
```sql
CALL update_salary(1, 6000);
CALL insert_employee(2, 'Rahul', 5000);
```

### OUTPUT
<img width="492" height="202" alt="update_5exp" src="https://github.com/user-attachments/assets/234a2281-a630-4bd1-8f64-55d0dff27b64" />

---

### DELETE
```sql
CALL delete_employee(1);
```

### OUTPUT
<img width="462" height="166" alt="delete_5exp" src="https://github.com/user-attachments/assets/5210b58a-1bb3-40f3-aca4-43c241252e9e" />

---
## Outcomes
1.	Insert Procedure successfully adds new employee records into the Employee table.
2.	Update Procedure modifies existing data (e.g., updating salary based on empId).
3.	Delete Procedure removes specific employee records from the table.
4.	Function (get_employees) retrieves and displays all employee data in a structured format.
5.	Demonstrates how procedures handle CRUD operations while functions are used for data retrieval in PostgreSQL.

---

