-- Active: 1671700995648@@127.0.0.1@3308@ft_db
use Ft_db;

-- ##### 1 ########
CREATE TABLE IF NOT EXISTS `countries` (
    `country_id` int(11) UNSIGNED NOT NULL,
    `country_name` VARCHAR(25) NOT NULL, 
    `region_id` INT(11) NOT NULL,
    `creationTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;

-- DROP TABLE `countries`;

DESCRIBE `countries`;

SHOW COLUMNS FROM `countries`;

SHOW INDEXES FROM `countries`;

-- ALTER TABLE `countries` ADD CONSTRAINT UQ_countries_country_id UNIQUE (country_id);

ALTER Table `countries` ADD CONSTRAINT  PK_countries_country_id_region_id PRIMARY KEY (country_id,region_id);


-- ######  2  ######

CREATE TABLE IF NOT EXISTS `jobs` (
     job_id int(11) UNSIGNED NOT NULL, 
     job_title VARCHAR(30) DEFAULT '', 
     min_salary DECIMAL(7,0) DEFAULT 8000, 
     max_salary DECIMAL(7,0) DEFAULT NULL,
     creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;
-- DROP TABLE `jobs`;

ALTER Table `jobs` ADD CONSTRAINT  PK_jobs_id PRIMARY KEY (`job_id`);


-- ##### 3  #######

CREATE TABLE IF NOT EXISTS `job_history`(
    employee_id INT(10) UNSIGNED NOT NULL , 
    start_date DATE NOT NULL,
    end_date DATE DEFAULT NULL,
    job_id INT(11) UNSIGNED ,
    department_id INT(10) NOT NULL,
    creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;
-- DROP TABLE `job_history`;

ALTER Table `job_history` ADD CONSTRAINT  PK_employee_id PRIMARY KEY (`employee_id`);

ALTER Table `job_history` ADD CONSTRAINT  FK_job_history_jobs FOREIGN Key (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE;




-- ###### 4 ####### 

CREATE TABLE IF NOT EXISTS departments(
    department_id DECIMAL(4,0) NOT NULL DEFAULT 0,
    manager_id DECIMAL(6,0) NOT NULL DEFAULT 0,
    department_name VARCHAR(30) NOT NULL,
    location_id DECIMAL(4,0) DEFAULT NULL,
    creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;


ALTER TABLE `departments` ADD CONSTRAINT PK_departmentid_managerid PRIMARY KEY (`department_id`,`manager_id`);


CREATE TABLE IF NOT EXISTS employees(
    employee_id INT(10) UNSIGNED NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) DEFAULT NULL,
    email VARCHAR(30) DEFAULT NULL,
    phone_number VARCHAR(10) NOT NULL ,
    hire_date DATE NOT NULL,
    job_id INT(11) UNSIGNED,
    salary DECIMAL(6,2),
    commission DECIMAL(2,2),
    manager_id DECIMAL(6,0) DEFAULT 0,
    department_id DECIMAL(4,0) DEFAULT 0,
    creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;

-- DROP TABLE employees;
ALTER TABLE `employees` ADD CONSTRAINT PK_employee_id PRIMARY KEY (`employee_id`);

ALTER Table `employees` ADD CONSTRAINT  FK_departments_employees FOREIGN Key (`department_id`,`manager_id`) REFERENCES `departments` (`department_id`,`manager_id`) ON DELETE CASCADE;



-- ########## 5 ###########

-- ALTER TABLE employees  DROP CONSTRAINT `FK_jobs_employees`; 
ALTER Table `employees` ADD CONSTRAINT  FK_jobs_employees FOREIGN Key (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE RESTRICT;


-- ########## 7 ###########

CREATE TABLE IF NOT EXISTS employees2(
    employee_id INT(10) UNSIGNED NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) DEFAULT NULL,
    email VARCHAR(30) DEFAULT NULL,
    phone_number VARCHAR(10) NOT NULL ,
    hire_date DATE NOT NULL,
    job_id INT(11) UNSIGNED,
    salary DECIMAL(6,2),
    commission DECIMAL(2,2),
    manager_id DECIMAL(6,0) DEFAULT 0,
    department_id DECIMAL(4,0) DEFAULT 0,
    creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;

-- ALTER TABLE employees  DROP CONSTRAINT `FK_jobs_employees`; 

ALTER TABLE `employees2` ADD CONSTRAINT PK_employee_id PRIMARY KEY (`employee_id`);

ALTER Table `employees2` ADD CONSTRAINT  FK_jobs_employees2 FOREIGN Key (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE SET NULL ON UPDATE SET NULL;



-- ########## 8 ###########

CREATE TABLE IF NOT EXISTS employees3(
    employee_id INT(10) UNSIGNED NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name  VARCHAR(30) DEFAULT NULL,
    email VARCHAR(30) DEFAULT NULL,
    phone_number VARCHAR(10) NOT NULL ,
    hire_date DATE NOT NULL,
    job_id INT(11) UNSIGNED,
    salary DECIMAL(6,2),
    commission DECIMAL(2,2),
    manager_id DECIMAL(6,0) DEFAULT 0,
    department_id DECIMAL(4,0) DEFAULT 0,
    creationTime datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
)ENGINE=InnoDB;

-- ALTER TABLE employees  DROP CONSTRAINT `FK_jobs_employees`; 

ALTER TABLE `employees3` ADD CONSTRAINT PK_employee_id PRIMARY KEY (`employee_id`);

ALTER Table `employees3` ADD CONSTRAINT  FK_jobs_employees3 FOREIGN Key (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
