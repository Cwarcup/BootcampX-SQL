-- The same query as before
-- but only return rows where total assignments is greater than or equal to 10.

SELECT day, COUNT(*) as total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day;


--  day | total_assignments 
-- -----+-------------------
--    1 |                11
--    9 |                12
--   22 |                10
--   23 |                10
--   24 |                10
--   29 |                10
--   30 |                11
--   36 |                10
--   37 |                10
--   39 |                10
--   43 |                10
--   44 |                11
--   45 |                10
--   46 |                11
--   51 |                12
-- (15 rows)