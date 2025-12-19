-- Goal:
-- For each day, count how many UNIQUE users were active
-- within the given date range.

SELECT 
    activity_date AS day,     -- Rename activity_date to "day" for clarity
    
    -- Count unique users per day
    COUNT(DISTINCT user_id) AS active_users

FROM Activity
-- Limit the data to the required date range
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-28'

-- Group results by each day
GROUP BY activity_date;
