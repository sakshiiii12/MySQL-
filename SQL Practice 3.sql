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

#2.Add a New Column
#Add a column salary (DECIMAL(10,2)) to the existing employees table.
ALTER TABLE employees
ADD COLUMN salary INT NOT NULL DEFAULT 20000;

#3.Drop a Table
#Delete the table old_backups from the database if it exists. 
DROP TABLE IF EXISTS old_backups;