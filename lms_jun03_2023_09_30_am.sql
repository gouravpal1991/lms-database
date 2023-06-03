CREATE DATABASE  IF NOT EXISTS `laundry` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laundry`;
-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: laundry
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `branchDeliverySetup`
--

DROP TABLE IF EXISTS `branchDeliverySetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branchDeliverySetup` (
  `setupId` int NOT NULL AUTO_INCREMENT,
  `branchId` int NOT NULL,
  `isPickupFree` tinyint(1) DEFAULT NULL,
  `pickupWithIn5Kms` double DEFAULT NULL,
  `pickupBetween5To10Kms` double DEFAULT NULL,
  `pickupBeyond10Kms` double DEFAULT NULL,
  `isDeliveryFree` tinyint(1) DEFAULT NULL,
  `deliveryWithIn5Kms` double DEFAULT NULL,
  `deliveryBetween5To10Kms` double DEFAULT NULL,
  `deliveryBeyond10Kms` double DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`setupId`),
  KEY `fk_branch_branchId` (`branchId`),
  CONSTRAINT `fk_branch_branchId` FOREIGN KEY (`branchId`) REFERENCES `laundryBranch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchDeliverySetup`
--

LOCK TABLES `branchDeliverySetup` WRITE;
/*!40000 ALTER TABLE `branchDeliverySetup` DISABLE KEYS */;
/*!40000 ALTER TABLE `branchDeliverySetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerId` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `photoUrl` varchar(250) DEFAULT NULL,
  `primaryPhone` varchar(100) DEFAULT NULL,
  `secondaryPhone` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `addressId` int NOT NULL AUTO_INCREMENT,
  `customerId` int NOT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `addressLine3` varchar(100) DEFAULT NULL,
  `lat` varchar(100) DEFAULT NULL,
  `long` varchar(100) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`addressId`),
  KEY `fk_address_custId` (`customerId`),
  CONSTRAINT `fk_address_custId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviceRegistration`
--

DROP TABLE IF EXISTS `deviceRegistration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deviceRegistration` (
  `deviceId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `customerId` int NOT NULL,
  `deviceUniqueId` varchar(100) NOT NULL,
  `token` int DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`deviceId`),
  KEY `fk_device_userId` (`userId`),
  KEY `fk_device_customerId` (`customerId`),
  CONSTRAINT `fk_device_customerId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_device_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviceRegistration`
--

