-- Goal:
-- List customer names where:
-- - The referee is NOT customer 2
-- - OR the customer has no referee at all (NULL)

SELECT 
    name   -- Customer name

FROM Customer
-- Filter customers based on referee condition
WHERE referee_id != 2       -- Referee is not customer 2
   OR referee_id IS NULL;   -- Customer has no referee
