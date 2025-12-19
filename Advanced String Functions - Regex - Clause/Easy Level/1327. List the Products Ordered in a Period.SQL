-- Goal:
-- Find products that sold at least 100 units
-- during February 2020.

-- Step 1: Aggregate orders within the date range
WITH OrdersAgg AS (
    SELECT
        O.product_id,                 -- Product ID
        SUM(O.unit) AS total_units    -- Total units ordered
    FROM dbo.Orders AS O

    -- Filter only February 2020 orders
    WHERE 
        O.order_date >= '2020-02-01'  -- Start date (inclusive)
        AND O.order_date <  '2020-03-01'  -- End date (exclusive)

    GROUP BY O.product_id

    -- Keep only products with at least 100 units
    HAVING SUM(O.unit) >= 100
)

-- Step 2: Join with Products table to get product names
SELECT
    P.product_name,          -- Product name
    A.total_units AS unit    -- Total units sold

FROM OrdersAgg AS A
INNER JOIN dbo.Products AS P
    ON P.product_id = A.product_id;
