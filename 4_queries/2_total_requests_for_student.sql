-- Get the total number of assistance_requests for a student.
-- Select the student's name and the total assistance requests.
-- Since this query needs to work with any specific student name, use 'Elliot Dickinson' for the student's name here.

SELECT count(students.*) as total_assistances, students.name
FROM students
JOIN assistance_requests
ON assistance_requests.student_id = students.id
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;