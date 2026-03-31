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

--- inner JOIN
SELECT s.student_id, s.student_name, c.course_name
FROM Students s
INNER JOIN Enrollments e 
    ON s.student_id = e.student_id
INNER JOIN Courses c 
    ON e.course_id = c.course_id;

--- left JOIN
SELECT s.student_name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

--- right JOIN
SELECT c.course_name, s.student_name
FROM Courses c
LEFT JOIN Enrollments e 
    ON c.course_id = e.course_id
LEFT JOIN Students s 
    ON e.student_id = s.student_id;

--- multiple join
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

--- self JOIN
SELECT A.student_name AS Student1, B.student_name AS Student2, A.dept_id
FROM Students A
JOIN Students B 
    ON A.dept_id = B.dept_id
WHERE A.student_id < B.student_id;

--- cross JOIN 
SELECT s.student_name, c.course_name
FROM Students s
CROSS JOIN Courses c
LIMIT 10;