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
-- Table structure for table `shopproduct`
--

DROP TABLE IF EXISTS `shopproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopproduct` (
  `Price` float NOT NULL,
  `Quantity` float NOT NULL,
  `Discount` float NOT NULL,
  `ProductID` int(11) NOT NULL,
  `ShopID` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`,`ShopID`),
  KEY `shopproduct_ibfk_2` (`ShopID`),
  CONSTRAINT `shopproduct_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `shopproduct_ibfk_2` FOREIGN KEY (`ShopID`) REFERENCES `shop` (`ShopID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopproduct`
--

/*!40000 ALTER TABLE `shopproduct` DISABLE KEYS */;
INSERT INTO `shopproduct` VALUES (39.9,43,0.1,1,1),(34.9,10,0,1,7),(39.9,35,0,1,16),(59.9,7,0,1,25),(39.9,0,0,1,30),(59.9,26,0,1,37),(55.9,18,0,1,45),(39.9,15,0.1,1,52),(55.9,23,0,1,58),(39.9,15,0,1,70),(39.9,6,0,1,77),(39.9,46,0,1,85),(34.9,1,0,1,92),(34.9,1,0,1,99),(34.9,9,0,1,105),(34.9,38,0,1,114),(39.9,47,0,1,123),(39.9,31,0,1,130),(39.9,33,0,1,136),(39.9,11,0,1,144),(39.9,8,0,1,151),(39.9,0,0,1,157),(39.9,50,0,1,164),(39.9,18,0,1,168),(39.9,23,0,1,176),(39.9,39,0,1,184),(39.9,14,0,1,192),(39.9,-1,0,1,198),(49.9,17,0.1,2,1),(59.9,50,0,2,7),(49.9,34,0,2,16),(44.9,31,0,2,25),(49.9,35,0,2,31),(44.9,30,0,2,37),(65.9,48,0,2,46),(49.9,24,0.1,2,52),(65.9,28,0,2,58),(49.9,1,0,2,70),(49.9,13,0,2,77),(49.9,3,0,2,86),(59.9,20,0,2,93),(59.9,42,0,2,99),(59.9,43,0,2,106),(59.9,37,0,2,114),(49.9,6,0,2,123),(49.9,39,0,2,130),(49.9,10,0,2,136),(49.9,4,0,2,144),(49.9,13,0,2,151),(49.9,39,0,2,157),(49.9,17,0,2,164),(49.9,49,0,2,169),(49.9,14,0,2,176),(49.9,39,0,2,184),(49.9,33,0,2,192),(49.9,30,0.1,2,198),(119.9,48,0.1,3,1),(109.9,2,0.2,3,8),(119.9,42,0,3,16),(159.9,17,0.3,3,25),(119.9,10,0,3,31),(159.9,0,0,3,37),(199.9,0,0,3,47),(119.9,36,0.1,3,52),(199.9,36,0,3,59),(119.9,5,0,3,70),(119.9,34,0,3,78),(119.9,10,0.1,3,86),(109.9,20,0,3,93),(109.9,2,0,3,100),(109.9,9,0,3,106),(109.9,6,0,3,116),(119.9,46,0,3,123),(119.9,32,0,3,130),(119.9,21,0,3,136),(119.9,20,0,3,144),(119.9,25,0,3,151),(119.9,20,0,3,157),(119.9,0,0,3,164),(119.9,24,0,3,169),(119.9,34,0,3,176),(119.9,38,0,3,184),(119.9,49,0,3,192),(119.9,33,0.1,3,198),(84.9,43,0.1,4,1),(74.9,19,0.2,4,8),(84.9,19,0,4,17),(54.9,36,0,4,25),(84.9,33,0,4,31),(54.9,32,0,4,37),(77.9,36,0,4,47),(84.9,10,0,4,52),(77.9,10,0,4,60),(84.9,27,0,4,70),(84.9,36,0,4,78),(84.9,50,0.1,4,86),(74.9,17,0,4,93),(74.9,44,0,4,100),(74.9,42,0,4,107),(74.9,28,0,4,116),(84.9,25,0,4,124),(84.9,28,0,4,130),(84.9,3,0,4,136),(84.9,10,0,4,144),(84.9,12,0,4,151),(84.9,29,0,4,157),(84.9,33,0,4,164),(84.9,19,0,4,169),(84.9,42,0,4,176),(84.9,37,0,4,184),(84.9,34,0,4,192),(84.9,2,0.1,4,199),(89.9,27,0.1,5,1),(69.9,9,0.2,5,8),(89.9,26,0,5,17),(84.9,10,0,5,25),(89.9,25,0,5,31),(84.9,36,0,5,37),(104.9,46,0.3,5,47),(89.9,46,0,5,52),(104.9,2,0,5,60),(89.9,29,0,5,67),(89.9,34,0,5,70),(89.9,11,0,5,78),(89.9,5,0.1,5,86),(69.9,11,0,5,93),(69.9,17,0,5,100),(69.9,38,0,5,107),(69.9,31,0,5,116),(89.9,0,0,5,124),(89.9,25,0,5,130),(89.9,9,0,5,137),(89.9,19,0,5,144),(89.9,23,0,5,152),(89.9,18,0,5,158),(89.9,46,0,5,165),(89.9,22,0,5,169),(89.9,43,0,5,176),(89.9,26,0,5,185),(89.9,4,0,5,192),(89.9,22,0.1,5,199),(134.9,31,0.1,6,1),(154.9,4,0,6,8),(134.9,8,0,6,17),(164.9,41,0,6,25),(134.9,-1,0,6,31),(164.9,1,0,6,37),(184.9,19,0,6,47),(134.9,45,0,6,52),(184.9,4,0,6,60),(134.9,22,0,6,67),(134.9,7,0,6,71),(134.9,4,0,6,78),(134.9,6,0.1,6,86),(154.9,8,0,6,93),(154.9,27,0,6,100),(154.9,7,0,6,107),(154.9,13,0,6,116),(134.9,49,0,6,124),(134.9,23,0,6,130),(134.9,35,0,6,137),(134.9,46,0,6,144),(134.9,28,0,6,152),(134.9,22,0,6,158),(134.9,25,0,6,165),(134.9,28,0,6,169),(134.9,50,0,6,176),(134.9,9,0,6,185),(134.9,10,0,6,192),(134.9,45,0.1,6,199),(49.9,10,0,7,1),(34.9,15,0,7,8),(49.9,44,0,7,17),(69.9,49,0,7,25),(49.9,9,0,7,31),(69.9,35,0,7,38),(58.9,49,0,7,47),(49.9,16,0,7,52),(58.9,36,0,7,60),(49.9,46,0,7,67),(49.9,17,0,7,71),(49.9,5,0,7,78),(49.9,36,0.1,7,86),(34.9,50,0,7,93),(34.9,20,0,7,100),(34.9,27,0,7,107),(34.9,29,0.15,7,116),(49.9,25,0,7,124),(49.9,46,0,7,130),(49.9,39,0,7,137),(49.9,20,0.2,7,144),(49.9,4,0,7,152),(49.9,47,0,7,158),(49.9,31,0,7,165),(49.9,50,0,7,169),(49.9,36,0,7,177),(49.9,22,0,7,185),(49.9,32,0,7,192),(49.9,3,0.1,7,199),(39.9,31,0,8,2),(29.9,45,0,8,8),(39.9,14,0,8,17),(59.9,0,0,8,25),(39.9,10,0,8,31),(59.9,8,0,8,38),(56.9,11,0,8,47),(39.9,33,0,8,52),(56.9,36,0,8,60),(39.9,44,0,8,67),(39.9,14,0,8,71),(39.9,22,0,8,79),(39.9,45,0.1,8,86),(29.9,23,0,8,94),(29.9,31,0,8,101),(29.9,16,0,8,107),(29.9,31,0.15,8,116),(39.9,45,0,8,125),(39.9,38,0,8,130),(39.9,40,0,8,137),(39.9,18,0.2,8,145),(39.9,38,0,8,152),(39.9,26,0,8,158),(39.9,44,0,8,165),(39.9,50,0,8,169),(39.9,6,0,8,177),(39.9,0,0,8,185),(39.9,31,0.2,8,192),(39.9,32,0,8,199),(329.9,50,0,9,2),(309.9,41,0,9,8),(329.9,17,0,9,17),(369.9,43,0,9,25),(329.9,43,0,9,31),(369.9,23,0,9,38),(329.9,43,0,9,47),(329.9,42,0,9,53),(329.9,23,0,9,60),(329.9,49,0,9,67),(329.9,17,0,9,71),(329.9,11,0,9,79),(329.9,19,0,9,87),(309.9,31,0,9,94),(309.9,17,0,9,101),(309.9,33,0.1,9,107),(309.9,24,0,9,116),(329.9,9,0,9,125),(329.9,36,0.2,9,131),(329.9,34,0,9,137),(329.9,7,0.2,9,146),(329.9,36,0,9,152),(329.9,9,0,9,158),(329.9,48,0,9,165),(329.9,28,0,9,170),(329.9,5,0,9,177),(329.9,32,0,9,185),(329.9,1,0.2,9,192),(329.9,7,0,9,199),(89.9,0,0,10,2),(79.9,8,0,10,8),(89.9,38,0,10,17),(69.9,39,0,10,26),(89.9,34,0,10,31),(69.9,7,0,10,38),(88.9,31,0,10,47),(89.9,38,0,10,53),(88.9,20,0,10,60),(55.9,45,0,10,67),(89.9,38,0,10,72),(89.9,44,0,10,79),(89.9,43,0,10,87),(79.9,28,0,10,94),(79.9,34,0,10,101),(79.9,18,0.1,10,107),(79.9,33,0,10,116),(89.9,29,0,10,125),(89.9,22,0.2,10,131),(89.9,43,0,10,137),(89.9,18,0,10,147),(89.9,10,0,10,152),(89.9,40,0,10,159),(89.9,48,0,10,165),(89.9,49,0,10,170),(89.9,6,0,10,177),(89.9,50,0,10,186),(89.9,5,0.2,10,193),(89.9,11,0,10,199),(614.9,23,0,11,2),(619.9,20,0,11,8),(614.9,34,0,11,17),(664.9,12,0,11,26),(614.9,26,0,11,31),(664.9,46,0,11,39),(645.9,37,0,11,47),(614.9,13,0,11,53),(645.9,11,0,11,61),(714.9,10,0.3,11,67),(614.9,31,0,11,73),(614.9,38,0,11,79),(614.9,3,0,11,87),(619.9,30,0,11,94),(619.9,49,0,11,101),(619.9,35,0.1,11,108),(619.9,15,0,11,117),(614.9,50,0,11,125),(614.9,36,0.2,11,131),(614.9,24,0,11,137),(614.9,43,0,11,147),(614.9,32,0,11,152),(614.9,31,0,11,160),(614.9,20,0,11,166),(614.9,1,0,11,170),(614.9,32,0,11,178),(614.9,21,0,11,186),(614.9,11,0,11,193),(614.9,2,0,11,200),(99.9,38,0,12,2),(79.9,40,0,12,9),(99.9,10,0,12,17),(94.9,39,0,12,26),(99.9,10,0.1,12,31),(94.9,17,0,12,39),(74.9,7,0,12,47),(99.9,6,0,12,53),(74.9,6,0,12,61),(79.9,49,0,12,68),(99.9,30,0,12,73),(99.9,31,0,12,79),(99.9,43,0,12,87),(79.9,0,0,12,94),(79.9,3,0,12,101),(79.9,6,0.1,12,108),(79.9,37,0.3,12,117),(99.9,46,0.2,12,125),(99.9,32,0,12,131),(99.9,16,0,12,137),(99.9,40,0,12,147),(99.9,29,0,12,152),(99.9,22,0,12,160),(99.9,25,0,12,166),(99.9,7,0,12,170),(99.9,16,0,12,178),(99.9,10,0,12,186),(99.9,15,0,12,193),(99.9,30,0,12,200),(229.9,38,0.15,13,2),(224.9,36,0,13,9),(229.9,9,0,13,18),(220.9,20,0,13,26),(229.9,44,0.1,13,31),(220.9,20,0,13,39),(256.9,40,0,13,47),(229.9,8,0,13,53),(256.9,17,0,13,61),(279.9,16,0,13,68),(229.9,30,0,13,73),(229.9,0,0,13,79),(229.9,32,0,13,87),(224.9,6,0,13,94),(224.9,35,0,13,101),(224.9,36,0.1,13,108),(224.9,24,0,13,117),(229.9,45,0.2,13,125),(229.9,45,0,13,131),(229.9,28,0,13,137),(229.9,47,0,13,147),(229.9,43,0,13,152),(229.9,37,0,13,160),(229.9,8,0,13,166),(229.9,3,0,13,170),(229.9,3,0,13,178),(229.9,3,0,13,186),(229.9,1,0,13,193),(229.9,18,0,13,200),(219.9,48,0.15,14,3),(214.9,2,0,14,9),(219.9,42,0,14,18),(249.9,47,0,14,26),(219.9,44,0.1,14,31),(249.9,28,0.15,14,39),(232.9,18,0,14,48),(219.9,5,0,14,53),(232.9,3,0,14,61),(279.9,11,0,14,68),(219.9,19,0,14,73),(219.9,41,0,14,79),(219.9,19,0,14,87),(214.9,1,0,14,94),(214.9,12,0,14,101),(214.9,13,0.1,14,108),(214.9,22,0,14,117),(219.9,36,0.2,14,125),(219.9,12,0,14,131),(219.9,48,0,14,138),(219.9,31,0,14,147),(219.9,13,0,14,152),(219.9,36,0,14,160),(219.9,-1,0,14,166),(219.9,32,0,14,171),(219.9,44,0,14,178),(219.9,24,0,14,186),(219.9,20,0,14,193),(219.9,21,0,14,200),(214.9,28,0,15,3),(219.9,30,0,15,9),(214.9,50,0,15,18),(194.9,46,0,15,26),(214.9,14,0.1,15,31),(194.9,34,0.15,15,39),(181.9,28,0,15,48),(214.9,5,0,15,53),(181.9,28,0,15,61),(274.9,4,0,15,68),(214.9,13,0,15,73),(214.9,39,0,15,79),(214.9,43,0,15,87),(219.9,15,0,15,94),(219.9,24,0,15,101),(219.9,21,0,15,108),(219.9,1,0,15,117),(214.9,6,0.2,15,125),(214.9,11,0,15,131),(214.9,23,0,15,138),(214.9,25,0,15,147),(214.9,22,0,15,152),(214.9,29,0,15,160),(214.9,-1,0,15,166),(214.9,23,0,15,171),(214.9,50,0,15,178),(214.9,15,0,15,186),(214.9,48,0,15,193),(214.9,47,0.2,15,200),(119.9,31,0,16,3),(114.9,21,0,16,10),(119.9,14,0,16,18),(99.9,22,0,16,26),(119.9,10,0.1,16,32),(99.9,3,0,16,39),(95.9,29,0,16,48),(119.9,18,0,16,53),(95.9,30,0,16,61),(179.9,33,0,16,68),(119.9,46,0,16,73),(119.9,50,0,16,80),(119.9,8,0,16,87),(114.9,29,0,16,95),(114.9,5,0,16,101),(114.9,47,0,16,108),(114.9,7,0,16,117),(119.9,27,0.2,16,125),(119.9,27,0,16,131),(119.9,10,0.1,16,138),(119.9,11,0,16,147),(119.9,24,0,16,153),(119.9,28,0,16,160),(119.9,35,0,16,166),(119.9,8,0,16,171),(119.9,33,0,16,179),(119.9,20,0,16,186),(119.9,34,0,16,194),(119.9,27,0.2,16,200),(494.9,9,0,17,3),(499.9,39,0,17,11),(494.9,38,0,17,18),(444.9,44,0,17,26),(494.9,10,0.1,17,32),(444.9,12,0,17,39),(484.9,49,0,17,48),(494.9,31,0,17,54),(484.9,27,0,17,61),(474.9,0,0,17,68),(494.9,37,0,17,73),(494.9,21,0,17,80),(494.9,48,0,17,87),(499.9,37,0,17,95),(499.9,24,0,17,102),(499.9,10,0,17,108),(499.9,16,0,17,117),(494.9,21,0.2,17,126),(494.9,35,0,17,131),(494.9,22,0.1,17,138),(494.9,15,0,17,147),(494.9,1,0,17,153),(494.9,4,0,17,160),(494.9,7,0,17,166),(494.9,42,0,17,171),(494.9,38,0,17,179),(494.9,46,0.1,17,187),(494.9,46,0,17,194),(494.9,15,0.2,17,200),(109.9,39,0,18,3),(119.9,14,0,18,11),(109.9,36,0,18,18),(109.9,15,0.1,18,27),(109.9,36,0,18,32),(109.9,32,0,18,39),(159.9,33,0,18,48),(109.9,45,0,18,54),(159.9,0,0,18,61),(107.9,0,0,18,68),(109.9,35,0,18,73),(109.9,39,0,18,80),(109.9,12,0,18,88),(119.9,5,0,18,95),(119.9,33,0,18,102),(119.9,28,0,18,108),(119.9,22,0,18,117),(109.9,4,0,18,126),(109.9,24,0,18,131),(109.9,37,0.1,18,139),(109.9,22,0,18,147),(109.9,37,0,18,153),(109.9,5,0,18,161),(109.9,48,0,18,167),(109.9,38,0,18,172),(109.9,49,0,18,179),(109.9,38,0.1,18,187),(109.9,10,0,18,194),(179.9,17,0,19,3),(189.9,18,0,19,11),(179.9,37,0,19,18),(179.9,16,0.1,19,27),(179.9,25,0,19,32),(179.9,46,0,19,39),(168.9,7,0,19,48),(179.9,4,0,19,54),(168.9,21,0,19,62),(177.9,18,0,19,69),(179.9,29,0.1,19,73),(179.9,31,0,19,80),(179.9,19,0,19,88),(189.9,26,0,19,95),(189.9,6,0.2,19,102),(189.9,34,0.2,19,109),(189.9,26,0,19,117),(179.9,5,0,19,126),(179.9,24,0,19,131),(179.9,32,0.1,19,139),(179.9,1,0,19,147),(179.9,43,0,19,153),(179.9,48,0,19,161),(179.9,33,0,19,167),(179.9,18,0,19,173),(179.9,5,0,19,179),(179.9,41,0.1,19,187),(179.9,2,0,19,194),(199.9,33,0,20,3),(189.9,36,0,20,11),(199.9,30,0,20,18),(169.9,44,0.1,20,27),(199.9,5,0,20,32),(169.9,10,0,20,41),(182.9,35,0,20,48),(199.9,33,0,20,54),(182.9,18,0,20,62),(199.9,47,0.1,20,73),(199.9,8,0.2,20,80),(199.9,41,0,20,88),(189.9,34,0,20,95),(189.9,25,0.2,20,102),(189.9,14,0.2,20,109),(189.9,12,0,20,118),(199.9,12,0,20,126),(199.9,14,0,20,131),(199.9,40,0.1,20,139),(199.9,48,0,20,147),(199.9,12,0,20,153),(199.9,47,0,20,161),(199.9,25,0,20,167),(199.9,48,0,20,173),(199.9,30,0,20,179),(199.9,23,0.1,20,187),(199.9,11,0,20,194),(99.9,50,0,21,4),(109.9,13,0,21,11),(99.9,39,0,21,18),(89.9,4,0.1,21,27),(99.9,6,0,21,32),(89.9,32,0,21,41),(71.9,41,0,21,48),(99.9,10,0,21,54),(71.9,15,0,21,62),(99.9,15,0.1,21,74),(99.9,12,0.2,21,80),(99.9,44,0,21,88),(109.9,7,0,21,95),(109.9,4,0.2,21,103),(109.9,44,0.2,21,109),(109.9,20,0,21,118),(99.9,21,0,21,126),(99.9,17,0,21,131),(99.9,19,0.1,21,139),(99.9,10,0,21,148),(99.9,0,0,21,153),(99.9,8,0,21,161),(99.9,24,0,21,167),(99.9,9,0,21,173),(99.9,29,0,21,179),(99.9,36,0.1,21,187),(99.9,41,0,21,194),(199.9,13,0,22,4),(189.9,25,0,22,11),(199.9,22,0,22,19),(149.9,19,0.1,22,27),(199.9,7,0,22,32),(149.9,48,0,22,41),(123.9,12,0,22,49),(199.9,21,0,22,54),(123.9,49,0,22,62),(199.9,41,0.1,22,74),(199.9,47,0.2,22,82),(199.9,0,0,22,89),(189.9,9,0,22,96),(189.9,50,0,22,103),(189.9,5,0,22,109),(189.9,49,0,22,118),(199.9,24,0,22,126),(199.9,9,0,22,131),(199.9,41,0,22,139),(199.9,4,0.15,22,148),(199.9,49,0,22,153),(199.9,17,0,22,161),(199.9,45,0,22,167),(199.9,23,0,22,173),(199.9,7,0,22,179),(199.9,43,0.1,22,187),(199.9,29,0,22,194),(179.9,-1,0,23,4),(199.9,28,0,23,11),(179.9,17,0,23,19),(199.9,2,0.1,23,27),(179.9,10,0,23,32),(199.9,11,0,23,41),(178.9,10,0,23,49),(179.9,23,0,23,54),(178.9,6,0,23,62),(179.9,41,0.1,23,74),(179.9,25,0,23,82),(179.9,47,0,23,89),(199.9,20,0.1,23,96),(199.9,48,0,23,103),(199.9,47,0,23,110),(199.9,0,0,23,118),(179.9,41,0,23,126),(179.9,11,0,23,132),(179.9,10,0,23,139),(179.9,37,0.15,23,148),(179.9,12,0,23,153),(179.9,36,0,23,161),(179.9,46,0,23,167),(179.9,8,0,23,173),(179.9,28,0.2,23,179),(179.9,25,0,23,187),(179.9,29,0,23,194),(399.9,2,0,24,4),(394.9,16,0,24,12),(399.9,45,0,24,19),(369.9,43,0,24,27),(399.9,41,0,24,33),(369.9,4,0,24,41),(357.9,30,0,24,49),(399.9,13,0.2,24,55),(357.9,18,0,24,62),(399.9,25,0.1,24,74),(399.9,41,0,24,82),(399.9,29,0,24,89),(394.9,47,0.1,24,96),(394.9,32,0,24,103),(394.9,33,0,24,111),(394.9,31,0,24,118),(399.9,49,0,24,126),(399.9,2,0,24,132),(399.9,17,0,24,139),(399.9,1,0,24,148),(399.9,8,0,24,154),(399.9,8,0,24,161),(399.9,9,0,24,167),(399.9,6,0,24,173),(399.9,44,0.2,24,180),(399.9,8,0,24,187),(399.9,24,0,24,195),(149.9,18,0,25,4),(144.9,49,0,25,12),(149.9,45,0,25,20),(144.9,26,0,25,27),(149.9,20,0,25,33),(144.9,15,0,25,42),(135.9,22,0,25,49),(149.9,29,0.2,25,55),(135.9,29,0,25,62),(149.9,1,0,25,74),(149.9,26,0,25,82),(149.9,10,0,25,89),(144.9,44,0.1,25,96),(144.9,2,0,25,103),(144.9,18,0,25,111),(144.9,43,0,25,118),(149.9,33,0,25,127),(149.9,29,0,25,132),(149.9,46,0,25,139),(149.9,3,0,25,148),(149.9,34,0.1,25,154),(149.9,16,0,25,161),(149.9,15,0.2,25,167),(149.9,18,0,25,173),(149.9,21,0.2,25,180),(149.9,0,0,25,187),(149.9,1,0,25,195),(499.9,38,0,26,4),(494.9,27,0,26,12),(499.9,9,0,26,20),(495.9,5,0,26,27),(499.9,36,0,26,33),(495.9,37,0,26,42),(488.9,30,0,26,49),(499.9,27,0.2,26,55),(488.9,42,0.1,26,62),(499.9,25,0,26,74),(499.9,49,0,26,82),(499.9,32,0,26,90),(494.9,31,0.1,26,96),(494.9,41,0,26,103),(494.9,16,0,26,111),(494.9,33,0,26,118),(499.9,37,0,26,127),(499.9,32,0,26,132),(499.9,35,0,26,139),(499.9,31,0,26,148),(499.9,23,0.1,26,154),(499.9,1,0,26,162),(499.9,33,0.2,26,167),(499.9,5,0,26,173),(499.9,13,0,26,180),(499.9,29,0,26,188),(499.9,32,0,26,195),(329.9,36,0,27,4),(309.9,21,0,27,12),(329.9,17,0,27,20),(344.9,23,0.2,27,27),(329.9,2,0,27,34),(344.9,31,0,27,42),(347.9,49,0,27,50),(329.9,30,0,27,55),(347.9,24,0.1,27,63),(329.9,40,0,27,74),(329.9,11,0,27,82),(329.9,47,0,27,90),(309.9,25,0.1,27,96),(309.9,50,0,27,103),(309.9,22,0,27,111),(309.9,49,0,27,118),(329.9,-1,0,27,127),(329.9,27,0,27,132),(329.9,26,0,27,141),(329.9,30,0,27,148),(329.9,10,0.1,27,154),(329.9,8,0,27,162),(329.9,39,0.2,27,167),(329.9,13,0,27,173),(329.9,47,0,27,180),(329.9,8,0,27,188),(329.9,43,0,27,195),(279.9,21,0,28,4),(299.9,31,0,28,12),(279.9,30,0,28,20),(244.9,35,0.2,28,28),(279.9,35,0,28,34),(244.9,12,0,28,42),(275.9,41,0,28,50),(279.9,18,0,28,55),(275.9,45,0.1,28,63),(279.9,20,0,28,74),(279.9,44,0,28,82),(279.9,10,0,28,90),(299.9,13,0.1,28,96),(299.9,46,0,28,104),(299.9,14,0,28,111),(299.9,26,0,28,118),(279.9,6,0,28,127),(279.9,11,0,28,132),(279.9,26,0,28,141),(279.9,31,0,28,148),(279.9,44,0.1,28,154),(279.9,0,0,28,162),(279.9,20,0,28,167),(279.9,23,0,28,173),(279.9,26,0,28,180),(279.9,41,0,28,188),(279.9,7,0,28,195),(59.9,46,0,29,4),(69.9,14,0,29,12),(59.9,37,0,29,20),(44.9,30,0.2,29,28),(59.9,20,0,29,34),(44.9,47,0,29,42),(57.9,9,0,29,50),(59.9,23,0,29,55),(57.9,45,0.1,29,63),(59.9,46,0,29,75),(59.9,48,0,29,82),(59.9,43,0,29,90),(69.9,17,0,29,96),(69.9,36,0,29,104),(69.9,17,0,29,111),(69.9,2,0,29,119),(59.9,45,0,29,127),(59.9,6,0,29,132),(59.9,7,0,29,141),(59.9,45,0,29,149),(59.9,17,0.1,29,154),(59.9,7,0,29,162),(59.9,1,0,29,167),(59.9,32,0.3,29,174),(59.9,11,0,29,180),(59.9,23,0,29,188),(59.9,50,0,29,195),(599.9,38,0,30,5),(579.9,40,0,30,12),(599.9,34,0,30,21),(544.9,46,0,30,28),(599.9,15,0,30,34),(544.9,36,0,30,42),(526.9,19,0,30,50),(599.9,24,0,30,55),(526.9,24,0.1,30,63),(599.9,0,0,30,75),(599.9,16,0,30,82),(599.9,41,0,30,90),(579.9,39,0,30,96),(579.9,38,0,30,104),(579.9,49,0,30,111),(579.9,11,0,30,119),(599.9,33,0,30,127),(599.9,26,0,30,132),(599.9,45,0,30,141),(599.9,-1,0,30,149),(599.9,22,0.1,30,154),(599.9,13,0,30,162),(599.9,47,0,30,167),(599.9,26,0,30,174),(599.9,31,0,30,182),(599.9,43,0,30,189),(599.9,21,0,30,196),(299.9,1,0,31,5),(279.9,40,0,31,12),(299.9,16,0,31,21),(249.9,47,0,31,28),(299.9,14,0,31,34),(249.9,43,0,31,43),(263.9,12,0,31,50),(299.9,21,0,31,56),(263.9,40,0.1,31,63),(299.9,21,0,31,75),(299.9,2,0,31,82),(299.9,33,0.15,31,90),(279.9,23,0,31,96),(279.9,46,0,31,104),(279.9,22,0,31,112),(279.9,45,0,31,119),(299.9,28,0,31,127),(299.9,12,0,31,133),(299.9,0,0,31,141),(299.9,37,0,31,149),(299.9,32,0,31,155),(299.9,25,0,31,162),(299.9,46,0,31,168),(299.9,19,0,31,174),(299.9,4,0,31,182),(299.9,45,0,31,189),(299.9,18,0,31,196),(399.9,50,0,32,5),(389.9,29,0,32,12),(399.9,20,0,32,21),(366.9,29,0,32,28),(399.9,23,0,32,34),(366.9,2,0,32,43),(336.9,30,0,32,50),(399.9,22,0,32,56),(336.9,5,0,32,64),(399.9,47,0,32,75),(399.9,39,0,32,83),(399.9,24,0.15,32,90),(389.9,46,0,32,97),(389.9,4,0,32,104),(389.9,29,0,32,112),(389.9,36,0,32,120),(399.9,21,0,32,127),(399.9,15,0,32,133),(399.9,24,0,32,142),(399.9,35,0,32,149),(399.9,16,0,32,155),(399.9,10,0,32,162),(399.9,15,0,32,168),(399.9,8,0,32,174),(399.9,19,0,32,182),(399.9,2,0,32,189),(399.9,16,0,32,196),(229.9,34,0,33,5),(224.9,50,0,33,13),(229.9,13,0,33,21),(233.9,2,0,33,28),(229.9,42,0,33,34),(233.9,31,0,33,43),(211.9,36,0,33,50),(229.9,0,0,33,56),(211.9,34,0,33,64),(229.9,40,0,33,65),(229.9,22,0,33,69),(229.9,43,0,33,75),(229.9,20,0,33,83),(229.9,14,0,33,90),(224.9,15,0,33,97),(224.9,15,0,33,104),(224.9,6,0,33,112),(224.9,38,0,33,120),(229.9,49,0,33,127),(229.9,39,0,33,133),(229.9,16,0,33,142),(229.9,34,0,33,149),(229.9,2,0,33,155),(229.9,4,0.15,33,162),(229.9,24,0,33,168),(229.9,0,0,33,174),(229.9,22,0,33,182),(229.9,40,0,33,189),(229.9,34,0,33,196),(359.9,3,0,34,5),(369.9,37,0.1,34,13),(359.9,14,0,34,21),(344.9,19,0,34,28),(359.9,27,0,34,34),(344.9,14,0,34,43),(300.9,31,0,34,50),(359.9,27,0,34,56),(300.9,9,0,34,64),(359.9,23,0,34,65),(359.9,19,0.15,34,69),(359.9,23,0,34,75),(359.9,27,0,34,83),(359.9,30,0,34,91),(369.9,23,0,34,97),(369.9,45,0,34,104),(369.9,11,0,34,112),(369.9,37,0,34,120),(359.9,2,0,34,127),(359.9,8,0.15,34,134),(359.9,2,0,34,142),(359.9,19,0,34,150),(359.9,28,0,34,155),(359.9,19,0.15,34,163),(359.9,27,0,34,168),(359.9,6,0,34,174),(359.9,10,0,34,182),(359.9,-1,0,34,190),(359.9,32,0.15,34,196),(199.9,17,0,35,5),(209.9,36,0.1,35,13),(199.9,8,0,35,22),(189.9,16,0,35,28),(199.9,49,0,35,35),(189.9,31,0,35,43),(193.9,23,0,35,50),(199.9,44,0,35,56),(193.9,48,0,35,64),(199.9,32,0,35,65),(199.9,17,0.15,35,69),(199.9,41,0,35,75),(199.9,0,0,35,83),(199.9,-1,0,35,91),(209.9,49,0,35,97),(209.9,11,0,35,104),(209.9,0,0,35,112),(209.9,33,0.1,35,120),(199.9,7,0,35,128),(199.9,43,0.15,35,134),(199.9,50,0,35,142),(199.9,39,0,35,150),(199.9,17,0,35,155),(199.9,29,0,35,163),(199.9,17,0,35,168),(199.9,43,0,35,174),(199.9,20,0,35,182),(199.9,16,0,35,190),(199.9,7,0.15,35,196),(169.9,49,0,36,5),(164.9,20,0.1,36,14),(169.9,50,0,36,22),(179.9,42,0,36,28),(169.9,27,0,36,35),(179.9,47,0,36,43),(185.9,37,0,36,50),(169.9,36,0,36,56),(185.9,44,0,36,64),(169.9,47,0,36,66),(169.9,43,0,36,69),(169.9,43,0,36,75),(169.9,9,0,36,83),(169.9,35,0,36,91),(164.9,6,0,36,97),(164.9,23,0,36,104),(164.9,29,0,36,112),(164.9,36,0.1,36,120),(169.9,13,0,36,128),(169.9,6,0,36,134),(169.9,41,0,36,142),(169.9,41,0,36,150),(169.9,37,0,36,155),(169.9,8,0,36,163),(169.9,32,0,36,168),(169.9,25,0,36,174),(169.9,39,0,36,182),(169.9,9,0,36,190),(169.9,48,0,36,196),(109.9,47,0,37,5),(129.9,24,0.1,37,14),(109.9,9,0,37,22),(139.9,16,0,37,29),(109.9,37,0,37,35),(139.9,40,0.1,37,43),(173.9,21,0,37,51),(109.9,22,0,37,56),(173.9,9,0,37,64),(109.9,48,0,37,66),(109.9,29,0,37,69),(109.9,27,0,37,76),(109.9,25,0,37,84),(109.9,44,0,37,91),(129.9,48,0,37,98),(129.9,23,0,37,104),(129.9,22,0,37,112),(129.9,25,0.1,37,121),(109.9,6,0,37,128),(109.9,10,0,37,134),(109.9,11,0,37,142),(109.9,21,0.2,37,150),(109.9,15,0,37,155),(109.9,47,0,37,163),(109.9,29,0,37,168),(109.9,29,0,37,175),(109.9,37,0,37,182),(109.9,23,0,37,190),(109.9,39,0,37,196),(79.9,0,0,38,5),(89.9,23,0.1,38,14),(79.9,22,0,38,23),(89.9,26,0,38,29),(79.9,25,0,38,35),(89.9,22,0.1,38,43),(74.9,0,0,38,51),(79.9,1,0,38,56),(74.9,7,0,38,64),(79.9,1,0,38,66),(79.9,14,0,38,69),(79.9,20,0,38,76),(79.9,9,0,38,84),(79.9,13,0,38,91),(89.9,40,0,38,98),(89.9,31,0,38,105),(89.9,38,0,38,112),(89.9,23,0.1,38,121),(79.9,20,0,38,128),(79.9,49,0,38,134),(79.9,32,0,38,143),(79.9,16,0.2,38,150),(79.9,20,0,38,156),(79.9,28,0,38,163),(79.9,37,0,38,169),(79.9,34,0,38,175),(79.9,23,0,38,182),(79.9,0,0,38,190),(79.9,13,0,38,196),(129.9,36,0,39,5),(159.9,49,0.1,39,14),(129.9,20,0,39,23),(133.9,24,0,39,30),(129.9,24,0,39,35),(133.9,50,0.1,39,43),(137.9,40,0,39,51),(129.9,18,0,39,56),(137.9,18,0,39,64),(129.9,43,0,39,66),(129.9,16,0,39,76),(129.9,39,0,39,84),(129.9,2,0.3,39,91),(159.9,7,0,39,98),(159.9,32,0.3,39,105),(159.9,43,0,39,112),(159.9,24,0.1,39,121),(129.9,0,0,39,128),(129.9,0,0,39,134),(129.9,33,0,39,143),(129.9,6,0.2,39,150),(129.9,1,0,39,156),(129.9,2,0,39,164),(129.9,45,0,39,169),(129.9,44,0,39,175),(129.9,13,0,39,182),(129.9,33,0,39,190),(129.9,42,0,39,196),(199.9,9,0.1,40,5),(194.9,28,0,40,14),(199.9,7,0,40,23),(178.9,45,0,40,30),(199.9,33,0,40,35),(178.9,37,0.1,40,44),(191.9,6,0,40,51),(199.9,10,0,40,57),(191.9,19,0,40,64),(199.9,1,0,40,66),(199.9,25,0,40,76),(199.9,39,0,40,84),(199.9,24,0,40,92),(194.9,22,0,40,98),(194.9,25,0,40,105),(194.9,27,0,40,113),(194.9,33,0.1,40,121),(199.9,41,0,40,128),(199.9,7,0,40,134),(199.9,11,0,40,143),(199.9,48,0,40,150),(199.9,16,0,40,156),(199.9,7,0,40,164),(199.9,21,0,40,169),(199.9,29,0,40,175),(199.9,20,0,40,183),(199.9,44,0,40,190),(199.9,30,0,40,197),(8.9,31,0.1,41,5),(9.9,7,0,41,14),(8.9,40,0,41,23),(5.9,39,0,41,30),(8.9,26,0,41,35),(5.9,11,0.1,41,44),(12.9,21,0,41,51),(8.9,42,0,41,57),(12.9,49,0,41,64),(8.9,42,0,41,66),(8.9,18,0,41,76),(8.9,43,0,41,84),(8.9,22,0,41,92),(9.9,0,0,41,98),(9.9,0,0,41,105),(9.9,29,0,41,113),(9.9,21,0,41,121),(8.9,13,0,41,128),(8.9,30,0,41,134),(8.9,42,0,41,143),(8.9,2,0,41,150),(8.9,22,0,41,156),(8.9,19,0,41,164),(8.9,11,0,41,169),(8.9,6,0,41,175),(8.9,14,0,41,183),(8.9,3,0,41,190),(8.9,0,0,41,197),(109.9,9,0.1,42,5),(129.9,42,0,42,14),(109.9,5,0,42,23),(178.9,41,0,42,30),(109.9,40,0,42,36),(178.9,24,0.1,42,44),(158.9,34,0,42,51),(109.9,46,0,42,57),(158.9,28,0,42,64),(109.9,41,0,42,66),(109.9,15,0,42,76),(109.9,34,0,42,84),(109.9,40,0,42,92),(129.9,18,0,42,98),(129.9,4,0,42,105),(129.9,13,0,42,113),(129.9,33,0,42,122),(109.9,18,0,42,128),(109.9,16,0,42,135),(109.9,1,0,42,143),(109.9,35,0,42,150),(109.9,44,0,42,156),(109.9,11,0,42,164),(109.9,34,0.1,42,169),(109.9,21,0,42,175),(109.9,41,0,42,183),(109.9,3,0,42,191),(109.9,16,0,42,197),(27.9,25,0.1,43,6),(29.9,37,0,43,14),(27.9,32,0,43,23),(25.9,24,0,43,30),(27.9,25,0,43,36),(25.9,2,0,43,44),(52.9,48,0,43,51),(27.9,36,0,43,57),(52.9,0,0,43,64),(27.9,-1,0,43,67),(27.9,21,0,43,76),(27.9,29,0,43,84),(27.9,4,0,43,92),(29.9,16,0,43,98),(29.9,29,0,43,105),(29.9,18,0,43,114),(29.9,20,0,43,122),(27.9,22,0,43,128),(27.9,7,0,43,135),(27.9,46,0,43,143),(27.9,12,0,43,150),(27.9,26,0.3,43,156),(27.9,3,0,43,164),(27.9,47,0.1,43,169),(27.9,12,0,43,175),(27.9,29,0,43,183),(27.9,17,0,43,191),(27.9,43,0,43,197),(16.9,36,0.1,44,7),(26.9,36,0,44,16),(16.9,32,0,44,23),(20.9,1,0,44,30),(16.9,40,0,44,36),(20.9,50,0,44,44),(18.9,16,0,44,51),(16.9,49,0,44,57),(18.9,31,0,44,64),(16.9,7,0,44,67),(16.9,31,0,44,76),(16.9,16,0,44,84),(16.9,10,0,44,92),(26.9,38,0,44,99),(26.9,19,0,44,105),(26.9,3,0,44,114),(26.9,38,0,44,122),(16.9,36,0,44,129),(16.9,2,0,44,135),(16.9,44,0,44,143),(16.9,17,0,44,151),(16.9,12,0,44,156),(16.9,19,0,44,164),(16.9,42,0.1,44,169),(16.9,2,0,44,175),(16.9,47,0,44,183),(16.9,38,0,44,191),(16.9,26,0,44,197),(24.9,49,0.1,45,7),(29.9,27,0,45,16),(24.9,31,0,45,24),(34.9,37,0,45,30),(24.9,36,0,45,36),(34.9,3,0,45,44),(28.9,26,0,45,51),(24.9,45,0,45,57),(28.9,37,0,45,64),(24.9,14,0,45,67),(24.9,3,0,45,76),(24.9,17,0,45,85),(24.9,0,0,45,92),(29.9,44,0.15,45,99),(29.9,14,0,45,105),(29.9,9,0,45,114),(29.9,6,0,45,123),(24.9,2,0,45,129),(24.9,17,0,45,135),(24.9,12,0,45,143),(24.9,18,0,45,151),(24.9,24,0,45,156),(24.9,8,0.2,45,164),(24.9,10,0.1,45,168),(24.9,35,0,45,176),(24.9,45,0,45,184),(24.9,38,0,45,191),(24.9,45,0,45,198),(7.9,3,0,46,7),(10.9,39,0,46,16),(7.9,27,0,46,24),(5.9,48,0,46,30),(7.9,20,0,46,37),(5.9,37,0,46,44),(10.9,29,0.1,46,52),(7.9,27,0,46,58),(10.9,19,0,46,65),(7.9,31,0,46,67),(7.9,46,0,46,76),(7.9,6,0,46,85),(7.9,26,0,46,92),(10.9,2,0.15,46,99),(10.9,37,0,46,105),(10.9,1,0,46,114),(10.9,36,0,46,123),(7.9,21,0,46,130),(7.9,2,0,46,135),(7.9,24,0,46,143),(7.9,32,0,46,151),(7.9,38,0,46,156),(7.9,1,0.2,46,164),(7.9,17,0.1,46,168),(7.9,49,0.15,46,176),(7.9,34,0.3,46,184),(7.9,16,0,46,191),(7.9,37,0,46,198),(29.9,5,0,47,7),(24.9,46,0,47,16),(29.9,18,0,47,24),(33.9,44,0,47,30),(29.9,10,0,47,37),(33.9,22,0,47,44),(41.9,31,0.1,47,52),(29.9,28,0,47,58),(41.9,13,0,47,65),(29.9,42,0,47,67),(29.9,19,0,47,77),(29.9,30,0,47,85),(29.9,39,0,47,92),(24.9,17,0,47,99),(24.9,9,0,47,105),(24.9,19,0,47,114),(24.9,20,0,47,123),(29.9,17,0,47,130),(29.9,28,0,47,135),(29.9,35,0,47,144),(29.9,0,0,47,151),(29.9,3,0,47,157),(29.9,22,0.2,47,164),(29.9,42,0.1,47,168),(29.9,11,0.15,47,176),(29.9,20,0,47,184),(29.9,27,0,47,191),(29.9,19,0,47,198),(14.9,25,0,48,7),(24.9,6,0,48,16),(14.9,10,0,48,24),(17.9,47,0,48,30),(14.9,48,0,48,37),(17.9,30,0,48,44),(20.9,38,0.1,48,52),(14.9,37,0,48,58),(20.9,11,0,48,65),(14.9,45,0,48,67),(14.9,45,0,48,77),(14.9,48,0,48,85),(14.9,50,0,48,92),(24.9,33,0,48,99),(24.9,28,0,48,105),(24.9,23,0,48,114),(24.9,22,0,48,123),(14.9,38,0,48,130),(14.9,12,0,48,135),(14.9,33,0,48,144),(14.9,11,0,48,151),(14.9,8,0,48,157),(14.9,18,0,48,164),(14.9,3,0,48,168),(14.9,48,0,48,176),(14.9,24,0,48,184),(14.9,21,0,48,192),(14.9,30,0,48,198);
/*!40000 ALTER TABLE `shopproduct` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 17:22:29