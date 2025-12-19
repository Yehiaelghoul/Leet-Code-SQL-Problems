-- First CTE:
-- Calculate total confirmation attempts and successful confirmations per user
WITH ConfirmRates AS (
    SELECT
        user_id,   -- The user's unique ID
        
        -- Count total confirmation attempts
        COUNT(*) AS Total_attempts,
        
        -- Count only successful confirmations
        SUM(
            CASE 
                WHEN action = 'confirmed' THEN 1 
                ELSE 0 
            END
        ) AS Total_confirmations
    FROM Confirmations
    GROUP BY user_id
)

-- Main query:
-- Calculate confirmation rate for each user
SELECT 
    s.user_id,   -- The user's unique ID
    
    -- Calculate confirmation rate:
    -- (confirmed actions ÷ total attempts)
    -- Handle NULLs and division by zero safely
    COALESCE(
        ROUND(
            1.0 * COALESCE(c.Total_confirmations, 0)
            / NULLIF(c.Total_attempts, 0),
        2),
    0.00) AS confirmation_rate

FROM Signups s
-- LEFT JOIN ensures all users appear,
-- even if they never attempted a confirmation
LEFT JOIN ConfirmRates c 
    ON s.user_id = c.user_id;
