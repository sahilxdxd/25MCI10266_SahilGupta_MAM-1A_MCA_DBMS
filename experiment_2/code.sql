
-- Create Orders table representing customer orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(30),
    quantity INT,
    price DECIMAL(8,2),
    order_date DATE
);

-- Insert sufficient sample records
INSERT INTO Orders VALUES
(1, 'Aman', 'Laptop', 1, 65000, '2024-01-05'),
(2, 'Riya', 'Mobile', 2, 40000, '2024-01-06'),
(3, 'Kunal', 'Tablet', 1, 25000, '2024-01-07'),
(4, 'Neha', 'Laptop', 1, 70000, '2024-01-08'),
(5, 'Rohit', 'Mobile', 3, 60000, '2024-01-09'),
(6, 'Sneha', 'Headphones', 2, 6000, '2024-01-10'),
(7, 'Arjun', 'Laptop', 2, 130000, '2024-01-11'),
(8, 'Pooja', 'Tablet', 3, 75000, '2024-01-12'),
(9, 'Vikas', 'Mobile', 1, 20000, '2024-01-13'),
(10, 'Meena', 'Headphones', 4, 12000, '2024-01-14');

-- View table data
SELECT * FROM Orders;



-- Step 2: Filtering Data Using Conditions
    -- Retrieve orders with price greater than 50,000

SELECT *
FROM Orders
WHERE price > 50000;



-- Step 3: Sorting Query Results
    -- Sort orders by price in ascending order

SELECT customer_name, product, price
FROM Orders
ORDER BY price ASC;

    -- Sort orders by price in descending order

SELECT customer_name, product, price
FROM Orders
ORDER BY price DESC;

    -- Sort using multiple attributes (product, then price)

SELECT customer_name, product, price
FROM Orders
ORDER BY product ASC, price DESC;



-- Step 4: Grouping Data for Aggregation
    -- Calculate total sales for each product

SELECT product,
SUM(price) AS total_sales
FROM Orders
GROUP BY product;



-- Step 5: Applying Conditions on Aggregated Data
    -- Retrieve products having total sales greater than 80,000

SELECT product,
SUM(price) AS total_sales
FROM Orders
GROUP BY product
HAVING SUM(price) > 80000;



-- Step 6: Conceptual Understanding of Filtering vs Aggregation Conditions
    -- Incorrect query: using WHERE with aggregate function (logical error)

SELECT product,
SUM(price) AS total_sales
FROM Orders
GROUP BY product
HAVING SUM(price) > 80000;
