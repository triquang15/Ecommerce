CREATE DATABASE  IF NOT EXISTS `ecommerce_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce_db`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_db
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Canada','Brazil','Acre','19111'),(2,'Ha Noi','Canada','Viet Nam','123456'),(3,'Canada','Brazil','Acre','19111'),(4,'Ha Noi','Canada','Viet Nam','123456'),(5,'Canada','Brazil','Acre','19111'),(6,'Ha Noi','Canada','Viet Nam','123456'),(7,'Ho Chi Minh',NULL,NULL,'12000'),(8,'Ho Chi Minh','Turkey','Bitlis','12000'),(9,'Lodon',NULL,NULL,'12345'),(10,'Lodon','Germany','Baden-Württemberg','12345'),(11,'Viet Nam',NULL,NULL,'123435'),(12,'Viet Nam','India','Andhra Pradesh','123435'),(13,'Ha Noi','Germany','Baden-Württemberg','123'),(14,'Ha Noi','Germany','Baden-Württemberg','123');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Python'),(2,'Java'),(3,'JavaScript'),(4,'C#');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'BR','Brazil'),(2,'CA','Canada'),(3,'DE','Germany'),(4,'IN','India'),(5,'TR','Turkey'),(6,'US','United States');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'triquang@gmail.com','Tri','Quang'),(2,'leo_messi@gmail.com','Leo','Messi'),(3,'quangtri.nguyen@dxc.com','Quang','Tri');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'assets/images/products/images/images1/jpg',26,1,18.99,1),(2,'assets/images/products/images/images1/jpg',51,1,17.99,1),(3,'assets/images/products/images/images1/jpg',26,1,18.99,2),(4,'assets/images/products/images/images1/jpg',51,1,17.99,2),(5,'assets/images/products/images/images1/jpg',51,1,17.99,3),(6,'assets/images/products/images/images1/jpg',26,1,18.99,3),(7,'assets/images/products/image1.jpg',1,1,19.99,4),(8,'assets/images/products/image16.jpg',16,1,99.90,5),(9,'assets/images/products/image17.jpg',17,1,125.90,5),(10,'assets/images/products/image1.jpg',1,1,19.99,5),(11,'assets/images/products/image15.jpg',15,1,29.90,5),(12,'assets/images/products/image16.jpg',16,1,99.90,6),(13,'assets/images/products/image15.jpg',15,1,29.90,6),(14,'assets/images/products/image3.jpg',3,1,99.00,6),(15,'assets/images/products/image11.jpg',11,1,29.90,7),(16,'assets/images/products/image10.jpg',10,3,299.90,7),(17,'assets/images/products/image1.jpg',1,1,19.99,7);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) DEFAULT NULL,
  `date_updated` datetime(6) DEFAULT NULL,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int NOT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqraecqgbbr1p37ic9dr44e2dr` (`billing_address_id`),
  KEY `FK624gtjin3po807j3vix093tlf` (`customer_id`),
  KEY `FKh0uue95ltjysfmkqb5abgk7tj` (`shipping_address_id`),
  CONSTRAINT `FK624gtjin3po807j3vix093tlf` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FKh0uue95ltjysfmkqb5abgk7tj` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKqraecqgbbr1p37ic9dr44e2dr` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2023-01-11 02:59:43.488000','2023-01-11 02:59:43.488000','683a7f57-fe88-415a-8261-eb4282bd43d6',NULL,36.98,2,1,1,2),(2,'2023-01-11 03:00:10.986000','2023-01-11 03:00:10.986000','37583dcd-845d-441b-a9fd-6e3e95d67480',NULL,36.98,2,3,1,4),(3,'2023-01-11 03:02:31.375000','2023-01-11 03:02:31.375000','19aff7e2-03ed-4248-be79-01ef3bef7827',NULL,36.98,2,5,2,6),(4,'2023-01-11 08:36:28.663000','2023-01-11 08:36:28.663000','6e0efe96-f33c-40a3-b338-43740841404f',NULL,19.99,1,7,3,8),(5,'2023-01-11 08:44:41.796000','2023-01-11 08:44:41.796000','86ce0bf7-cc9b-4b4e-957d-03185fb556ea',NULL,275.69,4,9,3,10),(6,'2023-01-11 09:57:46.382000','2023-01-11 09:57:46.382000','c706dcd1-8dc7-4728-9a88-3aa30ebe3460',NULL,228.80,3,11,3,12),(7,'2023-01-13 04:07:10.566000','2023-01-13 04:07:10.566000','cd3e5257-aff6-45aa-903c-07bc7a115367',NULL,949.59,5,13,3,14);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `units_in_stock` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,_binary '','2023-01-04 10:36:40.000000','Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!','assets/images/products/image1.jpg',NULL,'Python and Django Full Stack Web Developer Bootcamp','Python-1',19.99,100,1),(2,_binary '','2023-01-04 10:36:40.000000','Learn Java In This Course And Become a Computer Programmer. Obtain valuable Core Java Skills And Java Certification','assets/images/products/image2.jpg',NULL,'Java Programming Masterclass updated to Java 17','Java-1',39.89,27,2),(3,_binary '','2023-01-04 15:10:23.000000','Learn javascript online and supercharge your web design with this Javascript for beginners training course.','assets/images/products/image3.jpg',NULL,'Javascript for Beginners','Development',99.00,10,3),(4,_binary '','2023-01-04 15:11:52.000000','Learn C# Programming - WPF, Databases, Linq, Collections, Game Development with Unity. More than just the C# basics!','assets/images/products/image4.jpg',NULL,'Complete C# Masterclass','Development-3',99.49,15,4),(5,_binary '','2023-01-04 15:14:51.000000','Design & Develop Video Games. Learn C# in Unity Engine. Code Your first 3D Unity games for web, Mac & PC.','assets/images/products/image5.jpg',NULL,'Complete C# Unity Game Developer 3D','Development-3',199.00,25,4),(6,_binary '','2023-01-05 11:28:50.000000','Become Java Spring Boot Full Stack Cloud Developer. Learn AWS, React, Docker, Spring Data JPA & Spring Security.','assets/images/products/image6.jpg',NULL,'Master Spring Boot 3 & Spring Framework 6 with Java','Java-2',14.99,100,2),(7,_binary '','2023-01-05 11:32:27.000000','Spring 5: Learn Spring 5 Core, AOP, Spring MVC, Spring Security, Spring REST, Spring Boot 2, Thymeleaf, JPA & Hibernate','assets/images/products/image7.jpg',NULL,'Spring & Hibernate for Beginners','Java-3',14.99,100,2),(8,_binary '','2023-01-05 11:34:04.000000','Spring Security, SpringBoot Security, CORs, CSRF, JWT, OAUTH2, OpenID Connect, KeyCloak','assets/images/products/image8.jpg',NULL,'Spring Security Zero to Master along with JWT,OAUTH2','Java-3',14.99,100,2),(9,_binary '','2023-01-05 11:35:38.000000','Java Spring Boot Crash course simplified and designed with Queries and Database','assets/images/products/image9.jpg',NULL,'Spring Boot Crash Course- Spring And Hibernate for Beginners','Java-3',14.99,100,2),(10,_binary '','2023-01-05 11:38:04.000000','Master Python by building 100 projects in 100 days. Learn data science, automation, build websites, games and apps!','assets/images/products/image10.jpg',NULL,'100 Days of Code: The Complete Python Pro Bootcamp for 2023','Python-3',299.90,100,1),(11,_binary '','2023-01-05 11:39:57.000000','Learn to create Machine Learning Algorithms in Python and R from two Data Science experts. Code templates included.','assets/images/products/image11.jpg',NULL,'Machine Learning A-Z™: Python & R in Data Science','Python-3',29.90,100,1),(12,_binary '','2023-01-05 11:41:33.000000','Complete Data Science Training: Mathematics, Statistics, Python, Advanced Statistics in Python, Machine & Deep Learning','assets/images/products/image12.jpg',NULL,'The Data Science Course 2022: Complete Data Science Bootcamp','Python-3',29.90,100,1),(13,_binary '','2023-01-05 11:43:20.000000','The Complete Guide To Learn Data Analysis','assets/images/products/image13.jpg',NULL,'Data Analysis Nanodegree','Python-3',29.90,100,1),(14,_binary '','2023-01-05 11:45:30.000000','Learn to build websites with HTML , CSS , Bootstrap , Javascript , jQuery , Python 3 , and Django!','assets/images/products/image14.jpg',NULL,'Python and Django Full Stack Web Developer Bootcamp','Python-3',29.90,100,1),(15,_binary '','2023-01-05 11:47:48.000000','The modern JavaScript course for everyone! Master JavaScript with projects, challenges and theory. Many courses in one!','assets/images/products/image15.jpg',NULL,'The Complete JavaScript Course 2023: From Zero to Expert!','JavaScript-5',29.90,100,3),(16,_binary '','2023-01-05 11:48:54.000000','Master React and Redux Toolkit. Includes RTK Query, tons of custom hooks, and more! Course 100% Updated November 2022!','assets/images/products/image16.jpg',NULL,'Modern React with Redux','JavaScript-5',99.90,100,3),(17,_binary '','2023-01-05 11:50:17.000000','Angular (Angular 2+), React or Vue? Get a Crash Course on each of them and a detailed comparison!','assets/images/products/image17.jpg',NULL,'React JS, Angular & Vue JS - Quickstart & Comparison','JavaScript-5',125.90,100,3),(18,_binary '','2023-01-05 11:52:16.000000','The complete guide to building an app from start to finish using .Net 7.0, React 18 (with Typescript) and Mobx','assets/images/products/image18.jpg',NULL,'Complete guide to building an app with .Net Core and React','.NET',11.90,100,4),(19,_binary '','2023-01-05 11:54:09.000000','A walkthrough to create and run a minimal API with .NET 6 using C#','assets/images/products/image19.jpg',NULL,'A Minimal API with .NET 6 using C#','.NET',11.90,100,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Acre',1),(2,'Alagoas',1),(3,'Amapá',1),(4,'Amazonas',1),(5,'Bahia',1),(6,'Ceará',1),(7,'Distrito Federal',1),(8,'Espírito Santo',1),(9,'Goiás',1),(10,'Maranhão',1),(11,'Mato Grosso do Sul',1),(12,'Mato Grosso',1),(13,'Minas Gerais',1),(14,'Paraná',1),(15,'Paraíba',1),(16,'Pará',1),(17,'Pernambuco',1),(18,'Piaui',1),(19,'Rio de Janeiro',1),(20,'Rio Grande do Norte',1),(21,'Rio Grande do Sul',1),(22,'Rondônia',1),(23,'Roraima',1),(24,'Santa Catarina',1),(25,'Sergipe',1),(26,'São Paulo',1),(27,'Tocantins',1),(28,'Alberta',2),(29,'British Columbia',2),(30,'Manitoba',2),(31,'New Brunswick',2),(32,'Newfoundland and Labrador',2),(33,'Northwest Territories',2),(34,'Nova Scotia',2),(35,'Nunavut',2),(36,'Ontario',2),(37,'Prince Edward Island',2),(38,'Quebec',2),(39,'Saskatchewan',2),(40,'Yukon',2),(41,'Baden-Württemberg',3),(42,'Bavaria',3),(43,'Berlin',3),(44,'Brandenburg',3),(45,'Bremen',3),(46,'Hamburg',3),(47,'Hesse',3),(48,'Lower Saxony',3),(49,'Mecklenburg-Vorpommern',3),(50,'North Rhine-Westphalia',3),(51,'Rhineland-Palatinate',3),(52,'Saarland',3),(53,'Saxony',3),(54,'Saxony-Anhalt',3),(55,'Schleswig-Holstein',3),(56,'Thuringia',3),(57,'Andhra Pradesh',4),(58,'Arunachal Pradesh',4),(59,'Assam',4),(60,'Bihar',4),(61,'Chhattisgarh',4),(62,'Goa',4),(63,'Gujarat',4),(64,'Haryana',4),(65,'Himachal Pradesh',4),(66,'Jammu & Kashmir',4),(67,'Jharkhand',4),(68,'Karnataka',4),(69,'Kerala',4),(70,'Madhya Pradesh',4),(71,'Maharashtra',4),(72,'Manipur',4),(73,'Meghalaya',4),(74,'Mizoram',4),(75,'Nagaland',4),(76,'Odisha',4),(77,'Punjab',4),(78,'Rajasthan',4),(79,'Sikkim',4),(80,'Tamil Nadu',4),(81,'Telangana',4),(82,'Tripura',4),(83,'Uttar Pradesh',4),(84,'Uttarakhand',4),(85,'West Bengal',4),(86,'Andaman and Nicobar Islands',4),(87,'Chandigarh',4),(88,'Dadra and Nagar Haveli',4),(89,'Daman & Diu',4),(90,'Lakshadweep',4),(91,'Puducherry',4),(92,'The Government of NCT of Delhi',4),(93,'Alabama',6),(94,'Alaska',6),(95,'Arizona',6),(96,'Arkansas',6),(97,'California',6),(98,'Colorado',6),(99,'Connecticut',6),(100,'Delaware',6),(101,'District Of Columbia',6),(102,'Florida',6),(103,'Georgia',6),(104,'Hawaii',6),(105,'Idaho',6),(106,'Illinois',6),(107,'Indiana',6),(108,'Iowa',6),(109,'Kansas',6),(110,'Kentucky',6),(111,'Louisiana',6),(112,'Maine',6),(113,'Maryland',6),(114,'Massachusetts',6),(115,'Michigan',6),(116,'Minnesota',6),(117,'Mississippi',6),(118,'Missouri',6),(119,'Montana',6),(120,'Nebraska',6),(121,'Nevada',6),(122,'New Hampshire',6),(123,'New Jersey',6),(124,'New Mexico',6),(125,'New York',6),(126,'North Carolina',6),(127,'North Dakota',6),(128,'Ohio',6),(129,'Oklahoma',6),(130,'Oregon',6),(131,'Pennsylvania',6),(132,'Rhode Island',6),(133,'South Carolina',6),(134,'South Dakota',6),(135,'Tennessee',6),(136,'Texas',6),(137,'Utah',6),(138,'Vermont',6),(139,'Virginia',6),(140,'Washington',6),(141,'West Virginia',6),(142,'Wisconsin',6),(143,'Wyoming',6),(144,'Adıyaman',5),(145,'Afyonkarahisar',5),(146,'Ağrı',5),(147,'Aksaray',5),(148,'Amasya',5),(149,'Ankara',5),(150,'Antalya',5),(151,'Ardahan',5),(152,'Artvin',5),(153,'Aydın',5),(154,'Balıkesir',5),(155,'Bartın',5),(156,'Batman',5),(157,'Bayburt',5),(158,'Bilecik',5),(159,'Bingöl',5),(160,'Bitlis',5),(161,'Bolu',5),(162,'Burdur',5),(163,'Bursa',5),(164,'Çanakkale',5),(165,'Çankırı',5),(166,'Çorum',5),(167,'Denizli',5),(168,'Diyarbakır',5),(169,'Düzce',5),(170,'Edirne',5),(171,'Elazığ',5),(172,'Erzincan',5),(173,'Erzurum',5),(174,'Eskişehir',5),(175,'Gaziantep',5),(176,'Giresun',5),(177,'Gümüşhane',5),(178,'Hakkâri',5),(179,'Hatay',5),(180,'Iğdır',5),(181,'Isparta',5),(182,'İstanbul',5),(183,'İzmir',5),(184,'Kahramanmaraş',5),(185,'Karabük',5),(186,'Karaman',5),(187,'Kars',5),(188,'Kastamonu',5),(189,'Kayseri',5),(190,'Kırıkkale',5),(191,'Kırklareli',5),(192,'Kırşehir',5),(193,'Kilis',5),(194,'Kocaeli',5),(195,'Konya',5),(196,'Kütahya',5),(197,'Malatya',5),(198,'Manisa',5),(199,'Mardin',5),(200,'Mersin',5),(201,'Muğla',5),(202,'Muş',5),(203,'Nevşehir',5),(204,'Niğde',5),(205,'Ordu',5),(206,'Osmaniye',5),(207,'Rize',5),(208,'Sakarya',5),(209,'Samsun',5),(210,'Siirt',5),(211,'Sinop',5),(212,'Sivas',5),(213,'Şanlıurfa',5),(214,'Şırnak',5),(215,'Tekirdağ',5),(216,'Tokat',5),(217,'Trabzon',5),(218,'Tunceli',5),(219,'Uşak',5),(220,'Van',5),(221,'Yalova',5),(222,'Yozgat',5),(223,'Zonguldak',5);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-13 11:14:06
