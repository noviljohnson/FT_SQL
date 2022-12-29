-- Active: 1671700995648@@127.0.0.1@3308@ft_db

-- set operators

-- Union
-- Union ALL
-- Intersection (8.0.31 version)

SELECT distinct(job) from emp WHERE `DEPTNO` in (10,20);

SELECT job from emp WHERE deptno=10 
UNION
SELECT job from emp WHERE `DEPTNO`=20;

SELECT job from emp WHERE deptno=10 
UNION ALL
SELECT job from emp WHERE `DEPTNO`=20;

SELECT job from emp WHERE deptno=10 
INTERSECT
SELECT job from emp WHERE `DEPTNO`=20;

SELECT job from emp WHERE deptno=10 
INTERSECT
SELECT job from emp WHERE `DEPTNO`=20
INTERSECT
SELECT job from emp WHERE deptno=30 ;

-- find out total salary for each job as well total salary
SELECT sum(sal) from emp GROUP BY job 
UNION
SELECT sum(sal) from emp;

SELECT sum(sal),`JOB` from emp GROUP BY job 
UNION
SELECT sum(sal),NULL from emp;

SELECT ename, null "dname" from emp
UNION
SELECT null, dname from dept;


SELECT sum(sal),job
from emp
GROUP BY job with ROLLUP;

SELECT sum(sal),job,`DEPTNO`
from emp
GROUP BY job,`DEPTNO` with ROLLUP;

SELECT sum(sal),`DEPTNO`,`JOB`
from emp
GROUP BY `DEPTNO`,`JOB` with ROLLUP;

SELECT sum(sal),`JOB`,`DEPTNO`
from emp
GROUP BY `JOB`,`DEPTNO` WITH ROLLUP;

-- CUBE

SELECT sum(sal),deptno, job
from emp
GROUP BY `DEPTNO`,`JOB` WITH ROLLUP
UNION
SELECT sum(sal), `DEPTNO`,`JOB`
from emp
GROUP BY job, `DEPTNO` WITH ROLLUP;


SELECT ename,null "dname" from emp
UNION
SELECT null, dname from dept
ORDER BY dname;

SELECT sum(sal), deptno,job
from emp
GROUP BY `DEPTNO`,job with ROLLUP
UNION
SELECT sum(sal),`DEPTNO`,`JOB`
from emp
GROUP BY job,`DEPTNO` WITH ROLLUP;



-- JOINS

SELECT e.ename, d.dname from emp e INNER JOIN dept d ON e.`DEPTNO`=d.`DEPTNO`;

SELECT e.ename, d.dname from emp e INNER JOIN dept d ON e.`DEPTNO`=d.`DEPTNO` and d.`DNAME`="SALES";
SELECT e.ename, d.dname from emp e INNER JOIN dept d ON e.`DEPTNO`=d.`DEPTNO` WHERE d.`DNAME` = "Sales";
SELECT e.ename, d.dname from emp e INNER JOIN dept d ON e.`DEPTNO`=d.`DEPTNO` WHERE d.`DNAME` = "sales" ORDER BY e.`ENAME`;

-- find out total salary in sales, accounting department

SELECT SUM(e.sal), d.`DNAME` from emp e INNER JOIN dept d ON e.`DEPTNO`=d.`DEPTNO` WHERE d.`DNAME` in("accounting","sales")  GROUP BY d.`DNAME`;

SELECT e.ename,e.job,d.`LOC` from emp e INNER JOIN dept d on e.`DEPTNO`=d.`DEPTNO` WHERE d.`LOC`='Chicago'and e.`JOB`='clerk';

SELECT * from emp e INNER JOIN dept d on e.`DEPTNO`=d.`DEPTNO`;


-- outer JOIN

SELECT e.ename, e.job, d.loc from emp e right OUTER JOIN dept d on e.`DEPTNO` = d.`DEPTNO`;

SELECT e.ename, d.dname from emp e RIGHT OUTER JOIN dept d on e.`DEPTNO`=d.`DEPTNO` 
UNION
SELECT e.ename,d.`DNAME` FROM emp e LEFT OUTER JOIN dept d on e.`DEPTNO`=d.`DEPTNO`;


-- non equi JOIN
SELECT e.ename,s.grade from emp e join salgrade s on e.sal BETWEEN s.`LOSAL` and s.`HISAL`;

SELECT e.ename,d.dname,s.grade from dept d INNER JOIN emp e on e.`DEPTNO`=d.`DEPTNO` INNER JOIN salgrade s on e.sal BETWEEN s.`LOSAL` and s.`HISAL`;


create table job_grades
(grade_level char(1),
 lowest_sal numeric(11,2),
 high_sal numeric(11,2));

insert into job_grades
values ("A",1000,2999),
("B",3000,5999),
("C",6000,9999),
 ("D",10000,14999),
 ("E",15000,24999),
 ("F",25000,40000);



SELECT e.job,e.`ENAME` from emp e WHERE QUARTER(hiredate) >2 and job in (
        SELECT m.job FROM emp m WHERE QUARTER(m.hiredate) < 3 and YEAR(m.hiredate) = YEAR(e.hiredate)+1 );
SELECT * from emp;


--  same `SAL`
SELECT DISTINCT(sal) from emp;

SELECT e.ename, e.sal 
FROM emp e, emp m
WHERE e.empno != m.empno and e.sal=m.sal
GROUP BY e.sal,e.`ENAME`;
HAVING COUNT(*) > 1;


SELECT *
FROM emp e INNER JOIN emp m on e.`EMPNO` != m.`EMPNO` and e.sal = m.`SAL`;
WHERE e.empno != m.empno and e.sal=m.sal;

SELECT ename, sal from emp
WHERE sal in (SELECT sal from emp
                GROUP BY sal
                HAVING COUNT(empno) > 1);