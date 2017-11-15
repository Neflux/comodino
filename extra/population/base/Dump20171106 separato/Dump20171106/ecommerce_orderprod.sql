-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Table structure for table `orderprod`
--

DROP TABLE IF EXISTS `orderprod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderprod` (
  `OrderID` int(11) NOT NULL,
  `Status` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ShopID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `FinalPrice` float DEFAULT NULL,
  `AddressID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`,`ProductID`,`ShopID`),
  KEY `ProductID` (`ProductID`,`ShopID`),
  KEY `AddressID` (`AddressID`),
  CONSTRAINT `orderprod_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderlist` (`OrderID`),
  CONSTRAINT `orderprod_ibfk_2` FOREIGN KEY (`ProductID`, `ShopID`) REFERENCES `shopproduct` (`ProductID`, `ShopID`),
  CONSTRAINT `orderprod_ibfk_3` FOREIGN KEY (`AddressID`) REFERENCES `shippingaddress` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderprod`
--

/*!40000 ALTER TABLE `orderprod` DISABLE KEYS */;
INSERT INTO `orderprod` VALUES (1,1,1,1,3,5.5,1),(1,1,2,7,2,80.4,1),(1,0,3,8,4,15,2),(2,0,4,100,3,75,1);
/*!40000 ALTER TABLE `orderprod` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 17:22:29
