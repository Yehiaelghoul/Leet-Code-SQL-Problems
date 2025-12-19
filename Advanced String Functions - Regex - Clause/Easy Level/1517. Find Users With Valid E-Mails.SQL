-- Goal:
-- Return users with a VALID LeetCode email.
-- Rules:
-- 1) Email must end with '@leetcode.com'
-- 2) Email must start with a letter
-- 3) Before '@leetcode.com', only allowed characters are:
--    letters, numbers, underscore (_), dot (.), and dash (-)

SELECT
    user_id,
    name,
    mail

FROM Users

WHERE 
    -- Ensure email ends exactly with '@leetcode.com' (case-sensitive)
    RIGHT(mail, 13) COLLATE Latin1_General_CS_AS = '@leetcode.com'

    -- Ensure email starts with a letter
    AND mail LIKE '[a-zA-Z]%'

    -- Ensure no invalid characters exist before the domain
    AND LEFT(mail, LEN(mail) - 13) 
        NOT LIKE '%[^0-9a-zA-Z_.-]%';
