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

#4.Rename a Table
#Rename table employees to cilents
ALTER TABLE employees
RENAME TO cilents;

#DML (Insert/Update/Delete Data)

#5.Insert a Row
#Insert a department with ID 101 and name 'Marketing' into the departments table.
INSERT INTO employees (emp_id, first_name, last_name, hire_date, salary)
VALUES (101, 'AMAN', 'GUPTA', '2025-01-01', 50000),
(102, 'BOBY', 'SHARMA', '2025-01-05', 32000),
(103, 'CASEY', 'ROY', '2025-01-07', 20000),
(104, 'DIVYA', 'GUPTA', '2025-03-09', 90000),
(105, 'EVYA', 'KUMARI', '2025-06-02',20000);
SELECT * FROM employees;

#6.Update Records
#Increase salary by 10% for all employees in table employees.
SET SQL_SAFE_UPDATES = 0;
UPDATE employees
SET salary = salary * 1.10;
SET SQL_SAFE_UPDATES = 1;

#7.Delete Records
#Delete the salary columns from the table
ALTER TABLE employees
DROP COLUMN salary;

#JOINS (Combining Tables)
CREATE TABLE department(
emp_id INT PRIMARY KEY,
manager_name VARCHAR(50),
name VARCHAR(50),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO department(emp_id, manager_name, name)
VALUE (101, NULL, 'AI'),
(102, 'Alice', 'DS'),
(103, 'Hina', 'GenAI'),
(104, 'Abhay', 'ML'),
(105, 'Rahul', 'DA');
SELECT * FROM department;

#8.Inner Join
#Show employee names and their department names using employees and departments tables. 
SELECT * FROM employees
INNER JOIN department 
ON employees.emp_id = department.emp_id;

#9.Left Join
#Show all departments and the number of employees in each department (include departments with zero employees).
SELECT * FROM employees AS e
LEFT JOIN department AS d
ON e.emp_id = d.emp_id;
