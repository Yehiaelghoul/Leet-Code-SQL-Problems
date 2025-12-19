-- Goal:
-- Find class names that have 5 or more students enrolled.

SELECT 
    class

FROM Courses
-- Group rows by class
GROUP BY class

-- Keep only classes with at least 5 records
HAVING COUNT(class) >= 5;
