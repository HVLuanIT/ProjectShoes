CREATE DATABASE  IF NOT EXISTS `ndshoes` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ndshoes`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: ndshoes
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_category_idx` (`create_by`),
  KEY `fk_user_update_category_idx` (`update_by`),
  CONSTRAINT `fk_user_create_category` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_category` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (1,'Giày Adidas',1,1,'2025-04-04 00:00:00',NULL,1,'',NULL),(2,'Giày Nike',1,1,'2025-04-04 00:00:00',NULL,1,'',NULL),(3,'Boot',1,1,'2025-04-11 00:00:00','2025-04-12 00:00:00',1,'',NULL),(4,'Nikes',1,1,'2025-04-12 00:00:00',NULL,0,'',NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(1200) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_create_contact_idx` (`create_by`),
  KEY `fk_user_update_contact_idx` (`update_by`),
  CONSTRAINT `fk_user_create_contact` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_contact` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (1,'Hoàng Luân','09351784562','hoangvanluan9a1@gmail.com','HP','xin chào',NULL,NULL,'2025-04-13 16:38:46',NULL,0),(2,'Luan','09351784562','hoangvanluan9a1@gmail.com','HP','Xin chào',NULL,NULL,'2025-04-13 16:56:59',NULL,0),(3,'Nguyeen','0756681476','nguyen@gmail.com','Hải Phòng','Giày rất đẹp',NULL,NULL,'2025-04-13 18:13:33',NULL,0),(4,'Loan','0965417782','loan@gmail.com','Bắc Giang','Giày rất bền',NULL,NULL,'2025-04-13 18:14:03',NULL,1),(5,'quyết','0987456321','quyet@gmail.com','Bắc Giang','Sản phẩm rất bền',NULL,NULL,'2025-04-14 15:33:03',NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `size` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `is_hot` tinyint DEFAULT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `product_quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_product_idx` (`category_id`),
  KEY `fk_user_create_product_idx` (`create_by`),
  KEY `fk_user_update_product_idx` (`update_by`),
  CONSTRAINT `fk_category_product` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_create_product` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_product` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product`
--

