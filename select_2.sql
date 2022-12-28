-- Active: 1671700995648@@127.0.0.1@3308@ft_db
-- Control functions
-- 
-- If
-- Case
-- Nullif
-- Ifnull

-- IF
SELECT ename,sal "original sal", if(sal>1000, sal+300,sal+400) 'new sal' from emp;
SELECT ename,sal,comm, if (comm,1,3) from emp;

-- Case
SELECT ename,sal,job, (CASE WHEN job = 'clerk' THEN 1.5 * sal
                            When job = 'salesman' then 2.0*sal
                            when job = 'analyst' then 1.76*sal
                            else sal
                            END) "bonus"
    from emp
    ORDER BY 3;

SELECT ename,sal,job, (CASE `JOB`
                            WHEN  'clerk' THEN 1.5 * sal
                            When  'salesman' then 2.0*sal
                            when  'analyst' then 1.76*sal
                            else sal
                            END) "bonus"
    from emp
    ORDER BY 3;


SELECT CASE CURDATE()
        WHEN '2022-12-28' THEN REPEAT(" H B D ",5)
        WHEN '2022-12-27' THEN REPEAT(" B hbd",2 )
        WHEN '2022-12-29' THEN " adv hbd"
        else "gone"
        end;

-- nullif
SET @n = 123, @o=324, @v=123;

SELECT NULLIF(@n,@v);
SELECT ename,LENGTH(ename), sal, LENGTH(sal), NULLIF(LENGTH(ename),LENGTH(sal)) 'nullif' from emp order BY 2;

-- ifnull
SELECT ename,sal,comm,comm+sal from emp;

SELECT ename,sal,comm,comm+sal, IFNULL((sal+comm), sal) from emp;

--  STR_TO_DATE()
SELECT STR_TO_DATE("9-jun-1998","%d-%M-%y"), STR_TO_DATE("9-6-1198","%d-%m-%y"), STR_TO_DATE("9-6-1998","%d-%m-%Y");




-- aggrigate FUNCTION

set @@sql_mode = "only_full_group_by";



SELECT count(comm) from emp;
SELECT count(*) from emp;

SELECT count(hiredate), count(sal), count(ename), count(comm) from emp;

SELECT COUNT(empno) from emp where job='clerk';

SELECT avg(comm),sum(comm),sum(comm)/COUNT(comm) from emp;
SELECT comm from emp;

SELECT min(sal),min(hiredate),max(ename) from emp;
SELECT sum(sal),avg(sal), sum(sal)/count(*) from emp;

SELECT sum(sal), deptno,job from emp GROUP BY `DEPTNO`,job;

SELECT count(ename), YEAR(hiredate), QUARTER(hiredate) from emp GROUp BY YEAR(`HIREDATE`),QUARTER(`HIREDATE`);

SELECT COUNT(*), MONTHNAME(`HIREDATE`) from emp GROUP BY MONTHNAME(`HIREDATE`) ORDER BY MONTHNAME(`HIREDATE`);

SELECT * from emp;

SELECT job, CASE job  
        WHEN 'clerk' THEN CONCAT("clerks ",count(*))
        WHEN 'salesman' THEN CONCAT("salesman max sal ",max(sal))
        WHEN 'analyst' THEN CONCAT("salesman total sal ", sum(sal))
        else CONCAT(" avg sal ", avg(sal))
        end
FROM emp
GROUP BY job;

-- having
SELECT COUNT(*),sal from emp group by sal HAVING COUNT(*) > 1;

SELECT avg(sal), deptno from emp GROUP BY deptno HAVING COUNT(*) >=5;

SELECT job,max(sal) FROM emp GROUP BY job HAVING max(sal) >= 3000;
SELECT * from emp;
SELECT SUM(sal), max(sal), min(sal), avg(sal),job,`DEPTNO` from emp GROUP BY job,`DEPTNO` HAVING `DEPTNO`= 20 and avg(sal) > 1000;

SELECT sum(sal), count(*), avg(sal), max(sal), min(sal), deptno, job
from emp 
where deptno=20
GROUP BY deptno, `JOB`
having avg(sal)>1000
ORDER BY 2;


select MAX(COUNT(*)) from emp GROUP BY `DEPTNO`;