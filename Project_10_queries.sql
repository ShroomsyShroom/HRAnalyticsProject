CREATE TABLE hrdata
(
	emp_no INT PRIMARY KEY,
	gender VARCHAR(50) NOT NULL,
	marital_status VARCHAR(50),
	age_band VARCHAR(50),
	age	INT,
	department VARCHAR(50),
	education VARCHAR(50),
	education_field	VARCHAR(50),
	job_role VARCHAR(50),
	business_travel VARCHAR(50),
	employee_count INT,
	attrition VARCHAR(50),
	attrition_label	VARCHAR(50),
	job_satisfaction INT,
	active_employee INT
)

SELECT * FROM hrdata;

SELECT SUM(employee_count) FROM hrdata;

SELECT SUM(employee_count) FROM hrdata
WHERE education ILIKE '%High School%';

SELECT SUM(employee_count) FROM hrdata
WHERE department ILIKE '%Sales%';

SELECT SUM(employee_count) FROM hrdata
WHERE education_field ILIKE '%Medical%';

SELECT COUNT(attrition) FROM hrdata AS Total_Attriton_of_Emp_with_Doctoral_Degree
WHERE 
	attrition ILIKE '%Yes%' 
	AND 
	education ILIKE '%Doctoral Degree%';

SELECT COUNT(attrition) FROM hrdata AS Attrition_in_Sales
WHERE 
	attrition ILIKE '%Yes%' 
	AND 
	department ILIKE '%Sales%'
	AND
	education_field ILIKE '%Medical%'
	AND
	education ILIKE '%High School%';

SELECT 
	COUNT(
		CASE 
			WHEN 
				attrition ILIKE '%Yes%'
				AND 
				education ILIKE '%Doctoral Degree%'
			THEN 1
		END
		) AS total_attrition_of_emp_with_doctoral_degree
FROM hrdata;

SELECT 
	ROUND(((SELECT COUNT(attrition)
	 FROM hrdata
	 WHERE attrition ILIKE '%Yes%')::numeric/SUM(employee_count)*100),2) AS attrition_rate
FROM hrdata;

SELECT 
	(SUM(CASE WHEN attrition ILIKE '%Yes%' THEN 1 ELSE 0 END)::NUMERIC
	/
	SUM(employee_count))*100 AS Attrition_rate
FROM hrdata;

WITH attrition_rate_cte
AS (
	SELECT 
		SUM(CASE WHEN attrition ILIKE '%Yes%' THEN 1 ELSE 0 END) AS attrition_yes,
		SUM(employee_count) AS total_emp
	FROM hrdata
	)
SELECT attrition_yes::NUMERIC/total_emp AS attrition_rate
FROM attrition_rate_cte;

SELECT 
	ROUND(((SELECT COUNT(attrition)
	 FROM hrdata
	 WHERE attrition ILIKE '%Yes%' AND department ILIKE '%Sales%')::numeric/SUM(employee_count)*100),2) AS attrition_rate
FROM hrdata
WHERE department ILIKE '%sales%';

SELECT 
	(SUM(employee_count) - (SELECT COUNT(*) FROM hrdata WHERE attrition ILIKE '%Yes%')) AS Active_employees
FROM hrdata;

SELECT 
	SUM(employee_count) - (SELECT COUNT(attrition) FROM hrdata WHERE attrition ILIKE '%Yes%' AND gender ILIKE 'Male') AS active_emp
FROM hrdata
WHERE gender ILIKE 'Male';

SELECT ROUND(AVG(age),0) AS Average_age
FROM hrdata;

SELECT 
	gender, COUNT(attrition) AS Attrition_by_gender
FROM hrdata
WHERE attrition ILIKE '%Yes%'
GROUP BY 1
ORDER BY 2 DESC; 

SELECT 
	gender, COUNT(attrition) AS Attrition_by_gender
FROM hrdata
WHERE 
	attrition ILIKE '%Yes%'
	AND
	education ILIKE '%High School%'
GROUP BY 1
ORDER BY 2 DESC; 

SELECT 
	department, 
	gender,
	COUNT(attrition) AS Attrition_by_dept,
	ROUND((COUNT(attrition)::NUMERIC/(SELECT COUNT(attrition) FROM hrdata WHERE attrition ILIKE '%Yes%' AND gender ILIKE 'FEMALE')*100),2) AS Dept_attrition_rate
FROM hrdata
WHERE 
	attrition ILIKE '%Yes%' AND gender ILIKE 'FEMALE'
GROUP BY 1,2
ORDER BY 3 DESC; 

SELECT 
	age_band,
	SUM(employee_count)
FROM hrdata
WHERE department ILIKE 'HR'
GROUP BY 1
ORDER BY 2;

SELECT 
	education_field,
	COUNT(attrition) AS attrition_by_edu_field
FROM hrdata
WHERE attrition ILIKE 'YES'
GROUP BY 1
ORDER BY 2 DESC;

SELECT 
	age_band,
	gender,
	COUNT(attrition) AS attrition_by_gender_and_age
FROM hrdata
WHERE attrition ILIKE 'Yes'
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT 
	age_band,
	gender,
	COUNT(attrition) AS attrition,
	ROUND(
		  (COUNT(attrition)::NUMERIC/(SELECT SUM(employee_count) FROM hrdata WHERE attrition ILIKE 'YES')::NUMERIC)*100 
		  ,2) AS attrition_rate
FROM hrdata
WHERE attrition ILIKE 'Yes'
GROUP BY 1, 2
ORDER BY 3 DESC;

SELECT 
	job_role,
	SUM(CASE WHEN job_satisfaction = 1 THEN employee_count ELSE 0 END) AS one,
	SUM(CASE WHEN job_satisfaction = 2 THEN employee_count ELSE 0 END) AS two,
	SUM(CASE WHEN job_satisfaction = 3 THEN employee_count ELSE 0 END) AS three,
	SUM(CASE WHEN job_satisfaction = 4 THEN employee_count ELSE 0 END) AS four
FROM hrdata
GROUP BY 1
ORDER BY 1;

