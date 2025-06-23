USE company;

#11. Alter Column & Add Constraint 
#Change salary column to NUMERIC(12,2) and ensure all salaries are greater than 0 using a CHECK constraint.
ALTER TABLE employees
MODIFY salary NUMERIC(12,2);

ALTER TABLE employees
ADD CONSTRAINT chk_salary_positive
CHECK (salary > 0);