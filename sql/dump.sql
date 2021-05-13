-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 203.171.21.65    Database: hstudy
-- ------------------------------------------------------
-- Server version	8.0.24

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

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `provider` (`provider`),
  CONSTRAINT `Author_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `CourseProvider` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Course`
--

DROP TABLE IF EXISTS `Course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) DEFAULT NULL,
  `level` enum('Beginner','Intermediate','Advanced') DEFAULT NULL,
  `author` int DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `courseImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`author`) REFERENCES `Author` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
/*!40000 ALTER TABLE `Course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseProvider`
--

DROP TABLE IF EXISTS `CourseProvider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CourseProvider` (
  `id` int NOT NULL AUTO_INCREMENT,
  `providerName` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseProvider`
--

LOCK TABLES `CourseProvider` WRITE;
/*!40000 ALTER TABLE `CourseProvider` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseProvider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Student` (
  `sid` int NOT NULL AUTO_INCREMENT,
  `account` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatarUrl` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dob` time DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `account` (`account`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`account`) REFERENCES `Account` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentCourse`
--

DROP TABLE IF EXISTS `StudentCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentCourse` (
  `sid` int NOT NULL,
  `cid` int NOT NULL,
  `type` enum('Standard','Paid') NOT NULL,
  KEY `sid` (`sid`),
  KEY `cid` (`cid`),
  CONSTRAINT `StudentCourse_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `StudentCourse_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `Course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentCourse`
--

LOCK TABLES `StudentCourse` WRITE;
/*!40000 ALTER TABLE `StudentCourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StudentVideo`
--

DROP TABLE IF EXISTS `StudentVideo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StudentVideo` (
  `sid` int NOT NULL,
  `vid` int NOT NULL,
  `status` enum('Ongoing','Done') DEFAULT NULL,
  KEY `sid` (`sid`),
  KEY `vid` (`vid`),
  CONSTRAINT `StudentVideo_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `Student` (`sid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `StudentVideo_ibfk_2` FOREIGN KEY (`vid`) REFERENCES `VideoCourse` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StudentVideo`
--

LOCK TABLES `StudentVideo` WRITE;
/*!40000 ALTER TABLE `StudentVideo` DISABLE KEYS */;
/*!40000 ALTER TABLE `StudentVideo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VideoCourse`
--

DROP TABLE IF EXISTS `VideoCourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `VideoCourse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `videoName` varchar(255) DEFAULT NULL,
  `videoUrl` varchar(255) DEFAULT NULL,
  `course` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course` (`course`),
  CONSTRAINT `VideoCourse_ibfk_1` FOREIGN KEY (`course`) REFERENCES `Course` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideoCourse`
--

LOCK TABLES `VideoCourse` WRITE;
/*!40000 ALTER TABLE `VideoCourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `VideoCourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-13 15:03:11
