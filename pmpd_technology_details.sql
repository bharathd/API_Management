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
INSERT INTO `technology_details` VALUES (1,'What is the difference between ng-show/ng-hide and ng-if directives?','ng-show/ng-hide will always insert the DOM element, but will display/hide it based on the condition. ng-if will not insert the DOM element until the condition is not fulfilled',3),(2,'Where should we implement the DOM manipulation in AngularJS?','In the directives. DOM Manipulations should not exist in controllers, services or anywhere  else but in directives.',3),(3,'Is it a good or bad practice to use AngularJS together with jQuery?','It is definitely a bad practice. We need to stay away from jQuery and try to realize the solution with an AngularJS approach. jQuery takes a traditional imperative approach to manipulating the DOM',3),(4,'What is factory method in AngularJS','Factory method is used for creating a directive.  It is invoked when the compiler matches the directive for the first time. We can invoke the factory method using $injector.invoke.',3),(5,'Explain $q service, deferred and promises.','‘Promises’ are post processing logics which are executed after some operation/action is completed ‘deferred’ is used to control promise “$q” is the angular service which provides promises “$q” is the angular service which provides promises ',3),(6,'What is called Variable typing in JavaScript?','Variable typing is used to assign a number to a variable and the same variable can be assigned to a string',1),(7,'What is Prototype in JavaScript? How to create prototype in JavaScript?','The prototype is a fundamental concept of JavaScript and its must to known JavaScript developers and all the JavaScript objects have an object and its property called prototype and its used to add and the custom functions and property.',1),(8,'What Is Closure in JavaScript?','While you create the JavaScript function within another function and the inner function freely access all the variable of outer function',1),(9,'difference between call and apply in JavaScript','Call a function with the specified arguments. You can use call, if you know how many argument are going to pass to the functions.You can use apply if you don\'t know how many argument are going to pass to the functions.',1),(10,'What are the Event Handlers in JavaScript?','Some are as follows: click,change,mouseover',1),(11,'What is jQuery?','jQuery is fast, lightweight and feature-rich client side JavaScript Library/Framework which helps in to traverse HTML DOM, make animations, add Ajax interaction, manipulate the page content',2),(12,'How JavaScript and jQuery are different?',' JavaScript is a language While jQuery is a library built in the JavaScript language that helps to use the JavaScript language',2),(13,' Is jQuery replacement of Java Script?','No. jQuery is not a replacement of JavaScript. jQuery is a different library which is written on top of JavaScript. jQuery is a lightweight JavaScript library that emphasizes interaction between JavaScript and HTML',2),(14,'Can we have multiple document.ready() function on the same page?',' YES. We can have any number of document.ready() function on the same page.',2),(15,'What are the fastest selectors in jQuery?','ID and element selectors are the fastest selectors in jQuery.',2);
/*!40000 ALTER TABLE `technology_details` ENABLE KEYS */;
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
