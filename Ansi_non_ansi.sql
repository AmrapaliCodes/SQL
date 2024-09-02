-- Create the department table
CREATE TABLE department (
    dept_id INT PRIMARY KEY,   -- Department ID
    dept_name VARCHAR(100)     -- Department Name
);

-- Create the employee table
CREATE TABLE employee1 (
    emp_id INT PRIMARY KEY,       -- Employee ID
    emp_name VARCHAR(100),        -- Employee Name
    salary DECIMAL(10, 2),    	  -- Employee Salary
    dept_id INT,                  -- Department ID (Foreign Key)
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Insert data into the department table
INSERT INTO department (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Marketing');

-- Insert data into the employee table
INSERT INTO employee1 (emp_id, emp_name, salary, dept_id) VALUES
(1, 'Alice', 60000, 1),
(2, 'Bob', 75000, 2),
(3, 'Charlie', 90000, 3),
(4, 'Diana', 85000, 3),
(5, 'Eve', 70000, 4);

select * from employee1;
select * from department;

-- select all employee details who are from Engineering department?
-- 1st way
select *
from employee1 e
left join department d on
e.dept_id=d.dept_id
where d.dept_name="Engineering";

-- 2nd way
select *
from employee1 e
left join department d on
e.dept_id=d.dept_id
and d.dept_name="Engineering";

-- Even though both queries are intended to do the same operation,
-- result of 1st way is different then result of 2nd way. This is due to SQL order of execution,
-- in 1st way join will happen first and then it will filter out the records based on joined resultset
-- however in the 2nd way, it is doing left join (inner + left) so it will perform inner join first based on the condition but then it will go to left table and fetch all the left records at the end 
