CREATE DATABASE `Optical` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE DATABASE `Optical` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `Client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `referred_by_client_id` int DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `referred_by_client_id` (`referred_by_client_id`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`referred_by_client_id`) REFERENCES `Client` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Glasses` (
  `glasses_id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(50) NOT NULL,
  `left_lens_prescription` float DEFAULT NULL,
  `right_lens_prescription` float DEFAULT NULL,
  `frame_type` enum('rimless','plastic','metal') DEFAULT NULL,
  `frame_color` varchar(30) DEFAULT NULL,
  `left_lens_color` varchar(30) DEFAULT NULL,
  `right_lens_color` varchar(30) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`glasses_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Sale` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `glasses_id` int DEFAULT NULL,
  `sale_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `client_id` (`client_id`),
  KEY `employee_id` (`employee_id`),
  KEY `glasses_id` (`glasses_id`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`),
  CONSTRAINT `sale_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  CONSTRAINT `sale_ibfk_3` FOREIGN KEY (`glasses_id`) REFERENCES `Glasses` (`glasses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `floor` varchar(10) DEFAULT NULL,
  `door` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `tax_id` varchar(20) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
