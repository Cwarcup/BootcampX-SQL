SELECT (
  SELECT count(assignments)
  FROM assignments
)-count(assignment_submissions) as total_incomplete
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';



-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

-- SELECT name, gdp
-- FROM world
-- WHERE continent = 'Europe' AND gdp/population > (
--   SELECT gdp/population
--   FROM world
--   WHERE name = 'United Kingdom'
-- );

-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country

-- SELECT name, continent 
-- FROM world
-- WHERE continent IN (
--   SELECT continent
--   FROM world
--   WHERE name IN ('Argentina', 'Australia')
-- );
-- ORDER BY name;


-- Which country has a population that is more than United Kingom but less than Germany? Show the name and the population.

-- SELECT name, population
-- FROM world
-- WHERE population > (
--   SELECT population
--   FROM world
--   WHERE name = 'United Kingdom'

-- ) AND population < (
--   SELECT population
--   FROM world
--   WHERE name = 'Germany'
-- );

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

-- SELECT name,
-- CONCAT(
--   CONVERT(decimal,100*population/
--           (SELECT population FROM world WHERE name = 'Germany'))
--   ,'%')
-- FROM world
-- WHERE continent = 'Europe';

-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

-- SELECT name
-- FROM world
-- WHERE gdp > (
--   SELECT MAX(gdp)
--   FROM world
--   WHERE continent = 'Europe'
-- );