-- Active: 1671700995648@@127.0.0.1@3308@ft_db
CREATE Table stu(
    `name` VARCHAR(20),
    `id`  INT
);

CREATE TABLE stu_phn(
    phn numeric(10),
    id INT
);

INSERT INTO stu values('Novil', 1);
INSERT INTO stu values('Johnson', 2);
INSERT INTO stu values('Razz', 3);

INSERT INTO stu_phn values(24292924, 1), (31234342,1);

ALTER TABLE stu ADD COLUMN `dob` DATE;

UPDATE stu SET dob = '1998/06/09' WHERE id = 2;
UPDATE stu SET dob = '2000/02/24' WHERE id = 3;

SELECT * FROM stu;
-- view
CREATE VIEW stud_age as SELECT id,name, TIMESTAMPDIFF(YEAR,dob,CURDATE()) "age" from stu;   

SHOW TABLES;

SELECT * FROM stud_age;

ALTER TABLE stu ADD (`street` VARCHAR(20), `city` VARCHAR(20), `pincode` numeric(6));

DESC stu;

UPDATE stu SET street='1st main', city = "bangalore", pincode = 560047 WHERE id = 1;
UPDATE stu SET street='2st main', city = "bangalore", pincode = 560047 WHERE id = 2;
UPDATE stu SET street='main road', city = "vijayawada", pincode = 521214 WHERE id = 3;
-- concat FUNCTION
SELECT name, CONCAT(street,",",city,",",pincode) "address" FROM stu;

--  view for address
CREATE VIEW stu_add as SELECT name, CONCAT(street,",",city,",",pincode) "address" FROM stu;
SELECT * FROM stu_add;

SELECT * FROM DEPT;



-- NORMALIZATION

CREATE TABLE CUSTOMER(
    CUST_ID INT UNSIGNED NOT NULL,
    CNAME VARCHAR(20) NOT NULL,
    CLOC VARCHAR(10)
);
ALTER TABLE customer ADD CONSTRAINT PK_custid PRIMARY KEY (CUST_ID);


CREATE TABLE INV_CUST(
    invno INT UNSIGNED NOT NULL,
    cust_id INT UNSIGNED 
);
ALTER TABLE inv_cust ADD CONSTRAINT PK_invno PRIMARY KEY (invno);
ALTER TABLE inv_cust ADD CONSTRAINT FK_custid FOREIGN KEY (cust_id) REFERENCES customer(cust_id) ON DELETE SET NULL;


CREATE TABLE INV_ITEM (
    INVNO  INT UNSIGNED NOT NULL,
    SLNO INT(5) UNSIGNED NOT NULL,
    ITME  VARCHAR(10),
    QTY INT UNSIGNED,
    TOTAL DECIMAL
);
ALTER TABLE INV_ITEM ADD CONSTRAINT PK_INVNO_SLNO PRIMARY KEY (invno,slno);
ALTER TABLE inv_item ADD CONSTRAINT FK_invno FOREIGN KEY (invno) REFERENCES INV_CUST(INVNO) ON DELETE CASCADE; 

desc inv_item;