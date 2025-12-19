-- Goal:
-- Return each employee with their primary department.
-- Rules:
-- 1) If primary_flag = 'Y', take that department
-- 2) If primary_flag = 'N' AND employee has only one department,
--    then that department is considered primary

SELECT 
    employee_id,
    department_id

FROM Employee

WHERE 
    -- Case 1: Explicitly marked as primary
    primary_flag = 'Y'
    
    OR
    
    -- Case 2: Not marked primary, but employee belongs to only ONE department
    (
        primary_flag = 'N'
        AND employee_id IN (
            SELECT employee_id
            FROM Employee
            GROUP BY employee_id
            HAVING COUNT(DISTINCT department_id) = 1
        )
    );
