-- Goal:
-- Find the last person who can enter the elevator
-- without the total weight exceeding 1000.

WITH CTE1 AS (
    SELECT 
        q.person_name,
        q.turn,
        
        -- Calculate cumulative weight up to the current turn
        SUM(u.weight) AS cumulative_weight

    FROM Queue q
    JOIN Queue u 
        ON q.turn >= u.turn

    GROUP BY q.person_name, q.turn

    -- Keep only rows where total weight is within limit
    HAVING SUM(u.weight) <= 1000
)

-- Select the person with the highest allowed cumulative weight
SELECT TOP (1) person_name
FROM CTE1
ORDER BY cumulative_weight DESC;
