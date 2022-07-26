-- calculate the total number of assignment_submissions for each student individually, and output the totals next to the student's name?

SELECT students.name as student, 
count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100;



--      student      | total_submissions 
-- ------------------+-------------------
--  Javonte Ward     |                84
--  Hettie Hettinger |                75
-- (2 rows)
