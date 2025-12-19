-- Goal:
-- List employees whose bonus is either:
-- - less than 1000
-- - OR missing (NULL)

SELECT 
    e.name,     -- Employee name
    b.bonus     -- Bonus amount (may be NULL)

FROM Employee e
-- LEFT JOIN keeps all employees,
-- even if they do not have a bonus record
LEFT JOIN Bonus b 
    ON e.empId = b.empId   -- Match employee to bonus

-- Filter employees based on bonus condition
WHERE b.bonus < 1000
   OR b.bonus IS NULL;
