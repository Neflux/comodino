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
-- Table structure for table `shop`
--

DROP TABLE IF EXISTS `shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop` (
  `ShopID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Website` varchar(100) NOT NULL,
  `Rating` float NOT NULL,
  PRIMARY KEY (`ShopID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop`
--

/*!40000 ALTER TABLE `shop` DISABLE KEYS */;
INSERT INTO `shop` VALUES (1,'Donec At LLP','Lorem','https://www.DonecAtLLP.com',-1),(2,'Consectetuer Adipiscing Elit Corporation','Lorem ipsum dolor sit','https://www.ConsectetuerAdipiscingElitCorporation.com',-1),(3,'Enim Etiam Industries','Lorem ipsum dolor sit amet,','https://www.EnimEtiamIndustries.com',-1),(4,'Feugiat Sed Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.FeugiatSedLimited.com',-1),(5,'Sapien Cras Dolor Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.SapienCrasDolorCorp.com',-1),(6,'Ultrices Incorporated','Lorem ipsum dolor sit amet,','https://www.UltricesIncorporated.com',-1),(7,'Tempor Est Ac Consulting','Lorem','https://www.TemporEstAcConsulting.com',-1),(8,'Nullam Corporation','Lorem ipsum dolor sit amet,','https://www.NullamCorporation.com',-1),(9,'Quis Accumsan Convallis Consulting','Lorem ipsum dolor','https://www.QuisAccumsanConvallisConsulting.com',-1),(10,'Class Aptent Corp.','Lorem ipsum','https://www.ClassAptentCorp.com',-1),(11,'Tortor Ltd','Lorem','https://www.TortorLtd.com',-1),(12,'Mauris Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.MaurisCorporation.com',-1),(13,'Ut Erat Sed LLP','Lorem ipsum','https://www.UtEratSedLLP.com',-1),(14,'Sem Vitae Corporation','Lorem ipsum dolor sit amet, consectetuer','https://www.SemVitaeCorporation.com',-1),(15,'Dictum Proin Associates','Lorem','https://www.DictumProinAssociates.com',-1),(16,'Lobortis Mauris Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.LobortisMaurisLimited.com',-1),(17,'Fermentum Risus At Corporation','Lorem ipsum','https://www.FermentumRisusAtCorporation.com',-1),(18,'Dolor Quam Elementum LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.DolorQuamElementumLLC.com',-1),(19,'Molestie Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.MolestieCorporation.com',-1),(20,'Odio Consulting','Lorem ipsum dolor','https://www.OdioConsulting.com',-1),(21,'Donec Institute','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.DonecInstitute.com',-1),(22,'Cras Eget Nisi Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.CrasEgetNisiCorp.com',-1),(23,'Sed Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.SedFoundation.com',-1),(24,'Pellentesque A Facilisis Company','Lorem ipsum','https://www.PellentesqueAFacilisisCompany.com',-1),(25,'Ridiculus Mus Donec LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.RidiculusMusDonecLLC.com',-1),(26,'Odio Auctor Vitae Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.OdioAuctorVitaeInc.com',-1),(27,'Dignissim Lacus Company','Lorem ipsum','https://www.DignissimLacusCompany.com',-1),(28,'Arcu Industries','Lorem ipsum dolor sit amet, consectetuer','https://www.ArcuIndustries.com',-1),(29,'Enim Etiam Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.EnimEtiamLtd.com',-1),(30,'Quisque Industries','Lorem ipsum dolor sit amet, consectetuer','https://www.QuisqueIndustries.com',-1),(31,'Faucibus Ut Incorporated','Lorem ipsum','https://www.FaucibusUtIncorporated.com',-1),(32,'Senectus Incorporated','Lorem','https://www.SenectusIncorporated.com',-1),(33,'Neque Et Nunc LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.NequeEtNuncLLP.com',-1),(34,'Ullamcorper Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.UllamcorperLimited.com',-1),(35,'Rhoncus Proin Nisl Institute','Lorem ipsum dolor','https://www.RhoncusProinNislInstitute.com',-1),(36,'Magna Industries','Lorem ipsum dolor sit amet, consectetuer','https://www.MagnaIndustries.com',-1),(37,'Amet Consectetuer Adipiscing Ltd','Lorem ipsum dolor sit amet,','https://www.AmetConsectetuerAdipiscingLtd.com',-1),(38,'Feugiat Ltd','Lorem ipsum dolor sit','https://www.FeugiatLtd.com',-1),(39,'Integer Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.IntegerFoundation.com',-1),(40,'Eget Varius Limited','Lorem ipsum dolor sit amet,','https://www.EgetVariusLimited.com',-1),(41,'Lacus Quisque Purus LLP','Lorem ipsum dolor','https://www.LacusQuisquePurusLLP.com',-1),(42,'Fusce Mi Lorem Corp.','Lorem ipsum','https://www.FusceMiLoremCorp.com',-1),(43,'Vitae Semper Egestas LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.VitaeSemperEgestasLLP.com',-1),(44,'Accumsan Sed Facilisis Ltd','Lorem','https://www.AccumsanSedFacilisisLtd.com',-1),(45,'Fringilla Est Company','Lorem ipsum dolor sit','https://www.FringillaEstCompany.com',-1),(46,'Purus Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.PurusInc.com',-1),(47,'Ut Semper Ltd','Lorem ipsum dolor sit','https://www.UtSemperLtd.com',-1),(48,'Felis LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.FelisLLC.com',-1),(49,'Ad Litora Consulting','Lorem ipsum dolor sit','https://www.AdLitoraConsulting.com',-1),(50,'Magna Nam Ligula Inc.','Lorem ipsum','https://www.MagnaNamLigulaInc.com',-1),(51,'Cubilia Associates','Lorem ipsum dolor sit','https://www.CubiliaAssociates.com',-1),(52,'Venenatis A Magna Inc.','Lorem ipsum dolor sit amet, consectetuer','https://www.VenenatisAMagnaInc.com',-1),(53,'Mus Proin LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.MusProinLLP.com',-1),(54,'Ut LLC','Lorem ipsum dolor sit amet,','https://www.UtLLC.com',-1),(55,'Senectus Et Netus LLP','Lorem','https://www.SenectusEtNetusLLP.com',-1),(56,'Lorem Ltd','Lorem ipsum','https://www.LoremLtd.com',-1),(57,'Est Ac Corporation','Lorem ipsum dolor','https://www.EstAcCorporation.com',-1),(58,'Nascetur Industries','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.NasceturIndustries.com',-1),(59,'Non Cursus Non Foundation','Lorem ipsum dolor','https://www.NonCursusNonFoundation.com',-1),(60,'Vel Mauris Integer Company','Lorem ipsum dolor sit','https://www.VelMaurisIntegerCompany.com',-1),(61,'Dolor Egestas Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.DolorEgestasCorporation.com',-1),(62,'Duis A Mi Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.DuisAMiLtd.com',-1),(63,'Nulla Incorporated','Lorem ipsum dolor sit','https://www.NullaIncorporated.com',-1),(64,'Ut LLC','Lorem ipsum dolor','https://www.UtLLC.com',-1),(65,'Tincidunt Donec Incorporated','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.TinciduntDonecIncorporated.com',-1),(66,'Pellentesque Ut LLC','Lorem ipsum dolor sit amet, consectetuer','https://www.PellentesqueUtLLC.com',-1),(67,'Eu Ultrices Corp.','Lorem ipsum dolor','https://www.EuUltricesCorp.com',-1),(68,'Quam Curabitur Vel Industries','Lorem ipsum dolor sit amet,','https://www.QuamCurabiturVelIndustries.com',-1),(69,'Interdum Enim Non PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.InterdumEnimNonPC.com',-1),(70,'Adipiscing Elit Consulting','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.AdipiscingElitConsulting.com',-1),(71,'Porttitor Vulputate Posuere LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.PorttitorVulputatePosuereLLC.com',-1),(72,'Sit Amet Lorem Consulting','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.SitAmetLoremConsulting.com',-1),(73,'Sem Mollis Company','Lorem ipsum','https://www.SemMollisCompany.com',-1),(74,'Libero Company','Lorem ipsum dolor sit amet,','https://www.LiberoCompany.com',-1),(75,'Tincidunt Neque Vitae Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.TinciduntNequeVitaeCorporation.com',-1),(76,'Nonummy Ac PC','Lorem ipsum dolor','https://www.NonummyAcPC.com',-1),(77,'Commodo Hendrerit Donec Company','Lorem ipsum dolor sit','https://www.CommodoHendreritDonecCompany.com',-1),(78,'Sagittis PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.SagittisPC.com',-1),(79,'Sit PC','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.SitPC.com',-1),(80,'Egestas Ltd','Lorem ipsum dolor','https://www.EgestasLtd.com',-1),(81,'Ac Eleifend Vitae Company','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.AcEleifendVitaeCompany.com',-1),(82,'Vitae Risus Limited','Lorem ipsum dolor sit amet, consectetuer','https://www.VitaeRisusLimited.com',-1),(83,'Erat In Consectetuer Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.EratInConsectetuerInc.com',-1),(84,'Metus Aliquam Erat Industries','Lorem ipsum dolor sit amet, consectetuer','https://www.MetusAliquamEratIndustries.com',-1),(85,'Metus Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.MetusLimited.com',-1),(86,'Tristique Aliquet Phasellus Incorporated','Lorem ipsum dolor sit amet, consectetuer','https://www.TristiqueAliquetPhasellusIncorporated.com',-1),(87,'Diam Associates','Lorem ipsum dolor','https://www.DiamAssociates.com',-1),(88,'Blandit Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.BlanditCorp.com',-1),(89,'Nulla Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.NullaInc.com',-1),(90,'Nec Consulting','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.NecConsulting.com',-1),(91,'Eu Eleifend Nec Foundation','Lorem ipsum','https://www.EuEleifendNecFoundation.com',-1),(92,'At Pretium Aliquet Limited','Lorem ipsum dolor sit','https://www.AtPretiumAliquetLimited.com',-1),(93,'Vitae Company','Lorem ipsum dolor sit amet, consectetuer','https://www.VitaeCompany.com',-1),(94,'Sapien PC','Lorem','https://www.SapienPC.com',-1),(95,'In Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.InLtd.com',-1),(96,'Dolor Fusce Industries','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.DolorFusceIndustries.com',-1),(97,'Vel Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.VelLtd.com',-1),(98,'Tellus Justo Sit Inc.','Lorem ipsum','https://www.TellusJustoSitInc.com',-1),(99,'Cursus Nunc Limited','Lorem','https://www.CursusNuncLimited.com',-1),(100,'Maecenas Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.MaecenasCorporation.com',-1),(101,'Vestibulum LLC','Lorem ipsum dolor sit amet, consectetuer','https://www.VestibulumLLC.com',-1),(102,'Quam Elementum Consulting','Lorem ipsum dolor sit amet,','https://www.QuamElementumConsulting.com',-1),(103,'Consectetuer Incorporated','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.ConsectetuerIncorporated.com',-1),(104,'A Purus Duis Associates','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.APurusDuisAssociates.com',-1),(105,'Non Lobortis Quis Company','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.NonLobortisQuisCompany.com',-1),(106,'Pharetra Sed Hendrerit Industries','Lorem ipsum','https://www.PharetraSedHendreritIndustries.com',-1),(107,'Ultrices Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.UltricesCorporation.com',-1),(108,'Sapien Cras Dolor Institute','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.SapienCrasDolorInstitute.com',-1),(109,'Elit Ltd','Lorem ipsum','https://www.ElitLtd.com',-1),(110,'Sed Hendrerit Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.SedHendreritLimited.com',-1),(111,'Mauris Corp.','Lorem ipsum','https://www.MaurisCorp.com',-1),(112,'Eu Erat Ltd','Lorem ipsum dolor','https://www.EuEratLtd.com',-1),(113,'Elit Etiam Industries','Lorem ipsum','https://www.ElitEtiamIndustries.com',-1),(114,'Nulla Integer Vulputate Ltd','Lorem ipsum dolor','https://www.NullaIntegerVulputateLtd.com',-1),(115,'Congue Turpis LLC','Lorem','https://www.CongueTurpisLLC.com',-1),(116,'Justo Sit Institute','Lorem ipsum dolor','https://www.JustoSitInstitute.com',-1),(117,'Mauris Blandit Enim Ltd','Lorem ipsum','https://www.MaurisBlanditEnimLtd.com',-1),(118,'Lobortis Nisi Nibh PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.LobortisNisiNibhPC.com',-1),(119,'Enim Mi Tempor LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.EnimMiTemporLLP.com',-1),(120,'Eu Neque Pellentesque Incorporated','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.EuNequePellentesqueIncorporated.com',-1),(121,'Dictum Foundation','Lorem ipsum dolor sit','https://www.DictumFoundation.com',-1),(122,'Metus In Company','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.MetusInCompany.com',-1),(123,'Dictum Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.DictumLtd.com',-1),(124,'Eget Dictum Placerat Industries','Lorem ipsum dolor sit','https://www.EgetDictumPlaceratIndustries.com',-1),(125,'Praesent Luctus Institute','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.PraesentLuctusInstitute.com',-1),(126,'Dapibus Quam Quis Inc.','Lorem ipsum dolor','https://www.DapibusQuamQuisInc.com',-1),(127,'Fusce Diam Nunc Consulting','Lorem ipsum dolor','https://www.FusceDiamNuncConsulting.com',-1),(128,'Odio Vel LLC','Lorem ipsum dolor sit amet, consectetuer','https://www.OdioVelLLC.com',-1),(129,'Purus Nullam Scelerisque PC','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.PurusNullamScelerisquePC.com',-1),(130,'Ipsum Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.IpsumCorp.com',-1),(131,'Scelerisque Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.ScelerisqueCorporation.com',-1),(132,'Nam Nulla Magna Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.NamNullaMagnaLimited.com',-1),(133,'Diam Luctus Lobortis Industries','Lorem','https://www.DiamLuctusLobortisIndustries.com',-1),(134,'Ac Eleifend Vitae Limited','Lorem ipsum dolor sit amet,','https://www.AcEleifendVitaeLimited.com',-1),(135,'Elit Nulla Facilisi Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.ElitNullaFacilisiCorp.com',-1),(136,'Vivamus Nisi Mauris Foundation','Lorem','https://www.VivamusNisiMaurisFoundation.com',-1),(137,'Morbi Neque Tellus Corp.','Lorem ipsum dolor sit amet, consectetuer','https://www.MorbiNequeTellusCorp.com',-1),(138,'Scelerisque Neque Sed Associates','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.ScelerisqueNequeSedAssociates.com',-1),(139,'Lorem Inc.','Lorem ipsum dolor sit amet,','https://www.LoremInc.com',-1),(140,'Mi Institute','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.MiInstitute.com',-1),(141,'Magna A Tortor Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.MagnaATortorInc.com',-1),(142,'Aliquam Ornare Corp.','Lorem','https://www.AliquamOrnareCorp.com',-1),(143,'Odio Consulting','Lorem ipsum','https://www.OdioConsulting.com',-1),(144,'Egestas Rhoncus Proin Company','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.EgestasRhoncusProinCompany.com',-1),(145,'Sed Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.SedLtd.com',-1),(146,'Dictum Mi Ac Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.DictumMiAcFoundation.com',-1),(147,'Blandit PC','Lorem ipsum dolor sit','https://www.BlanditPC.com',-1),(148,'Lorem Associates','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.LoremAssociates.com',-1),(149,'In Aliquet Corporation','Lorem ipsum dolor sit amet, consectetuer','https://www.InAliquetCorporation.com',-1),(150,'Tellus Eu Augue Company','Lorem','https://www.TellusEuAugueCompany.com',-1),(151,'Dui Ltd','Lorem ipsum dolor sit amet,','https://www.DuiLtd.com',-1),(152,'Leo In Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.LeoInLimited.com',-1),(153,'Nascetur Limited','Lorem ipsum dolor sit','https://www.NasceturLimited.com',-1),(154,'Ullamcorper Duis Cursus Inc.','Lorem ipsum','https://www.UllamcorperDuisCursusInc.com',-1),(155,'Ipsum Porta Elit Inc.','Lorem ipsum dolor','https://www.IpsumPortaElitInc.com',-1),(156,'Arcu Vestibulum Ante Foundation','Lorem','https://www.ArcuVestibulumAnteFoundation.com',-1),(157,'Amet Consectetuer Company','Lorem ipsum dolor sit amet,','https://www.AmetConsectetuerCompany.com',-1),(158,'Libero Associates','Lorem ipsum dolor','https://www.LiberoAssociates.com',-1),(159,'Mi Ac Mattis Foundation','Lorem','https://www.MiAcMattisFoundation.com',-1),(160,'Et Ultrices Posuere PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.EtUltricesPosuerePC.com',-1),(161,'Pede Ltd','Lorem ipsum dolor sit','https://www.PedeLtd.com',-1),(162,'Nullam LLC','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.NullamLLC.com',-1),(163,'Mollis Lectus Pede Inc.','Lorem ipsum dolor','https://www.MollisLectusPedeInc.com',-1),(164,'Inceptos Hymenaeos Mauris Company','Lorem ipsum dolor sit amet, consectetuer','https://www.InceptosHymenaeosMaurisCompany.com',-1),(165,'Dapibus Company','Lorem ipsum dolor','https://www.DapibusCompany.com',-1),(166,'Erat Volutpat Nulla Limited','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.EratVolutpatNullaLimited.com',-1),(167,'Dignissim Pharetra Nam Ltd','Lorem ipsum dolor sit','https://www.DignissimPharetraNamLtd.com',-1),(168,'Donec Ltd','Lorem ipsum dolor','https://www.DonecLtd.com',-1),(169,'A Auctor Non Company','Lorem ipsum','https://www.AAuctorNonCompany.com',-1),(170,'Massa Quisque Institute','Lorem ipsum dolor sit','https://www.MassaQuisqueInstitute.com',-1),(171,'Augue Eu Incorporated','Lorem ipsum dolor sit amet, consectetuer adipiscing','https://www.AugueEuIncorporated.com',-1),(172,'Fringilla Inc.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.FringillaInc.com',-1),(173,'Eget Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.EgetFoundation.com',-1),(174,'Justo Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.JustoFoundation.com',-1),(175,'Nunc Quisque Ornare LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.NuncQuisqueOrnareLLP.com',-1),(176,'Aliquam Nec Enim LLP','Lorem ipsum dolor sit amet, consectetuer','https://www.AliquamNecEnimLLP.com',-1),(177,'Nulla PC','Lorem ipsum dolor sit amet,','https://www.NullaPC.com',-1),(178,'Dui Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.DuiCorporation.com',-1),(179,'Nonummy Ltd','Lorem ipsum dolor sit amet,','https://www.NonummyLtd.com',-1),(180,'Nullam Suscipit Foundation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.NullamSuscipitFoundation.com',-1),(181,'Pharetra Corporation','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.PharetraCorporation.com',-1),(182,'Porttitor Vulputate Associates','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.PorttitorVulputateAssociates.com',-1),(183,'Tristique Neque Inc.','Lorem ipsum dolor','https://www.TristiqueNequeInc.com',-1),(184,'Sed Ltd','Lorem ipsum dolor sit amet,','https://www.SedLtd.com',-1),(185,'Eu Odio Phasellus PC','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.EuOdioPhasellusPC.com',-1),(186,'Turpis Aliquam Inc.','Lorem ipsum dolor sit amet, consectetuer','https://www.TurpisAliquamInc.com',-1),(187,'Elit Aliquam Ltd','Lorem ipsum dolor sit amet,','https://www.ElitAliquamLtd.com',-1),(188,'At LLP','Lorem ipsum dolor sit amet, consectetuer','https://www.AtLLP.com',-1),(189,'Ut Cursus LLP','Lorem ipsum dolor sit amet,','https://www.UtCursusLLP.com',-1),(190,'Donec Nibh Incorporated','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur sed','https://www.DonecNibhIncorporated.com',-1),(191,'Mi Corp.','Lorem ipsum dolor','https://www.MiCorp.com',-1),(192,'Molestie Orci Corp.','Lorem ipsum dolor sit amet,','https://www.MolestieOrciCorp.com',-1),(193,'Vel LLC','Lorem ipsum dolor','https://www.VelLLC.com',-1),(194,'Elementum At LLP','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.ElementumAtLLP.com',-1),(195,'Eu Dolor Incorporated','Lorem ipsum dolor sit amet,','https://www.EuDolorIncorporated.com',-1),(196,'Risus Donec Nibh Corp.','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.RisusDonecNibhCorp.com',-1),(197,'Turpis Ltd','Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','https://www.TurpisLtd.com',-1),(198,'Neque Sed Sem Company','Lorem ipsum dolor sit','https://www.NequeSedSemCompany.com',-1),(199,'Interdum Libero Dui Corp.','Lorem ipsum dolor','https://www.InterdumLiberoDuiCorp.com',-1),(200,'Feugiat Lorem Ipsum Consulting','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Curabitur','https://www.FeugiatLoremIpsumConsulting.com',-1);
/*!40000 ALTER TABLE `shop` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 17:22:28