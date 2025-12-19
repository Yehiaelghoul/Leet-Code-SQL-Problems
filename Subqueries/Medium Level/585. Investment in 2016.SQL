-- Goal:
-- Sum tiv_2016 for policies where:
-- 1) tiv_2015 appears more than once
-- 2) Location (lat, lon) is unique

WITH SameTiv2015 AS (
    SELECT 
        tiv_2016,

        -- Count policies with same tiv_2015
        COUNT(pid) OVER (PARTITION BY tiv_2015) AS same_inv_cnt,

        -- Count policies at the same location
        COUNT(pid) OVER (PARTITION BY lat, lon) AS same_location_cnt

    FROM Insurance
)

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016

FROM SameTiv2015
WHERE 
    same_inv_cnt > 1        -- Duplicate investment value
    AND same_location_cnt = 1;  -- Unique location
