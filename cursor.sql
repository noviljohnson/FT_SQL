-- Active: 1671700995648@@127.0.0.1@3308@hr

-- cursor

-- declare
-- open
-- fetch
-- close

DELIMITER //

CREATE PROCEDURE pro_cursor(pno int)
BEGIN
    DECLARE v1 NUMERIC(11,2);
    DECLARE v2 VARCHAR(20);
    declare emp_cur CURSOR for SELECT ename,sal from emp WHERE deptno= 10;
    declare CONTINUE HANDLER for not found set cur = 1;
    OPEN emp_cur;
        getcur: LOOP
            FETCH emp_cur INTO v2,v1;
            if cur=1 then
                leave getcur;
            end if;
            SELECT concat("sal = ", v1, ", ", " ename = ", v2);
        end loop;
    CLOSE emp_cur;
END //

DELIMITER ;
-- DROP PROCEDURE pro_cursor;

-- use ft_db;
CALL pro_cursor(1);


