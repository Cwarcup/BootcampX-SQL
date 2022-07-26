-- Get currently enrolled students' average assignment completion time.

-- Select the students name and average time from assignment submissions.
-- Order the results from greatest duration to least greatest duration.
-- A student will have a null end_date if they are currently enrolled

SELECT students.name as student,
SUM(assignment_submissions.duration) / COUNT(assignment_submissions.duration) as average_assignment_duration
FROM students
JOIN assignment_submissions
ON student_id = students.id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignment_duration DESC;


--        student       | average_assignment_duration 
-- ---------------------+-----------------------------
--  Hettie Hettinger    |                         140
--  Santino Oberbrunner |                         139
--  Vance Kihn          |                         100
--  Jerrold Rohan       |                          99
--  Vivienne Larson     |                          96
--  Sean Bartell        |                          94
--  Fannie Hammes       |                          94
--  Bertha Johnson      |                          93
--  Javonte Ward        |                          93
--  Bart Leuschke       |                          93
--  Ike Lockman         |                          92
--  Billie Mitchell     |                          91
--  Marisa Rau          |                          91
--  Eunice Morar        |                          90