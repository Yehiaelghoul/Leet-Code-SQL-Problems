-- Goal:
-- For each manager, calculate:
-- 1) How many employees report to them
-- 2) The average age of those employees (rounded)

SELECT 
    y.employee_id,          -- Manager ID
    y.name,                 -- Manager name
    
    -- Count how many employees report to this manager
    COUNT(x.reports_to) AS reports_count,
    
    -- Calculate average age of reporting employees
    -- Multiply by 1.0 to avoid integer division
    ROUND(AVG(x.age * 1.0), 0) AS average_age

FROM Employees x
-- x represents employees (subordinates)

JOIN Employees y 
    ON x.reports_to = y.employee_id
-- y represents managers

-- Group by each manager
GROUP BY y.employee_id, y.name

-- Sort output by manager ID
ORDER BY y.employee_id;
