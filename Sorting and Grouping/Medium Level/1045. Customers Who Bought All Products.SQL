-- Goal:
-- Find customers who purchased EVERY product listed
-- in the Product table.

SELECT 
    customer_id

FROM Customer
-- Consider only valid product keys
WHERE product_key IN (
    SELECT product_key
    FROM Product
)

-- Group purchases by customer
GROUP BY customer_id

-- Keep only customers who bought ALL products
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(product_key)
    FROM Product
);
