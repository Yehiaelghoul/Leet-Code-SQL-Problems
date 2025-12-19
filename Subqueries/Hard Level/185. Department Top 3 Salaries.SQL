-- Goal:
-- For each department, return employees who earn
-- one of the top 3 DISTINCT salaries

WITH RANKED AS (
    SELECT
        departmentId,
        name AS Employee,     -- Employee name
        salary,               -- Employee salary

        -- Rank salaries within each department
        DENSE_RANK() OVER (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS DR

    FROM Employee
)

-- Join department names and filter top 3 ranks
SELECT
    D.name AS Department,    -- Department name
    R.Employee,              -- Employee name
    R.salary                 -- Employee salary

FROM RANKED R
INNER JOIN Department D
    ON R.departmentId = D.id

WHERE R.DR <= 3;             -- Keep top 3 distinct salaries
