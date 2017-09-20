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
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `PROJECT_ID` int(11) NOT NULL,
  `PROJECT_NAME` varchar(255) NOT NULL,
  `PROJECT_DESCRIPTION` varchar(255) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_ID`),
  KEY `USER_ID` (`USER_ID`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'VEC','project is on wirelan communication',1),(2,'pwc','iris',1);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_detail`
--

DROP TABLE IF EXISTS `project_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_detail` (
  `PROJECT_DETAIL_ID` int(11) NOT NULL,
  `TEAM_SIZE` int(11) DEFAULT NULL,
  `PROJECT_DURATION` varchar(100) DEFAULT NULL,
  `PROJECT_START_DATE` date DEFAULT NULL,
  `PROJECT_END_DATE` date DEFAULT NULL,
  `PROJECT_TOOLS_USED` varchar(255) DEFAULT NULL,
  `PROJECT_TEAM_MEMBER_ID` varchar(255) DEFAULT NULL,
  `PROJECT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROJECT_DETAIL_ID`),
  KEY `PROJECT_ID` (`PROJECT_ID`),
  CONSTRAINT `project_detail_ibfk_1` FOREIGN KEY (`PROJECT_ID`) REFERENCES `project` (`PROJECT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_detail`
--

LOCK TABLES `project_detail` WRITE;
/*!40000 ALTER TABLE `project_detail` DISABLE KEYS */;
INSERT INTO `project_detail` VALUES (1,10,'6 months','2016-12-28','2017-06-06','STS,mysql workbench','725928_bharath\n741852_rajesh',1);
/*!40000 ALTER TABLE `project_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
  `TECHNOLOGY_ID` int(11) NOT NULL,
  `TECHNOLOGY_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TECHNOLOGY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology_details`
--

DROP TABLE IF EXISTS `technology_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology_details` (
  `TECHNOLOGY_DETAIL_ID` int(11) NOT NULL,
  `TECHNOLOGY_QUESTION` varchar(255) DEFAULT NULL,
  `TECHNOLOGY_ANSWER` varchar(255) DEFAULT NULL,
  `TECHNOLOGY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`TECHNOLOGY_DETAIL_ID`),
  KEY `TECHNOLOGY_ID` (`TECHNOLOGY_ID`),
  CONSTRAINT `technology_details_ibfk_1` FOREIGN KEY (`TECHNOLOGY_ID`) REFERENCES `technology` (`TECHNOLOGY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology_details`
--

LOCK TABLES `technology_details` WRITE;
/*!40000 ALTER TABLE `technology_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `technology_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'kumar','X@peria');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-20  9:40:54
