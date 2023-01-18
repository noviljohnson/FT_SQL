-- Active: 1671700995648@@127.0.0.1@3308@ft_db


-- range PARTITION
CREATE Table range_part(empno int ,
                        ename VARCHAR(20),
                        sal INT)
    partition by range(sal)
    (
        partition p_1000 values less than (1000),
        partition p_2000 values less than (2000),
        partition p_3000 values less than (3000),
        partition p_4000 values less than (4000),
        partition p_5000 values less than (5000),
        partition p_6000 values less than (6000)
    );

INSERT INTO range_part SELECT empno,ename,sal from check_extent;

EXPLAIN SELECT * from range_part WHERE sal=3000;
EXPLAIN FORMAT = tree SELECT * from range_part WHERE sal=3000;

EXPLAIN SELECT * from range_part WHERE sal BETWEEN 2000 and 3000;


CREATE Table hdate_part(empno int ,
                        ename VARCHAR(20),
                        sal INT,
                        hiredate DATE)
    partition by range(year(hiredate))
    (
        partition p_1980 values less than (1981),
        partition p_1981 values less than (1982),
        partition p_1982 values less than (1983),
        partition p_1987 values less than (1988),
        partition p_2000 values less than (2000)
    );

INSERT INTO hdate_part SELECT empno,ename,sal,hiredate from check_extent;
-- DROP Table hdate_part;
EXPLAIN SELECT * from hdate_part WHERE hiredate=1982;
EXPLAIN SELECT * from hdate_part WHERE year(hiredate)=1982;

EXPLAIN SELECT * from hdate_part WHERE hiredate BETWEEN DATE_FORMAT("1984-00-00", "%Y-%m-%d") AND DATE_FORMAT("1987-00-00","%Y-%m-%d");

SELECT YEAR(hiredate) from check_extent LIMIT 1;

SELECT max(year(hiredate)) FROM hdate_part PARTITION (p_1987);


-- hash PARTITION 

CREATE Table hash_emp(empno int PRIMARY KEY,
                        ename VARCHAR(20),
                        sal FLOAT(11,2))
    partition by hash(empno)
    partitions 4;

INSERT INTO hash_emp SELECT empno, ename, sal from check_extent;

SELECT PARTITION_name, PARTITION_ordinal_position, table_rows
FROM information_schema.`PARTITIONS` WHERE table_name='RANGE_PART';


--  TEMPORARY TABLE

CREATE TEMPORARY TABLE temp_1(sal FLOAT);
INSERT INTO temp_1 SELECT sal FROM emp;
SELECT * FROM temp_1;
SHOW tables;