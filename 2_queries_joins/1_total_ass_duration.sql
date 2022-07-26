-- Get the total amount of time that a student has spent on all assignments.
-- use 'Ibrahim Schimmel' for now

SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students 
ON student_id = students.id
WHERE students.name = 'Ibrahim Schimmel';