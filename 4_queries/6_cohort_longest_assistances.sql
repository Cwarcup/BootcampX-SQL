-- Get the cohort with the longest average duration of assistance requests.

-- The same requirements as the previous query, but only return the single row with the longest average.
-- Select the cohort's name and the average assistance request time.
-- Order the results from shortest average to longest.


SELECT cohorts.name,
avg(completed_at - started_at) as average_assistance_request_time
FROM assistance_requests
JOIN students ON students.id=assistance_requests.student_id
JOIN cohorts ON cohorts.id=students.cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_request_time DESC LIMIT 1;


--  name  | average_assistance_time 
-- -------+-------------------------
--  MAR12 | 00:15:44.556041
-- (1 row)