  ---SUBQUERIES


---Find the salary of the highest-paid employee.
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY)
FROM EMPLOYEES) 


---Get the first name and last name of the employee who was hired most recently.
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES
WHERE HIRE_DATE = (SELECT MAX(HIRE_DATE) 
FROM EMPLOYEES)


---Get the total salary of employees working in the "IT" department.
SELECT SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT')


---Find the employee who earns less than the average salary in the company.
SELECT FIRST_NAME,LAST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY< (SELECT AVG(SALARY) FROM EMPLOYEES)


---Get the project name with the earliest start date.
SELECT PROJECT_NAME FROM PROJECTS
WHERE START_DATE = (SELECT MIN(START_DATE) FROM PROJECTS)



---Get the total number of employees in the "Finance" department.
SELECT COUNT(*) FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'FINANCE')


---Get the name of the department that has the employee with the highest salary.
SELECT DEPARTMENT_NAME FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES))




---List all employees who belong to the 'IT' department using a subquery
--    (instead of a JOIN).
SELECT DEPARTMENT_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT' )



---Find all projects managed by the 'Marketing' department using a subquery.
SELECT PROJECT_NAME,DEPARTMENT_ID FROM PROJECTS
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'MARKETING' )



--- Find all employees whose salary is equal to the minimum salary in the company.
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES)


---Retrieve all employees who were hired BEFORE the employee with
--    employee_id = 1 (John Doe).
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE <
(SELECT HIRE_DATE FROM EMPLOYEES
WHERE EMPLOYEE_ID = 1)


---Find all employees who earn more than 'John Doe' (employee_id = 1).
SELECT * FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES
WHERE EMPLOYEE_ID=1)


--- List all projects that start AFTER the end date of project 101
--    ('Employee Portal').
SELECT * FROM PROJECTS
WHERE START_DATE>
(SELECT END_DATE  FROM PROJECTS
WHERE PROJECT_NAME = 'EMPLOYEE PORTAL')


 ---List all projects assigned to departments that have a valid (non-null)
--    department name.
SELECT * FROM PROJECTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME IS NOT NULL)

---Find all employees who were hired in the same year as 'Jane Smith'
--    (employee_id = 2).
SELECT * FROM EMPLOYEES
WHERE YEAR(HIRE_DATE)= (SELECT YEAR(HIRE_DATE) FROM EMPLOYEES
WHERE EMPLOYEE_ID=2)


--- Retrieve all projects starting in 2024 that belong to departments
--    with at least one employee earning over $85,000.
SELECT * FROM PROJECTS
WHERE START_DATE > '2024.01.01' AND START_DATE<='2025.01.01'
AND DEPARTMENT_ID IN
( SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY >85000)


---Find all employees who work in either the 'HR' or 'Finance' departments
--     using a subquery with IN.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS
WHERE DEPARTMENT_NAME= 'HR' OR DEPARTMENT_NAME = 'FINANCE')


--- Find all projects whose duration (end_date - start_date) is longer
--     than the duration of project 104 ('Training Program').
SELECT * FROM PROJECTS
WHERE CAST(END_DATE AS DATETIME)- CAST(START_DATE AS DATETIME)>
(SELECT CAST(END_DATE AS DATETIME)- CAST(START_DATE AS DATETIME) FROM PROJECTS
WHERE PROJECT_ID = 104)


---List all employees who work in departments that have more than
--     10 projects assigned to them.
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IN 
(SELECT DEPARTMENT_ID FROM PROJECTS
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>10)

--- Find the employee(s) hired on the earliest (oldest) hire date in the company.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE = (SELECT MIN(HIRE_DATE) FROM EMPLOYEES)


---Find all employees whose salary matches any salary earned by an
--     employee in department_id = 4 ('Marketing'). 
SELECT * FROM EMPLOYEES
WHERE SALARY IN(
SELECT SALARY FROM EMPLOYEES
WHERE DEPARTMENT_ID<>4)

---Find all projects that belong to the same department as the highest-paid employee.
SELECT * FROM PROJECTS
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES))

---Retrieve departments with more than 11 employees.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>11)

---Retrieve employees who work on more than 2 projects
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(
SELECT DEPARTMENT_ID FROM PROJECTS
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)>2)



---Retrieve departments with total salaries greater than $200,000
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING SUM(SALARY)>200000)


---Retrieve departments with an average salary less than $90,000.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID IN
(SELECT DEPARTMENT_ID FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY)<90000)

---Calculate and list the total number of employees working in 
---each department by combining an Inner Join between departments and employees with GROUP BY and COUNT.
SELECT COUNT(*) FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY E.DEPARTMENT_ID



---List employee details and use a CASE WHEN conditional statement to categorize each employee's salary into
---'High Salary' (>75,000), 'Medium Salary' (50,000 to 75,000), or 'Low Salary', joined with departments.
SELECT E.* ,D.DEPARTMENT_NAME,
CASE WHEN E.SALARY >75000 THEN 'HIGH SALARY'
     WHEN E.SALARY BETWEEN 50000 AND 75000 THEN 'MEDIUM SALARY'
     ELSE 'LOW SALARY'
END
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID= E.DEPARTMENT_ID


---Retrieve distinct employee full names and department names using a Left Join,
---filtered exclusively for employees who were hired after January 1, 2022.
SELECT E.FIRST_NAME, E.LAST_NAME,E.HIRE_DATE, D.DEPARTMENT_NAME FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE HIRE_DATE >'2022.01.01'


---Calculate the total salary expense per department
---Use an Inner Join to count how many employees fall into different salary tiers
---(> 70000, BETWEEN 50000 AND 70000, and < 50000 or null)


SELECT D.DEPARTMENT_NAME,
SUM(E.SALARY), 
SUM(CASE WHEN E.SALARY>70000 THEN 1 ELSE 0 END ) AS 'HIGH COUNT',
SUM(CASE WHEN E.SALARY BETWEEN 50000 AND 70000 THEN 1 ELSE 0 END) AS 'MEDIUM COUNT',
SUM(CASE WHEN E.SALARY<50000 OR E.SALARY IS NULL THEN 1 ELSE 0 END) AS 'LOW COUNT'
FROM DEPARTMENTS D
INNER JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME


---List distinct employee names and department names using a Left Join, sorted alphabetically first by department name
---and then by the employee's last name.
SELECT DISTINCT 
E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_NAME, E.LAST_NAME


---find employees that have no department assigned
---retrieve employees and project details where the employee's last name starts with 'M' 
---and the project name does not contain the word 'Integration'

SELECT E.FIRST_NAME,E.LAST_NAME,P.PROJECT_ID,P.PROJECT_NAME,P.START_DATE,P.END_DATE
FROM EMPLOYEES E
LEFT JOIN PROJECTS P
ON E.DEPARTMENT_ID=P.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE 'M%' AND P.PROJECT_NAME NOT LIKE '%INTERGRATION'



---list employees and their department names where the employee's last name contains the letter 'a' 
---anywhere inside it, and the department name is not 'Finance'
SELECT E.FIRST_NAME, E.LAST_NAME,D.DEPARTMENT_NAME
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE E.LAST_NAME LIKE '%A%' AND D.DEPARTMENT_NAME NOT LIKE '%FINANCE%'




---Get the total number of employees in the "Finance" department.
SELECT COUNT(*) FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME = 'FINANCE')
