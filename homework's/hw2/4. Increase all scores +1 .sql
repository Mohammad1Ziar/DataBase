UPDATE takes
SET grade = CASE
    WHEN grade = 'A-' THEN 'A'
    WHEN grade = 'A' THEN 'A+'
    WHEN grade = 'B+' THEN 'A-'
    WHEN grade = 'B' THEN 'B+'
    WHEN grade = 'B-' THEN 'B'
    WHEN grade = 'C+' THEN 'B-'
    WHEN grade = 'C' THEN 'C+'
    WHEN grade = 'C-' THEN 'C'
    WHEN grade = 'D+' THEN 'C-'
    WHEN grade = 'D' THEN 'D+'
    WHEN grade = 'D-' THEN 'D'
    WHEN grade = 'F' THEN 'D-'
    ELSE grade
END;
