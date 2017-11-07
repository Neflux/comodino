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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Type` int(11) NOT NULL,
  `Privacy` int(11) NOT NULL,
  `EmailConfirm` varchar(100) NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Simone','Culone','vendor@qwerty.com','123',0,1,'yes'),(2,'Andrea','Carbone','normal@qwerty.com','123',0,1,'yes'),(3,'Riccardo','Conte','et.netus@velsapienimperdiet.com','TDO24VOG2MC',1,1,'yes'),(4,'Matilde','Testa','risus@magnaCras.edu','VCH76PBR8FI',1,1,'yes'),(5,'Cristiano','Palumbo','eu.tempor@amet.com','SFH13YZY5ID',1,1,'yes'),(6,'Alessandro','Di Stefano','sit@nibh.net','PNR43JGM0FC',1,0,'yes'),(7,'Giulietta','Fontana','at.egestas@Nuncsollicitudincommodo.ca','EPJ37HEY1PD',1,1,'yes'),(8,'Stefania','Ceccarelli','Etiam.bibendum@vitaedolor.ca','VIL50HSN8BM',1,1,'yes'),(9,'Camilla','Rinaldi','sed.dictum@odio.com','JYS88WRZ7VE',1,0,'yes'),(10,'Samuel','Santoro','orci@velpede.com','PQQ74JNW7FA',1,1,'yes'),(11,'Angelo','Ruggiero','massa@justofaucibuslectus.net','SNY23AJA7OM',1,0,'yes'),(12,'Giovanni','Parisi','Donec.tempor.est@Inlorem.com','FAR34SWW2OP',1,0,'yes'),(13,'Veronica','Brambilla','mollis.Integer.tincidunt@semutdolor.ca','DYZ48AQN7SI',1,0,'yes'),(14,'Ginevra','Farina','ultricies.ligula.Nullam@nequepellentesquemassa.edu','HVB40ZDG2TI',1,1,'yes'),(15,'Nicolò','Ricciardi','aliquam@anteipsumprimis.com','XIB64JIV2OZ',1,0,'yes'),(16,'Chiara','Cirillo','commodo@Curabiturvel.edu','KJF96AAB3GI',1,1,'yes'),(17,'Emanuele','De Santis','Duis.volutpat@blandit.org','JCB37RLG8EQ',1,1,'yes'),(18,'Antonio','Ricci','sapien.cursus@blanditviverra.ca','HMK19TFK5II',1,1,'yes'),(19,'Giada','Colombo','in@Integer.com','OUN29WBU0PK',1,1,'yes'),(20,'Lucia','Arena','massa.lobortis.ultrices@lacusvarius.ca','RWD27LLN5IW',1,0,'yes'),(21,'Lara','Valente','sollicitudin.orci@malesuada.ca','WJQ20NIX1AO',1,1,'yes'),(22,'Jessica','Franco','eget.massa@dictummagnaUt.edu','PVB18DJB0NR',1,1,'yes'),(23,'Claudia','Caruso','vitae.aliquet@odio.org','KHR37BNN8YP',1,1,'yes'),(24,'Federica','Rossetti','vitae@orci.ca','SAQ33PBI3JC',1,0,'yes'),(25,'Tommaso','Villa','at.pede@sagittislobortismauris.org','HJH54ZQU1WH',1,1,'yes'),(26,'Samuele','Cattaneo','aliquam.arcu.Aliquam@auguemalesuada.ca','XOL63WUU7JL',1,0,'yes'),(27,'Marta','Ceccarelli','Sed.auctor.odio@loremvehicula.com','PWF59PCG9QS',1,1,'yes'),(28,'Nicoletta','Benedetti','eu@enim.org','HUV35IUS4LU',1,1,'yes'),(29,'Samuel','Russo','dolor.Fusce@ultricesmaurisipsum.ca','WLR35VYG2XG',1,1,'yes'),(30,'Giovanni','Fontana','Praesent.luctus@etrutrumnon.com','AID26IBW2YY',1,0,'yes'),(31,'Alessio','Barone','at@parturient.net','EXF65SBY1WY',1,0,'yes'),(32,'Eleonora','Marino','Donec.egestas.Aliquam@quis.net','LYU41AQI1CX',1,1,'yes'),(33,'Gaia','Napolitano','dui@consequatenimdiam.com','ZFH59OEP2BR',1,0,'yes'),(34,'Edoardo','Fontana','inceptos@facilisisfacilisismagna.net','LEX04OXB6TD',1,0,'yes'),(35,'Gianni','Albanese','non.feugiat.nec@maurisrhoncus.ca','EIQ96KNM3WB',1,1,'yes'),(36,'Paolo','Barbieri','vestibulum.lorem@loremloremluctus.net','SLJ51RGJ9YF',1,1,'yes'),(37,'Viola','De Angelis','Curabitur@adipiscingenimmi.com','JMD40RDK5DM',1,1,'yes'),(38,'Emma','Bruni','Suspendisse.eleifend@doloregestas.co.uk','RHR27TKZ8UA',1,1,'yes'),(39,'Alice','Olivieri','In@lorem.co.uk','UTF77UHT0PJ',1,0,'yes'),(40,'Mirko','Villani','eu@sapiencursus.com','BQK36FAL3HC',1,1,'yes'),(41,'Federica','Grassi','eu.odio@mauris.net','NYL20ZWH4XI',1,0,'yes'),(42,'Paolo','Piccolo','est.ac.facilisis@pede.edu','KKC09FTQ9QQ',1,0,'yes'),(43,'Eleonora','Battaglia','libero.Integer@Cum.org','YQE60PAI7YN',1,0,'yes'),(44,'Roberta','Pellegrino','lacus.Quisque.imperdiet@et.ca','ROR20XDD3HE',1,1,'yes'),(45,'Gaia','Orlando','auctor.non@Naminterdum.edu','QQO72SKQ9MR',1,0,'yes'),(46,'Simone','Fabbri','odio.Aliquam.vulputate@quam.ca','BSU96JBU4DM',1,0,'yes'),(47,'Alex','Messina','fames@eunullaat.org','AOX14WYX6LR',1,0,'yes'),(48,'Leonardo','Barone','sit@hendreritid.edu','UIS06QTL1MS',1,0,'yes'),(49,'Samuel','Marchetti','Nam.tempor@magnaPhasellusdolor.org','EIZ63DIO1LN',1,0,'yes'),(50,'Paolo','Mele','at.egestas@musDonecdignissim.com','JKC91YAV0AM',1,0,'yes'),(51,'Gianluca','Leone','auctor.nunc@malesuadaid.edu','GWZ53DYN0SA',1,0,'yes'),(52,'Andrea','Gatti','Sed@luctussitamet.net','ZRB94WSH1XC',1,1,'yes'),(53,'Lucia','Agostini','natoque.penatibus@vellectus.edu','THQ03ETX4PN',1,0,'yes'),(54,'Matteo','Martinelli','purus.sapien.gravida@Maurismolestie.co.uk','UHX77UWX2SZ',1,0,'yes'),(55,'Giuseppe','Pace','Nulla@justosit.edu','FFU55RQO3LT',1,1,'yes'),(56,'Alessandra','Palumbo','Integer.id@interdumenim.org','RQI52LZQ7FT',1,0,'yes'),(57,'Leonardo','Vitale','Nunc.ut.erat@nuncsedpede.org','XDG47FNA6FE',1,1,'yes'),(58,'Debora','Lombardo','nibh.dolor.nonummy@felisadipiscing.ca','ZSJ17VHL8ZV',1,1,'yes'),(59,'Edoardo','Marra','Sed.et@sedtortor.co.uk','XVS94MBA3JK',1,1,'yes'),(60,'Simone','Pagano','natoque@insodaleselit.ca','GEJ34DBM4SW',1,0,'yes'),(61,'Veronica','Parisi','dui.nec.urna@viverraMaecenasiaculis.com','KXG83VZZ0YQ',1,1,'yes'),(62,'Fabio','Grimaldi','Pellentesque.tincidunt@Suspendissealiquet.co.uk','JZX89UOC8AE',1,0,'yes'),(63,'Roberto','De Angelis','a.scelerisque.sed@orciquislectus.net','GXM57OOI0XK',1,1,'yes'),(64,'Marcello','Giordano','neque.Morbi.quis@faucibusidlibero.com','JMZ25UCR9CR',1,0,'yes'),(65,'Alessandro','Piazza','Donec.non@IntegermollisInteger.edu','VMX87MEY8KS',1,0,'yes'),(66,'Nicole','Gallo','ipsum.cursus.vestibulum@eget.edu','XLW07MUW0FO',1,0,'yes'),(67,'Simone','Russo','elit@temporbibendumDonec.ca','FNE11TAE3JV',1,1,'yes'),(68,'Viola','Santini','massa.Vestibulum.accumsan@diamDuismi.co.uk','PJO71WWW4HU',1,0,'yes'),(69,'Beatrice','Costantini','tempus.risus@metus.org','PMV02XQV6KG',1,1,'yes'),(70,'Paolo','Cattaneo','dictum.eu.eleifend@consectetuer.ca','DMA86OXF4MF',1,1,'yes'),(71,'Mattia','Moretti','nonummy@risus.org','JDX10ACC6LS',1,0,'yes'),(72,'Paola','Ferraro','augue@Maurisvestibulumneque.net','MDK69JKM3RR',1,0,'yes'),(73,'Serena','Conti','dui.nec.urna@FuscemollisDuis.edu','MER15RZO6BZ',1,0,'yes'),(74,'Serena','Palmieri','sapien.imperdiet@musProin.com','KMD02YNO3FK',1,0,'yes'),(75,'Alessio','Colombo','sed.facilisis@senectuset.net','SFT09GDJ2MF',1,0,'yes'),(76,'Silvia','Gallo','semper@primis.edu','NWP45RSF4LZ',1,1,'yes'),(77,'Alessio','Ferrari','Donec.at@placerat.net','TOO97SGO2II',1,1,'yes'),(78,'Emma','Barone','facilisis@montes.org','OFG76VYN2VE',1,0,'yes'),(79,'Erica','Sala','Morbi.sit.amet@velest.ca','HEI20CRH0GV',1,0,'yes'),(80,'Camilla','Caruso','hymenaeos.Mauris.ut@Maurisquisturpis.co.uk','QSB45DLB2QY',1,1,'yes'),(81,'Gianpiero','Garofalo','magna.sed@nisinibhlacinia.com','EWA45ZYH8WQ',1,0,'yes'),(82,'Debora','Napolitano','amet.ante@enimSed.co.uk','WDZ06BQT4BZ',1,0,'yes'),(83,'Filippo','Mazza','Sed@ante.edu','EYI65VHK4OY',1,0,'yes'),(84,'Beatrice','Palumbo','Aenean@elit.ca','FKK68SGK3AP',1,1,'yes'),(85,'Nicolò','Bruno','Maecenas@facilisisloremtristique.edu','EUD71BOL4TR',1,0,'yes'),(86,'Antonio','Vitale','diam.at.pretium@Inat.edu','ZIZ65ONC3PO',1,1,'yes'),(87,'Christian','Serra','amet.ultricies@nequetellus.org','RSG38PWT8RS',1,0,'yes'),(88,'Noemi','Coppola','Maecenas.mi.felis@malesuadafamesac.net','YWB07KSC7ME',1,0,'yes'),(89,'Giulia','De Santis','penatibus@sagittis.ca','XRV13DCU1JU',1,1,'yes'),(90,'Greta','Pozzi','Maecenas.mi.felis@magnased.ca','TOY08CDI8LG',1,0,'yes'),(91,'Eleonora','Grimaldi','eu.tempor.erat@dapibusidblandit.edu','XUR12JIP1VP',1,1,'yes'),(92,'Lisa','Fumagalli','consectetuer.adipiscing@Nullam.com','YCA78JTZ3EX',1,0,'yes'),(93,'Gianpaolo','Grimaldi','Fusce@ornareplacerat.edu','WVS52RFF3ZK',1,1,'yes'),(94,'Leonardo','Garofalo','magna.Lorem.ipsum@eu.edu','QVE41DPX1CJ',1,1,'yes'),(95,'Francesco','Russo','dolor.sit@Fuscefermentum.org','RGP25PIX2GL',1,0,'yes'),(96,'Valentina','Martinelli','eu@adipiscinglacus.net','VYG78DIM1WN',1,0,'yes'),(97,'Emanuele','De Simone','mi@dui.com','NMX88ENY0II',1,1,'yes'),(98,'Valeria','Villa','Proin.mi@auctorquis.net','SXI80ARD3FQ',1,0,'yes'),(99,'Daniele','Marino','et@nullaanteiaculis.org','BRT70SPW9XT',1,0,'yes'),(100,'Vanessa','Ferretti','in.felis.Nulla@nullaCras.ca','KAJ88QQX8XF',1,1,'yes'),(101,'Luca','De Rosa','vel@parturient.com','UNS34KYU6TW',1,0,'yes'),(102,'Roberta','Villani','Nulla@Naminterdumenim.org','QYD26HOH2SU',1,1,'yes'),(103,'Gianpaolo','Ferrari','at.auctor@apurus.ca','MUA51HNO6AZ',1,1,'yes'),(104,'Andrea','Barbieri','mauris.rhoncus@convallis.net','FPR15YMZ1CO',1,0,'yes'),(105,'Rebecca','Giorgi','Sed.eu.eros@arcuetpede.co.uk','WFC72UYQ9GW',1,1,'yes'),(106,'Fabio','Valentini','enim@velvenenatis.org','GZE82BRM3YR',1,0,'yes'),(107,'Gianni','Franco','magna.Nam@Nullaeu.ca','FHA80EGQ3YQ',1,0,'yes'),(108,'Paolo','Barbieri','vitae@consectetueradipiscing.org','SGQ13KDD3WX',1,1,'yes'),(109,'Domenico','Farina','in.hendrerit.consectetuer@ProindolorNulla.ca','BSP49DBY4MF',1,0,'yes'),(110,'Lara','Amato','ultricies@porttitor.org','QNU52GQZ1NJ',1,0,'yes'),(111,'Elisa','Grasso','Sed@diam.edu','HOW24HVF3YA',1,0,'yes'),(112,'Ilaria','Serra','arcu@Duis.ca','WCT08KNY7XW',1,1,'yes'),(113,'Lorenzo','De Luca','ac@Sedeu.com','KCA08XVX5JP',1,0,'yes'),(114,'Davide','Farina','Quisque@tinciduntvehicularisus.net','AEZ46JGQ2SZ',1,0,'yes'),(115,'Dario','Pagano','pharetra@ligula.ca','MHJ29EUJ1IV',1,0,'yes'),(116,'Giada','Grassi','vitae.orci.Phasellus@lectus.net','AIY41TZA5QU',1,0,'yes'),(117,'Cristina','Castelli','fermentum.metus@viverraMaecenasiaculis.ca','EZD72GQN0DQ',1,1,'yes'),(118,'Anna','Sorrentino','nonummy.ultricies@Integerurna.com','GNG17SVW2BK',1,0,'yes'),(119,'Matteo','Zanetti','vel@ridiculus.org','OSU69SDP0CR',1,1,'yes'),(120,'Luigi','Lorusso','ridiculus.mus@inlobortis.ca','OGM68HIM2HT',1,0,'yes'),(121,'Paolo','Silvestri','et@sedconsequat.edu','MHP40PST8SB',1,1,'yes'),(122,'Stefano','Greco','Nullam.vitae@blanditcongueIn.ca','QSQ93AZF1GM',1,1,'yes'),(123,'Paola','Poli','gravida.sagittis.Duis@nibh.edu','RYY06EBX5GY',1,1,'yes'),(124,'Michela','De Angelis','molestie.orci.tincidunt@nisi.co.uk','YMM84UZU7DH',1,1,'yes'),(125,'Jacopo','Marra','Aliquam@Morbi.net','DZZ64KVZ4CE',1,1,'yes'),(126,'Gabriele','Mele','semper@euismodmauris.edu','ZZS14SFE9UD',1,0,'yes'),(127,'Giulia','Marino','dictum.Proin.eget@inceptos.net','MTM02HAD9WQ',1,1,'yes'),(128,'Giorgio','Riva','molestie@dictumProineget.net','GSI37BPY0HP',1,1,'yes'),(129,'Erika','Guerra','Donec.est@Aliquamerat.ca','HET87YPV7QE',1,0,'yes'),(130,'Sara','Costantini','molestie.dapibus@Aliquam.ca','IMU64NIL2DZ',1,0,'yes'),(131,'Luca','Catalano','at@pedeultrices.edu','ZBJ94RGU2ZX',1,1,'yes'),(132,'Alice','Martinelli','montes.nascetur.ridiculus@disparturient.co.uk','YJA04YIV2YI',1,1,'yes'),(133,'Emma','Testa','libero@et.org','XQC27RTL9AX',1,0,'yes'),(134,'Luigi','Bruno','bibendum@miDuis.ca','DNX09MGT9IU',1,0,'yes'),(135,'Erica','Moro','adipiscing@auguemalesuada.co.uk','XDX48XIR2KB',1,0,'yes'),(136,'Elena','Rossetti','aliquet.libero@In.edu','GOE72LWL5ND',1,0,'yes'),(137,'Erika','Coppola','vulputate.dui@rutrumjusto.edu','QIQ76YOW3XU',1,0,'yes'),(138,'Pietro','Villani','mi@porttitor.co.uk','TXO53VMD6WP',1,1,'yes'),(139,'Caterina','Sorrentino','non@porttitor.ca','ONJ65OSB3ZO',1,1,'yes'),(140,'Lisa','Lombardi','fermentum.fermentum@atvelit.ca','MVA23CEM3HB',1,0,'yes'),(141,'Silvia','Ricci','natoque.penatibus@imperdietnon.com','QPH01WWR1CA',1,1,'yes'),(142,'Paolo','Russo','erat@ametconsectetuer.ca','UTU56MLB5CK',1,0,'yes'),(143,'Valeria','Fumagalli','sagittis.Duis@aceleifendvitae.ca','SEU14UPR4YW',1,1,'yes'),(144,'Valentina','Barone','dignissim.lacus@semperNam.edu','RZW37NRO6ZL',1,0,'yes'),(145,'Sofia','Serra','nisl.sem@mattis.co.uk','CKJ27BNO0NV',1,1,'yes'),(146,'Camilla','Sorrentino','sociis@massaMauris.org','UON21HID5FO',1,1,'yes'),(147,'Silvia','Perrone','dis.parturient@nec.net','COM45NCM0NO',1,0,'yes'),(148,'Alessandra','Grimaldi','gravida.Praesent.eu@est.edu','ZME67ZVY9JP',1,0,'yes'),(149,'Alessio','Orlando','ultrices.posuere@ligulaconsectetuerrhoncus.org','WEH16QAL4ZS',1,0,'yes'),(150,'Alice','Cavallo','et@fringillaornare.com','USN23QRY2BO',1,1,'yes'),(151,'Lorenzo','Lombardi','Duis.volutpat.nunc@tellus.co.uk','YSX85KVT7HC',1,0,'yes'),(152,'Fabio','Ruggeri','Lorem.ipsum.dolor@mus.ca','AOO92EUK1GF',1,0,'yes'),(153,'Laura','Grassi','mollis.Phasellus@metus.com','VUU84WVO8KO',1,1,'yes'),(154,'Gianni','Bernardi','Quisque.ornare.tortor@magnaaneque.com','IXZ91ERY3HZ',1,0,'yes'),(155,'Alex','Mazza','lacinia@acurnaUt.co.uk','NHW69PYM9HT',1,0,'yes'),(156,'Diego','Neri','velit.Aliquam@vitaerisus.edu','WUZ71URP0HU',1,1,'yes'),(157,'Enrico','De Rosa','mi.eleifend.egestas@accumsan.co.uk','PUB02DQL7KM',1,1,'yes'),(158,'Simone','Pinna','cursus@lacinia.net','ZRI74EOD9KJ',1,0,'yes'),(159,'Samuel','Gallo','vulputate.risus.a@orciUt.org','GCU81OFQ1ZD',1,0,'yes'),(160,'Giuseppe','Giorgi','lacus.Quisque@duiCum.co.uk','LJC68KCQ2VU',1,0,'yes'),(161,'Alice','De Rosa','consequat.purus.Maecenas@Integer.ca','GEC11XSS2VN',1,0,'yes'),(162,'Laura','Brambilla','magna.Suspendisse@maurisidsapien.ca','XUA72FBU3YJ',1,1,'yes'),(163,'Nicole','Martinelli','Ut@eratVivamus.ca','MQF02EIR1AY',1,1,'yes'),(164,'Nicola','Leone','nulla@anequeNullam.ca','KFE86EPK7TR',1,0,'yes'),(165,'Erica','Longo','posuere.at@vitaeerat.com','UFG03BIU0FO',1,1,'yes'),(166,'Andrea','Galli','diam.eu@ornare.org','KMU89EUY1RR',1,1,'yes'),(167,'Giorgia','Fumagalli','vulputate@sedfacilisis.co.uk','WDF47WQS2EH',1,0,'yes'),(168,'Simona','Lombardi','Maecenas@Integer.org','OPV13OPY7NB',1,0,'yes'),(169,'Daniele','Rossi','sit@ultricesaauctor.net','OJQ29YZH5KX',1,0,'yes'),(170,'Eleonora','Mazza','eros@egestas.net','HCJ65PFQ5YU',1,1,'yes'),(171,'Fabio','Bianco','elementum.lorem.ut@Praesent.edu','WDC14ELA9LZ',1,1,'yes'),(172,'Luca','Longo','elit@necligula.org','VBK14IVZ6EI',1,1,'yes'),(173,'Monica','Volpe','Sed@semelitpharetra.com','CNA69OVC9KS',1,0,'yes'),(174,'Alessandra','Ruggeri','libero.Morbi.accumsan@lectus.org','DRB12PXF9XB',1,1,'yes'),(175,'Michele','Villani','semper.rutrum.Fusce@augueid.co.uk','QAI70YVZ7LR',1,1,'yes'),(176,'Francesco','Pozzi','mi.enim.condimentum@purusgravida.ca','SUE90COT6NF',1,0,'yes'),(177,'Francesca','Martino','blandit@Class.com','NCK84YYI0HQ',1,1,'yes'),(178,'Luca','Lorusso','Duis@sociisnatoque.org','UUW52REX0IX',1,1,'yes'),(179,'Mario','Martinelli','porttitor@aliquamarcu.edu','ECL32SUC7QR',1,1,'yes'),(180,'Augusto','Vitali','eget@nislelementumpurus.org','GPV71RDX9CG',1,1,'yes'),(181,'Luca','Benedetti','libero.Donec.consectetuer@sodales.net','VKH37JNQ1GV',1,1,'yes'),(182,'Camilla','Ferro','aliquet.magna@lacus.org','HIZ86THW5XX',1,0,'yes'),(183,'Enrico','Barbieri','ante.Vivamus@luctusfelispurus.org','PPW96QMS0SR',1,0,'yes'),(184,'Nicole','Marchi','porttitor.interdum@velit.net','VSS34CSH0IW',1,1,'yes'),(185,'Edoardo','Arena','non.sollicitudin.a@Aenean.net','BBT64VDC3QU',1,1,'yes'),(186,'Rebecca','Orlando','a@tempordiamdictum.ca','HWO72LSM8SO',1,1,'yes'),(187,'Giulia','Gatti','eros@orciDonecnibh.com','VJE03YEE1ZY',1,0,'yes'),(188,'Armando','Galli','mauris.Morbi@orci.co.uk','PET38EVH5SG',1,0,'yes'),(189,'Sara','Moretti','auctor@netuset.co.uk','NJN04SAC8AN',1,1,'yes'),(190,'Leonardo','Pepe','erat.volutpat.Nulla@enimNuncut.ca','KGD37SZF5WI',1,1,'yes'),(191,'Alessandra','Vitale','justo.sit.amet@nisiMauris.co.uk','QZK51DTC6RZ',1,1,'yes'),(192,'Arianna','Pozzi','sit.amet.dapibus@accumsan.net','HBJ23ZDC9ZN',1,1,'yes'),(193,'Vittoria','Conte','auctor.ullamcorper.nisl@Etiamvestibulummassa.org','JRA99CAR3KR',1,0,'yes'),(194,'Noemi','Bianchi','non@justosit.net','VOG59SOI0MT',1,0,'yes'),(195,'Alberto','Pellegrini','Vestibulum.ut.eros@metusInnec.edu','DTS24YUL2TN',1,0,'yes'),(196,'Edoardo','Mazza','arcu.imperdiet@nonbibendumsed.co.uk','ABE63SEY8NT',1,0,'yes'),(197,'Roberta','Galli','felis@idrisusquis.com','SQN24ESE0AN',1,1,'yes'),(198,'Caterina','Greco','scelerisque@posuerecubilia.edu','OFJ24JYV7DQ',1,1,'yes'),(199,'Matilde','Morelli','et@consectetueradipiscing.com','MQL41WJO0QK',1,0,'yes'),(200,'Andrea','Gallo','a.auctor.non@nec.edu','EOM15PZW0PR',1,1,'yes'),(201,'Marta','Pastore','Phasellus.fermentum.convallis@lobortisquis.org','SJJ60QMW8XZ',0,0,'yes'),(202,'Mario','Zanetti','Fusce@Sed.ca','CDQ16ZCX7MY',0,1,'yes'),(203,'Veronica','Mele','Quisque.ornare@ornaresagittisfelis.edu','MYW09XVT4QE',0,1,'yes'),(204,'Serena','Barbieri','et@velconvallisin.org','QFZ60OWP9JE',0,1,'yes'),(205,'Gaia','De Angelis','eu.dolor@amet.edu','EUI21CRW0EJ',0,1,'yes'),(206,'Viola','De Santis','morbi.tristique.senectus@etmagna.org','EVE68DUM3ZZ',0,1,'yes'),(207,'Giuseppe','Ferri','parturient.montes@cursusa.com','OTW09QQO4EA',0,0,'yes'),(208,'Lorenzo','Caputo','sapien.Nunc.pulvinar@nonummyultriciesornare.com','KOL53BUU7XU',0,0,'yes'),(209,'Chiara','Bianco','mi.enim.condimentum@odiotristique.net','EOC37LXP6RV',0,0,'yes'),(210,'Monica','Franco','metus@erat.com','UCR68ESS2KF',0,1,'yes'),(211,'Lisa','Basile','Nam@mattis.ca','UJM18OOO7FJ',0,0,'yes'),(212,'Alessandra','Vitale','nisl.Nulla@dapibus.co.uk','SNR62EVV0YA',0,1,'yes'),(213,'Emma','Grasso','Praesent.eu.dui@turpis.ca','HIS12DEI4ZY',0,1,'yes'),(214,'Christian','Fiore','pede.Cras.vulputate@sit.net','KIV96JKX6KH',0,0,'yes'),(215,'Francesca','Martino','non@euismod.co.uk','ETY66DLO0WW',0,0,'yes'),(216,'Sofia','Costa','pede.et@Classaptenttaciti.ca','XCP78DXL9MD',0,0,'yes'),(217,'Cristina','Giorgi','ornare.sagittis.felis@ullamcorperDuiscursus.edu','YJI70PBR6JU',0,1,'yes'),(218,'Lara','Riva','tellus@utnullaCras.com','RNX64LUZ3XZ',0,0,'yes'),(219,'Tommaso','Costantini','lorem.luctus@aliquamadipiscing.ca','ASP22PBQ9IF',0,1,'yes'),(220,'Paolo','Ferrari','Morbi.non@vitaevelitegestas.com','CLX00DWD4TR',0,1,'yes'),(221,'Sasso','Lino','giotti@gmail.com','123',1,1,'yes'),(222,'Salvatore','Aranzulla','salvatore@aranzulla.it','123',0,1,'yes'),(228,'Gino','Speciale','uvetta@gmail.com','123',0,0,'yes');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-06 17:22:29