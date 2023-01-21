-- Active: 1671700995648@@127.0.0.1@3308@hr


-- Assignment 5

-- Q1

CREATE Table person(slno int, name VARCHAR(20), place VARCHAR(20), dob date);
INSERT INTO person VALUES(1002,'HITESH','DELHI', '2000-05-01'),
                        (1001,'RITESH','MUMBHAI', '1998-07-12'),
                        (1005,'BALAN','KOCHI', '1999-11-05');

-- Q1.a
select tablespace_name, file_name from information_schema.files limit 10;

-- Q1.b
SELECT * FROM person WHERE slno=1001;

-- Q1.c
explain SELECT * FROM person WHERE slno=1001;
explain format = tree SELECT * FROM person WHERE slno=1001;

-- Q1.d
CREATE INDEX slno_indx on person(slno);
explain SELECT * FROM person WHERE slno=1001;
explain format = tree SELECT * FROM person WHERE slno=1001;

-- Q1.e
ALTER Table person ADD constraint pk_slno_person PRIMARY KEY person(slno);
explain SELECT * FROM person WHERE slno=1001;
explain format = tree SELECT * FROM person WHERE slno=1001;

-- Q1.f
    /*

    c. As there is no index or a PRIMARY KEY table scan happend;
    d. Here we have index on column slno which is WHERE clause so  index lockup happend;
    e. as slno is a primary key so there will only one row corresponding to the value given for slno, so rows fetched beofre execution; 
    */



-- Assignment 5


-- Q2

-- a
SELECT * from regions;
SELECT * from countries;
SELECT * FROM locations;

SELECT l.city, r.region_name, c.country_name, l.location_id 
FROM countries c 
NATURAL JOIN regions r
NATURAL JOIN locations l
WHERE c.country_name in ('BRAZIL',"INDIA");


EXPLAIN SELECT l.city, r.region_name, c.country_name, l.location_id 
FROM countries c 
NATURAL JOIN regions r
NATURAL JOIN locations l
WHERE c.country_name in ('BRAZIL',"INDIA");

EXPLAIN format = tree SELECT l.city, r.region_name, c.country_name, l.location_id 
FROM countries c 
NATURAL JOIN regions r
NATURAL JOIN locations l
WHERE c.country_name in ('BRAZIL',"INDIA");


-- Q2.b
CREATE INDEX cname_indx on countries(country_name);

EXPLAIN format = tree SELECT l.city, r.region_name, c.country_name, l.location_id 
FROM countries c 
NATURAL JOIN regions r
NATURAL JOIN locations l
WHERE c.country_name in ('BRAZIL',"INDIA");



-- Q2.c

CREATE Table sal_part(empno int ,
                        ename VARCHAR(20),
                        sal INT)
    partition by range(sal)
    (
        partition p_5000 values less than (5000),
        partition p_10000 values less than (10000),
        partition p_15000 values less than (15000),
        partition p_20000 values less than (20000),
        partition p_25000 values less than (25000),
        partition p_30000 values less than (30000)
    );
INSERT INTO sal_part SELECT employee_id,first_name,salary from employees;


-- Q2.d

EXPLAIN
SELECT empno, ename, sal 
from sal_part
WHERE sal BETWEEN 12000 and 17000;
-- p_15000, p_20000 are being used

-- Q2.e

EXPLAIN FORMAT = tree
SELECT empno, ename, sal 
from sal_part
WHERE sal BETWEEN 12000 and 17000;

-- Q2.f

EXPLAIN FORMAT = tree
SELECT employee_id, first_name, salary 
from employees
WHERE salary BETWEEN 12000 and 17000;


-- Q2.g

    /*

    e. Filter: (sal_part.sal between 12000 and 17000)  (cost=2.30 rows=2)
        -> Table scan on sal_part  (cost=2.30 rows=18)

    - as there are partions the rows in the corresponding PARTITIONS being used
    - so the cost is less  - 2.30  and no of rows are 18


    f. Filter: (employees.salary between 12000 and 17000)  (cost=10.95 rows=12)
        -> Table scan on employees  (cost=10.95 rows=107)

    - as we are using an unindexed COLUMN in WHERE clause full table scan is being implimented
    - so the cost is high when compared to PARTITION table

    */

