use ft_db;

select * from emp where sal = (select  max(sal) from emp);

select ename from emp where sal in ( select max(sal) from emp group by deptno);

select ename from emp e1 where sal = ( select max(sal) from emp e2 group by deptno);

create table t1(c1 char(1));
create table t2(c2 char(1));

insert into t1 values("A");
insert into t1 values("A");
insert into t1 values("C");
insert into t1 values("B");
insert into t2 values("A");
insert into t2 values("B");
insert into t2 values("B");
insert into t2 values("D");
insert into t1 values("A");

select c1,c2 from t1 join t2 on c1=c2;

select c1,t1.rowid, c2, t2.rowid from t1 join t2 on c1=c2; 


select round(343.23,-1) from dual;