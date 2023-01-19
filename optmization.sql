-- Active: 1671700995648@@127.0.0.1@3308@ft_db

-- desc information_schema.files;
-- SHOW VARIABLES like 'datadir';
-- SHOW VARIABLES like 'basedir';

-- SELECT tablespace_name, file_name
-- FROM information_schema.`FILES`
-- LIMIT 10;



-- Data Dictionary View
 select tablespace_name, file_name from information_schema.files limit 10;
 
 /*
	tablespaces -> datafiles -> extents -> datapages -> rows
 */
create table check_tab(c1 int);


select tablespace_name, file_name,total_extents from information_schema.files where tablespace_name like 'practice/che%';

create table check_extent as select * from emp;
select * from check_extent;
desc check_extent;

-- set auto increment to a column
alter table check_extent modify empno int auto_increment primary key;

truncate table check_extent;

insert into check_extent(ename,job,mgr,hiredate,sal,comm,deptno)
select ename,job,mgr,hiredate,sal,comm,deptno from emp;

insert into check_extent(ename,job,mgr,hiredate,sal,comm,deptno)
select ename,job,mgr,hiredate,sal,comm,deptno from check_extent where ename <> 'king';

select tablespace_name, file_name,total_extents from information_schema.files where tablespace_name like 'practice/check_extent%';
select count(empno) from check_extent;

SELECT * from check_extent LIMIT 100;


SELECT COUNT(*) FROM check_extent WHERE job = 'CLERK';
DESCRIBE check_extent;

SELECT COUNT(DISTINCT empno) from check_extent;


-- Partitions TABLE

CREATE table list_job ( empno int,
                        ename VARCHAR(20),
                        job VARCHAR(20))
    PARTITION BY list columns(job)
    (
        partition p_clerk values in ('CLERK'),
        partition p_sales values in ('SALESMAN'),
        partition p_ana values in ('ANALYST'),
        partition p_man values in ('MANAGER'),
        partition p_pre values in ('PRESIDENT')
    );

INSERT INto list_job SELECT empno,ename,job from check_extent;

EXPLAIN SELECT * FROM emp;
EXPLAIN SELECT * from check_extent;
EXPLAIN SELECT count(*) from list_job;
EXPLAIN SELECT count(*) from list_job WHERE job='CLERK';
EXPLAIN SELECT COUNT(*) FROM check_extent WHERE job='CLERK';

USE ft_db;
EXPLAIN SELECT * FROM emp;
EXPLAIN SELECT * FROM emp WHERE `DEPTNO`=10;
EXPLAIN SELECT * FROM dept WHERE `DNAME`='SALES';
USE hr;
EXPLAIN SELECT * FROM regions WHERE region_id=1;
EXPLAIN SELECT * FROM departments WHERE location_id=1700;

EXPLAIN SELECT ename,sal from emp WHERE sal in (SELECT min(sal) from emp);

EXPLAIN SELECT deptno from emp WHERE job='CLERK'
UNION
SELECT `DEPTNO` from emp WHERE job='SALESMAN';

EXPLAIN SELECT ename from emp
UNION
SELECT dname from dept;

EXPLAIN SELECT ename, dname from emp NATURAL join dept;

CREATE Table fruit(id int, name VARCHAR(20), price int);

INSERT INTO fruit VALUES(103,'Guava',80),(101, 'mango', 150),(105, 'apple', 200);
SELECT * FROM fruit;

-- xpln
EXPLAIN FORMAT=TREE SELECT * from fruit WHERE id=101;
EXPLAIN FORMAT=tree SELECT * from list_job WHERE job='PRESIDENT';
EXPLAIN FORMAT=tree SELECT * from check_extent WHERE job='PRESIDENT';

SHOW INDEX FROM emp;
SHOW INDEX from check_extent;
SHOW INDEX from list_job;
SHOW INDEX from fruit;

SELECT DISTINCT table_name, COLUMN_NAME, INDEX_name 
FROM information_schema.`STATISTICS` 
WHERE `TABLE_SCHEMA` = 'hr'
and `TABLE_NAME` = 'employees';

-- indexes
CREATE INDEX
    id_idx on fruit(id);

