---CASE WHEN

---case when

-- high if salary > 80k else medium

select first_name,
last_name,
salary,
case when salary > 80000 then 'high'
else 'medium'
end as salary_status
from employees

--multiple when

-- IF NAME  'starts with a'
-- IF NAME 'starts with b'
--ELSE whatever
select first_name,
last_name,
salary,
case
when first_name like 'a%' then 'starts with a' --mporoume na valoume osa when theloume
when first_name like 'b%' then 'starts with b'
else  'whatever' -- else pianei ola ta upoloipa
end as name_status
from employees

---PRACTICE CASE WHEN
---Display a YES or NO if an employee earns more than $80,000.
SELECT FIRST_NAME, LAST_NAME, SALARY,
CASE 
WHEN SALARY>80000 THEN 'YES'
ELSE 'NO'
END
FROM EMPLOYEES

---Label employees as "Senior" or "Junior" based on their hire date. before 22 is senior
SELECT * ,
CASE
WHEN HIRE_DATE < '2022.01.01' THEN 'SENIOR'
ELSE 'JUNIOR'
END
FROM EMPLOYEES


---Display employees' names with a flag for those earning more than the average salary.
---Display whether employees have been in the company for more than or less than 5 years.
SELECT *,
CASE 
WHEN HIRE_DATE < '2021.10.23' THEN ' MORE THAN 5 YEARS'
ELSE 'LESS THAN 5 YEARS'
END
FROM EMPLOYEES

---List the employees who are hired after '2022-01-01' and have a salary over 40000.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE> '2022.01.01' AND SALARY>40000

---Find the employees who were hired in 2023 and have a salary greater than 55000.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE  >'2023.01.01'AND HIRE_DATE <'2023.12.31' AND SALARY>55000

---Get the total salary of employees in each department name
SELECT D.DEPARTMENT_NAME, SUM(E.SALARY)
FROM DEPARTMENTS D
 JOIN EMPLOYEES E
ON E.DEPARTMENT_ID=D.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME


---Find the highest salary in each department.
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

---Find the lowest salary in each department.
SELECT DEPARTMENT_ID, MIN(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

---- Find the average salary in each department.
SELECT DEPARTMENT_ID, AVG(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID

---Get the number of employees who joined after January 1, 2022.(KOLLISA)
SELECT COUNT(*) FROM EMPLOYEES
WHERE HIRE_DATE> '2022.01.01'

--- Find the department with the maximum total salary. (KOLLISA 2)
SELECT TOP 1 DEPARTMENT_ID ,SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY SUM(SALARY) DESC

---List the employees who work in the 'HR' department.
SELECT D.DEPARTMENT_NAME, E.FIRST_NAME, E.LAST_NAME FROM EMPLOYEES E
INNER JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID=E.DEPARTMENT_ID
WHERE D.DEPARTMENT_NAME = 'HR'

---Get the projects that started before January 1, 2020, and are associated with the 'IT' department.

SELECT P.PROJECT_NAME,P.START_DATE,D.DEPARTMENT_NAME FROM PROJECTS P
 JOIN DEPARTMENTS D
ON D.DEPARTMENT_ID=P.DEPARTMENT_ID
WHERE START_DATE< '2020.01.01' AND DEPARTMENT_NAME= 'IT'

---Find the department with the most employees.
SELECT TOP 1 COUNT(*) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID 








