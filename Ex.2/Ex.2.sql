CREATE DATABASE `Pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE DATABASE `Pizzeria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `City` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `Province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `adress` varchar(200) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `city_id` int NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Delivery` (
  `order_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `delivery_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `OrderTable` (`order_id`),
  CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nif` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('cook','delivery') NOT NULL,
  `store_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `Store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `OrderItem` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `OrderTable` (`order_id`),
  CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `OrderTable` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `client_id` int NOT NULL,
  `store_id` int NOT NULL,
  `order_datetime` datetime NOT NULL,
  `delivery_type` enum('home','pickup') NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `client_id` (`client_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `Client` (`client_id`),
  CONSTRAINT `ordertable_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `Store` (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `PizzaCategory` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `type` enum('pizza','burger','drink') NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `PizzaCategory` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Province` (
  `province_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `Store` (
  `store_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(200) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `city_id` int NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`store_id`),
  KEY `city_id` (`city_id`),
  KEY `province_id` (`province_id`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `City` (`city_id`),
  CONSTRAINT `store_ibfk_2` FOREIGN KEY (`province_id`) REFERENCES `Province` (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;