LOCK TABLES `tbl_product` WRITE;
/*!40000 ALTER TABLE `tbl_product` DISABLE KEYS */;
INSERT INTO `tbl_product` VALUES (1,1,'LeBron 19','Product/Avatar/avatar4.png',500000.00,450000.00,'41,42,43',1,1,'2025-04-13 00:00:00',NULL,1,1,'','',NULL,20),(2,2,'Nike Air Force 1 07 Cam','Product/Avatar/avatar1.jpg',5000000.00,NULL,'40,41,42,45',1,1,'2025-04-13 00:00:00',NULL,1,1,'','',NULL,19),(3,2,'Nike Air Force 1 07 LV8','Product/Avatar/avatar2.jpg',3900000.00,NULL,'40,41,42,45,46',1,1,'2025-04-12 00:00:00',NULL,1,0,'','',NULL,30),(4,2,'Nike Blazer x sacai x KAWS','Product/Avatar/avatar5.jpg',5100000.00,NULL,'40,41,42,45,46',1,1,'2025-01-09 00:00:00',NULL,1,0,'','',NULL,35),(5,2,'Nike Air Max 90','Product/Avatar/avatar6.jpg',3100000.00,NULL,'40,41,42,45',1,1,'2025-04-12 00:00:00',NULL,1,0,'','',NULL,13),(6,2,'Nike Air Huarache PRM QS','Product/Avatar/avatar7.jpg',8000000.00,NULL,'40,41,42,45,46',1,1,'2025-04-12 00:00:00',NULL,0,0,'','',NULL,10),(7,3,'Giày Stan Smith','Product/Avatar/avartar3.jpg',950000.00,NULL,'40,41,42,45',1,1,'2025-04-12 00:00:00',NULL,1,0,'','',NULL,49),(8,1,'Kyrie Infinity','Product/Avatar/avatar8.jpg',4829000.00,NULL,'40,41,42,45,46',1,1,'2025-04-12 00:00:00',NULL,1,0,'','',NULL,17),(9,3,'GIÀY Ultraboost 4.0 DNA','Product/Avatar/avatar9.jpg',4500000.00,NULL,'39,42',1,1,'2025-04-13 00:00:00',NULL,1,1,'','',NULL,21),(10,1,'Giày Adidas Ultraboost DNA SEA','Product/Avatar/avatar10.jpg',9000000.00,NULL,'38,39,46',1,1,'2025-04-13 00:00:00',NULL,1,1,'','',NULL,11),(11,1,'Giày X9000L4','Product/Avatar/avatar11.jpg',3800000.00,NULL,'38,39,46',1,1,'2025-04-12 00:00:00',NULL,1,0,'','',NULL,22);
/*!40000 ALTER TABLE `tbl_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_product_image`
--

DROP TABLE IF EXISTS `tbl_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_product_image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `title` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_product_image_idx` (`product_id`),
  CONSTRAINT `fk_product_product_image` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_image`
--

LOCK TABLES `tbl_product_image` WRITE;
/*!40000 ALTER TABLE `tbl_product_image` DISABLE KEYS */;
INSERT INTO `tbl_product_image` VALUES (1,2,'image1-1.png','Product/Image/image1-1.png',NULL,NULL,'2025-04-12 15:57:38',NULL,1),(2,2,'image1-2.png','Product/Image/image1-2.png',NULL,NULL,'2025-04-12 15:57:38',NULL,1),(3,2,'image1-4.png','Product/Image/image1-4.png',NULL,NULL,'2025-04-12 15:57:38',NULL,1),(4,2,'image1-3.png','Product/Image/image1-3.png',NULL,NULL,'2025-04-12 15:57:38',NULL,1),(5,1,'img4-4.png','Product/Image/img4-4.png',NULL,NULL,'2025-04-12 18:14:14',NULL,1),(6,1,'img4-1.png','Product/Image/img4-1.png',NULL,NULL,'2025-04-12 18:14:14',NULL,1),(7,1,'img4-3.png','Product/Image/img4-3.png',NULL,NULL,'2025-04-12 18:14:14',NULL,1),(8,1,'img4-2.png','Product/Image/img4-2.png',NULL,NULL,'2025-04-12 18:14:14',NULL,1),(9,3,'img2-4.png','Product/Image/img2-4.png',NULL,NULL,'2025-04-12 20:47:19',NULL,1),(10,3,'img2-3.png','Product/Image/img2-3.png',NULL,NULL,'2025-04-12 20:47:19',NULL,1),(11,3,'img2-1.png','Product/Image/img2-1.png',NULL,NULL,'2025-04-12 20:47:19',NULL,1),(12,3,'img2-2.png','Product/Image/img2-2.png',NULL,NULL,'2025-04-12 20:47:19',NULL,1),(13,4,'img5-4.png','Product/Image/img5-4.png',NULL,NULL,'2025-04-12 20:48:34',NULL,1),(14,4,'img5-3.png','Product/Image/img5-3.png',NULL,NULL,'2025-04-12 20:48:34',NULL,1),(15,4,'img5-1.png','Product/Image/img5-1.png',NULL,NULL,'2025-04-12 20:48:34',NULL,1),(16,4,'img5-2.png','Product/Image/img5-2.png',NULL,NULL,'2025-04-12 20:48:34',NULL,1),(17,5,'img6-4.png','Product/Image/img6-4.png',NULL,NULL,'2025-04-12 20:50:00',NULL,1),(18,5,'img6-2.png','Product/Image/img6-2.png',NULL,NULL,'2025-04-12 20:50:00',NULL,1),(19,5,'img6-3.png','Product/Image/img6-3.png',NULL,NULL,'2025-04-12 20:50:00',NULL,1),(20,5,'img6-1.png','Product/Image/img6-1.png',NULL,NULL,'2025-04-12 20:50:00',NULL,1),(21,6,'img7-4.png','Product/Image/img7-4.png',NULL,NULL,'2025-04-12 20:51:13',NULL,1),(22,6,'img7-1.png','Product/Image/img7-1.png',NULL,NULL,'2025-04-12 20:51:13',NULL,1),(23,6,'img7-2.png','Product/Image/img7-2.png',NULL,NULL,'2025-04-12 20:51:13',NULL,1),(24,6,'img7-3.png','Product/Image/img7-3.png',NULL,NULL,'2025-04-12 20:51:13',NULL,1),(25,7,'img3-1.png','Product/Image/img3-1.png',NULL,NULL,'2025-04-12 20:54:29',NULL,1),(26,7,'img3-2.png','Product/Image/img3-2.png',NULL,NULL,'2025-04-12 20:54:29',NULL,1),(27,7,'img3-3.png','Product/Image/img3-3.png',NULL,NULL,'2025-04-12 20:54:29',NULL,1),(28,7,'img3-4.png','Product/Image/img3-4.png',NULL,NULL,'2025-04-12 20:54:29',NULL,1),(29,8,'img8-3.png','Product/Image/img8-3.png',NULL,NULL,'2025-04-12 20:56:17',NULL,1),(30,8,'img8-2.png','Product/Image/img8-2.png',NULL,NULL,'2025-04-12 20:56:17',NULL,1),(31,8,'img8-4.png','Product/Image/img8-4.png',NULL,NULL,'2025-04-12 20:56:17',NULL,1),(32,8,'img8-1.png','Product/Image/img8-1.png',NULL,NULL,'2025-04-12 20:56:17',NULL,1),(33,9,'img9-3.jpg','Product/Image/img9-3.jpg',NULL,NULL,'2025-04-12 20:58:26',NULL,1),(34,9,'img9-1.jpg','Product/Image/img9-1.jpg',NULL,NULL,'2025-04-12 20:58:26',NULL,1),(35,9,'img9-2.jpg','Product/Image/img9-2.jpg',NULL,NULL,'2025-04-12 20:58:26',NULL,1),(36,9,'img9-4.jpg','Product/Image/img9-4.jpg',NULL,NULL,'2025-04-12 20:58:26',NULL,1),(37,10,'img10-4.jpg','Product/Image/img10-4.jpg',NULL,NULL,'2025-04-12 21:00:14',NULL,1),(38,10,'img10-3.jpg','Product/Image/img10-3.jpg',NULL,NULL,'2025-04-12 21:00:14',NULL,1),(39,10,'img10-2.jpg','Product/Image/img10-2.jpg',NULL,NULL,'2025-04-12 21:00:14',NULL,1),(40,10,'img10-1.jpg','Product/Image/img10-1.jpg',NULL,NULL,'2025-04-12 21:00:14',NULL,1),(41,11,'img11-1.jpg','Product/Image/img11-1.jpg',NULL,NULL,'2025-04-12 21:01:29',NULL,1),(42,11,'img11-2.jpg','Product/Image/img11-2.jpg',NULL,NULL,'2025-04-12 21:01:29',NULL,1),(43,11,'img11-3.jpg','Product/Image/img11-3.jpg',NULL,NULL,'2025-04-12 21:01:29',NULL,1),(44,11,'img11-4.jpg','Product/Image/img11-4.jpg',NULL,NULL,'2025-04-12 21:01:29',NULL,1);
/*!40000 ALTER TABLE `tbl_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_createby_user_idx` (`create_by`),
  KEY `fk_updateby_user_idx` (`update_by`),
  CONSTRAINT `fk_createby_user` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_updateby_user` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'ADMIN',1,1,NULL,NULL,1,''),(2,'GUEST ',1,1,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order`
--

DROP TABLE IF EXISTS `tbl_sale_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `code` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `customer_name` varchar(300) COLLATE utf8mb4_bin NOT NULL,
  `customer_mobile` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_sale_order_idx` (`user_id`),
  KEY `fk_user_create_saleorder_idx` (`create_by`),
  KEY `fk_user_update_saleorder_idx` (`update_by`),
  CONSTRAINT `fk_user_create_saleorder` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_sale_order` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_saleorder` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order`
--

LOCK TABLES `tbl_sale_order` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order` DISABLE KEYS */;
INSERT INTO `tbl_sale_order` VALUES (2,NULL,'09863251782025313',21800000.00,'Nguyen','0986325178',NULL,'Hai Phong',1,NULL,'2025-04-13 00:00:00',NULL,0),(3,NULL,'09351799452025314',14000000.00,'Nguyen','0935179945',NULL,'Hải Phòng',1,NULL,'2025-04-14 00:00:00',NULL,1),(4,NULL,'07884518362025314',4050000.00,'Loan','0788451836','loan@gmail.com','Bắc Giang',NULL,NULL,'2025-04-14 17:10:25',NULL,0),(5,NULL,'09358766542025315',7929000.00,'Hoàng','0935876654','hoang@gmail.com','Hải PHòng',NULL,NULL,'2025-04-15 09:38:36',NULL,0);
/*!40000 ALTER TABLE `tbl_sale_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_sale_order_product`
--

DROP TABLE IF EXISTS `tbl_sale_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_sale_order_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sale_order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `size` varchar(45) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_sale_order_product_idx` (`product_id`),
  KEY `fk_sale_order_sale_order_product_idx` (`sale_order_id`),
  CONSTRAINT `fk_product_sale_order_product` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sale_order_sale_order_product` FOREIGN KEY (`sale_order_id`) REFERENCES `tbl_sale_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order_product`
--

LOCK TABLES `tbl_sale_order_product` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order_product` DISABLE KEYS */;
INSERT INTO `tbl_sale_order_product` VALUES (3,2,2,2,NULL,NULL,'2025-04-13 15:59:18',NULL,1,'40',NULL),(4,2,2,2,NULL,NULL,'2025-04-13 15:59:18',NULL,1,'41',NULL),(5,2,1,4,NULL,NULL,'2025-04-13 15:59:18',NULL,1,'42',NULL),(6,3,2,1,NULL,NULL,'2025-04-14 17:09:43',NULL,1,'40',NULL),(7,3,10,1,NULL,NULL,'2025-04-14 17:09:43',NULL,1,'38',NULL),(8,4,7,1,NULL,NULL,'2025-04-14 17:10:25',NULL,1,'40',NULL),(9,4,5,1,NULL,NULL,'2025-04-14 17:10:25',NULL,1,'40',NULL),(10,5,5,1,NULL,NULL,'2025-04-15 09:38:36',NULL,1,'40',NULL),(11,5,8,1,NULL,NULL,'2025-04-15 09:38:36',NULL,1,'40',NULL);
/*!40000 ALTER TABLE `tbl_sale_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(120) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_create_idx` (`create_by`),
  KEY `fk_user_update_idx` (`update_by`),
  CONSTRAINT `fk_user_create` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','$2a$04$WvA1XvehftxEskkkHVdYs.JLBLEsHSUqCczWrqSjKm2a0LDK5Pvti','HoangLuan','0762380296','hoangvanluan9a1@gmail.com','Hải Phòng',NULL,1,1,NULL,NULL,1,NULL),(2,'guest','$2a$04$WvA1XvehftxEskkkHVdYs.JLBLEsHSUqCczWrqSjKm2a0LDK5Pvti','Luan','0762380299','hoangvanluanit121@gmail.com','Hải Phòng',NULL,1,1,NULL,NULL,1,NULL),(3,'luan','$2a$04$WvA1XvehftxEskkkHVdYs.JLBLEsHSUqCczWrqSjKm2a0LDK5Pvti','HoangVanLuan','09351788565','hoangvanluan9a1@gmail.com','Hải Phòng',NULL,1,1,NULL,NULL,1,''),(4,'nguyen','$2a$04$WvA1XvehftxEskkkHVdYs.JLBLEsHSUqCczWrqSjKm2a0LDK5Pvti','Nguyen','07632863951','nguyen@gmail.com','Hải PHòng',NULL,1,1,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user_role`
--

DROP TABLE IF EXISTS `tbl_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_user_role_idx` (`user_id`),
  KEY `fk_role_user_role_idx` (`role_id`),
  CONSTRAINT `fk_role_user_role` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_user_role` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (1,1,1),(2,2,2),(3,4,2),(4,3,1);
/*!40000 ALTER TABLE `tbl_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-16  9:20:39
