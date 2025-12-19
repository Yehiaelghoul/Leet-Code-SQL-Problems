-- Goal:
-- Swap students in adjacent seats:
-- - Even ID → swap with previous seat
-- - Odd ID → swap with next seat
-- - Last odd seat with no next seat stays the same

SELECT 
    CASE
        WHEN s1.id % 2 = 0 
            THEN s1.id - 1        -- Even ID: move to previous seat

        WHEN s1.id % 2 = 1 
             AND s2.id IS NULL 
            THEN s1.id            -- Odd ID with no next seat: stay same

        ELSE s1.id + 1             -- Odd ID with next seat: move forward
    END AS id,

    s1.student                     -- Student name

FROM Seat s1

-- Join to check if a next seat exists
LEFT JOIN Seat s2 
    ON s1.id + 1 = s2.id

-- Sort by the new seat ID
ORDER BY id;
