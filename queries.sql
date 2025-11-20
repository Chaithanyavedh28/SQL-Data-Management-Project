-- 1. Department-wise salary analysis
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees,
       AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.department = d.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000;

-- 2. Employees earning above average salary
SELECT emp_name, salary
FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

-- 3. Create a view for summary
CREATE OR REPLACE VIEW EmployeeSummary AS
SELECT e.emp_id, e.emp_name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.department = d.dept_id;

-- 4. Stored procedure to update salary
CREATE OR REPLACE PROCEDURE UpdateSalary (
    p_emp_id INT,
    p_increment NUMBER
) AS
BEGIN
    UPDATE Employees
    SET salary = salary + p_increment
    WHERE emp_id = p_emp_id;
    COMMIT;
END;
/

-- 5. Transaction example
SAVEPOINT before_update;
UPDATE Employees SET salary = salary + 5000 WHERE emp_id = 101;
ROLLBACK TO before_update;
