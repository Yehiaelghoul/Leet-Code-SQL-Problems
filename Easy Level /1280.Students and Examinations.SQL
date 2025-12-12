/* 
Goal of this query:
-------------------
For every student AND every subject, we want to show how many exams the student attended
for that specific subject.

Important details:
- We must show ALL students.
- We must show ALL subjects.
- Even if the student did NOT attend any exam → show 0.
- This requires CROSS JOIN + LEFT JOIN.

Tables meaning:
--------------
students       → list of all students
subjects       → list of all subjects
examinations   → records of which student attended which subject exam
*/

SELECT 
    s.student_id,       -- The unique ID of each student
    s.student_name,     -- The student's name
    
    su.subject_name,    -- The subject we are checking for this student
    
    -- Count how many times the student attended this subject's exam.
    -- If they never attended → COUNT returns 0 (because of LEFT JOIN).
    COUNT(e.subject_name) AS attended_exams  

FROM students s
-- CROSS JOIN creates ALL possible combinations of students × subjects.
-- This means: every student will appear once with every subject.
CROSS JOIN subjects su

-- LEFT JOIN keeps ALL student–subject combinations,
-- even if the student did not attend the exam.
LEFT JOIN examinations e
    ON s.student_id = e.student_id          -- Match the same student
   AND su.subject_name = e.subject_name     -- Match the same subject

-- Group results by each student and subject combination
GROUP BY
    s.student_id,
    s.student_name,
    su.subject_name

-- Sort the output nicely:
-- first by student ID, then by subject
ORDER BY 
    s.student_id,
    su.subject_name;
