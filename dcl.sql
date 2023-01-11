-- Active: 1671700995648@@127.0.0.1@3308@hr

CREATE USER 'test'@'localhost' IDENTIFIED BY 'test';

SELECT USER FROM mysql.user;

SELECT DATABASE();


-- grant
GRANT ALL PRIVILEGES ON hr.job_grades TO 'test'@'localhost';

SHOW GRANTS FOR 'test'@'localhost';

REVOKE all PRIVILEGES on hr.job_grades from 'test'@'localhost';

GRANT CREATE on hr.* to 'test'@'localhost';

GRANT INSERT on hr.temp to 'test'@'localhost';
GRANT SELECT on hr.temp to 'test'@'localhost';

GRANT ALL on hr.* to 'test'@'localhost';


-- TC
-- rollback
-- Commit

CREATE Table emp4 as select employee_id,first_name
from employees where department_id=90;

SELECT * FROM employees;


START TRANSACTION;

SELECT * FROM emp4;

INSERT INTO emp4 VALUES(201,"JOhnson");

update emp4 SET first_name="Sai" WHERE employee_id = 994;

COMMIT;

INSERT INTO emp4 VALUES (209,"Razz");

--  update emp4 set first_name = 'Nix' where employee_id = 101;

SELECT * FROM emp4;


--  correlated update/ DELETE

DROP TABLE employee_new;
CREATE Table employee_new as 
    SELECT employee_id, first_name, department_id, job_id
    from employees;

ALTER Table employee_new add department_name varchar(35);
SELECT * from employee_new;

update employee_new e
set department_name = (SELECT department_name
                        FROM departments
                        WHERE department_id = e.department_id);

DELETE FROM employee_new e
WHERE job_id in ( SELECT job_id from employees
                    WHERE employee_id=e.employee_id
                    and employee_id = 109);
    
DELETE from employee_new;
ROLLBACK;

-- constraints
SHOW CREATE TABLE employee_new;

ALTER Table employee_new add PRIMARY KEY (employee_id);

CREATE Table test6(c2 DATE PRIMARY KEY);




-- practice session 
CREATE Table dept(id int(4), name VARCHAR(25));

INSERT INTO dept VALUES(1001,"Prithivi"),(1002,"Agni"), (1003,"Tejas"), (1004, "Trishul");

ALTER Table dept add constraint pk_id PRIMARY KEY (id) AUTO_INCREMENT;

ALTER Table dept ADD COLUMN loc VARCHAR(15);
UPDATE dept set loc="bangalore" WHERE id=1001;
UPDATE dept set loc="chennai" WHERE id=1002;
UPDATE dept set loc="hyderabad" WHERE id=1003;
UPDATE dept set loc="delhi" WHERE id=1004;

ALTER Table dept RENAME COLUMN loc to place;
ALTER TABLE dept RENAME TABLE dept to itpl_tab;
SELECT * FROM dept;



-- alter table dept modify id int AUTO_increment;
-- alter TABLE dept AUTO_INCREMENT=1001;
-- insert into dept_tab(name) values('pri'), ("abg"),("tejs");
-- alter table dept rename to itpl_tab;

-- alter table itpl_tab modify id numeric(10);
-- 

CREATE Table def_tab(c1 int, c2 numeric(11,2) DEFAULT 10.23);
ALTER Table def_tab MODIFY c2 numeric(11,2) DEFAULT 11.2;
-- altet TABLE def_tab alter c2 set DEFAULT '11.75';

create Table pri(c1 int PRIMARY KEY, c2 CHAR(1));



-- information_schema.ROUTINEs
-- information_schema.TRIGGERs

-- EXPORT
-- MYSQLDUMP
-- 
-- mysqldump -u root -p hr>hrdump.sql
-- mysqldump -u root -p --routines hr>hrdump.sql

