-- Goal:
-- For each product, return the FIRST year it was sold
-- along with its quantity and price in that year.

SELECT 
    product_id,
    year AS first_year,   -- Rename year to first_year
    quantity,
    price

FROM Sales S
-- Keep only records from the earliest year of each product
WHERE year = (
    SELECT MIN(year)
    FROM Sales
    WHERE product_id = S.product_id
);
