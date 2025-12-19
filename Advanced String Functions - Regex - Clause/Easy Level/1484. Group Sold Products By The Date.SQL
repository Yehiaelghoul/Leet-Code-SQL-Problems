-- Goal:
-- For each sell date:
-- 1) Count how many DISTINCT products were sold
-- 2) List product names in alphabetical order, separated by commas

-- Step 1: Remove duplicate products per day
WITH DISTINCT_PRODUCT AS (
    SELECT DISTINCT 
        sell_date,
        product
    FROM Activities
)

-- Step 2: Aggregate per day
SELECT 
    sell_date,                       -- Selling date

    COUNT(product) AS num_sold,      -- Number of distinct products sold

    -- Combine product names into a single comma-separated string
    STRING_AGG(product, ',') 
        WITHIN GROUP (ORDER BY product) AS products

FROM DISTINCT_PRODUCT

GROUP BY sell_date
ORDER BY sell_date;
