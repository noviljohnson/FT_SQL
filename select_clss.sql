-- Active: 1671700995648@@127.0.0.1@3308@ft_db

-- connect to the ft_db
SHOW DATABASES;

SHOW TABLES;

SHOW COLUMNS FROM emp;

DESC emp;



-- ##########  SELECT  #############

-- Projection
-- Restriction 
-- Join


-- Projection
-- selecting specific cols
SELECT `dname` FROM dept;

-- Restriction 
-- select     * (projection)
-- from        table NAME
-- where        RESTRICTION

SELECT *
FROM   dept
WHERE deptno=30;


-- task 1
-- display employees working as salesman(emp)

SELECT *
FROM emp
WHERE job = 'salesman';

-- find emps who are taking slaries more than 2975
SELECT * 
FROM emp
WHERE sal > 2975;

-- emps who are not clerks
SELECT * 
FROM emp
WHERE job <> 'clerk';

SELECT * 
FROM emp
WHERE job != 'clerk';

-- emp who are clerks from deptno = 20
SELECT * 
FROM emp
WHERE job = 'clerk' and deptno = 20;


SELECT * 
FROM emp
WHERE ename='smi';
SELECT * 
FROM emp
WHERE ename like 'smi   '; --smith

-- in, not in
SELECT * 
FROM emp
WHERE ename in ('smith', 'John');

SELECT *
FROM emp
WHERE `DEPTNO` = 10 OR `DEPTNO` = 30;
-- WHERE `DEPTNO` in (30,10);

-- between
SELECT * 
FROM emp
WHERE sal BETWEEN 950 AND 2975;

SELECT * 
FROM emp
WHERE ename BETWEEN 'james' AND 'turner';

-- pattern matching

-- starting
SELECT ename
FROM emp
where `ENAME` like 'j%';
-- ending
SELECT ename
FROM emp
where `ENAME` like '%D';
-- containing
SELECT ename
FROM emp
where `ENAME` like '%T%';

SELECT ename
FROM emp
where `ENAME` not like '%T%';

SELECT ename
FROM emp
where `ENAME` like '__R%';

-- exactly 4 chars
SELECT ename
from emp
WHERE `ENAME` like '____';



CREATE TABLE emp1 AS SELECT * FROM EMP;

UPDATE emp1 SET job = "sales_rep" where job='salesman';

UPDATE emp1 SET `JOB` = 'hr_clerk' WHERE job='clerk';


-- finds jobs with _ char 
SELECT ename,job
from emp1
WHERE `JOB` like '%\_%';

UPDATE emp1 SET job="hr%clerk" WHERE job='hr_clerk';

SELECT ename,job
from emp1
WHERE `JOB` like '%\%%';

--  emp joined in 1981
SELECT *
FROM emp
WHERE YEAR(`HIREDATE`) = 1981 AND `ENAME` not like '%s%';

SELECT ename, comm 
FROM emp;

SELECT *
FROM emp
WHERE `COMM` is NOT NULL;



CREATE TABLE company_new(
    compid SMALLINT PRIMARY KEY,
    compname VARCHAR(20)
);

DESCRIBE company_new;

-- Default order
INSERT INTO company_new VALUES(1,"WARD");

-- changed order 
INSERT INTO company_new(compname, compid) VALUES('INFY', 2);

-- multiple rows at a TIME
INSERT INTO company_new VALUES(3,"Oracle"), (4,"tcs"), (5,"ft"), (6,"cts"), (7,"Sg");


SET @v1=8, @v2='emc2';

INSERT INTO company_new VALUES(@v1, @v2);

INSERT INTO company_new VALUES(9,NULL);

INSERT INTO company_new (compid) VALUES(10);

-- copying rows from other TABLE
INSERT INTO company_new SELECT deptno, dname FROM dept WHERE `DEPTNO` > 11;



CREATE TABLE default_tab(c1 INT PRIMARY KEY, c2 TIMESTAMP DEFAULT now());

DESC default_tab;

INSERT INTO default_tab VALUES(102,DEFAULT);


SELECT * from company_new;

UPDATE company_new SET compname = "Sg" WHERE compid =22; 

SELECT * FROM company_new;

