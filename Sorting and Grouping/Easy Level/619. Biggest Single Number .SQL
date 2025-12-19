-- Goal:
-- Return the largest number that appears exactly once.
-- If no such number exists, return NULL.

SELECT 
    COALESCE((
        SELECT TOP 1 num
        FROM MyNumbers
        
        -- Group identical numbers together
        GROUP BY num
        
        -- Keep numbers that appear only once
        HAVING COUNT(*) = 1
        
        -- Choose the largest among them
        ORDER BY num DESC
    ), NULL) AS num;
