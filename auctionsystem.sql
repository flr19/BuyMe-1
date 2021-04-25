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
INSERT INTO `account` VALUES ('childe','childe','childe','childe','childe','buyer'),('farah01','lubaba','saudi','farah@com','farah','customerrep'),('jigisha19','mavani','edison','jigisha@com','jigisha','customerrep'),('kuhu27','halder','1202','kuhu@com','kuhu','customerrep'),('prince18','1234','newbrunswick','prince@com','prince','admin'),('venti','venti','venti','venti','venti','buyer'),('xiao','xiao','xiao','xiao','xiao','buyer');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

LOCK TABLES `alerts` WRITE;
/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
INSERT INTO `alerts` VALUES (5,'xiao','You have been outbidded by pink, who has currently bidded $155.0. Bid now to get the item!',4,7),(7,'venti','You have been outbidded by pink, who has currently bidded $105.0. Bid now to get the item!',5,8),(9,'childe','Dear childe, you have won the auction! Please keep the payment of amount $200 ready :)',5,8),(11,'venti','You have been outbidded by prince, who has currently bidded $310.0. Bid now to get the item!',5,9),(12,'venti','You have been outbidded by prince, who has currently bidded $115.0. Bid now to get the item!',5,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (7,4,'venti',5,100,10,'close','2021-04-25 00:12:02','2021-04-25 00:46:30','pink',155),(8,5,'xiao',5,40,40,'close','2021-04-25 00:23:55','2021-04-25 00:32:08','childe',200),(9,5,'xiao',10,120,20,'close','2021-04-25 01:03:45','2021-04-25 01:08:06','prince',310),(10,5,'xiao',5,200,10,'open','2021-04-25 01:04:09','2021-08-23 00:00:00','venti',100);
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (16,'xiao',150,1,5,10,7),(17,NULL,170,1,15,15,7),(18,'xiao',150,1,5,20,7),(19,NULL,170,1,15,35,7),(20,'xiao',150,1,5,40,7),(21,NULL,170,1,15,55,7),(22,'xiao',150,1,5,60,7),(23,NULL,170,1,15,75,7),(24,'xiao',150,1,5,80,7),(25,NULL,170,1,15,95,7),(26,'xiao',150,1,5,100,7),(27,NULL,170,1,15,115,7),(28,'xiao',150,1,5,120,7),(29,NULL,170,1,15,135,7),(30,'xiao',150,1,5,140,7),(31,NULL,170,1,15,155,7),(33,'venti',100,1,10,40,8),(34,NULL,200,1,10,45,8),(35,'venti',100,1,10,55,8),(36,NULL,200,1,10,65,8),(37,'venti',100,1,10,75,8),(38,NULL,200,1,10,85,8),(39,'venti',100,1,10,95,8),(40,NULL,200,1,10,105,8),(41,'childe',-1,0,-1,200,8),(42,'venti',300,1,20,20,9),(43,'venti',100,1,20,10,10),(44,NULL,350,1,20,30,9),(45,'venti',300,1,20,50,9),(46,NULL,350,1,20,70,9),(47,'venti',300,1,20,90,9),(48,NULL,350,1,20,110,9),(49,'venti',300,1,20,130,9),(50,NULL,350,1,20,150,9),(51,'venti',300,1,20,170,9),(52,NULL,350,1,20,190,9),(53,'venti',300,1,20,210,9),(54,NULL,350,1,20,230,9),(55,'venti',300,1,20,250,9),(56,NULL,350,1,20,270,9),(57,'venti',300,1,20,290,9),(58,NULL,350,1,20,310,9),(60,'venti',100,1,20,35,10),(62,'venti',100,1,20,70,10),(64,'venti',100,1,20,100,10);
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
INSERT INTO `customerrep` VALUES ('farah01','lubaba'),('jigisha19','mavani'),('kuhu27','halder');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Analog Watches','chopard','black','man','venti'),(5,'Analog Watches','van cleef arpels','blue','girl','xiao');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
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

-- Dump completed on 2021-04-24 21:18:03
