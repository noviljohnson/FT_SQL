-- Active: 1671700995648@@127.0.0.1@3308@ft_db


--  CTE
--  common table expressions

-- uses WITH

WITH cte
as 
(SELECT * from emp)
SELECT ename FROM cte;

WITH c
as 
(SELECT * from emp)
SELECT ename FROM c;

with cte_1
AS
(SELECT avg(sal) avgsal, deptno from emp GROUP BY `DEPTNO`)
SELECT e.ename, e.sal, e.deptno, cte_1.avgsal
from emp e join cte_1
on e.deptno=cte_1.deptno
and e.sal>cte_1.avgsal;


SELECT * from emp;

SELECT x.ename, y.ename 
from emp x, emp y
WHERE x.mgr = y.empno;


SELECT COUNT(*) 
FROM emp;

SELECT e.ename, e.deptno, COUNT(*) over(PARTITION BY e.deptno) ecnt, e.mgr mgr, m.DEPTNO, COUNT(*) OVER(PARTITION BY m.DEPTNO)
from emp e, emp m
WHERE e.mgr = m.empno;


-- recursive cte
WITH RECURSIVE cte_2
as (
    SELECT 1 "n"
    UNION ALL
    SELECT n+1 from cte_2 WHERE cte_2.n<=30
)
SELECT * FROM cte_2;

WITH RECURSIVE cte_calndr
as (
    SELECT '2023-01-01' d
    UNION ALL
    SELECT DATE_ADD(d,INTERVAL 1 day) from cte_calndr WHERE cte_calndr.d<'2023-01-31'
)
SELECT * FROM cte_calndr;