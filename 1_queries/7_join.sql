-- joining two tables

SELECT students.name as student_name,
email,
cohorts.name as cohort_name
FROM students 
JOIN cohorts ON students.cohort_id = cohorts.id;