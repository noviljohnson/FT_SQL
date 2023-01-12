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
    SELECT "Data inserted";
    if (pub,auth,title,sub) not in (SELECT bpub,bauth,btitle,bsub from book WHERE bpub =pub) then
        INSERT INTO book(bpub,bauth,btitle,bsub) VALUES(pub,auth,title,sub);
        INSERT INTO bcopy(1,(SELECT bookid from book where bpub=pub and bauth=bauth),"available");
    else 
        INSERT INTO bcopy(1,(SELECT bookid from book where bpub=pub and bauth=bauth),"available");
    end if;
END//
DELIMITER;
DROP add_book;

CALL add_book("TMH", "James", "Information Systems", "I.Science");
SELECT * FROM book;