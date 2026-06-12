--- Creating Tables

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    age INT,
    gender VARCHAR(20),
    department_id INT,
    salary FLOAT,
    hire_date DATE,
    city VARCHAR(50),
    performance_rating INT
);
 
 CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_name VARCHAR(50)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

CREATE TABLE attrition (
    attrition_id INT PRIMARY KEY,
    employee_id INT,
    attrition_status VARCHAR(20),
    reason VARCHAR(100)
);

                        -----SQL Questions-----
--Q.1 Show all employee details 
 SELECT
	*
FROM
	EMPLOYEES;

--Q.2 Find employees with salary greater than 50,000
SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY > 50000;

--Q.3 Count total employees
SELECT
	COUNT(EMPLOYEE_ID) AS TOTAL_EMP
FROM
	EMPLOYEES;

--Q.4 Find average salary
SELECT
	AVG(SALARY) AS AVG_SAL
FROM
	EMPLOYEES;
--Q.5 Show employees from Lucknow
SELECT
	*
FROM
	EMPLOYEES
WHERE
	CITY = ' Lucknow';
	
--Q.6 Find highest salary employee
SELECT
	*
FROM
	EMPLOYEES
ORDER BY
	SALARY DESC
LIMIT
	1;
	
--Q.7 Find lowest salary employee
SELECT
	*
FROM
	EMPLOYEES
ORDER BY
	SALARY
LIMIT
	1;	
--Q.8 Count employees by gender
SELECT
	GENDER,
	COUNT(GENDER) AS TOL_EMP
FROM
	EMPLOYEES
GROUP BY
	GENDER;
	select * from employees
--Q.9 Show employees hired after 2021
SELECT
	*
FROM
	EMPLOYEES
WHERE
	HIRE_DATE > '2021-12-31';

--Q.10 Sort employees by salary descending
SELECT
	*
FROM
	EMPLOYEES
ORDER BY
	SALARY DESC;
--Q.11 Join employee and department table
SELECT e.employee_id,
       e.employee_name,
       d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

--Q.12 Find average salary by department
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--Q.13 Count employees in each department
SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name;

--Q.14 Find employees with performance rating 5
SELECT *
FROM employees
WHERE performance_rating = 5;

--Q.15 Find absent employees
SELECT e.employee_name,
       a.status
FROM employees e
JOIN attendance a
ON e.employee_id = a.employee_id
WHERE a.status = 'Absent';

--Q.16 Find employees earning above average salary

SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY > (
		SELECT
			AVG(SALARY)
		FROM
			EMPLOYEES
	);
 --Q.17 Show department with highest salary expense

SELECT
	department_name,sum(salary)as total_salary
FROM
	DEPARTMENTS AS DE
	JOIN EMPLOYEES AS EM ON DE.DEPARTMENT_ID = EM.DEPARTMENT_ID
	group by department_name
	order by total_salary desc
	limit 1;

--Q.18 Count employees city-wise
SELECT
	CITY,
	COUNT(EMPLOYEE_NAME)
FROM
	EMPLOYEES
GROUP BY
	CITY; 
--Q.19 Find total salary by department
select department_name, sum(salary) 
FROM
	DEPARTMENTS AS DE
	JOIN EMPLOYEES AS EM ON DE.DEPARTMENT_ID = EM.DEPARTMENT_ID
group by department_name

--Q.20 Show employee and manager name
SELECT
	EMPLOYEE_NAME,
	MANAGER_NAME
FROM
	EMPLOYEES AS EM
	JOIN DEPARTMENTS AS DE ON EM.DEPARTMENT_ID = DE.DEPARTMENT_ID

--Q.21 Employees earning more than department average salary
   SELECT e.employee_name,
       d.department_name,
       e.salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);


--Q.22 Highest paid employee in each department
SELECT
	EM.SALARY,
	DEPARTMENT_NAME,
	EMPLOYEE_NAME
FROM
	EMPLOYEES AS EM
	JOIN DEPARTMENTS AS DE ON EM.DEPARTMENT_ID = DE.DEPARTMENT_ID
WHERE
	EM.SALARY = (
		SELECT
			MAX(SALARY)
		FROM
			EMPLOYEES E2
		WHERE
			E2.DEPARTMENT_ID = EM.DEPARTMENT_ID
	);
--Q.23 Department-wise employee ranking based on salary
     SELECT e.employee_name,
       d.department_name,
       e.salary,
       RANK() OVER (
           PARTITION BY d.department_name
           ORDER BY e.salary DESC
       ) AS rank
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

--Q.24 Attrition rate analysis
    SELECT 
COUNT(CASE WHEN attrition_status = 'Left' THEN 1 END) * 100.0
/ COUNT(*) AS attrition_rate
FROM attrition;













5. Department with highest salary expense

--Q.21 Employees earning more than department avg salary	 




