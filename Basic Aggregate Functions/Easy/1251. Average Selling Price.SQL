------------------------------------------------------------
-- Main Query
-- Purpose:
-- Calculate the average selling price for each product
-- based on the units sold within the valid price period
------------------------------------------------------------
SELECT
    p.product_id,    -- Unique identifier of the product

    --------------------------------------------------------
    -- Calculate the average price:
    -- 1) Multiply price by units sold
    -- 2) Divide by total units sold
    -- 3) Handle cases where no units were sold
    --------------------------------------------------------
    ROUND(
        CASE
            -- If at least one unit was sold, calculate average price
            WHEN SUM(u.units) > 0 THEN
                SUM(p.price * u.units) * 1.0 / SUM(u.units)

            -- If no units were sold, return 0
            ELSE 0
        END,
        2   -- Round result to 2 decimal places
    ) AS average_price
FROM Prices p

------------------------------------------------------------
-- LEFT JOIN UnitsSold:
-- - Keeps all products even if no sales exist
-- - Matches sales only within the price validity period
------------------------------------------------------------
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
   AND u.purchase_date BETWEEN p.start_date AND p.end_date

------------------------------------------------------------
-- Group by product to calculate values per product
------------------------------------------------------------
GROUP BY p.product_id;
