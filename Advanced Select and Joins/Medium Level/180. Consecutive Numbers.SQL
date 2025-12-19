-- Goal:
-- Find numbers that appear at least 3 times consecutively
-- based on increasing ID values.

SELECT DISTINCT 
    l1.num AS ConsecutiveNums

FROM Logs l1
-- First occurrence

JOIN Logs l2 
    ON l1.id = l2.id - 1
-- Second consecutive row

JOIN Logs l3 
    ON l1.id = l3.id - 2
-- Third consecutive row

-- Ensure all three numbers are the same
WHERE 
    l1.num = l2.num 
    AND l1.num = l3.num;
