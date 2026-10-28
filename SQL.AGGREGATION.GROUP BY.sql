 --AGREEGATIONS KAI GROUP BY
 --- Find the total number of employees in each department.
 SELECT COUNT(*) AS TOTAL_NUMBER FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID



 ---Calculate the average salary per department
 SELECT AVG(SALARY) FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID


 ---Find the highest salary in each department.
 SELECT MAX(SALARY) FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID


 --- Count how many projects each department has. 
SELECT DEPARTMENT_ID, COUNT(*) AS TOTAL_NUMBER_OF_PROJECTS FROM PROJECTS
GROUP BY DEPARTMENT_ID

---. Show departments having an average salary greater than 75,000. 
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES
WHERE SALARY> 75000
GROUP BY DEPARTMENT_ID



--  Count employees who earn more than 75,000.
SELECT COUNT (*) FROM EMPLOYEES
WHERE SALARY >75000



--- . Find the average salary of employees in department 1 OR department 3.
SELECT AVG(SALARY) FROM EMPLOYEES
WHERE DEPARTMENT_ID=1 OR DEPARTMENT_ID=3



---. Find the highest salary among employees hired between 2020 and 2023.
SELECT MAX(SALARY) FROM EMPLOYEES
WHERE YEAR(HIRE_DATE) BETWEEN 2020 AND 2023




---. Find the minimum salary of employees whose first name starts with 'A' or 'M'.
SELECT MIN(SALARY) FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'A%' OR FIRST_NAME LIKE 'M%'



----- . Find the maximum salary of employees per department
SELECT DEPARTMENT_ID,MAX(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID


--- .Count how many employees exist in each department.
SELECT DEPARTMENT_ID, COUNT (*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID


----- . Find the total salary per department for employees earning between 65,000 and 85,000.
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
WHERE SALARY BETWEEN 65000 AND 85000
GROUP BY DEPARTMENT_ID