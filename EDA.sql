SELECT * FROM student_depression


-- Exploratory Data Analysis

--Average measures by city
SELECT 
	city,
	number_of_students,
	CGPA,
	ROUND(AVG(cgpa) OVER(),2) as total_average,
	academic_pressure, 
	ROUND(AVG(academic_pressure) OVER(),2) as average_total_acpres,
	study_satisfaction,
	ROUND(AVG(study_satisfaction) OVER(),2) as total_average_satisfaction,
	hours_of_study_or_work,
	ROUND(AVG(hours_of_study_or_work) OVER(),2) as total_average_hours,
	financial_stress,
	ROUND(AVG(financial_stress) OVER(),2) as total_financial_stress,
	percentage_of_depressed_people,
	ROUND(AVG(percentage_of_depressed_people) OVER(),2) as total_depress_people_percentage
FROM (	
	SELECT
	city,
	COUNT(*) as number_of_students,
	ROUND(AVG(cgpa),2) as CGPA,
	ROUND(AVG(academic_pressure),2) as academic_pressure, 
	ROUND(AVG(study_satisfaction),2) as study_satisfaction,
	ROUND(AVG(work_of_study_hours),2) as hours_of_study_or_work,
	ROUND(AVG(financial_stress),2) as financial_stress,
	ROUND(COUNT(*) FILTER (WHERE depression = 1) * 100.00 / 
		COUNT(*),2) as percentage_of_depressed_people
	FROM student_depression
	GROUP BY city) as s1
ORDER BY financial_stress 
--The top big city (1000+ students) is Hyderabad with CGPA 7.9. 
	--Hydebarad have study satisfaction less than average
--The most academic pressure cities are Delhi, Rajkot, Chennai. 
	--Delhi and Rajkot have study satisfaction more than average
	--Delhi has CGPA less than average (7.48)
-- Varanasi is the most hard-working city.
-- Cities where people work less hours than average are less depressive. Pretty strong correlation between these columns. 
-- The most financial stressfull city is Patna

--Average CGPA by sleep_duration
SELECT 
	sleep_duration,
	number_of_students,
	CGPA,
	ROUND(AVG(cgpa) OVER(),2) as total_average,
	academic_pressure, 
	ROUND(AVG(academic_pressure) OVER(),2) as average_total_acpres,
	study_satisfaction,
	ROUND(AVG(study_satisfaction) OVER(),2) as total_average_satisfaction,
	hours_of_study_or_work,
	ROUND(AVG(hours_of_study_or_work) OVER(),2) as total_average_hours,
	financial_stress,
	ROUND(AVG(financial_stress) OVER(),2) as total_financial_stress,
	percentage_of_depressed_people,
	ROUND(AVG(percentage_of_depressed_people) OVER(),2) as total_depress_people_percentage
FROM (	
	SELECT
	sleep_duration,
	COUNT(*) as number_of_students,
	ROUND(AVG(cgpa),2) as CGPA,
	ROUND(AVG(academic_pressure),2) as academic_pressure, 
	ROUND(AVG(study_satisfaction),2) as study_satisfaction,
	ROUND(AVG(work_of_study_hours),2) as hours_of_study_or_work,
	ROUND(AVG(financial_stress),2) as financial_stress,
	ROUND(COUNT(*) FILTER (WHERE depression = 1) * 100.00 / 
		COUNT(*),2) as percentage_of_depressed_people
	FROM student_depression
	GROUP BY sleep_duration) as s1
ORDER BY number_of_students 
-- Most people sleep less than 5 hours (8302 students)
-- People who sleep more than 8 hours and less than 5 hours have CGPA less than average. 
-- People who sleep more than 8 hours working much less than other groups
-- People who sleep more than 8 hours are not as depressive as other groups
-- People who sleep less than 5 hours are more depressive than other groups



--Average CGPA by dietary habits
SELECT 
	dietary_habits,
	number_of_students,
	CGPA,
	ROUND(AVG(cgpa) OVER(),2) as total_average,
	academic_pressure, 
	ROUND(AVG(academic_pressure) OVER(),2) as average_total_acpres,
	study_satisfaction,
	ROUND(AVG(study_satisfaction) OVER(),2) as total_average_satisfaction,
	hours_of_study_or_work,
	ROUND(AVG(hours_of_study_or_work) OVER(),2) as total_average_hours,
	financial_stress,
	ROUND(AVG(financial_stress) OVER(),2) as total_financial_stress,
	percentage_of_depressed_people,
	ROUND(AVG(percentage_of_depressed_people) OVER(),2) as total_depress_people_percentage
FROM (	
	SELECT
	dietary_habits,	
	COUNT(*) as number_of_students,
	ROUND(AVG(cgpa),2) as CGPA,
	ROUND(AVG(academic_pressure),2) as academic_pressure, 
	ROUND(AVG(study_satisfaction),2) as study_satisfaction,
	ROUND(AVG(work_of_study_hours),2) as hours_of_study_or_work,
	ROUND(AVG(financial_stress),2) as financial_stress,
	ROUND(COUNT(*) FILTER (WHERE depression = 1) * 100.00 / 
		COUNT(*),2) as percentage_of_depressed_people
	FROM student_depression
	GROUP BY dietary_habits) as s1
ORDER BY number_of_students 
--Dietary habits does not affect the CGPA
--The most people have unhealthy dietary habits (10303 students)
--Interesting. People with unhealthy dietary habits have academic_pressure much more than average and other groups.
--People with unhealthy dietary habits have big financial stress.
--People with unhealth dietary habits are much more depressed than others.

--Average CGPA by degree
SELECT degree, AVG(cgpa) average_cgpa, COUNT(*) as number_of_people
FROM student_depression
GROUP BY degree
ORDER BY average_cgpa DESC 
--A Bachelor of Education (B. Ed.) is the almost succesfull group. With such amount of people (1863) they top 3 CGPA (7.85)
--MA degree is top 1 with 544 students and 8.02 average CGPA
--Master of Science is the least succesfull big group(1000+ people). Having 1188 students, their average CGPA is 7.51,
--The least average CGPA have ME (Master of Engineering) group. 7.26 CGPA with 185 students.
--The most students choose class 12 (6075 people) with 7.59 Average CGPA


--Average measures by age group
SELECT 
	CASE WHEN age >= 20 AND age <= 29 THEN '20 to 29 years'
	WHEN age > 29 AND age <= 39 THEN '30 to 39 years'
	WHEN age > 40 THEN '40 and above'
	ELSE 'Under 20'
	END as age_group,
	COUNT(*) as number_of_students,
	ROUND(AVG(cgpa),2) as CGPA,
	ROUND(AVG(academic_pressure),2) as academic_pressure, 
	ROUND(AVG(study_satisfaction),2) as study_satisfaction,
	ROUND(AVG(work_of_study_hours),2) as hours_of_study_or_work,
	ROUND(AVG(financial_stress),2) as financial_stress,
	ROUND(COUNT(*) FILTER (WHERE depression = 1) * 100.00 / 
		COUNT(*),2) as percentage_of_depressed_people
	
FROM student_depression
GROUP BY age_group
ORDER BY number_of_students DESC
--3146 people under 20 are the most satisfied of their study, having 3.13 score.
--Altought they have highest study satisfaction score, they also have highest percentage of depressed people. Need to expect that more in detail.
--People under 20 also have the highest academic pressure and highest amount of work/study-time
--People 30 to 39 have the least academic pressure and financial stress.
