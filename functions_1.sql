-- Active: 1671700995648@@127.0.0.1@3308@hr

-- Functions

-- Create a FUNCTION to pass employee_id as parameter
-- bonus
-- sh_clerk 1.5*salary,sa_rep 1.75*salary, mk_man 2.0*salary OTHERS salary

DELIMITER //

CREATE Function fun_emp_sal(p1 INT)
RETURNS NUMERIC(11,2) DETERMINISTIC
BEGIN
    DECLARE v1 NUMERIC(11,2);
    DECLARE v2 NUMERIC(11,2);
    DECLARE v3 VARCHAR(20);
    
    SELECT job_id, salary INTO v3,v1 from employees WHERE employee_id=p1;

    if v3='SH_CLERK' THEN
        SET v2=1.5*v1;
    ELSEIF v3='SA_REP' THEN
        SET v2 = 1.75*v1; 
    ELSEIF v3='MK_MAN' THEN
        SET v2=2.0*v1;
    ELSE
        SET v2=v1;
    END IF;
    RETURN v2;
END //

DELIMITER ;

SELECT employee_id, fun_emp_sal(employee_id)
FROM employees;
SELECT * from employees;


-- create a function to pass employee_id as parameter and return and joined in leap year or NOT

DELIMITER //

CREATE Function fun_emp_leap(p1 DATE)
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE v1 DATE;
    DECLARE v2 VARCHAR(20);
    
    -- SELECT INTO v3,v1 from employees WHERE employee_id=p1;

    if DATE_FORMAT(CONCAT(YEAR(p1),'-12-31'), '%j') > 365 THEN
        SET v2="Leap Year";
    ELSE
        SET v2="NON Leap YEAR";
    END IF;

    RETURN v2;
END //

DELIMITER ;

SELECT employee_id, first_name, fun_emp_leap(hire_date)
FROM employees;


-- TASK
-- employee gets a joining bonus
-- criteria
-- on or before 15 of a month will be paid joining bonus
-- on the last friday after 1 YEAR




-- Triggers

-- create a TRIGGER to INSERT into retired TABLE
-- whenever DELETE happens on employees table

SHOW create table employees;

-- CREATE TABLE `retired` (
--   `employee_id` int unsigned NOT NULL,
--   `first_name` varchar(20) DEFAULT NULL,
--   `last_name` varchar(25) NOT NULL,
--   `email` varchar(25) NOT NULL,
--   `phone_number` varchar(20) DEFAULT NULL,
--   `hire_date` date NOT NULL,
--   `job_id` varchar(10) NOT NULL,
--   `salary` decimal(8,2) NOT NULL,
--   `commission_pct` decimal(2,2) DEFAULT NULL,
--   `manager_id` int unsigned DEFAULT NULL,
--   `department_id` int unsigned DEFAULT NULL,
--   PRIMARY KEY (`employee_id`)
-- );

CREATE table retired as select first_name from employees where 1=2;

CREATE table emp_dummy as select * from employees ;

SHOW CREATE TABLE retired;

DELIMITER //
create trigger trig_retired
before delete on emp_dummy
for each row 
begin
	insert into retired values(old.first_name);
end //
delimiter ;

delete from emp_dummy where employee_id = 105;

select * from retired;
SELECT * FROM emp_dummy;

DROP Trigger trig_retired;


-- check constraint using CURDATE()

CREATE Table date_table(slno int PRIMARY KEY,
                        date1 DATE);

DELIMITER //
CREATE Trigger trg_chk
    BEFORE INSERT on date_table
    for each ROW
    BEGIN
        if  new.date1 > curdate() THEN
            SIGNAL SQLSTATE '45000' set MESSAGE_TEXT="****date1 < currdate()****";
        END IF;
    END//

DELIMITER ;

INSERT INTO date_table VALUES(1,'2023-01-31');

-- create a TRIGGER to prevent reduction of salary

DELIMITER //

CREATE TRIGGER trg_salred
    BEFORE UPDATE on emp_dummy
    FOR EACH ROW
    BEGIN
        if new.salary<old.salary THEN
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT="**** u can't do this/ i want hike ****";
        END IF;
    END //

DELIMITER ;

UPDATE emp_dummy SET salary=salary-100;


-- balance update

CREATE Table account( accno int PRIMARY KEY,
                        name VARCHAR(20),
                        balance numeric(11,2));

CREATE Table trans( accno int,
                        wd numeric(11,2),
                        dep numeric(11,2),
                        Foreign Key (accno) REFERENCES account(accno));

-- CREATE a TRIGGER to UPDATE balance in account table whenever wd(withdrawal), dep(deposit) happens on trans table;

INSERT INTO `account` VALUES(100,"Novil",90000), (101,"Johnson", 34500), (103, "Razz",100000);

DELIMITER //

CREATE TRIGGER trg_accbal
    BEFORE INSERT on trans
    FOR EACH ROW
    BEGIN
        if new.dep is not null THEN
            update account set
                balance = balance+new.dep WHERE accno = new.accno;
            else
                update account set balance=balance-new.wd WHERE accno=new.accno;
        END IF;
    END //

DELIMITER ;

drop TRIGGER trg_accbal;
INSERT INTO trans VALUES(100,100,1000), (101,1000, 3500), (103, 1000,10000);
SELECT * FROM trans;
SELECT * FROM `account`;

-- UPDATE `account` SET balance =((SELECT balance FROM `account` WHERE accno = 100)- 1000000) WHERE accno = 100;
