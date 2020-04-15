.read fa19data.sql

CREATE TABLE obedience AS
  SELECT seven, instructor from students;

CREATE TABLE smallest_int AS
  SELECT time, smallest from students WHERE smallest>2 ORDER BY smallest LIMIT 20;

CREATE TABLE matchmaker AS
  SELECT p1.pet, p1.song, p1.color, p2.color FROM students AS p1, students AS p2 WHERE p1.time<p2.time AND p1.pet=p2.pet AND p1.song=p2.song LIMIT 10;

