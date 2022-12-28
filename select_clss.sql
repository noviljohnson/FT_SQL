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



-- Select extension

SHOW TABLES;

-- Distinct 
SELECT DISTINCT(deptno)
FROM emp;

-- distinct for multiple cols 
-- Can't be used for multiple cols 

SELECT DISTINCT(deptno), job from emp;

SELECT deptno, job from emp;

-- Aliasing

SELECT ename,sal, sal+300 "incr sal" from emp;

SELECT ename,sal, sal*0.4 "hra", sal*0.3 "da", sal*0.12 "pf", sal*0.1 "tax", sal+sal*0.7-sal*0.22 "total sal" from emp;


-- SET
SET @n="novil";
SET @v = 1250, @hra=0.4, @da=0.3, @pf=0.12,@tx=0.1;

SELECT ename,sal, sal*@hra "hra sal" from emp;

SELECT ename,sal, sal*@hra "hra", sal*@da "da", sal*@pf "pf", sal*@tx "tax", sal+sal*(@hra+@da-@pf-@tx) "total sal" from emp;

SHOW VARIABLES;

-- Order BY

SELECT ename, deptno, job from emp ORDER BY `ENAME`;
SELECT ename, deptno, job from emp ORDER BY `ENAME` DESC;
SELECT ename, deptno, job "j" from emp ORDER BY "j";
-- won't sort with double quotes
-- will work with out quotes
 SELECT ename, deptno, job "j" from emp ORDER BY j;
SELECT  deptno,ename, job from emp ORDER BY 1,2;
SELECT  deptno,ename, job from emp ORDER BY 1 asc,2 DESC;

-- Limit
SELECT * from emp LIMIT 5;
SELECT * FROM emp ORDER BY `ENAME` LIMIT 5;
SELECT * FROM emp ORDER BY `SAL` DESC LIMIT 3;
SELECT DISTINCT(sal) FROM emp ORDER BY `SAL` DESC LIMIT 3 ;
SELECT DISTINCT(sal), `ENAME` FROM emp ORDER BY `SAL` DESC LIMIT 1,2;



-- concatnate
SELECT CONCAT(ename, job) "emp and his job" from emp;
SELECT CONCAT(ename, " working as ", job) "emp and job" from emp;
SELECT CONCAT(ename,"\'s job is ", job) "emp and job" from emp;


-- upper and LOWER
SELECT UPPER(ename) from emp;
SELECT LOWER(ename) FROM emp;

-- substr
SELECT SUBSTR(ename,2) from emp;
SELECT SUBSTR(ename, 2, 4) FROM emp;
SELECT SUBSTR(ename, -1) FROM emp;

-- write a query to display last char in upper case remaining in lower CASE
SELECT CONCAT(LOWER(SUBSTR(ename,1,LENGTH(ename)-1)),UPPER(SUBSTR(ename,-1))) "ename" from emp;

-- length
-- instr
select instr("NNN", "N") "pos of t";
SELECT ename from emp where SUBSTR(ename,-1) = SUBSTR(ename,-2,1);
SELECT ename,instr(ename,SUBSTR(ename,-1)) from emp where instr(ename,substr(ename,-1)) < length(ename);
SELECT ename from emp; 
SELECT ename,instr(substr(ename,1,length(ename)-1),SUBSTR(ename,-1)) from emp;
SELECT ename, instr(substr(ename,1,LENGTH(ename)-1), SUBSTR(ename,-1)) from emp ;

-- left/right
SELECT ename,LEFT(ename,3) "left", RIGHT(ename, 3) "right" from emp;
SELECT ename, CONCAT(lower(LEFT(ename,LENGTH(ename)-1)),UPPER(RIGHT(ename,1))) from emp;

-- trim;
SELECT LENGTH(" Novil "), LENGTH(TRIM(" Novil "));
SELECT LENGTH(TRIM(" Novil ")), LENGTH(RTRIM(" Novil ")), LENGTH(LTRIM(" Novil "));
SELECT TRIM("H" from "Hello");

-- replace
SELECT REPLACE("HI NOVIL JOHNSON", "HI", "HELLO");
SELECT REPLACE("HI NOVIL JOHNSON", "O", "HELLO");

SELECT length("mary had a little lamb") - length(REPLACE("mary had a little lamb","a","")) "count";

-- lpad/rpad
SELECT dname FROM dept;
SELECT dname, lpad(dname,15,"*") "lpad", RPAD(dname,15,"^") "rpad" from dept;

