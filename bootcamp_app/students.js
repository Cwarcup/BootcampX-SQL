const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortName = process.argv[2];
const queryLimit = process.argv[3] || 5;
const values = [cohortName, queryLimit];
const queryString = `
  SELECT students.id as student_id, students.name as name, cohorts.name as cohort
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  WHERE cohorts.name LIKE $1
  LIMIT $2;
  `;

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(item => {
      console.log(`${item.name} has an id of ${item.student_id} and was in the ${item.cohort} cohort`);

    }
    );
  })
  .catch(err => console.error('query error', err.stack))
  .then(() => pool.end());