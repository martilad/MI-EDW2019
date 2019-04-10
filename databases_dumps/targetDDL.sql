CREATE TABLE "public".activity_type
(
  activity VARCHAR(256)
)
;
CREATE TABLE "public".exercise
(
  exercise VARCHAR(256)
)
;

CREATE TABLE "public".student
(
  student_bk BIGSERIAL
, version INTEGER
, from_date TIMESTAMP
, to_date TIMESTAMP
, id INTEGER
, last_update  TIMESTAMP
, last_name TEXT
, first_name TEXT
)
;CREATE INDEX idx_student_lookup ON "public".student(id)
;
CREATE INDEX idx_student_tk ON "public".student(student_bk)
;
