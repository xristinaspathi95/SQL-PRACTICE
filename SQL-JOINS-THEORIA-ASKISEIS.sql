
---PRACTICE JOINS(INNER,LEFT,RIGHT JOIN)


---APPEAR EMPLOYEE FIRST NAME, LAST NAME, SALARY, DEPARTMENT NAME

select first_name,last_name,salary,department_name
from employees
inner join departments 
on departments.department_id = employees.department_id
where salary > 75000


----List all employees along with their department names.
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_NAME
FROM EMPLOYEES
LEFT JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID



---Find the total salary budget for each department.
SELECT D.DEPARTMENT_NAME, SUM(E.SALARY) AS SALARY_BUDGET
FROM EMPLOYEES E
LEFT JOIN DEPARTMENTS D
 ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME

---List all employees hired after a specific date in a particular department.
---( DEPARTMENT_NAME=HR, HIRE_DATE>31.12.22)
SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE,D.DEPARTMENT_NAME
FROM EMPLOYEES E
JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME= 'HR'
 AND E.HIRE_DATE> '2022-12-31'

 ---Find all employees whose last names start with 'S'.
 SELECT * FROM EMPLOYEES
 WHERE LAST_NAME LIKE 'S%'


 ---List all projects along with the department name.
 SELECT P.PROJECT_NAME, D.DEPARTMENT_NAME
 FROM PROJECTS P
 LEFT JOIN DEPARTMENTS D
 ON P.DEPARTMENT_ID=D.DEPARTMENT_ID



 ---Find employees who work in the 'Marketing' or 'Sales' department.
 SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME
 FROM EMPLOYEES E
 LEFT JOIN DEPARTMENTS D
 ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
 WHERE D.DEPARTMENT_NAME = 'MARKETING' OR DEPARTMENT_NAME = 'SALES'


 ---List all employees who work on projects that started after a specific date.
 SELECT E.FIRST_NAME, E.LAST_NAME, E.HIRE_DATE, P.PROJECT_NAME
 FROM EMPLOYEES E
 JOIN PROJECTS P
 ON E.DEPARTMENT_ID=P.DEPARTMENT_ID
 WHERE HIRE_DATE> '2021.01.01'


 ---Find all employees who have a salary greater than $50000 and were hired before '2022'.
SELECT * FROM EMPLOYEES
WHERE SALARY> 50000 AND HIRE_DATE< '2022.01.01'


---List all projects that have start date after 2022.
SELECT * FROM PROJECTS
WHERE START_DATE > '2022.01.01'


--- Select departments that do not have any employees
SELECT * FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
 ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
 WHERE E.EMPLOYEE_ID IS NULL


 ---list all departments names for employees whose salary is between 70,000 and 80,000
 SELECT D.DEPARTMENT_NAME, E.SALARY FROM DEPARTMENTS D
 LEFT JOIN EMPLOYEES E
 ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
 WHERE  SALARY BETWEEN 70000 AND 80000

 ---List projects that belong to the same department as employee 'John Doe'
 SELECT P.* FROM PROJECTS P
 JOIN EMPLOYEES E
 ON E.DEPARTMENT_ID=P.DEPARTMENT_ID
 WHERE E.FIRST_NAME= 'JOHN' AND LAST_NAME = 'DOE'



---AGGREGATIONS AND JOINS(COMBINATION)

--- For each department, display the department name and the total number of employees. 
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS TOTAL_NUMBER
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME

--- Show the department name and the average salary of employees in each department.
SELECT D.DEPARTMENT_NAME, AVG(E.SALARY) AS AVERAGE_SALARY
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME



 ---Find the department name and the highest salary among its employees. 
 SELECT D.DEPARTMENT_NAME, MAX(E.SALARY) AS HIGHEST_SALARY
FROM DEPARTMENTS D
JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME



--- Display each department name along with the number of projects assigned to it. 
SELECT D.DEPARTMENT_NAME, COUNT(P.PROJECT_ID) AS TOTAL_PROJECTS
FROM DEPARTMENTS D
JOIN PROJECTS P
ON D.DEPARTMENT_ID=P.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME



---List departments where the average employee salary is greater than 75,000 and show the average.
SELECT D.DEPARTMENT_NAME, AVG(E.SALARY) AS AVERAGE_EMPLOYEE_SALARY
FROM DEPARTMENTS D
LEFT JOIN EMPLOYEES E
ON D.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE SALARY>75000
GROUP BY D.DEPARTMENT_NAME






















