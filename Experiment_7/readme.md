
# WORKSHEET 7 – SQL JOINS and there types

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
Learn how to create, query, and manage views in SQL to simplify database queries and provide a layer of abstraction for end-users.

---

## Software Requirement
- Oracle Database Express Edition  
- PostgreSQL  
- pgAdmin  

---

## OBJECTIVES
Apply joins to a real-world database schema (e.g., Students, Courses, Enrollments, Departments)

---

# Practical / Experiment Steps

---

## Table Creation
```sql
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

```

## Insertion in tables
```sql
-- Students (added duplicate dept_id for SELF JOIN)
INSERT INTO Students VALUES (1, 'Amit', 101);
INSERT INTO Students VALUES (2, 'Sara', 102);
INSERT INTO Students VALUES (3, 'John', 103);
INSERT INTO Students VALUES (4, 'Neha', NULL);
INSERT INTO Students VALUES (5, 'Pankaj', NULL);
INSERT INTO Students VALUES (6, 'Rahul', 101);
INSERT INTO Students VALUES (7, 'Simran', 101);

-- Courses
INSERT INTO Courses VALUES (201, 'DBMS');
INSERT INTO Courses VALUES (202, 'Java');
INSERT INTO Courses VALUES (203, 'Python');

-- Enrollments
INSERT INTO Enrollments VALUES (1, 201);
INSERT INTO Enrollments VALUES (1, 202);
INSERT INTO Enrollments VALUES (2, 201);
INSERT INTO Enrollments VALUES (6, 203);

-- Departments
INSERT INTO Departments VALUES (101, 'CS');
INSERT INTO Departments VALUES (102, 'IT');
INSERT INTO Departments VALUES (103, 'ECE');
```

<img width="452" height="354" alt="Students" src="https://github.com/user-attachments/assets/08f9d0e8-5d1b-460c-8c9e-0b4c0369eef6" />
<img width="411" height="229" alt="Courses" src="https://github.com/user-attachments/assets/d0c880f3-3d1d-43c7-b7b4-a392d3817b4f" />
<img width="426" height="244" alt="Departments" src="https://github.com/user-attachments/assets/5b292087-727e-4873-8a30-e5246e350349" />
<img width="423" height="266" alt="Enrollments" src="https://github.com/user-attachments/assets/bf6c67cc-7a7a-461d-8c00-54b1b7c91b48" />

---

## INNER JOIN
```sql
SELECT s.student_id, s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e 
    ON s.student_id = e.student_id
INNER JOIN Courses c 
    ON e.course_id = c.course_id;
```

### Output
<img width="564" height="275" alt="innerJOIN" src="https://github.com/user-attachments/assets/04e8546b-f723-43f6-97c1-2e79717cd865" />

---

## LEFT JOIN

```sql
SELECT s.student_name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
WHERE e.course_id IS NULL;
```

### Output
<img width="439" height="261" alt="leftJOIN" src="https://github.com/user-attachments/assets/cbd50c44-bef9-4b0d-a3ee-7a05840d1460" />

---

## RIGHT JOIN
```sql
SELECT c.course_name, s.student_name
FROM Courses c
LEFT JOIN Enrollments e 
    ON c.course_id = e.course_id
LEFT JOIN Students s 
    ON e.student_id = s.student_id;
```

### Output
<img width="522" height="256" alt="rightJOIN" src="https://github.com/user-attachments/assets/e5848385-21d6-4c06-b3bd-c5086ff94ef4" />

---

## MULTIPLE JOIN
```sql
SELECT 
    s.student_name,
    d.dept_name,
    c.course_name
FROM Students s
LEFT JOIN Departments d 
    ON s.dept_id = d.dept_id
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
LEFT JOIN Courses c 
    ON e.course_id = c.course_id;
```

### Output
<img width="653" height="398" alt="multiple JOIN" src="https://github.com/user-attachments/assets/7bca431b-02e8-4a77-ac4f-b1234198e46f" />

---
## SELF JOIN
```sql
SELECT A.student_name AS Student1, B.student_name AS Student2, A.dept_id
FROM Students A
JOIN Students B 
    ON A.dept_id = B.dept_id
WHERE A.student_id < B.student_id;
```

### OUTPUT
<img width="550" height="224" alt="selfJOIN" src="https://github.com/user-attachments/assets/9bcd2913-9c13-498f-b765-22c940177104" />

---

## SELF JOIN
```sql
SELECT s.student_name, c.course_name
FROM Students s
CROSS JOIN Courses c
LIMIT 10;
```

### OUTPUT
<img width="454" height="445" alt="crossJOIN" src="https://github.com/user-attachments/assets/b53acaa0-c0dc-421d-84cf-65b076ad64b4" />


---

## Outcomes
1.	INNER JOIN returns only matching records between tables (students who are enrolled in courses).
2.	LEFT JOIN helps identify unmatched data (students with no course enrollments).
3.	RIGHT JOIN ensures all records from the right table appear, even without matches.
4.	SELF JOIN compares rows within the same table (students in the same department).
5.	CROSS JOIN produces all possible combinations of rows (Cartesian product).


---

