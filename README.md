Each query will be written in it's own `.sql` file.

Before starting a new exercise, create a new directory that all of the query files can be stored in.

Because each query will be inside its own file, we can write all of the `SQL` code in our text editor.

We will then execute the query against our database using `\i filename.sql` from within our `psql` session.

## Tables

```sql
CREATE TABLE cohorts (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date DATE,
  end_date DATE
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255),
  phone VARCHAR(32),
  github VARCHAR(255),
  start_date DATE,
  end_date DATE,
  cohort_id INTEGER REFERENCES cohorts(id) ON DELETE CASCADE
);

CREATE TABLE assignments (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  content TEXT,
  day INTEGER,
  chapter INTEGER,
  duration INTEGER
);

CREATE TABLE assignment_submissions (
  id SERIAL PRIMARY KEY NOT NULL,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  duration INTEGER,
  submission_date DATE
);

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  start_date DATE,
  end_date DATE
);

CREATE TABLE assistance_requests (
  id SERIAL PRIMARY KEY NOT NULL,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE CASCADE,
  assignment_id INTEGER REFERENCES assignments(id) ON DELETE CASCADE,
  created_at TIMESTAMP,
  started_at TIMESTAMP,
  completed_at TIMESTAMP,
  student_feedback TEXT,
  teacher_feedback TEXT
);
```
![erd](https://i.imgur.com/ReIYHPC.png)


- cohort
  - id: A unique identifier
  - name: The name of the cohort
  - start_date: The cohorts' start date
  - end_date: The cohorts' end date

- student
  - id: A unique identifier
  - name: The full name of the student
  - email: The students' email address
  - phone: The students' phone number
  - github: The students' github profile url
  - start_date: The students' start date of the Bootcamp
  - end_date: The students' end date of the Bootcamp
  - cohort_id: The id of the cohort that the student is enrolled in

- assignment_submission 
  - id: A unique identifier
  - assignment_id: The id of the assignment
  - student_id: The id of the student
  - duration: The time it took the student to complete the assignment
  - submission_date: The date is was submitted

- assignment
  - id: A unique identifier
  - name: The name of the assignment
  - content: The written content body of the assignment
  - day: The day that the assignment appears on
  - chapter: The order that the assignment will appear in the day.
  - duration: The average time it takes a student to finish

- A teacher
  - id: A unique identifier
  - name: The name of the teacher
  - start_date: The date that the teacher started working.
  - end_date: The date that the teacher stopped working.
  - is_active: If the teacher is actively teaching right now.

- assistance_request 
  - id: A unique identifier
  - assignment_id: The id of the assignment the request was made from
  - student_id: The id of the student making the request
  - teacher_id: The id of the teacher responding to the request
  - created_at: The timestamp when the request was made
  - started_at: The timestamp when the assistance started
  - completed_at: The timestamp when the assistance was completed
  - student_feedback: Feedback about the student given by the teacher
  - teacher_feedback: Feedback about the teacher given by the student

