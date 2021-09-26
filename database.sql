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
  `photos` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_blog_user_idx` (`user_id`),
  CONSTRAINT `fk_blog_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,'fewf',10,'2021-09-20 09:24:51','vsa','asd');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'asd'),(2,'few');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentblog`
--

LOCK TABLES `commentblog` WRITE;
/*!40000 ALTER TABLE `commentblog` DISABLE KEYS */;
INSERT INTO `commentblog` VALUES (5,'sda',NULL,14,1,'2021-09-22 19:23:17'),(7,'',NULL,14,1,'2021-09-22 19:23:23'),(8,'',NULL,14,1,'2021-09-22 19:23:25'),(9,'dsa',NULL,14,1,'2021-09-22 19:23:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenttour`
--

LOCK TABLES `commenttour` WRITE;
/*!40000 ALTER TABLE `commenttour` DISABLE KEYS */;
INSERT INTO `commenttour` VALUES (57,'fefeeee',NULL,10,11,'2021-09-20 09:24:51'),(79,'dfdf',NULL,14,11,'2021-09-20 11:30:16'),(80,'efs',NULL,10,10,'2021-09-20 11:43:23'),(81,'fewfew',NULL,10,1,'2021-09-20 11:43:44'),(82,'fewfw',NULL,10,9,'2021-09-20 11:43:55'),(84,'das',NULL,14,10,'2021-09-20 16:57:05'),(85,'r3we',NULL,14,11,'2021-09-22 13:51:43'),(86,'ád',NULL,14,11,'2021-09-22 13:52:45'),(87,'asd',NULL,14,11,'2021-09-22 14:01:59'),(88,'asd',NULL,14,11,'2021-09-22 14:02:23'),(89,'asdj',NULL,14,11,'2021-09-22 14:03:12'),(90,'ewf',NULL,14,10,'2021-09-22 15:48:39'),(91,'dcd',NULL,14,10,'2021-09-22 15:49:38');
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
  PRIMARY KEY (`id`),
  KEY `fk_date_tour_idx` (`tour_id`),
  CONSTRAINT `fk_date_tour` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datedetail`
--

LOCK TABLES `datedetail` WRITE;
/*!40000 ALTER TABLE `datedetail` DISABLE KEYS */;
INSERT INTO `datedetail` VALUES (1,'2021-08-17','2021-08-21',1),(2,'2021-08-21','2021-08-24',1),(3,'2021-08-21','2021-08-24',2),(4,'2021-08-21','2021-08-24',3),(5,'2021-08-21','2021-08-24',4),(6,'2021-08-21','2021-08-24',5),(7,'2021-08-21','2021-08-24',6),(8,'2021-08-21','2021-08-24',7),(9,'2021-08-21','2021-08-24',8),(10,'2021-08-21','2021-08-24',9),(11,'2021-08-21','2021-08-24',10),(12,'2021-08-21','2021-08-24',11);
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
  PRIMARY KEY (`id`),
  KEY `pk_tour_payment_tour_id_idx` (`tour_id`),
  KEY `pk_payment_user_id_idx` (`user_id`),
  CONSTRAINT `pk_payment_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`),
  CONSTRAINT `pk_payment_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratetour`
--

LOCK TABLES `ratetour` WRITE;
/*!40000 ALTER TABLE `ratetour` DISABLE KEYS */;
INSERT INTO `ratetour` VALUES (4,'5',10,10),(5,'4',14,10),(6,'5',14,11),(7,'5',10,11);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'bắc'),(2,'nam'),(3,'trung');
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
  CONSTRAINT `pk_tourtag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`),
  CONSTRAINT `pk_tourtag_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tag`
--

LOCK TABLES `tour_tag` WRITE;
/*!40000 ALTER TABLE `tour_tag` DISABLE KEYS */;
INSERT INTO `tour_tag` VALUES (7,1),(10,1),(11,1),(9,2),(11,2),(8,3),(11,3);
/*!40000 ALTER TABLE `tour_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourbooking`
--

DROP TABLE IF EXISTS `tourbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourbooking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` decimal(10,0) NOT NULL,
  `created_date` datetime NOT NULL,
  `customer_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_tourbooking_tour_id_idx` (`tour_id`),
  KEY `pk_tourbooking_user_id_idx` (`customer_id`),
  CONSTRAINT `pk_tourbooking_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tours` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pk_tourbooking_user_id` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourbooking`
--

LOCK TABLES `tourbooking` WRITE;
/*!40000 ALTER TABLE `tourbooking` DISABLE KEYS */;
/*!40000 ALTER TABLE `tourbooking` ENABLE KEYS */;
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
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` int NOT NULL,
  `vehicle` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tours_category_idx` (`category_id`),
  CONSTRAINT `fk_tours_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Tou Miền Nam','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(2,'Tour Miền Bắc','test','Miền Bắc','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1000000,1,1,'0'),(3,'Tour Miền Trung','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(4,'Tour Cao Bằng','test','Miền Nam','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',1500000,1,2,'0'),(5,'dafeefefe','test a b c','dfemkldffeswewqs','https://res.cloudinary.com/tourapp/image/upload/v1629907171/a5ijlkl4kmpubjy2gjvh.png',400000,1,2,'0'),(6,'gkgopretestwqew','fekfop','fewjifo','https://res.cloudinary.com/tourapp/image/upload/v1629906043/pu8alqpjulyu4it8puvh.png',300000,1,1,'0'),(7,'gkgopretestwqew','test a b c','da lat','https://res.cloudinary.com/tourapp/image/upload/v1629906212/rcsz9ctnixjktclouutr.png',200000,0,1,'0'),(8,'fewiojtest','gvefefefe','efefefefefe','https://res.cloudinary.com/tourapp/image/upload/v1632149676/mkae5gntdtalakgq05jz.png',200000,0,1,'1'),(9,'dewfweftest','fewfwe','dfemkldffeswewqs','https://res.cloudinary.com/tourapp/image/upload/v1631111556/kogttusbgbp1z2ckh3d4.jpg',660000,0,1,'1'),(10,'fewfwtest','wefew','fewjifo','https://res.cloudinary.com/tourapp/image/upload/v1631335023/nr1ayutbn0b7u3mhirnc.png',850000,0,2,'1'),(11,'fewfwtestreg','wefewtrhr','fewjifohtrh','https://res.cloudinary.com/tourapp/image/upload/v1631335062/xo8utzyz9c5jcnvlhiis.png',8500000,0,2,'1');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `pk_user_provine_id_idx` (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (10,'adasd','fdfs','thienthanh@gmail.com','thienthanh','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw',NULL,'2000-11-29','0901310332','0','male','asd',1),(14,'Chauads','Tuu','thientuu2911@gmail.com','thientuu2911','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1632294171/ziv4cngqnfs08uhlch9n.jpg','2000-11-29','0901310332','4','male','eqwqw',1),(21,'Chau','Tuu','thientuu2000@gmail.com','admin','$2a$10$rRgAYlnWouw7643X4paxtuPTssfqXBA4a7qwVk4m8JuYu2F1DbEAC','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1632149475/agouqdtld7whoyhkednr.jpg','2000-09-02','0901310332','4','male','ftyasd',1),(22,'Chau','Tuu','thientuu@gmail.com','test','$2a$10$C2NRp0PL1fT60buitXGzS.j5ccqIeFtk7FEmw61bTAKjAFAsYYclC','ewrjiowefw',NULL,'2000-09-02','0901310332','4','male','assd',1),(23,'Chau','Tuu','weqw@gmail.com','adwwdassd','$2a$10$NJeNzA7I4Syp3B/WmN8qcuryQQWistRgrduI7aN/t/g4BQ8og/RA6','ewrjiowefw',NULL,'2021-09-09','0901310332','4','male','Æ°edwwe',2);
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

-- Dump completed on 2021-09-27  0:05:22
