-- Active: 1671700995648@@127.0.0.1@3308@hr
show tables;
SELECT * from employees;

CREATE View V1
    as SELECT employee_id, first_name, salary, job_id, department_id
    FROM employees
    WHERE department_id=60;

SELECT * FROM V1;

GRANT SELECT on hr.v1 to 'test'@'localhost';

-- complex VIEW
CREATE View Sal_view AS
    SELECT sum(salary) "Total sal", department_id
    FROM employees
    WHERE department_id is not NULL
    GROUP BY department_id;


-- START TRANSACTION;
-- DELETE FROM sal_view;  -- not allowed
-- COMMIT;

CREATE View v4 as
    SELECT region_name, country_name
    FROM regions NATURAL JOIN countries;

SELECT * from v4;

INSERT INTO v4 VALUES("AAAA","Bangalore");  -- not allowed

DESCRIBE v4;
 
CREATE View v5 as 
    SELECT * 
    FROM employees
    WHERE department_id=10 WITH CHECK OPTION;

UPDATE v5 set department_id = 40;