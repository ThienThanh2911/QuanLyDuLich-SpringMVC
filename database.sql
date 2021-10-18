-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: toursdb-spring
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_blog_user_idx` (`user_id`),
  CONSTRAINT `fk_blog_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'fewf',10,'2021-09-20 09:24:51','vsa','asd',1),(2,'ưqdw',10,'2021-09-20 09:24:51','dwdw','ád',1),(3,'fewf',10,'2021-09-20 09:24:51','ưdw','èwfw',1),(4,'qwe32',10,'2021-10-13 20:32:06','ewr32',NULL,1),(5,'asdw',10,'2021-10-13 20:33:28','asfew','https://res.cloudinary.com/tourapp/image/upload/v1634135931/mqf1oz4ug8jcxq10fr3e.png',1),(6,'asdw',10,'2021-10-13 21:42:20','asfewefwe','https://res.cloudinary.com/tourapp/image/upload/v1634135931/mqf1oz4ug8jcxq10fr3e.png',1),(7,'fdsfeeyisewfew',10,'2021-10-16 20:24:20','sadwwdasceas','',1);
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (6,'aasd'),(1,'asd'),(5,'fefe'),(2,'few'),(7,'grrrgeedferew'),(4,'zsdw');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentblog`
--

DROP TABLE IF EXISTS `commentblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commentblog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `blog_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentblog`
--

