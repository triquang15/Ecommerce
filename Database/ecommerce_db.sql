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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-05 11:57:15
