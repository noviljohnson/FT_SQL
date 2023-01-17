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