-- Goal:
-- Find countries that are considered "big".
-- A country is big if:
-- - Area is at least 3,000,000
-- - OR population is at least 25,000,000

SELECT 
    name,         -- Country name
    population,   -- Total population
    area          -- Total area size

FROM World
-- Apply size conditions
WHERE area >= 3000000
   OR population >= 25000000;