EXPLAIN FORMAT = tree SELECT * from fruit WHERE id=101;





-- day2

USE hr;
DESCRIBE regions;
EXPLAIN format=tree SELECT * from regions WHERE region_id=1;

use ft_db;
show tables;

desc emp;

SHOW INDEXES from emp;

CREATE Table empEx as SELECT * from emp;

SHOW INDEXES from empEx;

EXPLAIN SELECT * from empex WHERE job='CLERK';
EXPLAIN format=tree SELECT * from empex WHERE job='CLERK';

EXPLAIN SELECT * FROM dept WHERE dname='SALES';
SHOW INDEXES from dept;
EXPLAIN FORMAT = tree SELECT * from dept WHERE dname='SALES';

CREATE INDEX dname_indx on dept(dname);

EXPLAIN SELECT * FROM dept WHERE dname='SALES';
SHOW INDEXES from dept;
EXPLAIN FORMAT = tree SELECT * from dept WHERE dname='SALES';


show TABLes;

EXPLAIN SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';
EXPLAIN FORMAT = tree SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';
SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';
SHOW INDEXes from emp;

ALTER Table emp alter INDEX fk_deptno invisible;
ALTER Table emp alter INDEX fk_deptno visible;

EXPLAIN SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';
EXPLAIN FORMAT = tree SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';



EXPLAIN SELECT * from check_extent WHERE job='CLERK';
EXPLAIN FORMAT = tree SELECT * from check_extent WHERE job='CLERK';


-- composite INDEX
CREATE index comp_dept_job ON emp (deptno,job);
EXPLAIN SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';
EXPLAIN FORMAT = tree SELECT * from emp WHERE `DEPTNO`=20 and job='CLERK';

CREATE INDEX dept on emp (deptno);
EXPLAIN FORMAT = tree SELECT * from emp FORCE INDEX(dept)  WHERE `DEPTNO`=20 and job='CLERK';


EXPLAIN SELECT * from fruit WHERE id=101;
EXPLAIN FORMAT = tree SELECT * from fruit WHERE id=101;

ALTER Table fruit ADD constraint pk_id PRIMARY KEY (id);

EXPLAIN SELECT * from fruit WHERE id=101;
EXPLAIN FORMAT = tree SELECT * from fruit WHERE id=101;

SHOW INDEXES FROM fruit;





--  Derived

EXPLAIN SELECT * from (SELECT max(sal) from emp) a;
EXPLAIN format = tree SELECT * from (SELECT max(sal) from emp) a;

use hr;
EXPLAIN SELECT * FROM regions WHERE region_id=4;

ALTER table emp alter ;
SHOW tables;

use ft_db;
SHOW tables;
SHOW INDEXES from emp;
SHOW CREATE TABLE emp;
ALTER TABLE emp alter index comp_dept_job invisible;


EXPLAIN SELECT * from emp WHERE `DEPTNO`=10 and job = 'CLERK';

EXPLAIN SELECT * from emp WHERE `HIREDATE`='1981-12-03';

SELECT count(comm) from check_extent;

EXPLAIN SELECT * from emp WHERE comm is null;
CREATE INDEX comm_indx on emp(comm);
EXPLAIN SELECT * from emp WHERE comm is null;
EXPLAIN SELECT * from emp WHERE comm is not null;
CREATE INDEX comm_indx on check_extent(comm);
EXPLAIN SELECT * from check_extent WHERE comm is null;
EXPLAIN SELECT * from check_extent WHERE comm is not null;


EXPLAIN SELECT * FROM emp WHERE deptno=20;
EXPLAIN SELECT * from emp WHERE job='CLERK';
EXPLAIN format = tree SELECT * FROM emp WHERE deptno=20;
EXPLAIN format = tree SELECT * from emp  WHERE job='CLERK';

SHOW INDEXES from emp;
CREATE INDEX job_indx on emp(job);

EXPLAIN SELECT * FROM emp WHERE deptno=20;
EXPLAIN SELECT * from emp WHERE job='CLERK';
EXPLAIN format = tree SELECT * FROM emp WHERE deptno=20;
EXPLAIN format = tree SELECT * from emp  WHERE job='CLERK';

