UPDATE department
SET budget = CASE
                WHEN dept_name = 'Math' THEN budget * 0.9  
                WHEN dept_name = 'History' THEN budget * 1.05
                ELSE budget
             END
WHERE dept_name IN ('Math', 'History');
