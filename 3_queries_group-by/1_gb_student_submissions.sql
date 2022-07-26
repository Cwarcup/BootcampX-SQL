-- calculate the total number of assignment_submissions for each student individually, and output the totals next to the student's name?

SELECT students.name as student, 
count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name;

--        student       | total_submissions 
-- ---------------------+-------------------
--  Bart Leuschke       |               346
--  Javonte Ward        |                84
--  Santino Oberbrunner |               244
--  Brook Fadel         |               348
--  Aurore Yundt        |               347
--  Jacinthe Skiles     |               348
--  Nola Jerde          |               123