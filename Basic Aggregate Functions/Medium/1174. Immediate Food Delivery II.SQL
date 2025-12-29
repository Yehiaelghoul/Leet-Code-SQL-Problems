------------------------------------------------------------
-- Main Query
-- Purpose:
-- Calculate the percentage of customers whose
-- FIRST order was delivered on their preferred date
------------------------------------------------------------
SELECT
    ROUND(
        100.0 * 
        SUM(
            CASE 
                -- Order delivered immediately
                WHEN d.order_date = d.customer_pref_delivery_date THEN 1 
                ELSE 0 
            END
        ) 
        / COUNT(*),
        2   -- Round to 2 decimal places
    ) AS immediate_percentage
FROM Delivery d

------------------------------------------------------------
-- Subquery: first_orders
-- Purpose:
-- Identify the FIRST order date for each customer
------------------------------------------------------------
JOIN (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
) first_orders

------------------------------------------------------------
-- Keep only rows that represent each customer's FIRST order
------------------------------------------------------------
ON d.customer_id = first_orders.customer_id
AND d.order_date = first_orders.first_order_date;
