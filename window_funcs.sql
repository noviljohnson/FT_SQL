-- Active: 1671700995648@@127.0.0.1@3308@ft_db

-- use ft_db

--  WINDOW FUNCTIONs

SELECT count(*) over(), ename FROM emp;

SELECT min(sal) over() "minsal", max(sal) over() "maxsal", sum(sal) over() "totalsal", avg(sal) over() "avgsal",
    count(empno) over() "cnt" 
from emp;


SELECT * from emp;


SELECT ename, sal + ifnull((SELECT sum(sal) 
                    from emp x
                    WHERE x.`EMPNO` < e.`EMPNO` 
                    ORDER BY x.`EMPNO`),0)
from emp e 
ORDER BY `EMPNO`;

SELECT sum(sal) from emp;

-- using WINDOW FUNCTION
SELECT ename, sal, sum(sal) over(order by sal) "runsal"
FROM emp;


-- ranking functions

-- row NUMBER
SELECT ename, sal, ROW_NUMBER() over() "rank" from emp;

SELECT ename, sal, ROW_NUMBER() over(order by sal desc) "rank" from emp;
-- rank
SELECT ename, sal, ROW_NUMBER() over(order by sal desc) "rank",
rank() over(order by sal desc) "rank"
 from emp;

-- DENSE_RANK
SELECT ename, sal, ROW_NUMBER() over(order by sal desc) "rank", rank() OVER(ORDER BY sal desc) 'rank',
dense_rank() over(order by sal desc) "denserank"
 from emp;


-- Lag and LEAD

SELECT ename, sal, LAG(sal) OVER() from emp;

SELECT ename, sal, LAG(sal) over() 'lagsal', LEAD(sal) over() 'leadsal' from emp;

SELECT ename, `HIREDATE`, lag(`HIREDATE`) over() 'lag date', lead(`HIREDATE`) over() "lead date" from emp; 
SELECT ename, sal, LAG(sal) over() 'lagsal', LAG(sal,2) over() 'lagsal by 2' from emp;

SELECT ename, `HIREDATE`, lead(`HIREDATE`) over() 'lead date', lead(`HIREDATE`,13) over() "lead date by 2" from emp;


-- find the # of days difference between 1st analyst and 2nd analyst;
SELECT `HIREDATE`,lead(`HIREDATE`) over(), DATEDIFF(Lead(`HIREDATE`) over(),`HIREDATE`) FROM emp 
where job = "ANALYST";

SELECT `HIREDATE`,lead(`HIREDATE`) over(), TIMESTAMPDIFF(day,Lead(`HIREDATE`) over(),`HIREDATE`) FROM emp LIMIT 1;


-- first_value
SELECT ename, sal, FIRST_VALUE(sal) over(order by sal) '1st'
FROM emp;
SELECT min(sal) over(order by sal), sal
FROM emp;

SELECT ename, sal, FIRST_VALUE(sal) over(order by sal desc) "lst"
FROM emp;
SELECT ename,sal,max(sal) over()
FROM emp;


-- NTH_VALUE
SELECT ename, sal, NTH_VALUE(sal,2) over(order by sal desc) "2nd highsal" from emp;

-- SELECT ename, sal,max(SELECT distinct NTH_VALUE(sal,2) over(ORDER BY sal desc) from emp) from emp;
-- SELECT distinct NTH_VALUE(sal,2) over(ORDER BY sal desc) from emp;



-- last_value
-- range BETWEEN unbounded preceding and UNBOUNDED FOLLOWING

SELECT ename, sal, LAST_VALUE(sal) over(range BETWEEN UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING) "last_value"
FROM emp;

SELECT ename, sal, LAST_VALUE(sal) over(range BETWEEN UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING) "last_value"
FROM emp
ORDER BY sal DESC;


-- partition by 

SELECT ename, sal, sum(sal) over(PARTITION BY deptno) 'totalsal', deptno
from emp;


-- ntile()
SELECT NTILE(3) over(order by deptno) as "ntile", ename, deptno from emp;


-- rows
SELECT ename, sal, last_value(sal) over(rows between unbounded PRECEDING and CURRENT row) "values"
from emp;

SELECT ename, sal, last_value(sal) over(rows between CURRENT row and UNBOUNDED FOLLOWING) "values"
from emp;


-- window order by
SELECT ename, hiredate, FIRST_VALUE(hiredate) over w "1st",
    LAST_VALUE(hiredate) over w "last",
    NTH_VALUE(hiredate,5) over w '5th'
    FROM emp
    WINDOW w as (order BY `HIREDATE`);


with dc as (SELECT deptno, count(*) cnt from emp GROUP BY deptno)
SELECT e.ename "emp", e.deptno "edep", m.ename "manager", m.deptno "mdep", dc1.cnt "empcount", dc2.cnt "mngmnt" 
FROM emp e join emp m on e.mgr=m.empno
    JOIN dc dc1 on e.deptno=dc1.deptno
    JOIN dc dc2 on m.deptno = dc2.deptno;
    