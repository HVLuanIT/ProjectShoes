CREATE DATABASE  IF NOT EXISTS `projects` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projects`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: projects
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
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_create_category_idx` (`create_by`),
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
INSERT INTO `tbl_category` VALUES (1,'Giày Adidas',1,1,'2025-04-16 00:00:00',NULL,1,'',NULL),(2,'Giày Nike',1,1,'2025-04-16 00:00:00',NULL,1,'',NULL),(3,'Boot',1,1,'2025-04-16 00:00:00',NULL,1,'',NULL),(4,'Thể thao',1,1,'2025-04-16 00:00:00',NULL,0,'',NULL);
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
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_create_contact_idx` (`create_by`),
  KEY `fk_user_update_contact_idx` (`update_by`),
  CONSTRAINT `fk_user_create_contact` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_contact` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (1,'Luan','0935179956','luan@gmail.com','Hai Phong','Giày rất đẹp\n',NULL,NULL,'2025-04-16 20:33:08',NULL,1),(2,'Nguyên','0958143245','nguyen@gmail.com','Hải Phòng','Giày rất bền',NULL,NULL,'2025-04-16 20:34:56',NULL,1);
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
  `product_quantity` int DEFAULT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `size` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `is_hot` tinyint DEFAULT NULL,
  `short_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
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
INSERT INTO `tbl_product` VALUES (1,2,'Nike Air Force 1 07 Cam','Product/Avatar/avatar1.jpg',5000000.00,16,4500000.00,'40,41,42,45',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(2,2,'Nike Air Force 1 07 LV8','Product/Avatar/avatar2.jpg',3900000.00,30,NULL,'40,41,42,45,46',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(3,2,'Nike Air Force 1 07','Product/Avatar/avartar3.jpg',2000000.00,35,NULL,'40,41,42,45',1,1,'2025-04-16 00:00:00',NULL,0,0,'','',NULL),(4,1,'LeBron 19','Product/Avatar/avatar4.png',8000000.00,5,NULL,'38,39,46',1,1,'2025-04-16 00:00:00',NULL,1,1,'','',NULL),(5,2,'Nike Blazer x sacai x KAWS','Product/Avatar/avatar5.jpg',5100000.00,25,NULL,'38,39,46',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(6,2,'Nike Air Max 90','Product/Avatar/avatar6.jpg',9000000.00,15,NULL,'40,41,42,45,46',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(7,2,'Nike Air Huarache PRM QS','Product/Avatar/avatar7.jpg',6000000.00,20,NULL,'40,41,42,45',1,1,'2025-04-16 00:00:00',NULL,1,1,'','',NULL),(8,1,'Kyrie Infinity','Product/Avatar/avatar8.jpg',4800000.00,39,NULL,'40,41,42,45,46',1,1,'2025-04-16 00:00:00',NULL,1,1,'','',NULL),(9,3,'GIÀY Ultraboost 4.0 DNA','Product/Avatar/avatar9.jpg',4500000.00,29,NULL,'38,39,46',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(10,3,'Giày Adidas Ultraboost DNA','Product/Avatar/avatar10.jpg',5500000.00,20,NULL,'38,39,46',1,1,'2025-04-16 00:00:00',NULL,1,0,'','',NULL),(11,1,'Giày X9000L4','Product/Avatar/avatar11.jpg',11000000.00,29,NULL,'39,42',1,1,'2025-04-16 00:00:00',NULL,1,1,'','',NULL);
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
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `path` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_productimage_idx` (`product_id`),
  CONSTRAINT `fk_product_productimage` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_product_image`
--

LOCK TABLES `tbl_product_image` WRITE;
/*!40000 ALTER TABLE `tbl_product_image` DISABLE KEYS */;
INSERT INTO `tbl_product_image` VALUES (1,1,'image1-4.png','Product/Image/image1-4.png',NULL,NULL,'2025-04-16 20:00:56',NULL,1),(2,1,'image1-2.png','Product/Image/image1-2.png',NULL,NULL,'2025-04-16 20:00:56',NULL,1),(3,1,'image1-1.png','Product/Image/image1-1.png',NULL,NULL,'2025-04-16 20:00:56',NULL,1),(4,1,'image1-3.png','Product/Image/image1-3.png',NULL,NULL,'2025-04-16 20:00:56',NULL,1),(5,2,'img2-2.png','Product/Image/img2-2.png',NULL,NULL,'2025-04-16 20:02:19',NULL,1),(6,2,'img2-1.png','Product/Image/img2-1.png',NULL,NULL,'2025-04-16 20:02:19',NULL,1),(7,2,'img2-3.png','Product/Image/img2-3.png',NULL,NULL,'2025-04-16 20:02:19',NULL,1),(8,2,'img2-4.png','Product/Image/img2-4.png',NULL,NULL,'2025-04-16 20:02:19',NULL,1),(9,3,'img3-1.png','Product/Image/img3-1.png',NULL,NULL,'2025-04-16 20:04:01',NULL,1),(10,3,'img3-2.png','Product/Image/img3-2.png',NULL,NULL,'2025-04-16 20:04:01',NULL,1),(11,3,'img3-4.png','Product/Image/img3-4.png',NULL,NULL,'2025-04-16 20:04:01',NULL,1),(12,3,'img3-3.png','Product/Image/img3-3.png',NULL,NULL,'2025-04-16 20:04:01',NULL,1),(13,4,'img4-4.png','Product/Image/img4-4.png',NULL,NULL,'2025-04-16 20:05:17',NULL,1),(14,4,'img4-3.png','Product/Image/img4-3.png',NULL,NULL,'2025-04-16 20:05:17',NULL,1),(15,4,'img4-1.png','Product/Image/img4-1.png',NULL,NULL,'2025-04-16 20:05:17',NULL,1),(16,4,'img4-2.png','Product/Image/img4-2.png',NULL,NULL,'2025-04-16 20:05:17',NULL,1),(17,5,'img5-1.png','Product/Image/img5-1.png',NULL,NULL,'2025-04-16 20:07:23',NULL,1),(18,5,'img5-2.png','Product/Image/img5-2.png',NULL,NULL,'2025-04-16 20:07:23',NULL,1),(19,5,'img5-3.png','Product/Image/img5-3.png',NULL,NULL,'2025-04-16 20:07:23',NULL,1),(20,5,'img5-4.png','Product/Image/img5-4.png',NULL,NULL,'2025-04-16 20:07:23',NULL,1),(21,6,'img6-4.png','Product/Image/img6-4.png',NULL,NULL,'2025-04-16 20:08:42',NULL,1),(22,6,'img6-1.png','Product/Image/img6-1.png',NULL,NULL,'2025-04-16 20:08:42',NULL,1),(23,6,'img6-2.png','Product/Image/img6-2.png',NULL,NULL,'2025-04-16 20:08:42',NULL,1),(24,6,'img6-3.png','Product/Image/img6-3.png',NULL,NULL,'2025-04-16 20:08:42',NULL,1),(25,7,'img7-3.png','Product/Image/img7-3.png',NULL,NULL,'2025-04-16 20:09:47',NULL,1),(26,7,'img7-4.png','Product/Image/img7-4.png',NULL,NULL,'2025-04-16 20:09:47',NULL,1),(27,7,'img7-1.png','Product/Image/img7-1.png',NULL,NULL,'2025-04-16 20:09:47',NULL,1),(28,7,'img7-2.png','Product/Image/img7-2.png',NULL,NULL,'2025-04-16 20:09:47',NULL,1),(29,8,'img8-3.png','Product/Image/img8-3.png',NULL,NULL,'2025-04-16 20:10:58',NULL,1),(30,8,'img8-4.png','Product/Image/img8-4.png',NULL,NULL,'2025-04-16 20:10:58',NULL,1),(31,8,'img8-1.png','Product/Image/img8-1.png',NULL,NULL,'2025-04-16 20:10:58',NULL,1),(32,8,'img8-2.png','Product/Image/img8-2.png',NULL,NULL,'2025-04-16 20:10:58',NULL,1),(33,9,'img9-4.jpg','Product/Image/img9-4.jpg',NULL,NULL,'2025-04-16 20:12:56',NULL,1),(34,9,'img9-2.jpg','Product/Image/img9-2.jpg',NULL,NULL,'2025-04-16 20:12:56',NULL,1),(35,9,'img9-3.jpg','Product/Image/img9-3.jpg',NULL,NULL,'2025-04-16 20:12:56',NULL,1),(36,9,'img9-1.jpg','Product/Image/img9-1.jpg',NULL,NULL,'2025-04-16 20:12:56',NULL,1),(37,10,'img10-1.jpg','Product/Image/img10-1.jpg',NULL,NULL,'2025-04-16 20:19:04',NULL,1),(38,10,'img10-2.jpg','Product/Image/img10-2.jpg',NULL,NULL,'2025-04-16 20:19:04',NULL,1),(39,10,'img10-3.jpg','Product/Image/img10-3.jpg',NULL,NULL,'2025-04-16 20:19:04',NULL,1),(40,10,'img10-4.jpg','Product/Image/img10-4.jpg',NULL,NULL,'2025-04-16 20:19:04',NULL,1),(41,11,'img11-4.jpg','Product/Image/img11-4.jpg',NULL,NULL,'2025-04-16 20:20:29',NULL,1),(42,11,'img11-3.jpg','Product/Image/img11-3.jpg',NULL,NULL,'2025-04-16 20:20:29',NULL,1),(43,11,'img11-1.jpg','Product/Image/img11-1.jpg',NULL,NULL,'2025-04-16 20:20:29',NULL,1),(44,11,'img11-2.jpg','Product/Image/img11-2.jpg',NULL,NULL,'2025-04-16 20:20:29',NULL,1);
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
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_updateby_user_idx` (`create_by`),
  KEY `fk_updateby_user_idx1` (`update_by`),
  CONSTRAINT `fk_create_by_user` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_update_by_user` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'ADMIN',1,1,NULL,NULL,1,NULL),(2,'GUEST',1,1,NULL,NULL,1,NULL);
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
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `customer_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `customer_mobile` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `payment_method` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_saleorder_idx` (`user_id`),
  KEY `fk_user_create_saleorder_idx` (`create_by`),
  KEY `fk_user_update_saleorder_idx` (`update_by`),
  CONSTRAINT `fk_user_create_saleorder` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_saleorder` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_update_saleorder` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order`
