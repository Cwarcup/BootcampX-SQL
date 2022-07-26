-- Calculate the average total duration of assistance requests for each cohort.

-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration

SELECT AVG(total_duration) as average_total_duration 
FROM (
  SELECT cohorts.name as cohort,
  SUM(completed_at - started_at) as total_duration
  FROM assistance_requests
  JOIN students ON student_id=students.id
  JOIN cohorts ON cohort_id=cohorts.id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;


-- Expected Result:

--  average_total_duration 
-- ------------------------
--  555:22:25.909091
-- (1 row)