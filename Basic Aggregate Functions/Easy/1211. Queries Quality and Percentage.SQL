------------------------------------------------------------
-- CTE: CTE1
-- Purpose:
-- For each query:
-- 1) Calculate query quality (rating / position)
-- 2) Flag poor queries (rating < 3)
------------------------------------------------------------
WITH CTE1 AS (
    SELECT
        query_name,

        -- Quality metric per query
        rating * 1.0 / position AS query_quality,

        -- Flag poor queries
        CASE
            WHEN rating < 3 THEN 1
            ELSE 0
        END AS poor
    FROM Queries
)

------------------------------------------------------------
-- Main Query
-- Purpose:
-- Aggregate quality metrics per query:
-- 1) Average query quality
-- 2) Percentage of poor queries
------------------------------------------------------------
SELECT
    query_name,

    -- Average quality per query
    ROUND(AVG(query_quality), 2) AS quality,

    -- Percentage of poor queries
    ROUND(
        SUM(poor) * 100.0 / COUNT(query_name),
        2
    ) AS poor_query_percentage
FROM CTE1

------------------------------------------------------------
-- Group results by query name
------------------------------------------------------------
GROUP BY query_name;
