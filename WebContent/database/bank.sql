CREATE DATABASE  IF NOT EXISTS `bank` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bank`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_type` varchar(45) DEFAULT NULL,
  `min_balance` bigint(20) DEFAULT NULL,
  `branch_id_fk` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`account_id`),
  KEY `branch_id_fk_idx` (`branch_id_fk`),
  CONSTRAINT `branch_id_fk` FOREIGN KEY (`branch_id_fk`) REFERENCES `branch` (`branch_id`) ON DELETE cascade on update cascade
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'saving',1500,1),(2,'saving',1500,1),(3,'saving',1500,1),(4,'saving',1500,1),(5,'saving',1500,1),(6,'saving',1500,1),(7,'saving',1500,1),(8,'saving',1500,1),(9,'saving',1500,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_name` varchar(45) DEFAULT NULL,
  `branch_address` varchar(45) DEFAULT NULL,
  `branch_contact` varchar(45) DEFAULT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'pimple gurav','Pune','8088698233','BIF541265'),(2,'Sangvi','Pune','9011521412','BIFBIF541268');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `loan_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loan_type` varchar(45) DEFAULT NULL,
  `rate_of_interest` varchar(45) DEFAULT NULL,
  `no_of_years` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'Home Loan','14','6'),(2,'Home Loan','9','9');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemes`
--


DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schemes` (
  `sid` bigint(20) NOT NULL,
  `scheme_type` varchar(45) DEFAULT NULL,
  `rate_of_interest` int(11) DEFAULT NULL,
  `no_of_years` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schemes`
--

LOCK TABLES `schemes` WRITE;
/*!40000 ALTER TABLE `schemes` DISABLE KEYS */;
/*!40000 ALTER TABLE `schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `transaction_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tran_type` varchar(45) DEFAULT NULL,
  `user_id_fk` bigint(20) DEFAULT NULL,
  `transac_date` datetime DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `user_id_fk_idx` (`user_id_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'DEBIT',8,'2020-03-02 00:00:00',500),(2,'CREDIT',8,'2020-03-02 00:00:00',500),(3,'DEBIT',8,'2020-03-02 00:00:00',500),(4,'CREDIT',8,'2020-03-02 00:00:00',500),(5,'DEBIT',9,'2020-03-03 00:00:00',32),(6,'CREDIT',8,'2020-03-03 00:00:00',32);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `aadhar_url` text,
  `aadhar_no` bigint(20) DEFAULT NULL,
  `pan_url` text,
  `pan_no` text,
  `chequebook` bit(1) DEFAULT NULL,
  `passbook` bit(1) DEFAULT NULL,
  `debitcard_applied` bit(1) DEFAULT NULL,
  `card_type` text,
  `creditcard_applied` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mak','m@gmail.com','mak123','pune','901156454','Admin',NULL,8989878765456765,NULL,'MAK123456123',NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,'gaurav1234',NULL,NULL,'Admin','C:\\Users\\Dolby\\Desktop\\Bank_Management_Mak\\bank\\WebContent\\Images\\forgotpassword_failure.JPG',1234561223455234,'\\forgotpassword_failure.JPG','GAU123123125',NULL,NULL,NULL,NULL,NULL),(8,'Pankaj','p@gmail.com','pankaj123',NULL,NULL,'Customer','C:\\Users\\Dolby\\Desktop\\Bank_Management_Mak\\bank\\WebContent\\Images\\forgotpassword_failure.JPG',1234561223455234,'\\forgotpassword_failure.JPG','PAN121212121','','',NULL,NULL,NULL),(9,'Sanjay','sanjay@gmail.com','sanjay123',NULL,NULL,'Customer','C:\\Users\\Dolby\\Desktop\\Bank_Management_Mak\\bank\\WebContent\\Images\\forgotpassword_failure.JPG',1234561223455234,'\\forgotpassword_failure.JPG','SAN121212121',NULL,NULL,NULL,NULL,NULL),(10,NULL,NULL,'mak123',NULL,NULL,'Admin','F:\\makarand\\projects\\Zip\\bank\\WebContent\\Images\\swami.jpg',1212121212121212,'\\mahesh sukhwani.txt','MAK121212121',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `ua_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id_fk` bigint(20) DEFAULT NULL,
  `account_id_fk` bigint(20) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `avail_bal` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ua_id`),
  KEY `user_id_fk_idx` (`user_id_fk`),
  KEY `account_id_fk_idx` (`account_id_fk`),
  CONSTRAINT `account_id_fk` FOREIGN KEY (`account_id_fk`) REFERENCES `account` (`account_id`) ON delete cascade on update cascade,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`) ON delete cascade on update cascade
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,3,1,'\0',1500,'\0'),(2,4,2,'\0',1500,'\0'),(3,3,3,'\0',1500,'\0'),(4,4,4,'\0',1500,'\0'),(5,5,5,'\0',1500,'\0'),(6,6,6,'\0',1500,'\0'),(7,7,7,'\0',1500,'\0'),(8,8,8,'\0',1532,'\0'),(9,9,9,'\0',1468,'\0');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `user_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cards` (
  `user_card_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_card_id`),
  KEY `user_id` (`user_id`),
  KEY `card_id` (`card_id`),
  CONSTRAINT `user_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_cards_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `cards` (`card_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cards`
--

LOCK TABLES `user_cards` WRITE;
/*!40000 ALTER TABLE `user_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cards` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `user_loan`
--

DROP TABLE IF EXISTS `user_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_loan` (
  `user_loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id_fk` bigint(20) DEFAULT NULL,
  `user_id_fk` bigint(20) DEFAULT NULL,
  `loan_amount` int(11) NOT NULL,
  `salary_slip_url` text,
  `company_name` text,
  `is_Sanctioned` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_loan_id`),
  UNIQUE KEY `user_loan_id` (`user_loan_id`),
  KEY `loan_id_fk` (`loan_id_fk`),
  KEY `user_id_fk` (`user_id_fk`),
  CONSTRAINT `loan_id_fk` FOREIGN KEY (`loan_id_fk`) REFERENCES `loan` (`loan_id`)on delete cascade on update cascade,
  CONSTRAINT `user_loan_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`) on delete cascade on update cascade
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_loan`
--

LOCK TABLES `user_loan` WRITE;
/*!40000 ALTER TABLE `user_loan` DISABLE KEYS */;
INSERT INTO `user_loan` VALUES (1,2,9,100000,'C:\\Users\\Dolby\\Desktop\\Bank_Management_Mak\\bank\\WebContent\\Images\\7.png','sasdf','\0');
/*!40000 ALTER TABLE `user_loan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-03 17:55:48
