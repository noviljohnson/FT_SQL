-- Active: 1671700995648@@127.0.0.1@3308@hr

-- Patient Create Table
CREATE TABLE Patient 
(
    PID INTEGER(7),
    P_Name VARCHAR(30) NOT NULL,
    CONSTRAINT `PK_patient` PRIMARY KEY (PID)
);

-- Create Table Treatment
CREATE TABLE Treatment
(
    TID INTEGER(7),
    T_Name VARCHAR(30) NOT NULL,
    CONSTRAINT `PK_treatment` PRIMARY KEY (TID)
);

SHOW COLUMNS IN Patient;
SHOW COLUMNS IN Treatment;
DESCRIBE treatment;
--Create Table Patient treatment
CREATE TABLE Patient_Treatment
(
    PID_PT INTEGER(7),
    TID_PT INTEGER(7),
    Date DATETIME NOT NULL,
    CONSTRAINT `FK_patient_pt` FOREIGN KEY(PID_PT) REFERENCES Patient(PID),
    CONSTRAINT `FK_treatment_pt` FOREIGN KEY(TID_PT) REFERENCES Treatment(TID),
    CONSTRAINT `PK_patient_treatment` PRIMARY KEY(PID_PT,TID_PT)
);

DESCRIBE Patient_Treatment;
SHOW INDEXES in Patient_Treatment;

--ALTER Commands
--1
ALTER TABLE Patient 
MODIFY column P_name VARCHAR(35) ;

--2
ALTER TABLE patient_treatment 
ADD column Dosage INT(2) DEFAULT 0 NOT NULL CHECK(DOSAGE<=99);

--3
ALTER TABLE Treatment RENAME column T_Name TO Treatment_Name;


--4
DROP TABLE Treatment;

--5  
ALTER TABLE patient_treatment
DROP FOREIGN KEY `FK_patient_pt`;

ALTER TABLE patient_treatment
DROP FOREIGN KEY `FK_treatment_pt`;
SHOW INDEXES in patient_treatment;

