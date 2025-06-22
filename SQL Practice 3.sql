USE company;

#Basic Level 
#DDL(Create/Modify Tables)

#1.Create a Table
#Write a query to create a table named employees with columns:
CREATE TABLE employees (
emp_id INT PRIMARY KEY NOT NULL,
first_name VARCHAR (50),
last_name VARCHAR (50),
hire_date DATE
);