--

LOCK TABLES `tbl_sale_order` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order` DISABLE KEYS */;
INSERT INTO `tbl_sale_order` VALUES (1,NULL,'093517845622025316',12500000.00,'Luan','09351784562','hoangvanluan9a1@gmail.com','HP',NULL,NULL,'2025-04-16 20:27:05',NULL,0,NULL),(2,NULL,'07885321452025316',29500000.00,'Loan','0788532145','loan@gmail.com','Bắc Giang',NULL,NULL,'2025-04-16 20:29:18',NULL,0,NULL),(4,NULL,'0938425682025316',12800000.00,'nguyen','093842568',NULL,'Hải Phòng',1,NULL,'2025-04-16 00:00:00',NULL,1,NULL);
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
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `size` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_saleorderproduct_idx` (`product_id`),
  KEY `fk_saleorder_saleorderproduct_idx` (`sale_order_id`),
  CONSTRAINT `fk_product_saleorderproduct` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_saleorder_saleorderproduct` FOREIGN KEY (`sale_order_id`) REFERENCES `tbl_sale_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_sale_order_product`
--

LOCK TABLES `tbl_sale_order_product` WRITE;
/*!40000 ALTER TABLE `tbl_sale_order_product` DISABLE KEYS */;
INSERT INTO `tbl_sale_order_product` VALUES (1,1,1,1,NULL,NULL,'2025-04-16 20:27:05',NULL,1,NULL,'40'),(2,1,4,1,NULL,NULL,'2025-04-16 20:27:05',NULL,1,NULL,'38'),(3,2,1,1,NULL,NULL,'2025-04-16 20:29:18',NULL,1,NULL,'42'),(4,2,4,2,NULL,NULL,'2025-04-16 20:29:18',NULL,1,NULL,'38'),(5,2,1,2,NULL,NULL,'2025-04-16 20:29:18',NULL,1,NULL,'40'),(10,4,4,1,NULL,NULL,'2025-04-16 20:31:46',NULL,1,NULL,'38'),(11,4,8,1,NULL,NULL,'2025-04-16 20:31:46',NULL,1,NULL,'40');
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
  `username` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `address` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `avatar` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_by` int DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_createby_user_idx` (`create_by`),
  KEY `fk_updateby_user_idx` (`update_by`),
  CONSTRAINT `fk_createby_user` FOREIGN KEY (`create_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_updateby_user` FOREIGN KEY (`update_by`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','$2a$04$TY3UYyoOqn3tVb21ZfXRv.bXk02lPR4fLcssDwFasSlG8mrc990iW','HoangLuan','0762380196','hoangvanluan9a1@gmail.com','Hai PHong',NULL,1,1,NULL,NULL,1,NULL),(2,'guest','$2a$04$TY3UYyoOqn3tVb21ZfXRv.bXk02lPR4fLcssDwFasSlG8mrc990iW','Luan','0935179956','luan@gmail.com','Hai Phong',NULL,1,1,NULL,NULL,1,NULL),(3,'huan','$2a$04$7t8guMFhF6e58bZ.OhDAIefq6R13z0ymXnUwJApaD0QHOBkcDQCIK','Trần Huân','0935785484','huan@gmail.com','Hà Nội',NULL,1,1,'2025-04-16 00:00:00',NULL,1,''),(4,'loan','$2a$04$IMPzm.XYgSydKj6qp1WsmOHLkhnXt3xJOm0Mkg.isYMzy3FM4XrDC','Loan','07885418123','loan@gmail.com','Bắc Giang',NULL,1,1,NULL,NULL,1,'');
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
  KEY `fk_role_user_idx` (`role_id`),
  KEY `fk_user_role_idx` (`user_id`),
  CONSTRAINT `fk_role_user` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_role` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user_role`
--

LOCK TABLES `tbl_user_role` WRITE;
/*!40000 ALTER TABLE `tbl_user_role` DISABLE KEYS */;
INSERT INTO `tbl_user_role` VALUES (3,1,1),(4,3,1),(5,2,2),(6,4,2);
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

-- Dump completed on 2025-04-16 20:37:16
