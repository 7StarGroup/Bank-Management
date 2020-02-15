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
  CONSTRAINT `branch_id_fk` FOREIGN KEY (`branch_id_fk`) REFERENCES `branch` (`branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (100,'saving',1000,1000),(101,'saving',1500,1001),(102,'saving',1000,1002);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `branch_id` bigint(20) NOT NULL,
  `branch_name` varchar(45) DEFAULT NULL,
  `branch_address` varchar(45) DEFAULT NULL,
  `branch_contact` varchar(45) DEFAULT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1000,'sangvi','pune','888888888','ADSW243De'),(1001,'pimple','aundh','1234567890','ASDFG44DE'),(1002,'demo','demo','0909090909','DEMODIU');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (1,'Personal Loan','9','12'),(2,'Personal Loan','9','12'),(3,'Personal Loan','9','12'),(4,'Home Loan','5','24');
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schemes`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=510 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (501,'deposit',1,NULL,NULL),(502,'DEBIT',1,'2020-01-30 00:00:00',500),(503,'CREDIT',2,'2020-01-30 00:00:00',500),(504,'DEBIT',1,'2020-01-30 00:00:00',500),(505,'CREDIT',2,'2020-01-30 00:00:00',500),(506,'DEBIT',1,'2020-02-06 00:00:00',500),(507,'CREDIT',2,'2020-02-06 00:00:00',500),(508,'DEBIT',1,'2020-02-06 00:00:00',1),(509,'CREDIT',2,'2020-02-06 00:00:00',1);
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
  `aadhar_no` int(15) DEFAULT NULL,
  `pan_url` text,
  `pan_no` varchar(10) DEFAULT NULL,
  `chequebook` bit(1) DEFAULT NULL,
  `passbook` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Mak ','mak@gmail.com','mak123','mumbai','7945545442','',NULL,12345667,NULL,'123456','',''),(2,'Gaurav','gaurav@gmail.com','gaurav123','pune','8788422224','admin',NULL,12341234,NULL,'1234567890',NULL,NULL),(3,'demo','demo@gmail.com','demo123','demo','22224','user',NULL,9090909,NULL,'0909090909',NULL,NULL);
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
  CONSTRAINT `account_id_fk` FOREIGN KEY (`account_id_fk`) REFERENCES `account` (`account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2003 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (2000,1,100,'',3499,'\0'),(2001,2,101,'',51501,'\0'),(2002,3,102,'\0',4000,'\0');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
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
  `salary_slip_url` text,
  `company_name` text,
  `is_Sanctioned` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_loan_id`),
  UNIQUE KEY `user_loan_id` (`user_loan_id`),
  KEY `loan_id_fk` (`loan_id_fk`),
  KEY `user_id_fk` (`user_id_fk`),
  CONSTRAINT `loan_id_fk` FOREIGN KEY (`loan_id_fk`) REFERENCES `loan` (`loan_id`),
  CONSTRAINT `user_loan_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_loan`
--

LOCK TABLES `user_loan` WRITE;
/*!40000 ALTER TABLE `user_loan` DISABLE KEYS */;
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

-- Dump completed on 2020-02-15 13:39:32
