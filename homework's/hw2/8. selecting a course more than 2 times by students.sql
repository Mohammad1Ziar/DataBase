SELECT t.ID, t.course_id, COUNT(*) AS num_of_courses
FROM takes t
GROUP BY t.ID, t.course_id
HAVING COUNT(*) >= 2;
