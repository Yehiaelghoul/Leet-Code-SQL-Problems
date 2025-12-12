/* 
Goal of this query:
-------------------
We want to find the names of ALL managers who have **5 or more employees** reporting to them.

Understanding the table:
------------------------
Employee table has:
- id          → the employee's unique number
- name        → the employee's name
- managerId   → the id of the employee's manager

So:
Each row represents ONE employee,
and "managerId" tells us who their manager is.
*/

SELECT 
    m.name     -- We want to show the manager's name

FROM Employee e
-- We join the Employee table to itself:
-- 'e' = employee
-- 'm' = manager
JOIN Employee m 
    ON e.managerId = m.id    -- This links each employee to their manager

-- Now we group employees under their manager
GROUP BY 
    m.id,       -- Manager's unique ID
    m.name;     -- Manager's name

-- HAVING is like WHERE but used AFTER grouping.
-- We only want managers with 5 or more employees.
HAVING COUNT(*) >= 5;
