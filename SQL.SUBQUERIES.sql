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
WHERE DEPARTMENT_NAME = (SELECT DEPARTMENT_NAME = 'FINANCE')