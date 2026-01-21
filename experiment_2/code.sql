CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(30),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Aman', 'Delhi', 96.5),
(2, 'Riya', 'Delhi', 97.0),
(3, 'Kunal', 'Delhi', 92.0),
(4, 'Neha', 'Mumbai', 98.0),
(5, 'Rohit', 'Mumbai', 96.5),
(6, 'Sneha', 'Mumbai', 94.0);

select * from students;
-- Without CASE statement
SELECT city, COUNT(*) AS above_95
FROM Students
WHERE percentage > 95
GROUP BY city;

-- With CASE statement
SELECT city,
SUM(CASE
    WHEN percentage > 95 THEN 1
    ELSE 0
END) AS above_95
FROM Students
GROUP BY city;

-- II: Average percentage of students scoring above 95
SELECT city,
AVG(CASE
    WHEN percentage > 95 THEN percentage
    ELSE NULL
END) AS average
FROM Students
GROUP BY city
ORDER BY average DESC;
