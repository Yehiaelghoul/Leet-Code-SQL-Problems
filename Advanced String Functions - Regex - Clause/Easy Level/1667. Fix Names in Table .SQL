-- Goal:
-- Format each user's name so that:
-- - First letter is UPPERCASE
-- - Remaining letters are lowercase

SELECT 
    user_id,   -- Unique ID of the user

    -- Build the formatted name:
    -- 1) Take first letter and convert it to UPPERCASE
    -- 2) Take the rest of the name and convert it to lowercase
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(RIGHT(name, LEN(name) - 1))
    ) AS name

FROM Users

-- Sort results by user ID
ORDER BY user_id;
