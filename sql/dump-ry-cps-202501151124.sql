-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: ry-cps
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ape_activity`
--

DROP TABLE IF EXISTS `ape_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ape_activity` (
  `activity_id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动ID，主键，自增',
  `activity_name` varchar(100) NOT NULL COMMENT '活动名称',
  `activity_location` varchar(100) DEFAULT NULL COMMENT '活动地点',
  `activity_content` varchar(500) DEFAULT NULL COMMENT '活动内容',
  `start_time` datetime NOT NULL COMMENT '活动开始时间',
  `end_time` datetime NOT NULL COMMENT '活动结束时间',
  `status` varchar(100) NOT NULL COMMENT '状态（1-可预约，0-不可预约）',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='古诗词交流活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ape_activity`
--

LOCK TABLES `ape_activity` WRITE;
/*!40000 ALTER TABLE `ape_activity` DISABLE KEYS */;
INSERT INTO `ape_activity` VALUES (1,'aaa','北京','aaahh','2025-01-07 08:00:00','2025-01-10 20:00:00','1'),(2,'不不不','西安','内容','2025-01-06 11:06:11','2025-01-08 00:00:00','1'),(3,'冲冲冲','人人','二人','2025-01-06 11:06:32','2025-01-25 00:00:00','1'),(4,'达到','达到11','达到','2025-01-09 20:03:41','2025-01-10 00:00:00','1');
/*!40000 ALTER TABLE `ape_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ape_activity_registration`
--

DROP TABLE IF EXISTS `ape_activity_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ape_activity_registration` (
  `registration_id` bigint NOT NULL AUTO_INCREMENT COMMENT '报名ID，主键，自增',
  `activity_id` bigint NOT NULL COMMENT '活动ID，外键关联活动表',
  `user_id` bigint NOT NULL COMMENT '报名用户ID，外键关联用户表',
  `register_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '报名时间',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '预约状态（1-已预约，0-已取消）',
  PRIMARY KEY (`registration_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动报名表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ape_activity_registration`
--

LOCK TABLES `ape_activity_registration` WRITE;
/*!40000 ALTER TABLE `ape_activity_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `ape_activity_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ape_comment`
--

DROP TABLE IF EXISTS `ape_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ape_comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论ID，主键，自增',
  `poem_id` bigint NOT NULL COMMENT '古诗词ID，外键关联古诗词表',
  `user_id` bigint NOT NULL COMMENT '评论用户ID，外键关联用户表',
  `content` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '评论创建时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='古诗词评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ape_comment`
--

LOCK TABLES `ape_comment` WRITE;
/*!40000 ALTER TABLE `ape_comment` DISABLE KEYS */;
INSERT INTO `ape_comment` VALUES (2,1,1,'真不错','2025-01-03 11:00:59'),(3,7,1,'好啊','2025-01-07 09:57:42'),(5,11,108,'真好','2025-01-09 19:56:34'),(6,10,108,'真不崔','2025-01-09 19:56:47');
/*!40000 ALTER TABLE `ape_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ape_feedback`
--

DROP TABLE IF EXISTS `ape_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ape_feedback` (
  `feedback_id` bigint NOT NULL AUTO_INCREMENT COMMENT '反馈ID，主键，自增',
  `user_id` bigint NOT NULL COMMENT '反馈用户ID，外键关联用户表',
  `content` varchar(500) DEFAULT NULL COMMENT '反馈内容',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '状态（0-未解答，1-已解答）',
  `reply_content` varchar(500) DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '回复时间',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='问题反馈表\nsql\n复制代码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ape_feedback`
--

LOCK TABLES `ape_feedback` WRITE;
/*!40000 ALTER TABLE `ape_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `ape_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ape_poem`
--

DROP TABLE IF EXISTS `ape_poem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ape_poem` (
  `poem_id` bigint NOT NULL AUTO_INCREMENT COMMENT '古诗词ID，主键，自增',
  `user_id` bigint NOT NULL COMMENT '发布用户ID，外键关联用户表',
  `poem_title` varchar(100) DEFAULT NULL COMMENT '诗词标题',
  `poem_author` varchar(100) DEFAULT NULL COMMENT '诗人',
  `poem_content` varchar(100) DEFAULT NULL COMMENT '诗词内容',
  `status` tinyint NOT NULL COMMENT '状态（1-审核通过，0-审核中）',
  `poem_background` varchar(500) DEFAULT NULL COMMENT '背景',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '诗词附件',
  PRIMARY KEY (`poem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='古诗词表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ape_poem`
--

LOCK TABLES `ape_poem` WRITE;
/*!40000 ALTER TABLE `ape_poem` DISABLE KEYS */;
INSERT INTO `ape_poem` VALUES (6,103,'渭城曲','王维','渭城朝雨浥轻尘，客舍青青柳色新。\n劝君更尽一杯酒，西出阳关无故人。',1,'',NULL);
/*!40000 ALTER TABLE `ape_poem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_balance_record`
--

DROP TABLE IF EXISTS `cfcr_balance_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_balance_record` (
  `record_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `venue_id` bigint NOT NULL COMMENT '场馆ID',
  `transaction_type` tinyint DEFAULT NULL COMMENT '交易类型：0收入，1购买，2维修',
  `transaction_amount` decimal(7,2) DEFAULT NULL COMMENT '交易金额',
  `transaction_time` datetime DEFAULT NULL COMMENT '交易时间',
  `balance` decimal(7,2) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_balance_record`
--

LOCK TABLES `cfcr_balance_record` WRITE;
/*!40000 ALTER TABLE `cfcr_balance_record` DISABLE KEYS */;
INSERT INTO `cfcr_balance_record` VALUES (3,102,7,4,50.00,'2024-03-09 18:09:43',9950.00),(4,1,7,0,50.00,'2024-03-09 18:09:43',50.00),(5,102,4,5,50.00,'2024-03-09 18:21:45',9900.00),(6,1,4,0,50.00,'2024-03-09 18:21:45',100.00),(7,102,3,2,5.00,'2024-03-09 18:28:19',9895.00),(8,1,3,0,5.00,'2024-03-09 18:28:19',105.00),(9,102,3,5,7.00,'2024-03-09 18:28:43',9888.00),(10,1,3,0,7.00,'2024-03-09 18:28:43',112.00),(11,102,3,1,7.00,'2024-03-09 18:47:46',9881.00),(12,1,3,0,7.00,'2024-03-09 18:47:46',119.00),(13,102,7,3,80.00,'2024-03-09 18:51:29',9801.00),(14,1,7,0,80.00,'2024-03-09 18:51:29',199.00),(15,102,6,3,9.60,'2024-03-09 18:52:58',9791.40),(16,1,6,0,9.60,'2024-03-09 18:52:58',208.60),(17,102,6,3,9.60,'2024-03-09 19:04:46',9781.80),(18,1,6,0,9.60,'2024-03-09 19:04:46',218.20),(19,102,6,3,9.60,'2024-03-09 19:07:05',9772.20),(20,1,6,0,9.60,'2024-03-09 19:07:05',227.80),(21,102,6,3,8.80,'2024-03-09 19:12:17',9763.40),(22,1,6,0,8.80,'2024-03-09 19:12:17',236.60),(23,102,7,3,80.00,'2024-03-09 19:15:53',9683.40),(24,1,7,0,80.00,'2024-03-09 19:15:53',316.60),(25,102,6,3,9.60,'2024-03-09 19:29:14',9673.80),(26,1,6,0,9.60,'2024-03-09 19:29:14',326.20),(27,102,4,1,7.00,'2024-03-10 11:35:40',9666.80),(28,1,4,0,7.00,'2024-03-10 11:35:40',333.20),(29,102,6,3,9.60,'2024-03-11 11:02:59',9657.20),(30,1,6,0,9.60,'2024-03-11 11:02:59',342.80),(31,102,6,3,9.60,'2024-03-11 11:10:52',9647.60),(32,1,6,0,9.60,'2024-03-11 11:10:52',352.40),(33,102,6,3,9.60,'2024-03-11 11:16:00',9638.00),(34,1,6,0,9.60,'2024-03-11 11:16:00',362.00),(35,102,6,3,9.60,'2024-03-11 11:17:31',9628.40),(36,1,6,0,9.60,'2024-03-11 11:17:31',371.60),(37,102,6,3,8.80,'2024-03-11 11:18:12',9619.60),(38,1,6,0,8.80,'2024-03-11 11:18:12',380.40),(39,102,6,3,9.60,'2024-03-11 11:27:14',9610.00),(40,1,6,0,9.60,'2024-03-11 11:27:14',390.00);
/*!40000 ALTER TABLE `cfcr_balance_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_court`
--

DROP TABLE IF EXISTS `cfcr_court`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_court` (
  `court_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `venue_id` bigint NOT NULL COMMENT '场馆ID，外键',
  `court_type` int DEFAULT NULL COMMENT '场地类型（室内，室外）',
  `court_number` int DEFAULT NULL COMMENT '场地编号',
  `court_status` tinyint DEFAULT NULL COMMENT '场地状态（可预约，不可预约）',
  `court_fee` decimal(7,2) DEFAULT NULL COMMENT '场地费用',
  `court_vip` tinyint DEFAULT NULL COMMENT '是否为VIP场地（0，否，1是）',
  `trainer_id` bigint DEFAULT NULL COMMENT '教练IDF',
  PRIMARY KEY (`court_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='场地信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_court`
--

LOCK TABLES `cfcr_court` WRITE;
/*!40000 ALTER TABLE `cfcr_court` DISABLE KEYS */;
INSERT INTO `cfcr_court` VALUES (1,6,NULL,100,1,100.00,0,100),(6,6,NULL,102,1,11.00,0,NULL),(7,6,NULL,103,1,12.00,1,NULL),(8,3,NULL,109,0,10.00,0,NULL),(9,7,NULL,14,1,100.00,0,101);
/*!40000 ALTER TABLE `cfcr_court` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_equipment_purchase`
--

DROP TABLE IF EXISTS `cfcr_equipment_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_equipment_purchase` (
  `equipment_purchase_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `venue_id` bigint NOT NULL COMMENT '场馆ID',
  `equipment_purchase_type` tinyint NOT NULL COMMENT '商品类别：0球拍，1羽毛球，2球鞋，3饮料，4运动服',
  `equipment_purchase_number` int DEFAULT NULL COMMENT '商品个数',
  `equipment_purchase_fee` decimal(7,2) DEFAULT NULL COMMENT '商品单价',
  PRIMARY KEY (`equipment_purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='可购买运动器材表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_equipment_purchase`
--

LOCK TABLES `cfcr_equipment_purchase` WRITE;
/*!40000 ALTER TABLE `cfcr_equipment_purchase` DISABLE KEYS */;
INSERT INTO `cfcr_equipment_purchase` VALUES (3,4,1,10,10.00),(4,4,2,1,100.00),(5,4,4,10,100.00),(6,3,0,10,10.00),(7,6,3,NULL,3.00);
/*!40000 ALTER TABLE `cfcr_equipment_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_equipment_repair`
--

DROP TABLE IF EXISTS `cfcr_equipment_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_equipment_repair` (
  `equipment_repair_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `venue_id` bigint NOT NULL COMMENT '场馆ID',
  `equipment_repair_type` tinyint NOT NULL COMMENT '维修商品类别：0球拍，1球网，2球鞋',
  `equipment_repair_fee` decimal(7,2) DEFAULT NULL COMMENT '维修单价',
  PRIMARY KEY (`equipment_repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='配件维修表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_equipment_repair`
--

LOCK TABLES `cfcr_equipment_repair` WRITE;
/*!40000 ALTER TABLE `cfcr_equipment_repair` DISABLE KEYS */;
INSERT INTO `cfcr_equipment_repair` VALUES (2,3,0,10.00),(3,3,0,100.00),(4,4,1,100.00);
/*!40000 ALTER TABLE `cfcr_equipment_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_reservation`
--

DROP TABLE IF EXISTS `cfcr_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_reservation` (
  `reservation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `court_id` bigint NOT NULL COMMENT '场地ID',
  `trainer_id` bigint DEFAULT NULL COMMENT '教练ID',
  `start_time` datetime DEFAULT NULL COMMENT '预约起始时间',
  `end_time` datetime DEFAULT NULL COMMENT '预约终止时间',
  `reservation_status` tinyint DEFAULT NULL COMMENT '预约状态，0预约，1取消',
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='羽毛球场预约表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_reservation`
--

LOCK TABLES `cfcr_reservation` WRITE;
/*!40000 ALTER TABLE `cfcr_reservation` DISABLE KEYS */;
INSERT INTO `cfcr_reservation` VALUES (1,1,6,100,'2024-03-04 16:00:00','2024-03-06 16:00:00',1),(2,1,8,101,'2024-03-05 17:00:00','2024-03-05 18:00:00',1),(3,1,8,NULL,'2024-03-05 16:00:00','2024-03-05 17:00:00',1),(4,1,1,100,'2024-03-06 16:00:00','2024-03-06 17:00:00',1),(5,1,6,NULL,'2024-03-06 18:00:00','2024-03-06 19:00:00',1),(6,102,7,NULL,'2024-03-05 16:00:00','2024-03-05 17:00:00',1),(7,1,6,101,'2024-03-07 22:00:00','2024-03-08 01:00:00',0),(8,102,7,NULL,'2024-03-09 16:00:00','2024-03-09 16:00:00',0),(9,102,9,NULL,'2024-03-09 16:00:00','2024-03-09 16:00:00',0),(10,102,9,NULL,'2024-03-10 16:00:00','2024-03-10 17:00:00',0),(11,102,9,NULL,'2024-03-10 16:00:00','2024-03-10 17:00:00',0),(12,102,9,NULL,'2024-03-09 16:00:00','2024-03-09 17:00:00',0),(13,102,9,NULL,'2024-03-10 17:00:00','2024-03-10 18:00:00',0),(14,102,9,NULL,'2024-03-10 17:00:00','2024-03-10 18:00:00',0),(15,102,9,NULL,'2024-03-09 16:00:00','2024-03-09 17:00:00',0),(16,102,9,NULL,'2024-03-11 16:00:00','2024-03-11 17:00:00',0),(17,102,9,NULL,'2024-03-13 16:00:00','2024-03-13 17:00:00',0),(18,102,9,NULL,'2024-03-13 16:00:00','2024-03-13 17:00:00',0),(19,102,9,NULL,'2024-03-13 17:00:00','2024-03-13 18:00:00',0),(20,102,7,NULL,'2024-03-13 17:00:00','2024-03-13 18:00:00',0),(21,102,7,NULL,'2024-03-14 18:00:00','2024-03-14 19:00:00',0),(22,102,7,NULL,'2024-03-15 18:00:00','2024-03-15 19:00:00',0),(23,102,6,NULL,'2024-03-12 18:00:00','2024-03-12 20:00:00',0),(24,102,9,NULL,'2024-03-12 18:00:00','2024-03-12 19:00:00',0),(25,102,7,NULL,'2024-03-12 18:00:00','2024-03-12 19:00:00',0),(26,102,7,NULL,'2024-03-12 18:00:00','2024-03-12 19:00:00',0),(27,102,7,NULL,'2024-03-12 18:00:00','2024-03-12 19:00:00',0),(28,102,7,NULL,'2024-03-11 17:00:00','2024-03-11 18:00:00',0),(29,102,7,NULL,'2024-03-12 17:00:00','2024-03-12 18:00:00',0),(30,102,6,NULL,'2024-03-11 16:00:00','2024-03-11 17:00:00',0),(31,102,7,NULL,'2024-03-13 08:00:00','2024-03-13 09:00:00',0);
/*!40000 ALTER TABLE `cfcr_reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_review`
--

DROP TABLE IF EXISTS `cfcr_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_review` (
  `review_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `venue_id` bigint NOT NULL COMMENT '场地ID',
  `comment` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `review_time` datetime DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='场地评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_review`
--

LOCK TABLES `cfcr_review` WRITE;
/*!40000 ALTER TABLE `cfcr_review` DISABLE KEYS */;
INSERT INTO `cfcr_review` VALUES (1,1,3,NULL,'2024-03-02 22:42:02'),(2,1,3,NULL,'2024-03-02 22:43:59'),(5,1,3,'真不多','2024-03-02 23:35:11'),(8,1,6,'真不错','2024-03-26 16:10:58');
/*!40000 ALTER TABLE `cfcr_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cfcr_venue`
--

DROP TABLE IF EXISTS `cfcr_venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cfcr_venue` (
  `venue_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `venue_name` varchar(100) NOT NULL COMMENT '场馆名称',
  `venue_address` varchar(100) DEFAULT NULL COMMENT '场馆地址',
  `venue_contact` varchar(100) DEFAULT NULL COMMENT '场馆联系方式',
  `venue_description` varchar(500) DEFAULT NULL COMMENT '场馆描述',
  `is_shower` tinyint DEFAULT NULL COMMENT '是否有淋浴设施，0表示无，1表示有',
  `is_outdoor` tinyint DEFAULT NULL COMMENT '是否为户外场馆，0表示否，1表示是',
  PRIMARY KEY (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='场馆表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cfcr_venue`
--

LOCK TABLES `cfcr_venue` WRITE;
/*!40000 ALTER TABLE `cfcr_venue` DISABLE KEYS */;
INSERT INTO `cfcr_venue` VALUES (3,'三星场馆','南大街','89878856','十分的好',0,0),(4,'四星场馆','11','11',NULL,1,1),(6,'五星场馆','西大街','102909837488','真的特别好，真好',0,0),(7,'一星场馆','南外环','1098987668','描述',1,1);
/*!40000 ALTER TABLE `cfcr_venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps_feedback`
--

DROP TABLE IF EXISTS `cps_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps_feedback` (
  `feedback_id` bigint NOT NULL AUTO_INCREMENT COMMENT '反馈ID，主键，自增',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `content` varchar(200) DEFAULT NULL COMMENT '反馈内容',
  `status` tinyint NOT NULL COMMENT '状态（0-未解答，1-已解答）',
  `reply_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='居民反馈';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps_feedback`
--

LOCK TABLES `cps_feedback` WRITE;
/*!40000 ALTER TABLE `cps_feedback` DISABLE KEYS */;
INSERT INTO `cps_feedback` VALUES (3,101,'希望垃圾清扫可以更洁净',1,'好的，一定做到','2025-01-15 11:21:53');
/*!40000 ALTER TABLE `cps_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps_payment`
--

DROP TABLE IF EXISTS `cps_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps_payment` (
  `payment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '缴费记录ID，主键，自增',
  `user_id` bigint NOT NULL COMMENT '用户ID，外键关联用户表',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '缴费类型',
  `amount` decimal(10,0) NOT NULL COMMENT '缴纳金额',
  `payment_date` datetime DEFAULT NULL COMMENT '截止日期',
  `status` tinyint NOT NULL COMMENT '缴费状态',
  `description` varchar(200) DEFAULT NULL COMMENT '详情描述',
  `file` varchar(100) DEFAULT NULL COMMENT '附件',
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='缴费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps_payment`
--

LOCK TABLES `cps_payment` WRITE;
/*!40000 ALTER TABLE `cps_payment` DISABLE KEYS */;
INSERT INTO `cps_payment` VALUES (10,102,'水费',100,'2025-01-15 11:16:30',1,'水费100元',NULL);
/*!40000 ALTER TABLE `cps_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cps_repair`
--

DROP TABLE IF EXISTS `cps_repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cps_repair` (
  `repair_id` bigint NOT NULL AUTO_INCREMENT COMMENT '报修ID，主键，自增',
  `user_id` bigint NOT NULL COMMENT '用户ID，外键关联用户表',
  `repair_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报修类型',
  `description` varchar(200) DEFAULT NULL COMMENT '报修描述',
  `status` tinyint NOT NULL COMMENT '报修状态',
  `created_time` datetime DEFAULT NULL COMMENT '报修申请时间',
  `resolved_time` datetime DEFAULT NULL COMMENT '解决时间',
  `repair_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '报修图片',
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='报修服务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cps_repair`
--

LOCK TABLES `cps_repair` WRITE;
/*!40000 ALTER TABLE `cps_repair` DISABLE KEYS */;
INSERT INTO `cps_repair` VALUES (6,100,'水管维修','水管爆裂',2,'2025-01-15 11:18:06','2025-01-15 11:20:01',NULL);
/*!40000 ALTER TABLE `cps_repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-02-28 22:23:43','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-02-28 22:23:43','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-02-28 22:23:43','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-02-28 22:23:43','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','true','Y','admin','2024-02-28 22:23:43','admin','2024-03-18 10:20:34','是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-02-28 22:23:43','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','青岛市羽毛球场管理公司',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-02-28 22:23:42','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','2','admin','2024-02-28 22:23:42','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-02-28 22:23:43','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-02-28 22:23:43','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-02-28 22:23:43','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-02-28 22:23:43','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-02-28 22:23:43','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-02-28 22:23:43','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-02-28 22:23:43','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-02-28 22:23:43','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-02-28 22:23:43','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-02-28 22:23:43','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-02-28 22:23:43','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-02-28 22:23:43','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-02-28 22:23:43','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-02-28 22:23:43','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-02-28 22:23:43','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-02-28 22:23:43','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-02-28 22:23:43','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-02-28 22:23:43','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-02-28 22:23:43','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-02-28 22:23:43','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-02-28 22:23:43','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-02-28 22:23:43','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-02-28 22:23:43','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-02-28 22:23:43','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-02-28 22:23:43','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-02-28 22:23:43','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-02-28 22:23:43','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-02-28 22:23:43','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-02-28 22:23:43','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-02-28 22:23:43','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-02-28 22:23:43','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-02-28 22:23:43','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-02-28 22:23:43','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-02-28 22:23:43','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-02-28 22:39:55'),(101,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-01 23:09:16'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 01:27:31'),(103,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 10:55:20'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 18:14:50'),(105,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 20:17:25'),(106,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 22:07:46'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-02 23:26:23'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 00:55:47'),(109,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 17:23:03'),(110,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-03 17:24:51'),(111,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 17:24:59'),(112,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-03 17:37:02'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 17:37:14'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 21:22:49'),(115,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-03 22:56:22'),(116,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-04 18:45:52'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-04 18:53:25'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-05 09:19:58'),(119,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-05 09:58:10'),(120,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-05 11:15:42'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-06 10:48:05'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-06 15:08:20'),(123,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-06 15:37:21'),(124,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-06 15:37:42'),(125,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-06 15:38:13'),(126,'zhaoliu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-06 15:38:22'),(127,'zhaoliu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-06 15:38:42'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-06 15:38:48'),(129,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 11:30:59'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 14:39:08'),(131,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 16:08:51'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-07 16:45:02'),(133,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 16:45:17'),(134,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-07 16:45:52'),(135,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 16:46:00'),(136,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 17:16:50'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-07 17:45:31'),(138,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-07 17:45:44'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-08 10:18:54'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-08 10:53:32'),(141,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-08 15:51:43'),(142,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-03-09 12:26:11'),(143,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码错误','2024-03-09 12:26:15'),(144,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 12:26:18'),(145,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 17:34:02'),(146,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 17:57:48'),(147,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-09 18:09:55'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 18:10:02'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-09 18:21:14'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 18:21:19'),(151,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-09 18:21:23'),(152,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 18:21:38'),(153,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-09 19:30:19'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 19:30:23'),(155,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 19:56:04'),(156,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-09 22:55:32'),(157,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-10 11:15:30'),(158,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-10 11:35:23'),(159,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-10 11:35:33'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-11 11:01:22'),(161,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-11 11:01:51'),(162,'wangwu','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-11 11:02:02'),(163,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-18 10:17:45'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-18 10:20:38'),(165,'fanjiaxing','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-03-18 10:20:59'),(166,'fanjiaxing','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-18 10:21:10'),(167,'fanjiaxing','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-18 10:21:16'),(168,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-18 11:08:00'),(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-18 11:09:04'),(170,'fanjiaxing','127.0.0.1','内网IP','Chrome 12','Windows 10','0','注册成功','2024-03-18 11:09:21'),(171,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-18 11:09:27'),(172,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-03-26 15:22:36'),(173,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-03-26 15:33:56'),(174,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-30 11:17:07'),(175,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2024-12-30 11:40:15'),(176,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2024-12-30 17:20:01'),(177,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-30 17:20:07'),(178,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2024-12-30 17:21:50'),(179,'张夜猫','127.0.0.1','内网IP','Chrome 13','Windows 10','0','注册成功','2024-12-30 17:22:08'),(180,'张夜猫','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-30 17:22:17'),(181,'张夜猫','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2024-12-30 17:22:23'),(182,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码已失效','2024-12-30 17:46:23'),(183,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-30 17:46:29'),(184,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-31 09:05:02'),(185,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2024-12-31 09:22:25'),(186,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','注册成功','2024-12-31 09:23:15'),(187,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-31 09:23:28'),(188,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2024-12-31 09:23:36'),(189,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2024-12-31 09:23:40'),(190,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-02 14:26:34'),(191,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 09:19:18'),(192,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 14:48:55'),(193,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-03 16:29:22'),(194,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 09:26:13'),(195,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 09:57:48'),(196,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 11:42:24'),(197,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 14:36:47'),(198,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:52:55'),(199,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:53:03'),(200,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:54:20'),(201,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:54:24'),(202,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:54:42'),(203,'zhaoliu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:54:53'),(204,'zhaoliu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:57:19'),(205,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:57:23'),(206,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:57:40'),(207,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:57:43'),(208,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:57:51'),(209,'zhaoliu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:58:03'),(210,'zhaoliu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 16:58:16'),(211,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 16:58:20'),(212,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-06 17:35:24'),(213,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-06 17:35:31'),(214,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 09:49:00'),(215,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 09:55:57'),(216,'张夜猫','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 09:56:08'),(217,'张夜猫','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 09:56:16'),(218,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 09:56:20'),(219,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 09:56:47'),(220,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 09:56:56'),(221,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 09:57:19'),(222,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 09:57:23'),(223,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 11:38:41'),(224,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 14:27:18'),(225,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 15:57:51'),(226,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 15:57:55'),(227,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 15:57:59'),(228,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','1','用户不存在/密码错误','2025-01-07 15:58:06'),(229,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 15:58:13'),(230,'fjx3205073','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-07 16:35:03'),(231,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-07 16:35:06'),(232,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 19:48:32'),(233,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 19:49:53'),(234,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','注册成功','2025-01-09 19:52:19'),(235,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 19:52:44'),(236,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 19:57:15'),(237,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 19:57:22'),(238,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 19:59:30'),(239,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 19:59:44'),(240,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 20:01:53'),(241,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 20:01:59'),(242,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 20:04:26'),(243,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-09 20:04:36'),(244,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 20:04:41'),(245,'liming','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-09 20:08:27'),(246,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-09 20:08:32'),(247,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-13 14:54:35'),(248,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 14:54:39'),(249,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-13 17:54:05'),(250,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-14 08:52:41'),(251,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-14 14:20:56'),(252,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-14 14:20:59'),(253,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-14 15:50:21'),(254,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-14 17:33:51'),(255,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','1','验证码错误','2025-01-15 08:38:53'),(256,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 08:38:57'),(257,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:10:58'),(258,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:11:08'),(259,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:11:18'),(260,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:11:23'),(261,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:12:08'),(262,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:12:16'),(263,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:12:57'),(264,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:13:02'),(265,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:15:37'),(266,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:15:48'),(267,'wangwu','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:16:35'),(268,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:16:39'),(269,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:17:24'),(270,'zhangsan','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:17:34'),(271,'zhangsan','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:18:34'),(272,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:18:42'),(273,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:20:15'),(274,'zhangsan','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:20:25'),(275,'zhangsan','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:20:53'),(276,'lisi','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:21:03'),(277,'lisi','127.0.0.1','内网IP','Chrome 13','Windows 10','0','退出成功','2025-01-15 11:21:37'),(278,'admin','127.0.0.1','内网IP','Chrome 13','Windows 10','0','登录成功','2025-01-15 11:21:41');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2065 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-02-28 22:23:42','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','1','0','','monitor','admin','2024-02-28 22:23:42','admin','2024-03-03 17:45:53','系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','1','0','','tool','admin','2024-02-28 22:23:42','admin','2024-03-18 10:18:15','系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','1','0','','guide','admin','2024-02-28 22:23:42','admin','2024-03-01 23:09:36','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-02-28 22:23:42','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','1','0','system:role:list','peoples','admin','2024-02-28 22:23:42','admin','2025-01-15 11:22:46','角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','1','0','system:menu:list','tree-table','admin','2024-02-28 22:23:42','admin','2025-01-15 11:22:50','菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','1','0','system:dept:list','tree','admin','2024-02-28 22:23:42','admin','2024-03-03 17:45:32','部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','1','0','system:post:list','post','admin','2024-02-28 22:23:42','admin','2024-03-03 17:41:06','岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','1','0','system:dict:list','dict','admin','2024-02-28 22:23:42','admin','2024-03-03 17:41:00','字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','1','0','system:config:list','edit','admin','2024-02-28 22:23:42','admin','2024-03-26 15:35:05','参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-02-28 22:23:42','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','1','0','','log','admin','2024-02-28 22:23:42','admin','2024-03-03 17:40:49','日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-02-28 22:23:42','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-02-28 22:23:42','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-02-28 22:23:42','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-02-28 22:23:42','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-02-28 22:23:42','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-02-28 22:23:42','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-02-28 22:23:42','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-02-28 22:23:42','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-02-28 22:23:42','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-02-28 22:23:42','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-02-28 22:23:42','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-02-28 22:23:42','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-02-28 22:23:42','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-02-28 22:23:42','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-02-28 22:23:42','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-02-28 22:23:42','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-02-28 22:23:42','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-02-28 22:23:42','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-02-28 22:23:42','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-02-28 22:23:42','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-02-28 22:23:42','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-02-28 22:23:42','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-02-28 22:23:42','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-02-28 22:23:42','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-02-28 22:23:42','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-02-28 22:23:42','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-02-28 22:23:42','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-02-28 22:23:42','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-02-28 22:23:42','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-02-28 22:23:42','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-02-28 22:23:42','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-02-28 22:23:42','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-02-28 22:23:43','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-02-28 22:23:43','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-02-28 22:23:43','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-02-28 22:23:43','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-02-28 22:23:43','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-02-28 22:23:43','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-02-28 22:23:43','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-02-28 22:23:43','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-02-28 22:23:43','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-02-28 22:23:43','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-02-28 22:23:43','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-02-28 22:23:43','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-02-28 22:23:43','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-02-28 22:23:43','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-02-28 22:23:43','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-02-28 22:23:43','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-02-28 22:23:43','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-02-28 22:23:43','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-02-28 22:23:43','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-02-28 22:23:43','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-02-28 22:23:43','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-02-28 22:23:43','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-02-28 22:23:43','',NULL,''),(2000,'羽毛球场馆管理',0,2,'featherBall',NULL,NULL,1,0,'M','1','0','','server','admin','2024-03-01 23:11:41','admin','2025-01-06 17:09:17',''),(2001,'场馆管理',2000,1,'venue','featherball/venue/index',NULL,1,0,'C','0','0','featherball:venue:list','nested','admin','2024-03-01 23:15:33','',NULL,''),(2002,'场地管理',2000,2,'court','featherball/court/index',NULL,1,0,'C','0','0','featherball:court:list','excel','admin','2024-03-02 18:17:38','',NULL,''),(2003,'预约记录',2000,3,'reservation','featherball/reservation/index',NULL,1,0,'C','0','0','featherball:reservation:list','education','admin','2024-03-07 11:34:11','',NULL,''),(2004,'新增场馆',2001,1,'',NULL,NULL,1,0,'F','0','0','featherball:venue:add','#','admin','2024-03-07 17:24:30','',NULL,''),(2005,'查看评论',2001,2,'',NULL,NULL,1,0,'F','0','0','featherball:venue:review','#','admin','2024-03-07 17:25:05','',NULL,''),(2006,'场馆详情',2001,3,'',NULL,NULL,1,0,'F','0','0','featherball:venue:detail','#','admin','2024-03-07 17:25:39','',NULL,''),(2007,'编辑场馆',2001,4,'',NULL,NULL,1,0,'F','0','0','featherball:venue:edit','#','admin','2024-03-07 17:26:33','',NULL,''),(2008,'删除场馆',2001,5,'',NULL,NULL,1,0,'F','0','0','featherball:venue:delete','#','admin','2024-03-07 17:27:02','',NULL,''),(2009,'删除评论',2001,6,'',NULL,NULL,1,0,'F','0','0','featherball:venue:reviewdelete','#','admin','2024-03-07 17:27:43','',NULL,''),(2010,'发送评论',2001,7,'',NULL,NULL,1,0,'F','0','0','featherball:venue:reviewadd','#','admin','2024-03-07 17:28:10','',NULL,''),(2011,'新增场地',2002,1,'',NULL,NULL,1,0,'F','0','0','featherball:court:add','#','admin','2024-03-07 17:31:33','',NULL,''),(2012,'预约场地',2002,2,'',NULL,NULL,1,0,'F','0','0','featherball:court:reservation','#','admin','2024-03-07 17:32:13','',NULL,''),(2013,'场地详情',2002,3,'',NULL,NULL,1,0,'F','0','0','featherball:court:detail','#','admin','2024-03-07 17:32:38','',NULL,''),(2014,'编辑场地',2002,4,'',NULL,NULL,1,0,'F','0','0','featherball:court:edit','#','admin','2024-03-07 17:32:59','',NULL,''),(2015,'删除场地',2002,5,'',NULL,NULL,1,0,'F','0','0','featherball:court:delete','#','admin','2024-03-07 17:33:19','',NULL,''),(2016,'取消预约',2003,1,'',NULL,NULL,1,0,'F','0','0','featherball:reservation:cancel','#','admin','2024-03-07 17:39:36','',NULL,''),(2017,'教练管理',1,10,'trainer','system/user/index2',NULL,1,0,'C','1','0','system:user:list','people','admin','2024-03-08 10:56:24','admin','2025-01-06 09:30:42',''),(2018,'VIP管理',1,11,'vip','system/user/index3',NULL,1,0,'C','1','0','system:vip:list','star','admin','2024-03-08 11:04:14','admin','2025-01-06 09:30:48',''),(2019,'商品购买',2000,4,'equipmentPurchase','featherball/equipmentpurchase/index',NULL,1,0,'C','0','0','featherball:equipmentpurchase:list','shopping','admin','2024-03-08 15:55:06','',NULL,''),(2020,'器材维修',2000,5,'equipmentRepair','featherball/equipmentrepair/index',NULL,1,0,'C','0','0','featherball:equipmentrepair:list','tool','admin','2024-03-08 15:57:09','',NULL,''),(2021,'订单管理',2000,6,'balanceRecord','featherball/balancerecord/index',NULL,1,0,'C','0','0','featherball:balancerecord:list','documentation','admin','2024-03-09 12:29:42','',NULL,''),(2022,'统计图表',2000,7,'charts','featherball/charts/index',NULL,1,0,'C','0','0','featherball:charts:list','chart','admin','2024-03-09 22:57:41','',NULL,''),(2023,'新增商品',2019,1,'',NULL,NULL,1,0,'F','0','0','featherball:pur:add','#','admin','2024-03-10 11:29:43','',NULL,''),(2024,'购买商品',2019,2,'',NULL,NULL,1,0,'F','0','0','featherball:pur:buy','#','admin','2024-03-10 11:30:09','',NULL,''),(2025,'编辑商品',2019,3,'',NULL,NULL,1,0,'F','0','0','featherball:pur:edit','#','admin','2024-03-10 11:30:31','',NULL,''),(2026,'删除商品',2019,4,'',NULL,NULL,1,0,'F','0','0','featherball:pur:delete','#','admin','2024-03-10 11:31:02','',NULL,''),(2027,'新增配件',2020,1,'',NULL,NULL,1,0,'F','0','0','featherball:rep:add','#','admin','2024-03-10 11:32:00','',NULL,''),(2028,'配件维修',2020,2,'',NULL,NULL,1,0,'F','0','0','featherball:rep:rep','#','admin','2024-03-10 11:32:27','',NULL,''),(2029,'编辑配件',2020,3,'',NULL,NULL,1,0,'F','0','0','featherball:rep:edit','#','admin','2024-03-10 11:32:49','',NULL,''),(2030,'删除配件',2020,4,'',NULL,NULL,1,0,'F','0','0','featherball:rep:delete','#','admin','2024-03-10 11:33:08','',NULL,''),(2031,'古诗词交流',0,3,'poem',NULL,NULL,1,0,'M','1','0','','color','admin','2025-01-02 14:41:41','admin','2025-01-13 15:14:42',''),(2032,'诗词发布',2031,1,'poem','poem/poem/index',NULL,1,0,'C','0','0','poem:poem:list','education','admin','2025-01-02 14:43:18','',NULL,''),(2033,'问题反馈',2031,2,'feedback','poem/feedback/index',NULL,1,0,'C','0','0','poem:feedback:list','clipboard','admin','2025-01-03 11:29:32','',NULL,''),(2034,'活动管理',2031,3,'activity','poem/activity/index',NULL,1,0,'C','0','0','poem:activity:list','rate','admin','2025-01-03 16:31:16','',NULL,''),(2035,'预约记录',2031,4,'activityRegistration','poem/activityRegistration/index',NULL,1,0,'C','0','0','poem:activityRegistration:list','server','admin','2025-01-06 14:54:49','',NULL,''),(2036,'新增诗词',2032,1,'',NULL,NULL,1,0,'F','0','0','poem:poem:add','#','admin','2025-01-07 15:31:00','',NULL,''),(2037,'编辑诗词',2032,2,'',NULL,NULL,1,0,'F','0','0','poem:poem:edit','#','admin','2025-01-07 15:31:43','',NULL,''),(2038,'查看诗词',2032,3,'',NULL,NULL,1,0,'F','0','0','poem:poem:detail','#','admin','2025-01-07 15:32:16','',NULL,''),(2039,'删除诗词',2032,4,'',NULL,NULL,1,0,'F','0','0','poem:poem:delete','#','admin','2025-01-07 15:32:43','',NULL,''),(2041,'新增反馈',2033,1,'',NULL,NULL,1,0,'F','0','0','poem:feedback:add','#','admin','2025-01-07 15:35:42','',NULL,''),(2042,'删除反馈',2033,2,'',NULL,NULL,1,0,'F','0','0','poem:feedback:delete','#','admin','2025-01-07 15:36:03','',NULL,''),(2043,'回复反馈',2033,3,'',NULL,NULL,1,0,'F','0','0','poem:feedback:reply','#','admin','2025-01-07 15:36:26','',NULL,''),(2044,'新增活动',2034,1,'',NULL,NULL,1,0,'F','0','0','poem:activity:add','#','admin','2025-01-07 15:37:27','',NULL,''),(2045,'修改活动',2034,2,'',NULL,NULL,1,0,'F','0','0','poem:activity:edit','#','admin','2025-01-07 15:37:44','',NULL,''),(2046,'删除活动',2034,3,'',NULL,NULL,1,0,'F','0','0','poem:activity:delete','#','admin','2025-01-07 15:38:05','',NULL,''),(2047,'删除预约',2035,1,'',NULL,NULL,1,0,'F','0','0','poem:activityRegistration:delete','#','admin','2025-01-07 15:39:03','',NULL,''),(2048,'预约活动',2034,4,'',NULL,NULL,1,0,'F','0','0','poem:activityRegistration:add','#','admin','2025-01-07 15:39:46','',NULL,''),(2049,'物业管理',0,3,'property',NULL,NULL,1,0,'M','0','0',NULL,'example','admin','2025-01-13 14:54:04','',NULL,''),(2050,'维修管理',2049,1,'repair','property/repair/index',NULL,1,0,'C','0','0','property:repair:list','tool','admin','2025-01-13 15:08:37','',NULL,''),(2051,'缴费管理',2049,2,'payment','property/payment/index',NULL,1,0,'C','0','0','property:payment:index','number','admin','2025-01-14 16:31:31','',NULL,''),(2052,'业主反馈',2049,3,'feedback','property/feedback/index',NULL,1,0,'C','0','0','property:feedback:list','question','admin','2025-01-15 09:37:50','',NULL,''),(2053,'新增维修',2050,1,'',NULL,NULL,1,0,'F','0','0','property:repair:add','#','admin','2025-01-15 10:56:00','',NULL,''),(2054,'修改状态',2050,2,'',NULL,NULL,1,0,'F','0','0','property:repair:change','#','admin','2025-01-15 10:56:43','',NULL,''),(2055,'查看维修',2050,3,'',NULL,NULL,1,0,'F','0','0','property:repair:view','#','admin','2025-01-15 10:57:01','',NULL,''),(2056,'删除维修',2050,4,'',NULL,NULL,1,0,'F','0','0','property:repair:delete','#','admin','2025-01-15 11:06:37','',NULL,''),(2057,'新增缴费',2051,1,'',NULL,NULL,1,0,'F','0','0','property:payment:add','#','admin','2025-01-15 11:07:15','',NULL,''),(2058,'查看缴费',2051,2,'',NULL,NULL,1,0,'F','0','0','property:payment:view','#','admin','2025-01-15 11:07:35','',NULL,''),(2059,'缴费付款',2051,3,'',NULL,NULL,1,0,'F','0','0','property:payment:pay','#','admin','2025-01-15 11:08:01','',NULL,''),(2060,'删除缴费',2051,4,'',NULL,NULL,1,0,'F','0','0','property:payment:delete','#','admin','2025-01-15 11:08:15','',NULL,''),(2061,'新增反馈',2052,1,'',NULL,NULL,1,0,'F','0','0','property:feedback:add','#','admin','2025-01-15 11:08:39','',NULL,''),(2062,'查看反馈',2052,2,'',NULL,NULL,1,0,'F','0','0','property:feedback:view','#','admin','2025-01-15 11:09:05','',NULL,''),(2063,'删除反馈',2052,3,'',NULL,NULL,1,0,'F','0','0','property:feedback:delete','#','admin','2025-01-15 11:09:21','',NULL,''),(2064,'回复反馈',2052,4,'',NULL,NULL,1,0,'F','0','0','property:feedback:reply','#','admin','2025-01-15 11:09:38','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'欢迎大家预约','2',_binary '<p>新的诗词交流活动开放啦，欢迎大家积极预约</p>','0','admin','2024-02-28 22:23:43','admin','2025-01-06 09:29:43','管理员'),(2,'古诗词交流平台系统维护','1',_binary '<p>系统维护中，两天后正常开放</p>','0','admin','2024-02-28 22:23:43','admin','2025-01-06 09:30:14','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:40:16',125),(101,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:40:47',63),(102,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:41:12',47),(103,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:41:32',34),(104,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2024-02-28 22:41:54',5),(105,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:41:57',19),(106,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:41:59',16),(107,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:42:01',18),(108,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:42:03',16),(109,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:42:05',17),(110,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-02-28 22:42:07',13),(111,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2024-02-28 22:42:09',9),(112,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-01 23:09:36',61),(113,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-01 23:09:50',918),(114,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"羽毛球场馆管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"ss\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-01 23:11:41',20),(115,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-03-01 23:11:41\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"羽毛球场馆管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"featherBall\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-01 23:12:27',15),(116,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/venue/index\",\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"场馆管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"venue\",\"perms\":\"featherball:venue:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-01 23:15:33',19),(117,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/court/index\",\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"场地管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"court\",\"perms\":\"featherball:court:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-02 18:17:38',48),(118,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:40:49',54),(119,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:40:56',18),(120,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:41:01',14),(121,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:41:06',16),(122,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/101','127.0.0.1','内网IP','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2024-03-03 17:44:21',10),(123,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:44:23',17),(124,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/103','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:44:25',25),(125,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/101','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:44:26',17),(126,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:45:33',13),(127,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-03 17:45:53',12),(128,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-04 18:50:34',38),(129,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13089876578\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"zhangsan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-04 18:58:34',233),(130,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"13909879876\",\"postIds\":[],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"lisi\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-04 18:58:57',155),(131,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"13809897654\",\"postIds\":[],\"roleIds\":[100],\"sex\":\"1\",\"status\":\"0\",\"userId\":102,\"userName\":\"wangwu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-04 18:59:22',151),(132,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"赵六\",\"params\":{},\"phonenumber\":\"13098987678\",\"postIds\":[],\"roleIds\":[101],\"sex\":\"1\",\"status\":\"0\",\"userId\":103,\"userName\":\"zhaoliu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-04 18:59:55',157),(133,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-02-28 22:23:43\",\"noticeContent\":\"<p>羽毛球场馆开放啦，欢迎大家积极预约</p>\",\"noticeId\":1,\"noticeTitle\":\"欢迎大家预约\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-05 10:19:20',10),(134,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-02-28 22:23:43\",\"noticeContent\":\"<p>系统维护中，两天后正常开放</p>\",\"noticeId\":2,\"noticeTitle\":\"羽毛球场管理预约系统维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-05 10:20:01',26),(135,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-06 15:36:09',78),(136,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-06 15:36:13',33),(137,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-06 15:36:16',33),(138,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/reservation/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约记录\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"reservation\",\"perms\":\"featherball:reservation:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 11:34:11',14),(139,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,2003,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 16:46:19',33),(140,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,2003,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 16:46:28',15),(141,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,2003,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 16:46:34',25),(142,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增场馆\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:24:30',45),(143,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看评论\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:review\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:25:05',21),(144,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"场馆详情\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:detail\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:25:40',16),(145,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑场馆\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:26:33',17),(146,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除场馆\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:27:02',29),(147,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除评论\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:reviewdelete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:27:43',28),(148,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"发送评论\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2001,\"perms\":\"featherball:venue:reviewadd\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:28:10',22),(149,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增场地\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"featherball:court:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:31:33',21),(150,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约场地\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"featherball:court:reservation\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:32:13',21),(151,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"场地详情\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"perms\":\"featherball:court:detail\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:32:38',25),(152,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑场地\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"perms\":\"featherball:court:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:32:59',30),(153,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除场地\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2002,\"perms\":\"featherball:court:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:33:19',25),(154,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"取消预约\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"featherball:reservation:cancel\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:39:37',18),(155,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2005,2006,2013,2003,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:40:40',63),(156,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2009,2010,2012,2013,2003,2016],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:44:35',46),(157,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2013,2003],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:44:43',38),(158,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2010,2012,2013,2003,2016],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:45:02',36),(159,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10000,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:58:34\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13089876578\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:19:13',27),(160,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:58:34\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13089876578\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:19:23',17),(161,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:58:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"13909879876\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"lisi\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:19:28',24),(162,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10000,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:59:22\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-03-07 17:45:44\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"13809897654\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"wangwu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:19:36',32),(163,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10000,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:59:55\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-03-06 15:38:23\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"赵六\",\"params\":{},\"phonenumber\":\"13098987678\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"zhaoliu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:19:42',25),(164,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index2\",\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教练管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"trainer\",\"perms\":\"system:user:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 10:56:24',55),(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index2\",\"createTime\":\"2024-03-08 10:56:24\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"教练管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"trainer\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 11:02:16',44),(166,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index3\",\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"VIP管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"vip\",\"perms\":\"system:vip:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 11:04:14',22),(167,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/equipmentpurchase/index\",\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"商品购买\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"equipmentPurchase\",\"perms\":\"featherball:equipmentpurchase:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 15:55:06',25),(168,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/equipmentrepair/index\",\"createBy\":\"admin\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"器材维修\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"path\":\"equipmentRepair\",\"perms\":\"featherball:equipmentrepair:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-08 15:57:09',24),(169,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/balancerecord/index\",\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"path\":\"balanceRecord\",\"perms\":\"featherball:balancerecord:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-09 12:29:42',47),(170,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2009,2010,2012,2013,2003,2016,2019,2020,2021],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-09 18:14:14',54),(171,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2010,2012,2013,2003,2016,2019,2020,2021],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-09 18:14:20',28),(172,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"featherball/charts/index\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"统计图表\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2000,\"path\":\"charts\",\"perms\":\"featherball:charts:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-09 22:57:41',54),(173,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增商品\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"perms\":\"featherball:pur:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:29:43',45),(174,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"购买商品\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"perms\":\"featherball:pur:buy\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:30:09',29),(175,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑商品\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2019,\"perms\":\"featherball:pur:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:30:32',12),(176,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除商品\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2019,\"perms\":\"featherball:pur:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:31:02',15),(177,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增配件\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2020,\"perms\":\"featherball:rep:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:32:00',17),(178,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"配件维修\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2020,\"perms\":\"featherball:rep:rep\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:32:27',11),(179,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑配件\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2020,\"perms\":\"featherball:rep:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:32:49',12),(180,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除配件\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2020,\"perms\":\"featherball:rep:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:33:09',13),(181,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:23:42\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2001,2002,2005,2006,2013,2003,2019,2020,2021],\"params\":{},\"remark\":\"教练员\",\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:34:44',132),(182,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:12\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2019,2020,2005,2006,2009,2010,2012,2013,2003,2016,2024,2028,2021],\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-10 11:35:10',34),(183,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-18 10:18:15',17),(184,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-18 10:20:18',18),(185,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/config','127.0.0.1','内网IP','{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2024-02-28 22:23:43\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-18 10:20:34',10),(186,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/user/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-18 11:09:02',30),(187,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-26 15:34:59',24),(188,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-26 15:35:05',19),(189,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"古诗词交流\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"poem\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-02 14:41:41',12),(190,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"poem/poem/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"诗词发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2031,\"path\":\"poem\",\"perms\":\"poem:poem:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-02 14:43:18',18),(191,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"poem/feedback/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"问题反馈\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2031,\"path\":\"feedback\",\"perms\":\"poem:feedback:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 11:29:32',17),(192,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"poem/activity/index\",\"createBy\":\"admin\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2031,\"path\":\"activity\",\"perms\":\"poem:activity:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-03 16:31:17',40),(193,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-02-28 22:23:43\",\"noticeContent\":\"<p>新的诗词交流活动开放啦，欢迎大家积极预约</p>\",\"noticeId\":1,\"noticeTitle\":\"欢迎大家预约\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-05 10:19:20\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 09:29:43',12),(194,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-02-28 22:23:43\",\"noticeContent\":\"<p>系统维护中，两天后正常开放</p>\",\"noticeId\":2,\"noticeTitle\":\"古诗词交流平台系统维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2024-03-05 10:20:01\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 09:30:14',19),(195,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index2\",\"createTime\":\"2024-03-08 10:56:24\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"教练管理\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"trainer\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 09:30:42',21),(196,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index3\",\"createTime\":\"2024-03-08 11:04:14\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"VIP管理\",\"menuType\":\"C\",\"orderNum\":11,\"params\":{},\"parentId\":1,\"path\":\"vip\",\"perms\":\"system:vip:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 09:30:48',11),(197,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"poem/activityRegistration/index\",\"createBy\":\"admin\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约记录\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2031,\"path\":\"activityRegistration\",\"perms\":\"poem:activityRegistration:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 14:54:49',16),(198,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000,2001,2002,2005,2006,2010,2012,2013,2003,2016,2019,2020,2021,2031,2032,2033,2034,2035],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 16:52:44',68),(199,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-03-01 23:11:41\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"羽毛球场馆管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"featherBall\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-06 17:09:17',18),(200,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-12-31 09:23:15\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2025-01-06 16:53:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"fjx3205073\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":107,\"userName\":\"fjx3205073\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 09:56:33',47),(201,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2024-03-18 11:09:21\",\"delFlag\":\"0\",\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"fanjiaxing\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[101],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":105,\"userName\":\"fanjiaxing\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 09:56:43',21),(202,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增诗词\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2032,\"perms\":\"poem:poem:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:31:00',67),(203,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑诗词\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2032,\"perms\":\"poem:poem:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:31:43',10),(204,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看诗词\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2032,\"perms\":\"poem:poem:detail\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:32:16',9),(205,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除诗词\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2032,\"perms\":\"poem:poem:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:32:43',21),(206,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"诗词审核\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2032,\"perms\":\"poem:poem:audit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:33:54',12),(207,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增反馈\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"poem:feedback:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:35:42',14),(208,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除反馈\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2033,\"perms\":\"poem:feedback:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:36:03',22),(209,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"回复反馈\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2033,\"perms\":\"poem:feedback:reply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:36:26',27),(210,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增活动\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"perms\":\"poem:activity:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:37:27',18),(211,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改活动\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2034,\"perms\":\"poem:activity:edit\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:37:44',18),(212,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除活动\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2034,\"perms\":\"poem:activity:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:38:06',19),(213,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除预约\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2035,\"perms\":\"poem:activityRegistration:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:39:03',20),(214,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约活动\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2034,\"perms\":\"poem:activityRegistration:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:39:46',14),(215,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2000,2001,2002,2031,2032,2033,2034,2005,2006,2010,2012,2013,2003,2016,2019,2020,2021,2036,2037,2038,2039,2041,2042,2048,2035],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 15:45:10',27),(216,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 16:37:10',26),(217,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 16:37:16',10),(218,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/user/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-07 16:38:10',22),(219,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":9610,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:59:22\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-03-11 11:02:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"13809897654\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"wangwu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:13:17',92),(220,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":9610,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:59:22\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginDate\":\"2024-03-11 11:02:02\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王五\",\"params\":{},\"phonenumber\":\"13809897654\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"VIP\",\"roleName\":\"VIP用户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":102,\"userName\":\"wangwu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:13:17',28),(221,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:58:57\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"李四\",\"params\":{},\"phonenumber\":\"13909879876\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"lisi\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:13:26',20),(222,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"balance\":10,\"createBy\":\"admin\",\"createTime\":\"2024-03-04 18:58:34\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"青岛市羽毛球场管理公司\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"13089876578\",\"postIds\":[],\"roleIds\":[101],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"coach\",\"roleName\":\"教练员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"zhangsan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:13:33',19),(223,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/role/100','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:15:10',37),(224,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/role/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:15:12',24),(225,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/user/108','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:15:32',14),(226,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:16:44',43),(227,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:16:49',21),(228,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/user/105','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:18:08',18),(229,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/user/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-09 20:18:10',10),(230,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','茶商城经贸总公司','/system/menu/2031','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 14:53:21',9),(231,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','茶商城经贸总公司','/system/menu/2035','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 14:53:26',4),(232,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','茶商城经贸总公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"物业管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"property\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 14:54:04',31),(233,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"property/repair/index\",\"createBy\":\"admin\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"维修管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2049,\"path\":\"repair\",\"perms\":\"property:repair:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 15:08:37',15),(234,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:12:46',6),(235,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2037','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:12:52',7),(236,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2040','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 15:12:57',16),(237,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:00',5),(238,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:07',4),(239,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2032','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:11',7),(240,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2035','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:37',2),(241,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2038','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:43',5),(242,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:50',6),(243,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','青岛市羽毛球场管理公司','/system/menu/2037','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-01-13 15:13:52',7),(244,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-01-02 14:41:41\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"古诗词交流\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"poem\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-13 15:14:42',30),(245,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"property/payment/index\",\"createBy\":\"admin\",\"icon\":\"number\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"缴费管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2049,\"path\":\"payment\",\"perms\":\"property:payment:index\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-14 16:31:31',42),(246,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"property/feedback/index\",\"createBy\":\"admin\",\"icon\":\"question\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"业主反馈\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2049,\"path\":\"feedback\",\"perms\":\"property:feedback:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 09:37:50',17),(247,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增维修\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2050,\"perms\":\"property:repair:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 10:56:00',80),(248,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改状态\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2050,\"perms\":\"property:repair:change\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 10:56:43',57),(249,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看维修\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2050,\"perms\":\"property:repair:view\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 10:57:01',25),(250,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除维修\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2050,\"perms\":\"property:repair:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:06:37',18),(251,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增缴费\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2051,\"perms\":\"property:payment:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:07:15',19),(252,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看缴费\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2051,\"perms\":\"property:payment:view\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:07:36',22),(253,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"缴费付款\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2051,\"perms\":\"property:payment:pay\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:08:01',20),(254,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除缴费\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2051,\"perms\":\"property:payment:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:08:15',18),(255,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增反馈\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2052,\"perms\":\"property:feedback:add\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:08:39',10),(256,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看反馈\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2052,\"perms\":\"property:feedback:view\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:09:05',20),(257,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除反馈\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2052,\"perms\":\"property:feedback:delete\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:09:21',19),(258,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','XXX大学','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"回复反馈\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2052,\"perms\":\"property:feedback:reply\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:09:38',18),(259,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','XXX大学','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2050,2053,2054,2055,2056,2051,2058,2059,2052,2061,2062,2063],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:10:41',25),(260,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2049,2050,2053,2054,2055,2056,2051,2058,2059,2052,2061,2062,2063],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:12:05',28),(261,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-02-28 22:41:32\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2049,2050,2053,2055,2051,2058,2059,2052,2061,2062,2063],\"params\":{},\"remark\":\"普通用户\",\"roleId\":101,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:19:09',32),(262,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:22:46',18),(263,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','青岛市羽毛球场管理公司','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/menu/index\",\"createTime\":\"2024-02-28 22:23:42\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":102,\"menuName\":\"菜单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1,\"path\":\"menu\",\"perms\":\"system:menu:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-01-15 11:22:50',22);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-02-28 22:23:42','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-02-28 22:23:42','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-02-28 22:23:42','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-02-28 22:23:42','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-02-28 22:23:42','',NULL,'超级管理员'),(2,'教练员','coach',2,'2',0,1,'0','2','admin','2024-02-28 22:23:42','admin','2024-03-10 11:34:44','教练员'),(100,'VIP用户','VIP',3,'1',1,1,'0','2','admin','2024-02-28 22:41:12','admin','2024-03-10 11:35:10',NULL),(101,'普通用户','common',4,'1',0,1,'0','0','admin','2024-02-28 22:41:32','admin','2025-01-15 11:19:09','普通用户');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (101,2049),(101,2050),(101,2051),(101,2052),(101,2053),(101,2055),(101,2058),(101,2059),(101,2061),(101,2062),(101,2063);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `balance` decimal(7,2) DEFAULT NULL COMMENT '余额',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,100,'admin','管理员','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-01-15 11:21:42','admin','2024-02-28 22:23:42','','2025-01-15 11:21:41','管理员',390.00),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','2','127.0.0.1','2024-02-28 22:23:42','admin','2024-02-28 22:23:42','',NULL,'测试员',NULL),(100,100,'zhangsan','张三','00','','13089876578','0','','$2a$10$g86PdbK5Z28hgOkGfevFCuO0KekkjR6OJdAHt8gCyLJFG3Uos.3JO','0','0','127.0.0.1','2025-01-15 11:20:26','admin','2024-03-04 18:58:34','admin','2025-01-15 11:20:25',NULL,10.00),(101,100,'lisi','李四','00','','13909879876','0','','$2a$10$aiYx9RhkHXWto9AK.rMgu.MobzG6j76WtZ5jetHTmi67xJjcZ9tZq','0','0','127.0.0.1','2025-01-15 11:21:03','admin','2024-03-04 18:58:57','admin','2025-01-15 11:21:03',NULL,10.00),(102,100,'wangwu','王五','00','','13809897654','1','','$2a$10$fvHIaJ0kOyCPYIFlo6Tnn.juTWodmgWP6IT/9D6qzI77zT6hhLNGS','0','0','127.0.0.1','2025-01-15 11:15:49','admin','2024-03-04 18:59:22','admin','2025-01-15 11:15:48',NULL,9610.00),(103,100,'zhaoliu','赵六','00','','13098987678','1','','$2a$10$W/Jh9aLcunw7wGAFa7GSuOcNroWzbk5Dy4AXPb7Ke85BIJdsEQNrC','0','0','127.0.0.1','2025-01-06 16:58:03','admin','2024-03-04 18:59:55','admin','2025-01-06 16:58:03',NULL,10000.00),(104,NULL,'fanjiaxing','fanjiaxing','00','','','0','','$2a$10$eyzwvhBbnWSUIf8.AxTXJONb9j/WV3c3s2oUiSCTmUhe.iN6eQdVK','0','2','127.0.0.1','2024-03-18 10:21:10','','2024-03-18 10:20:59','','2024-03-18 10:21:10',NULL,NULL),(105,NULL,'fanjiaxing','fanjiaxing','00','','','0','','$2a$10$dQhzINJKANvGEgCekejN2.SI6sJomoBbiX5tmi.msdmhHVP9rk0ou','0','2','',NULL,'','2024-03-18 11:09:21','admin','2025-01-07 09:56:43',NULL,NULL),(106,NULL,'张夜猫','张夜猫','00','','','0','','$2a$10$5eh4CwLns/GDKDBorKQA2uAsjQAswonnvsEVGJ7FopP3.YdPyD5iC','0','2','127.0.0.1','2025-01-07 09:56:09','','2024-12-30 17:22:08','','2025-01-07 09:56:08',NULL,NULL),(107,NULL,'fjx3205073','fjx3205073','00','','','0','','$2a$10$UIZXJBYjXD5y4YxO/6qqd.ExJAy.Ln3LBSdZSs13RTCM7pL2.B8Gq','0','2','127.0.0.1','2025-01-07 15:58:13','','2024-12-31 09:23:15','admin','2025-01-07 15:58:13',NULL,NULL),(108,NULL,'liming','liming','00','','','0','','$2a$10$MTMjtHhAMd3JiyGCewwIluy4C5oI6FxOw2sJKMP1b2ijUCZbpSbpW','0','2','127.0.0.1','2025-01-09 20:04:41','','2025-01-09 19:52:19','','2025-01-09 20:04:41',NULL,NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(100,101),(101,101),(102,101),(103,101);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ry-cps'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-15 11:24:13
