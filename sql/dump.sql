-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: hstudy
-- ------------------------------------------------------
-- Server version       8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (5,'test2','$2a$10$YFJGUf8MNfxf4eP4rAH9yu09YctcKJBiWRlExnLnWSZebKzjL19PG');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (1,101,'Tac gia 1','Nguyen Quoc Hung','Male'),(3,102,'Tac gia 2','Nguyen Duc Long','Male'),(5,103,'Tac gia 3','Mai Thi Huong','Female'),(6,104,'Tac gia 4','Nguyen Dinh Trong','Male');
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
  `description` longtext NOT NULL,
  `courseImage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author` (`author`),
  CONSTRAINT `Course_ibfk_1` FOREIGN KEY (`author`) REFERENCES `Author` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Course`
--

LOCK TABLES `Course` WRITE;
/*!40000 ALTER TABLE `Course` DISABLE KEYS */;
INSERT INTO `Course` VALUES (5,'Learning Docker','Beginner',1,'Docker takes away repetitive, mundane configuration tasks and is used throughout the development lifecycle for fast, easy and portable application development - desktop and cloud. Docker’s comprehensive end to end platform includes UIs, CLIs, APIs and security that are engineered to work together across the entire application delivery lifecycle.\n','https://res.cloudinary.com/vn-esports/image/upload/v1622303715/tkigvukuzs8rsuyyzjth.png'),(6,'Learning Kubernetes','Intermediate',3,'Kubernetes is an open source container orchestration platform that automates many of the manual processes involved in deploying, managing, and scaling containerized applications.','https://res.cloudinary.com/vn-esports/image/upload/v1622303806/xi0vndq8igt6thrharqb.png'),(7,'Learning Webpack 4','Advanced',6,'webpack is a module bundler. Its main purpose is to bundle JavaScript files for usage in a browser, yet it is also capable of transforming, bundling, or packaging','https://res.cloudinary.com/vn-esports/image/upload/v1622304013/xaejk7cjkpnt2zqddkcb.png'),(8,'Python Data Analysis','Intermediate',5,'The core of extensible programming is defining functions. Python allows mandatory and optional arguments, keyword arguments, and even arbitrary argument lists','https://res.cloudinary.com/vn-esports/image/upload/v1622304058/mzx6qwp59d9ctq2fqt29.jpg'),(9,'Spring Framework','Beginner',1,'The Spring Framework provides a comprehensive programming and configuration model for modern Java-based enterprise applications','https://res.cloudinary.com/vn-esports/image/upload/v1622304102/l0wwqlluenree00i6m5p.png'),(10,'Learning Django','Beginner',3,'Django is a high-level Python Web framework that encourages rapid development and clean, pragmatic design. Built by experienced developers','https://res.cloudinary.com/vn-esports/image/upload/v1622304170/zq33aj5mgrkb50dekbxg.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseProvider`
--

