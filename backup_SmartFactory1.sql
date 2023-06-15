-- MySQL dump 10.13  Distrib 8.0.33, for Linux (aarch64)
--
-- Host: localhost    Database: SmartFactory
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `t_anodeRatios`
--

DROP TABLE IF EXISTS `t_anodeRatios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_anodeRatios` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `pre_treatment` float DEFAULT NULL COMMENT '흑연 전처리 비율',
                                 `surface_treatment` float DEFAULT NULL COMMENT '흑연 표면처리 비율',
                                 `sintering` float DEFAULT NULL COMMENT '흑연 소성 비율',
                                 `post_treatment` float DEFAULT NULL COMMENT '흑연 후처리 비율',
                                 `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                                 PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_anodeRatios`
--

LOCK TABLES `t_anodeRatios` WRITE;
/*!40000 ALTER TABLE `t_anodeRatios` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_anodeRatios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_cathodeRatios`
--

DROP TABLE IF EXISTS `t_cathodeRatios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_cathodeRatios` (
                                   `id` int NOT NULL AUTO_INCREMENT,
                                   `lithium` float DEFAULT NULL COMMENT '리튬 비율',
                                   `nickel` float DEFAULT NULL COMMENT '니켈 비율',
                                   `cobalt` float DEFAULT NULL COMMENT '코발트 비율',
                                   `manganese` float DEFAULT NULL COMMENT '망간 비율',
                                   `aluminium` float DEFAULT NULL COMMENT '알루미늄 비율',
                                   `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                                   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_cathodeRatios`
--

LOCK TABLES `t_cathodeRatios` WRITE;
/*!40000 ALTER TABLE `t_cathodeRatios` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_cathodeRatios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_companies`
--

DROP TABLE IF EXISTS `t_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_companies` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) NOT NULL COMMENT '기업 이름',
                               `category` tinyint NOT NULL COMMENT '기업 분류 (10: 자동차, 20: It, 30: ESS, 40: 배터리)',
                               `introduction` text COMMENT '기업 소개',
                               `location` varchar(255) DEFAULT NULL COMMENT '기업 위치',
                               `total_cathode_qty` int DEFAULT NULL COMMENT '총 양극재 구매 수량',
                               `total_anode_qty` int DEFAULT NULL COMMENT '총 음극재 구매 수량',
                               `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_companies`
--

LOCK TABLES `t_companies` WRITE;
/*!40000 ALTER TABLE `t_companies` DISABLE KEYS */;
INSERT INTO `t_companies` VALUES (1,'현대',10,'현대자동차는 한국의 대표적인 자동차 제조 회사입니다.','서울특별시 강남구 테헤란로 152',0,0,'2023-06-14 12:09:34'),(2,'기아',10,'기아자동차는 현대자동차 그룹에 속한 한국의 자동차 제조 회사입니다.','서울특별시 서초구 양재동',0,0,'2023-06-14 12:09:34'),(3,'쉐보레',10,'쉐보레는 GM 그룹에 속한 미국의 자동차 제조 회사입니다.','미국 미시건주 디트로이트',0,0,'2023-06-14 12:09:34'),(4,'삼성',20,'삼성전자는 한국의 대표적인 IT 회사입니다.','경기도 수원시 영통구 삼성로 129',0,0,'2023-06-14 12:09:34'),(5,'LG',30,'LG화학은 ESS 및 배터리 분야에서 세계적인 기업입니다.','서울특별시 영등포구 여의대로 128',0,0,'2023-06-14 12:09:34'),(6,'SK',40,'SK이노베이션은 배터리 분야에서 세계적인 기업입니다.','서울특별시 종로구 종로 26',0,0,'2023-06-14 12:09:34');
/*!40000 ALTER TABLE `t_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_factories`
--

DROP TABLE IF EXISTS `t_factories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_factories` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) NOT NULL COMMENT '공장 이름',
                               `location` varchar(255) DEFAULT NULL COMMENT '공장 위치 (광양, 포항, 구미)',
                               `cathode_production` int DEFAULT NULL COMMENT '음극재 생산량',
                               `anode_production` int DEFAULT NULL COMMENT '양극재 생산량',
                               `cathode_stock` int DEFAULT NULL COMMENT '음극재 재고',
                               `anode_stock` int DEFAULT NULL COMMENT '양극재 재고',
                               `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_factories`
--

LOCK TABLES `t_factories` WRITE;
/*!40000 ALTER TABLE `t_factories` DISABLE KEYS */;
INSERT INTO `t_factories` VALUES (1,'광양공장','전라남도 광양시 중마동',400,800,0,0,'2023-06-15 00:30:28'),(2,'포항공장','경상북도 포항시 남구 대송면',0,0,0,0,'2023-06-15 00:30:28'),(3,'구미공장','경상북도 구미시 고아읍',350,0,0,0,'2023-06-15 00:30:28');
/*!40000 ALTER TABLE `t_factories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_materials`
--

DROP TABLE IF EXISTS `t_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_materials` (
                               `id` int NOT NULL AUTO_INCREMENT,
                               `name` varchar(255) NOT NULL COMMENT '재료 이름',
                               `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                               `description` varchar(255) DEFAULT NULL,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_materials`
--

LOCK TABLES `t_materials` WRITE;
/*!40000 ALTER TABLE `t_materials` DISABLE KEYS */;
INSERT INTO `t_materials` VALUES (1,'양극재','2023-06-14 12:09:34',' 보통 리튬이온 배터리의 양극(+)에 사용되는 재료. 대표적으로 리튬코발트산화물, 리튬니켈산화물 등이 있다.'),(2,'음극재','2023-06-14 12:09:34',' 리튬이온 배터리의 음극(-)에 사용되는 재료. 대표적으로 그래핀 기반의 재료가 사용된다.'),(3,'리튬','2023-06-14 12:09:34','가장 대표적인 충전지인 리튬 이온 배터리의 주요 구성 요소. 높은 에너지 밀도와 장수명으로 널리 사용되고 있다.'),(4,'니켈','2023-06-14 12:09:34',' 양극재로 사용되며, 리튬니켈산화물(리튬니켈망간산화물 등) 형태로 사용된다.'),(5,'코발트','2023-06-14 12:09:34',' 양극재로서, 리튬코발트산화물(LiCoO2) 형태로 사용된다. 높은 에너지 밀도를 가지지만, 비용이 높고 공급에 제약이 있다.'),(6,'망간','2023-06-14 12:09:34','양극재로 사용되며, 리튬니켈망간산화물 형태로 사용된다. 코발트 대비 가격이 저렴하고 안정성이 높다.'),(7,'알루미늄','2023-06-14 12:09:34','배터리 외관이나 전극의 현재 수집 그리드로 주로 사용되는 재료.');
/*!40000 ALTER TABLE `t_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_orders`
--

DROP TABLE IF EXISTS `t_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_orders` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `company_id` int DEFAULT NULL COMMENT '기업 ID',
                            `factory_id` int DEFAULT NULL COMMENT '공장 ID',
                            `material_id` int DEFAULT NULL COMMENT '재료 ID',
                            `qty` int DEFAULT NULL COMMENT '주문 수량',
                            `purchase_price` float DEFAULT NULL COMMENT '구매 가격',
                            `order_date` date DEFAULT NULL COMMENT '주문 날짜',
                            `expected_delivery_date` date DEFAULT NULL COMMENT '예상 배송일',
                            `status` tinyint NOT NULL COMMENT '주문 상태 (10: 주문 진행, 20: 발송 완료)',
                            `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_orders`
--

LOCK TABLES `t_orders` WRITE;
/*!40000 ALTER TABLE `t_orders` DISABLE KEYS */;
INSERT INTO `t_orders` VALUES (1,1,1,1,100,5000000,'2023-06-14','2023-06-17',10,'2023-06-15 01:52:22'),(2,1,2,2,150,7500000,'2023-06-15','2023-06-18',10,'2023-06-15 01:52:22'),(3,2,1,1,200,10000000,'2023-06-16','2023-06-19',10,'2023-06-15 01:52:22'),(4,2,3,2,250,12500000,'2023-06-17','2023-06-20',10,'2023-06-15 01:52:22'),(5,3,2,1,300,15000000,'2023-06-18','2023-06-21',10,'2023-06-15 01:52:22'),(6,3,3,2,350,17500000,'2023-06-19','2023-06-22',10,'2023-06-15 01:52:22'),(7,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:10:23'),(8,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:10:38'),(9,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:14:49'),(10,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:14:55'),(11,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:15:37'),(12,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:15:42'),(13,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:15:51'),(14,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:16:20'),(15,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:17:39'),(16,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:20:50'),(17,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:20:52'),(18,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:20:54'),(19,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:21:00'),(20,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:21:03'),(21,1,1,1,400,500,'2023-06-15','2023-06-22',10,'2023-06-15 07:21:18');
/*!40000 ALTER TABLE `t_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_production`
--

DROP TABLE IF EXISTS `t_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_production` (
                                `id` int NOT NULL AUTO_INCREMENT,
                                `order_id` int DEFAULT NULL COMMENT '주문 ID',
                                `factory_id` int DEFAULT NULL COMMENT '공장 ID',
                                `qty` int DEFAULT NULL COMMENT '생산 수량',
                                `start_date` date DEFAULT NULL COMMENT '생산 시작일',
                                `expected_completion_date` date DEFAULT NULL COMMENT '예상 생산 완료일',
                                `status` tinyint DEFAULT NULL COMMENT '생산 상태 (10: 생산진행, 20: 생산완료)',
                                `created_ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '생성일시 ',
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_production`
--

LOCK TABLES `t_production` WRITE;
/*!40000 ALTER TABLE `t_production` DISABLE KEYS */;
INSERT INTO `t_production` VALUES (1,1,1,100,'2023-06-14','2023-06-17',10,'2023-06-15 02:31:34'),(2,2,2,150,'2023-06-15','2023-06-19',10,'2023-06-15 02:31:34'),(3,3,1,200,'2023-06-16','2023-06-20',10,'2023-06-15 02:31:34'),(4,4,3,250,'2023-06-17','2023-06-22',10,'2023-06-15 02:31:34'),(5,5,2,300,'2023-06-18','2023-06-23',10,'2023-06-15 02:31:34'),(6,6,3,350,'2023-06-19','2023-06-25',10,'2023-06-15 02:31:34'),(7,12,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:15:42'),(8,13,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:15:51'),(9,14,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:16:20'),(10,15,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:17:40'),(11,16,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:20:51'),(12,17,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:20:52'),(13,18,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:20:54'),(14,19,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:21:00'),(15,20,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:21:03'),(16,21,1,400,'2023-06-15','2023-06-18',10,'2023-06-15 07:21:18');
/*!40000 ALTER TABLE `t_production` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-15  8:39:51
