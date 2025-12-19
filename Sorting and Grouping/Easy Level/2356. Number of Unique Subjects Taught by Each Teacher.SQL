-- Goal:
-- For each teacher, count how many DIFFERENT subjects they teach.
-- Each subject should be counted only once per teacher.

SELECT 
    teacher_id,   -- Unique ID of the teacher
    
    -- Count distinct subjects taught by the teacher
    COUNT(DISTINCT subject_id) AS cnt

FROM Teacher
-- Group records by teacher
GROUP BY teacher_id;
