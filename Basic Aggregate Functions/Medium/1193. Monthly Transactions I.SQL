------------------------------------------------------------
-- Main Query
-- Purpose:
-- Summarize transactions by:
-- 1) Month (YYYY-MM)
-- 2) Country
-- 
-- For each month & country, calculate:
-- - Total number of transactions
-- - Total transaction amount
-- - Number of approved transactions
-- - Total amount of approved transactions
------------------------------------------------------------
SELECT
    FORMAT(trans_date, 'yyyy-MM') AS month,   -- Extract year-month from transaction date
    country,                                  -- Country where transaction occurred

    COUNT(id) AS trans_count,                 -- Total number of transactions
    SUM(amount) AS trans_total_amount,        -- Total transaction amount

    -- Count only approved transactions
    SUM(
        CASE 
            WHEN state = 'approved' THEN 1 
            ELSE 0 
        END
    ) AS approved_count,

    -- Sum amounts of approved transactions only
    SUM(
        CASE 
            WHEN state = 'approved' THEN amount 
            ELSE 0 
        END
    ) AS approved_total_amount
FROM Transactions

------------------------------------------------------------
-- Group results by country and month
------------------------------------------------------------
GROUP BY 
    country,
    FORMAT(trans_date, 'yyyy-MM');
