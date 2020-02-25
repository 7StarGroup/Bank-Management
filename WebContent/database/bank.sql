CREATE DATABASE  IF NOT EXISTS `wellness` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wellness`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: wellness
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `admin_comment` varchar(255) DEFAULT NULL,
  `admin_comment_date` datetime DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `mentor_comment` varchar(255) DEFAULT NULL,
  `mentor_comment_date` datetime DEFAULT NULL,
  `self_comment` varchar(255) DEFAULT NULL,
  `self_comment_date` datetime DEFAULT NULL,
  `isSecondAnswer` bit(1) DEFAULT NULL,
  `is_Second_Answer` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(70) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `batch_status_id` bigint(20) DEFAULT NULL,
  `closedon` datetime DEFAULT NULL,
  `description` text,
  `onsite_start_date` datetime DEFAULT NULL,
  `nomination_end_date` datetime DEFAULT NULL,
  `daaji_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbnode7elspocqu4da5ehaqxyd` (`batch_status_id`),
  CONSTRAINT `FKbnode7elspocqu4da5ehaqxyd` FOREIGN KEY (`batch_status_id`) REFERENCES `batch_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` VALUES (1,'john.aaron@yopmail.com','2020-02-11 14:27:17','john.aaron@yopmail.com','2020-02-13 09:12:26','2020-02-09 05:30:00','\0','Hindi','B10001','Mumbai','2020-02-01 05:30:00',3,'2020-02-13 09:12:26',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_form`
--

DROP TABLE IF EXISTS `batch_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `form_sequence_no` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpsa9ragmln7nlp5y59pqmfwmq` (`batch_id`),
  KEY `FKqxhhxhi6kxublebs1b0uomb0l` (`form_id`),
  CONSTRAINT `FKpsa9ragmln7nlp5y59pqmfwmq` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FKqxhhxhi6kxublebs1b0uomb0l` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_form`
--

