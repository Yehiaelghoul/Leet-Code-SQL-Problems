------------------------------------------------------------
-- Main Query
-- Purpose:
-- Swap seat IDs for students:
-- - If the seat ID is even → swap with the previous seat
-- - If the seat ID is odd:
--     • Swap with the next seat if it exists
--     • Otherwise, keep the same seat (last student case)
------------------------------------------------------------
SELECT
    --------------------------------------------------------
    -- Determine the new seat ID after swapping
    --------------------------------------------------------
    CASE
        -- If ID is even, swap with the previous seat
        WHEN s1.id % 2 = 0 THEN s1.id - 1

        -- If ID is odd and there is NO next seat, keep it as is
        WHEN s1.id % 2 = 1 AND s2.id IS NULL THEN s1.id

        -- If ID is odd and a next seat exists, swap with next
        ELSE s1.id + 1
    END AS id,

    s1.student    -- Student name
FROM Seat s1

------------------------------------------------------------
-- LEFT JOIN:
-- Purpose:
-- Check whether the next seat exists (id + 1)
-- LEFT JOIN ensures the last row is still kept
------------------------------------------------------------
LEFT JOIN Seat s2
    ON s1.id + 1 = s2.id

------------------------------------------------------------
-- Sort results by the new seat ID
------------------------------------------------------------
ORDER BY id;
