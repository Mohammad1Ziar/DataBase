SELECT i.ID AS instructor_id, i.name AS instructor_name, c.title AS course_title
FROM teaches t
JOIN instructor i ON t.ID = i.ID
JOIN course c ON t.course_id = c.course_id
WHERE t.semester = 'Fall' AND t.year = 2003;


