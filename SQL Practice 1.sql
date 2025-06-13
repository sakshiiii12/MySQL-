#SQL - IT IS A PROGRAMMING LANGUAGE USED TO INTERACT WITH REATIONAL DATABASES.

#Database shope
CREATE DATABASE Shope;

#Table 1
CREATE TABLE Customers(
Customer_id INT PRIMARY KEY auto_increment,
CusName VARCHAR (100) NOT NULL,
Age INT,
Gender CHAR(1),
City VARCHAR(50),
Order_Date DATE
);

INSERT INTO Customers (Customer_id, CusName, Age, Gender, City, Order_Date)
VALUES 
(1, 'Aditi Singh', 28, 'F', 'Delhi', '2021-06-01'),
(2, 'Raj Mehra', 35, 'M', 'Mumbai', '2019-09-15'),
(3, 'Priya Verma', 41, 'F', 'Bangalore', '2020-01-20'),
(4, 'Ankit Sharma', 24, 'M', 'Kolkata', '2022-03-10'),
(5, 'Neha Tiwari', 32, 'F', 'Chennai', '2018-11-03'),
(6, 'Aarav Joshi', 29, 'M', 'Jaipur', '2021-08-22'),
(7, 'Simran Kaur', 36, 'F', 'Chandigarh', '2020-05-30'),
(8, 'Rohit Kapoor', 38, 'M', 'Pune', '2017-07-17'),
(9, 'Riya Das', 30, 'F', 'Kolkata', '2023-01-01'),
(10, 'Mohit Rao', 27, 'M', 'Hyderabad', '2021-12-25');

SELECT * FROM Customers;

#Table 2
CREATE TABLE Order_Table(
Order_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Customer_id INT,
Ordered_date DATE,
Total_Amount DECIMAL(10, 2),
Payment_Mode VARCHAR(100),
Status_Order VARCHAR(20),
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

INSERT INTO Order_Table(Order_id, Customer_id,Ordered_date,Total_Amount,Payment_Mode,Status_Order)
VALUES (101, 1, '2023-01-15', 1200.50, 'UPI', 'Delivered'),
(102, 3, '2023-02-05', 4500.00, 'Credit Card', 'Delivered'),
(103, 2, '2022-11-20', 800.00, 'Cash', 'Cancelled'),
(104, 5, '2022-12-18', 6700.25, 'Debit Card', 'Delivered'),
(105, 4, '2023-01-25', 1500.00, 'UPI', 'Returned'),
(106, 7, '2023-03-15', 3200.40, 'Net Banking', 'Delivered'),
(107, 1, '2023-04-05', 950.75, 'Credit Card', 'Delivered'),
(108, 8, '2022-10-10', 2100.00, 'UPI', 'Delivered'),
(109, 10, '2023-05-01', 500.00, 'Cash', 'Pending'),
(110, 6, '2023-05-15', 1350.00, 'UPI', 'Delivered');

SELECT * FROM Order_Table;

#Let's Practice:
#1.📋 Select Specific Data 
#Retrieve the names and ages of customers from the customers table who are older than 30.
SELECT CusName, Age FROM Customers WHERE age > 30;

#2.🧮 Aggregate Functions + GROUP BY
#Find the total sales made by each salesperson from the orders table.
SELECT Order_id, SUM(Total_Amount) AS total_sales
FROM Order_Table
GROUP BY Order_id;

#3.🧹 Filtering with LIKE and BETWEEN
#Show all customer whose names start with 'A' and who were order_date between 2020 and 2022.
SELECT * FROM Customers
WHERE CusName Like 'A%' AND Order_date Between '2020-06-01' AND '2022-08-22';

#4.🔗 INNER JOIN
#List all orders with the customer's name from orders and customers tables.
SELECT Order_id, CusName FROM Order_Table
INNER JOIN Customers
ON Order_Table.Customer_id = Customers.Customer_id;

#5. 🧭 LEFT JOIN with NULL Check
#Find customers who haven’t placed any orders.
SELECT CusName FROM Customers
LEFT JOIN Order_Table
ON Customers.Customer_id = Order_Table.Customer_id
WHERE Order_Table.Order_id IS NULL;

#6. 🧠 Subquery
#Find customers who placed orders with a total amount greater than the average order amount.
SELECT Order_id, Total_Amount, CusName
FROM Order_Table
INNER JOIN Customers 
ON Order_Table.Customer_id = Customers.Customer_id
WHERE Order_Table.Total_Amount > (
SELECT AVG(Total_Amount) FROM Order_Table           #Subquery
);

#7.🧊 Window Function (Advanced)
#Assign row numbers to each order based on the total_amount in descending order (highest order first).
SELECT Order_id, CusName, Total_Amount, ROW_NUMBER() OVER (ORDER BY TOTAL_AMOUNT DESC) AS Order_Rank
From Order_Table
JOIN Customers on Order_Table.Customer_id = Customers.Customer_id;

#8. 🧮 CASE Statement
#Show each customer's name and classify their order amount as 'Low', 'Medium', or 'High'.
SELECT Order_id, CusName, Total_Amount,
CASE 
    WHEN Total_Amount < 1000 THEN 'Low'
	WHEN Total_Amount BETWEEN 1000 AND 3000 THEN 'Medium'
    ELSE 'HIGH'
END AS Amount_Level
FROM Order_Table
JOIN Customers on Order_Table.Customer_id = Customers.Customer_id;

#9. 🔁 UNION
#Combine two tables Customers and Order_Table with just names.
SELECT Order_date FROM Customers
UNION 
SELECT Ordered_date FROM Order_Table;

#10. 📦 DELETE with Condition
#Delete orders older than 2019 from the orders table.
SELECT * FROM Order_Table WHERE Ordered_date < '2019-01-01';