LOCK TABLES `CourseProvider` WRITE;
/*!40000 ALTER TABLE `CourseProvider` DISABLE KEYS */;
INSERT INTO `CourseProvider` VALUES (101,'Provider 1','Hanoi','someimage','Mo ta provider 1'),(102,'Provider 2','Sa Pa','anotherimage','Mo ta provider 2'),(103,'Provider 3','Da Nang','newimabe','Mo ta provider 3'),(104,'Provider 4','HCM','awabebe','Mo ta provider 4'),(105,'Provider 123','Ninh Thuan','https://res.cloudinary.com/vn-esports/image/upload/v1621144344/lcu3ckdw5acyfvj0pqq9.jpg','This is my new course.');
/*!40000 ALTER TABLE `CourseProvider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `History`
--

DROP TABLE IF EXISTS `History`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `History` (
  `id` int NOT NULL AUTO_INCREMENT,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logUrl` varchar(255) NOT NULL,
  `student` int NOT NULL,
  `friend` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  CONSTRAINT `History_ibfk_1` FOREIGN KEY (`student`) REFERENCES `Student` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `History`
--

LOCK TABLES `History` WRITE;
/*!40000 ALTER TABLE `History` DISABLE KEYS */;
/*!40000 ALTER TABLE `History` ENABLE KEYS */;
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
  `dob` date DEFAULT NULL,
  `p_lang` varchar(10) DEFAULT 'vi-vn',
  `f_lang` varchar(10) DEFAULT 'vi-vn',
  PRIMARY KEY (`sid`),
  KEY `account` (`account`),
  CONSTRAINT `Student_ibfk_1` FOREIGN KEY (`account`) REFERENCES `Account` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES (5,5,'imbayonline@gmail.com','https://s.gravatar.com/avatar/d015d44f52731c8e88d8637e445e72de?s=100&r=x&d=retro','2021-05-16 06:45:46','1998-06-01','vi-vn','vi-vn');
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
INSERT INTO `StudentCourse` VALUES (5,9,'Standard'),(5,7,'Standard'),(5,5,'Standard'),(5,8,'Standard'),(5,5,'Standard');
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
INSERT INTO `StudentVideo` VALUES (5,34,'Done'),(5,21,'Done'),(5,22,'Done'),(5,23,'Done'),(5,6,'Done'),(5,7,'Done'),(5,35,'Done'),(5,8,'Done'),(5,9,'Done'),(5,27,'Done'),(5,24,'Done'),(5,10,'Done'),(5,11,'Done');
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
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideoCourse`
--

LOCK TABLES `VideoCourse` WRITE;
/*!40000 ALTER TABLE `VideoCourse` DISABLE KEYS */;
INSERT INTO `VideoCourse` VALUES (6,'Why create containers using Docker','https://res.cloudinary.com/vn-esports/video/upload/v1622304342/hwvct2n0rlrp8kdfbzrx.mp4',5),(7,'What you should know','https://res.cloudinary.com/vn-esports/video/upload/v1622304407/djo2r7fpxafmnls9pbn1.mp4',5),(8,'What is Docker','https://res.cloudinary.com/vn-esports/video/upload/v1622304452/gzrcadgsjhyfu4lybsiy.mp4',5),(9,'Setting up Docker','https://res.cloudinary.com/vn-esports/video/upload/v1622304465/hscvnkjqm7v3hplub5ym.mp4',5),(10,'Install Docker on Linux','https://res.cloudinary.com/vn-esports/video/upload/v1622304478/oc7iihfms1ewp4ofnr0p.mp4',5),(11,'The Docker flow Images to containers','https://res.cloudinary.com/vn-esports/video/upload/v1622304494/tazrkdqh2vuv66wnw7uv.mp4',5),(12,'The Docker flow Containers to images','https://res.cloudinary.com/vn-esports/video/upload/v1622304551/k7fknh7eodk8vvwb7cpa.mp4',5),(13,'Run processes in containers','https://res.cloudinary.com/vn-esports/video/upload/v1622304572/uk4s8sg5rukuxjmdlxqs.mp4',5),(14,'What are Dockerfiles','https://res.cloudinary.com/vn-esports/video/upload/v1622304593/mkqmrdjblo2bmjkwcvtq.mp4',5),(15,'Docker registries','https://res.cloudinary.com/vn-esports/video/upload/v1622304608/xsynhczkzod3vgttthwi.mp4',5),(16,'Welcome','https://res.cloudinary.com/vn-esports/video/upload/v1622304679/a9muxrjqm4m409dfslzo.mp4',6),(17,'What is containerization','https://res.cloudinary.com/vn-esports/video/upload/v1622304690/tm725xvverezbvokne9g.mp4',6),(18,'What is Kubernetes','https://res.cloudinary.com/vn-esports/video/upload/v1622304715/hhavnh7qswmiza2fypo0.mp4',6),(19,'Architecture of a Kubernetes cluster','https://res.cloudinary.com/vn-esports/video/upload/v1622304733/gx0g211crhq2rmt57ohn.mp4',6),(20,'Basic building blocks Nodes and pods','https://res.cloudinary.com/vn-esports/video/upload/v1622304767/znsnijfdzx483tbcksag.mp4',6),(21,'Bundle JavaScript modules with webpack 4','https://res.cloudinary.com/vn-esports/video/upload/v1622304850/xvpkua22vtfbjrbmoghf.mp4',7),(22,'What is webpack','https://res.cloudinary.com/vn-esports/video/upload/v1622304863/sgefelddw4z911mzna0k.mp4',7),(23,'Install webpack and webpack-cli','https://res.cloudinary.com/vn-esports/video/upload/v1622304887/meb0rwyvtmvvbkzqqfv8.mp4',7),(24,'Using npm build scripts','https://res.cloudinary.com/vn-esports/video/upload/v1622304901/frwmx1d2gpxfafrwx2dq.mp4',7),(25,'What is a loader','https://res.cloudinary.com/vn-esports/video/upload/v1622304930/pz9ywhfefhkshqja3per.mp4',7),(26,'What is code splitting','https://res.cloudinary.com/vn-esports/video/upload/v1622304948/z72gmw3wzrjkoph7gds8.mp4',7),(27,'Get started in data analysis with Python','https://res.cloudinary.com/vn-esports/video/upload/v1622305038/cadnxdbnzay8akonvp29.mp4',8),(28,'Warmup with Python loops','https://res.cloudinary.com/vn-esports/video/upload/v1622305073/kovkbcyyl7fv6e9qza3i.mp4',8),(29,'Sequences Lists, tuples, and the slicing syntax','https://res.cloudinary.com/vn-esports/video/upload/v1622305087/c7xd4tmmo2qmvbktbjqd.mp4',8),(30,'Anagrams overview','https://res.cloudinary.com/vn-esports/video/upload/v1622305125/rxdbzl4j3oz5sqdov7xd.mp4',8),(31,'Challenge Palindromes','https://res.cloudinary.com/vn-esports/video/upload/v1622305152/pxygk2ikkp31khhtoyco.mp4',8),(32,'Solution Palindromes','https://res.cloudinary.com/vn-esports/video/upload/v1622305166/nxsludscscp5rgnwthrh.mp4',8),(33,'pandas overview','https://res.cloudinary.com/vn-esports/video/upload/v1622305223/zd940n5qlwna67zoudcg.mp4',8),(34,'Building blocks of Spring','https://res.cloudinary.com/vn-esports/video/upload/v1622305269/ggcazoew0i4owjqwath8.mp4',9),(35,'Proxies','https://res.cloudinary.com/vn-esports/video/upload/v1622305287/t0qfse6xhngfywbl1fdz.mp4',9),(36,'The overall picture','https://res.cloudinary.com/vn-esports/video/upload/v1622305306/ealf1gie06bbglyctl9p.mp4',9),(37,'Why the lifecycle is so important','https://res.cloudinary.com/vn-esports/video/upload/v1622305339/yfkjqaxzlzngzpxewx1j.mp4',9),(38,'Init Setters','https://res.cloudinary.com/vn-esports/video/upload/v1622305351/zd54njnvjvtmdwwuzc9j.mp4',9),(39,'Challenge Building your own aspect','https://res.cloudinary.com/vn-esports/video/upload/v1622305368/qd26suriunklciwpqe44.mp4',9),(40,'Next steps','https://res.cloudinary.com/vn-esports/video/upload/v1622305382/zitoaq93zmce836pka88.mp4',9),(41,'What is Django ','https://res.cloudinary.com/vn-esports/video/upload/v1622305972/jmp2bxwtcxzou7qkbvt4.mp4',10),(42,'Create a Django project ','https://res.cloudinary.com/vn-esports/video/upload/v1622305995/mh016uzoxgyhr0sbtxaz.mp4',10),(43,'Create a Django app ','https://res.cloudinary.com/vn-esports/video/upload/v1622306008/zzxbbibpcdre8iqqa1wu.mp4',10),(44,'Models, routing, views, and templates ','https://res.cloudinary.com/vn-esports/video/upload/v1622306019/j8mtomcygkoyvtuemkei.mp4',10),(45,'Django fields ','https://res.cloudinary.com/vn-esports/video/upload/v1622306031/ba2rumd9wqn6ufjfsqlk.mp4',10),(46,'Django migrations ','https://res.cloudinary.com/vn-esports/video/upload/v1622306046/dv7exirkzqagj30uaoi7.mp4',10),(47,'Understand URL patterns ','https://res.cloudinary.com/vn-esports/video/upload/v1622306062/dnmhuwdys021vhfgpue6.mp4',10),(48,'Create your first Django template ','https://res.cloudinary.com/vn-esports/video/upload/v1622306147/plyiu6xzyt8axqhc21q7.mp4',10);
/*!40000 ALTER TABLE `VideoCourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add address',7,'add_address'),(26,'Can change address',7,'change_address'),(27,'Can delete address',7,'delete_address'),(28,'Can view address',7,'view_address'),(29,'Can add authentication',8,'add_authentication'),(30,'Can change authentication',8,'change_authentication'),(31,'Can delete authentication',8,'delete_authentication'),(32,'Can view authentication',8,'view_authentication'),(33,'Can add cart',9,'add_cart'),(34,'Can change cart',9,'change_cart'),(35,'Can delete cart',9,'delete_cart'),(36,'Can view cart',9,'view_cart'),(37,'Can add customer',10,'add_customer'),(38,'Can change customer',10,'change_customer'),(39,'Can delete customer',10,'delete_customer'),(40,'Can view customer',10,'view_customer'),(41,'Can add fullname',11,'add_fullname'),(42,'Can change fullname',11,'change_fullname'),(43,'Can delete fullname',11,'delete_fullname'),(44,'Can view fullname',11,'view_fullname'),(45,'Can add item',12,'add_item'),(46,'Can change item',12,'change_item'),(47,'Can delete item',12,'delete_item'),(48,'Can view item',12,'view_item'),(49,'Can add keyword',13,'add_keyword'),(50,'Can change keyword',13,'change_keyword'),(51,'Can delete keyword',13,'delete_keyword'),(52,'Can view keyword',13,'view_keyword'),(53,'Can add order state',14,'add_orderstate'),(54,'Can change order state',14,'change_orderstate'),(55,'Can delete order state',14,'delete_orderstate'),(56,'Can view order state',14,'view_orderstate'),(57,'Can add payment',15,'add_payment'),(58,'Can change payment',15,'change_payment'),(59,'Can delete payment',15,'delete_payment'),(60,'Can view payment',15,'view_payment'),(61,'Can add product',16,'add_product'),(62,'Can change product',16,'change_product'),(63,'Can delete product',16,'delete_product'),(64,'Can view product',16,'view_product'),(65,'Can add shipment',17,'add_shipment'),(66,'Can change shipment',17,'change_shipment'),(67,'Can delete shipment',17,'delete_shipment'),(68,'Can view shipment',17,'view_shipment'),(69,'Can add bank account payment',18,'add_bankaccountpayment'),(70,'Can change bank account payment',18,'change_bankaccountpayment'),(71,'Can delete bank account payment',18,'delete_bankaccountpayment'),(72,'Can view bank account payment',18,'view_bankaccountpayment'),(73,'Can add book',19,'add_book'),(74,'Can change book',19,'change_book'),(75,'Can delete book',19,'delete_book'),(76,'Can view book',19,'view_book'),(77,'Can add cancel',20,'add_cancel'),(78,'Can change cancel',20,'change_cancel'),(79,'Can delete cancel',20,'delete_cancel'),(80,'Can view cancel',20,'view_cancel'),(81,'Can add card payment',21,'add_cardpayment'),(82,'Can change card payment',21,'change_cardpayment'),(83,'Can delete card payment',21,'delete_cardpayment'),(84,'Can view card payment',21,'view_cardpayment'),(85,'Can add cash payment',22,'add_cashpayment'),(86,'Can change cash payment',22,'change_cashpayment'),(87,'Can delete cash payment',22,'delete_cashpayment'),(88,'Can view cash payment',22,'view_cashpayment'),(89,'Can add clothes',23,'add_clothes'),(90,'Can change clothes',23,'change_clothes'),(91,'Can delete clothes',23,'delete_clothes'),(92,'Can view clothes',23,'view_clothes'),(93,'Can add confirm',24,'add_confirm'),(94,'Can change confirm',24,'change_confirm'),(95,'Can delete confirm',24,'delete_confirm'),(96,'Can view confirm',24,'view_confirm'),(97,'Can add electronics',25,'add_electronics'),(98,'Can change electronics',25,'change_electronics'),(99,'Can delete electronics',25,'delete_electronics'),(100,'Can view electronics',25,'view_electronics'),(101,'Can add facebook authentication',26,'add_facebookauthentication'),(102,'Can change facebook authentication',26,'change_facebookauthentication'),(103,'Can delete facebook authentication',26,'delete_facebookauthentication'),(104,'Can view facebook authentication',26,'view_facebookauthentication'),(105,'Can add fast shipment',27,'add_fastshipment'),(106,'Can change fast shipment',27,'change_fastshipment'),(107,'Can delete fast shipment',27,'delete_fastshipment'),(108,'Can view fast shipment',27,'view_fastshipment'),(109,'Can add google authentication',28,'add_googleauthentication'),(110,'Can change google authentication',28,'change_googleauthentication'),(111,'Can delete google authentication',28,'delete_googleauthentication'),(112,'Can view google authentication',28,'view_googleauthentication'),(113,'Can add pending',29,'add_pending'),(114,'Can change pending',29,'change_pending'),(115,'Can delete pending',29,'delete_pending'),(116,'Can view pending',29,'view_pending'),(117,'Can add shipping',30,'add_shipping'),(118,'Can change shipping',30,'change_shipping'),(119,'Can delete shipping',30,'delete_shipping'),(120,'Can view shipping',30,'view_shipping'),(121,'Can add standard shipment',31,'add_standardshipment'),(122,'Can change standard shipment',31,'change_standardshipment'),(123,'Can delete standard shipment',31,'delete_standardshipment'),(124,'Can view standard shipment',31,'view_standardshipment'),(125,'Can add order',32,'add_order'),(126,'Can change order',32,'change_order'),(127,'Can delete order',32,'delete_order'),(128,'Can view order',32,'view_order'),(129,'Can add item view',33,'add_itemview'),(130,'Can change item view',33,'change_itemview'),(131,'Can delete item view',33,'delete_itemview'),(132,'Can view item view',33,'view_itemview'),(133,'Can add item recommend',34,'add_itemrecommend'),(134,'Can change item recommend',34,'change_itemrecommend'),(135,'Can delete item recommend',34,'delete_itemrecommend'),(136,'Can view item recommend',34,'view_itemrecommend'),(137,'Can add item rating',35,'add_itemrating'),(138,'Can change item rating',35,'change_itemrating'),(139,'Can delete item rating',35,'delete_itemrating'),(140,'Can view item rating',35,'view_itemrating'),(141,'Can add item keyword',36,'add_itemkeyword'),(142,'Can change item keyword',36,'change_itemkeyword'),(143,'Can delete item keyword',36,'delete_itemkeyword'),(144,'Can view item keyword',36,'view_itemkeyword'),(145,'Can add item comment',37,'add_itemcomment'),(146,'Can change item comment',37,'change_itemcomment'),(147,'Can delete item comment',37,'delete_itemcomment'),(148,'Can view item comment',37,'view_itemcomment'),(149,'Can add cart detail',38,'add_cartdetail'),(150,'Can change cart detail',38,'change_cartdetail'),(151,'Can delete cart detail',38,'delete_cartdetail'),(152,'Can view cart detail',38,'view_cartdetail'),(153,'Can add customer search',39,'add_customersearch'),(154,'Can change customer search',39,'change_customersearch'),(155,'Can delete customer search',39,'delete_customersearch'),(156,'Can view customer search',39,'view_customersearch');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_address`
--

