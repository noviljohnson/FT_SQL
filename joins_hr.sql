-- Active: 1671700995648@@127.0.0.1@3308@hr


--  Joins

SELECT r.region_name, c.country_name from regions r INNER JOIN countries c on r.region_id=c.region_id;

desc regions;
desc countries;
desc locations;

SELECT r.region_name,l.country_id,l.city,c.country_name from locations l INNER JOIN countries c on c.country_id=l.country_id INNER JOIN regions r on r.region_id =c.region_id;

SHOW TABLES;

SELECT d.department_id,d.location_id,d.department_name from departments d INNER JOIN locations l on d.location_id=l.location_id;

SELECT r.region_name,c.country_name,l.city,d.department_name,CONCAT(e.first_name," ",e.last_name) "name" 
from regions r INNER JOIN countries c
on r.region_id=c.region_id
JOIN locations l on l.country_id=c.country_id
JOIN departments d on d.location_id=l.location_id
JOIN employees e on d.department_id=e.department_id;
desc employees;


-- self joins;

SELECT e.first_name,e.last_name,m.first_name from employees e INNER JOIN employees m on e.manager_id=m.employee_id ORDER BY e.last_name;
SELECT e.first_name,e.last_name,m.first_name from employees e LEFT OUTER JOIN employees m on e.manager_id=m.employee_id ORDER BY m.first_name;

-- same salary
SELECT CONCAT(e.first_name,e.last_name),e.salary --m.first_name,m.salary, 
from employees e inner JOIN employees m on  e.employee_id != m.employee_id and e.salary=m.salary
GROUP BY e.salary,CONCAT(e.first_name,e.last_name);
HAVING COUNT(*) > 1;



SELECT CONCAT(first_name,last_name), salary from employees
WHERE salary in(SELECT salary from employees
                GROUP BY salary
                HAVING COUNT(employee_id) > 1);



SELECT CONCAT(e.first_name,e.last_name), e.salary 
FROM employees e, employees m
WHERE e.employee_id != m.employee_id and e.salary=m.salary
GROUP BY e.salary, CONCAT(e.first_name,e.last_name);
HAVING COUNT(*) > 1;





-- find job_id which got filled in 2nd half of any year again filled in the 1st half of next YEAR


SELECT job_id,YEAR(e.hire_date),QUARTER(e.hire_date),e.first_name from employees e WHERE QUARTER(hire_date) > 2 and job_id in (
        SELECT job_id FROM employees m WHERE QUARTER(m.hire_date) < 3 and YEAR(m.hire_date) = YEAR(e.hire_date)+1 );