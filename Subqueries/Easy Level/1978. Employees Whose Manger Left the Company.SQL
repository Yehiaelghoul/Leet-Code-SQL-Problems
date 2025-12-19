-- Goal:
-- Find employees who:
-- 1) Have a manager assigned
-- 2) Earn less than 30,000
-- 3) Their manager ID does NOT exist in the Employees table

SELECT 
    e.employee_id   -- Employee ID

FROM Employees e

WHERE 
    e.manager_id IS NOT NULL        -- Employee has a manager
    AND e.salary < 30000            -- Salary is less than 30,000

    -- Check that the manager record does NOT exist
    AND NOT EXISTS (
        SELECT 1
        FROM Employees m
        WHERE m.employee_id = e.manager_id
    )

-- Sort result by employee ID
ORDER BY e.employee_id;
