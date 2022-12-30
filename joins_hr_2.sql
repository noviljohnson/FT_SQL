-- Active: 1671700995648@@127.0.0.1@3308@hr


-- aliases are for INNER JOIN
SELECT r.region_name, c.country_name
from regions r INNER JOIN countries c
on r.region_id=c.region_id;

-- for NATURAL JOIN no need of aliases
--  join condition should not be specified
SELECT region_name, country_name
from regions NATURAL JOIN countries ;

-- multiple common COLUMNs
SELECT first_name, department_name
FROM employees NATURAL JOIN departments;


-- USING
SELECT first_name,department_name
from employees JOIN departments
USING(department_id);


SHOW tables;
SELECT * from countries;