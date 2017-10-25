-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pmpd
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL,
  `EMPLOYEE_NAME` varchar(50) DEFAULT NULL,
  `EMPLOYEE_EXPERIENCE` varchar(10) DEFAULT NULL,
  `EMAIL_ID` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(15) DEFAULT NULL,
  `TECHNOLOGY` varchar(100) DEFAULT NULL,
  `PROJECT_DETAIL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  KEY `PROJECT_DETAIL_ID` (`PROJECT_DETAIL_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`PROJECT_DETAIL_ID`) REFERENCES `project_detail` (`PROJECT_DETAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (625315,'prasad','9','v_prasad@infosys.com',800215,'.net,Angular,node ,Extjs',1),(634582,'Durga','4','durgadevi@infosys.com',903025,'Extjs,javascript and jquery',1),(668595,'madhav','5','madhav_R@infosys.com',978456,'Testing',2),(684598,'Gautam','3','gautam@infosys.com',854562,'EXTJs,HTML,CSS and jquery',1),(720000,'RAJESH','5','rajesh.r@infosys.com',9010888,'Andriod,REST API,Spring Boot and MYSql',1),(725928,'Bharath','4','dhanpal@infosys.com',984561,'HTML,CSS,NODE,ANGULAR,BONITA',2),(745812,'Pradeep','5','pradeep_sahu@infosys.com',984567,'ExtJs,java,spring and hibernate',1),(745896,'Deepthi','8','deepthi@infosys.cpm',9010882,'Andriod ,HTML,Angular',2),(775544,'raghu','6','raghu@infosys.com',945846,'IOS,HTML,hybrid',2),(784596,'Sandhya','7','sandhay@infosys.com',745845,'webstrom,java,middlware',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-25  2:30:52
