const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const queryLimit = process.argv[3] || 5;

pool.query(`
SELECT
  DISTINCT teachers.name as teacher,
  cohorts.name as cohort
FROM
  teachers
  JOIN assistance_requests on teacher_id = teachers.id
  JOIN students on students.id = student_id
  JOIN cohorts on cohort_id = cohorts.id
WHERE
  cohorts.name = $1
ORDER BY
  teachers.name;
  `, [cohortName])
  .then(res => {
    res.rows.forEach((item) => {
      console.log(`${item.cohort}: ${item.teacher}`);
    }
    );
  })
  .catch(err => console.error('query error', err.stack))
  .then(() => pool.end());