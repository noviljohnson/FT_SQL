-- Active: 1671700995648@@127.0.0.1@3308@org

-- # Stored PROCEDURE
DELIMITER //

CREATE PROCEDURE jobs_pro()
BEGIN
    SELECT * FROM jobs LIMIT 1;
    SELECT * FROM jobs LIMIT 1,1;
END //

DELIMITER ;
SHOW PROCEDURE STATUS LIKE 'jobs_pro';
SHOW CREATE PROCEDURE jobs_pro;
CALL jobs_pro;
CALL jobs_pro;

-- DELIMITER //
CREATE Procedure getJobByCountry(IN countryName VARCHAR(255))
BEGIN
    SELECT *
    FROM jobs
    WHERE ;
END //
DESCRIBE countries;
SHOW tables;




--  DISCUSSION 10
-- https://github.com/akash-coded/mysql/discussions/10
-- use classicmodels
USE classicmodels;
-- Q1 Create a stored procedure named getEmployees() to display the following employee and their office info: name, city, state, and country.

DELIMITER //

CREATE PROCEDURE getEmployees()
BEGIN
    SELECT concat(e.firstName,e.lastName), city, state, country
    FROM employees e, offices o
    WHERE e.`officeCode` = o.`officeCode` ;
END //

DELIMITER ;
CALL getEmployees();

DROP PROCEDURE getEmployees;

SELECT * from offices
WHERE state is NULL;

SELECT * 
FROM employees e, offices o
WHERE e.`officeCode`=o.`officeCode` and o.state is NULL;


--  Q2 Create a stored procedure named getPayments() that prints the following customer and payment info:customerName, checkNumber, paymentDate, and amount.

DELIMITER //
CREATE Procedure getPayments()
BEGIN
    SELECT c.customerName, p.checkNumber, p.paymentDate, p.amount
    FROM customers c, payments p
    WHERE c.`customerNumber` = p.`customerNumber`;
END //
DELIMITER ;

CALL getPayments;

SELECT COUNT(*) FROM customers;



-- DISCUSSION 13
-- https://github.com/akash-coded/mysql/discussions/13
-- USE ORG db 

USE org;
--  Q1 Write a stored function called computeTax that calculates income tax based on the salary for every worker in the Worker table as follows:
-- 10% - salary <= 75000
-- 20% - 75000 < salary <= 150000
-- 30% - salary > 150000
-- Write a query that displays all the details of a worker including their computedTax.

DELIMITER //

CREATE FUNCTION computeTax(
    sal DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    declare tax DECIMAL(10,2);

    if sal <= 75000 then 
        set tax = 0.1 * sal;
    elseif (sal > 75000 and sal <= 150000) then
        set tax = 0.2 * sal;
    else
        set tax = 0.3 * sal;
    end if;

    return tax;
END //

DELIMITER ;

SELECT *,computeTax(salary) 
FROM worker;



-- Q2 Define a stored procedure that takes a salary as input and returns the calculated income tax amount for the input salary. 
-- Print the computed tax for an input salary from a calling program. (Hint - Use the computeTax stored function inside the stored procedure)

DELIMITER //

CREATE PROCEDURE calTax(
    IN sal DECIMAL(10,2),
    OUT tax DECIMAL(10,2)
)
BEGIN
    set tax = computeTax(sal);
END //

DELIMITER ;

CALL calTax(900000,@myTax);
SELECT @myTax;