LOCK TABLES `commentblog` WRITE;
/*!40000 ALTER TABLE `commentblog` DISABLE KEYS */;
INSERT INTO `commentblog` VALUES (9,'dsa',NULL,14,1,'2021-09-22 19:23:32');
/*!40000 ALTER TABLE `commentblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenttour`
--

DROP TABLE IF EXISTS `commenttour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenttour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_commenttour_tour_id_idx` (`tour_id`),
  KEY `pk_commenttour_user_id_idx` (`user_id`),
  CONSTRAINT `pk_commenttour_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_commenttour_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenttour`
--

LOCK TABLES `commenttour` WRITE;
/*!40000 ALTER TABLE `commenttour` DISABLE KEYS */;
INSERT INTO `commenttour` VALUES (57,'fefeeee',NULL,10,11,'2021-09-20 09:24:51'),(79,'dfdf',NULL,14,11,'2021-09-20 11:30:16'),(80,'efs',NULL,10,11,'2021-09-20 11:43:23'),(81,'fewfew',NULL,10,1,'2021-09-20 11:43:44'),(84,'das',NULL,14,11,'2021-09-20 16:57:05'),(85,'r3we',NULL,14,11,'2021-09-22 13:51:43'),(86,'ád',NULL,14,11,'2021-09-22 13:52:45'),(91,'dcd',NULL,14,11,'2021-09-22 15:49:38'),(92,'aád',NULL,14,47,'2021-10-17 17:03:28');
/*!40000 ALTER TABLE `commenttour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datedetail`
--

DROP TABLE IF EXISTS `datedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datedetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `tour_id` int NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_date_tour_idx` (`tour_id`),
  CONSTRAINT `fk_date_tour` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datedetail`
--

LOCK TABLES `datedetail` WRITE;
/*!40000 ALTER TABLE `datedetail` DISABLE KEYS */;
INSERT INTO `datedetail` VALUES (1,'2021-08-17','2021-08-21',1,'0'),(2,'2021-08-21','2021-08-24',1,'0'),(3,'2021-08-21','2021-08-24',2,'0'),(4,'2021-08-21','2021-08-24',3,'0'),(5,'2021-08-21','2021-08-24',4,'0'),(6,'2021-08-21','2021-08-24',5,'0'),(9,'2021-08-21','2021-08-24',8,'0'),(11,'2021-08-21','2021-08-24',11,'0'),(12,'2021-08-21','2021-08-24',11,'0'),(14,'2021-08-23','2021-08-26',11,'0'),(27,'2021-10-20','2021-10-25',44,'0'),(28,'2021-10-25','2021-10-30',44,'0'),(34,'2021-10-01','2021-10-15',47,'0'),(35,'2021-10-07','2021-10-22',47,'0'),(36,'2021-10-07','2021-10-30',47,'0');
/*!40000 ALTER TABLE `datedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `method` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adult` int NOT NULL,
  `children` int NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_tour_payment_tour_id_idx` (`tour_id`),
  KEY `pk_payment_user_id_idx` (`user_id`),
  KEY `pk_payment_date_id_idx` (`date_id`),
  CONSTRAINT `pk_payment_date_id` FOREIGN KEY (`date_id`) REFERENCES `datedetail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_payment_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`),
  CONSTRAINT `pk_payment_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (5,'2021-10-02 16:59:47',8500000,'Bạn đã chọn thanh toán qua Momo',10,11,'0',1,0,'Đã thanh toán',12),(6,'2021-10-17 16:45:16',200000,'Bạn đã chọn thanh toán qua Momo',10,44,'0',1,0,'Đã thanh toán',27),(7,'2021-10-17 16:45:48',200000,'Bạn đã chọn thanh toán qua Momo',10,44,'0',1,0,'Đã thanh toán',27),(8,'2021-10-17 16:50:30',200000,'Bạn đã chọn thanh toán qua Momo',10,47,'0',1,0,'Đã thanh toán',34),(9,'2021-10-17 16:51:46',200000,'Bạn đã chọn thanh toán qua Momo',10,47,'0',1,0,'Đã thanh toán',34),(10,'2021-10-17 17:04:45',200000,'Bạn đã chọn thanh toán qua Momo',14,47,'0',1,0,'Đã thanh toán',34),(11,'2021-10-17 21:28:22',340000,'Bạn đã chọn thanh toán qua Momo',14,44,'0',1,1,'Đã thanh toán',27),(12,'2021-10-17 21:32:19',340000,'Bạn đã chọn thanh toán qua Momo',14,44,'0',1,1,'Đã thanh toán',27);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Hà Nội'),(2,'TP. Hồ Chí Minh');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rateblog`
--

DROP TABLE IF EXISTS `rateblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rateblog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate` int NOT NULL,
  `user_id` int NOT NULL,
  `blog_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rateblog`
--

LOCK TABLES `rateblog` WRITE;
/*!40000 ALTER TABLE `rateblog` DISABLE KEYS */;
INSERT INTO `rateblog` VALUES (1,5,14,1);
/*!40000 ALTER TABLE `rateblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratetour`
--

DROP TABLE IF EXISTS `ratetour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratetour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rate` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `tour_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_ratetour_tour_id_idx` (`tour_id`),
  KEY `pk_ratetour_user_id_idx` (`user_id`),
  CONSTRAINT `pk_ratetour_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`),
  CONSTRAINT `pk_ratetour_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratetour`
--

LOCK TABLES `ratetour` WRITE;
/*!40000 ALTER TABLE `ratetour` DISABLE KEYS */;
INSERT INTO `ratetour` VALUES (4,'5',10,11),(5,'4',14,11),(10,'5',21,44),(11,'4',22,47);
/*!40000 ALTER TABLE `ratetour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `comment_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_feedback_tour_id_idx` (`tour_id`),
  KEY `pk_feedback_user_id_idx` (`user_id`),
  KEY `pk_feedback_comment_id_idx` (`comment_id`),
  CONSTRAINT `pk_feedback_comment_id` FOREIGN KEY (`comment_id`) REFERENCES `commenttour` (`id`),
  CONSTRAINT `pk_feedback_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`),
  CONSTRAINT `pk_feedback_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (56,'adsw'),(57,'bắc'),(58,'trung'),(59,'nam'),(60,'dvgr');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tag`
--

DROP TABLE IF EXISTS `tour_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tag` (
  `tour_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`tour_id`,`tag_id`),
  KEY `pk_tourtag_tag_id_idx` (`tag_id`),
  CONSTRAINT `pk_tourtag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_tourtag_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tag`
--

LOCK TABLES `tour_tag` WRITE;
/*!40000 ALTER TABLE `tour_tag` DISABLE KEYS */;
INSERT INTO `tour_tag` VALUES (47,57),(47,58),(47,59);
/*!40000 ALTER TABLE `tour_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `destination` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photos` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` int NOT NULL,
  `vehicle` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tours_category_idx` (`category_id`),
  CONSTRAINT `fk_tours_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Tou Miền Nam','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(2,'Tour Miền Bắc','test','Miền Bắc','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1000000,1,1,'0'),(3,'Tour Miền Trung','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(4,'Tour Cao Bằng','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(5,'dafeefefe','test a b c','dfemkldffeswewqs','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',400000,1,2,'0'),(6,'gkgopretestwqew','fekfop','fewjifo','https://res.cloudinary.com/tourapp/image/upload/v1629906043/pu8alqpjulyu4it8puvh.png',300000,1,1,'0'),(8,'fewiojtest','gvefefefe','efefefefefe','https://res.cloudinary.com/tourapp/image/upload/v1632149676/mkae5gntdtalakgq05jz.png',200000,1,1,'1'),(11,'fewfwtest','wefew','fewjifo',NULL,850000,1,1,'1'),(44,'cdswdtestesfe','fefsfa','feafee','',200000,1,1,'2'),(47,'fewiojtestefty','zscdw','Vung Tau','https://res.cloudinary.com/tourapp/image/upload/v1634136053/csrc1cqpmgydu8bcox2r.png',200000,1,6,'2');
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth` date NOT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_role` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `about` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province_id` int NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `pk_user_provine_id_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'adase','fdfs','thienthanh@gmail.com','thienthanh','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1633888973/istvnzufpf5ji7zfuqhv.png','2000-11-29','0901310332','0','male','asd',1,1),(14,'Chauads','Tuu','thientuu2911@gmail.com','thientuu2911','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw',NULL,'2000-11-29','0901310332','4','male','eqwqw',1,1),(21,'Chau','Tuu','thientuu2000@gmail.com','admin','$2a$10$rRgAYlnWouw7643X4paxtuPTssfqXBA4a7qwVk4m8JuYu2F1DbEAC','ewrjiowefw',NULL,'2000-09-02','0901310332','4','male','ftyasd',1,1),(22,'Chau','Tuu','thientsve@gmail.com','adminfefe','$2a$10$rRgAYlnWouw7643X4paxtuPTssfqXBA4a7qwVk4m8JuYu2F1DbEAC','ewrjiowefw',NULL,'2000-09-02','0901310332','4','male','ftyasd',1,1),(25,'Chau','Tuu','vdvd1@gmail.com','vdvd','$2a$10$T2XA4W3Y8picjaE6JN.b6uWt.DiXhGyRcrR3MuRi9NFu.TjDmGA3O','ewrjiowefw',NULL,'2222-02-22','0901310332','4','male','wdwde',1,1),(30,'Chau','Tuu','fasfw@gmail.com','fasfsaf','$2a$10$a3bz1Z3yA5pG1v27Wb.kvungZYDFn4MAW0.oNG5bxW3LZoxegSkwm','ewrjiowefw','','2000-11-29','0901310332','0','male','ftydth',1,1),(31,'Chau','Tuu','ewf33f@gmail.com','fewfwe','$2a$10$pybGpGO2jgmLj.1n2croJ.UvvAz9pVEDx0lLza0IFm2CsDEYLVO5q','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1634087143/hlnveoyp5wryntiysz7g.png','2000-11-29','0901310332','0','male','ftydthfew',1,1),(32,'Chau','Tuu','sdwwwef@gmail.com','fewfwefew','$2a$10$RkmU4wxyNu0gkD8tQ1djKOOGXg/4hylqzp4wFG9AT2UXAJIxeVYqi','ewrjiowefw','','2021-10-15','0901310332','0','male','èwefew',1,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-18 22:08:15