LOCK TABLES `deviceRegistration` WRITE;
/*!40000 ALTER TABLE `deviceRegistration` DISABLE KEYS */;
/*!40000 ALTER TABLE `deviceRegistration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `empId` int NOT NULL AUTO_INCREMENT,
  `branchId` int NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `photoUrl` varchar(250) DEFAULT NULL,
  `photoIdUrl` varchar(250) DEFAULT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `addressLine3` varchar(100) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  `primaryPhone` varchar(100) DEFAULT NULL,
  `secondaryPhone` varchar(100) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`empId`),
  KEY `fk_employee_branchId` (`branchId`),
  CONSTRAINT `fk_employee_branchId` FOREIGN KEY (`branchId`) REFERENCES `laundryBranch` (`branchId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `imageUrl` varchar(150) DEFAULT NULL,
  `isActive` double DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundry`
--

DROP TABLE IF EXISTS `laundry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laundry` (
  `laundryId` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `imageUrl` varchar(250) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`laundryId`),
  KEY `fk_laundry_userId` (`userId`),
  CONSTRAINT `fk_laundry_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundry`
--

LOCK TABLES `laundry` WRITE;
/*!40000 ALTER TABLE `laundry` DISABLE KEYS */;
/*!40000 ALTER TABLE `laundry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundryBranch`
--

DROP TABLE IF EXISTS `laundryBranch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laundryBranch` (
  `branchId` int NOT NULL AUTO_INCREMENT,
  `laundryId` int NOT NULL,
  `imageUrl` varchar(250) DEFAULT NULL,
  `addressLine1` varchar(100) DEFAULT NULL,
  `addressLine2` varchar(100) DEFAULT NULL,
  `addressLine3` varchar(100) DEFAULT NULL,
  `lat` varchar(20) DEFAULT NULL,
  `long` varchar(20) DEFAULT NULL,
  `primaryPhone` varchar(100) DEFAULT NULL,
  `secondaryPhone` varchar(100) DEFAULT NULL,
  `openAt` varchar(100) DEFAULT NULL,
  `closeAt` varchar(20) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`branchId`),
  KEY `fk_branch_userId` (`laundryId`),
  CONSTRAINT `fk_branch_userId` FOREIGN KEY (`laundryId`) REFERENCES `laundry` (`laundryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundryBranch`
--

LOCK TABLES `laundryBranch` WRITE;
/*!40000 ALTER TABLE `laundryBranch` DISABLE KEYS */;
/*!40000 ALTER TABLE `laundryBranch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laundryType`
--

DROP TABLE IF EXISTS `laundryType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laundryType` (
  `typeId` int NOT NULL AUTO_INCREMENT,
  `itemId` int DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `actualPricePerQty` double DEFAULT NULL,
  `pricePerQty` double DEFAULT NULL,
  `discountPerQty` double DEFAULT NULL,
  `isActive` tinyint(1) DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`typeId`),
  KEY `fk_laundryType_itemId` (`itemId`),
  CONSTRAINT `fk_laundryType_itemId` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laundryType`
--

LOCK TABLES `laundryType` WRITE;
/*!40000 ALTER TABLE `laundryType` DISABLE KEYS */;
/*!40000 ALTER TABLE `laundryType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logger`
--

DROP TABLE IF EXISTS `logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logger` (
  `logId` int NOT NULL AUTO_INCREMENT,
  `logMessage` varchar(500) NOT NULL,
  `userId` int NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logId`),
  CONSTRAINT `fk_log_userId` FOREIGN KEY (`logId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logger`
--

LOCK TABLES `logger` WRITE;
/*!40000 ALTER TABLE `logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `orderDetailsId` int NOT NULL AUTO_INCREMENT,
  `orderId` int NOT NULL,
  `itemId` int NOT NULL,
  `quantity` int NOT NULL,
  `actualPricePerQty` double DEFAULT NULL,
  `pricePerQty` double DEFAULT NULL,
  `savingsPerQty` double DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderDetailsId`),
  KEY `fk_orderDetails_orderId` (`orderId`),
  KEY `fk_orderDetails_itemId` (`itemId`),
  CONSTRAINT `fk_orderDetails_itemId` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `fk_orderDetails_orderId` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `customerId` int DEFAULT NULL,
  `addressId` int DEFAULT NULL,
  `branchId` int DEFAULT NULL,
  `setupId` int DEFAULT NULL,
  `pickupBy` int DEFAULT NULL,
  `deliveryBy` int DEFAULT NULL,
  `customerAddress` varchar(250) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `totalOrderValue` double DEFAULT NULL,
  `taxes` double DEFAULT NULL,
  `pickupCharges` double DEFAULT NULL,
  `deliveryCharges` double DEFAULT NULL,
  `branchPackingCharges` double DEFAULT NULL,
  `totalSavings` double DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `deliveryDate` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_order_branchtId` (`customerId`),
  KEY `fk_order_branchId` (`branchId`),
  KEY `fk_order_addressId` (`addressId`),
  KEY `fk_order_setupId` (`setupId`),
  CONSTRAINT `fk_order_addressId` FOREIGN KEY (`addressId`) REFERENCES `customer_address` (`addressId`),
  CONSTRAINT `fk_order_branchId` FOREIGN KEY (`branchId`) REFERENCES `laundryBranch` (`branchId`),
  CONSTRAINT `fk_order_branchtId` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `fk_order_setupId` FOREIGN KEY (`setupId`) REFERENCES `branchDeliverySetup` (`setupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `userCategoryId` int NOT NULL,
  `phoneNo` varchar(100) NOT NULL,
  `countryCode` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `long` int DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userId`),
  KEY `fk_user_categoryId` (`userCategoryId`),
  CONSTRAINT `fk_user_categoryId` FOREIGN KEY (`userCategoryId`) REFERENCES `userCategory` (`userCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userCategory`
--

DROP TABLE IF EXISTS `userCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userCategory` (
  `userCategoryId` int NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(50) NOT NULL,
  `createdDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userCategoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userCategory`
--

LOCK TABLES `userCategory` WRITE;
/*!40000 ALTER TABLE `userCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `userCategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03  9:31:16
