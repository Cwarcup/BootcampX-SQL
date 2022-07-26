-- SELECT students.name as student_name,
-- email, 
-- cohorts.name as cohort_name
-- FROM students 
-- OUTER JOIN cohorts ON cohorts.id = cohort_id;

-- ERROR:  syntax error at or near "OUTER"
-- NEED to specify which type of outer join to use

SELECT students.name as student_name, email, cohorts.name as cohort_name
FROM students RIGHT OUTER JOIN cohorts ON cohorts.id = cohort_id
LIMIT 10;