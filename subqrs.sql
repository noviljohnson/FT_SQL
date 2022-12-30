-- Active: 1671700995648@@127.0.0.1@3308@hr


-- SUB Queries 

-- find out employees who joined after lisa first_name
SELECT first_name,hire_date
from employees
WHERE hire_date > (SELECT hire_date FROM employees WHERE first_name = 'Lisa');

-- using joins
SELECT e.first_name, e.hire_date
from employees e, employees m
WHERE m.first_name = 'Lisa' and e.hire_date > m.hire_date;


-- find out department_name in which steven king is working
SELECT department_name
FROM departments
WHERE department_id in (SELECT department_id FROM employees WHERE concat(first_name," ",last_name) = "Steven King");


-- find out employeees reporting to Neena Kochhar
SELECT employee_id, first_name
FROM employees
WHERE manager_id in (SELECT employee_id FROM employees WHERE CONCAT(first_name, " ", last_name) = "Neena Kochhar");
SELECT e.employee_id, e.first_name
FROM employees e, employees m
WHERE m.first_name = "Neena" and e.manager_id = m.employee_id;

create table job_grades
(grade_level char(1),
 lowest_sal numeric(11,2),
 high_sal numeric(11,2));

insert into job_grades
values ("A",1000,2999),
("B",3000,5999),
("C",6000,9999),
 ("D",10000,14999),
 ("E",15000,24999),
 ("F",25000,40000);
SHOW tables;


SELECT concat(e.first_name, ' ', e.last_name) "full name", e.salary, j.grade_level
FROM employees e JOIN job_grades j
on e.salary BETWEEN j.lowest_sal and j.high_sal
and e.department_id=90;

-- find out grade of lex de haan using subquery
SELECT grade_level
FROM job_grades
WHERE (SELECT salary from employees WHERE CONCAT(first_name," ", last_name) = "Lex De Haan") BETWEEN lowest_sal and high_sal;

-- find out employees working in the same department as hermann baer exclude hermann baer row
SELECT first_name, employee_id
FROM employees
WHERE department_id = (SELECT department_id from employees WHERE CONCAT(first_name," ", last_name) = "Hermann Baer") and 
employee_id not in (SELECT employee_id from employees WHERE CONCAT(first_name," ", last_name) = "Hermann Baer");

SELECT * FROM employees WHERE CONCAT(first_name," ", last_name) = "Hermann Baer";
SELECT count(*) from employees WHERE department_id = 70;

SELECT e.first_name, e.employee_id
FROM employees e, employees m
WHERE e.department_id=m.department_id and CONCAT(m.first_name, " ", m.last_name) = "Neena Kochhar";

-- Multiple ROWS

SELECT concat(first_name, " ", last_name)
from employees
WHERE department_id in (SELECT department_id FROM employees
                        WHERE first_name in( "Valli", "Lex"));

-- find the dept name in which no employees are working
SELECT department_name 
FROM departments 
WHERE department_id not in (SELECT DISTINCT(department_id) FROM employees WHERE department_id is not NULL);

SELECT DISTINCT(department_id) FROM employees;
SELECT * FROM departments;

-- find out department_name wehre no SA_REP working
SELECT * FROM employees;

SELECT distinct(department_id) FROM departments WHERE department_id not in( 
SELECT department_id FROM employees WHERE job_id = 'SA_REP' and department_id is not NULL) ;
SELECT department_id FROM employees WHERE job_id = 'SA_REP' and department_id is not NULL;

SELECT first_name, hire_date
FROM employees
WHERE hire_date > all ( SELECT hire_date from employees WHERE first_name in ("Laura", "Susan"));

--  max salary of each job id
SELECT first_name, salary FROM employees
WHERE (salary,job_id) in 
(sELECT max(salary),job_id
FROM employees 
GROUP BY job_id);

SELECT e.first_name, e.salary
FROM employees e, employees m
WHERE max(m.salary) = e.salary and e.job_id = m.job_id
GROUP BY m.job_id;


--  job id with max employees
SELECT job_id 
FROM employees 
WHERE COUNT(*) 
;
SELECT job_id,COUNT(*)
FROM employees 
GROUP BY job_id
HAVING COUNT(*) =
        (SELECT MAX(c) 
        from (SELECT count(*) c
                from employees
                GROUP BY job_id) e
        )

;

SELECT first_name, job_id
from employees
WHERE job_id in (SELECT job_id
FROM employees 
GROUP BY job_id
HAVING COUNT(*) =
        (SELECT MAX(c) 
        from (SELECT count(*) c
                from employees
                GROUP BY job_id) e
        )
);

-- employees taking sal > avg sal of respective departments
SELECT first_name, salary, department_id
FROM employees e
WHERE salary > (SELECT avg(salary)
                from employees
                WHERE department_id = e.department_id);

SELECT e.first_name, e.salary, e.department_id, a.avsal
from employees e INNER JOIN (
    SELECT department_id, avg(salary) avsal
    from employees
    WHERE department_id is not NULL
    GROUP BY department_id) a
on e.department_id=a.department_id
and e.salary>a.avsal
ORDER BY 3;

-- Group CONCAT
SELECT GROUP_CONCAT(first_name), department_id
FROM employees
WHERE department_id=60
GROUP BY department_id;