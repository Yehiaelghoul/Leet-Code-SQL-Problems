-- Goal:
-- Find the person involved in the highest number of accepted requests
-- (either as requester or accepter)

WITH Combined AS (
    SELECT accepter_id AS id FROM RequestAccepted
    UNION ALL
    SELECT requester_id AS id FROM RequestAccepted
)

-- Count total occurrences per person
SELECT TOP 1 
    id,
    COUNT(*) AS num

FROM Combined
GROUP BY id
ORDER BY COUNT(*) DESC;
