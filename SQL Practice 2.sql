#Using the Database 	Shope
USE Shope;

#Table 1
CREATE TABLE customer(
customer_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT NOT NULL,
name VARCHAR(50),
city VARCHAR(50),
state VARCHAR(50),
email VARCHAR(100),
Phone VARCHAR(15)
);

INSERT INTO customer (customer_id, name, city, state, email, phone)
VALUES 
(1, 'Aditi Singh', 'Lucknow', 'UP', 'aditi@gmail.com', '9876543210'),
(2, 'Rahul Mehra', 'Delhi', 'Delhi', 'rahul@email.com', '9876501234'),
(3, 'Priya Verma', 'Mumbai', 'MH', 'priya@email.com', '9999999999'),
(4, 'Amit Sharma', 'Noida', 'UP', 'amit@email.com', '8888888888'),
(5, 'Sneha Das', 'Kolkata', 'WB', 'sneha@email.com', '7777777777'),
(6, 'Vikram Singh', 'Lucknow', 'UP', 'vikram@email.com', '6666666666');

SELECT * FROM customer;

#Table 2
CREATE TABLE orders (
order_id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
payment_mode VARCHAR(20),
order_status VARCHAR(20),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount, payment_mode, order_status)
VALUES 
(101, 1, '2022-01-15', '1200.50', 'UPI', 'Delivered'),
(102, 2, '2022-03-10', 500.00, 'Card', 'Pending'),
(103, 3, '2023-07-18', 8000.00, 'Cash', 'Delivered'),
(104, 1, '2023-08-25', 2000.00, 'Card', 'Cancelled'),
(105, 4, '2021-11-01', 150.00, 'UPI', 'Delivered'),
(106, 2, '2020-09-20', 750.00, 'UPI', 'Delivered'),
(107, 5, '2023-02-28', 3000.00, 'Cash', 'Returned'),
(108, 3, '2018-05-14', 9500.00, 'UPI', 'Delivered'),
(109, 6, '2024-01-10', 2200.00, 'Card', 'Pending'),
(110, 5, '2019-10-10', 1800.00, 'Cash', 'Delivered');

SELECT * FROM orders;

#Let's Practice

#1. Aggregate Functions
#Q: Find the average, maximum, and minimum order total.
SELECT 
  AVG(total_amount) AS avg_order,
  MAX(total_amount) AS max_order,
  MIN(total_amount) AS min_order
FROM orders;

#2. Group By
#Q: Show total orders and revenue grouped by payment mode.
SELECT payment_mode, COUNT(*) AS num_orders, SUM(total_amount) AS total_revenue
FROM orders
GROUP BY payment_mode;

#3. Count & Filter
#Q: Count how many customers are from each state (with more than 1 customer).
SELECT state, COUNT(*) AS customer_count
FROM customer
GROUP BY state
HAVING COUNT(*) > 1;

#4. Date Filtering
#Q: List orders placed in the year 2023 only.
SELECT * FROM orders
WHERE YEAR(order_date) = 2023;

#5. LEFT JOIN Use Case
#Q: Show all customers and their order totals (even if they haven’t ordered). 
SELECT name, total_amount
FROM customer
LEFT JOIN orders
ON customer.customer_id = orders.customer_id; 