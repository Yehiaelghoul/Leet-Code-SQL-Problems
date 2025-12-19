-- Goal:
-- Remove duplicate email records.
-- Keep only the row with the smallest ID for each email.

WITH CTE1 AS (
    SELECT 
        id,         -- Row ID
        email,      -- Email address

        -- Assign a row number for each email
        -- The first occurrence gets rn = 1
        ROW_NUMBER() OVER (
            PARTITION BY email
            ORDER BY id
        ) AS rn

    FROM Person
)

-- Delete all rows except the first occurrence
DELETE FROM CTE1
WHERE rn > 1;
