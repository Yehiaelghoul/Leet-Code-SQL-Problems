------------------------------------------------------------
-- Main Query
-- Purpose:
-- Retrieve all non-boring movies that have an odd ID
-- and sort them by rating in descending order
------------------------------------------------------------
SELECT
    id,                     -- movie ID
    movie,                  -- movie name
    cinema.description,     -- movie description
    rating                  -- movie rating
FROM Cinema

------------------------------------------------------------
-- Filter Conditions:
-- 1) Keep only odd IDs
-- 2) Exclude movies marked as 'boring'
------------------------------------------------------------
WHERE id % 2 <> 0
  AND cinema.description != 'boring'

------------------------------------------------------------
-- Sort movies by highest rating first
------------------------------------------------------------
ORDER BY rating DESC;
