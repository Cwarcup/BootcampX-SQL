-- Get the student's name, student's start_date, cohort's name, and cohort's start_date.
--Alias the column names to be more descriptive.
--Order by the start date of the cohort.

SELECT students.name as student_name, 
students.start_date as student_start_date,
cohorts.name as cohort_name,
cohorts.start_date as cohort_start_date
FROM students
JOIN cohorts ON cohorts.id = students.cohort_id
WHERE students.start_date != cohorts.start_date
ORDER BY cohort_start_date