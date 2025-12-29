------------------------------------------------------------
-- Main Query
-- Purpose:
-- Calculate the fraction of players who logged in
-- exactly one day after their first login
------------------------------------------------------------
SELECT
    ROUND(
        COUNT(C.player_id) * 1.0 /
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity A

------------------------------------------------------------
-- Subquery: C
-- Purpose:
-- Get the FIRST login date for each player
------------------------------------------------------------
JOIN (
    SELECT
        player_id,
        MIN(event_date) AS FIRST_LOGGING
    FROM Activity
    GROUP BY player_id
) C

------------------------------------------------------------
-- Match players who logged in exactly ONE day
-- after their first login
------------------------------------------------------------
ON A.player_id = C.player_id
AND DATEDIFF(DAY, C.FIRST_LOGGING, A.event_date) = 1;
