CREATE DATABASE  IF NOT EXISTS `auctionsystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `auctionsystem`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: cs336db.cnp0zklnvjct.us-east-2.rds.amazonaws.com    Database: auctionsystem
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('black','black','1202','pink@com','pink','buyer'),('diluc','diluc','edison','diluc@com','diluc','null'),('farah01','lubaba','saudi','farah@com','farah','customerrep'),('jigisha19','mavani','edison','jigisha@com','jigisha','customerrep'),('kuhu27','halder','1202','kuhu@com','kuhu','customerrep'),('pink','pink','pink','pink','pink','buyer'),('prince18','1234','newbrunswick','prince@com','prince','admin'),('venti','xiao','venti','xiao@com','xiao','buyer');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('prince18','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerts` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `alert_message` varchar(1000) DEFAULT NULL,
  `product_id` int DEFAULT '0',
  `auction_id` int DEFAULT '0',
  PRIMARY KEY (`alert_id`),
  KEY `username` (`username`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `alerts_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE,
  CONSTRAINT `alerts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (36,'venti','You have been outbidded by Prince, who has currently bidded $140.0. Bid now to get the item!',15,27),(39,'Black','You have been outbidded by Prince, who has currently bidded $140.0. Bid now to get the item!',19,30),(45,'Black','You have been outbidded by Pink, who has currently bidded $270.0. Bid now to get the item!',20,32),(46,'Black','You have been outbidded by pink, who has currently bidded $260.0. Bid now to get the item!',20,32),(47,'Black','You have been outbidded by pink, who has currently bidded $270.0. Bid now to get the item!',20,32),(48,'pink','You have been outbidded by Black, who has currently bidded $220.0. Bid now to get the item!',20,32),(49,'Black','You have been outbidded by pink, who has currently bidded $270.0. Bid now to get the item!',20,32),(50,'black','You have been outbidded by pink, who has currently bidded $200.0. Bid now to get the item!',21,33),(51,'venti','You have been outbidded by pink, who has currently bidded $230.0. Bid now to get the item!',16,35);
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auction_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `new_bid_increment` float DEFAULT '1',
  `min_price` float DEFAULT '0',
  `price` float DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `winner` varchar(20) DEFAULT NULL,
  `current_bid` float DEFAULT '0',
  PRIMARY KEY (`auction_id`),
  KEY `seller` (`seller`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `auction_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `product` (`seller`) ON DELETE CASCADE,
  CONSTRAINT `auction_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (16,10,'Black',10,150,15,'close','2021-04-25 19:44:50','2021-04-25 22:21:52','Prince',200),(27,15,'Black',5,120,10,'close','2021-04-25 22:04:14','2021-04-25 22:21:52','Prince',140),(28,17,'black',10,200,10,'close','2021-04-25 22:04:29','2021-04-25 22:21:52','No Winner',140),(29,18,'venti',10,120,10,'close','2021-04-25 22:06:15','2021-04-25 22:21:52','Black',120),(30,19,'venti',10,150,10,'close','2021-04-25 22:07:34','2021-04-25 22:21:52','No Winner',140),(32,20,'venti',10,100,10,'open','2021-04-25 22:23:35','2021-05-01 01:00:00','pink',270),(33,21,'venti',10,140,10,'open','2021-04-25 22:24:29','2021-05-01 00:00:00','pink',200),(35,16,'black',5,150,10,'open','2021-04-26 02:38:50','2021-05-23 00:00:00','pink',230),(36,17,'black',10,200,20,'open','2021-04-26 02:39:16','2021-05-24 00:00:00','venti',30),(37,22,'pink',15,300,30,'open','2021-04-26 02:40:39','2021-06-24 00:00:00','black',60);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `bid_id` int NOT NULL AUTO_INCREMENT,
  `buyer` varchar(50) DEFAULT NULL,
  `upper_limit` float DEFAULT '0',
  `is_autobid` tinyint(1) DEFAULT '0',
  `bid_increment` float DEFAULT '0',
  `amount` float DEFAULT '0',
  `auction_id` int DEFAULT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `buyer` (`buyer`),
  KEY `auction_id` (`auction_id`),
  CONSTRAINT `bid_ibfk_1` FOREIGN KEY (`buyer`) REFERENCES `account` (`username`),
  CONSTRAINT `bid_ibfk_2` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (61,NULL,200,1,20,15,16),(63,NULL,200,1,20,45,16),(65,NULL,200,1,20,85,16),(67,NULL,200,1,20,125,16),(69,NULL,200,1,20,165,16),(71,NULL,200,1,20,200,16),(174,'Black',400,1,20,10,29),(175,'venti',200,1,10,10,27),(176,'venti',200,1,10,10,28),(177,'Black',100,1,20,10,30),(178,NULL,200,1,20,15,27),(179,'venti',200,1,10,25,27),(180,NULL,200,1,10,35,27),(181,'venti',100,1,20,55,27),(182,NULL,200,1,20,75,27),(183,'venti',200,1,10,85,27),(184,NULL,200,1,10,95,27),(185,'venti',100,1,20,100,27),(186,NULL,200,1,20,120,27),(187,'venti',200,1,10,130,27),(188,NULL,200,1,10,140,27),(189,NULL,200,1,20,20,28),(190,'venti',200,1,10,30,28),(191,NULL,100,1,20,50,28),(192,'venti',200,1,20,70,28),(193,NULL,200,1,10,80,28),(194,'venti',200,1,10,90,28),(195,NULL,100,1,20,100,28),(196,'venti',200,1,20,120,28),(197,NULL,200,1,10,130,28),(198,'venti',200,1,10,140,28),(199,NULL,300,1,20,20,29),(200,'Black',400,1,20,40,29),(201,NULL,200,1,10,50,29),(202,'Black',200,1,10,60,29),(203,NULL,100,1,20,80,29),(204,'Black',200,1,20,100,29),(205,NULL,200,1,10,110,29),(206,'Black',200,1,10,120,29),(207,NULL,500,1,20,20,30),(208,'Black',100,1,20,40,30),(209,NULL,200,1,20,60,30),(210,'Black',200,1,10,70,30),(211,NULL,200,1,10,80,30),(212,'Black',100,1,20,100,30),(213,NULL,200,1,20,120,30),(214,'Black',200,1,10,130,30),(215,NULL,200,1,10,140,30),(217,'Black',250,1,20,20,32),(219,'Black',250,1,20,60,32),(221,'Black',250,1,20,100,32),(239,'pink',400,1,20,110,32),(240,'Black',250,1,20,130,32),(241,'pink',200,1,10,140,32),(242,'Black',250,1,20,160,32),(243,'pink',200,1,10,170,32),(244,'Black',250,1,20,190,32),(245,'pink',200,1,10,200,32),(246,'Black',250,1,20,220,32),(247,'pink',400,1,20,230,32),(248,'Black',250,1,20,250,32),(249,'pink',400,1,20,270,32),(250,'pink',300,1,20,10,33),(251,'pink',500,1,30,10,35),(252,'black',300,1,40,20,33),(253,'pink',300,1,20,40,33),(254,'black',200,1,20,60,33),(255,'pink',300,1,20,80,33),(256,'black',200,1,20,100,33),(257,'pink',300,1,20,120,33),(258,'black',200,1,20,140,33),(259,'pink',300,1,20,160,33),(260,'black',200,1,20,180,33),(261,'pink',300,1,20,200,33),(262,'black',-1,0,-1,60,37),(263,'venti',250,1,40,15,35),(264,'pink',500,1,30,45,35),(265,'venti',200,1,20,65,35),(266,'pink',500,1,30,95,35),(267,'venti',200,1,20,115,35),(268,'pink',500,1,30,145,35),(269,'venti',200,1,20,165,35),(270,'pink',500,1,30,195,35),(271,'venti',200,1,20,200,35),(272,'pink',500,1,30,230,35),(273,'venti',-1,0,-1,30,36);
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customerrep`
--

DROP TABLE IF EXISTS `customerrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customerrep` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `customerrep_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customerrep`
--

LOCK TABLES `customerrep` WRITE;
/*!40000 ALTER TABLE `customerrep` DISABLE KEYS */;
INSERT INTO `customerrep` VALUES ('diluc','diluc'),('farah01','lubaba'),('jigisha19','mavani'),('kuhu27','halder');
/*!40000 ALTER TABLE `customerrep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `brand` varchar(25) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `seller` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `seller` (`seller`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`seller`) REFERENCES `account` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (10,'Analog Watches','Rolex','Brown','Guy','Black'),(15,'Analog Watches','Rolex','Blue','Woman','Black'),(16,'Touchscreen Watches','piere Cardin','Blue','Man','Black'),(17,'Touchscreen Watches','sigma','black','man','black'),(18,'Digital Watches','michael kors','pink','woman','venti'),(19,'Digital Watches','piaget','purple','woman','venti'),(20,'Digital Watches','piaget','black','man','venti'),(21,'Touchscreen Watches','sigma','black','girl','venti'),(22,'Digital Watches','mont blanc','purple','woman','pink');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `customerrep_username` varchar(50) DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  `answer` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `username` (`username`),
  KEY `customerrep_username` (`customerrep_username`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE,
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`customerrep_username`) REFERENCES `customerrep` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (3,'venti','kuhu27','how to autobid?','like this');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-25 22:45:32