ALTER TABLE emp alter INDEX comp_dept_job visible;
EXPLAIN format = tree SELECT * from emp force INDEX(comp_dept_job) WHERE job='CLERK';
EXPLAIN SELECT * from emp force INDEX(comp_dept_job) WHERE job='CLERK';


SELECT * from sys.schema_unused_indexes;

EXPLAIN SELECT * from emp where empno>7839;
EXPLAIN SELECT * from emp where empno like '78%';
EXPLAIN SELECT * from emp WHERE empno BETWEEN 7369 and 7839;


-- aggrigates

EXPLAIN SELECT min(sal) from emp;
EXPLAIN FORMAT = tree SELECT min(sal) from emp;

CREATE INDEX sal_indx on emp(sal);

EXPLAIN SELECT min(sal) from emp;
EXPLAIN FORMAT = tree SELECT min(sal) from emp;

EXPLAIN format = tree SELECT sum(sal),job from emp GROUP BY job;
EXPLAIN format = tree SELECT sum(sal),job from emp GROUP BY job HAVING job<>'analyst';
SHOW INDEXES FROM EMP;

EXPLAIN FORMAT = tree
SELECT COUNT(employee_id), department_id
from employees
GROUP BY department_id
HAVING department_id in (60,80);

EXPLAIN FORMAT = tree
SELECT COUNT(employee_id), department_id
from employees
where department_id in (60,80)
GROUP BY department_id;


-- practice 1

CREATE Table student1(student_id INT(4) PRIMARY KEY,
                        student_name VARCHAR(15),
                        result VARCHAR(1),
                        constraint result_ck check (result in ('P','F')));

INSERT INTO student1 SELECT empno,ename,NULL from emp1;

update student1 set result = if(student_name like '%S%', 'P','F');

SELECT * FROM student1;

SELECT COUNT(*) 'No of stu', result from student1 GROUP BY result;
EXPLAIN SELECT COUNT(*) 'No of stu', result from student1 GROUP BY result;
EXPLAIN format = tree SELECT COUNT(*) 'No of stu', result from student1 GROUP BY result;

CREATE INDEX reslt_indx on student1(result);
ALTER Table student1 alter INDEX reslt_indx invisible;

explain format = tree SELECT COUNT(*) from student1 WHERE result = 'F';

EXPLAIN FORMAT = tree
SELECT sum(sal), job from emp GROUP BY job
UNION
SELECT sum(sal), null from emp;

explain format = tree SELECT sum(sal), job from emp GROUP BY job with ROLLUP;

SHOW tables from ft_db;
explain format = tree SELECT sum(salary), job_id from hr.employees GROUP BY job_id with ROLLUP;
EXPLAIN FORMAT = tree
SELECT sum(salary), job_id from hr.employees GROUP BY job_id
UNION
SELECT sum(salary), null from hr.employees;



-- Joins

CREATE Table reg1 as SELECT * FROM hr.regions;
CREATE Table country1 as SELECT * FROM hr.countries;


EXPLAIN SELECT region_name , country_name from reg1 NATURAL JOIN country1;
EXPLAIN format = tree SELECT region_name , country_name from reg1 NATURAL JOIN country1;

CREATE INDEX reg_id_indx on country1(region_id);

EXPLAIN format = tree SELECT region_name , country_name from reg1 NATURAL JOIN country1;

CREATE INDEX reg1_id_indx on reg1(region_id);

EXPLAIN format = tree SELECT region_name , country_name from reg1 NATURAL JOIN country1;

ALTER TABLE reg1 ADD constraint pk_regid_reg1 PRIMARY KEY  reg1(region_id);
EXPLAIN format = tree SELECT  country_name,region_name from reg1 NATURAL JOIN country1;
EXPLAIN format = tree SELECT   r2.region_name, r.region_name from reg1 r NATURAL JOIN reg1 r2;
SELECT * FROM reg1;
SELECT * FROM country1;

SHOW INDEXES from reg1;
SHOW INDEXES from country1;

ALTER Table country1 ADD constraint fk_regid_cntry FOREIGN KEY country1(region_id) REFERENCES reg1(region_id);

EXPLAIN format = tree SELECT  country_name,region_name from reg1 NATURAL JOIN country1;

