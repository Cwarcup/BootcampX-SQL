-- Get the name of all teachers that performed an assistance request during a cohort.

-- Select the instructor's name and the cohort's name.
-- Don't repeat the instructor's name in the results list.
-- Order by the instructor's name.
-- This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.

SELECT DISTINCT
teachers.name as teacher,
cohorts.name as cohort
FROM teachers
JOIN assistance_requests on teacher_id=teachers.id
JOIN students on students.id=student_id
JOIN cohorts on cohort_id=cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teachers.name;


-- Expected Result:

--       teacher       | cohort 
-- --------------------+--------
--  Cheyanne Powlowski | JUL02
--  Georgiana Fahey    | JUL02
--  Helmer Rodriguez   | JUL02
--  Jadyn Bosco        | JUL02
-- ...
-- (8 rows)