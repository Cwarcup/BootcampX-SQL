-- Perform the same query as before, but include the number of assistances as well.

SELECT
teachers.name as teacher,
cohorts.name as cohort,
COUNT(assistance_requests) as total_assistances 
FROM teachers
JOIN assistance_requests on teacher_id=teachers.id
JOIN students on students.id=student_id
JOIN cohorts on cohort_id=cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;


-- Expected Result:

--       teacher       | cohort | total_assistances 
-- --------------------+--------+-------------------
--  Cheyanne Powlowski | JUL02  |               336
--  Georgiana Fahey    | JUL02  |               158
--  Helmer Rodriguez   | JUL02  |               157
--  Jadyn Bosco        | JUL02  |               177
-- ...
-- (8 rows)