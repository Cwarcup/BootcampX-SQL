-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.

-- Select the name of the student, their average completion time, and the average suggested completion time.
-- Order by average completion time from smallest to largest.
-- Only get currently enrolled students.
-- This will require data from students, assignment_submissions, and assignments.

SELECT students.name as student,
SUM(assignment_submissions.duration) / COUNT(assignment_submissions.duration) as average_assignment_duration,
SUM(assignments.duration) / COUNT(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignment_submissions.assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING SUM(assignment_submissions.duration) / COUNT(assignment_submissions.duration) < SUM(assignments.duration) / COUNT(assignments.duration)
ORDER BY average_assignment_duration ASC;

-- SELECT students.name as student, 
-- avg(assignment_submissions.duration) as average_assignment_duration, 
-- avg(assignments.duration) as average_estimated_duration
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- JOIN assignments ON assignments.id = assignment_id
-- WHERE end_date IS NULL
-- GROUP BY student
-- HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
-- ORDER BY average_assignment_duration;

--     student     | average_assignment_duration | average_estimated_duration 
-- ----------------+-----------------------------+----------------------------
--  Cory Toy       |                          41 |                         53
--  Delores Gibson |                          41 |                         53
--  Nola Jerde     |                          42 |                         54
--  Florida Turner |                          42 |                         54
-- (4 rows)