-- Active: 1671700995648@@127.0.0.1@3308@ft_db


-- types of indexes

SHOW engines;
SHOW INDEXES from emp;

CREATE INDEX hiredate on emp(hiredate);

EXPLAIN format = tree SELECT * from emp WHERE MONTHNAME(`HIREDATE`) = 'January';
EXPLAIN format = tree SELECT * from emp WHERE HIREDATE = '1983-01-01';

-- functional INDEX
ALTER Table emp add
INDEX((monthname(hiredate)));

EXPLAIN format = tree SELECT * from emp WHERE MONTHNAME(`HIREDATE`) = 'January';

CREATE INDEX ename on emp(ename);
DROP INDEX ename on emp;
EXPLAIN FORMAT=tree SELECT * FROM emp WHERE year(`HIREDATE`) = 1981;
ALTER Table emp add
INDEX((YEAR(hiredate)));
EXPLAIN FORMAT=tree SELECT * FROM emp WHERE year(`HIREDATE`) = 1900;

CREATE Table testhash(
    fname VARCHAR(50) not NULL,
    lname VARCHAR(50) not NULL,
    key using hash(fname)
)engine=MEMORY;


INSERT INTO testhash SELECT first_name, last_name from hr.employees
WHERE department_id in (60,90);

SELECT * FROM testhash;

explain format = tree SELECT * FROM testhash;
explain format = tree SELECT * FROM testhash WHERE fname = 'Alexander';
explain format = tree SELECT * FROM testhash WHERE fname like 'A%';
explain format = tree SELECT * FROM testhash WHERE lname = 'Alexander';


CREATE Table full_t as SELECT first_name , last_name from hr.employees;
ALTER Table full_t add fulltext(first_name, last_name);

EXPLAIN FORMAT = tree SELECT * from full_t WHERE match(first_name, last_name) AGAINST ("Alexander%");

SHOW INDEXES from full_t;


-- practice 11

-- print list of employees displaying 'good sal' if sal>3000 
--                                    'Avg sal' if sal = 3000
--                                    else poor sal if sal < 3000;

EXPLAIN FORMAT = tree
SELECT hiredate,
case 
    WHEN sal > 3000 then 'Good sal'
    WHEN sal < 3000 then 'Poor sal'
    WHEN sal = 3000 THEN 'Avg sal'
END
 FROM emp 
 WHERE deptno = 100;
SHOW INDEXES from emp;


-- practice 1k

explain format = tree SELECT ename, sal, sal*1.5 newsal 
from emp
WHERE sal*1.5 > 3000;

explain format = tree SELECT ename, sal, sal*1.5 newsal 
from emp
WHERE sal > 3000/1.5;

SHOW INDEXES from check_extent;

CREATE INDEX sal_indx on check_extent(sal);

explain format = tree SELECT ename, sal, sal*1.5 newsal 
from check_extent
WHERE sal*1.5 > 3000;

explain format = tree SELECT ename, sal, sal*1.5 newsal 
from check_extent FORCE INDEX(sal_indx)
WHERE sal > 3000/1.5;



-- profilling

SELECT @@profiling;
set profiling = 1;
SELECT @@profiling;

SELECT * 
FROM hr.regions;

SELECT COUNT(*) from check_extent;

SELECT * 
FROM compo_range_hash 
WHERE sal = 3000;

SHOW PROFILES;

SHOW PROFILE for query 10;

set @@profiling = 0;


SELECT TIME(':3');
