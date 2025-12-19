-- Goal:
-- Show each employee's name along with their unique ID (if it exists).
-- If an employee does not have a unique ID, they should still appear.

SELECT 
    EU.unique_id,   -- The employee's unique identifier (may be NULL)
    E.name          -- The employee's name

FROM employees E
-- LEFT JOIN keeps all employees,
-- even if they don't have a matching record in EmployeeUNI
LEFT JOIN EmployeeUNI EU
    ON E.id = EU.id;   -- Match records using the employee ID
