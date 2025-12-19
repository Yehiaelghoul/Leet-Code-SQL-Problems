-- Goal:
-- Determine whether X, Y, and Z can form a valid triangle.
-- Triangle rule:
-- The sum of any two sides must be greater than the third side.

SELECT 
    x,
    y,
    z,
    
    CASE 
        WHEN 
            x + y > z 
            AND x + z > y 
            AND y + z > x
        THEN 'Yes'
        ELSE 'No'
    END AS triangle

FROM Triangle;