-- repeat
SELECT REPEAT("novil",13);
-- reverse
SELECT REVERSE("novil");



-- NUMBER FUNCTIONS

-- mod(num,num2)
SELECT mod(`EMPNO`,3) from emp;

-- sign(A-B)
SELECT SIGN(4-6), SIGN(6-4), SIGN(4-4);
-- find emps taking commision > sal
SELECT ename, sal, comm 
FROM emp 
WHERE SIGN(comm-sal) > 0;  

-- abs(),char(),ascii()
SELECT abs(-1) "abs", ASCII("a"), CHAR(97 USING ASCII) "char 97";
SELECT abs(-1) "abs", ASCII("a"), CHAR(97) "char 97";


-- ROUND,TRUNCATE,CEIL,FLOOR

SELECT ROUND(1232.123,2);
SELECT ROUND(233.323,-1);
SELECT ROUND(233.323,-2);
SELECT ROUND(233424243.434, -3);

SELECT ROUND(12334.3223,-1), ROUND(12334.3223,-2),TRUNCATE(12334.3223,-1),TRUNCATE(12334.2323,-2);


-- Date and TIME
SELECT CURRENT_DATE,CURDATE(), now(), SYSDATE(),CURRENT_TIMESTAMP;
SELECT time(now()),date(now());
SELECT HOUR(now()),MINUTE(now()), DAYNAME(now()), MONTH(now()), YEAR(now()), DAY(now());

--  employees joined on tuseday
SELECT ename from emp WHERE DAYNAME(`HIREDATE`) = "TUESDAY";
SELECT ENAME FROM EMP WHERE MONTH(`HIREDATE`) = 12;
SELECT ENAME,`HIREDATE` FROM EMP WHERE YEAR(`HIREDATE`) = 1981 AND `ENAME` NOT LIKE "%S%";

SELECT QUARTER(NOW());

SELECT ENAME FROM EMP WHERE MOD(YEAR(`HIREDATE`),4) =0 AND MOD(YEAR(`HIREDATE`),400) = 0 AND MOD(YEAR(`HIREDATE`),100) = 0;
SELECT DATE_FORMAT(date(NOW()),"%j");


SELECT * FROM emp ORDER BY comm;

SELECT DATE_FORMAT(curdate(),'%D'); -- add TH to day portion  17th,18th

SELECT ename,hiredate from emp where DAYNAME(`HIREDATE`) = "Thursday" and day(`HIREDATE`) < 7 ; 
SELECT ename,hiredate from emp where DAYNAME(`HIREDATE`) = "Thursday" and DATE_FORMAT(`HIREDATE`,'%d') < 7 ; 

SELECT ename,hiredate, day(hiredate), DAYNAME(hiredate),DATE_FORMAT(hiredate,'%d') from emp;

SELECT ename,hiredate, CONCAT(DATE_FORMAT(hiredate,'%D')," ",DAYNAME(hiredate)," ",MONTH(hiredate)," ",YEAR(hiredate)) from emp;
SELECT ename,hiredate, DATE_FORMAT(hiredate,'%d') from emp;

-- extract
SELECT EXTRACT(year from hiredate), EXTRACT(month from hiredate), EXTRACT(day from hiredate) FROM emp;

-- returning differences

SELECT DATEDIFF(CURDATE(),hiredate), hiredate from emp;

SELECT TIMESTAMPDIFF(year,hiredate,CURDATE()), hiredate from emp;
SELECT TIMESTAMPDIFF(MONTH,hiredate,CURDATE()), hiredate from emp;
SELECT TIMESTAMPDIFF(DAY,hiredate,CURDATE()), hiredate, CURDATE() from emp;

SELECT TIMESTAMPDIFF(YEAR,"1999-08-02",CURDATE()) 'year', mod(TIMESTAMPDIFF(MONTH,"1999-08-02",CURDATE()),12) 'months', mod(TIMESTAMPDIFF(DAY,"1999-08-02",CURDATE()),31) 'days';
-- modifying dates 
SELECT DATE_ADD(CURDATE(), INTERVAL '1' YEAR) "add 1 year", DATE_SUB(CURDATE(),INTERVAL '2' YEAR) 'sub 2 years';

SELECT last_day(CURDATE());
SELECT last_day('1999-08-02');
SELECT MAKEDATE(2022,4);
SELECT MAKEDATE(2022,123);
SELECT MAKEDATE(2022,434);

