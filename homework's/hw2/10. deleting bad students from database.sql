SELECT DISTINCT ID INTO #StudentsToDelete
FROM takes
WHERE grade = 'C-';

DELETE FROM advisor
WHERE s_id IN (SELECT ID FROM #StudentsToDelete);

DELETE FROM takes
WHERE ID IN (SELECT ID FROM #StudentsToDelete);

DELETE FROM student
WHERE ID IN (SELECT ID FROM #StudentsToDelete);

DROP TABLE #StudentsToDelete;

select * from student;
