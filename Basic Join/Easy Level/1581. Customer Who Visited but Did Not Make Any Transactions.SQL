-- Goal:
-- Find customers who visited but did NOT make any transactions.
-- Count how many times each customer had no transaction.

SELECT 
    v.customer_id,              -- Unique ID of the customer
    
    -- Count visits with no transactions
    COUNT(v.customer_id) AS count_no_trans

FROM Transactions t
-- RIGHT JOIN keeps all visits,
-- even if there is no matching transaction
RIGHT JOIN visits v 
    ON v.visit_id = t.visit_id   -- Match visits to transactions

-- Keep only visits where no transaction exists
WHERE t.transaction_id IS NULL

-- Group by customer to count no-transaction visits
GROUP BY v.customer_id;
