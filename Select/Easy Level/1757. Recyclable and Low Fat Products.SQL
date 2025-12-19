-- Goal:
-- Find products that are BOTH low fat and recyclable.

SELECT 
    product_id   -- Unique ID of the product

FROM Products
-- Apply conditions to filter products
WHERE low_fats = 'Y'        -- Product is marked as low fat
  AND recyclable = 'Y';     -- Product is recyclable
