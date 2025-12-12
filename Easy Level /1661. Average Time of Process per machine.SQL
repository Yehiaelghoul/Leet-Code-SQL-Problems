Goal:
Calculate the average processing time for each machine.
Processing time = end_timestamp - start_timestamp
We match each 'start' and 'end' activity for the same machine and process.
*/

SELECT 
    A2.machine_id,
    
    -- Calculate the average time difference between end and start,
    -- rounded to 3 decimal places
    ROUND(AVG(A2.timestamp - A1.timestamp), 3) AS processing_time

FROM Activity A1
JOIN Activity A2
    ON A1.machine_id = A2.machine_id        -- Must be the same machine
   AND A1.process_id = A2.process_id        -- Must be the same process instance
   AND A1.activity_type = 'start'           -- A1 represents the starting event
   AND A2.activity_type = 'end'             -- A2 represents the ending event

-- Group by machine to compute average processing time per machine
GROUP BY A2.machine_id;
