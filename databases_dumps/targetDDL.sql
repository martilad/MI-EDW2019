
CREATE TABLE "public".activity_type(
  activity VARCHAR(256)
);

CREATE TABLE "public".exercise(
  exercise VARCHAR(256)
);

CREATE TABLE "public".student(
  student_bk BIGSERIAL
, version INTEGER
, from_date TIMESTAMP
, to_date TIMESTAMP
, id INTEGER
, last_update  TIMESTAMP
, last_name TEXT
, first_name TEXT
);

CREATE INDEX idx_student_lookup ON "public".student(id);
CREATE INDEX idx_student_tk ON "public".student(student_bk);

CREATE TABLE "public".behaviour_entry(
  session_id BIGINT
, student_id BIGINT
, exercise VARCHAR(256)
, activity VARCHAR(256)
, start_time  TIMESTAMP
, end_time  TIMESTAMP
, idle_time BIGINT
, mouse_wheel BIGINT
, mouse_wheel_click BIGINT
, mouse_click_left BIGINT
, mouse_click_right BIGINT
, mouse_movement BIGINT
, keystroke BIGINT
);

CREATE TABLE "public".attendance(
  student_id INTEGER
, session_id INTEGER
, present INTEGER
);

CREATE TABLE "public".session_grade(
  student_id INTEGER
, session_id INTEGER
, points DOUBLE PRECISION
);

CREATE TABLE "public".final_exercise_points(
  student_id INTEGER
, total DOUBLE PRECISION
, attempt INTEGER
, final_exercise_exercise_name VARCHAR(5)
, points DOUBLE PRECISION
);

CREATE TABLE "public".session(
  session_id INTEGER
);

CREATE TABLE "public".final_exercise(
  exercise_name VARCHAR(256)
);
