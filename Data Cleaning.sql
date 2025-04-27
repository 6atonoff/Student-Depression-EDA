SELECT * FROM student_depression

SELECT DISTINCT city FROM student_depression

--Cleaning the city column
DELETE FROM student_depression
WHERE city IN ('ME', '''Less Delhi''', 'M.Tech', 'City', '3', 'M.Com', '''Less than 5 Kalyan''')


SELECT DISTINCT profession FROM student_depression
--Problem with quotes in rows is found

--Changing the names of profession rows 
UPDATE student_depression
SET profession = 'UX/UI Designer'
WHERE profession = '''UX/UI Designer'''

UPDATE student_depression
SET profession = 'Educational Consultant'
WHERE profession = '''Educational Consultant'''

UPDATE student_depression
SET profession = 'Digital Marketer'
WHERE profession = '''Digital Marketer'''

UPDATE student_depression
SET profession = 'Civil Engineer'
WHERE profession = '''Civil Engineer'''

UPDATE student_depression
SET profession = 'Content Writer'
WHERE profession = '''Content Writer'''

------
SELECT DISTINCT sleep_duration
FROM student_depression
--Problem with quotes found here to. Might be fixed in Excel before loading data in SQL, so i`ll do it now

UPDATE student_depression
SET sleep_duration = '5-6 hours'
WHERE sleep_duration = '''5-6 hours'''

----

SELECT DISTINCT degree
FROM student_depression
-- the same problem with quotes but only with 'Class 12 '

UPDATE student_depression
SET degree = 'Class 12'
WHERE degree = '''Class 12'''
----