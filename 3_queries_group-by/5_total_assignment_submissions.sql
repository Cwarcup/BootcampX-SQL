-- Get the total number of assignment submissions for each cohort.
-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

SELECT cohorts.name as cohort,
COUNT(assignment_submissions.*) as total_submissions
FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assignment_submissions 
ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;

--  cohort | total_submissions 
-- --------+-------------------
--  SEP24  |              9328
--  JUN04  |              8030
--  APR09  |              7935
--  NOV19  |              7231
--  JUL02  |              5868
--  MAY07  |              5843
--  FEB12  |              5440
--  JUL30  |              4664
--  OCT22  |              4626
--  AUG27  |              4589
--  MAR12  |              3002
-- (11 rows)