LOCK TABLES `batch_form` WRITE;
/*!40000 ALTER TABLE `batch_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_status`
--

DROP TABLE IF EXISTS `batch_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_status`
--

LOCK TABLES `batch_status` WRITE;
/*!40000 ALTER TABLE `batch_status` DISABLE KEYS */;
INSERT INTO `batch_status` VALUES (1,'NEW'),(2,'ACTIVE'),(3,'CLOSED');
/*!40000 ALTER TABLE `batch_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `form_type_id` bigint(20) DEFAULT NULL,
  `is_active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqn3i3e79yup1aylf8egjivyqe` (`form_type_id`),
  CONSTRAINT `FKqn3i3e79yup1aylf8egjivyqe` FOREIGN KEY (`form_type_id`) REFERENCES `form_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form`
--

LOCK TABLES `form` WRITE;
/*!40000 ALTER TABLE `form` DISABLE KEYS */;
/*!40000 ALTER TABLE `form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_question`
--

DROP TABLE IF EXISTS `form_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbhgm06g20d8o48suif14q0wr` (`question_id`),
  KEY `FKbhgm06g20d8o48suif14q85_idx` (`form_id`),
  CONSTRAINT `FKbhgm06g20d8o48suif14q0wr` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `FKbhgm06g20d8o48suif14q85` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_question`
--

LOCK TABLES `form_question` WRITE;
/*!40000 ALTER TABLE `form_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `form_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_type`
--

DROP TABLE IF EXISTS `form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_type`
--

LOCK TABLES `form_type` WRITE;
/*!40000 ALTER TABLE `form_type` DISABLE KEYS */;
INSERT INTO `form_type` VALUES (1,'QUESTION'),(2,'REFERRAL'),(3,'PERIOD');
/*!40000 ALTER TABLE `form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Hindi','john.aaron@yopmail.com','2020-02-10 12:46:33','john.aaron@yopmail.com','2020-02-10 12:46:33'),(2,'English','john.aaron@yopmail.com','2020-02-10 12:46:39','john.aaron@yopmail.com','2020-02-10 12:46:39'),(3,'Gujrathi','john.aaron@yopmail.com','2020-02-10 12:46:47','john.aaron@yopmail.com','2020-02-10 12:46:47'),(4,'Marathi','john.aaron@yopmail.com','2020-02-10 12:46:54','john.aaron@yopmail.com','2020-02-10 12:46:54');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patch_version`
--

DROP TABLE IF EXISTS `patch_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patch_version` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `patch_version` int(11) NOT NULL,
  `installed_by` varchar(100) DEFAULT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `success` tinyint(1) NOT NULL,
  `depend_patch` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patch_version`
--

LOCK TABLES `patch_version` WRITE;
/*!40000 ALTER TABLE `patch_version` DISABLE KEYS */;
INSERT INTO `patch_version` VALUES (1,NULL,2,NULL,'2019-10-11 09:19:19',0,1),(2,NULL,2,NULL,'2019-10-11 09:19:31',0,1),(3,NULL,1,NULL,'2019-10-11 09:24:35',1,0),(4,NULL,3,NULL,'2019-10-18 05:41:36',1,2),(5,NULL,5,NULL,'2020-01-31 06:59:06',0,4);
/*!40000 ALTER TABLE `patch_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_status`
--

DROP TABLE IF EXISTS `profile_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_status`
--

LOCK TABLES `profile_status` WRITE;
/*!40000 ALTER TABLE `profile_status` DISABLE KEYS */;
INSERT INTO `profile_status` VALUES (1,'NEW'),(2,'ACCEPT'),(3,'REJECT'),(4,'ACTIVE');
/*!40000 ALTER TABLE `profile_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `phrase` varchar(255) DEFAULT NULL,
  `question_type_id` bigint(20) DEFAULT NULL,
  `is_deleted` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7svspov4rexjawqdvi2jni81u` (`question_type_id`),
  CONSTRAINT `FK7svspov4rexjawqdvi2jni81u` FOREIGN KEY (`question_type_id`) REFERENCES `question_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_answer`
--

DROP TABLE IF EXISTS `question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `form_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_suggested` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKil3pbbv488omhx2gkakco46yl` (`answer_id`),
  KEY `FKdgkaggdab6hji4adf5h120bng` (`batch_id`),
  KEY `FKnq2hbwhgec5fc8qe29yxn38qw` (`form_id`),
  KEY `FKflwcda2rengsndju5f1deywok` (`question_id`),
  KEY `FKei9wdd4xm6r789xi7hgb037pd` (`user_id`),
  CONSTRAINT `FKdgkaggdab6hji4adf5h120bng` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`),
  CONSTRAINT `FKei9wdd4xm6r789xi7hgb037pd` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKflwcda2rengsndju5f1deywok` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `FKil3pbbv488omhx2gkakco46yl` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `FKnq2hbwhgec5fc8qe29yxn38qw` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_answer`
--

LOCK TABLES `question_answer` WRITE;
/*!40000 ALTER TABLE `question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_attachment`
--

DROP TABLE IF EXISTS `question_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `attachment_url` varchar(255) DEFAULT NULL,
  `is_suggested` bit(1) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_attchments_1_idx` (`question_id`),
  CONSTRAINT `FKbhgm06g20d8o48suif14q0ia` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_attachment`
--

LOCK TABLES `question_attachment` WRITE;
/*!40000 ALTER TABLE `question_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_type`
--

LOCK TABLES `question_type` WRITE;
/*!40000 ALTER TABLE `question_type` DISABLE KEYS */;
INSERT INTO `question_type` VALUES (1,'MULTICHOICE'),(2,'POLAR'),(3,'DESCRIPTIVE');
/*!40000 ALTER TABLE `question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_status`
--

DROP TABLE IF EXISTS `result_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_status`
--

LOCK TABLES `result_status` WRITE;
/*!40000 ALTER TABLE `result_status` DISABLE KEYS */;
INSERT INTO `result_status` VALUES (1,'PASS'),(2,'FAIL'),(3,'EXAMINE'),(4,'HOLD'),(5,'INVITATION SENT');
/*!40000 ALTER TABLE `result_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'ZC'),(3,'MENTOR'),(4,'CANDIDATE');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_type`
--

DROP TABLE IF EXISTS `token_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_type`
--

LOCK TABLES `token_type` WRITE;
/*!40000 ALTER TABLE `token_type` DISABLE KEYS */;
INSERT INTO `token_type` VALUES (1,'LOGIN'),(2,'RESET_PASSWORD'),(3,'CHANGE_PASSWORD'),(4,'FORGOT_PASSWORD');
/*!40000 ALTER TABLE `token_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_active` bit(1) DEFAULT NULL,
  `is_reset` bit(1) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `unique_id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `profile_status_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `FK1o2a5b8x7fdqx4uimkdb31stq` (`profile_status_id`),
  CONSTRAINT `FK1o2a5b8x7fdqx4uimkdb31stq` FOREIGN KEY (`profile_status_id`) REFERENCES `profile_status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','2019-10-11 09:16:00','admin','2019-10-11 09:16:00','John Aaron','john.aaron@yopmail.com','','','$2a$10$0Fi3Vl24puR0OzqJrJ08Te4Q9x/d1Ze3LX4K0bhVURM9UbymLiRZS','SKMW23AS7','john.aaron@yopmail.com',4),(2,'john.aaron@yopmail.com','2020-02-11 16:37:30','john.aaron@yopmail.com','2020-02-13 09:12:25','sagar ghatge','gsagar@yopmail.com','\0','\0',NULL,'C100001','gsagar@yopmail.com',2),(3,'john.aaron@yopmail.com','2020-02-11 16:37:31','john.aaron@yopmail.com','2020-02-11 16:37:31','Ishan parikh','ishan@yopmail.com','','\0',NULL,'M100001','ishan@yopmail.com',2),(4,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-13 09:12:25','Dev Roy','roy@yopmail.com','\0','\0',NULL,'C100002','roy@yopmail.com',2),(5,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-11 18:00:08','Reena Royee','royee@yopmail.com','','\0',NULL,'M100002','royee@yopmail.com',2),(6,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-13 09:12:25','Rakesh Ronee','ronee@yopmail.com','\0','\0',NULL,'C100003','ronee@yopmail.com',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_batch`
--

DROP TABLE IF EXISTS `user_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_batch` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `batch_id` bigint(20) DEFAULT NULL,
  `result_status_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `mentor_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtbo7ag7kjy7s26e17c2vospof` (`batch_id`),
  KEY `FKgxm5uej2m66i51lv26wnxp4is` (`result_status_id`),
  KEY `FK26oqep9lljv3si4s3re8lijmw` (`user_id`),
  KEY `FKtbo7ag7kjy7s26e17c2vffdsh_idx` (`mentor_id`),
  CONSTRAINT `FK26oqep9lljv3si4s3re8lijmw` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKgxm5uej2m66i51lv26wnxp4is` FOREIGN KEY (`result_status_id`) REFERENCES `result_status` (`id`),
  CONSTRAINT `FKtbo7ag7kjy7s26e17c2vffdsh` FOREIGN KEY (`mentor_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKtbo7ag7kjy7s26e17c2vospof` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_batch`
--

LOCK TABLES `user_batch` WRITE;
/*!40000 ALTER TABLE `user_batch` DISABLE KEYS */;
INSERT INTO `user_batch` VALUES (1,'john.aaron@yopmail.com','2020-02-11 16:37:31','john.aaron@yopmail.com','2020-02-11 16:37:31',1,3,2,3),(2,'john.aaron@yopmail.com','2020-02-11 16:37:31','john.aaron@yopmail.com','2020-02-11 16:37:31',1,NULL,3,NULL),(3,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-11 18:00:08',1,3,4,3),(4,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-11 18:00:08',1,NULL,5,NULL),(5,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-11 18:00:08',1,3,6,5);
/*!40000 ALTER TABLE `user_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birth_date` datetime DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_profilecol` varchar(45) DEFAULT NULL,
  `zone` varchar(45) DEFAULT NULL,
  `center` varchar(45) DEFAULT NULL,
  `date_of_joining` datetime DEFAULT NULL,
  `education` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6kwj5lk78pnhwor4pgosvb51r` (`user_id`),
  CONSTRAINT `FK6kwj5lk78pnhwor4pgosvb51r` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,'admin','2019-10-11 09:16:00','admin','2019-10-11 09:16:00','3154 Doctors Drive, Los Angeles, California, 90017','1982-05-12 00:00:00','3103413825','john.aaron@yopmail.com','John','M','https://osubeavers.com/images/2019/7/30/OSU_FB_LutonJake_F19.jpg?width=300','Aaron',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'john.aaron@yopmail.com','2020-02-11 16:37:30','john.aaron@yopmail.com','2020-02-12 15:46:53','Pune','1996-02-01 15:46:52','9890909090','gsagar@yopmail.com','sagar','M','HdImage','ghatge',2,NULL,'East','','1996-02-01 15:46:53','','','Hindi'),(3,'john.aaron@yopmail.com','2020-02-11 16:37:31','john.aaron@yopmail.com','2020-02-12 18:06:47','Mumbai','1996-02-01 18:06:47','7777777777','ishan@yopmail.com','Ishan','F','ajohndoeimageHd','parikh',3,NULL,'West','','1996-02-01 18:06:47','','','Hindi'),(4,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-12 13:18:47','Pune','1996-02-01 13:18:47','9890909090','roy@yopmail.com','Dev','M','HdImage','Roy',4,NULL,'E','','1996-02-01 13:18:47','','','Hindi'),(5,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-12 13:18:47','Mumbai','1996-02-01 13:18:47','7777777777','royee@yopmail.com','Reena','F','ajohndoeimageHd','Royee',5,NULL,'W','','1996-02-01 13:18:47','','','Hindi'),(6,'john.aaron@yopmail.com','2020-02-11 18:00:08','john.aaron@yopmail.com','2020-02-12 13:18:47','Pune','1996-02-01 13:18:47','9890909090','ronee@yopmail.com','Rakesh','M','HdImage','Ronee',6,NULL,'E','','1996-02-01 13:18:47','','','Hindi');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL,
  KEY `FKj9553ass9uctjrmh0gkqsmv0d` (`roles_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(4,4),(5,3),(6,4),(2,4),(3,3);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_token`
--

DROP TABLE IF EXISTS `user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `is_expired` bit(1) DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  `token_hash` varchar(255) DEFAULT NULL,
  `token_type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK97ipv7x3hk5cpy2adewf9fhxl` (`token_type_id`),
  KEY `FKraru0qloxyh7wacxneiam2hi7` (`user_id`),
  CONSTRAINT `FK97ipv7x3hk5cpy2adewf9fhxl` FOREIGN KEY (`token_type_id`) REFERENCES `token_type` (`id`),
  CONSTRAINT `FKraru0qloxyh7wacxneiam2hi7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_token`
--

LOCK TABLES `user_token` WRITE;
/*!40000 ALTER TABLE `user_token` DISABLE KEYS */;
INSERT INTO `user_token` VALUES (1,NULL,'2020-02-11 14:26:41','\0','2020-02-12 23:46:40','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmFhcm9uQHlvcG1haWwuY29tIiwiYXV0aCI6IkFETUlOIiwiZXhwIjoxNTgxNTMxNDAwfQ.nr7HzfmAQCveEGxitjWsA2LumEpNRTTq7FVfv_xYfcM98PdR7OAT2KVpK4LPfBG96YdrIMlk2OfFqW8NrcbL_w',1,1),(2,NULL,'2020-02-11 16:37:31','\0',NULL,'61599468859659479836',2,2),(3,NULL,'2020-02-11 16:37:31','\0',NULL,'94034115369861267375',2,3),(4,NULL,'2020-02-11 16:43:24','\0',NULL,'91387550890852856638',2,2),(5,NULL,'2020-02-11 16:46:48','\0',NULL,'32082475276497219194',2,2),(6,NULL,'2020-02-11 18:00:08','\0',NULL,'46168328300168921956',2,2),(7,NULL,'2020-02-11 18:00:08','\0',NULL,'32932530950863614920',2,4),(8,NULL,'2020-02-11 18:00:08','\0',NULL,'50411036740131972504',2,5),(9,NULL,'2020-02-11 18:00:08','\0',NULL,'83011499399110376152',2,6),(10,NULL,'2020-02-11 18:02:45','\0',NULL,'40900261659880606968',2,2),(11,NULL,'2020-02-11 18:02:46','\0',NULL,'37502272812520453505',2,4),(12,NULL,'2020-02-11 18:02:47','\0',NULL,'64220829262205415971',2,6),(13,NULL,'2020-02-11 18:04:30','\0',NULL,'66220363189679681363',2,2),(14,NULL,'2020-02-11 18:12:10','\0',NULL,'60198269235145795742',2,2),(15,NULL,'2020-02-11 18:15:43','\0',NULL,'79880897025632851122',2,2),(16,NULL,'2020-02-11 18:19:39','\0',NULL,'52516938025988831055',2,2),(17,NULL,'2020-02-11 18:20:27','\0',NULL,'53308412920749873697',2,2),(18,NULL,'2020-02-11 18:21:33','\0',NULL,'82282782523812993714',2,2),(19,NULL,'2020-02-11 18:23:46','\0',NULL,'91522299108084842650',2,2),(20,NULL,'2020-02-11 18:24:40','\0',NULL,'23278637158405774765',2,2),(21,NULL,'2020-02-11 18:26:43','\0',NULL,'48390203059232659612',2,2),(22,NULL,'2020-02-11 18:29:47','\0',NULL,'72383359331729379106',2,2),(23,NULL,'2020-02-11 18:32:57','\0',NULL,'90663896036380351059',2,2),(24,NULL,'2020-02-11 18:34:56','\0',NULL,'91453960786565751477',2,2),(25,NULL,'2020-02-11 18:37:52','\0',NULL,'73817665156310166536',2,2),(26,NULL,'2020-02-11 18:39:31','\0',NULL,'30644949441705821077',2,2),(27,NULL,'2020-02-11 18:47:45','\0',NULL,'48954286562245302651',2,2),(28,NULL,'2020-02-11 18:47:45','\0',NULL,'22559122050684407404',2,4),(29,NULL,'2020-02-11 18:47:45','\0',NULL,'38016459366044914466',2,6),(30,NULL,'2020-02-12 12:58:13','\0',NULL,'61423615447511651251',2,2),(31,NULL,'2020-02-12 12:58:13','\0',NULL,'04284307711579064045',2,4),(32,NULL,'2020-02-12 12:58:13','\0',NULL,'05034272981689689041',2,6),(33,NULL,'2020-02-12 13:06:25','\0',NULL,'35653758534717418888',2,2),(34,NULL,'2020-02-12 13:06:26','\0',NULL,'28529991274900463500',2,4),(35,NULL,'2020-02-12 13:06:26','\0',NULL,'80222197161455294402',2,6),(36,NULL,'2020-02-12 13:10:08','\0',NULL,'41636149987260125097',2,2),(37,NULL,'2020-02-12 13:10:37','\0',NULL,'87961454957218701086',2,4),(38,NULL,'2020-02-12 13:10:38','\0',NULL,'51382029596038216916',2,6),(39,NULL,'2020-02-12 13:15:52','\0',NULL,'68270027311610557417',2,2),(40,NULL,'2020-02-12 13:15:52','\0',NULL,'09247387545313116831',2,4),(41,NULL,'2020-02-12 13:15:52','\0',NULL,'09091382296883636758',2,6),(42,NULL,'2020-02-12 13:17:54','\0',NULL,'91918020890767694464',2,2),(43,NULL,'2020-02-12 13:17:54','\0',NULL,'27022702580813270537',2,4),(44,NULL,'2020-02-12 13:17:54','\0',NULL,'91325984716320104898',2,6),(45,NULL,'2020-02-12 13:18:46','\0',NULL,'52352552569719783377',2,2),(46,NULL,'2020-02-12 13:18:47','\0',NULL,'90420518724929503589',2,4),(47,NULL,'2020-02-12 13:18:47','\0',NULL,'63674522474683725513',2,6),(48,NULL,'2020-02-12 14:15:39','\0',NULL,'82460674238162181860',2,2),(49,NULL,'2020-02-12 14:35:55','\0',NULL,'58685411640723276377',2,2),(50,NULL,'2020-02-12 14:40:25','\0',NULL,'89335200935518277100',2,2),(51,NULL,'2020-02-12 14:42:49','\0',NULL,'48977083994527918910',2,2),(52,NULL,'2020-02-12 14:48:54','\0',NULL,'65042564516252332925',2,2),(53,NULL,'2020-02-12 14:50:48','\0',NULL,'66935116052480245681',2,2),(54,NULL,'2020-02-12 14:52:18','\0',NULL,'04095936002100838030',2,2),(55,NULL,'2020-02-12 14:53:28','\0',NULL,'79134527451067316568',2,2),(56,NULL,'2020-02-12 14:58:31','\0',NULL,'70428346447038253051',2,2),(57,NULL,'2020-02-12 15:17:27','\0',NULL,'39895570457229630747',2,2),(58,NULL,'2020-02-12 15:25:18','\0',NULL,'93604216848399088703',2,2),(59,NULL,'2020-02-12 15:27:44','\0',NULL,'16006675881014199531',2,2),(60,NULL,'2020-02-12 15:29:33','\0',NULL,'49110921773382960308',2,2),(61,NULL,'2020-02-12 15:34:10','\0',NULL,'13564914798232873527',2,2),(62,NULL,'2020-02-12 15:46:53','\0',NULL,'00419895029234274229',2,2),(63,NULL,'2020-02-12 16:19:57','\0','2020-02-14 01:39:56','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmFhcm9uQGdtYWlsLmNvbSIsImF1dGgiOiJBRE1JTiIsImV4cCI6MTU4MTYyNDU5Nn0.6LeqFlQmylsqQZLAjPIHQFKuDQt_xeGHxg47JO930wRIQHUtlloWl-ze3fYdoglw1Gjqm_5Y1iC_z1NkEH9CCQ',1,1),(64,NULL,'2020-02-12 16:20:59','\0','2020-02-14 01:40:59','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmFhcm9uQHlvcG1haWwuY29tIiwiYXV0aCI6IkFETUlOIiwiZXhwIjoxNTgxNjI0NjU5fQ.k1N0P9D4tUtPL60_P2unew4Y-ZBEfXG2ncRfTgKwv_AqX3VVQqRWDqGI0QkVY4AFJg0WCW6_e3lJNps5uiMReA',1,1),(65,NULL,'2020-02-13 09:10:34','\0','2020-02-23 19:10:31','eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqb2huLmFhcm9uQHlvcG1haWwuY29tIiwiYXV0aCI6IkFETUlOIiwiZXhwIjoxNTgyNDY1MjMxfQ.K2LO0U6eStjyBi2ICi9kPcaQB8Go9if4ykOaDP2agtt14TZhPBGgiNDz-I0_LP1T0vxJz2S4z6YXli5LEDKJ1Q',1,1);
/*!40000 ALTER TABLE `user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (1,'West','john.aaron@yopmail.com','2020-02-10 12:45:52','john.aaron@yopmail.com','2020-02-10 12:45:52'),(2,'East','john.aaron@yopmail.com','2020-02-10 12:46:09','john.aaron@yopmail.com','2020-02-10 12:46:09');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-26  0:17:13
