-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: toursdb-spring
-- ------------------------------------------------------
-- Server version	8.0.26

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
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_date` datetime NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `blog` VALUES (1,'Thêm một khách sạn đẹp xuất sắc giữa Sài Gòn – Mia Luxury Boutique Sài Gòn',10,'2021-09-20 09:24:51','- Từng góc nhỏ của khách sạn Mia Luxury Boutique Sài Gòn mang đến cho bạn sự thoải mái và dễ chịu tuyệt đối, dù bạn đang tựa mình vào lan can riêng trong phòng để ngắm những chiếc xà lan trên sông lúc hoàng hôn hay nghiền ngẫm một cuốn sách thú vị bên hồ bơi sóng sánh ánh bạc, lắng nghe tiếng chim reo giữa khu vườn ngập tràn hoa lá. Bạn cũng có thể thả hồn vào tiếng nhạc du dương và tận hưởng khoảnh khắc thư thái khi làm đẹp với mặt nạ dát vàng tại Ô Spa. Khách sạn được thiết kế theo phong cách sang trọng và thời thượng kết hợp hài hòa với các chi tiết tỉ mỉ truyền tải nét đẹp văn hóa theo từng thời kỳ lịch sử của thành phố qua các bộ sưu tập tạp chí, sách, tem thư độc đáo của thế kỷ 20, tranh của các họa sỹ nổi tiếng. Đặc biệt hơn, các phòng còn được trang trí từ những mảnh gốm sứ độc đáo. Mỗi một món đồ nội thất đều được chăm chút sơn mài, đánh bóng cẩn thận từ bàn tay của các nghệ nhân Việt Nam.','https://res.cloudinary.com/tourapp/image/upload/v1634230788/mia-luxury-boutique-sai-gon-ivivu-6_c0vsob.jpg',1),(2,'Hẹn nhau làm chuyến du lịch Mũi Né 4N3Đ chỉ 3,5 triệu/người',10,'2021-09-20 09:24:51','- Chuyến du lịch Mũi Né – Sài Gòn lần này, mình xuất phát từ Hà Nội, mình book vé máy bay giá rẻ vào Sài Gòn (giá vé 1tr4/người/khứ hồi). Bạn nên đặt trước vé máy bay, vé xe, khách sạn, và chuẩn bị trước lịch trình khi đi nhé. Tới Sài Gòn, mình bắt chuyến xe đi Sài Gòn – Mũi Né, giá vé 260k/người/khứ hồi. Mình ở khách sạn Meraki Oasis, cảm nhận là khách sạn view biển tuyệt đẹp, tone màu trắng chủ đạo. Đặc biệt, khách sạn có hồ bơi ngay sát bãi biển tha hồ để bạn chụp hình sống ảo.','https://res.cloudinary.com/tourapp/image/upload/v1634230789/du-lich-mui-ne-ivivu-6_togocg.jpg',1),(3,'Hướng dẫn đường đi đến xóm Lèo, nơi ngắm hoàng hôn đẹp nhất nhì Đà Lạt',10,'2021-09-20 09:24:51','- Từ chợ Đà Lạt, bạn chạy về hướng QL20. Từ đây, bạn đi hết đường Hùng Vương đến vòng xoay Trại Mát, rẽ vào đường Huỳnh Tấn Phát. Đi tiếp khoảng 200m thì phía bên trái của đường đi sẽ có một con dốc chạy lên, các bạn đi theo đường này là đến xóm Lèo. Bạn cũng có thể tìm trên Google Maps địa điểm “Nhà Đèn” rồi chạy theo hướng dẫn là đến. Nơi này chỉ cách chợ Đà Lạt khoảng 10 cây số nên bạn có thể đến tầm 5h chiều để bắt được khoảnh khắc hoàng hôn Đà Lạt cực đẹp này nhé. Lúc trước xóm Lèo rất vắng vẻ vì ít người để ý đến, nhưng thời điểm gần đây, một số bạn đã ghi lại cảnh hoảng hôn ở đây, chia sẻ lên các trang mạng xã hội và lập tức gây sốt, kích thích nhiều bạn yêu du lịch tìm đến. Về sau, khách du lịch đến ngày càng nhiều nên người dân mở ra nhiều dịch vụ tiện ích, phục vụ du khách gần xa để mọi người có thể lưu lại những bức ảnh đẹp nhất ở đây.','https://res.cloudinary.com/tourapp/image/upload/v1634230786/huong-dan-duong-di-xom-leo-da-lat-ivivu-2_xairpd.jpg',1),(4,'Check-in liền tay khu nghỉ dưỡng New World Phú Quốc mới toanh ở bãi Kem',10,'2021-10-13 20:32:06','- Với 375 biệt thự có thiết kế pha trộn đầy tinh tế giữa truyền thống và hiện đại, khu nghỉ dưỡng New World Phú Quốc giống như một làng chài ven biển. Mỗi biệt thự gồm từ 3 – 4 phòng ngủ, sở hữu không gian mở thoáng đãng, hồ bơi riêng và khoảng sân vườn rộng rãi. Bên trong các biệt thự, lối trang trí thanh thoát với các vật liệu thân thuộc của làng quê Việt như gỗ, mây, tre… tạo nên một không gian thanh lịch, sang trọng mà vẫn rất đỗi gần gũi, ấm cúng. Sở hữu 4 nhà hàng và quán bar, resort cũng là một thế giới ẩm thực đầy những bất ngờ. Bay Kitchen phục vụ đặc sản địa phương và ẩm thực Âu, được chế biến và biểu diễn ngay tại khu bếp mở để thực khách chiêm ngưỡng. Nhà hàng Lửa gây ấn tượng với thiết kế lấy cảm hứng từ những làng chài trên đảo. Quầy bar The Lounge và Bar bể bơimang đến không gian thư giãn hoàn hảo với cocktail, đồ uống tinh tế.','https://res.cloudinary.com/tourapp/image/upload/v1634230790/khu-nghi-duong-new-world-phu-quoc-ivivu-2_ygffsj.jpg',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (4,'Cung đường Tây Bắc'),(1,'Đà Lạt'),(2,'Đà Nẵng'),(3,'Hạ Long'),(5,'Nha Trang'),(6,'Sapa');
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
  `comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `comment` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `commenttour` VALUES (57,'fefeeee',NULL,10,8,'2021-09-20 09:24:51'),(79,'dfdf',NULL,14,8,'2021-09-20 11:30:16'),(80,'efs',NULL,10,8,'2021-09-20 11:43:23'),(81,'fewfew',NULL,10,1,'2021-09-20 11:43:44'),(84,'das',NULL,14,8,'2021-09-20 16:57:05'),(85,'r3we',NULL,14,8,'2021-09-22 13:51:43'),(86,'ád',NULL,14,8,'2021-09-22 13:52:45'),(91,'dcd',NULL,14,8,'2021-09-22 15:49:38'),(92,'aád',NULL,14,10,'2021-10-17 17:03:28');
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
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `status` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `rate` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `comment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Đà Lạt'),(2,'Hồ'),(3,'Làng'),(4,'Hoa'),(5,'Huế'),(6,'Động Phong Nha'),(7,'Cầu Vàng'),(8,'Hạ Long'),(9,'Bãi Cháy'),(10,' Ti Tốp'),(11,'Sapa'),(12,'Miền Bắc'),(13,'Mộc Châu'),(14,'Mai Châu'),(15,'Nha Trang'),(16,'Hồ'),(17,'Đảo'),(18,'Bình Ba'),(19,'Sapa'),(20,'Đồi Hồng Cổ'),(21,'Fansipan'),(22,'Đỉnh Pu Ta Leng'),(23,'Lai Châu'),(24,'A Pa Chải');
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
INSERT INTO `tour_tag` VALUES (1,1),(2,1),(3,1),(1,2),(2,3),(3,4),(4,5),(5,5),(6,5),(4,6),(5,6),(6,6),(4,7),(5,7),(6,7),(7,8),(8,8),(9,8),(7,9),(8,9),(9,10),(9,11),(10,12),(11,13),(12,14),(13,15),(14,15),(15,15),(13,16),(14,17),(15,18),(16,19),(17,19),(18,19),(16,20),(16,21),(17,22),(17,23),(18,24);
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
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `destination` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photos` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `tours` VALUES (1,'Tour Đà Lạt 3N3D: Du Thuyền Hồ Tuyền Lâm','Đến với Đà Lạt ư? Vô vàn thứ sẽ dần thấm vào trong người bạn, khiến bạn yêu nó lúc nào không biết, cái thấm ấy nó nhẹ nhàng len lỏi như những cái se se lạnh của thành phố sương mù này. Thưởng thức kỳ nghỉ tại \'Miền đất lạnh của miền Tây Nguyên\', khám phá những gì đặc trưng nhất của Đà Lạt hẳn là một trải nghiệm đáng nhớ cùng người thân của mình đúng không? Cùng khám phá ngay hôm nay! ','Đà Lạt','https://res.cloudinary.com/tourapp/image/upload/v1634136175/ivivu-ho-tuyen-lam-750x390_hao9so.jpg',1790000,1,1,'1'),(2,'Tour Đà Lạt 3N3D: Làng Người Lùn - Lưu Trú Wonder Resort (4*)','Đến với Đà Lạt ư? Vô vàn thứ sẽ dần thấm vào trong người bạn, khiến bạn yêu nó lúc nào không biết, cái thấm ấy nó nhẹ nhàng len lỏi như những cái se se lạnh của thành phố sương mù này. Thưởng thức kỳ nghỉ tại resort 4 sao, khám phá những gì đặc trưng nhất của Đà Lạt hẳn là một trải nghiệm đáng nhớ cùng người thân của mình đúng không??','Đà Lạt','https://res.cloudinary.com/tourapp/image/upload/v1634136174/resort-wonder-4-sao-750x390_o0qjjz.jpg',2490000,1,1,'1'),(3,'Tour Đà Lạt 3N3D: Đà Lạt và Hoa','Đến với Đà Lạt ư? Vô vàn thứ sẽ dần thấm vào trong người bạn, khiến bạn yêu nó lúc nào không biết, cái thấm ấy nó nhẹ nhàng len lỏi như những cái se se lạnh của thành phố sương mù này. Thưởng thức kỳ nghỉ tại \'Miền đất lạnh của miền Trung\', khám phá những gì đặc trưng nhất của Đà Lạt hẳn là một trải nghiệm đáng nhớ cùng người thân của mình đúng không? Cùng khám phá ngay hôm nay!','Đà Lạt','https://res.cloudinary.com/tourapp/image/upload/v1634136175/ivivu-bia-750x390_pzlucm.jpg',1590000,1,1,'1'),(4,'Tour Đà Nẵng 5N4D: Hội An - Bà Nà (Cầu Vàng) - Huế - Động Phong Nha (VT)','Miền Trung, dải đất thân thương nối liền hai miền Nam - Bắc của Việt Nam. “Cung đường di sản miền Trung” sẽ kết nối du khách với các di sản văn hóa của nhân loại được UNESCO công nhận bao gồm: Quảng Bình cùng Vườn quốc gia Phong Nha - Kẻ Bàng; Huế với hai di sản là Quần thể di tích Cố đô Huế và Nhã Nhạc cung đình; Quảng Nam với hai di sản là Thánh địa Mỹ Sơn và đô thị cổ Hội An. Trên mỗi bước đi, du khách còn có thể khám phá cho mình nhiều điểm đến hấp dẫn: Bà Nà Hill, Làng Chài Lăng Cô, …và nhiều bãi tắm tuyệt đẹp: Cửa Đại, Non Nước, Lăng Cô, Nhật Lệ…cùng với những nét ẩm thực độc đáo của Miền Trung. Cùng trải nghiệm cung đường tuyệt vời này ngay hôm nay!','Đà Nẵng','https://res.cloudinary.com/tourapp/image/upload/v1634136934/ivivu-hoi-an-bia-750x390_kobosq.jpg',3850000,1,2,'1'),(5,'Tour Đà Nẵng 3N2Đ: Bà Nà (Cầu Vàng) - Huế - Động Phong Nha (VT)','Miền Trung, dải đất thân thương nối liền hai miền Nam - Bắc của Việt Nam, “Cung đường di sản miền Trung” sẽ kết nối du khách với các di sản văn hóa của nhân loại được UNESCO công nhận bao gồm: Quảng Bình cùng Vườn quốc gia Phong Nha - Kẻ Bàng; Huế với hai di sản là Quần thể di tích Cố đô Huế và Nhã Nhạc cung đình; Quảng Nam với hai di sản là Thánh địa Mỹ Sơn và đô thị cổ Hội An. Trên mỗi bước đi, du khách còn có thể khám phá cho mình nhiều điểm đến hấp dẫn: Bà Nà Hill, Làng Chài Lăng Cô,… và nhiều bãi tắm tuyệt đẹp: Cửa Đại, Non Nước, Lăng Cô, Nhật Lệ… cùng với những nét ẩm thực độc đáo của Miền Trung.','Đà Nẵng','https://res.cloudinary.com/tourapp/image/upload/v1634136936/ivivu-co-do-hue-bia-750x390_lmjeq4.jpg',3050000,1,2,'1'),(6,'Tour Đà Nẵng 4N3D: Hội An - Bà Nà - Huế - Động Phong Nha/Thiên Đường (VT)','Miền Trung, dải đất thân thương nối liền hai miền Nam - Bắc của Việt Nam. “Cung đường di sản miền Trung” sẽ kết nối du khách với các di sản văn hóa của nhân loại được UNESCO công nhận bao gồm: Quảng Bình cùng Vườn quốc gia Phong Nha - Kẻ Bàng; Huế với hai di sản là Quần thể di tích Cố đô Huế và Nhã Nhạc cung đình; Quảng Nam với hai di sản là Thánh địa Mỹ Sơn và đô thị cổ Hội An. Trên mỗi bước đi, du khách còn có thể khám phá cho mình nhiều điểm đến hấp dẫn: Bà Nà Hill, Làng Chài Lăng Cô, và nhiều bãi tắm tuyệt đẹp: Cửa Đại, Non Nước, Lăng Cô, Nhật Lệ, cùng với những nét ẩm thực độc đáo của Miền Trung. Cùng khám phá cung đường tuyệt vời này ngay hôm nay!','Đà Nẵng','https://res.cloudinary.com/tourapp/image/upload/v1634137399/cau-vang-750x390_zhsq9x.jpg',3450000,1,2,'1'),(7,'Tour Hạ Long 2N1D: Vịnh Hạ Long - Hạ Long Park - Bãi Cháy','Không phải ngẫu nhiên mà vịnh Hạ Long hai lần được UNESCO công nhận danh hiệu Di sản Thiên nhiên Thế giới. Sự cuốn hút bởi cảnh quan thiên nhiên trù phú, độc đáo cùng con người thân thiện, những món ăn miền biển đặc sắc... là những lý do khiến vịnh Hạ Long nói riêng, thành phố biển Hạ Long nói chung luôn hấp dẫn du khách quay trở lại. Ngần ngại gì không cùng khám phá Hạ Long ngay?','Hạ Long','https://res.cloudinary.com/tourapp/image/upload/v1634137677/ha-long-bay-on-a-sunny-day-ivivu-750x390_ir7w9d.jpg',1800000,1,3,'0'),(8,'Tour Hạ Long 1N: Hà Nội - Sửng Sốt - Ti Tốp (Cao Tốc)','Vịnh Hạ Long là một trong những di sản thế giới tại Việt Nam được UNESCO công nhận vào năm 1994. Vịnh Hạ Long tiếp tục được bầu chọn là một trong bảy kỳ quan thiên nhiên mới của thế giới năm 2011. Trong Vịnh có hàng ngàn đảo đá với hình dạng kỳ diệu. Bạn có thể hành trình xung quanh vịnh để ngắm cảnh quan tuyệt vời và thăm một số hang động đẹp. Cùng khám phá ngay hôm nay!','Hạ Long','https://res.cloudinary.com/tourapp/image/upload/v1634137677/ivivu-ha-long-aerial-03-750x390_pwandb.jpg',850000,1,3,'1'),(9,'Tour Miền Bắc 6N5D: Hà Nội - Ninh Bình - Vịnh Hạ Long - Sapa','Xứ Bắc – vùng đất khai cơ của các Vương triều Việt, nơi định đô của hầu hết các triều đại phong kiến Việt Nam chính vì vậy nơi đây được xem như là đất kinh đô ngàn năm văn hiến với một bề dày văn hóa, lịch sử sâu sắc và đa dạng. Tuy nhiên, khi đến đây, du khách không chỉ được tham quan những công trình văn hóa - lịch sử cổ kính như: Văn Miếu, Hoàng thành Thăng Long, Cố đô Hoa Lư, Chùa Bái Đính, trải nghiệm những nét văn hóa đặc sắc của đất kinh đô như: ngoạn cảnh 36 phố phường, thưởng thức ẩm thực, xem múa rối nước; mà còn có thể thăm thú các thắng cảnh nổi tiếng nơi đây như: Di sản thế giới Danh thắng Tràng An và Vịnh Hạ Long, Sa Pa thị trấn trong mây. Ngoài ra Du khách còn có thể hòa mình vào cuộc sống bình dị nhưng đậm bản sắc của cộng đồng dân tộc ít người vùng cao như: Thái, Hmong, Dao, Mường, Tày. Cùng trải ngiệm vùng đất tuyệt vời này ngay hôm nay!','Hạ Long','https://res.cloudinary.com/tourapp/image/upload/v1634137678/halong-2-750x390_xm5gbk.jpg',5000000,1,3,'0'),(10,'Tour Miền Bắc 5N4D: Hà Nội - Hạ Long - Ninh Bình - Hà Giang','Miền Bắc – vùng đất khai cơ của các Vương triều Việt, nơi định đô của hầu hết các triều đại phong kiến Việt Nam. Chính vì vậy, nơi đây được xem như là đất kinh đô ngàn năm văn hiến với một bề dày văn hóa, lịch sử sâu sắc và đa dạng. Tuy nhiên, khi đến đây, du khách không chỉ được tham quan những công trình văn hóa - lịch sử cổ kính như: Đền Hùng, Văn Miếu, Hoàng thành Thăng Long, Cố đô Hoa Lư, Chùa Bái Đính…, mà còn trải nghiệm những nét văn hóa đặc sắc của đất kinh đô. Đến cực Bắc Hà Giang là một trong những điểm du lịch vùng cao quyến rũ bậc nhất Việt Nam với vẻ đẹp của thiên nhiên hùng vĩ, nét ngây thơ của trẻ nhỏ hay những ánh mắt sáng ngời của các cụ già đều mang đến nhiều cảm xúc. Cùng khám phá ngay hôm nay!','Miền Bắc','https://res.cloudinary.com/tourapp/image/upload/v1634134808/ivivu-tau-hana-5sao-750x390_hevkbd.jpg',5100000,1,4,'0'),(11,'Tour Mộc Châu 2N1D: Mùa Hoa Mộc Châu - Săn Mây Tà Xùa','Mộc Châu khiến dân tình \'đứng ngồi không yên\' bởi cao nguyên xanh tươi mát lành đẹp cả bốn mùa, có núi rừng hùng vĩ bao la, có thác cao suối chảy róc rách, có đỉnh Pha Luông lồng lộng gió trời mây phủ, có những đồi chè xanh bạt ngàn, đàn bò sữa nhởn nhơ gặm cỏ… Và được yêu thích nhất có lẽ là những mùa hoa đầy màu sắc, tạo nên bức tranh tươi đẹp, mới mẻ theo từng tháng trong năm. Bên cạnh đó liên tuyến Tà Xùa những biển mây trắng muốt, bồng bềnh, khiến con tim xốn xang, rộn ràng. Cùng khám phá ngay hôm nay!','Mộc Châu','https://res.cloudinary.com/tourapp/image/upload/v1634134807/ivivu-moc-chau-hoa-man-bia-750x390_cgnava.jpg',1490000,1,4,'1'),(12,'Tour Mai Châu 2N1D: Pù Luông Mùa Lúa Chín','Được ví đẹp tựa như Sa Pa của Tây Bắc hay xứ sở mộng mơ Đà Lạt của đất rừng Tây Nguyên, du lịch Pù Luông đang dần trở thành điểm du lịch hấp dẫn ở xứ Thanh với khung cảnh hoang sơ của núi rừng, những nếp nhà sàn giản dị hay những thửa ruộng bậc thang đẹp như tranh vẽ. Du lịch Pù Luông bốn mùa đều như nàng thiếu nữ đôi mươi đầy nhựa sống khép nép, tinh khôi vừa hoang dại khiến biết bao du khách vấn vương. Cùng khám phá ngay hôm nay!','Mai Châu','https://res.cloudinary.com/tourapp/image/upload/v1634134807/ivivu-pu-luong-bia2-750x390_y7bbre.jpg',1560000,1,4,'1'),(13,'Tour Nha Trang 3N3D: Nhũ Tiên - Vịnh San Hô - Vinwonder - Hồ Tắm Bọt Tuyết','Nha Trang, được mệnh danh là một trong 29 vịnh đẹp nhất Thế giới khi có khá nhiều cảnh quan thiên nhiên đẹp tuyệt mỹ cùng nhiều điểm du lịch hấp dẫn, cho những ai yêu thích khám phá vẻ đẹp tiềm ẩn của thiên nhiên. Sở hữu những bãi biển xanh mát cùng bãi cát trắng mịn trải dài, Nha Trang như đang vẫy gọi du khách muôn phương tìm về một trong những thành phố biển xinh đẹp bậc nhất Việt Nam. Cùng khám phá ngay hôm nay!','Nha Trang','https://res.cloudinary.com/tourapp/image/upload/v1634139090/ivivu-nha-trang-bia-750x390_ewlpnh.jpg',2590000,1,5,'0'),(14,'Tour Nha Trang 1N: 3 đảo VIP Hòn Tằm','Hòn Tằm là một đảo rộng hơn 110ha nằm trong vịnh Nha Trang - một trong 29 vịnh đẹp nhất thế giới. Đảo Hòn Tằm chỉ cách thành phố Nha Trang 7 km về phía Đông Nam và rất dễ dàng di chuyển ra vào đảo. Từ cầu cảng Hòn Tằm, nếu đi ca nô mất chừng 10 phút, đi thuyền mất khoảng 20 phút. Được thiên nhiên ưu ái ban tặng vẻ đẹp nguyên sơ và thuần khiết cùng với địa thế nằm giữa vùng biển trong xanh bốn mùa đầy nắng gió, đảo Hòn Tằm trở thành địa điểm lý tưởng cho những ai yêu thích du lịch sinh thái và nghỉ dưỡng. Cùng khám phá ngay hôm nay!','Nha Trang','https://res.cloudinary.com/tourapp/image/upload/v1634139091/ivivu-tour-nha-trang-3n3d-thien-duong-mua-sam-tai-viet-nam-hon-mun-750x390_ipkdvu.jpg',650000,1,5,'0'),(15,'Tour Bình Ba 2N2D: Khám phá đảo Tôm Hùm Cano','Bình Ba đang ngày càng hot về độ đẹp, độ “chịu chơi”, nơi đây được mệnh danh là “quốc đảo tôm hùm” với biển xanh cát trắng thơ mộng. Khách du lịch tìm đến Bình Ba không chỉ để thưởng thức hải sản, trải nghiệm những hoạt động mà còn là cơ hội để nghỉ ngơi sau những ngày làm việc mệt mỏi. Với khung cảnh hoang sơ, thanh bình của những bãi biển xanh trong, cát trắng mịn trải dài đã trở thành địa điểm chụp hình Bình Ba dành cho ai muốn có được những album đẹp mê ly. Cùng đồng hành cùng để có những khoảnh khắc tuyệt vời ngay hôm nay!','Bình Ba','https://res.cloudinary.com/tourapp/image/upload/v1634139091/binh-ba-2n2d-750x390_cq2z3b.jpg',1290000,1,5,'0'),(16,'Tour Sapa 3N2D: Cát Cát - KDL SWing - Fansipan - Đồi Hồng Cổ - Hang Động Tả Phìn','Thiên nhiên đã ưu ái ban tặng cho nơi đây những lợi thế mà không phải nơi đâu trên mảnh đất hình chữ S này cũng có được: những dãy núi trùng điệp sừng sững xen ngang làn sương khói huyền ảo hờ hững trôi, những thắng cảnh làm say đắm biết bao lòng người như thác Bạc, đèo Ô Quý Hồ, đỉnh Fansipan huyền thoại, và nhiều những cảnh đẹp khác. Sapa cũng là nơi thấm đẫm bản sắc văn hóa truyền thống dân tộc, là nơi sinh sống của đồng bào người Mông, Dao,… Cảnh đẹp Du Lich Sapa mùa hè thơ mộng, núi rừng nguyên sơ như tranh vẽ, thời tiết đặc trưng mùa đông trên ngọn núi fansipang kỳ vĩ hứa hẹn một tour du lịch khám phá. Cùng khám phá ngay hôm nay!','Sapa','https://res.cloudinary.com/tourapp/image/upload/v1634138275/ivivu-quang-truong-sapa-bia-750x390_x8wr6q.gif',2600000,1,6,'1'),(17,'Tour Trekking 3N4D: Chinh Phục Đỉnh Pu Ta Leng - Lai Châu','Hành trình chinh phục đỉnh Pu Ta Leng đi xuyên qua cánh rừng nguyên sinh với thảm thực vật đa dạng, rêu và địa y phủ gần như kín các thân cây cổ thụ đến cả những tảng đá. Qua những đoạn suối trong vắt róc rách chảy, rừng trúc thâm u, qua những cánh rừng đỗ quyên thả xuống cả thảm hoa rực rỡ và êm ái, qua những con dốc liên tiếp vắt kiệt sức như những thử thách lòng kiên trì, chí quyết tâm, nghị lực của người khám phá mình. Quý khách trải qua đủ mọi cung bậc cảm xúc suốt chặng hành trình. Quý khách đã đặt chân đến đỉnh núi mơ ước Pu Ta Leng. Cùng khám phá ngay hôm nay !','Lai Châu','https://res.cloudinary.com/tourapp/image/upload/v1634138275/ivivu-trekking-qua-suoi-750x390_vxl77t.gif',2988000,1,6,'2'),(18,'Tour Miền Bắc 6N5D: HCM - Chinh Phục Cực Tây A Pa Chải - Cột Mốc Số 0','Hãy một lần lên đường đến với cực Tây Apachải & chinh phục cột mốc số 0 – nơi một tiếng gà gáy, cả 3 nước đều nghe, cùng chạm tay vào “cột mốc 17, 18 – nơi con sông Đà chảy vào đất Việt” ở nơi tận cùng Tây Bắc, có thể nắng gió bụi đường có làm nhuốm màu làn da trắng của bạn, quần áo bạn cũng có thể nhàu đi đôi chút, nhưng chắc chắn sẽ làm cho đôi chân và tâm hồn của bạn mạnh mẽ hơn, can trường hơn, cùng tự hào về dòng máu lạc hồng và mảnh đất nơi biên cương địa đầu Tây Bắc. Cùng khám phá ngay hôm nay!','A Pa Chải','https://res.cloudinary.com/tourapp/image/upload/v1634138275/ivivu-a-pa-chai-bia-750x390_dkwx5v.jpg',6988000,1,6,'2');
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
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `users` VALUES (10,'adase','fdfs','thienthanh@gmail.com','thienthanh','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1633888973/istvnzufpf5ji7zfuqhv.png','2000-11-29','0901310332','0','male','asd',1,1),(14,'Chauads','Tuu','thientuu2911@gmail.com','thientuu2911','$2a$10$CMI.OoNakibClV8XI47p7u5WhpZf3uO.Jj8EfS/VtaZ/H.pF5qug.','ewrjiowefw',NULL,'2000-11-29','0901310332','3','male','eqwqw',1,1),(21,'Chau','Tuu','thientuu2000@gmail.com','admin','$2a$10$rRgAYlnWouw7643X4paxtuPTssfqXBA4a7qwVk4m8JuYu2F1DbEAC','ewrjiowefw',NULL,'2000-09-02','0901310332','3','male','ftyasd',1,1),(22,'Chau','Tuu','thientsve@gmail.com','adminfefe','$2a$10$rRgAYlnWouw7643X4paxtuPTssfqXBA4a7qwVk4m8JuYu2F1DbEAC','ewrjiowefw',NULL,'2000-09-02','0901310332','3','male','ftyasd',1,1),(25,'Chau','Tuu','vdvd1@gmail.com','vdvd','$2a$10$T2XA4W3Y8picjaE6JN.b6uWt.DiXhGyRcrR3MuRi9NFu.TjDmGA3O','ewrjiowefw',NULL,'2222-02-22','0901310332','3','male','wdwde',1,1),(30,'Chau','Tuu','fasfw@gmail.com','fasfsaf','$2a$10$a3bz1Z3yA5pG1v27Wb.kvungZYDFn4MAW0.oNG5bxW3LZoxegSkwm','ewrjiowefw','','2000-11-29','0901310332','0','male','ftydth',1,1),(31,'Chau','Tuu','ewf33f@gmail.com','fewfwe','$2a$10$pybGpGO2jgmLj.1n2croJ.UvvAz9pVEDx0lLza0IFm2CsDEYLVO5q','ewrjiowefw','https://res.cloudinary.com/tourapp/image/upload/v1634087143/hlnveoyp5wryntiysz7g.png','2000-11-29','0901310332','0','male','ftydthfew',1,1),(32,'Chau','Tuu','sdwwwef@gmail.com','fewfwefew','$2a$10$RkmU4wxyNu0gkD8tQ1djKOOGXg/4hylqzp4wFG9AT2UXAJIxeVYqi','ewrjiowefw','','2021-10-15','0901310332','0','male','èwefew',1,1);
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

-- Dump completed on 2021-10-19  0:26:29
