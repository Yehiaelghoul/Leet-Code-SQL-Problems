-- Goal:
-- Calculate the 7-day rolling average of daily customer spending

-- Step 1: Sum daily amounts
WITH CTE1 AS (
    SELECT 
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),

-- Step 2: Calculate rolling 7-day sum
CTE2 AS (
    SELECT 
        visited_on,
        SUM(amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount
    FROM CTE1 
)

-- Step 3: Calculate average and filter valid 7-day windows
SELECT 
    visited_on,
    amount,
    ROUND(amount * 1.0 / 7, 2) AS average_amount

FROM CTE2

-- Keep only dates that complete a 7-day window
WHERE visited_on IN (
    SELECT DISTINCT CU.visited_on
    FROM CTE1 C 
    INNER JOIN CTE1 CU 
        ON DATEDIFF(DAY, C.visited_on, CU.visited_on) = 6
)

ORDER BY visited_on;
