------------------------------------------------------------
-- Main Query
-- Purpose:
-- Calculate the percentage of users registered
-- for each contest relative to all users
------------------------------------------------------------
SELECT
    r.contest_id,

    -- Percentage of registered users per contest
    ROUND(
        COUNT(r.contest_id) * 100.0 /
        (SELECT COUNT(user_id) FROM Users),
        2
    ) AS percentage
FROM Register r

------------------------------------------------------------
-- LEFT JOIN to keep contests even if user data is missing
------------------------------------------------------------
LEFT JOIN Users u
    ON u.user_id = r.user_id

------------------------------------------------------------
-- Group by contest to calculate percentages
------------------------------------------------------------
GROUP BY r.contest_id

------------------------------------------------------------
-- Sort by highest percentage, then contest ID
------------------------------------------------------------
ORDER BY percentage DESC, r.contest_id;
