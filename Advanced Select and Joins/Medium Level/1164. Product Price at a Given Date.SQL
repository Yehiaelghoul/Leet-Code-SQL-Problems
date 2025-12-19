-- Goal:
-- For each product, find its price as of '2019-08-16'.
-- If no price change exists before that date, return 10.

SELECT DISTINCT 
    p.product_id,
    
    -- Use the latest price before the given date
    -- If none exists, default to 10
    COALESCE(latest.new_price, 10) AS price

FROM Products p

-- OUTER APPLY allows us to get the latest matching row per product
OUTER APPLY (
    SELECT TOP 1 new_price
    FROM Products
    WHERE 
        product_id = p.product_id
        AND change_date <= '2019-08-16'
    ORDER BY change_date DESC
) AS latest;
