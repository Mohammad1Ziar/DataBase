SELECT c.title
FROM course c
JOIN department d ON c.dept_name = d.dept_name
WHERE d.dept_name LIKE '%Eng%'
AND d.dept_name != 'Elec.Eng.';
