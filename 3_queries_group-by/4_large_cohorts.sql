-- Get all cohorts with 18 or more students.

-- Select the cohort name and the total students.
-- Order by total students from smallest to greatest.

SELECT cohorts.name as cohort_name,
COUNT(students.*) as student_count
FROM cohorts
JOIN students
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
HAVING COUNT(students.*) >= 18
ORDER BY student_count;

--  cohort_name | student_count 
-- -------------+---------------
--  FEB12       |            18
--  JUN04       |            19
--  APR09       |            19
--  SEP24       |            22
--  NOV19       |            22
-- (5 rows)