-- Goal:
-- Find patients who have diabetes (DIAB1) listed in their conditions.
-- DIAB1 can appear:
-- - At the beginning of the text
-- - Or after a space inside the text

SELECT 
    patient_id,     -- Patient ID
    patient_name,   -- Patient name
    conditions      -- Medical conditions

FROM Patients

WHERE 
    conditions LIKE '% DIAB1%'  -- DIAB1 appears after a space
    OR conditions LIKE 'DIAB1%'; -- DIAB1 appears at the beginning
