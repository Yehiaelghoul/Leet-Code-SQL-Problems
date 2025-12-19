-- Goal:
-- Show the product name, the year of sale, and the price.
-- Even if some sales records do not have matching product details,
-- the sales data should still appear.

SELECT 
    p.product_name,   -- Name of the product
    s.year,           -- Year when the product was sold
    s.price           -- Sale price of the product

FROM sales s
-- LEFT JOIN keeps all sales records,
-- even if product details are missing
LEFT JOIN product p
    ON s.product_id = p.product_id;   -- Match sales to products by product ID
