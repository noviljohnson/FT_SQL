-- Active: 1671700995648@@127.0.0.1@3308@lib
CREATE DATABASE Lib;


CREATE TABLE BOOK 
   (	BOOKID int(15)   PRIMARY KEY auto_increment, 
	BPUB varchar(20), 
	BAUTH varchar(20), 
	BTITLE varchar(25), 
	BSUB varchar(25)
   ) ;


  CREATE TABLE MEMBER 
   (	MID int(4)   PRIMARY KEY auto_increment, 
	MNAME varchar(20), 
	MPHONE numeric(10,0),
        JOINDATE DATE
   ) ;



  CREATE TABLE BCOPY 
   (	C_ID int(4), 
	BOOKID int(15), 
	STATUS varchar(20) CHECK (status in('available','rented','reserved')),
        PRIMARY KEY (C_ID,BOOKID)
   ); 



  CREATE TABLE BRES 
   (	MID int(4) , 
	BOOKID int(15) REFERENCES BOOK, 
	RESDATE DATE,PRIMARY KEY (MID, BOOKID, RESDATE),
        foreign key(mid) references member(mid)
   ) ;




  CREATE TABLE BLOAN 
   (	BOOKID int(4), 
	LDATE DATE, 
	FINE numeric(11,2), 
	MID int(4), 
	EXP_DATE DATE DEFAULT (curdate()+2), 
	ACT_DATE DATE, 
	C_ID int(4),
  FOREIGN KEY (C_ID, BOOKID)
	  REFERENCES BCOPY (C_ID, BOOKID),
 foreign key(mid) references member(mid)
   ) ;


SHOW tables;
SELECT * from bcopy;
SELECT * from bloan;
SELECT * from book;
SELECT * from bres;
SELECT * from member;



-- Lib case study

-- New_member: a PROCEDURE that adds a new member to the member table.
-- for the join date, use curdate(). pass all other values to be inserted into
--  into row as parameters;

DELIMITER //
CREATE PROCEDURE add_new(IN name VARCHAR(30), IN phn VARCHAR(13))
BEGIN
    SELECT "Data inserted";
    INSERT INTO member(mname,mphone,joindate) VALUES(name,phn,CURDATE());
END//
DELIMITER;
-- DROP PROCEDURE add_new;
CALL add_new("Novil", 7730826408);


-- New_book: a PROCEDURE that adds a new book to the book table. columns pass as parameter.

DELIMITER //
CREATE PROCEDURE add_book(IN pub VARCHAR(30), IN auth VARCHAR(13), IN title VARCHAR(30), IN sub VARCHAR(20))
BEGIN
    INSERT INTO book(bpub, bauth, btitle, bsub) values(pub,auth,title,sub);
    -- SELECT "Data inserted";
    -- if (pub,auth,title,sub) not in (SELECT bpub,bauth,btitle,bsub from book WHERE bpub =pub) then
    --     INSERT INTO book(bpub,bauth,btitle,bsub) VALUES(pub,auth,title,sub);
    --     INSERT INTO bcopy(1,(SELECT bookid from book where bpub=pub and bauth=bauth),"available");
    -- else 
    --     INSERT INTO bcopy(1,(SELECT bookid from book where bpub=pub and bauth=bauth),"available");
    -- end if;
END//

--  trigger

CREATE TRIGGER book_insert
    BEFORE INSERT on book
    FOR EACH ROW
    BEGIN
          INSERT INTO bcopy VALUES(1,(SELECT max(bookid)+1 from book),"available");
END //

DELIMITER ;

CALL add_book("NJ", "Johnson", "Life sciences", "MY.Science");
CALL add_book("NS", "Novil", "Biology", "MY.Science");
SELECT * FROM book;
SELECT * FROM bcopy;


-- NEW_rental

-- INSERT into bcopy VALUES(2,6,"Rented");
update bcopy set status = "Rented" WHERE bookid=6;
DELIMITER //

CREATE Function new_rental(bid int, mid int)
RETURNS DATE DETERMINISTIC
BEGIN
    DECLARE ret DATE;
    DECLARE cp int;

    SELECT min(c_id) into cp from bcopy WHERE bookid = bid and `status` like "a%";

    if cp is NULL then
        INSERT INTO bres VALUES (mid,bid,CURDATE());
        RETURN NULL;
    else
        set ret = DATE_ADD(CURDATE(),INTERVAL 3 DAY);
        INSERT INTO bloan VALUES(bid,CURDATE(),0,mid,ret,NULL,cp);
        UPDATE bcopy set status = "Rented" WHERE bookid = bid and c_id=cp;
    end IF;

    RETURN ret;
END//

DELIMITER ;
-- DROP FUNCTION new_rental;
-- DELETE FROM bloan;
SELECT new_rental(6,4);
SELECT new_rental(3,2);
SELECT new_rental(1,2);
-- return_book

DELIMITER //

CREATE Procedure return_book(IN bid int, IN cid int)
BEGIN
    declare v1 NUMERIC(11,2);
    -- set v1 = DATEDIFF(CURDATE(), exp_date);
    SELECT bookid into v1 from bres WHERE bookid=bid; 
    update bloan set act_date = CURDATE() WHERE bookid=bid and c_id=cid;
    update bloan set fine = if(DATEDIFF(CURDATE(), exp_date)>0,DATEDIFF(CURDATE(), exp_date)*5,0) WHERE bookid=bid and c_id = cid;

    if v1 = bid then
        update bcopy set status = "Reserved" WHERE bookid = bid and c_id = cid;
    else
        UPDATE bcopy set status = "available" WHERE bookid = bid and c_id = cid;
    end if;
    
END//

DELIMITER ;

SELECT * FROM bloan;
SELECT * FROM bcopy;
SELECT* FROM book;
SELECT * FROM bres;
DROP PROCEDURE return_book;

CALL return_book(3,1);
CALL return_book(6,1);



-- pmem_book;

DELIMITER //
CREATE Procedure pmem_book(
    IN mem_id INT
)
BEGIN
    if mem_id in (SELECT distinct mid from bloan) then
        SELECT m.mid member_id, RPAD(m.mname,17,"*") member_name, b.bookid "book#", b.btitle, bl.ldate loandate
        FROM bloan bl
        JOIN member m on m.mid = bl.mid
        JOIN book b on b.bookid = bl.bookid
        WHERE m.mid=mem_id and bl.act_date is NULL;
    else
        SELECT CONCAT("** NO BOOK TAKEN BY THE MEMBER ", mem_id);
    end if;
END//

DELIMITER ;

-- DROP PROCEDURE pmem_book;

CALL pmem_book(2);