DROP TABLE IF EXISTS `boec_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_address`
--

LOCK TABLES `boec_address` WRITE;
/*!40000 ALTER TABLE `boec_address` DISABLE KEYS */;
INSERT INTO `boec_address` VALUES (1,'20 Doi can','Ba dinh','Ha Noi'),(2,'20 Doi can','Hoan Kiem','Ha Noi'),(3,'20 Doi can','Quan 1','Thanh Pho Ho Chi Minh'),(4,'20 Doi can','Quan 2','Thanh Pho Ho Chi Minh');
/*!40000 ALTER TABLE `boec_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_authentication`
--

DROP TABLE IF EXISTS `boec_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_authentication` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` longtext NOT NULL,
  `email` longtext NOT NULL,
  `image` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_authentication`
--

LOCK TABLES `boec_authentication` WRITE;
/*!40000 ALTER TABLE `boec_authentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_bankaccountpayment`
--

DROP TABLE IF EXISTS `boec_bankaccountpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_bankaccountpayment` (
  `payment_ptr_id` int NOT NULL,
  `accountNumber` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_ptr_id`),
  CONSTRAINT `boec_bankaccountpaym_payment_ptr_id_e411e0ca_fk_boec_paym` FOREIGN KEY (`payment_ptr_id`) REFERENCES `boec_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_bankaccountpayment`
--

LOCK TABLES `boec_bankaccountpayment` WRITE;
/*!40000 ALTER TABLE `boec_bankaccountpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_bankaccountpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_book`
--

DROP TABLE IF EXISTS `boec_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_book` (
  `product_id_id` int NOT NULL,
  PRIMARY KEY (`product_id_id`),
  CONSTRAINT `boec_book_product_id_id_5e6d6636_fk_boec_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `boec_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_book`
--

LOCK TABLES `boec_book` WRITE;
/*!40000 ALTER TABLE `boec_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_cancel`
--

DROP TABLE IF EXISTS `boec_cancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_cancel` (
  `orderState_id_id` int NOT NULL,
  PRIMARY KEY (`orderState_id_id`),
  CONSTRAINT `boec_cancel_orderState_id_id_d88b3a0e_fk_boec_orderstate_id` FOREIGN KEY (`orderState_id_id`) REFERENCES `boec_orderstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_cancel`
--

LOCK TABLES `boec_cancel` WRITE;
/*!40000 ALTER TABLE `boec_cancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_cancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_cardpayment`
--

DROP TABLE IF EXISTS `boec_cardpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_cardpayment` (
  `payment_ptr_id` int NOT NULL,
  `cardNumber` varchar(255) NOT NULL,
  `cardType` varchar(255) NOT NULL,
  PRIMARY KEY (`payment_ptr_id`),
  CONSTRAINT `boec_cardpayment_payment_ptr_id_6e1e7126_fk_boec_payment_id` FOREIGN KEY (`payment_ptr_id`) REFERENCES `boec_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_cardpayment`
--

LOCK TABLES `boec_cardpayment` WRITE;
/*!40000 ALTER TABLE `boec_cardpayment` DISABLE KEYS */;
INSERT INTO `boec_cardpayment` VALUES (1,'928732','VISA'),(2,'928732','VISA'),(3,'928732','VISA'),(4,'928732','VISA'),(5,'928732','VISA'),(6,'928732','VISA'),(7,'928732','VISA');
/*!40000 ALTER TABLE `boec_cardpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_cart`
--

DROP TABLE IF EXISTS `boec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_cart`
--

LOCK TABLES `boec_cart` WRITE;
/*!40000 ALTER TABLE `boec_cart` DISABLE KEYS */;
INSERT INTO `boec_cart` VALUES (1,2,14000000),(2,2,14000000),(3,2,14000000),(4,2,14000000),(5,2,14000000),(6,3,21000000),(7,4,28000000);
/*!40000 ALTER TABLE `boec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_cartdetail`
--

DROP TABLE IF EXISTS `boec_cartdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_cartdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `cart_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_cartdetail_cart_id_63f53a70_fk_boec_cart_id` (`cart_id`),
  KEY `boec_cartdetail_item_id_3055bbf7_fk_boec_item_id` (`item_id`),
  CONSTRAINT `boec_cartdetail_cart_id_63f53a70_fk_boec_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `boec_cart` (`id`),
  CONSTRAINT `boec_cartdetail_item_id_3055bbf7_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_cartdetail`
--

LOCK TABLES `boec_cartdetail` WRITE;
/*!40000 ALTER TABLE `boec_cartdetail` DISABLE KEYS */;
INSERT INTO `boec_cartdetail` VALUES (1,1,700000,1,1),(2,1,700000,1,2),(3,1,700000,2,1),(4,1,700000,2,2),(5,1,700000,3,1),(6,1,700000,3,2),(7,1,700000,4,1),(8,1,700000,4,2),(9,1,700000,5,1),(10,1,700000,5,2),(11,2,1400000,6,1),(12,1,700000,6,2),(13,2,1400000,7,1),(14,2,1400000,7,2);
/*!40000 ALTER TABLE `boec_cartdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_cashpayment`
--

DROP TABLE IF EXISTS `boec_cashpayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_cashpayment` (
  `payment_ptr_id` int NOT NULL,
  PRIMARY KEY (`payment_ptr_id`),
  CONSTRAINT `boec_cashpayment_payment_ptr_id_91b05562_fk_boec_payment_id` FOREIGN KEY (`payment_ptr_id`) REFERENCES `boec_payment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_cashpayment`
--

LOCK TABLES `boec_cashpayment` WRITE;
/*!40000 ALTER TABLE `boec_cashpayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_cashpayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_clothes`
--

DROP TABLE IF EXISTS `boec_clothes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_clothes` (
  `product_id_id` int NOT NULL,
  PRIMARY KEY (`product_id_id`),
  CONSTRAINT `boec_clothes_product_id_id_6864d54f_fk_boec_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `boec_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_clothes`
--

LOCK TABLES `boec_clothes` WRITE;
/*!40000 ALTER TABLE `boec_clothes` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_clothes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_confirm`
--

DROP TABLE IF EXISTS `boec_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_confirm` (
  `orderState_id_id` int NOT NULL,
  PRIMARY KEY (`orderState_id_id`),
  CONSTRAINT `boec_confirm_orderState_id_id_08f185b5_fk_boec_orderstate_id` FOREIGN KEY (`orderState_id_id`) REFERENCES `boec_orderstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_confirm`
--

LOCK TABLES `boec_confirm` WRITE;
/*!40000 ALTER TABLE `boec_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_customer`
--

DROP TABLE IF EXISTS `boec_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `address_id` int NOT NULL,
  `fullname_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_customer_fullname_id_b2360880_fk_boec_fullname_id` (`fullname_id`),
  KEY `boec_customer_address_id_8f364104_fk_boec_address_id` (`address_id`),
  CONSTRAINT `boec_customer_address_id_8f364104_fk_boec_address_id` FOREIGN KEY (`address_id`) REFERENCES `boec_address` (`id`),
  CONSTRAINT `boec_customer_fullname_id_b2360880_fk_boec_fullname_id` FOREIGN KEY (`fullname_id`) REFERENCES `boec_fullname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_customer`
--

LOCK TABLES `boec_customer` WRITE;
/*!40000 ALTER TABLE `boec_customer` DISABLE KEYS */;
INSERT INTO `boec_customer` VALUES (1,'txt@gmail.com','0382999209','1234','customer','image_url',1,1),(2,'dcluong@gmail.com','0382999219','1234','customer','image_url',2,2),(3,'sonnguyen@gmail.com','0382999229','1234','customer','image_url',3,3),(4,'trungnguyen@gmail.com','0382999239','1234','customer','image_url',4,4);
/*!40000 ALTER TABLE `boec_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_customersearch`
--

DROP TABLE IF EXISTS `boec_customersearch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_customersearch` (
  `id` int NOT NULL AUTO_INCREMENT,
  `times` int NOT NULL,
  `customer_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_customersearch_customer_id_418069dc_fk_boec_customer_id` (`customer_id`),
  KEY `boec_customersearch_keyword_id_e728d35d_fk_boec_keyword_id` (`keyword_id`),
  CONSTRAINT `boec_customersearch_customer_id_418069dc_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_customersearch_keyword_id_e728d35d_fk_boec_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `boec_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_customersearch`
--

LOCK TABLES `boec_customersearch` WRITE;
/*!40000 ALTER TABLE `boec_customersearch` DISABLE KEYS */;
INSERT INTO `boec_customersearch` VALUES (1,2,1,1),(2,2,1,2),(3,2,1,4),(4,4,2,5),(5,2,3,3),(6,2,3,6),(7,3,4,6);
/*!40000 ALTER TABLE `boec_customersearch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_electronics`
--

DROP TABLE IF EXISTS `boec_electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_electronics` (
  `product_id_id` int NOT NULL,
  PRIMARY KEY (`product_id_id`),
  CONSTRAINT `boec_electronics_product_id_id_7f096b9f_fk_boec_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `boec_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_electronics`
--

LOCK TABLES `boec_electronics` WRITE;
/*!40000 ALTER TABLE `boec_electronics` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_facebookauthentication`
--

DROP TABLE IF EXISTS `boec_facebookauthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_facebookauthentication` (
  `authentication_ptr_id` int NOT NULL,
  PRIMARY KEY (`authentication_ptr_id`),
  CONSTRAINT `boec_facebookauthent_authentication_ptr_i_72bb00ec_fk_boec_auth` FOREIGN KEY (`authentication_ptr_id`) REFERENCES `boec_authentication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_facebookauthentication`
--

LOCK TABLES `boec_facebookauthentication` WRITE;
/*!40000 ALTER TABLE `boec_facebookauthentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_facebookauthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_fastshipment`
--

DROP TABLE IF EXISTS `boec_fastshipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_fastshipment` (
  `shipment_ptr_id` int NOT NULL,
  `fee` double NOT NULL,
  PRIMARY KEY (`shipment_ptr_id`),
  CONSTRAINT `boec_fastshipment_shipment_ptr_id_e437ad35_fk_boec_shipment_id` FOREIGN KEY (`shipment_ptr_id`) REFERENCES `boec_shipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_fastshipment`
--

LOCK TABLES `boec_fastshipment` WRITE;
/*!40000 ALTER TABLE `boec_fastshipment` DISABLE KEYS */;
INSERT INTO `boec_fastshipment` VALUES (1,30000),(2,30000),(3,30000),(4,30000),(5,30000),(6,30000),(7,30000);
/*!40000 ALTER TABLE `boec_fastshipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_fullname`
--

DROP TABLE IF EXISTS `boec_fullname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_fullname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_fullname`
--

LOCK TABLES `boec_fullname` WRITE;
/*!40000 ALTER TABLE `boec_fullname` DISABLE KEYS */;
INSERT INTO `boec_fullname` VALUES (1,'Toan','Ta'),(2,'Duc','Luong'),(3,'Son','Nguyen'),(4,'Trung','Nguyen');
/*!40000 ALTER TABLE `boec_fullname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_googleauthentication`
--

DROP TABLE IF EXISTS `boec_googleauthentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_googleauthentication` (
  `authentication_ptr_id` int NOT NULL,
  PRIMARY KEY (`authentication_ptr_id`),
  CONSTRAINT `boec_googleauthentic_authentication_ptr_i_95602934_fk_boec_auth` FOREIGN KEY (`authentication_ptr_id`) REFERENCES `boec_authentication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_googleauthentication`
--

LOCK TABLES `boec_googleauthentication` WRITE;
/*!40000 ALTER TABLE `boec_googleauthentication` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_googleauthentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_item`
--

DROP TABLE IF EXISTS `boec_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `price` double NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_item_product_id_28f05855_fk_boec_product_id` (`product_id`),
  CONSTRAINT `boec_item_product_id_28f05855_fk_boec_product_id` FOREIGN KEY (`product_id`) REFERENCES `boec_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_item`
--

LOCK TABLES `boec_item` WRITE;
/*!40000 ALTER TABLE `boec_item` DISABLE KEYS */;
INSERT INTO `boec_item` VALUES (1,'Pants',700000,9),(2,'Shirt',700000,8),(3,'Jacket',1500000,7),(4,'Computer',15000000,6),(5,'Fans',300000,5),(6,'TV',1000000,4),(7,'Software Techonology Book',300000,3),(8,'Object Oriented Book',200000,2),(9,'Ecommerce Book',200000,1);
/*!40000 ALTER TABLE `boec_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_itemcomment`
--

DROP TABLE IF EXISTS `boec_itemcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_itemcomment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `customer_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_itemcomment_customer_id_2fe6751a_fk_boec_customer_id` (`customer_id`),
  KEY `boec_itemcomment_item_id_fc248449_fk_boec_item_id` (`item_id`),
  CONSTRAINT `boec_itemcomment_customer_id_2fe6751a_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_itemcomment_item_id_fc248449_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_itemcomment`
--

LOCK TABLES `boec_itemcomment` WRITE;
/*!40000 ALTER TABLE `boec_itemcomment` DISABLE KEYS */;
INSERT INTO `boec_itemcomment` VALUES (1,'San pham tot',2,1),(2,'San pham tot',1,1),(3,'San pham tot',1,2),(4,'San pham tot',3,2),(5,'San pham tot',4,2);
/*!40000 ALTER TABLE `boec_itemcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_itemkeyword`
--

DROP TABLE IF EXISTS `boec_itemkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_itemkeyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `keyword_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_itemkeyword_item_id_1dafc3da_fk_boec_item_id` (`item_id`),
  KEY `boec_itemkeyword_keyword_id_fe803c23_fk_boec_keyword_id` (`keyword_id`),
  CONSTRAINT `boec_itemkeyword_item_id_1dafc3da_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`),
  CONSTRAINT `boec_itemkeyword_keyword_id_fe803c23_fk_boec_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `boec_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_itemkeyword`
--

LOCK TABLES `boec_itemkeyword` WRITE;
/*!40000 ALTER TABLE `boec_itemkeyword` DISABLE KEYS */;
INSERT INTO `boec_itemkeyword` VALUES (1,1,4),(2,2,1),(3,2,2),(4,2,4),(5,3,1),(6,3,2),(7,4,3),(8,4,6),(9,5,3),(10,6,3),(11,6,6),(12,7,5),(13,7,6),(14,8,5),(15,9,5);
/*!40000 ALTER TABLE `boec_itemkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_itemrating`
--

DROP TABLE IF EXISTS `boec_itemrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_itemrating` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rating` int NOT NULL,
  `customer_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_itemrating_customer_id_ec3dda93_fk_boec_customer_id` (`customer_id`),
  KEY `boec_itemrating_item_id_e04f451f_fk_boec_item_id` (`item_id`),
  CONSTRAINT `boec_itemrating_customer_id_ec3dda93_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_itemrating_item_id_e04f451f_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_itemrating`
--

LOCK TABLES `boec_itemrating` WRITE;
/*!40000 ALTER TABLE `boec_itemrating` DISABLE KEYS */;
INSERT INTO `boec_itemrating` VALUES (1,4,1,1),(2,4,1,2),(3,4,2,2),(4,4,3,2),(5,5,4,2),(6,2,4,1),(7,3,3,1),(8,1,2,1);
/*!40000 ALTER TABLE `boec_itemrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_itemrecommend`
--

DROP TABLE IF EXISTS `boec_itemrecommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_itemrecommend` (
  `id` int NOT NULL AUTO_INCREMENT,
  `recommend` int NOT NULL,
  `customer_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_itemrecommend_customer_id_b777a507_fk_boec_customer_id` (`customer_id`),
  KEY `boec_itemrecommend_item_id_266147c9_fk_boec_item_id` (`item_id`),
  CONSTRAINT `boec_itemrecommend_customer_id_b777a507_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_itemrecommend_item_id_266147c9_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_itemrecommend`
--

LOCK TABLES `boec_itemrecommend` WRITE;
/*!40000 ALTER TABLE `boec_itemrecommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_itemrecommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_itemview`
--

DROP TABLE IF EXISTS `boec_itemview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_itemview` (
  `id` int NOT NULL AUTO_INCREMENT,
  `view` int NOT NULL,
  `customer_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_itemview_customer_id_5f2c4573_fk_boec_customer_id` (`customer_id`),
  KEY `boec_itemview_item_id_3313622c_fk_boec_item_id` (`item_id`),
  CONSTRAINT `boec_itemview_customer_id_5f2c4573_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_itemview_item_id_3313622c_fk_boec_item_id` FOREIGN KEY (`item_id`) REFERENCES `boec_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_itemview`
--

LOCK TABLES `boec_itemview` WRITE;
/*!40000 ALTER TABLE `boec_itemview` DISABLE KEYS */;
INSERT INTO `boec_itemview` VALUES (1,2,1,1),(2,1,2,1),(3,1,2,2),(4,1,2,3),(5,1,2,4),(6,1,2,5),(7,1,2,6),(8,1,1,6),(9,1,1,7),(10,1,3,7),(11,1,3,2),(12,1,3,1),(13,1,4,1),(14,1,4,2),(15,1,4,5),(16,1,4,6),(17,1,4,7);
/*!40000 ALTER TABLE `boec_itemview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_keyword`
--

DROP TABLE IF EXISTS `boec_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` longtext NOT NULL,
  `times` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_keyword`
--

LOCK TABLES `boec_keyword` WRITE;
/*!40000 ALTER TABLE `boec_keyword` DISABLE KEYS */;
INSERT INTO `boec_keyword` VALUES (1,'ao khoac',17),(2,'ao',10),(3,'do dien tu',3),(4,'quan ao',11),(5,'sach',5),(6,'cong nghe',6);
/*!40000 ALTER TABLE `boec_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_order`
--

DROP TABLE IF EXISTS `boec_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_at` longtext NOT NULL,
  `note` longtext NOT NULL,
  `status` longtext NOT NULL,
  `cart_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `payment_id` int NOT NULL,
  `shipment_id` int NOT NULL,
  `state_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `boec_order_cart_id_83645626_fk_boec_cart_id` (`cart_id`),
  KEY `boec_order_customer_id_fd67ef43_fk_boec_customer_id` (`customer_id`),
  KEY `boec_order_payment_id_72cf3d51_fk_boec_payment_id` (`payment_id`),
  KEY `boec_order_shipment_id_ab9e9f16_fk_boec_shipment_id` (`shipment_id`),
  KEY `boec_order_state_id_6af523c5_fk_boec_orderstate_id` (`state_id`),
  CONSTRAINT `boec_order_cart_id_83645626_fk_boec_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `boec_cart` (`id`),
  CONSTRAINT `boec_order_customer_id_fd67ef43_fk_boec_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `boec_customer` (`id`),
  CONSTRAINT `boec_order_payment_id_72cf3d51_fk_boec_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `boec_payment` (`id`),
  CONSTRAINT `boec_order_shipment_id_ab9e9f16_fk_boec_shipment_id` FOREIGN KEY (`shipment_id`) REFERENCES `boec_shipment` (`id`),
  CONSTRAINT `boec_order_state_id_6af523c5_fk_boec_orderstate_id` FOREIGN KEY (`state_id`) REFERENCES `boec_orderstate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_order`
--

LOCK TABLES `boec_order` WRITE;
/*!40000 ALTER TABLE `boec_order` DISABLE KEYS */;
INSERT INTO `boec_order` VALUES (7,'','','Pending',2,1,2,2,1),(8,'','','Pending',3,2,3,3,1),(9,'','','Pending',4,3,4,4,1),(10,'','','Pending',5,4,5,5,1),(11,'','','Pending',6,1,6,6,1),(12,'','','Pending',7,2,7,7,1);
/*!40000 ALTER TABLE `boec_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_orderstate`
--

DROP TABLE IF EXISTS `boec_orderstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_orderstate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_orderstate`
--

LOCK TABLES `boec_orderstate` WRITE;
/*!40000 ALTER TABLE `boec_orderstate` DISABLE KEYS */;
INSERT INTO `boec_orderstate` VALUES (1,'Pending'),(2,'Shipping'),(3,'Confirm'),(4,'Cancel');
/*!40000 ALTER TABLE `boec_orderstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_payment`
--

DROP TABLE IF EXISTS `boec_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_payment`
--

LOCK TABLES `boec_payment` WRITE;
/*!40000 ALTER TABLE `boec_payment` DISABLE KEYS */;
INSERT INTO `boec_payment` VALUES (1,14000000),(2,14000000),(3,14000000),(4,14000000),(5,14000000),(6,21000000),(7,28000000);
/*!40000 ALTER TABLE `boec_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_pending`
--

DROP TABLE IF EXISTS `boec_pending`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_pending` (
  `orderState_id_id` int NOT NULL,
  PRIMARY KEY (`orderState_id_id`),
  CONSTRAINT `boec_pending_orderState_id_id_c2aea344_fk_boec_orderstate_id` FOREIGN KEY (`orderState_id_id`) REFERENCES `boec_orderstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_pending`
--

LOCK TABLES `boec_pending` WRITE;
/*!40000 ALTER TABLE `boec_pending` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_pending` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_product`
--

DROP TABLE IF EXISTS `boec_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_product`
--

LOCK TABLES `boec_product` WRITE;
/*!40000 ALTER TABLE `boec_product` DISABLE KEYS */;
INSERT INTO `boec_product` VALUES (1,'Books','Ecommerce Book',100000,'iamge_url',''),(2,'Books','Object Oriented Book',100000,'image_url',''),(3,'Books','Software Techonology Book',200000,'image_url',''),(4,'Electronics','TV',500000,'image_url',''),(5,'Electronics','Fans',100000,'image_url',''),(6,'Electronics','Computer',10000000,'image_url',''),(7,'Clothes','Jacket',1000000,'image_url',''),(8,'Clothes','Shirt',500000,'image_url',''),(9,'Clothes','Pants',500000,'image_url','');
/*!40000 ALTER TABLE `boec_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_shipment`
--

DROP TABLE IF EXISTS `boec_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_shipment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_shipment`
--

LOCK TABLES `boec_shipment` WRITE;
/*!40000 ALTER TABLE `boec_shipment` DISABLE KEYS */;
INSERT INTO `boec_shipment` VALUES (1,'Ha Noi'),(2,'Ha Noi'),(3,'Ha Noi'),(4,'Ha Noi'),(5,'Ha Noi'),(6,'Ha Noi'),(7,'Ha Noi');
/*!40000 ALTER TABLE `boec_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_shipping`
--

DROP TABLE IF EXISTS `boec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_shipping` (
  `orderState_id_id` int NOT NULL,
  PRIMARY KEY (`orderState_id_id`),
  CONSTRAINT `boec_shipping_orderState_id_id_365ca5f1_fk_boec_orderstate_id` FOREIGN KEY (`orderState_id_id`) REFERENCES `boec_orderstate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_shipping`
--

LOCK TABLES `boec_shipping` WRITE;
/*!40000 ALTER TABLE `boec_shipping` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boec_standardshipment`
--

DROP TABLE IF EXISTS `boec_standardshipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boec_standardshipment` (
  `shipment_ptr_id` int NOT NULL,
  `fee` double NOT NULL,
  PRIMARY KEY (`shipment_ptr_id`),
  CONSTRAINT `boec_standardshipmen_shipment_ptr_id_dfbec4ee_fk_boec_ship` FOREIGN KEY (`shipment_ptr_id`) REFERENCES `boec_shipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boec_standardshipment`
--

LOCK TABLES `boec_standardshipment` WRITE;
/*!40000 ALTER TABLE `boec_standardshipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `boec_standardshipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'boec','address'),(8,'boec','authentication'),(18,'boec','bankaccountpayment'),(19,'boec','book'),(20,'boec','cancel'),(21,'boec','cardpayment'),(9,'boec','cart'),(38,'boec','cartdetail'),(22,'boec','cashpayment'),(23,'boec','clothes'),(24,'boec','confirm'),(10,'boec','customer'),(39,'boec','customersearch'),(25,'boec','electronics'),(26,'boec','facebookauthentication'),(27,'boec','fastshipment'),(11,'boec','fullname'),(28,'boec','googleauthentication'),(12,'boec','item'),(37,'boec','itemcomment'),(36,'boec','itemkeyword'),(35,'boec','itemrating'),(34,'boec','itemrecommend'),(33,'boec','itemview'),(13,'boec','keyword'),(32,'boec','order'),(14,'boec','orderstate'),(15,'boec','payment'),(29,'boec','pending'),(16,'boec','product'),(17,'boec','shipment'),(30,'boec','shipping'),(31,'boec','standardshipment'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-06-18 17:43:20.818691'),(2,'auth','0001_initial','2021-06-18 17:43:28.318613'),(3,'admin','0001_initial','2021-06-18 17:43:55.959137'),(4,'admin','0002_logentry_remove_auto_add','2021-06-18 17:44:04.661794'),(5,'admin','0003_logentry_add_action_flag_choices','2021-06-18 17:44:04.926724'),(6,'contenttypes','0002_remove_content_type_name','2021-06-18 17:44:12.492087'),(7,'auth','0002_alter_permission_name_max_length','2021-06-18 17:44:15.770944'),(8,'auth','0003_alter_user_email_max_length','2021-06-18 17:44:16.664590'),(9,'auth','0004_alter_user_username_opts','2021-06-18 17:44:16.779701'),(10,'auth','0005_alter_user_last_login_null','2021-06-18 17:44:20.381083'),(11,'auth','0006_require_contenttypes_0002','2021-06-18 17:44:20.537008'),(12,'auth','0007_alter_validators_add_error_messages','2021-06-18 17:44:20.677634'),(13,'auth','0008_alter_user_username_max_length','2021-06-18 17:44:25.116863'),(14,'auth','0009_alter_user_last_name_max_length','2021-06-18 17:44:33.511742'),(15,'auth','0010_alter_group_name_max_length','2021-06-18 17:44:34.370058'),(16,'auth','0011_update_proxy_permissions','2021-06-18 17:44:34.625836'),(17,'auth','0012_alter_user_first_name_max_length','2021-06-18 17:44:38.431656'),(18,'boec','0001_initial','2021-06-18 17:45:29.302064'),(19,'sessions','0001_initial','2021-06-18 17:47:39.604851'),(20,'boec','0002_keyword_times','2021-06-19 03:55:59.155597'),(21,'boec','0003_customersearch','2021-06-19 09:52:16.978480');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-02 10:33:58