-- Goal:
-- Find the IDs of days where the temperature
-- was higher than the previous day.

SELECT 
    w2.id   -- ID of the day with higher temperature

FROM Weather w1
-- Join the table to itself to compare consecutive days
JOIN Weather w2
    ON DATEDIFF(w2.recordDate, w1.recordDate) = 1   -- w2 is the next day

-- Keep only days where temperature increased
WHERE w2.temperature > w1.temperature;
