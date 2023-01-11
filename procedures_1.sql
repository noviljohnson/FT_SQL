-- Active: 1671700995648@@127.0.0.1@3308@hr

-- delimiter $$
-- create PROCEDURE <PROCEDURE NAME> ()
-- begin
-- 
-- end


DELIMITER //

CREATE PROCEDURE pro_1()
BEGIN 
    SELECT ("HI NOVIL");
END //

DELIMITER ;
CALL pro_1();


DELIMITER //

CREATE PROCEDURE pro_hr(p1 int, p2 int)
BEGIN
    DECLARE vprod NUMERIC(11,2);
    set vprod = p1*p2;
    SELECT concat("product of ", p1, ", ", p1, " = ", vprod) as product;
end //

DELIMITER ;
CALL pro_hr(9,90);

-- create a procedure to pass employee_id as parameter and print salary for him;
DELIMITER //
CREATE PROCEDURE pro_sal(p_empno int)
BEGIN
    DECLARE emp_sal NUMERIC(10,2) DEFAULT 0;
    SET emp_sal = 
        (SELECT salary 
        FROM employees
        WHERE employee_id = p_empno);
END //
DELIMITER ;

CALL pro_sal(100);

-- create a procedure to pass employee_id as parameter and print first name last name for him;
DELIMITER //
CREATE PROCEDURE pro_ename(p_empno int)
BEGIN
    SELECT first_name, last_name
    FROM employees
    WHERE employee_id = p_empno;
END //

DELIMITER ;
CALL pro_ename(100);
SELECT * from employees;



-- create a Procedure to inser more rows in stages using a loop and if elseif else 
-- using while loop

CREATE Table odd_even(slno int PRIMARY KEY, descn VARCHAR(4)
    check(descn in('odd','even')));

DELIMITER //
CREATE PROCEDURE oe_insert(p1 int, p2 int)
BEGIN 
    DECLARE v1 VARCHAR(4);
    WHILE p1<p2 DO
        -- SET P1=p1+1;
        IF MOD(p1,2) = 0 THEN
            SET v1='even';
        ELSE
            SET v1='odd';
        END if;
        INSERT into odd_even VALUES(p1,v1);
        SET P1=p1+1;
    END WHILE;
END //
DELIMITER ;

CALL oe_insert(1,100);
SELECT * from odd_even;
CALL oe_insert(100,1000);
CALL oe_insert(1000,4000);
CALL oe_insert(4000,8000);
CALL oe_insert(8000,10001);


-- create a PROCEDURE to pass ur bday as parameter print day of birth starting from birthdate upto current_date;
CREATE TABLE bday_to_curday(dates date, day_name VARCHAR(10));

DELIMITER //

CREATE PROCEDURE pro_bday_to_curdate(bday DATE)
BEGIN
    while year(bday) <= year(CURDATE()) DO
        INSERT INTO bday_to_curday values(bday,DAYNAME(bday));
        set bday = DATE_ADD(bday,INTERVAL 1 YEAR);
    END while;
END //

DELIMITER ;
CALL pro_bday_to_curdate('2000-02-08');

SELECT * FROM bday_to_curday;

SELECT SPECIFIC_name, routine_type
FROM information_schema.`ROUTINES`
WHERE `ROUTINE_SCHEMA`='hr';
SHOW CREATE PROCEDURE pro_hr;


-- Signals

DELIMITER //
CREATE PROCEDURE pro_signal(p_empno int)
BEGIN
    declare v1 NUMERIC(11,2);
    SELECT salary into v1
    FROM employees
    WHERE employee_id = p_empno;
    if v1 is null then
        SIGNAL SQLSTATE '45000' set MESSAGE_TEXT='**INVALID EMPNO**';
    end IF;
    SELECT v1;
END //

DELIMITER ;
CALL pro_signal(13200);
DROP PROCEDURE pro_signal;


-- inout vars
DELIMITER //

CREATE PROCEDURE pro_inout(in p1 int, out p2 VARCHAR(20))
BEGIN
    SELECT first_name into p2
    FROM employees
    WHERE employee_id = p1;
END //

DELIMITER ;

CALL pro_inout(104,@name);
SELECT @name;


DELIMITER //

CREATE PROCEDURE pro_inout2(inout pname VARCHAR(20))
BEGIN
    Set pname=lpad(pname, 15, "*");
END //

DELIMITER ;

set @name="ram";
CALL pro_inout2(@name);
SELECT @name;