-- Active: 1671700995648@@127.0.0.1@3308@ft_db

-- Q1

-- CREATE TABLE bday as
WITH RECURSIVE cte_bday
as (
    SELECT '1999-08-02' d
    UNION ALL
    SELECT DATE_ADD(d,INTERVAL 1 YEAR) FROM cte_bday WHERE DATE_ADD(d,INTERVAL 1 year)<(CURDATE())
)
SELECT d, DAYNAME(d) FROM cte_bday;

SELECT * FROM bday;





-- Q2

-- a
SELECT ename, sal, RANK() OVER(ORDER BY sal) 'rank', DENSE_RANK() OVER(ORDER BY sal) "dense_rank"
from emp;

-- b
SELECT ename, sal, LEAD(sal) OVER(ORDER BY sal), LAG(sal) OVER(ORDER BY sal)
FROM emp;

-- c
SELECT ename, sal, deptno, max(sal) OVER(PARTITION BY deptno) "max sal for each dept"
FROM emp;

-- d

WITH cte
as (
    SELECT MAX(hiredate)
    FROM emp
)
SELECT ename,deptno,`HIREDATE`
FROM emp
WHERE `HIREDATE` in (select * from cte) and job = 'CLERK'
;


