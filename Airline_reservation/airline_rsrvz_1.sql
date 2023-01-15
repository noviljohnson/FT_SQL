-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `addressId` int unsigned NOT NULL AUTO_INCREMENT,
  `streetAddress` varchar(255) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postalCode` int unsigned NOT NULL,
  `countryId` varchar(10) NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `FK_country_address` (`countryId`),
  CONSTRAINT `FK_country_address` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=500011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1027,'96720 Brandt Bridge','Brennaburgh','Delaware',20982,'USA','2001-07-02 16:12:53'),(1037,'2297 Terry Cliff','East Herminiaburgh','Illinois',27312,'USA','2018-06-24 09:30:09'),(1047,'7356 Elnora Causeway Apt. 991','Heathcoteshire','WestVirginia',59210,'USA','2005-07-10 23:01:23'),(1053,'2133 Johns Villages','East Abdiel','Tennessee',76664,'USA','1978-09-24 10:14:23'),(1075,'760 Gleason Villages','Floyshire','SouthCarolina',92684,'USA','1980-03-06 06:23:52'),(1076,'999 Lukas Ferry','Blandaview','Louisiana',46377,'USA','1973-08-20 14:37:43'),(1080,'3977 Kenya Tunnel Apt. 424','Port Goldafurt','NewHampshire',87433,'USA','1977-09-20 22:17:34'),(1119,'9121 Alexa Haven','Murazikland','Virginia',57867,'USA','2016-07-30 06:58:31'),(1124,'968 Kiehn Trace Suite 554','East Bradley','Oklahoma',98693,'USA','1974-05-23 09:08:10'),(1169,'012 Price Pike','North Thalia','Oregon',21187,'USA','1987-08-02 22:21:09'),(1170,'05898 Claud Prairie','West Helen','Kansas',86200,'USA','2017-03-13 23:29:39'),(1174,'829 Zulauf Viaduct','West Florianport','Oklahoma',96660,'USA','1996-09-17 00:09:18'),(1200,'14691 Thelma Mountain','Klingland','Ohio',13431,'USA','2011-04-14 03:47:11'),(1205,'7655 Denesik Spur','Ruthshire','Vermont',95783,'USA','1972-06-27 12:48:14'),(1221,'27578 Jaden Courts Apt. 431','South Jamalview','Oregon',86792,'USA','2000-09-02 21:43:04'),(1255,'9262 Eve Terrace Apt. 557','Millertown','Delaware',65632,'USA','2010-04-28 19:41:11'),(1278,'881 Leanna Mission Apt. 697','Hammesville','NorthCarolina',5609,'USA','2010-01-01 20:47:29'),(1282,'530 Bulah Street Apt. 162','North Celia','Indiana',48246,'USA','2017-12-23 03:33:27'),(1290,'2991 Jay Viaduct','Karlville','Colorado',68044,'USA','1993-02-06 12:13:34'),(1304,'326 Balistreri Lane Suite 235','South Leta','Virginia',30032,'USA','1976-06-03 04:19:15'),(1306,'6094 Sunny Vista','South Davinburgh','Pennsylvania',19471,'USA','1996-05-21 19:43:58'),(1317,'738 Senger Crest','Tavaresport','Kentucky',24470,'USA','2008-02-27 06:51:00'),(1319,'65266 Nyasia Flat Apt. 144','Wisozkstad','California',20120,'USA','2000-12-10 08:21:32'),(1330,'68405 Tess Trace Apt. 597','North Joanie','Massachusetts',30102,'USA','1977-10-11 07:00:31'),(1338,'510 Jovani Squares Suite 083','Shaniashire','SouthDakota',70097,'USA','2020-10-01 11:24:54'),(1343,'8898 Parker Road','Alanborough','Minnesota',80843,'USA','2005-07-04 14:13:12'),(1361,'5112 Eldridge Flat Suite 514','South Graciela','Alabama',28270,'USA','2003-10-24 16:21:46'),(1367,'9805 Lockman Prairie','Lake Ozella','California',90346,'USA','1994-08-31 15:30:03'),(1383,'3825 Efrain Oval Apt. 792','West Annabel','Iowa',60336,'USA','1985-05-10 22:20:16'),(1395,'0147 Betty River Suite 392','Lake Kiarra','Vermont',80420,'USA','1983-09-12 22:40:44'),(1419,'827 Streich Key Apt. 986','Lake Ernestinahaven','Michigan',66446,'USA','1996-11-21 00:46:01'),(1423,'41457 Anderson Ways','Zackfort','RhodeIsland',11919,'USA','2019-01-31 22:52:56'),(1430,'331 Howe Rue Suite 680','West Kole','Virginia',37226,'USA','1972-06-13 05:15:12'),(1461,'29298 Blair Forks Apt. 386','Simonisburgh','Hawaii',94234,'USA','2000-01-31 15:51:33'),(1463,'064 Fadel Points','South Kitty','RhodeIsland',11008,'USA','1983-06-23 10:33:49'),(1466,'05401 Glover Courts','Watsicaborough','NorthCarolina',63271,'USA','1989-10-25 07:03:57'),(1480,'20412 Altenwerth Inlet','Reganview','Hawaii',18821,'USA','1976-12-14 17:50:16'),(1483,'18386 Kemmer Turnpike Suite 963','Hazleside','NorthDakota',12982,'USA','2003-03-07 22:43:14'),(1491,'179 Mack Plaza Suite 698','Connellmouth','Alabama',46147,'USA','1996-07-30 05:45:15'),(1492,'076 Parker Turnpike Apt. 592','Lake Davion','Pennsylvania',47757,'USA','2017-03-02 10:16:18'),(1513,'226 Luettgen Stravenue Suite 642','East Aubreemouth','Kansas',10824,'USA','1988-05-07 18:49:15'),(1515,'5687 Thompson Coves','Kirstinburgh','District of Columbia',60011,'USA','1985-04-18 08:22:19'),(1519,'006 Marshall Knoll Suite 288','Alexaton','Ohio',85246,'USA','1986-10-16 10:42:24'),(1529,'4099 West Glen','North Efrenmouth','Nebraska',78143,'USA','1999-06-14 00:40:58'),(1550,'8202 Sylvester Heights','West Geovanniberg','Mississippi',9317,'USA','2002-03-14 10:17:41'),(1560,'62005 Kyler Views','Murrayhaven','Illinois',36622,'USA','2021-03-09 20:29:21'),(1576,'4710 Emma Courts','East Myrlport','NewHampshire',7033,'USA','1972-02-23 04:28:27'),(1583,'088 Christop Knolls Suite 690','Wuckertberg','Utah',24411,'USA','2007-10-15 14:26:15'),(1588,'4861 Strosin Extension','East Javierside','NewHampshire',78678,'USA','1989-12-23 15:38:20'),(1591,'094 Samir Springs','Haramouth','Maine',68037,'USA','1991-10-12 13:19:59'),(1613,'764 Gladyce Ports','Parisianchester','RhodeIsland',73543,'USA','2009-05-11 08:16:52'),(1623,'70155 Gorczany Forge','Lakinberg','Florida',89966,'USA','2006-02-16 02:38:39'),(1637,'022 Harvey Pike Apt. 001','Edaside','SouthCarolina',93176,'USA','1976-10-28 07:31:08'),(1644,'711 Zieme Trail','Dareview','Alaska',89171,'USA','1984-02-21 17:15:27'),(1694,'563 Evie Walks','Heidenreichfurt','NewYork',72609,'USA','2011-10-07 01:15:26'),(1698,'0391 Vella Prairie','Timmothyhaven','District of Columbia',76798,'USA','2001-03-09 10:38:48'),(1720,'6298 Kirlin Passage Apt. 048','Olaton','Oklahoma',95966,'USA','1999-04-04 15:24:42'),(1747,'2555 Bette Via','Lake Claude','NorthDakota',98925,'USA','2002-12-17 09:25:55'),(1751,'3151 Stark Falls Apt. 375','New Camronshire','Utah',8177,'USA','1997-09-11 17:13:23'),(1768,'038 Feil Oval Suite 830','Gregberg','District of Columbia',71803,'USA','1996-08-18 10:13:26'),(1785,'065 Kip Canyon','Prohaskaburgh','Colorado',20030,'USA','1984-07-22 19:21:48'),(1802,'88710 Schaefer Viaduct Apt. 830','Shieldshaven','Georgia',16943,'USA','1996-04-28 22:02:16'),(1808,'903 Kassandra Mission Apt. 434','Port Rosa','Colorado',10020,'USA','1978-02-11 03:50:25'),(1817,'432 Gulgowski Via Apt. 583','Scottiefurt','Missouri',70201,'USA','2008-01-26 00:16:13'),(1831,'1789 Reinger Orchard Apt. 046','West Giovanimouth','Nebraska',52235,'USA','2000-09-17 20:24:30'),(1839,'186 Ledner Valley Apt. 182','Port Mckenna','Utah',3213,'USA','2015-05-17 14:56:14'),(1844,'29925 Benton Fort Apt. 475','Beiershire','Arizona',82676,'USA','2009-06-24 01:37:11'),(1856,'494 Hansen Vista','Hodkiewiczbury','Pennsylvania',10222,'USA','2022-04-28 12:47:21'),(1863,'6789 Olson Ports','South Georgetteberg','Wyoming',14683,'USA','1993-10-01 18:35:12'),(1886,'34519 Leffler Ranch','Aileenborough','Ohio',62346,'USA','1978-09-17 06:13:54'),(1895,'0117 Torp Camp','Goodwinfurt','NewYork',35811,'USA','1980-12-30 05:36:49'),(1901,'622 Satterfield Trafficway','Jeffton','Arizona',13327,'USA','1989-09-29 13:27:41'),(1921,'285 Schroeder Tunnel Suite 241','Bennytown','Illinois',94675,'USA','1988-09-25 04:38:06'),(1925,'6602 Jay Wall','New Madgehaven','Virginia',88869,'USA','1982-11-09 21:33:44'),(1942,'302 Randy Court','Raynorhaven','NewJersey',6065,'USA','1976-09-11 09:04:06'),(1948,'304 Lorenza Ramp Apt. 261','Bessietown','Nevada',83805,'USA','2005-08-13 18:18:56'),(1951,'49516 Hodkiewicz Center','South Savannah','Massachusetts',74662,'USA','2002-10-04 16:44:24'),(1979,'741 Araceli Ports','Buckburgh','Washington',68126,'USA','1987-05-19 00:08:58'),(1988,'792 Eichmann Stream','Patiencemouth','Virginia',24066,'USA','2004-09-01 12:54:26'),(1997,'925 Jacinto Spur Suite 912','Lake Cade','Illinois',20212,'USA','1983-05-06 17:30:43'),(1998,'64220 Robel Haven Suite 636','New Woodrow','Arkansas',66848,'USA','1971-07-01 12:39:22'),(2003,'64220 Koramangala','Bengaluru','Karnataka',501848,'IND','2023-01-11 14:10:52'),(2005,'84215 Kokapet','Hyderabad','Telangana',5000048,'IND','2023-01-11 20:59:02'),(2006,'59115 Guntur','Vijayawada','Andhra Pradesh',651487,'IND','2023-01-11 20:59:06');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircrafts` (
  `aircraftId` varchar(10) NOT NULL,
  `manId` int unsigned NOT NULL,
  PRIMARY KEY (`aircraftId`),
  KEY `FK_manu_aircrafts` (`manId`),
  CONSTRAINT `FK_manu_aircrafts` FOREIGN KEY (`manId`) REFERENCES `manufacturer` (`manId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES ('A21N',902),('A318',902),('A319',902),('A320',902),('A321',902),('B737',903),('B747',903),('B757',903),('B767',903),('B777',903),('B787',903);
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `airportId` varchar(5) NOT NULL,
  `name` varchar(200) NOT NULL,
  `city` varchar(40) NOT NULL,
  `countryid` varchar(10) NOT NULL,
  PRIMARY KEY (`airportId`),
  KEY `FK_country_airport` (`countryid`),
  CONSTRAINT `FK_country_airport` FOREIGN KEY (`countryid`) REFERENCES `countries` (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baggage`
--

DROP TABLE IF EXISTS `baggage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baggage` (
  `baggageId` int unsigned NOT NULL AUTO_INCREMENT,
  `weightKg` varchar(20) NOT NULL,
  `fare` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`baggageId`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baggage`
--

LOCK TABLES `baggage` WRITE;
/*!40000 ALTER TABLE `baggage` DISABLE KEYS */;
/*!40000 ALTER TABLE `baggage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bookingId` int unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int unsigned NOT NULL,
  `flightId` varchar(20) NOT NULL,
  `aircraftId` varchar(10) NOT NULL,
  `seatId` varchar(10) NOT NULL,
  `bookingStatus` varchar(15) NOT NULL DEFAULT 'In Process',
  `bookedTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookingId`),
  KEY `FK_customers_bookings` (`customerId`),
  KEY `FK_flights_aircraft` (`flightId`),
  CONSTRAINT `FK_customers_bookings` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`),
  CONSTRAINT `FK_flights_aircraft` FOREIGN KEY (`flightId`) REFERENCES `flights` (`flightId`)
) ENGINE=InnoDB AUTO_INCREMENT=8700001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `countryId` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES ('AFG','Afghanistan'),('ARE','United Arab Emirates'),('ARG','Argentina'),('AUS','Australia'),('AUT','Austria'),('BEL','Belgium'),('BGD','Bangladesh'),('BRA','Brazil'),('BTN','Bhutan'),('CAN','Canada'),('CHN','China'),('DZA','Algeria'),('GBR','United Kingdom'),('HRV','Croatia'),('IDN','Indonesia'),('IND','India'),('ISR','Israel'),('ITA','Italy'),('KHM','Cambodia'),('MDV','Maldives'),('MEX','Mexico'),('MUS','Mauritius'),('MYS','Malaysia'),('NPL','Nepal'),('PAK','Pakistan'),('SAU','Saudi Arabia'),('SGP','Singapore'),('USA','United States');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customerId` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `addressId` int unsigned NOT NULL,
  PRIMARY KEY (`customerId`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_address_customers` (`addressId`),
  CONSTRAINT `FK_address_customers` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=2100071 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flightfare`
--

DROP TABLE IF EXISTS `flightfare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flightfare` (
  `flightId` varchar(20) NOT NULL,
  `aircraftId` varchar(10) NOT NULL,
  `seatId` varchar(10) NOT NULL,
  `fare` decimal(12,2) unsigned NOT NULL,
  `createDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `lastUpdated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`flightId`),
  KEY `FK_aircraft_flightfare` (`aircraftId`),
  KEY `FK_seats_flightfare` (`seatId`),
  CONSTRAINT `FK_aircraft_flightfare` FOREIGN KEY (`aircraftId`) REFERENCES `aircrafts` (`aircraftId`),
  CONSTRAINT `FK_seats_flightfare` FOREIGN KEY (`seatId`) REFERENCES `seats` (`seatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flightfare`
--

LOCK TABLES `flightfare` WRITE;
/*!40000 ALTER TABLE `flightfare` DISABLE KEYS */;
/*!40000 ALTER TABLE `flightfare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flightId` varchar(20) NOT NULL,
  `scheduleId` varchar(20) NOT NULL,
  `status` tinyint unsigned NOT NULL DEFAULT '0',
  `lastUpdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`flightId`),
  KEY `FK_schedule_flights` (`scheduleId`),
  CONSTRAINT `FK_schedule_flights` FOREIGN KEY (`scheduleId`) REFERENCES `schedule` (`scheduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodmenu`
--

DROP TABLE IF EXISTS `foodmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodmenu` (
  `itemId` int unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  `passengerId` int NOT NULL,
  `itemPrice` int unsigned NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodmenu`
--

LOCK TABLES `foodmenu` WRITE;
/*!40000 ALTER TABLE `foodmenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `foodmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `manId` int unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`manId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (901,'Lockheed Martin'),(902,'Airbus'),(903,'Boeing'),(904,'Raytheon'),(905,'General Electric');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passengerId` int unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `passport` varchar(10) DEFAULT NULL,
  `addressId` int unsigned NOT NULL,
  `pnr` char(6) NOT NULL,
  `seatId` varchar(10) NOT NULL,
  `bookingid` int unsigned NOT NULL,
  `flightId` varchar(20) NOT NULL,
  `baggageID` int unsigned NOT NULL,
  `customerId` int unsigned NOT NULL,
  PRIMARY KEY (`passengerId`),
  KEY `FK_customers_passengers` (`customerId`),
  KEY `FK_pnr_passengers` (`pnr`),
  KEY `FK_seats_passengers` (`seatId`),
  KEY `FK_bookings_passengers` (`bookingid`),
  KEY `FK_flights_passengers` (`flightId`),
  KEY `FK_baggage_passengers` (`baggageID`),
  KEY `FK_address_passengers` (`addressId`),
  CONSTRAINT `FK_address_passengers` FOREIGN KEY (`addressId`) REFERENCES `address` (`addressId`),
  CONSTRAINT `FK_baggage_passengers` FOREIGN KEY (`baggageID`) REFERENCES `baggage` (`baggageId`),
  CONSTRAINT `FK_bookings_passengers` FOREIGN KEY (`bookingid`) REFERENCES `bookings` (`bookingId`),
  CONSTRAINT `FK_customers_passengers` FOREIGN KEY (`customerId`) REFERENCES `customers` (`customerId`),
  CONSTRAINT `FK_flights_passengers` FOREIGN KEY (`flightId`) REFERENCES `flights` (`flightId`),
  CONSTRAINT `FK_pnr_passengers` FOREIGN KEY (`pnr`) REFERENCES `pnr` (`pnrId`),
  CONSTRAINT `FK_seats_passengers` FOREIGN KEY (`seatId`) REFERENCES `seats` (`seatId`)
) ENGINE=InnoDB AUTO_INCREMENT=800001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pnr`
--

DROP TABLE IF EXISTS `pnr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pnr` (
  `pnrId` char(6) NOT NULL,
  `flightId` varchar(20) NOT NULL,
  `bookingId` int unsigned NOT NULL,
  PRIMARY KEY (`pnrId`),
  KEY `FK_flights_pnr` (`flightId`),
  KEY `FK_bookings_pnr` (`bookingId`),
  CONSTRAINT `FK_bookings_pnr` FOREIGN KEY (`bookingId`) REFERENCES `bookings` (`bookingId`),
  CONSTRAINT `FK_flights_pnr` FOREIGN KEY (`flightId`) REFERENCES `flights` (`flightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pnr`
--

LOCK TABLES `pnr` WRITE;
/*!40000 ALTER TABLE `pnr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pnr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `scheduleId` varchar(20) NOT NULL,
  `originId` varchar(5) NOT NULL,
  `destinationId` varchar(5) NOT NULL,
  `departureTime` datetime NOT NULL,
  `arrivalTime` datetime NOT NULL,
  `travelTime` time NOT NULL,
  `travelDistance` int NOT NULL,
  PRIMARY KEY (`scheduleId`),
  KEY `FK_airport_schedule` (`originId`),
  KEY `FK_airport_schedule_dest` (`destinationId`),
  CONSTRAINT `FK_airport_schedule` FOREIGN KEY (`originId`) REFERENCES `airport` (`airportId`),
  CONSTRAINT `FK_airport_schedule_dest` FOREIGN KEY (`destinationId`) REFERENCES `airport` (`airportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `seatId` varchar(10) NOT NULL,
  `aircraftId` varchar(10) NOT NULL,
  `class` enum('Economy','Premium Economy','Business class','First Class') DEFAULT NULL,
  PRIMARY KEY (`seatId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('B119','A21N','Business class'),('B128','A318','Business class'),('B134','A318','Business class'),('B175','A21N','Business class'),('B191','B757','Business class'),('B200','B757','Business class'),('B208','B767','Business class'),('B30','B767','Business class'),('B41','B767','Business class'),('B92','A318','Business class'),('E112','B737','Economy'),('E125','B757','Economy'),('E145','B767','Economy'),('E152','B787','Economy'),('E153','B737','Economy'),('E173','B737','Economy'),('E194','A318','Economy'),('E222','A319','Economy'),('E23','B737','Economy'),('E24','A21N','Economy'),('E29','A21N','Economy'),('E35','A319','Economy'),('E49','A321','Economy'),('E76','B777','Economy'),('E86','B777','Economy'),('E94','B787','Economy'),('E97','B767','Economy'),('F10','B767','First Class'),('F102','B777','First Class'),('F117','A320','First Class'),('F124','A319','First Class'),('F133','B787','First Class'),('F137','B767','First Class'),('F140','B737','First Class'),('F159','A21N','First Class'),('F163','B777','First Class'),('F166','B747','First Class'),('F19','B787','First Class'),('F193','A318','First Class'),('F2','B747','First Class'),('F218','B767','First Class'),('F44','B787','First Class'),('F63','B747','First Class'),('F66','A321','First Class'),('F69','B757','First Class'),('F73','A21N','First Class'),('F74','B737','First Class'),('F79','B757','First Class'),('F84','A318','First Class'),('F87','B757','First Class'),('P103','A320','Premium Economy'),('P105','B757','Premium Economy'),('P107','B757','Premium Economy'),('P108','B757','Premium Economy'),('P114','B757','Premium Economy'),('P123','A318','Premium Economy'),('P139','A319','Premium Economy'),('P150','A318','Premium Economy'),('P164','A321','Premium Economy'),('P165','A319','Premium Economy'),('P167','B777','Premium Economy'),('P18','B757','Premium Economy'),('P183','A319','Premium Economy'),('P186','B747','Premium Economy'),('P203','A318','Premium Economy'),('P209','B747','Premium Economy'),('P212','B757','Premium Economy'),('P37','A319','Premium Economy'),('P4','B757','Premium Economy'),('P40','B747','Premium Economy'),('P6','B767','Premium Economy'),('P78','B787','Premium Economy'),('P80','B787','Premium Economy'),('P98','B747','Premium Economy');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 17:02:41
