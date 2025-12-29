------------------------------------------------------------
-- Main Query
-- Purpose:
-- Calculate the average experience (in years)
-- of employees working on each project
------------------------------------------------------------
SELECT
    p.project_id,

    -- Multiply by 1.0 to avoid integer division
    ROUND(AVG(e.experience_years * 1.0), 2) AS average_years
FROM Project p

------------------------------------------------------------
-- Join Employee table to access experience years
------------------------------------------------------------
INNER JOIN Employee e
    ON e.employee_id = p.employee_id

------------------------------------------------------------
-- Group by project to compute averages per project
------------------------------------------------------------
GROUP BY p.project_id;
