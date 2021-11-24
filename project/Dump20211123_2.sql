-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Temporary view structure for view `amount_taxed`
--

DROP TABLE IF EXISTS `amount_taxed`;
/*!50001 DROP VIEW IF EXISTS `amount_taxed`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `amount_taxed` AS SELECT 
 1 AS `cart_id`,
 1 AS `amount_owed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` varchar(45) NOT NULL,
  `cust_id` varchar(40) NOT NULL,
  `item_id` varchar(5) DEFAULT NULL,
  `item_qty` int DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_cust_id_idx` (`cust_id`),
  KEY `cart_item_id_idx` (`item_id`),
  CONSTRAINT `cart_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_item_id` FOREIGN KEY (`item_id`) REFERENCES `shoe` (`shoe_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES ('9001','1','5001',1),('9002','2','5002',1),('9003','3','5008',2),('9004','4',NULL,NULL),('9005','5',NULL,NULL),('9006','6','5006',1),('9007','7','5009',3);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cust_id` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL,
  `cust_username` varchar(30) NOT NULL,
  `zipcode` char(9) NOT NULL,
  `cart_id` varchar(45) NOT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `cust_username_idx` (`cust_username`),
  KEY `cust_cart_id_idx` (`cart_id`),
  KEY `cust_cust_username_idx` (`cust_username`),
  CONSTRAINT `cust_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cust_cust_username` FOREIGN KEY (`cust_username`) REFERENCES `new_customer` (`cust_username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('1','4628 Main St Meadow Lake, SK','FranMas','S0M 1V0','9001'),('2','1595 Holdom Avenue Surrey, BC','RudyHam','V3T 4Y5','9002'),('3','5644 Jade St Richmond, BC','AntRet','V7E 2E4','9003'),('4','3403 50th Street Edmonton, AB','AlChet','T6B 2W9','9004'),('5','3997 Water Street Kitchener, ON','BenKing','N2H 5A5','9005'),('6','2892 Glen Long Avenue Toronto, ON','RicHota','M6B 1J8','9006'),('7','3202 Toy Avenue Oshawa, ON','TimTapp','L1H 7K5','9007');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `distinct_cart_shoes`
--

DROP TABLE IF EXISTS `distinct_cart_shoes`;
/*!50001 DROP VIEW IF EXISTS `distinct_cart_shoes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `distinct_cart_shoes` AS SELECT 
 1 AS `item_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `highest_price`
--

DROP TABLE IF EXISTS `highest_price`;
/*!50001 DROP VIEW IF EXISTS `highest_price`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `highest_price` AS SELECT 
 1 AS `shoe_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!50001 DROP VIEW IF EXISTS `inventory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventory` AS SELECT 
 1 AS `stock`,
 1 AS `shoe_name`,
 1 AS `price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `later_order`
--

DROP TABLE IF EXISTS `later_order`;
/*!50001 DROP VIEW IF EXISTS `later_order`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `later_order` AS SELECT 
 1 AS `cust_id`,
 1 AS `order_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `cust_id` varchar(40) NOT NULL,
  `login_username` varchar(30) NOT NULL,
  `login_pwd` varchar(25) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  PRIMARY KEY (`cust_id`,`login_username`),
  KEY `login_username_idx` (`login_username`),
  CONSTRAINT `cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `login_username` FOREIGN KEY (`login_username`) REFERENCES `new_customer` (`cust_username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('1','FranMas','oijwojeofje89','Fran@email.com'),('2','RudyHam','ejfahoiharo4593','Rudy@emailnow.com'),('3','AntRet','rettyjpeojfj754','BigRet@gmail.com'),('4','AlChet','uhfeuhhekjjh332772','ChetAl@gmail.com'),('5','BenKing','jhfuhkjnsjnfjk4763ng','Bigbenking@email.com'),('6','RicHota','biihewufh74','Hota@emailme.com'),('7','TimTapp','rhiawoierkf4562','TimTap@email.com');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_customer`
--

DROP TABLE IF EXISTS `new_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_customer` (
  `cust_username` varchar(30) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  `cust_pwd` varchar(25) NOT NULL,
  PRIMARY KEY (`cust_username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_customer`
--

LOCK TABLES `new_customer` WRITE;
/*!40000 ALTER TABLE `new_customer` DISABLE KEYS */;
INSERT INTO `new_customer` VALUES ('AlChet','ChetAl@gmail.com','uhfeuhhekjjh332772'),('AntRet','BigRet@gmail.com','rettyjpeojfj754'),('BenKing','Bigbenking@email.com','jhfuhkjnsjnfjk4763ng'),('FranMas','Fran@email.com','oijwojeofje89'),('RicHota','Hota@emailme.com','biihewufh74'),('RudyHam','Rudy@emailnow.com','ejfahoiharo4593'),('TimTapp','TimTap@email.com','rhiawoierkf4562');
/*!40000 ALTER TABLE `new_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `num_users`
--

DROP TABLE IF EXISTS `num_users`;
/*!50001 DROP VIEW IF EXISTS `num_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `num_users` AS SELECT 
 1 AS `‘num_users’`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `order_record`
--

DROP TABLE IF EXISTS `order_record`;
/*!50001 DROP VIEW IF EXISTS `order_record`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_record` AS SELECT 
 1 AS `cust_id`,
 1 AS `order_id`,
 1 AS `payment_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` varchar(40) NOT NULL,
  `item_qty` int DEFAULT NULL,
  `shippedDate` date DEFAULT NULL,
  `deliveredDate` date DEFAULT NULL,
  `expectedDate` date DEFAULT NULL,
  `cust_id` varchar(40) DEFAULT NULL,
  `cart_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_cart_id_idx` (`cart_id`),
  KEY `order_cust_id_idx` (`cust_id`),
  CONSTRAINT `order_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('8000',1,'2021-11-05','2021-11-07','2021-11-07','1','9004'),('8001',2,'2021-10-09','2021-10-10','2021-10-09','5','9002'),('8002',2,'2021-09-21','2021-09-24','2021-09-24','2','9001'),('8003',1,'2021-11-07',NULL,'2021-11-10','4','9005'),('8004',3,'2021-10-14','2021-10-18','2021-10-16','6','9003'),('8005',1,NULL,NULL,'2021-11-11','3','9006');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `paid_users`
--

DROP TABLE IF EXISTS `paid_users`;
/*!50001 DROP VIEW IF EXISTS `paid_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `paid_users` AS SELECT 
 1 AS `cust_username`,
 1 AS `cust_id`,
 1 AS `payment_type`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pay_info`
--

DROP TABLE IF EXISTS `pay_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_info` (
  `payment_id` int NOT NULL,
  `payment_type` varchar(15) DEFAULT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `cust_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `pay_order_id_idx` (`order_id`),
  KEY `pay_cust_id_idx` (`cust_id`),
  CONSTRAINT `pay_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pay_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_info`
--

LOCK TABLES `pay_info` WRITE;
/*!40000 ALTER TABLE `pay_info` DISABLE KEYS */;
INSERT INTO `pay_info` VALUES (100001,'Master','8000','1'),(200001,'Visa','8001','2'),(300001,'Visa','8002','3'),(400001,'Master','8003','4'),(500001,'Visa','8004','5'),(600001,'Master','8005','6');
/*!40000 ALTER TABLE `pay_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `percentage_late`
--

DROP TABLE IF EXISTS `percentage_late`;
/*!50001 DROP VIEW IF EXISTS `percentage_late`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `percentage_late` AS SELECT 
 1 AS `percentage_late`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shoe`
--

DROP TABLE IF EXISTS `shoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoe` (
  `shoe_id` varchar(30) NOT NULL,
  `shoe_name` varchar(25) NOT NULL,
  `stock` int DEFAULT NULL,
  `type` varchar(15) NOT NULL,
  `descr` varchar(40) NOT NULL,
  `price` double DEFAULT NULL,
  `brand` varchar(15) NOT NULL,
  `size` varchar(10) NOT NULL,
  `image` mediumtext,
  PRIMARY KEY (`shoe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoe`
--

LOCK TABLES `shoe` WRITE;
/*!40000 ALTER TABLE `shoe` DISABLE KEYS */;
INSERT INTO `shoe` VALUES ('5001','Air Max 90',10,'Trainer','True to roots',160,'Nike','7-14','AM90.jpg'),('5002','Ultra Boost21',13,'Trainer','Increased responsiveness',300,'Adidas','4-12','UlraBoost21.jpg'),('5003','Super Star Classic',21,'Shell-Toe','Classic shell toed shoe',150,'Adidas','5-14','SuperStarClassic.jpg'),('5004','Zoom Fly 4',9,'Trainer','Breath easy, stretchy collar',200,'Nike','6.5-14','ZoomFly4.jpg'),('5005','Eightyone CLude C FVS',8,'Old-School','Old court style shoe',100,'Reebok','4-11','EightyoneClubCFVS.jpg'),('5006','Air Max 95',1,'Jordan','95 style with modern comfort',200,'Nike','6-15','AM95.jpg'),('5007','100 Ace',4,'Sneaker','Old Ace style paying homage',940,'Gucci','5-14.5','100Ace.jpg'),('5008','Tennis 1997',2,'Tennis','High top with black suede, 1997 style',1090,'Gucci','5-11','Tennis1997.jpg'),('5009','Speed Lace-Up',7,'Sneaker','Ergo sole, extra light, flexible',999,'Balenciaga','6-14','SpeedLace-Up.jpg');
/*!40000 ALTER TABLE `shoe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shoes_in_carts`
--

DROP TABLE IF EXISTS `shoes_in_carts`;
/*!50001 DROP VIEW IF EXISTS `shoes_in_carts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `shoes_in_carts` AS SELECT 
 1 AS `shoe_name`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_cost`
--

DROP TABLE IF EXISTS `total_cost`;
/*!50001 DROP VIEW IF EXISTS `total_cost`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_cost` AS SELECT 
 1 AS `cart_id`,
 1 AS `total_cost`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `amount_taxed`
--

/*!50001 DROP VIEW IF EXISTS `amount_taxed`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `amount_taxed` AS select `cart`.`cart_id` AS `cart_id`,((`shoe`.`price` * `cart`.`item_qty`) + ((`shoe`.`price` * `cart`.`item_qty`) * 0.13)) AS `amount_owed` from (`cart` join `shoe`) where (`shoe`.`shoe_id` = `cart`.`item_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `distinct_cart_shoes`
--

/*!50001 DROP VIEW IF EXISTS `distinct_cart_shoes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `distinct_cart_shoes` AS select `c`.`item_id` AS `item_id` from (`cart` `c` join (select `cart`.`item_id` AS `item_id`,count(0) AS `cnt` from `cart` group by `cart`.`item_id`) `s` on((`c`.`item_id` = `s`.`item_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `highest_price`
--

/*!50001 DROP VIEW IF EXISTS `highest_price`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `highest_price` AS select `shoe`.`shoe_name` AS `shoe_name`,`shoe`.`price` AS `price` from `shoe` where (`shoe`.`price` = (select max(`shoe`.`price`) from `shoe` where (`shoe`.`stock` <> 0))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inventory`
--

/*!50001 DROP VIEW IF EXISTS `inventory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventory` AS select `a`.`stock` AS `stock`,`a`.`shoe_name` AS `shoe_name`,`a`.`price` AS `price` from `shoe` `a` where (`a`.`stock` = `a`.`stock`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `later_order`
--

/*!50001 DROP VIEW IF EXISTS `later_order`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `later_order` AS select `o`.`cust_id` AS `cust_id`,`o`.`order_id` AS `order_id` from `orders` `o` where ((`o`.`deliveredDate` - `o`.`expectedDate`) >= 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `num_users`
--

/*!50001 DROP VIEW IF EXISTS `num_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `num_users` AS select count(`customer`.`cust_id`) AS `‘num_users’` from `customer` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `order_record`
--

/*!50001 DROP VIEW IF EXISTS `order_record`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_record` AS select `a`.`cust_id` AS `cust_id`,`b`.`order_id` AS `order_id`,`c`.`payment_type` AS `payment_type` from ((`customer` `a` join `orders` `b`) join `pay_info` `c`) where ((`a`.`cust_id` = `b`.`cust_id`) and (`a`.`cust_id` = `c`.`cust_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `paid_users`
--

/*!50001 DROP VIEW IF EXISTS `paid_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paid_users` AS select `c`.`cust_username` AS `cust_username`,`c`.`cust_id` AS `cust_id`,`p`.`payment_type` AS `payment_type` from (`customer` `c` left join `pay_info` `p` on((`c`.`cust_id` = `p`.`cust_id`))) union select `c`.`cust_username` AS `cust_username`,`c`.`cust_id` AS `cust_id`,`p`.`payment_type` AS `payment_type` from (`pay_info` `p` left join `customer` `c` on((`c`.`cust_id` = `p`.`cust_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `percentage_late`
--

/*!50001 DROP VIEW IF EXISTS `percentage_late`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `percentage_late` AS select (count(0) / (select count(`o2`.`order_id`) from `orders` `o2`)) AS `percentage_late` from `orders` `o1` where ((`o1`.`deliveredDate` - `o1`.`expectedDate`) >= 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shoes_in_carts`
--

/*!50001 DROP VIEW IF EXISTS `shoes_in_carts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shoes_in_carts` AS select `s`.`shoe_name` AS `shoe_name`,`s`.`stock` AS `stock` from `shoe` `s` where `s`.`shoe_id` in (select `c`.`item_id` from `cart` `c` where (`c`.`item_qty` > 1)) group by `s`.`stock`,`s`.`shoe_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_cost`
--

/*!50001 DROP VIEW IF EXISTS `total_cost`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_cost` AS select `cart`.`cart_id` AS `cart_id`,(`shoe`.`price` * `cart`.`item_qty`) AS `total_cost` from (`cart` join `shoe`) where (`shoe`.`shoe_id` = `cart`.`item_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-23 23:44:14
