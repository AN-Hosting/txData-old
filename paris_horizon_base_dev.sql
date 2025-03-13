-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           10.11.6-MariaDB-0+deb12u1 - Debian 12
-- SE du serveur:                debian-linux-gnu
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour paris_horizon_base_dev
CREATE DATABASE IF NOT EXISTS `paris_horizon_base_dev` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `paris_horizon_base_dev`;

-- Listage de la structure de table paris_horizon_base_dev. apartments
DROP TABLE IF EXISTS `apartments`;
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.apartments : ~0 rows (environ)
DELETE FROM `apartments`;

-- Listage de la structure de table paris_horizon_base_dev. bank_accounts
DROP TABLE IF EXISTS `bank_accounts`;
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT NULL,
  `account_balance` int(11) NOT NULL DEFAULT 0,
  `account_type` enum('shared','job','gang') NOT NULL,
  `users` longtext DEFAULT '[]',
  `iban` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.bank_accounts : ~41 rows (environ)
DELETE FROM `bank_accounts`;
INSERT INTO `bank_accounts` (`id`, `citizenid`, `account_name`, `account_balance`, `account_type`, `users`, `iban`) VALUES
	(1, NULL, 'lawyer', 0, 'job', '[]', NULL),
	(2, NULL, 'mechanic3', 0, 'job', '[]', NULL),
	(3, NULL, 'bennys', 0, 'job', '[]', NULL),
	(4, NULL, 'hotdog', 0, 'job', '[]', NULL),
	(5, NULL, 'beeker', 0, 'job', '[]', NULL),
	(6, NULL, 'tow', 0, 'job', '[]', NULL),
	(7, NULL, 'ambulance', 6000, 'job', '[]', NULL),
	(8, NULL, 'trucker', 0, 'job', '[]', NULL),
	(9, NULL, 'mechanic', 0, 'job', '[]', NULL),
	(10, NULL, 'bus', 0, 'job', '[]', NULL),
	(11, NULL, 'mechanic2', 0, 'job', '[]', NULL),
	(12, NULL, 'unemployed', 0, 'job', '[]', NULL),
	(13, NULL, 'taxi', 0, 'job', '[]', NULL),
	(14, NULL, 'realestate', 0, 'job', '[]', NULL),
	(15, NULL, 'vineyard', 0, 'job', '[]', NULL),
	(16, NULL, 'judge', 0, 'job', '[]', NULL),
	(17, NULL, 'police', 0, 'job', '[]', NULL),
	(18, NULL, 'reporter', 0, 'job', '[]', NULL),
	(19, NULL, 'garbage', 0, 'job', '[]', NULL),
	(20, NULL, 'cardealer', 0, 'job', '[]', NULL),
	(21, NULL, 'pompiers_de_paris', 0, 'job', '[]', NULL),
	(22, NULL, 'avocats_de_paris', 0, 'job', '[]', NULL),
	(23, NULL, 'police_nationale', 0, 'job', '[]', NULL),
	(24, NULL, 'samu_75', 0, 'job', '[]', NULL),
	(25, NULL, 'casino', 0, 'job', '[]', NULL),
	(26, NULL, 'concessionnaire', 0, 'job', '[]', NULL),
	(27, NULL, 'midas', 0, 'job', '[]', NULL),
	(28, NULL, 'vinci', 0, 'job', '[]', NULL),
	(29, NULL, 'mairie', 0, 'job', '[]', NULL),
	(30, NULL, 'otacos', 0, 'job', '[]', NULL),
	(31, NULL, 'dir', 0, 'job', '[]', NULL),
	(32, NULL, 'brinks', 0, 'job', '[]', NULL),
	(33, NULL, 'vigneron', 0, 'job', '[]', NULL),
	(34, NULL, 'norauto', 0, 'job', '[]', NULL),
	(35, NULL, 'tabac', 0, 'job', '[]', NULL),
	(36, NULL, 'xpo', 0, 'job', '[]', NULL),
	(37, NULL, 'gendarmerie_nationale', 0, 'job', '[]', NULL),
	(38, NULL, 'tf1', 0, 'job', '[]', NULL),
	(39, NULL, 'burgerking', 0, 'job', '[]', NULL),
	(40, NULL, 'orpi', 0, 'job', '[]', 'FRORPI'),
	(41, NULL, 'kfc', 0, 'job', '[]', NULL),
	(42, NULL, 'pizza', 0, 'job', '[]', NULL);

-- Listage de la structure de table paris_horizon_base_dev. bank_statements
DROP TABLE IF EXISTS `bank_statements`;
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `account_name` varchar(50) DEFAULT 'checking',
  `amount` int(11) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `statement_type` enum('deposit','withdraw') DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.bank_statements : ~2 rows (environ)
DELETE FROM `bank_statements`;
INSERT INTO `bank_statements` (`id`, `citizenid`, `account_name`, `amount`, `reason`, `statement_type`, `date`) VALUES
	(1, NULL, 'ambulance', 2000, 'Player treatment', 'deposit', '2025-03-07 00:39:25'),
	(2, NULL, 'ambulance', 2000, 'Player treatment', 'deposit', '2025-03-07 00:50:44'),
	(3, NULL, 'ambulance', 2000, 'Player treatment', 'deposit', '2025-03-07 01:06:01');

-- Listage de la structure de table paris_horizon_base_dev. bans
DROP TABLE IF EXISTS `bans`;
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.bans : ~0 rows (environ)
DELETE FROM `bans`;

-- Listage de la structure de table paris_horizon_base_dev. crypto_transactions
DROP TABLE IF EXISTS `crypto_transactions`;
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(46) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.crypto_transactions : ~0 rows (environ)
DELETE FROM `crypto_transactions`;

-- Listage de la structure de table paris_horizon_base_dev. darkchat_messages
DROP TABLE IF EXISTS `darkchat_messages`;
CREATE TABLE IF NOT EXISTS `darkchat_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` text NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT '',
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.darkchat_messages : ~0 rows (environ)
DELETE FROM `darkchat_messages`;

-- Listage de la structure de table paris_horizon_base_dev. dealers
DROP TABLE IF EXISTS `dealers`;
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext DEFAULT NULL,
  `time` longtext DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealers : ~0 rows (environ)
DELETE FROM `dealers`;

-- Listage de la structure de table paris_horizon_base_dev. dealership_data
DROP TABLE IF EXISTS `dealership_data`;
CREATE TABLE IF NOT EXISTS `dealership_data` (
  `name` varchar(100) NOT NULL,
  `label` varchar(255) NOT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `owner_id` varchar(255) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `employee_commission` int(11) DEFAULT 10,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_data : ~7 rows (environ)
DELETE FROM `dealership_data`;
INSERT INTO `dealership_data` (`name`, `label`, `balance`, `owner_id`, `owner_name`, `employee_commission`) VALUES
	('air', '', 0, NULL, NULL, 10),
	('boats', '', 0, NULL, NULL, 10),
	('cergy', '', 1400000, 'AYN44292', 'Gino Blajou', 10),
	('evry', 'Evry', 665728, 'AYN44292', 'Gino Blajou', 20),
	('luxury', '', 0, NULL, NULL, 10),
	('paris', '', 14600, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 20),
	('pdm', '', 0, NULL, NULL, 10),
	('truck', '', 0, NULL, NULL, 10);

-- Listage de la structure de table paris_horizon_base_dev. dealership_dispveh
DROP TABLE IF EXISTS `dealership_dispveh`;
CREATE TABLE IF NOT EXISTS `dealership_dispveh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `coords` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_dispveh_dealership` (`dealership`),
  KEY `fk_dispveh_vehicle` (`vehicle`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_dispveh : ~4 rows (environ)
DELETE FROM `dealership_dispveh`;
INSERT INTO `dealership_dispveh` (`id`, `dealership`, `vehicle`, `color`, `coords`) VALUES
	(1, 'pdm', '1310', '1', '{"x":-47.87989807128906,"y":-1100.355712890625,"z":26.3372802734375,"w":160.90711975097657}'),
	(2, 'paris', '09tahoe', '1', '{"x":-176.34300231933595,"y":-1162.706298828125,"z":22.49333190917968,"w":39.16028213500976}'),
	(3, 'evry', '09tahoe', '1', '{"x":1114.5382080078126,"y":2647.5810546875,"z":38.50731658935547,"w":94.8672866821289}'),
	(4, 'evry', 'rs6', '4', '{"x":1108.1759033203126,"y":2647.78759765625,"z":38.69744110107422,"w":266.09130859375}'),
	(5, 'cergy', '09tahoe', '1', '{"x":-65.13169860839844,"y":6545.98681640625,"z":31.07624816894531,"w":268.214599609375}');

-- Listage de la structure de table paris_horizon_base_dev. dealership_employees
DROP TABLE IF EXISTS `dealership_employees`;
CREATE TABLE IF NOT EXISTS `dealership_employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `dealership` varchar(255) NOT NULL,
  `role` varchar(100) NOT NULL,
  `joined` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_employees_dealership` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_employees : ~4 rows (environ)
DELETE FROM `dealership_employees`;
INSERT INTO `dealership_employees` (`id`, `identifier`, `dealership`, `role`, `joined`) VALUES
	(1, 'AGM09146', 'evry', 'manager', '2025-03-08 23:08:00'),
	(3, 'AYN44292', 'evry', 'manager', '2025-03-10 14:46:37'),
	(4, 'AYN44292', 'cergy', 'manager', '2025-03-10 14:48:35'),
	(5, 'AGM09146', 'cergy', 'manager', '2025-03-10 14:49:31');

-- Listage de la structure de table paris_horizon_base_dev. dealership_orders
DROP TABLE IF EXISTS `dealership_orders`;
CREATE TABLE IF NOT EXISTS `dealership_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(100) NOT NULL,
  `dealership` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `delivery_time` int(11) NOT NULL,
  `order_created` datetime NOT NULL DEFAULT current_timestamp(),
  `fulfilled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `orders_vehicle_fk` (`vehicle`),
  KEY `orders_dealership_fk` (`dealership`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_orders : ~9 rows (environ)
DELETE FROM `dealership_orders`;
INSERT INTO `dealership_orders` (`id`, `vehicle`, `dealership`, `quantity`, `cost`, `delivery_time`, `order_created`, `fulfilled`) VALUES
	(1, '09tahoe', 'paris', 1, 14400, 1741466566, '2025-03-08 21:41:46', 1),
	(2, '1310', 'evry', 2, 19200, 1741471894, '2025-03-08 23:10:34', 1),
	(3, 'rs6', 'evry', 1, 360000, 1741472565, '2025-03-08 23:21:45', 1),
	(4, '09tahoe', 'evry', 8, 115200, 1741472885, '2025-03-08 23:27:05', 1),
	(5, 'rs6', 'evry', 2, 720000, 1741472890, '2025-03-08 23:27:10', 1),
	(6, '09tahoe', 'cergy', 4, 57600, 1741717938, '2025-03-11 19:31:18', 1),
	(7, '1310', 'cergy', 4, 38400, 1741717941, '2025-03-11 19:31:21', 1),
	(8, 'm3e92', 'cergy', 4, 64000, 1741717946, '2025-03-11 19:31:26', 1),
	(9, 'rs6', 'cergy', 4, 1440000, 1741717949, '2025-03-11 19:31:29', 1);

-- Listage de la structure de table paris_horizon_base_dev. dealership_sales
DROP TABLE IF EXISTS `dealership_sales`;
CREATE TABLE IF NOT EXISTS `dealership_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(255) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `player` varchar(255) NOT NULL,
  `seller` varchar(255) DEFAULT NULL,
  `purchase_type` varchar(50) NOT NULL,
  `paid` float NOT NULL DEFAULT 0,
  `owed` float NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_sales_vehicle` (`vehicle`),
  KEY `fk_sales_dealership` (`dealership`),
  KEY `fk_sales_player` (`player`),
  KEY `fk_sales_plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_sales : ~4 rows (environ)
DELETE FROM `dealership_sales`;
INSERT INTO `dealership_sales` (`id`, `dealership`, `vehicle`, `plate`, `player`, `seller`, `purchase_type`, `paid`, `owed`, `created_at`) VALUES
	(1, 'evry', '1310', '0ZH114LB', 'AYN44292', 'AGM09146', 'full', 12000, 0, '2025-03-08 23:13:26'),
	(2, 'evry', 'rs6', '9AJ909WP', 'AGM09146', 'AYN44292', 'full', 450000, 0, '2025-03-08 23:24:18'),
	(3, 'evry', '1310', '5YE617DK', 'UYK15733', 'AGM09146', 'finance', 3168, 10032, '2025-03-08 23:28:57'),
	(4, 'evry', 'rs6', '2UX364WY', 'UYK15733', 'AGM09146', 'full', 450000, 0, '2025-03-09 23:03:58');

-- Listage de la structure de table paris_horizon_base_dev. dealership_stock
DROP TABLE IF EXISTS `dealership_stock`;
CREATE TABLE IF NOT EXISTS `dealership_stock` (
  `dealership` varchar(100) NOT NULL,
  `vehicle` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`dealership`,`vehicle`),
  KEY `vehicle_fk` (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_stock : ~10 rows (environ)
DELETE FROM `dealership_stock`;
INSERT INTO `dealership_stock` (`dealership`, `vehicle`, `stock`, `price`) VALUES
	('cergy', '09tahoe', 4, 18000),
	('cergy', '1310', 4, 12000),
	('cergy', 'm3e92', 4, 20000),
	('cergy', 'rs6', 4, 450000),
	('evry', '09tahoe', 8, 18000),
	('evry', '1310', 0, 12000),
	('evry', 'm3e92', 0, 20000),
	('evry', 'rs6', 1, 450000),
	('paris', '09tahoe', 1, 18000),
	('paris', '1310', 0, 12000),
	('paris', 'm3e92', 0, 20000),
	('paris', 'rs6', 0, 450000);

-- Listage de la structure de table paris_horizon_base_dev. dealership_vehicles
DROP TABLE IF EXISTS `dealership_vehicles`;
CREATE TABLE IF NOT EXISTS `dealership_vehicles` (
  `spawn_code` varchar(100) NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `hashkey` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`spawn_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_vehicles : ~292 rows (environ)
DELETE FROM `dealership_vehicles`;
INSERT INTO `dealership_vehicles` (`spawn_code`, `brand`, `model`, `hashkey`, `category`, `price`, `created_at`) VALUES
	('09tahoe', 'Chevrolet', '2009 Tahoe', '2029533781', 'chevrolet', 18000, '2025-03-08 21:40:29'),
	('1310', 'Dacia', '1310 2001', '1822975256', 'dacia', 12000, '2025-03-08 21:40:29'),
	('15tahoe', 'Chevrolet', '2015 Tahoe', '216954982', 'chevrolet', 10000, '2025-03-08 21:40:29'),
	('16challenger', 'Dodge', '2016 Challenger', '-216150906', 'dodge', 12000, '2025-03-08 21:40:29'),
	('16charger', 'Dodge', '2016 Charger', '-1513691047', 'dodge', 45000, '2025-03-08 21:40:29'),
	('17silv', 'Norauto', '17silv', '1987735581', 'norauto', 220000, '2025-03-08 21:40:29'),
	('180sx', 'Nissan', '180SX Type-X', '-1467569396', 'nissan', 95000, '2025-03-08 21:40:28'),
	('2020ss', 'Chevrolet', '2020 Camaro SS', '-1942383131', 'chevrolet', 10000, '2025-03-08 21:40:28'),
	('208bana', 'Banaliser', '208bana', '-1482365535', 'banaliser', 220000, '2025-03-08 21:40:29'),
	('20fttrailer', 'Midas', '20fttrailer', '719899143', 'midas', 220000, '2025-03-08 21:40:29'),
	('3082022bana', 'Banaliser', '3082022bana', '-975362044', 'banaliser', 220000, '2025-03-08 21:40:29'),
	('488', 'Ferrari', '488 Spider', '-127896429', 'ferrari', 10800, '2025-03-08 21:40:29'),
	('50082021pn', 'PN', '50082021pn', '2050905345', 'police_national', 220000, '2025-03-08 21:40:29'),
	('5008bana', 'Banaliser', '5008bana', '-372847447', 'banaliser', 220000, '2025-03-08 21:40:29'),
	('5008samu75', 'Samu', '5008samu75', '1620436109', 'samu', 220000, '2025-03-08 21:40:29'),
	('508bana', 'Banaliser', '508bana', '-619018091', 'banaliser', 220000, '2025-03-08 21:40:28'),
	('650s', 'Mclaren', '650S Coupe', '-2076784418', 'mclaren', 45000, '2025-03-08 21:40:29'),
	('675lt', 'Mclaren', '2016 675LT Coupe', '-1088481501', 'mclaren', 120000, '2025-03-08 21:40:29'),
	('718caymans', 'Porsche', '718 Cayman S', '-1393620193', 'porsche', 80000, '2025-03-08 21:40:29'),
	('720s', 'Mclaren', '2017 720S', '-1370111350', 'mclaren', 8000, '2025-03-08 21:40:29'),
	('760li04', 'BMW', '2004 760Li Individual (E66/PFL)', '1302012179', 'bmw', 40000, '2025-03-08 21:40:29'),
	('84rx7k', 'Mazda', '1984 RX-7 Stanced Version', '291607896', 'mazda', 65000, '2025-03-08 21:40:29'),
	('99viper', 'Dodge', '1999 Viper GTS ACR', '726460559', 'dodge', 6500, '2025-03-08 21:40:29'),
	('aaq4', 'Audi', '2017 A4 Quattro ABT', '-985643932', 'audi', 24000, '2025-03-08 21:40:29'),
	('agerars', 'Koenigsegg', '2017 Agera RS', '-654239719', 'koenigsegg', 40000, '2025-03-08 21:40:29'),
	('amarok', 'Volkswagen', '2018 Amarok V6', '493030188', 'volkswagen', 375000, '2025-03-08 21:40:29'),
	('ambulance', 'Samu', 'ambulance', '1171614426', 'samu', 220000, '2025-03-08 21:40:28'),
	('amdbx', 'Aston', 'Aston Martin DBX Carbon Edition', '-1799332707', 'aston', 24000, '2025-03-08 21:40:29'),
	('amggtrr20', 'Mercedes', '2020 AMG GT-R Roadster', '-1394302834', 'mercedes', 60000, '2025-03-08 21:40:28'),
	('ap2', 'Honda', 'S2000 AP2', '-1549019518', 'honda', 45000, '2025-03-08 21:40:29'),
	('as350gn', 'GN', 'as350gn', '766615453', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('ast', 'Aston', '2013 Aston Martin Vanquish', '-1865955898', 'aston', 24000, '2025-03-08 21:40:29'),
	('b110', 'GN', 'b110', '53898990', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('bbentayga', 'Bentley', 'Bentayga', '1402024844', 'bentley', 20000, '2025-03-08 21:40:28'),
	('bearcat', 'RAID', 'bearcat', '-1574893700', 'raid', 220000, '2025-03-08 21:40:29'),
	('bmci', 'BMW', '2018 M5 F90', '1093697054', 'bmw', 20000, '2025-03-08 21:40:29'),
	('bmwsamu75', 'Samu', 'bmwsamu75', '-1809138417', 'samu', 220000, '2025-03-08 21:40:28'),
	('bolide', 'Bugatti', '2020 Bolide', '1975081724', 'bugatti', 12500, '2025-03-08 21:40:28'),
	('bsppccf', 'Pompier', 'bsppccf', '-1803008261', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppccfl', 'Pompier', 'bsppccfl', '-857157168', 'pompier', 220000, '2025-03-08 21:40:28'),
	('bsppfpt', 'Pompier', 'bsppfpt', '985557210', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppfptl', 'Pompier', 'bsppfptl', '-2053763556', 'pompier', 220000, '2025-03-08 21:40:28'),
	('bsppgrimp', 'Pompier', 'bsppgrimp', '561580686', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppmaster2', 'Pompier', 'bsppmaster2', '-130221594', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppmaster3', 'Pompier', 'bsppmaster3', '2105672818', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppmaster4', 'Pompier', 'bsppmaster4', '-1902074193', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bspppc', 'Pompier', 'bspppc', '1837912852', 'pompier', 220000, '2025-03-08 21:40:28'),
	('bsppps', 'Pompier', 'bsppps', '1365678797', 'pompier', 220000, '2025-03-08 21:40:29'),
	('bsppvps', 'Pompier', 'bsppvps', '-1841744561', 'pompier', 220000, '2025-03-08 21:40:28'),
	('c4bana', 'Banaliser', 'c4bana', '1982863875', 'banaliser', 220000, '2025-03-08 21:40:29'),
	('c6320', 'Mercedes', '2020 C63s', '-1079976045', 'mercedes', 80000, '2025-03-08 21:40:29'),
	('c7', 'Chevrolet', '2014 Corvette C7 Stingray', '874739883', 'chevrolet', 29000, '2025-03-08 21:40:28'),
	('cam8tun', 'Toyota', '2018 Camry XSE', '-1890188908', 'toyota', 70000, '2025-03-08 21:40:29'),
	('camrs17', 'Chevrolet', '2017 Camaro RS', '-1318923904', 'chevrolet', 12000, '2025-03-08 21:40:28'),
	('cats', 'Cadillac', '2016 ATS-V Coupe', '1725614162', 'cadillac', 7200, '2025-03-08 21:40:29'),
	('cberlingo_cyno-gn', 'GN', 'cberlingo_cyno-gn', '-1925497266', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('cesc21', 'Cadillac', '2021 Escalade', '1701712977', 'cadillac', 8000, '2025-03-08 21:40:28'),
	('cgt', 'Porsche', '2003 Carrera GT (980)', '-1716760427', 'porsche', 38500, '2025-03-08 21:40:29'),
	('cgts', 'Bentley', '2020 Continental GT Convertible', '-193081966', 'bentley', 30000, '2025-03-08 21:40:29'),
	('chr20', 'Dodge', '2021 Charger Hellcat Widebody', '691582755', 'dodge', 13000, '2025-03-08 21:40:29'),
	('chrono1', 'Chronopost', 'chrono1', '-434147880', 'chronopost', 220000, '2025-03-08 21:40:29'),
	('chrono2', 'Chronopost', 'chrono2', '-740964027', 'chronopost', 220000, '2025-03-08 21:40:29'),
	('cit2cv', 'Citroen', '2 chevaux', '1113184459', 'citroen', 18000, '2025-03-08 21:40:28'),
	('corvettec5z06', 'Chevrolet', 'Corvette C5 Z06', '-1295717775', 'chevrolet', 32000, '2025-03-08 21:40:29'),
	('cp9a', 'Mitsubishi', 'Lancer Evo VI T.M.E (CP9A)', '383323718', 'mitsubishi', 32000, '2025-03-08 21:40:28'),
	('crsb', 'PN', 'crsb', '-1946200835', 'police_national', 220000, '2025-03-08 21:40:29'),
	('cutlass', 'Dacia', 'logan pickup ', '-1426878004', 'dacia', 12000, '2025-03-08 21:40:29'),
	('czr1', 'Chevrolet', '2009 Corvette ZR1', '796303759', 'chevrolet', 19000, '2025-03-08 21:40:29'),
	('dawnonyx', 'Rollsroyce', '2016 Dawn Onyx', '2076472358', 'rollsroyce', 38000, '2025-03-08 21:40:29'),
	('dduster_gn', 'GN', 'dduster_gn', '500317520', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('demon', 'Dodge', '2018 Challenger SRT Demon', '885421525', 'dodge', 18000, '2025-03-08 21:40:28'),
	('depanneuse', 'Norauto', 'depanneuse', '161261176', 'norauto', 220000, '2025-03-08 21:40:29'),
	('dir1', 'DIR', 'dir1', '-1953942489', 'dir', 220000, '2025-03-08 21:40:29'),
	('dir10', 'DIR', 'dir10', '1915419005', 'dir', 220000, '2025-03-08 21:40:28'),
	('dir11', 'DIR', 'dir11', '1147674104', 'dir', 220000, '2025-03-08 21:40:29'),
	('dir2', 'DIR', 'dir2', '-1466438076', 'dir', 220000, '2025-03-08 21:40:28'),
	('dir3', 'DIR', 'dir3', '-1765127511', 'dir', 220000, '2025-03-08 21:40:28'),
	('dir4', 'DIR', 'dir4', '-982931473', 'dir', 220000, '2025-03-08 21:40:28'),
	('dir5', 'DIR', 'dir5', '1875508397', 'dir', 220000, '2025-03-08 21:40:29'),
	('dir7', 'DIR', 'dir7', '-1953188798', 'dir', 220000, '2025-03-08 21:40:29'),
	('dir9', 'DIR', 'dir9', '684748475', 'dir', 220000, '2025-03-08 21:40:29'),
	('DRAP', 'GN', 'DRAP', '-943406670', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('dusterpn', 'PN', 'dusterpn', '-1147237868', 'police_national', 220000, '2025-03-08 21:40:29'),
	('e34', 'BMW', '1995 BMW M5 E34', '-1831563210', 'bmw', 15500, '2025-03-08 21:40:29'),
	('e400', 'Mercedes', '2019 E400 Coupe 4matic (C238)', '1075154240', 'mercedes', 32000, '2025-03-08 21:40:29'),
	('ec135samu', 'Samu', 'ec135samu', '-1783956271', 'samu', 220000, '2025-03-08 21:40:29'),
	('ec145gn', 'GN', 'ec145gn', '589642859', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('egolfpn', 'PN', 'egolfpn', '-152713839', 'police_national', 220000, '2025-03-08 21:40:29'),
	('esprit02', 'Lotus', '2002 Esprit V8', '-11497678', 'lotus', 20000, '2025-03-08 21:40:29'),
	('f150', 'Ford', '2012 F150 SVT Raptor R', '-1304790695', 'ford', 130000, '2025-03-08 21:40:29'),
	('f430s', 'Ferrari', 'F430 Scuderia', '-1567297735', 'ferrari', 14500, '2025-03-08 21:40:29'),
	('f450s', 'Norauto', 'f450s', '1945094768', 'norauto', 220000, '2025-03-08 21:40:29'),
	('f550rbc', 'Norauto', 'f550rbc', '1317757953', 'norauto', 220000, '2025-03-08 21:40:29'),
	('f812', 'Ferrari', '812 Superfast', '1127414868', 'ferrari', 5500, '2025-03-08 21:40:29'),
	('fc3s', 'Mazda', 'RX7 FC3S', '3467202', 'mazda', 12000, '2025-03-08 21:40:29'),
	('fct', 'Ferrari', 'California T', '-784906648', 'ferrari', 55000, '2025-03-08 21:40:29'),
	('ffocus3sw_gn', 'GN', 'ffocus3sw_gn', '121114883', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('fgt', 'Ford', '2005 GT', '1315816827', 'ford', 30000, '2025-03-08 21:40:29'),
	('firetruk', 'PN', 'firetruk', '1938952078', 'police_national', 220000, '2025-03-08 21:40:29'),
	('fjr1300gn', 'GN', 'fjr1300gn', '1787483059', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('fk8', 'Honda', '2018 Civic Type-R (FK8)', '-1745789659', 'honda', 60000, '2025-03-08 21:40:29'),
	('fpacehm', 'Jaguar', 'F-pace 2017 Hamann Edition', '-1919297986', 'jaguar', 50000, '2025-03-08 21:40:29'),
	('franger_pghm-gn', 'GN', 'franger_pghm-gn', '2013106451', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('Fs_cliovinci', 'Vinci', 'Fs_cliovinci', '-992714487', 'vinci', 220000, '2025-03-08 21:40:29'),
	('Fs_mastervinci', 'Vinci', 'Fs_mastervinci', '-1566968346', 'vinci', 220000, '2025-03-08 21:40:29'),
	('Fs_rapsnowvinci', 'Vinci', 'Fs_rapsnowvinci', '1528005239', 'vinci', 220000, '2025-03-08 21:40:29'),
	('Fs_riftervinci', 'Vinci', 'Fs_riftervinci', '-1628796923', 'vinci', 220000, '2025-03-08 21:40:29'),
	('Fs_scaniavinci', 'Vinci', 'Fs_scaniavinci', '-2069611162', 'vinci', 220000, '2025-03-08 21:40:28'),
	('Fs_snowtruckvinci', 'Vinci', 'Fs_snowtruckvinci', '1612416758', 'vinci', 220000, '2025-03-08 21:40:29'),
	('Fs_transitvinci', 'Vinci', 'Fs_transitvinci', '538048076', 'vinci', 220000, '2025-03-08 21:40:28'),
	('fto', 'Nitsubishi', 'FTO GP Version-R', '-1837978521', 'mitsubishi', 40000, '2025-03-08 21:40:29'),
	('fxxk', 'Ferrari', 'FXX-K Hybrid Hypercar', '1200120654', 'ferrari', 8500, '2025-03-08 21:40:29'),
	('G65', 'Mercedes', '2013 G65 AMG', '178350184', 'mercedes', 55000, '2025-03-08 21:40:29'),
	('galaxypn', 'PN', 'galaxypn', '-957449531', 'police_national', 220000, '2025-03-08 21:40:29'),
	('gl63', 'Mercedes', 'GL63 AMG', '1382221388', 'mercedes', 40000, '2025-03-08 21:40:29'),
	('golfgti7', 'Volkswagen', '2015 Golf GTI MK7', '-2018557295', 'volkswagen', 375000, '2025-03-08 21:40:29'),
	('gs350', 'Lexus', 'GS 350', '-940807017', 'lexus', 30000, '2025-03-08 21:40:29'),
	('gsxr19', 'Suzuki', '2019 GSX-R1000R', '-1269329530', 'suzuki', 28000, '2025-03-08 21:40:29'),
	('gt17', 'Ford', '2017 GT', '-2011325074', 'ford', 4000, '2025-03-08 21:40:29'),
	('gtr', 'Nissan', '2017 GTR', '-1752116803', 'nissan', 125000, '2025-03-08 21:40:29'),
	('gtr96', 'Mclaren', '1996 F1 GTR', '-234577516', 'mclaren', 45000, '2025-03-08 21:40:28'),
	('gtrc', 'Nissan', '2017 R35 GTR Convertible', '-1384177335', 'nissan', 36000, '2025-03-08 21:40:29'),
	('honcrx91', 'Honda', 'CRX SiR 1991', '487628275', 'honda', 55000, '2025-03-08 21:40:29'),
	('huracanst', 'Lamborghini', 'Huracan Super Trofeo', '2041307381', 'lamborghini', 29000, '2025-03-08 21:40:28'),
	('i8', 'BMW', '2015 i8 (I12)', '1718441594', 'bmw', 20000, '2025-03-08 21:40:29'),
	('idaily_gn', 'GN', 'idaily_gn', '-1098984824', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('is350mod', 'Lexus', '2014 IS 350', '761919778', 'lexus', 40000, '2025-03-08 21:40:29'),
	('it18', 'ItalDesign', '2017 Zerouno', '1835697308', 'italdesign', 17000, '2025-03-08 21:40:28'),
	('jeep2012', 'Jeep', '2012 Wrangler', '-1691715558', 'jeep', 47500, '2025-03-08 21:40:29'),
	('jeepreneg', 'Jeep', 'Renegade', '-1246383966', 'jeep', 40000, '2025-03-08 21:40:28'),
	('katana2', 'Suzuki', '2019 Katana', '303432435', 'suzuki', 35000, '2025-03-08 21:40:29'),
	('kev', 'Cadillac', 'CTSV 2012', '525782703', 'cadillac', 8000, '2025-03-08 21:40:29'),
	('laferrari', 'Ferrari', 'LaFerrari', '-548280172', 'ferrari', 12000, '2025-03-08 21:40:29'),
	('lambose', 'Lamborghini', 'Sesto Elemento', '-626024238', 'lamborghini', 45000, '2025-03-08 21:40:29'),
	('levante', 'Maserati', 'Levante', '468704959', 'maserati', 75000, '2025-03-08 21:40:29'),
	('logan', 'Dacia', '2008 Logan', '-701405977', 'dacia', 12000, '2025-03-08 21:40:29'),
	('lp670sv', 'Lamborghini', '2009 Murcielago LP 670-4 SV', '344199304', 'lamborghini', 25000, '2025-03-08 21:40:28'),
	('lp700r', 'Lamborghini', '2013 Aventador LP700-4 Roadster', '949614817', 'lamborghini', 32000, '2025-03-08 21:40:28'),
	('lykan', 'WMotors', 'Lykan HyperSport', '2005386580', 'wmotors', 185000, '2025-03-08 21:40:29'),
	('m2', 'BMW', '2016 M2', '-1313740730', 'bmw', 12500, '2025-03-08 21:40:29'),
	('m3e36', 'BMW', '1997 M3 E36', '-1127249378', 'bmw', 18000, '2025-03-08 21:40:29'),
	('m3e92', 'BMW', '2008 M3 e92', '708207258', 'bmw', 20000, '2025-03-08 21:40:29'),
	('m3f80', 'BMW', '2015 M3 (F80)', '-580610645', 'bmw', 25000, '2025-03-08 21:40:28'),
	('m4f82', 'BMW', '2015 M4 F82', '909765281', 'bmw', 11500, '2025-03-08 21:40:29'),
	('m6f13', 'BMW', 'M6 F13 Shadow Line', '1897898727', 'bmw', 16000, '2025-03-08 21:40:28'),
	('m6prior', 'BMW', 'M6 PRIOR', '-407186207', 'bmw', 15500, '2025-03-08 21:40:29'),
	('maj350', 'Nissan', 'Fairlady Z Z33', '1810239784', 'nissan', 45000, '2025-03-08 21:40:29'),
	('maj935', 'Porsche', '1978 935 Moby Dick', '1430426251', 'porsche', 65000, '2025-03-08 21:40:29'),
	('majfd', 'Mazda', 'RX-7 FD', '-147717767', 'mazda', 16000, '2025-03-08 21:40:29'),
	('mbc63', 'Mercedes', '2012 C63 AMG Coupe Black Series', '-1406469014', 'mercedes', 42000, '2025-03-08 21:40:29'),
	('mcst', 'Mclaren', '2020 Speedtail', '-1837375955', 'mclaren', 35000, '2025-03-08 21:40:29'),
	('megane3bana', 'Banaliser', 'megane3bana', '-249040995', 'banaliser', 220000, '2025-03-08 21:40:28'),
	('mi3', 'Midas', 'mi3', '956947176', 'midas', 220000, '2025-03-08 21:40:28'),
	('mi4', 'Midas', 'mi4', '1136652372', 'midas', 220000, '2025-03-08 21:40:29'),
	('miata3', 'Mazda', '1989 Miata NA', '-1135287548', 'mazda', 6500, '2025-03-08 21:40:29'),
	('midas1', 'Midas', 'midas1', '-1641245298', 'midas', 220000, '2025-03-08 21:40:28'),
	('midas2', 'Midas', 'midas2', '1024217935', 'midas', 220000, '2025-03-08 21:40:29'),
	('midas3', 'Midas', 'midas3', '1331492848', 'midas', 220000, '2025-03-08 21:40:29'),
	('midas4', 'Midas', 'midas4', '-530179580', 'midas', 220000, '2025-03-08 21:40:29'),
	('midas5', 'Midas', 'midas5', '-223101281', 'midas', 220000, '2025-03-08 21:40:28'),
	('mig', 'Ferrari', 'Enzo', '669333619', 'ferrari', 6500, '2025-03-08 21:40:28'),
	('mk2100', 'Toyota', 'Mark II JZX100', '-1503289273', 'toyota', 90000, '2025-03-08 21:40:28'),
	('models', 'Tesla', '2016 Model S P90D', '-252836656', 'tesla', 39500, '2025-03-08 21:40:29'),
	('mp412c', 'Mclaren', 'MP4-12C', '-640306883', 'mclaren', 55000, '2025-03-08 21:40:29'),
	('mt09pn', 'PN', 'mt09pn', '43494928', 'police_national', 220000, '2025-03-08 21:40:28'),
	('na1', 'Honda', '1992 NSX-R (NA1)', '871327565', 'honda', 70000, '2025-03-08 21:40:28'),
	('na6', 'Mazda', 'MX-5 Miata (NA6C)', '-1539291163', 'mazda', 8500, '2025-03-08 21:40:29'),
	('nis15', 'Nissan', 'Silvia S15 Spec-R', '1132804740', 'nissan', 65000, '2025-03-08 21:40:29'),
	('nissantitan17', 'Nissan', '2017 Titan Warrior', '1221510024', 'nissan', 80000, '2025-03-08 21:40:29'),
	('no1', 'Norauto', 'no1', '1220410601', 'norauto', 220000, '2025-03-08 21:40:28'),
	('no2', 'Norauto', 'no2', '913528916', 'norauto', 220000, '2025-03-08 21:40:29'),
	('no3', 'Norauto', 'no3', '1237253863', 'norauto', 220000, '2025-03-08 21:40:29'),
	('no4', 'Norauto', 'no4', '930110026', 'norauto', 220000, '2025-03-08 21:40:29'),
	('no5', 'Norauto', 'no5', '-583031314', 'norauto', 220000, '2025-03-08 21:40:28'),
	('no6', 'Norauto', 'no6', '-892731133', 'norauto', 220000, '2025-03-08 21:40:28'),
	('norauto1', 'Norauto', 'norauto1', '-721509176', 'norauto', 220000, '2025-03-08 21:40:29'),
	('ns350', 'Nissan', '350z Stardast', '-1195532806', 'nissan', 60000, '2025-03-08 21:40:29'),
	('nzp', 'Nissan', '370z Pandem', '995682231', 'nissan', 70000, '2025-03-08 21:40:29'),
	('ocnetrongt', 'Audi', 'E-TRON GT', '1125354406', 'audi', 125000, '2025-03-08 21:40:28'),
	('ocni422spe', 'BMW', 'i4', '958633118', 'bmw', 15500, '2025-03-08 21:40:29'),
	('p5008_gn', 'GN', 'p5008_gn', '1541821347', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('p508gt_ban-gn', 'GN', 'p508gt_ban-gn', '-922214860', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('p90d', 'Tesla', 'Model X Performance', '-1672062838', 'tesla', 50000, '2025-03-08 21:40:28'),
	('partnertepeepn', 'PN', 'partnertepeepn', '-1405194108', 'police_national', 220000, '2025-03-08 21:40:29'),
	('passat', 'Volkswagen', '2016 Passat B8', '-1773424714', 'volkswagen', 375000, '2025-03-08 21:40:29'),
	('passatbana', 'Banaliser', 'passatbana', '-530641600', 'banaliser', 220000, '2025-03-08 21:40:29'),
	('pcmsamu', 'Samu', 'pcmsamu', '-954079805', 'samu', 220000, '2025-03-08 21:40:29'),
	('pcs18', 'Porsche', '2018 Cayenne S', '-932637740', 'porsche', 65000, '2025-03-08 21:40:29'),
	('pexpert12_gn', 'GN', 'pexpert12_gn', '349233646', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('pexpert17_gn', 'GN', 'pexpert17_gn', '755302998', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('pm19', 'Porsche', '2019 Macan Turbo', '-1560751994', 'porsche', 55000, '2025-03-08 21:40:29'),
	('police3', 'DIR', 'police3', '1912215274', 'dir', 220000, '2025-03-08 21:40:29'),
	('policet', 'PN', 'policet', '456714581', 'police_national', 220000, '2025-03-08 21:40:29'),
	('police_sf90', 'PN', 'police_sf90', '525566106', 'police_national', 220000, '2025-03-08 21:40:29'),
	('ppartner12_gn', 'GN', 'ppartner12_gn', '-1277645020', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('ppartner18_gn', 'GN', 'ppartner18_gn', '-1370629502', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('prifter_gn', 'GN', 'prifter_gn', '1333306424', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('q820', 'Audi', '2020 Q8 50TDI', '-2006731729', 'audi', 15000, '2025-03-08 21:40:29'),
	('r820', 'Audi', '2020 R8', '-143695728', 'audi', 55000, '2025-03-08 21:40:29'),
	('r8ppi', 'Audi', '2013 R8 V10', '-1385753106', 'audi', 19000, '2025-03-08 21:40:29'),
	('raa110_gn', 'GN', 'raa110_gn', '-2137359822', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('raid', 'Dodge', 'Challenger Raid', '-1299229688', 'dodge', 35000, '2025-03-08 21:40:28'),
	('ram2500', 'Dodge', '2015 RAM 2500', '-301519603', 'dodge', 19000, '2025-03-08 21:40:28'),
	('raptor2017', 'Ford', '2017 Raptor', '624514487', 'ford', 40000, '2025-03-08 21:40:29'),
	('rcf', 'Lexus', '2015 RCF', '-213537235', 'lexus', 12800, '2025-03-08 21:40:29'),
	('rculi', 'Rollsroyce', 'Rolls Royce Cullinan', '1640627795', 'rollsroyce', 40000, '2025-03-08 21:40:29'),
	('regalia', 'Quartz', 'Regalia 723', '-864376482', 'quartz', 80000, '2025-03-08 21:40:28'),
	('regera', 'Koenigsegg', 'Regera', '1085789913', 'koenigsegg', 55000, '2025-03-08 21:40:28'),
	('rifterdir', 'ENEDIS', 'rifterdir', '-1048106846', 'enedis', 220000, '2025-03-08 21:40:29'),
	('riot', 'PN', 'riot', '-1205689942', 'police_national', 220000, '2025-03-08 21:40:28'),
	('rkangoo10_gn', 'GN', 'rkangoo10_gn', '2012992513', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('rmegane3e15_gn', 'GN', 'rmegane3e15_gn', '809618833', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('rmegane3rs_gn', 'GN', 'rmegane3rs_gn', '-940851323', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('rmegane3rs_gn2', 'GN', 'rmegane3rs_gn2', '280251840', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('rmegane3rs_gn3', 'GN', 'rmegane3rs_gn3', '151502439', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('rmegane4e18_gn', 'GN', 'rmegane4e18_gn', '-20618723', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('rrevoque', 'Rangerover', 'Range Rover Evoque', '-1848675521', 'rangerover', 40000, '2025-03-08 21:40:29'),
	('rrphantom', 'Rollsroyce', '2018 Phantom VIII', '-1724630220', 'rollsroyce', 70000, '2025-03-08 21:40:28'),
	('rrst', 'Rangerover', 'Range Rover Vogue Startech', '1993609528', 'rangerover', 65000, '2025-03-08 21:40:28'),
	('rs6', 'Audi', '2016 RS6 C7', '2113441065', 'audi', 450000, '2025-03-08 21:40:29'),
	('rs615', 'Audi', 'RS6', '939131970', 'audi', 125000, '2025-03-08 21:40:28'),
	('rs72020', 'Audi', '2020 RS7', '-1606986894', 'audi', 28000, '2025-03-08 21:40:28'),
	('rsb_mbsprinter', 'Samu', 'rsb_mbsprinter', '1264164828', 'samu', 220000, '2025-03-08 21:40:29'),
	('rsvr16', 'Rangerover', '2016 Range Rover Sport SVR', '-1031680535', 'rangerover', 135000, '2025-03-08 21:40:29'),
	('rzoe_gn', 'GN', 'rzoe_gn', '-1933626909', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('s14', 'Nissan', '1998 Silvia K', '-1033545199', 'nissan', 55000, '2025-03-08 21:40:28'),
	('s500w222', 'Mercedes', '2014 S500 W222', '859560111', 'mercedes', 55000, '2025-03-08 21:40:28'),
	('Safari97', 'Nissan', '1997 Patrol Super Safari Y60', '1585663266', 'nissan', 12000, '2025-03-08 21:40:29'),
	('sandero', 'Dacia', 'Sandero 2014', '-516616829', 'dacia', 12000, '2025-03-08 21:40:29'),
	('senna', 'Mclaren', '2019 Senna', '-433961724', 'mclaren', 210000, '2025-03-08 21:40:29'),
	('skodacombipn1', 'PN', 'skodacombipn1', '462844124', 'police_national', 220000, '2025-03-08 21:40:29'),
	('skodiaq_gn', 'GN', 'skodiaq_gn', '-225535765', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('skyline', 'Nissan', 'Skyline GT-R (BNR34)', '2117711508', 'nissan', 20000, '2025-03-08 21:40:29'),
	('sl500', 'Mercedes', '1995 SL500', '200570146', 'mercedes', 38000, '2025-03-08 21:40:28'),
	('sleoncupra_gn', 'GN', 'sleoncupra_gn', '-505304491', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('sm3008', 'Samu', 'sm3008', '1734892739', 'samu', 220000, '2025-03-08 21:40:28'),
	('smc3', 'Samu', 'smc3', '351168100', 'samu', 220000, '2025-03-08 21:40:29'),
	('smranger', 'Samu', 'smranger', '794359969', 'samu', 220000, '2025-03-08 21:40:29'),
	('smsprinter', 'Samu', 'smsprinter', '-292129329', 'samu', 220000, '2025-03-08 21:40:28'),
	('sq72016', 'Audi', '2016 SQ7', '119794591', 'audi', 30000, '2025-03-08 21:40:28'),
	('srt4', 'Dodge', 'Neon SRT-4', '-1631107402', 'dodge', 15000, '2025-03-08 21:40:28'),
	('srt8', 'Jeep', '2015 SRT-8', '-1003581048', 'jeep', 35000, '2025-03-08 21:40:28'),
	('stepway', 'Dacia', 'Sandero Stepway 2014', '-303004972', 'dacia', 12000, '2025-03-08 21:40:29'),
	('stingray', 'Chevrolet', '2020 Corvette C8 Stingray', '-1136096889', 'chevrolet', 42000, '2025-03-08 21:40:29'),
	('subisti08', 'Subaru', '2008 WRX STi', '-66416094', 'subaru', 65000, '2025-03-08 21:40:28'),
	('subwrx', 'Subaru', '2004 Impreza WRX STI', '-1298373790', 'subaru', 130000, '2025-03-08 21:40:28'),
	('svj63', 'Lamborghini', 'Aventador SVJ', '-675592250', 'lamborghini', 62000, '2025-03-08 21:40:28'),
	('svx', 'Subaru', '1996 Alcyone SVX', '-1451213984', 'subaru', 35000, '2025-03-08 21:40:29'),
	('tabac1', 'Tabac', 'tabac1', '1812694154', 'tabac', 220000, '2025-03-08 21:40:28'),
	('tabac2', 'Tabac', 'tabac2', '2059543031', 'tabac', 220000, '2025-03-08 21:40:29'),
	('tahoe21', 'Chevrolet', '2021 Tahoe RST', '-2132526642', 'chevrolet', 45000, '2025-03-08 21:40:29'),
	('taycan', 'Porsche', '2020 Taycan Turbo S', '1295777722', 'porsche', 45000, '2025-03-08 21:40:29'),
	('teslapd', 'Tesla', '2017 Model S', '-435728526', 'tesla', 40000, '2025-03-08 21:40:29'),
	('teslax', 'Tesla', '2016 Model X P90D', '-429774847', 'tesla', 50000, '2025-03-08 21:40:29'),
	('tltypes', 'Aston', 'Acura TL Type-S', '1118479944', 'aston', 24000, '2025-03-08 21:40:29'),
	('tmodel', 'Tesla', '2018 Model 3', '4239369', 'tesla', 15000, '2025-03-08 21:40:29'),
	('toysupmk4', 'Toyota', '1998 Supra Turbo (A80)', '-1062758007', 'toyota', 255000, '2025-03-08 21:40:29'),
	('tr22', 'Tesla', '2020 Roadster', '1197361861', 'tesla', 45000, '2025-03-08 21:40:28'),
	('tracer900bana', 'Banaliser', 'tracer900bana', '1767812840', 'banaliser', 220000, '2025-03-08 21:40:28'),
	('traficpn2mlx4', 'PN', 'traficpn2mlx4', '-1182063840', 'police_national', 220000, '2025-03-08 21:40:29'),
	('transit', 'ENEDIS', 'transit', '1587708444', 'enedis', 220000, '2025-03-08 21:40:29'),
	('trhawk', 'Jeep', '2018 Grand Cherokee', '231217483', 'jeep', 16000, '2025-03-08 21:40:29'),
	('trx', 'Dodge', '2017 RAM 1500 Rebel TRX', '909518807', 'dodge', 19500, '2025-03-08 21:40:28'),
	('ttrs', 'Audi', '2010 TT RS', '-586459613', 'audi', 125000, '2025-03-08 21:40:29'),
	('twingo', 'Renault', 'Twingo I', '1938131410', 'renault', 45000, '2025-03-08 21:40:28'),
	('umhnecker', 'Samu', 'umhnecker', '1392252066', 'samu', 220000, '2025-03-08 21:40:29'),
	('urus', 'Lamborghini', 'Urus', '-520214134', 'lamborghini', 85000, '2025-03-08 21:40:29'),
	('v250', 'Mercedes', 'V-class 250 Bluetec LWB', '-1412248195', 'mercedes', 35000, '2025-03-08 21:40:29'),
	('vbrg', 'GN', 'vbrg', '-1413542696', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('vegolf_gn', 'GN', 'vegolf_gn', '-662082183', 'gendarmerie', 220000, '2025-03-08 21:40:29'),
	('veneno', 'Lamborghini', 'Veneno', '-42051018', 'lamborghini', 155000, '2025-03-08 21:40:28'),
	('vlm95', 'Samu', 'vlm95', '1431206324', 'samu', 220000, '2025-03-08 21:40:29'),
	('vwr', 'Volkswagen', 'Scirocco R 2011', '1864073763', 'volkswagen', 375000, '2025-03-08 21:40:28'),
	('vxr', 'Toyota', '2016 Land Cruiser VXR', '-1124510526', 'toyota', 900000, '2025-03-08 21:40:28'),
	('wildtrak', 'Ford', '2021 Bronco Wildtrak', '-1180922538', 'ford', 60000, '2025-03-08 21:40:29'),
	('wmfenyr', 'WMotors', 'Fenyr Supersport', '-1792334644', 'wmotors', 220000, '2025-03-08 21:40:29'),
	('wraith', 'Rollsroyce', 'Wraith', '-1095688294', 'rollsroyce', 30000, '2025-03-08 21:40:29'),
	('x5e53', 'BMW', 'X5 E53 2005 Sport Package', '1716918782', 'bmw', 20000, '2025-03-08 21:40:28'),
	('x6m', 'BMW', 'X6M F16', '-506359117', 'bmw', 20000, '2025-03-08 21:40:29'),
	('xc90', 'Wolvo', 'XC90 T8', '284310455', 'volvo', 425000, '2025-03-08 21:40:29'),
	('yFe458i1', 'Ferrari', '458 Italia', '-1307201065', 'ferrari', 7500, '2025-03-08 21:40:29'),
	('yFe458i2', 'Ferrari', '458 Speciale', '-1487430565', 'ferrari', 8000, '2025-03-08 21:40:29'),
	('yFe458s1', 'Ferrari', '458 Spider', '270595188', 'ferrari', 14000, '2025-03-08 21:40:29'),
	('yFe458s2', 'Ferrari', '458 Speciale Aperta', '-27569943', 'ferrari', 5000, '2025-03-08 21:40:28'),
	('yFeF12A', 'Ferrari', 'F60 America', '-1149788194', 'ferrari', 25000, '2025-03-08 21:40:28'),
	('yFeF12T', 'Ferrari', 'F12 TRS Roadster', '-767865503', 'ferrari', 90000, '2025-03-08 21:40:29'),
	('ymt09t_gn', 'GN', 'ymt09t_gn', '-2136835262', 'gendarmerie', 220000, '2025-03-08 21:40:28'),
	('yPG205t16A', 'Peugeot', '205 Rally', '257490023', 'peugeot', 45000, '2025-03-08 21:40:28'),
	('yPG205t16B', 'Peugeot', '205 Turbo 16', '-16098358', 'peugeot', 45000, '2025-03-08 21:40:29'),
	('z32', 'Nissan', '300ZX Z32', '624293437', 'nissan', 75000, '2025-03-08 21:40:29'),
	('z419', 'BMW', '2019 Z4 M40i', '392244532', 'bmw', 14000, '2025-03-08 21:40:28'),
	('_rtrafic15_gn', 'GN', '_rtrafic15_gn', '1021863326', 'gendarmerie', 220000, '2025-03-08 21:40:29');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_farms
DROP TABLE IF EXISTS `farming_creator_farms`;
CREATE TABLE IF NOT EXISTS `farming_creator_farms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_farms : ~0 rows (environ)
DELETE FROM `farming_creator_farms`;

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_fields
DROP TABLE IF EXISTS `farming_creator_fields`;
CREATE TABLE IF NOT EXISTS `farming_creator_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_fields : ~5 rows (environ)
DELETE FROM `farming_creator_fields`;
INSERT INTO `farming_creator_fields` (`id`, `label`, `data`) VALUES
	(1, 'Pommier', '{"respawnTimer":15,"animations":[{"duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN","type":"scenario"}],"requiredItems":[],"maxObjects":10,"objectModel":"prop_tree_birch_04","spawnType":"automatic","coords":{"z":202.11,"x":-814.28,"y":857.76},"blipData":{"display":2,"sprite":651,"label":"Field","scale":0.8,"color":2,"isEnabled":true},"radius":30,"rewardItems":[{"minQuantity":1,"chances":10,"maxQuantity":5,"name":"apple","type":"item"}],"minimumPolice":0,"maxObjectsAmount":1,"minObjectsAmount":1}'),
	(2, 'Framboisier', '{"objectModel":"prop_plant_cane_01a","spawnType":"automatic","coords":{"y":-1346,"x":1300.33,"z":44.84},"maxObjectsAmount":1,"rewardItems":[{"chances":10,"type":"item","minQuantity":1,"maxQuantity":2,"name":"raspberry"}],"requiredItems":[],"blipData":{"label":"Field","isEnabled":true,"display":2,"sprite":651,"scale":0.8,"color":2},"respawnTimer":15,"maxObjects":30,"animations":[{"scenarioName":"PROP_HUMAN_BUM_BIN","type":"scenario","duration":5}],"radius":30,"minObjectsAmount":1,"minimumPolice":0}'),
	(3, 'Carriére', '{"coords":{"x":2955,"z":40.1,"y":2783.94},"respawnTimer":30,"animations":[{"type":"special","duration":5,"specialAnimation":"pickaxe"}],"radius":100,"minObjectsAmount":1,"spawnType":"automatic","requiredItems":[{"loseOnUse":false,"minQuantity":1,"name":"pickaxe","type":"item"}],"rewardItems":[{"chances":90,"name":"stone","maxQuantity":3,"type":"item","minQuantity":1},{"chances":40,"name":"uncut_emerald","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_ruby","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_diamond","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_sapphire","maxQuantity":1,"type":"item","minQuantity":1},{"chances":10,"name":"carbon","maxQuantity":1,"type":"item","minQuantity":1},{"chances":80,"name":"ironore","maxQuantity":3,"type":"item","minQuantity":1},{"chances":70,"name":"copperore","maxQuantity":2,"type":"item","minQuantity":1},{"chances":50,"name":"goldore","maxQuantity":2,"type":"item","minQuantity":1},{"chances":60,"name":"silverore","maxQuantity":2,"type":"item","minQuantity":1}],"blipData":{"display":2,"scale":0.8,"color":0,"label":"Carrière","isEnabled":true,"sprite":677},"maxObjectsAmount":3,"maxObjects":50,"minimumPolice":0,"objectModel":"prop_rock_5_smash3"}'),
	(4, 'Bucheron', '{"respawnTimer":30,"animations":[{"duration":7,"specialAnimation":"axe","type":"special"}],"requiredItems":[{"minQuantity":1,"name":"pickaxe","loseOnUse":false,"type":"item"}],"maxObjects":25,"objectModel":"prop_tree_birch_04","spawnType":"automatic","coords":{"z":67.24,"x":-701.55,"y":5343.52},"blipData":{"display":2,"sprite":651,"label":"Field","scale":0.8,"color":2,"isEnabled":true},"radius":60,"rewardItems":[{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"rondin","type":"item"},{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"branche","type":"item"},{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"ecorce","type":"item"}],"minimumPolice":0,"maxObjectsAmount":1,"minObjectsAmount":1}'),
	(5, 'Tabac', '{"maxObjects":30,"allowedJobs":{"tabac":true},"spawnType":"automatic","minimumPolice":0,"coords":{"x":1350.7,"y":1246.85,"z":104.91},"minObjectsAmount":1,"animations":[{"duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN","type":"scenario"}],"radius":40,"blipData":{"sprite":651,"isEnabled":true,"scale":0.8,"color":2,"display":2,"label":"Field"},"respawnTimer":30,"requiredItems":[{"name":"trimming_scissors","loseOnUse":false,"type":"item","minQuantity":1}],"rewardItems":[{"chances":3,"minQuantity":1,"name":"feuilletabac","type":"item","maxQuantity":5}],"objectModel":"h4_prop_tree_frangipani_lrg_01","maxObjectsAmount":1}');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_formulas
DROP TABLE IF EXISTS `farming_creator_formulas`;
CREATE TABLE IF NOT EXISTS `farming_creator_formulas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Formulas which can be used in the foundry feature';

-- Listage des données de la table paris_horizon_base_dev.farming_creator_formulas : ~0 rows (environ)
DELETE FROM `farming_creator_formulas`;
INSERT INTO `farming_creator_formulas` (`id`, `label`, `data`) VALUES
	(1, 'Or', '{"smokeColor":{"g":74,"b":59,"r":79},"producesSmoke":true,"probabilityOfFailure":0,"rewardItems":[{"chances":90,"name":"goldingot","maxQuantity":1,"type":"item","minQuantity":1}],"maxObjectsAmount":1,"minObjectsAmount":1,"animations":[{"animDict":"missmechanic","type":"animation","duration":5,"animName":"work2_base"}],"requiredItems":[{"quantity":5,"type":"item","name":"goldore","loseOnUse":true}]}');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_foundries
DROP TABLE IF EXISTS `farming_creator_foundries`;
CREATE TABLE IF NOT EXISTS `farming_creator_foundries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_foundries : ~0 rows (environ)
DELETE FROM `farming_creator_foundries`;
INSERT INTO `farming_creator_foundries` (`id`, `label`, `data`) VALUES
	(1, 'Fonderie', '{"coords":{"x":1110.47,"z":30.85,"y":-2008.64},"explodeOnFailure":false,"allowedFormulas":{"1":true},"alertPoliceProbability":0,"radius":5,"objectData":{"rotation":{"x":0,"z":0,"y":0},"model":"","isEnabled":false},"alertPoliceOnFailure":false,"blipData":{"display":2,"scale":0.8,"color":0,"label":"Fonderie","isEnabled":true,"sprite":677},"secondsBeforeExplosion":0,"markerData":{"type":27,"rotate":true,"followCamera":false,"bounce":false,"rotation":{"x":0,"z":0,"y":0},"scale":{"x":0.7,"z":0.7,"y":0.7},"color":{"blue":0,"red":0,"opacity":200,"green":255}},"minimumPolice":0}');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_plants
DROP TABLE IF EXISTS `farming_creator_plants`;
CREATE TABLE IF NOT EXISTS `farming_creator_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seed_id` int(11) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `coords` longtext NOT NULL,
  `ground_material` int(15) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `seed_id` (`seed_id`) USING BTREE,
  CONSTRAINT `seed_id` FOREIGN KEY (`seed_id`) REFERENCES `farming_creator_seeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Plants planted by players from seeds';

-- Listage des données de la table paris_horizon_base_dev.farming_creator_plants : ~0 rows (environ)
DELETE FROM `farming_creator_plants`;

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_players_known_formulas
DROP TABLE IF EXISTS `farming_creator_players_known_formulas`;
CREATE TABLE IF NOT EXISTS `farming_creator_players_known_formulas` (
  `identifier` varchar(100) NOT NULL,
  `formula_id` int(11) NOT NULL,
  PRIMARY KEY (`identifier`,`formula_id`) USING BTREE,
  KEY `formula_id` (`formula_id`) USING BTREE,
  CONSTRAINT `formula_id` FOREIGN KEY (`formula_id`) REFERENCES `farming_creator_formulas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_players_known_formulas : ~0 rows (environ)
DELETE FROM `farming_creator_players_known_formulas`;

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_seeds
DROP TABLE IF EXISTS `farming_creator_seeds`;
CREATE TABLE IF NOT EXISTS `farming_creator_seeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_seeds : ~0 rows (environ)
DELETE FROM `farming_creator_seeds`;

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_workbenches
DROP TABLE IF EXISTS `farming_creator_workbenches`;
CREATE TABLE IF NOT EXISTS `farming_creator_workbenches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_workbenches : ~0 rows (environ)
DELETE FROM `farming_creator_workbenches`;

-- Listage de la structure de table paris_horizon_base_dev. global_blips
DROP TABLE IF EXISTS `global_blips`;
CREATE TABLE IF NOT EXISTS `global_blips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT 'blip',
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `streetName` varchar(50) NOT NULL DEFAULT '0',
  `sprite` smallint(6) NOT NULL DEFAULT 0,
  `scale` float NOT NULL DEFAULT 0,
  `alpha` tinyint(4) unsigned NOT NULL DEFAULT 0,
  `color` smallint(6) NOT NULL DEFAULT 0,
  `ticked` bit(1) NOT NULL DEFAULT b'0',
  `outline` bit(1) NOT NULL DEFAULT b'0',
  `display` tinyint(3) NOT NULL DEFAULT 0,
  `identifier` varchar(80) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `height` float NOT NULL DEFAULT 50,
  `width` float NOT NULL DEFAULT 50,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.global_blips : ~0 rows (environ)
DELETE FROM `global_blips`;

-- Listage de la structure de table paris_horizon_base_dev. houselocations
DROP TABLE IF EXISTS `houselocations`;
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `defaultPrice` int(11) DEFAULT NULL,
  `tier` tinyint(2) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  `garageShell` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `mlo` text DEFAULT NULL,
  `ipl` text DEFAULT NULL,
  `console` int(11) DEFAULT NULL,
  `board` text DEFAULT NULL,
  `for_sale` int(11) DEFAULT 1,
  `extra_imgs` text DEFAULT NULL,
  `description` text NOT NULL DEFAULT '',
  `creatorJob` varchar(50) DEFAULT NULL,
  `blip` text DEFAULT NULL,
  `upgrades` text DEFAULT NULL,
  `apartmentCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table paris_horizon_base_dev.houselocations : ~0 rows (environ)
DELETE FROM `houselocations`;
INSERT INTO `houselocations` (`id`, `name`, `label`, `coords`, `owned`, `price`, `defaultPrice`, `tier`, `garage`, `garageShell`, `creator`, `mlo`, `ipl`, `console`, `board`, `for_sale`, `extra_imgs`, `description`, `creatorJob`, `blip`, `upgrades`, `apartmentCount`) VALUES
	(2, 'villa_riche', 'Catfish View', '{"test":{"x":3457.2939453125,"y":4902.03564453125,"z":36.26047897338867},"PolyZone":{"thickness":34.15417310316115,"points":[{"x":3434.259765625,"y":4879.9130859375,"z":35.0},{"x":3440.087890625,"y":4873.67578125,"z":35.0},{"x":3448.01171875,"y":4869.68896484375,"z":35.0},{"x":3456.85986328125,"y":4865.96484375,"z":35.0},{"x":3462.413330078125,"y":4863.80419921875,"z":35.0},{"x":3473.646240234375,"y":4860.4140625,"z":35.0},{"x":3476.204833984375,"y":4859.93798828125,"z":35.0},{"x":3489.50732421875,"y":4863.96142578125,"z":35.0},{"x":3529.695068359375,"y":4896.64306640625,"z":35.0},{"x":3524.409912109375,"y":4923.833984375,"z":35.0},{"x":3511.831298828125,"y":4935.6748046875,"z":35.0},{"x":3493.649169921875,"y":4947.09716796875,"z":35.0},{"x":3473.360595703125,"y":4974.7578125,"z":35.0},{"x":3455.101806640625,"y":4994.06982421875,"z":35.0},{"x":3423.387451171875,"y":4978.82373046875,"z":35.0},{"x":3415.362060546875,"y":4949.98291015625,"z":35.0},{"x":3409.283447265625,"y":4936.60107421875,"z":35.0},{"x":3419.556640625,"y":4909.712890625,"z":35.0},{"x":3423.303466796875,"y":4898.85009765625,"z":35.0},{"x":3427.21923828125,"y":4888.75048828125,"z":35.0},{"x":3430.605712890625,"y":4883.40576171875,"z":35.0}]},"cam":{"x":3430.97119140625,"y":4883.32177734375,"h":312.497314453125,"yaw":-10.0,"z":34.95136260986328},"enter":{"y":4883.32177734375,"x":3430.97119140625,"h":312.497314453125,"z":34.95136260986328}}', NULL, 200, 200, 1, '{"y":4889.345703125,"h":121.20667266845703,"x":3449.970458984375,"z":36.45941162109375}', '[]', 'UYK15733', '[{"tempHandle":1166338,"hash":2009233619,"locked":true,"coords":{"x":3437.9814453125,"y":4899.419921875,"z":36.91901397705078},"h":40.00981521606445},{"tempHandle":1128450,"hash":2009233619,"locked":true,"coords":{"x":3442.883056640625,"y":4903.53369140625,"z":36.91922378540039},"h":40.00986099243164}]', NULL, NULL, '{"coords":{"x":3434.560546875,"y":4877.3564453125,"z":33.90238571166992,"w":312.6578674316406},"object":"qs_salesign_01","phone":"9839490898","name":"ttttttttttttt tttttttttttttttttt"}', 1, NULL, '', 'orpi', NULL, NULL, 0);

-- Listage de la structure de table paris_horizon_base_dev. house_decorations
DROP TABLE IF EXISTS `house_decorations`;
CREATE TABLE IF NOT EXISTS `house_decorations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `house` varchar(50) DEFAULT NULL,
  `creator` varchar(70) NOT NULL DEFAULT '0',
  `modelName` varchar(50) NOT NULL DEFAULT '0',
  `coords` text DEFAULT NULL,
  `rotation` text NOT NULL DEFAULT '',
  `inStash` tinyint(1) NOT NULL DEFAULT 0,
  `inHouse` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `uniq` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `lightData` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`house`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.house_decorations : ~0 rows (environ)
DELETE FROM `house_decorations`;

-- Listage de la structure de table paris_horizon_base_dev. house_objects
DROP TABLE IF EXISTS `house_objects`;
CREATE TABLE IF NOT EXISTS `house_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) NOT NULL DEFAULT '0',
  `coords` text NOT NULL,
  `house` varchar(80) DEFAULT NULL,
  `construction` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Listage des données de la table paris_horizon_base_dev.house_objects : ~0 rows (environ)
DELETE FROM `house_objects`;

-- Listage de la structure de table paris_horizon_base_dev. house_plants
DROP TABLE IF EXISTS `house_plants`;
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB AUTO_INCREMENT=7123 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.house_plants : ~0 rows (environ)
DELETE FROM `house_plants`;

-- Listage de la structure de table paris_horizon_base_dev. house_rents
DROP TABLE IF EXISTS `house_rents`;
CREATE TABLE IF NOT EXISTS `house_rents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL DEFAULT '',
  `identifier` varchar(80) NOT NULL DEFAULT '',
  `payed` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.house_rents : ~0 rows (environ)
DELETE FROM `house_rents`;

-- Listage de la structure de table paris_horizon_base_dev. instagram_account
DROP TABLE IF EXISTS `instagram_account`;
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.instagram_account : ~0 rows (environ)
DELETE FROM `instagram_account`;

-- Listage de la structure de table paris_horizon_base_dev. instagram_followers
DROP TABLE IF EXISTS `instagram_followers`;
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.instagram_followers : ~0 rows (environ)
DELETE FROM `instagram_followers`;

-- Listage de la structure de table paris_horizon_base_dev. instagram_posts
DROP TABLE IF EXISTS `instagram_posts`;
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `location` varchar(50) NOT NULL DEFAULT 'Los Santos',
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.instagram_posts : ~0 rows (environ)
DELETE FROM `instagram_posts`;

-- Listage de la structure de table paris_horizon_base_dev. instagram_stories
DROP TABLE IF EXISTS `instagram_stories`;
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) NOT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Listage des données de la table paris_horizon_base_dev.instagram_stories : ~0 rows (environ)
DELETE FROM `instagram_stories`;

-- Listage de la structure de table paris_horizon_base_dev. insta_stories
DROP TABLE IF EXISTS `insta_stories`;
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.insta_stories : ~0 rows (environ)
DELETE FROM `insta_stories`;

-- Listage de la structure de table paris_horizon_base_dev. inventories
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.inventories : ~51 rows (environ)
DELETE FROM `inventories`;
INSERT INTO `inventories` (`id`, `identifier`, `items`) VALUES
	(81, 'boss_belleville', '[]'),
	(83, 'boss_tabac', '[]'),
	(7, 'glovebox- RT1933 ', '[]'),
	(45, 'glovebox- RT3475 ', '[]'),
	(57, 'glovebox-00NTH256', '[]'),
	(133, 'glovebox-01VPI705', '[]'),
	(58, 'glovebox-02CUA023', '[]'),
	(14, 'glovebox-02ZQT393', '[]'),
	(79, 'glovebox-03VYT649', '[]'),
	(131, 'glovebox-04DNM347', '[]'),
	(41, 'glovebox-05KFP973', '[]'),
	(10, 'glovebox-05OHQ233', '[]'),
	(84, 'glovebox-05QCM806', '[]'),
	(26, 'glovebox-07ZWJ180', '[]'),
	(135, 'glovebox-09QZC287', '[]'),
	(38, 'glovebox-21WGZ779', '[{"useable":true,"type":"item","name":"vehiclekey","unique":true,"amount":1,"slot":1,"info":{"lock":4322,"plate":"21WGZ779","model":"2016 Audi RS6 C7"},"label":"Vehicle key","weight":10,"shouldClose":true,"image":"vehiclekey.png","description":"This is a car key, take good care of it, if you lose it you probably won\'t be able to use your car"}]'),
	(67, 'glovebox-22EXQ375', '[]'),
	(68, 'glovebox-24HLR439', '[]'),
	(61, 'glovebox-24QPT231', '[]'),
	(19, 'glovebox-25IET158', '[]'),
	(16, 'glovebox-27NTX501', '[]'),
	(59, 'glovebox-29KMH369', '[]'),
	(33, 'glovebox-29MYU130', '[]'),
	(132, 'glovebox-29NCR897', '[]'),
	(74, 'glovebox-2UX364WY', '[]'),
	(28, 'glovebox-41IGW398', '[]'),
	(43, 'glovebox-42KKT663', '[]'),
	(21, 'glovebox-42SQF775', '[{"type":"item","name":"potatoes","image":"potatoes.png","unique":false,"weight":100,"amount":2,"slot":1,"useable":true,"description":"Un légume polyvalent, idéal pour de nombreuses recettes.","info":[],"label":"Pommes de Terre"}]'),
	(9, 'glovebox-43KBN836', '[]'),
	(66, 'glovebox-43UMM351', '[]'),
	(8, 'glovebox-44UKA113', '[]'),
	(34, 'glovebox-45JSY701', '[]'),
	(76, 'glovebox-62KGX946', '[]'),
	(42, 'glovebox-62QHP922', '[]'),
	(139, 'glovebox-65BNQ264', '[]'),
	(86, 'glovebox-69UAQ739', '[]'),
	(44, 'glovebox-80SES736', '[]'),
	(88, 'glovebox-82WRC665', '[]'),
	(39, 'glovebox-84OJU215', '[]'),
	(134, 'glovebox-85CGV512', '[]'),
	(48, 'norauto_stash', '[{"info":{"quality":100,"serie":"99pZl4ye942oRqz"},"amount":1,"slot":1,"weight":1000,"name":"weapon_grenade","type":"weapon","useable":false,"image":"weapon_grenade.png","unique":true,"description":"A handheld throwable bomb","label":"Grenade"}]'),
	(11, 'trunk-02ZQT393', '[]'),
	(27, 'trunk-07ZWJ180', '[]'),
	(80, 'trunk-08VOE620', '[]'),
	(3, 'trunk-28LDE549', '[null,null,null,null,null,{"description":"Neat phone ya got there","name":"phone","weight":700,"label":"Phone","image":"phone.png","unique":true,"shouldClose":false,"useable":false,"slot":6,"type":"item","info":[],"amount":1}]'),
	(126, 'trunk-28MTM505', '[]'),
	(120, 'trunk-29NCR897', '[]'),
	(64, 'trunk-42SPK118', '[{"info":[],"amount":1,"shouldClose":true,"slot":1,"weight":1000,"name":"veh_wheels","type":"item","useable":true,"image":"veh_wheels.png","unique":false,"description":"Upgrade vehicle wheels","label":"Wheels"},{"info":[],"amount":5,"slot":2,"weight":100,"name":"heroin","type":"item","useable":true,"image":"heroin.png","unique":false,"description":"Une substance tres dangereuse","label":"Heroine"},{"info":[],"amount":8,"slot":3,"weight":100,"name":"cocainebaggy","type":"item","useable":true,"image":"cocainebaggy.png","unique":false,"description":"Un petit sachet de poudre blanche","label":"Sachet de cocaine"},{"info":[],"amount":4027,"shouldClose":true,"slot":4,"weight":0,"name":"black","type":"item","useable":false,"image":"black_money.png","unique":false,"description":"Black Money?","label":"Argent Sale"},{"info":[],"amount":1,"shouldClose":true,"slot":5,"weight":2000,"name":"radio","type":"item","useable":true,"image":"radio.png","unique":true,"description":"You can communicate with this through a signal","label":"Radio"},{"info":[],"amount":1,"shouldClose":true,"slot":6,"weight":500,"name":"fitbit","type":"item","useable":true,"image":"fitbit.png","unique":true,"description":"I like fitbit","label":"Fitbit"},{"info":[],"amount":1,"shouldClose":true,"slot":7,"weight":2000,"name":"tunerlaptop","type":"item","useable":true,"image":"tunerchip.png","unique":true,"description":"With this tunerchip you can get your car on steroids... If you know what you\'re doing","label":"Tunerchip"},{"info":[],"amount":1,"shouldClose":true,"slot":8,"weight":1000,"name":"veh_engine","type":"item","useable":true,"image":"veh_engine.png","unique":false,"description":"Upgrade vehicle engine","label":"Engine"},{"info":[],"amount":1,"shouldClose":true,"slot":9,"weight":1000,"name":"veh_brakes","type":"item","useable":true,"image":"veh_brakes.png","unique":false,"description":"Upgrade vehicle brakes","label":"Brakes"},{"info":[],"amount":1,"shouldClose":true,"slot":10,"weight":1000,"name":"veh_suspension","type":"item","useable":true,"image":"veh_suspension.png","unique":false,"description":"Upgrade vehicle suspension","label":"Suspension"},{"info":[],"amount":3,"shouldClose":true,"slot":11,"weight":1000,"name":"veh_plates","type":"item","useable":true,"image":"veh_plates.png","unique":false,"description":"Install vehicle plates","label":"Plates"},{"info":[],"amount":1,"shouldClose":true,"slot":12,"weight":1000,"name":"veh_transmission","type":"item","useable":true,"image":"veh_transmission.png","unique":false,"description":"Upgrade vehicle transmission","label":"Transmission"},{"info":[],"amount":1,"shouldClose":true,"slot":13,"weight":1000,"name":"veh_armor","type":"item","useable":true,"image":"veh_armor.png","unique":false,"description":"Upgrade vehicle armor","label":"Armor"},{"info":[],"amount":10,"slot":14,"weight":200,"name":"weed_skunk","type":"item","useable":true,"image":"weed_baggy.png","unique":false,"description":"Un pochon contenant de la weed","label":"Pochon de Weed"},{"info":[],"amount":10,"slot":15,"weight":100,"name":"meth_baggy","type":"item","useable":true,"image":"meth_baggy.png","unique":false,"description":"Un petit sachet de cristaux bleus","label":"Sachet de Meth"}]'),
	(50, 'trunk-42XGU401', '[]'),
	(46, 'trunk-44BOY873', '[]'),
	(36, 'trunk-64OMS024', '[]'),
	(137, 'trunk-65BNQ264', '[{"amount":2,"image":"briquet.png","name":"briquet","info":[],"label":"Briquet","slot":1,"weight":10,"shouldClose":false,"type":"item","useable":true,"unique":false,"description":"Un briquet pour allumer vos cigarettes"},{"amount":2,"image":"cloth.png","name":"cloth","info":[],"label":"Torchon","slot":2,"weight":500,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Un simple torchon"},{"amount":2,"image":"chloroform.png","name":"chloroform","info":[],"label":"Chloroforme","slot":3,"weight":1000,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Substance chimique dangereuse"},{"amount":1,"image":"uncut_emerald.png","name":"uncut_emerald","info":[],"label":"Émeraude brute","slot":4,"weight":100,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Une émeraude non taillée"},{"amount":2,"image":"feuillearouler.png","name":"feuillearouler","info":[],"label":"Feuille à rouler","slot":5,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Une feuille pour rouler votre cigarette"},{"amount":2,"image":"uncut_diamond.png","name":"uncut_diamond","info":[],"label":"Diamant brut","slot":6,"weight":100,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Un diamant non taillé"},{"amount":1,"image":"veh_suspension.png","name":"veh_suspension","info":[],"label":"Suspension","slot":7,"weight":1000,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Upgrade vehicle suspension"},{"amount":43,"image":"feuilletabac.png","name":"feuilletabac","info":[],"label":"Feuille de tabac","slot":8,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Une feuille de tabac séchée"},{"amount":1,"name":"weapon_petrolcan","info":{"serie":"82buF5UD371UVNo","quality":100},"label":"Petrol Can","slot":9,"weight":1000,"image":"weapon_petrolcan.png","type":"weapon","useable":false,"unique":true,"description":"A robust liquid container made from pressed steel"},{"amount":2,"image":"tabace.png","name":"tabac","info":[],"label":"Tabac","slot":10,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Du tabac à rouler"},{"amount":1,"image":"pickaxe.png","name":"pickaxe","info":[],"label":"Pioche","slot":11,"weight":1000,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Un outil essentiel pour l\'extraction minière"},{"amount":1,"image":"scalpel.png","name":"scalpel","info":[],"label":"Scalpel","slot":12,"weight":500,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Instrument chirurgical tranchant"},{"amount":2,"image":"ecorce.png","name":"ecorce","info":[],"label":"Ecorce","slot":13,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Ecorce d\'arbre"},{"amount":9,"image":"joint.png","name":"joint","info":[],"label":"joint","slot":14,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Petit pétou"},{"amount":1,"image":"skateboard.png","name":"skateboard","info":[],"label":"Skateboard","slot":15,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"skateboard"},{"amount":1,"image":"diamond_ring.png","name":"diamond_ring","info":[],"label":"Bague en diamant","slot":16,"weight":200,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Une bague ornée d\'un diamant étincelant"},{"amount":10,"image":"paquetcigarette.png","name":"paquetcigarette","info":[],"label":"Paquet de cigarettes","slot":17,"weight":10,"shouldClose":false,"type":"item","useable":true,"unique":false,"description":"Un paquet de cigarettes"},{"amount":20,"image":"cigarette.png","name":"cigarette","info":[],"label":"Cigarette","slot":18,"weight":10,"shouldClose":false,"type":"item","useable":false,"unique":false,"description":"Une cigarette"},{"amount":2,"name":"salad","info":[],"label":"Salade","slot":19,"weight":100,"image":"salad.png","type":"item","useable":true,"unique":false,"description":"Un légume feuillu frais, parfait pour accompagner vos plats."},{"amount":1,"image":"lockpick.png","name":"lockpick","info":[],"label":"Lockpick","slot":20,"weight":300,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Very useful if you lose your keys a lot.. or if you want to use it for something else..."},{"amount":1,"image":"veh_toolbox.png","name":"veh_toolbox","info":[],"label":"Kit Réparation","slot":21,"weight":1000,"shouldClose":true,"type":"item","useable":true,"unique":false,"description":"Check vehicle status"},{"amount":1,"name":"weapon_pumpshotgun","info":{"ammo":95,"serie":"31LJk3Dr911LLIH","quality":99.55},"label":"Pump Shotgun","slot":22,"weight":1000,"image":"weapon_pumpshotgun.png","type":"weapon","useable":false,"unique":true,"description":"A pump-action smoothbore gun for firing small shot at short range"},{"amount":1,"name":"weapon_knife","info":{"ammo":0,"serie":"59nAn0oI540qSZt","quality":100},"label":"Couteau","slot":23,"weight":1000,"image":"weapon_knife.png","type":"weapon","useable":false,"unique":true,"description":"Un instrument composé dune lame fixée à un manche, utilisé pour couper ou comme arme"},{"amount":1,"name":"weapon_pistol_mk2","info":{"ammo":33,"serie":"09egr6cz578ssAQ","quality":65.95},"label":"Pistol Mk II","slot":24,"weight":1000,"image":"weapon_pistol_mk2.png","type":"weapon","useable":false,"unique":true,"description":"An upgraded small firearm designed to be held in one hand"},{"amount":1,"image":"radio.png","name":"radio","info":[],"label":"Radio","slot":25,"weight":2000,"shouldClose":true,"type":"item","useable":true,"unique":true,"description":"You can communicate with this through a signal"},{"amount":1,"name":"trimming_scissors","info":[],"label":"Ciseaux a tailler","slot":26,"weight":100,"image":"trimming_scissors.png","type":"item","useable":false,"unique":false,"description":"Des ciseaux pour couper les plantes"},{"amount":3,"name":"icetea","info":[],"label":"Ice Tea","slot":27,"weight":500,"image":"icetea.png","type":"item","useable":true,"unique":false,"description":"Une canette de Ice Tea rafraîchissante."}]'),
	(108, 'trunk-81YMY555', '[]'),
	(87, 'trunk-82WRC665', '[]'),
	(78, 'trunk-85QVL485', '[]'),
	(1, 'trunk-85UYG797', '[]'),
	(128, 'trunk-86XFM348', '[]');

-- Listage de la structure de table paris_horizon_base_dev. jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` int(1) NOT NULL DEFAULT 0,
  `enable_billing` int(1) DEFAULT 0,
  `can_rob` int(1) DEFAULT 0,
  `can_handcuff` int(1) DEFAULT 0,
  `can_lockpick_cars` int(1) DEFAULT 0,
  `can_wash_vehicles` int(1) DEFAULT 0,
  `can_repair_vehicles` int(1) DEFAULT 0,
  `can_impound_vehicles` int(1) DEFAULT 0,
  `can_check_identity` int(1) DEFAULT 0,
  `can_check_vehicle_owner` int(1) DEFAULT 0,
  `can_check_driving_license` int(1) DEFAULT 0,
  `can_check_weapon_license` int(1) DEFAULT 0,
  `can_heal` int(1) DEFAULT 0,
  `can_revive` int(1) DEFAULT 0,
  `actions_menu_enabled` int(1) DEFAULT 1,
  `placeable_objects` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs : ~33 rows (environ)
DELETE FROM `jobs`;
INSERT INTO `jobs` (`name`, `label`, `whitelisted`, `enable_billing`, `can_rob`, `can_handcuff`, `can_lockpick_cars`, `can_wash_vehicles`, `can_repair_vehicles`, `can_impound_vehicles`, `can_check_identity`, `can_check_vehicle_owner`, `can_check_driving_license`, `can_check_weapon_license`, `can_heal`, `can_revive`, `actions_menu_enabled`, `placeable_objects`) VALUES
	('avocats_de_paris', 'Avocats de Paris', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('brinks', 'Brinks', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('burgerking', 'Burger King', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('bus', 'Bus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('casino', 'Casino', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('concessionnaire', 'Concessionnaire', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('dir', 'Dir', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('garbage', 'Garbage', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('gendarmerie_nationale', 'Gendarmerie Nationale', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('hotdog', 'Hotdog', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('judge', 'Honorary', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('kfc', 'KFC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('lawyer', 'Law Firm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('mairie', 'Mairie', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('midas', 'Midas', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('norauto', 'Norauto', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('orpi', 'Orpi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('otacos', 'Otacos', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('pizza', 'Pizza', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('police_nationale', 'Police Nationale', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('pompiers_de_paris', 'Pompiers de Paris', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('reporter', 'Reporter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('samu_75', 'Samu 75', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('tabac', 'Tabac', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('taxi', 'Taxi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('tf1', 'TF1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('tow', 'Towing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('trucker', 'Trucker', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('unemployed', 'RSA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('vigneron', 'Vigneron', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('vinci', 'Vinci', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('vineyard', 'Vineyard', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL),
	('xpo', 'XPO Logistics', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL);

-- Listage de la structure de table paris_horizon_base_dev. jobs_armories
DROP TABLE IF EXISTS `jobs_armories`;
CREATE TABLE IF NOT EXISTS `jobs_armories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weapon` varchar(50) NOT NULL,
  `components` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `ammo` int(10) unsigned NOT NULL,
  `tint` int(11) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `identifier` varchar(80) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`,`marker_id`,`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs_armories : ~0 rows (environ)
DELETE FROM `jobs_armories`;

-- Listage de la structure de table paris_horizon_base_dev. jobs_data
DROP TABLE IF EXISTS `jobs_data`;
CREATE TABLE IF NOT EXISTS `jobs_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `coords` varchar(300) NOT NULL DEFAULT '',
  `grades_type` varchar(20) DEFAULT NULL,
  `specific_grades` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `min_grade` smallint(6) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `blip_id` int(11) DEFAULT NULL,
  `blip_color` int(11) DEFAULT 0,
  `blip_scale` float DEFAULT 1,
  `label` varchar(50) DEFAULT NULL,
  `marker_type` int(11) DEFAULT 1,
  `marker_scale_x` float DEFAULT 1.5,
  `marker_scale_y` float DEFAULT 1.5,
  `marker_scale_z` float DEFAULT 0.5,
  `marker_color_red` int(3) DEFAULT 150,
  `marker_color_green` int(3) DEFAULT 150,
  `marker_color_blue` int(3) DEFAULT 0,
  `marker_color_alpha` int(3) DEFAULT 50,
  `ped` varchar(50) DEFAULT NULL,
  `ped_heading` float DEFAULT NULL,
  `object` varchar(50) DEFAULT NULL,
  `object_heading` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs_data : ~7 rows (environ)
DELETE FROM `jobs_data`;
INSERT INTO `jobs_data` (`id`, `job_name`, `type`, `coords`, `grades_type`, `specific_grades`, `min_grade`, `data`, `blip_id`, `blip_color`, `blip_scale`, `label`, `marker_type`, `marker_scale_x`, `marker_scale_y`, `marker_scale_z`, `marker_color_red`, `marker_color_green`, `marker_color_blue`, `marker_color_alpha`, `ped`, `ped_heading`, `object`, `object_heading`) VALUES
	(1, 'public_marker', 'job_shop', '{"y":"-1595.10","x":"48.68","z":"29.06"}', 'minimumGrade', NULL, 0, 'null', 16, 6, 0.5, 'auto école', 1, 1.5, 1.5, 0.5, 255, 255, 0, 100, NULL, NULL, NULL, NULL),
	(2, 'public_marker', 'job_shop', '{"z":"67.56","y":"-747.08","x":"1407.84"}', 'minimumGrade', NULL, 0, 'null', 58, 54, 0.8, 'GITAN NORD', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL),
	(3, 'public_marker', 'job_shop', '{"z":"67.18","y":"5343.68","x":"-700.50"}', 'minimumGrade', NULL, 0, 'null', 75, 14, 0.8, 'bucheron', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL),
	(4, 'tabac', 'process', '{"z":"44.52","y":"-38.32","x":"-505.06"}', 'minimumGrade', NULL, 0, '{"timeToProcess":5,"itemToRemove":{"name":"feuilletabac","type":"item","label":"Feuille de tabac"},"itemToAddQuantity":1,"minimumAccountName":"","itemToAdd":{"name":"tabac","type":"item","label":"Tabac"},"requiresMinimumAccountMoney":false,"itemToRemoveQuantity":25,"animations":[]}', NULL, NULL, NULL, 'Découpe Feuille Tabac', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL),
	(5, 'tabac', 'process', '{"z":"44.52","y":"-39.42","x":"-504.06"}', 'minimumGrade', NULL, 0, '{"timeToProcess":5,"itemToRemove":{"name":"tabac","type":"item","label":"Tabac"},"itemToAddQuantity":1,"minimumAccountName":"","itemToAdd":{"name":"cigarette","type":"item","label":"Cigarette"},"requiresMinimumAccountMoney":false,"itemToRemoveQuantity":3,"animations":[]}', NULL, NULL, NULL, 'Cigarette', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL),
	(6, 'tabac', 'process', '{"z":"44.52","y":"-39.44","x":"-502.26"}', 'minimumGrade', NULL, 0, '{"timeToProcess":5,"itemToRemove":{"name":"cigarette","type":"item","label":"Cigarette"},"itemToAddQuantity":1,"minimumAccountName":"","itemToAdd":{"name":"paquetcigarette","type":"item","label":"Paquet de cigarettes"},"requiresMinimumAccountMoney":false,"itemToRemoveQuantity":20,"animations":[]}', NULL, NULL, NULL, 'Paquet de Cigarette', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, NULL, NULL, NULL, NULL),
	(7, 'tabac', 'market', '{"x":"1249.60","z":"4.88","y":"-3176.04"}', 'minimumGrade', NULL, 0, '{"percentageForSociety":100,"items":[{"minPrice":120,"blackMoney":false,"maxPrice":120,"sellTime":1,"object":{"type":"item","label":"Paquet de cigarettes","name":"paquetcigarette"}}]}', 8, 12, 0.7, 'Vente', 1, 1.5, 1.5, 0.5, 255, 255, 0, 50, 'a_m_m_tramp_01', 294.19, NULL, NULL);

-- Listage de la structure de table paris_horizon_base_dev. jobs_garages
DROP TABLE IF EXISTS `jobs_garages`;
CREATE TABLE IF NOT EXISTS `jobs_garages` (
  `vehicle_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `marker_id` int(11) NOT NULL,
  `vehicle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `vehicle_props` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`) USING BTREE,
  KEY `identifier` (`identifier`,`marker_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs_garages : ~0 rows (environ)
DELETE FROM `jobs_garages`;

-- Listage de la structure de table paris_horizon_base_dev. jobs_shops
DROP TABLE IF EXISTS `jobs_shops`;
CREATE TABLE IF NOT EXISTS `jobs_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marker_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_type` varchar(50) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `marker_id` (`marker_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs_shops : ~0 rows (environ)
DELETE FROM `jobs_shops`;

-- Listage de la structure de table paris_horizon_base_dev. jobs_wardrobes
DROP TABLE IF EXISTS `jobs_wardrobes`;
CREATE TABLE IF NOT EXISTS `jobs_wardrobes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  `outfit` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.jobs_wardrobes : ~0 rows (environ)
DELETE FROM `jobs_wardrobes`;

-- Listage de la structure de table paris_horizon_base_dev. job_grades
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.job_grades : ~125 rows (environ)
DELETE FROM `job_grades`;
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`) VALUES
	(166, 'police_nationale', 4, 'Commissaire de Police', 'Commissaire de Police', 2500),
	(167, 'police_nationale', 2, 'Capitaine de Police', 'Capitaine de Police', 1900),
	(168, 'police_nationale', 3, 'Commandant de Police', 'Commandant de Police', 2100),
	(169, 'police_nationale', 0, 'Gardien de la Paix', 'Gardien de la Paix', 1500),
	(170, 'police_nationale', 1, 'Lieutenant de Police', 'Lieutenant de Police', 1700),
	(171, 'lawyer', 0, 'Associate', 'Associate', 50),
	(172, 'samu_75', 4, 'Directeur du SAMU 75', 'Directeur du SAMU 75', 2500),
	(173, 'samu_75', 2, 'Médecin Urgentiste', 'Médecin Urgentiste', 1900),
	(174, 'samu_75', 3, 'Médecin-Chef', 'Médecin-Chef', 2100),
	(175, 'samu_75', 0, 'Interne ', 'Interne ', 1500),
	(176, 'samu_75', 1, 'Infirmier ', 'Infirmier ', 1700),
	(177, 'otacos', 4, 'Directeur', 'Directeur', 2500),
	(178, 'otacos', 2, 'Chef de Cuisine', 'Chef de Cuisine', 1900),
	(179, 'otacos', 3, 'Responsable de Salle', 'Responsable de Salle', 2100),
	(180, 'otacos', 0, 'Stagiaire Cuisine', 'Stagiaire Cuisine', 1500),
	(181, 'otacos', 1, 'Employé ', 'Employé ', 1700),
	(182, 'garbage', 0, 'Collector', 'Collector', 50),
	(183, 'brinks', 4, 'Directeur', 'Directeur', 2500),
	(184, 'brinks', 2, 'Chef d\'Équipe', 'Chef d\'Équipe', 1900),
	(185, 'brinks', 3, 'Responsable Logistique', 'Responsable Logistique', 2100),
	(186, 'brinks', 0, 'Agent de Sécurité', 'Agent de Sécurité', 1500),
	(187, 'brinks', 1, 'Convoyeur de Fonds', 'Convoyeur de Fonds', 1700),
	(188, 'vineyard', 0, 'Picker', 'Picker', 50),
	(189, 'trucker', 0, 'Driver', 'Driver', 50),
	(190, 'burgerking', 4, 'Directeur', 'Directeur', 2500),
	(191, 'burgerking', 2, 'Chef de Cuisine', 'Chef de Cuisine', 1900),
	(192, 'burgerking', 3, 'Manager / Responsable', 'Manager / Responsable', 2100),
	(193, 'burgerking', 0, 'Stagiaire Cuisine', 'Stagiaire Cuisine', 1500),
	(194, 'burgerking', 1, 'Employé Polyvalent', 'Employé Polyvalent', 1700),
	(195, 'vigneron', 4, 'Propriétaire', 'Propriétaire', 2500),
	(196, 'vigneron', 2, 'Responsable de Production', 'Responsable de Production', 1900),
	(197, 'vigneron', 3, 'Responsable des Ventes', 'Responsable des Ventes', 2100),
	(198, 'vigneron', 0, 'Ouvrier Viticole', 'Ouvrier Viticole', 1500),
	(199, 'vigneron', 1, 'Vigneron', 'Vigneron', 1700),
	(200, 'taxi', 4, 'Patron ', 'Patron ', 2500),
	(201, 'taxi', 2, 'Chauffeur Expérimenté', 'Chauffeur Expérimenté', 1900),
	(202, 'taxi', 3, 'Responsable de Flotte', 'Responsable de Flotte', 2100),
	(203, 'taxi', 0, 'Stagiaire Taxi', 'Stagiaire Taxi', 1500),
	(204, 'taxi', 1, 'Chauffeur Taxi', 'Chauffeur Taxi', 1700),
	(205, 'judge', 0, 'Judge', 'Judge', 100),
	(206, 'orpi', 4, 'PDG ORPI', 'PDG ORPI', 2500),
	(207, 'orpi', 2, 'Conseiller Immobilier', 'Conseiller Immobilier', 1900),
	(208, 'orpi', 3, 'Responsable des Ventes', 'Responsable des Ventes', 2100),
	(209, 'orpi', 0, 'Assistant Commercial', 'Assistant Commercial', 1500),
	(210, 'orpi', 1, 'Agent Immobilier', 'Agent Immobilier', 1700),
	(211, 'tf1', 4, 'Directeur Général', 'Directeur Général', 2500),
	(212, 'tf1', 2, 'Rédacteur en Chef', 'Rédacteur en Chef', 1900),
	(213, 'tf1', 3, 'Directeur des Programmes', 'Directeur des Programmes', 2100),
	(214, 'tf1', 0, 'Stagiaire Journaliste', 'Stagiaire Journaliste', 1500),
	(215, 'tf1', 1, 'Journaliste', 'Journaliste', 1700),
	(216, 'bus', 0, 'Driver', 'Driver', 50),
	(217, 'unemployed', 0, 'Demandeur d\'emploie', 'Demandeur d\'emploie', 550),
	(218, 'reporter', 0, 'Journalist', 'Journalist', 50),
	(219, 'dir', 4, 'Directeur Général DIR', 'Directeur Général DIR', 2500),
	(220, 'dir', 2, 'Responsable de Secteur', 'Responsable de Secteur', 1900),
	(221, 'dir', 3, 'Directeur des Travaux', 'Directeur des Travaux', 2100),
	(222, 'dir', 0, 'Agent Routier', 'Agent Routier', 1500),
	(223, 'dir', 1, 'Chef d\'Équipe', 'Chef d\'Équipe', 1700),
	(224, 'xpo', 4, 'Directeur', 'Directeur', 2500),
	(225, 'xpo', 2, 'Chef d\'Équipe Logistique', 'Chef d\'Équipe Logistique', 1900),
	(226, 'xpo', 3, 'Responsable d\'Entrepôt', 'Responsable d\'Entrepôt', 2100),
	(227, 'xpo', 0, 'Chauffeur-Livreur', 'Chauffeur-Livreur', 1500),
	(228, 'xpo', 1, 'Conducteur Poids-Lourd', 'Conducteur Poids-Lourd', 1700),
	(229, 'pompiers_de_paris', 4, 'Colonel ', 'Colonel ', 2500),
	(230, 'pompiers_de_paris', 2, 'Caporal-Chef', 'Caporal-Chef', 1900),
	(231, 'pompiers_de_paris', 3, 'Adjudant-Chef', 'Adjudant-Chef', 2100),
	(232, 'pompiers_de_paris', 0, 'Sapeur 2ᵉ Classe', 'Sapeur 2ᵉ Classe', 1500),
	(233, 'pompiers_de_paris', 1, 'Sapeur 1ʳᵉ Classe', 'Sapeur 1ʳᵉ Classe', 1700),
	(234, 'mairie', 4, 'Maire ', 'Maire ', 2500),
	(235, 'mairie', 2, 'Responsable voirie', 'Responsable voirie', 1900),
	(236, 'mairie', 3, 'Adjoint au Maire', 'Adjoint au Maire', 2100),
	(237, 'mairie', 0, 'Stagiaire ', 'Stagiaire ', 1500),
	(238, 'mairie', 1, 'Secrétaire ', 'Secrétaire ', 1700),
	(239, 'tabac', 4, 'Patron  ', 'Patron  ', 2500),
	(240, 'tabac', 2, 'Préparateur  ', 'Préparateur  ', 1900),
	(241, 'tabac', 3, 'Responsable de Vente  ', 'Responsable de Vente  ', 2100),
	(242, 'tabac', 0, 'Apprenti  ', 'Apprenti  ', 1500),
	(243, 'tabac', 1, 'Ouvrier  ', 'Ouvrier  ', 1700),
	(244, 'kfc', 4, 'Directeur ', 'Directeur ', 2500),
	(245, 'kfc', 2, 'Chef de Cuisine', 'Chef de Cuisine', 1900),
	(246, 'kfc', 3, 'Manager ', 'Manager ', 2100),
	(247, 'kfc', 0, 'Stagiaire Cuisine', 'Stagiaire Cuisine', 1500),
	(248, 'kfc', 1, 'Employé Polyvalent', 'Employé Polyvalent', 1700),
	(249, 'norauto', 4, 'Directeur', 'Directeur', 2500),
	(250, 'norauto', 2, 'Mécanicien Confirmé', 'Mécanicien Confirmé', 1900),
	(251, 'norauto', 3, 'Chef d\'Atelier', 'Chef d\'Atelier', 2100),
	(252, 'norauto', 0, 'Apprenti Mécanicien', 'Apprenti Mécanicien', 1500),
	(253, 'norauto', 1, 'Mécanicien ', 'Mécanicien ', 1700),
	(254, 'avocats_de_paris', 4, 'Bâtonnier', 'Bâtonnier', 2500),
	(255, 'avocats_de_paris', 2, 'Avocat Confirmé', 'Avocat Confirmé', 1900),
	(256, 'avocats_de_paris', 3, 'Associé du Cabinet ', 'Associé du Cabinet ', 2100),
	(257, 'avocats_de_paris', 0, 'Stagiaire en Droit', 'Stagiaire en Droit', 1500),
	(258, 'avocats_de_paris', 1, 'Avocat Junior', 'Avocat Junior', 1700),
	(259, 'hotdog', 0, 'Sales', 'Sales', 50),
	(260, 'tow', 0, 'Driver', 'Driver', 50),
	(261, 'concessionnaire', 4, 'Directeur', 'Directeur', 2500),
	(262, 'concessionnaire', 2, 'Conseiller Commercial', 'Conseiller Commercial', 1900),
	(263, 'concessionnaire', 3, 'Responsable des Ventes', 'Responsable des Ventes', 2100),
	(264, 'concessionnaire', 0, 'Stagiaire ', 'Stagiaire ', 1500),
	(265, 'concessionnaire', 1, 'Vendeur ', 'Vendeur ', 1700),
	(266, 'pizza', 4, 'Directeur ', 'Directeur ', 2500),
	(267, 'pizza', 2, 'Chef de Cuisine', 'Chef de Cuisine', 1900),
	(268, 'pizza', 3, 'Manager ', 'Manager ', 2100),
	(269, 'pizza', 0, 'Stagiaire Cuisine', 'Stagiaire Cuisine', 1500),
	(270, 'pizza', 1, 'Employé Polyvalent', 'Employé Polyvalent', 1700),
	(271, 'casino', 4, 'Propriétaire ', 'Propriétaire ', 2500),
	(272, 'casino', 2, 'Responsable des Jeux', 'Responsable des Jeux', 1900),
	(273, 'casino', 3, 'Directeur de Salle', 'Directeur de Salle', 2100),
	(274, 'casino', 0, 'Croupier', 'Croupier', 1500),
	(275, 'casino', 1, 'Agent de Sécurité', 'Agent de Sécurité', 1700),
	(276, 'midas', 4, 'Directeur ', 'Directeur ', 2500),
	(277, 'midas', 2, 'Technicien Automobile', 'Technicien Automobile', 1900),
	(278, 'midas', 3, 'Chef d\'Atelier', 'Chef d\'Atelier', 2100),
	(279, 'midas', 0, 'Apprenti Mécanicien', 'Apprenti Mécanicien', 1500),
	(280, 'midas', 1, 'Mécanicien ', 'Mécanicien ', 1700),
	(281, 'vinci', 4, 'Directeur', 'Directeur', 2500),
	(282, 'vinci', 2, 'Conducteur de Travaux', 'Conducteur de Travaux', 1900),
	(283, 'vinci', 3, 'Responsable de Chantier', 'Responsable de Chantier', 2100),
	(284, 'vinci', 0, 'Ouvrier', 'Ouvrier', 1500),
	(285, 'vinci', 1, 'Chef d\'Equipe', 'Chef d\'Equipe', 1700),
	(286, 'gendarmerie_nationale', 4, 'Général de Brigade', 'Général de Brigade', 2500),
	(287, 'gendarmerie_nationale', 2, 'Lieutenant ', 'Lieutenant ', 1900),
	(288, 'gendarmerie_nationale', 3, 'Commandant', 'Commandant', 2100),
	(289, 'gendarmerie_nationale', 0, 'Gendarme', 'Gendarme', 1500),
	(290, 'gendarmerie_nationale', 1, 'Adjudant-Chef', 'Adjudant-Chef', 1700);

-- Listage de la structure de table paris_horizon_base_dev. lapraces
DROP TABLE IF EXISTS `lapraces`;
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.lapraces : ~0 rows (environ)
DELETE FROM `lapraces`;

-- Listage de la structure de table paris_horizon_base_dev. management_outfits
DROP TABLE IF EXISTS `management_outfits`;
CREATE TABLE IF NOT EXISTS `management_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `minrank` int(11) NOT NULL DEFAULT 0,
  `name` varchar(50) NOT NULL DEFAULT 'Cool Outfit',
  `gender` varchar(50) NOT NULL DEFAULT 'male',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.management_outfits : ~0 rows (environ)
DELETE FROM `management_outfits`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_bolos
DROP TABLE IF EXISTS `mdt_bolos`;
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_bolos : ~0 rows (environ)
DELETE FROM `mdt_bolos`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_bulletin
DROP TABLE IF EXISTS `mdt_bulletin`;
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_bulletin : ~0 rows (environ)
DELETE FROM `mdt_bulletin`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_clocking
DROP TABLE IF EXISTS `mdt_clocking`;
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_clocking : ~0 rows (environ)
DELETE FROM `mdt_clocking`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_convictions
DROP TABLE IF EXISTS `mdt_convictions`;
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_convictions : ~0 rows (environ)
DELETE FROM `mdt_convictions`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_data
DROP TABLE IF EXISTS `mdt_data`;
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_data : ~0 rows (environ)
DELETE FROM `mdt_data`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_impound
DROP TABLE IF EXISTS `mdt_impound`;
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_impound : ~0 rows (environ)
DELETE FROM `mdt_impound`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_incidents
DROP TABLE IF EXISTS `mdt_incidents`;
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_incidents : ~0 rows (environ)
DELETE FROM `mdt_incidents`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_logs
DROP TABLE IF EXISTS `mdt_logs`;
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_logs : ~0 rows (environ)
DELETE FROM `mdt_logs`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_reports
DROP TABLE IF EXISTS `mdt_reports`;
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_reports : ~0 rows (environ)
DELETE FROM `mdt_reports`;

-- Listage de la structure de table paris_horizon_base_dev. mdt_vehicleinfo
DROP TABLE IF EXISTS `mdt_vehicleinfo`;
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_vehicleinfo : ~0 rows (environ)
DELETE FROM `mdt_vehicleinfo`;
INSERT INTO `mdt_vehicleinfo` (`id`, `plate`, `information`, `stolen`, `code5`, `image`, `points`) VALUES
	(1, '', '', 0, 0, '', 0);

-- Listage de la structure de table paris_horizon_base_dev. mdt_weaponinfo
DROP TABLE IF EXISTS `mdt_weaponinfo`;
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.mdt_weaponinfo : ~0 rows (environ)
DELETE FROM `mdt_weaponinfo`;

-- Listage de la structure de table paris_horizon_base_dev. occasion_vehicles
DROP TABLE IF EXISTS `occasion_vehicles`;
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.occasion_vehicles : ~0 rows (environ)
DELETE FROM `occasion_vehicles`;

-- Listage de la structure de table paris_horizon_base_dev. okokbanking_societies
DROP TABLE IF EXISTS `okokbanking_societies`;
CREATE TABLE IF NOT EXISTS `okokbanking_societies` (
  `society` varchar(255) DEFAULT NULL,
  `society_name` varchar(255) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `iban` varchar(255) NOT NULL,
  `is_withdrawing` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.okokbanking_societies : ~0 rows (environ)
DELETE FROM `okokbanking_societies`;

-- Listage de la structure de table paris_horizon_base_dev. okokbanking_transactions
DROP TABLE IF EXISTS `okokbanking_transactions`;
CREATE TABLE IF NOT EXISTS `okokbanking_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `sender_identifier` varchar(255) NOT NULL,
  `sender_name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `value` int(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.okokbanking_transactions : ~63 rows (environ)
DELETE FROM `okokbanking_transactions`;
INSERT INTO `okokbanking_transactions` (`id`, `receiver_identifier`, `receiver_name`, `sender_identifier`, `sender_name`, `date`, `value`, `type`) VALUES
	(1, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 12:18:54', 2100, 'transfer'),
	(2, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 12:28:54', 2100, 'transfer'),
	(3, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 12:38:54', 2100, 'transfer'),
	(4, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 12:48:54', 2100, 'transfer'),
	(5, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 12:58:54', 2100, 'transfer'),
	(6, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 14:11:01', 2100, 'transfer'),
	(7, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 14:21:01', 2100, 'transfer'),
	(8, 'bank', 'Bank (Buy CC)', 'AGM09146', 'steve blajou (Buy CC)', '2025-03-09 14:21:03', 100, 'transfer'),
	(9, 'bank', 'Bank (Buy CC)', 'AGM09146', 'steve blajou (Buy CC)', '2025-03-09 14:31:52', 100, 'transfer'),
	(10, 'bank', 'Bank (PIN)', 'AGM09146', 'steve blajou', '2025-03-09 14:32:20', 0, 'transfer'),
	(11, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 16:44:08', 2100, 'transfer'),
	(12, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 16:54:08', 2100, 'transfer'),
	(13, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 17:04:08', 2100, 'transfer'),
	(14, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 17:14:08', 2100, 'transfer'),
	(15, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 17:24:08', 2100, 'transfer'),
	(16, 'AGM09146', 'steve blajou', 'bank', 'Bank Account', '2025-03-09 19:53:12', 500, 'withdraw'),
	(17, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 19:54:09', 2100, 'transfer'),
	(18, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:04:09', 2100, 'transfer'),
	(19, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:14:09', 2100, 'transfer'),
	(20, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:24:09', 2100, 'transfer'),
	(21, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:34:09', 2100, 'transfer'),
	(22, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:44:09', 2100, 'transfer'),
	(23, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 20:54:09', 2100, 'transfer'),
	(24, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 21:04:09', 2100, 'transfer'),
	(25, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 21:14:09', 2100, 'transfer'),
	(26, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 21:24:09', 2100, 'transfer'),
	(27, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 22:04:09', 2100, 'transfer'),
	(28, 'AYN44292', 'Gino Blajou', 'salary', 'Salary', '2025-03-09 22:04:09', 2500, 'transfer'),
	(29, 'AYN44292', 'Gino Blajou', 'salary', 'Salary', '2025-03-09 22:14:09', 2500, 'transfer'),
	(30, 'OJT10595', 'n h', 'salary', 'Salary', '2025-03-09 22:14:09', 10, 'transfer'),
	(31, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 22:14:09', 2100, 'transfer'),
	(32, 'AYN44292', 'Gino Blajou', 'salary', 'Salary', '2025-03-09 22:24:09', 2500, 'transfer'),
	(33, 'OJT10595', 'n h', 'salary', 'Salary', '2025-03-09 22:24:09', 10, 'transfer'),
	(34, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 22:24:09', 2100, 'transfer'),
	(35, 'AGM09146', 'steve blajou (voiture)', 'UYK15733', 'ttttttttttttt tttttttttttttttttt (voiture)', '2025-03-09 22:27:12', 15000, 'transfer'),
	(36, 'OJT10595', 'n h', 'salary', 'Salary', '2025-03-09 22:34:09', 10, 'transfer'),
	(37, 'AYN44292', 'Gino Blajou', 'salary', 'Salary', '2025-03-09 22:34:09', 2500, 'transfer'),
	(38, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 22:34:09', 2100, 'transfer'),
	(39, 'AGM09146', 'steve blajou', 'salary', 'Salary', '2025-03-09 22:44:09', 2100, 'transfer'),
	(40, 'OJT10595', 'n h', 'salary', 'Salary', '2025-03-09 22:44:09', 10, 'transfer'),
	(41, 'AYN44292', 'Gino Blajou', 'salary', 'Salary', '2025-03-09 22:44:09', 2500, 'transfer'),
	(42, 'bank', 'Bank (Buy CC)', 'UYK15733', 'ttttttttttttt tttttttttttttttttt (Buy CC)', '2025-03-09 23:25:12', 100, 'transfer'),
	(43, 'bank', 'Bank (PIN)', 'UYK15733', 'ttttttttttttt tttttttttttttttttt', '2025-03-09 23:25:39', 0, 'transfer'),
	(44, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 00:08:57', 2500, 'transfer'),
	(45, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 00:38:57', 2500, 'transfer'),
	(46, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 10:14:40', 2500, 'transfer'),
	(47, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 10:44:40', 2500, 'transfer'),
	(48, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 11:14:40', 2500, 'transfer'),
	(49, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 11:44:40', 2500, 'transfer'),
	(50, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 14:14:08', 2500, 'transfer'),
	(51, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 20:43:45', 2500, 'transfer'),
	(52, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 21:13:45', 2500, 'transfer'),
	(53, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 23:10:53', 2500, 'transfer'),
	(54, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-10 23:58:59', 2500, 'transfer'),
	(55, 'AYN44292', 'Gino Blajou', 'salary', 'Salaire', '2025-03-10 23:58:59', 2100, 'transfer'),
	(56, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-11 00:28:59', 2500, 'transfer'),
	(57, 'AYN44292', 'Gino Blajou', 'salary', 'Salaire', '2025-03-11 00:28:59', 2100, 'transfer'),
	(58, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-11 00:58:59', 2500, 'transfer'),
	(59, 'AYN44292', 'Gino Blajou', 'salary', 'Salaire', '2025-03-11 00:58:59', 2100, 'transfer'),
	(60, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 01:42:41', 2500, 'transfer'),
	(61, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-11 12:00:56', 2500, 'transfer'),
	(62, 'AGM09146', 'steve blajou', 'salary', 'Salaire', '2025-03-11 12:30:56', 2500, 'transfer'),
	(63, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 15:51:33', 2500, 'transfer'),
	(64, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 16:21:33', 2500, 'transfer'),
	(65, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 16:51:33', 2500, 'transfer'),
	(66, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 17:21:33', 2500, 'transfer'),
	(67, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 17:51:34', 2500, 'transfer'),
	(68, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 'salary', 'Salaire', '2025-03-11 18:21:34', 2500, 'transfer');

-- Listage de la structure de table paris_horizon_base_dev. okokbilling
DROP TABLE IF EXISTS `okokbilling`;
CREATE TABLE IF NOT EXISTS `okokbilling` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_id` varchar(10) NOT NULL,
  `receiver_identifier` varchar(255) NOT NULL,
  `receiver_name` varchar(255) NOT NULL,
  `author_identifier` varchar(255) NOT NULL,
  `author_name` varchar(255) NOT NULL,
  `society` varchar(255) NOT NULL,
  `society_name` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `invoice_value` int(11) NOT NULL,
  `fees_amount` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `notes` longtext DEFAULT ' ',
  `sent_date` varchar(255) NOT NULL,
  `limit_pay_date` varchar(255) NOT NULL,
  `paid_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.okokbilling : ~0 rows (environ)
DELETE FROM `okokbilling`;

-- Listage de la structure de table paris_horizon_base_dev. phone_accounts
DROP TABLE IF EXISTS `phone_accounts`;
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_accounts : ~0 rows (environ)
DELETE FROM `phone_accounts`;

-- Listage de la structure de table paris_horizon_base_dev. phone_alertjobs
DROP TABLE IF EXISTS `phone_alertjobs`;
CREATE TABLE IF NOT EXISTS `phone_alertjobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job` varchar(255) NOT NULL,
  `alerts` longtext DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `job` (`job`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_alertjobs : ~2 rows (environ)
DELETE FROM `phone_alertjobs`;
INSERT INTO `phone_alertjobs` (`id`, `job`, `alerts`, `date`) VALUES
	(1, 'police_national', '[]', '2025-03-03 13:06:43'),
	(2, 'concessionnaire', '[{"img":"none","message":"(ID: 2) test","phone":"6769228213","alertID":1,"location":{"x":1146.9105224609376,"y":2647.7568359375,"z":39.7568359375}}]', '2025-03-08 22:16:12');

-- Listage de la structure de table paris_horizon_base_dev. phone_chats
DROP TABLE IF EXISTS `phone_chats`;
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_chats : ~0 rows (environ)
DELETE FROM `phone_chats`;

-- Listage de la structure de table paris_horizon_base_dev. phone_crypto
DROP TABLE IF EXISTS `phone_crypto`;
CREATE TABLE IF NOT EXISTS `phone_crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'btc',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_crypto : ~0 rows (environ)
DELETE FROM `phone_crypto`;
INSERT INTO `phone_crypto` (`crypto`, `worth`, `history`) VALUES
	('btc', 1002, '[{"PreviousWorth":998,"NewWorth":998},{"PreviousWorth":998,"NewWorth":998},{"PreviousWorth":998,"NewWorth":998},{"PreviousWorth":998,"NewWorth":1002}]');

-- Listage de la structure de table paris_horizon_base_dev. phone_gallery
DROP TABLE IF EXISTS `phone_gallery`;
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_gallery : ~0 rows (environ)
DELETE FROM `phone_gallery`;

-- Listage de la structure de table paris_horizon_base_dev. phone_invoices
DROP TABLE IF EXISTS `phone_invoices`;
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_invoices : ~0 rows (environ)
DELETE FROM `phone_invoices`;

-- Listage de la structure de table paris_horizon_base_dev. phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(46) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_messages : ~0 rows (environ)
DELETE FROM `phone_messages`;

-- Listage de la structure de table paris_horizon_base_dev. phone_news
DROP TABLE IF EXISTS `phone_news`;
CREATE TABLE IF NOT EXISTS `phone_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_news : ~0 rows (environ)
DELETE FROM `phone_news`;

-- Listage de la structure de table paris_horizon_base_dev. phone_notifies
DROP TABLE IF EXISTS `phone_notifies`;
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_notifies : ~0 rows (environ)
DELETE FROM `phone_notifies`;

-- Listage de la structure de table paris_horizon_base_dev. phone_tweets
DROP TABLE IF EXISTS `phone_tweets`;
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.phone_tweets : ~0 rows (environ)
DELETE FROM `phone_tweets`;

-- Listage de la structure de table paris_horizon_base_dev. players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `apps` text DEFAULT NULL,
  `widget` text DEFAULT NULL,
  `bt` text DEFAULT NULL,
  `cryptocurrency` longtext DEFAULT NULL,
  `cryptocurrencytransfers` text DEFAULT NULL,
  `phonePos` text DEFAULT NULL,
  `spotify` text DEFAULT NULL,
  `ringtone` text DEFAULT NULL,
  `first_screen_showed` int(11) DEFAULT NULL,
  `inside` varchar(50) DEFAULT '',
  `pincode` int(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=1919 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.players : ~8 rows (environ)
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `apps`, `widget`, `bt`, `cryptocurrency`, `cryptocurrencytransfers`, `phonePos`, `spotify`, `ringtone`, `first_screen_showed`, `inside`, `pincode`) VALUES
	(10, 'AGM09146', 1, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'Minox', '{"printedbills":0,"cash":29900,"bank":197840.0,"blackmoney":3269,"crypto":0}', '{"birthdate":"1991-11-19","cid":1,"phone":"6769228213","account":"FR0799784442","firstname":"steve","lastname":"blajou","gender":0,"nationality":"France"}', '{"label":"Norauto","name":"norauto","type":"mechanic","grade":{"level":4,"name":"Directeur","payment":2500,"isboss":true},"isboss":true,"onduty":true}', '{"label":"Cité Barbès","name":"barbes","isboss":true,"grade":{"level":3,"name":"Le Boss","isboss":true}}', '{"x":-144.6725311279297,"y":-1503.5340576171876,"z":33.4754638671875}', '{"vehicleKeys":{"28DFI585":true,"63AUM712":true,"83URG179":true,"43HPK942":true,"87MSQ534":true,"62BPA895":true,"85XVD977":true,"63ULI685":true,"69OHQ469":true,"89OHP113":true,"81FGQ922":true,"09CAS434":true,"25LYX785":true,"27NTX501":true,"23EHN269":true,"46UGK006":true,"83NMC176":true,"88ONB961":true,"68JGP119":true,"00PVD050":true,"RT3475":true,"81QKK282":true,"48KAD911":true,"68VWE646":true,"68TBV707":true,"25IET158":true,"42YOJ805":true,"05OHQ233":true,"63INP527":true,"80EJU793":true,"44ZSS750":true,"68IAB186":true,"84PUW491":true,"27SXE142":true,"44EUQ153":true,"03MHG711":true,"89OWN723":true,"65EOQ708":true,"43FAX598":true,"28MGP755":true,"27KCP324":true,"84ZOH056":true,"25HRN092":true,"22BXB297":true,"25GBF037":true,"45PBA826":true,"43KPY965":true,"86JHO305":true,"26MQP420":true,"08GOY459":true,"62KEV867":true,"41YBU103":true,"08MBT572":true,"63UKL390":true,"27IEO144":true,"87NLT732":true,"68YZX837":true,"42BLW334":true,"66IMT108":true,"22EXQ375":true,"02UUU920":true,"63XLO490":true,"69UUV708":true,"01UJJ019":true,"85FPO026":true,"82UOM114":true,"07IOO665":true,"42YYO343":true,"01MPJ375":true,"08WQV315":true,"84OII597":true,"65NPL734":true,"46LED754":true,"68CRC787":true,"44MGD859":true,"86GGL305":true,"05WMI402":true,"63LSR384":true,"85OYB303":true,"48RAJ944":true,"84KQI946":true,"62OSU169":true,"80OJJ773":true,"65AYY127":true,"25ANV565":true,"00FNW752":true,"60NLO687":true,"27CLL208":true,"03NKP839":true,"24ZEJ234":true,"89LTX518":true,"62KZL367":true,"42KKT663":true,"9AJ909WP":true,"06QJH860":true,"02CRV789":true,"03DUA664":true,"84CTV697":true,"02UNA475":true,"65YQV701":true,"26LIZ453":true,"88HOY859":true,"28YXE941":true,"87SSF291":true,"05FEE421":true,"00NTH256":true,"46BCR583":true,"23GQB038":true,"08KKW956":true,"08PYL122":true,"43UMM351":true,"43TIM863":true,"43CJU575":true,"60JJN227":true,"41HCY019":true,"01DGK421":true,"22JYK753":true,"03MMA742":true,"69EOF166":true,"25VQF771":true,"80GZB906":true,"20BRE266":true,"62HSI503":true,"20PTW989":true,"62ZVD997":true,"86VBI866":true,"29JUP402":true,"24JND473":true,"48WGA391":true,"82ZZR149":true,"02QOD433":true,"62SPT094":true,"28KZO650":true,"82KJI449":true,"83EHV815":true,"83LRX592":true,"01QEE672":true,"61CDQ208":true,"26FMR549":true,"44OQL397":true,"22ZKQ121":true,"20STB864":true,"24ADW683":true,"44FQZ674":true,"02EZU885":true,"66KAQ050":true,"26OHQ845":true,"62BIA615":true,"08HGK010":true,"25GGY572":true,"25QEG999":true,"64GJH496":true,"84FYV452":true,"01MGW573":true,"43IGP439":true,"61TMV896":true,"27KXW346":true,"28USA643":true,"09VYS801":true,"89ZYM668":true,"64NPY803":true,"45EJR518":true,"02CUA023":true,"06AHF358":true,"03DJK816":true,"62GWV574":true,"42GZL214":true,"03VQE665":true,"26UWA638":true,"81AXS877":true,"42DFZ104":true,"41JII719":true,"41IGW398":true,"45NUU605":true,"42PRQ718":true,"41TDG519":true,"06SAD065":true,"84DPC282":true,"89RQT277":true,"84NWO515":true,"84KTY664":true,"02FQR122":true,"29HNN419":true,"69FKO608":true,"86GYQ152":true,"66TBK711":true,"62MZX643":true,"02EFZ207":true,"88JCY296":true,"22ZGL921":true,"89RUN093":true,"60ILH949":true,"41ZDE583":true,"63VNP228":true,"41GLB972":true,"04AZB081":true,"47FAO912":true,"28YPY253":true,"23DUD069":true,"26CMF399":true,"87LVM014":true,"61YID940":true,"82KPM348":true,"24FJC080":true,"61BTT388":true,"27FCN784":true,"24OHV649":true,"03GHL220":true,"08JKO382":true,"03WHB981":true,"88DXL730":true,"69VMD565":true,"47UDY622":true,"27YJN404":true,"RT3767":true,"65OHZ596":true,"29JAQ635":true,"02WHG550":true,"42EOK784":true,"25GRM725":true,"61EHO331":true,"42KGX106":true,"61BGW807":true,"01FUN874":true,"27GOE855":true,"09JKR246":true,"22AIV222":true,"27JHT110":true,"65SUW058":true,"42SQF775":true,"05KFP973":true,"26ROW945":true,"69JTM200":true,"02FVY326":true,"08GNP011":true,"82AOG343":true,"03HFL469":true,"03TMF778":true,"86CQP826":true,"RT7628":true,"60KGH446":true,"24URR255":true,"27DDG977":true,"09JTS517":true,"60NDR234":true,"84OJU215":true,"07BKP948":true,"23ONL651":true,"41APO700":true,"48EJN478":true,"27JQJ168":true,"87JRN187":true,"65UTM110":true,"43WUH507":true,"61PPJ932":true,"RT1933":true,"62IFF605":true,"49MXM431":true,"44TIN325":true,"26SZZ536":true,"68ASL161":true,"86CTQ328":true,"25YTN958":true,"66ZRV902":true,"82ENV300":true,"42NGM064":true,"29QWI568":true,"46EJS147":true,"46FSW000":true,"82HBP047":true,"04UKY513":true,"80HSK762":true,"09OVZ985":true,"62FWN702":true,"03HJY315":true,"45NBT918":true,"63CCJ157":true,"47AGD496":true,"49TDF342":true,"60WOZ086":true,"87YRQ763":true,"64YKA358":true,"47FVG941":true,"42JMO465":true,"26JHS512":true,"62NJU536":true,"28NXH517":true,"22QQT892":true,"46CWP558":true,"81LKE382":true,"67HOP030":true,"69PTE284":true,"81ZIV135":true,"84KVF914":true,"00RGT869":true,"45JSY701":true,"88SHV865":true,"03UFF760":true,"44FQW890":true,"08DOU945":true,"64VLA814":true,"22UJF778":true,"81GZA157":true,"22DYI767":true,"85DHQ404":true,"46VFL875":true,"61ZSY451":true,"66MRU306":true,"68PPN263":true,"05ETE435":true,"84QPE576":true,"85YKX015":true,"RT6252":true,"42UWK278":true,"65HDO616":true,"80VSN999":true,"85NEA184":true,"RT6488":true,"64HNM533":true,"80ZNZ668":true,"43PEL493":true,"47LUD748":true,"65OCA228":true,"RT1447":true,"09LRG661":true,"67GWC512":true,"63IWY963":true,"25ZIG500":true,"08WJW085":true,"84EGK230":true,"21SYK835":true,"69MNS415":true,"40VHN192":true,"24YWQ473":true,"26LUL999":true,"60IAC143":true,"07EJQ447":true,"85BLB529":true,"27PEQ823":true,"07ZAA540":true,"07SEY639":true,"25TEK401":true,"82WSQ684":true,"25UXN698":true,"65XFH491":true,"08WAS434":true,"20QVC983":true,"23GCE957":true,"65XAN956":true,"43PIY808":true,"45RQS065":true,"00CHK122":true,"80SES736":true,"88IHS560":true,"47YRC181":true,"00MNW162":true,"63ZCY984":true,"84BYD261":true,"24PCN194":true,"25ZUL210":true,"44PKL352":true,"20WXR931":true,"46LOJ359":true,"64DNS995":true,"27PJE155":true,"40RBW630":true,"29HMS178":true,"RT7440":true,"82ZTX955":true,"62QHP922":true,"02OXW652":true,"48SWQ823":true,"62ONO252":true,"45MDX389":true,"43UBY089":true,"48KYU561":true,"61HKL641":true,"81VCU071":true,"03BJH340":true,"24DXI504":true,"03JVW662":true,"21MBZ505":true,"81ILQ766":true,"22KHG421":true,"88GVP381":true,"23ADC794":true,"21BAR007":true,"22AOY534":true,"29SNC762":true,"87TBS451":true,"64WGT245":true,"87CJP247":true,"88SIH394":true,"81VCM862":true},"hunger":74.40000000000146,"isdead":false,"thirst":77.59999999999855,"tracker":false,"licences":{"weapon":false,"driver":true,"business":false},"rep":[],"communityservice":0,"stress":0,"walletid":"QB-75743926","inside":{"apartment":[]},"inlaststand":false,"bloodtype":"AB-","status":[],"criminalrecord":{"hasRecord":false},"injail":0,"armor":0,"ishandcuffed":false,"phonedata":{"SerialNumber":51763321,"InstalledApps":[]},"jailitems":[],"callsign":"NO CALLSIGN","phone":{"background":"b3"},"fingerprint":"Js455J66Pya5679"}', '[{"slot":1,"amount":1,"type":"item","name":"veh_brakes","info":[]},{"slot":15,"amount":1,"type":"item","name":"vehiclekey","info":{"model":"Honda 2023 ADV 150","plate":"24HLR439","lock":4323}},{"slot":18,"amount":1,"type":"item","name":"veh_transmission","info":[]},{"slot":4,"amount":1,"type":"item","name":"nitrous","info":[]},{"slot":20,"amount":1,"type":"item","name":"veh_engine","info":[]},{"slot":7,"amount":1,"type":"item","name":"vehiclekey","info":{"model":"2016 Audi RS6 C7","plate":"64OMS024","lock":4322}},{"slot":8,"amount":29900,"type":"item","name":"cash","info":[]},{"slot":10,"amount":3269,"type":"item","name":"black","info":[]},{"slot":11,"amount":1,"type":"item","name":"phone","info":[]},{"slot":13,"amount":1,"type":"item","name":"bank_card","info":[]},{"slot":22,"amount":1,"type":"item","name":"veh_suspension","info":[]},{"slot":19,"amount":1,"type":"item","name":"veh_turbo","info":[]}]', '2025-03-11 19:53:16', NULL, NULL, '0', NULL, NULL, NULL, NULL, 'https://www.youtube.com/watch?v=OT216Rrg0jY', 1, '', 1911),
	(25, 'AYN44292', 1, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'Utilisateur', '{"printedbills":0,"cash":541029,"bank":6109650.0,"blackmoney":0,"crypto":0}', '{"birthdate":"1996-03-01","cid":1,"phone":"5121143382","account":"US07QBCore9379507013","nationality":"France","lastname":"Blajou","firstname":"Gino","gender":0}', '{"label":"Concessionnaire","name":"concessionnaire","type":"none","grade":{"level":4,"name":"Directeur","payment":2500,"isboss":true},"isboss":true,"onduty":true}', '{"label":"No Gang","name":"none","grade":{"level":0,"name":"Unaffiliated","isboss":false},"isboss":false}', '{"x":-56.65055084228515,"y":6555.40234375,"z":31.5040283203125}', '{"vehicleKeys":{"88CQJ932":true,"69OAE683":true,"66QLE653":true,"42SPK118":true,"25HLK780":true,"04NUP644":true,"22ESZ994":true,"27JBU860":true,"02ZQT393":true,"28OVC683":true,"40NGN951":true,"42UVS170":true,"09SVK999":true,"82LUC099":true,"49ZLY692":true,"0ZH114LB":true,"20QOL843":true,"RT5726":true,"06HUI984":true,"88OLA559":true,"07ZWJ180":true,"25RNK226":true,"40BBG828":true,"45NWR553":true,"23TOP165":true,"88MVL327":true,"46XJY556":true,"08NQF861":true,"82UNU264":true,"69ZKR711":true,"82IHC002":true,"61TWS222":true,"02UQH508":true,"89GJZ601":true,"47GQQ635":true,"63LWE566":true,"40UBF248":true,"81XGO854":true,"41XAU542":true,"42XGU401":true,"43BNO196":true,"28ACT854":true,"40HXJ727":true,"24QPT231":true,"49QWC718":true,"63XCH007":true,"86XFK049":true,"44BOY873":true,"23NBV342":true,"82XLR791":true,"00MRS412":true,"23YXZ512":true},"hunger":93.60000000000037,"isdead":false,"thirst":94.39999999999964,"tracker":false,"licences":{"weapon":false,"driver":true,"business":false},"rep":[],"communityservice":0,"stress":0,"walletid":"QB-81953538","inside":{"apartment":[]},"phone":{"background":"b31","lockscreen":true,"Pincode":"1112"},"phonedata":{"SerialNumber":42325467,"InstalledApps":[]},"criminalrecord":{"hasRecord":false},"status":[],"injail":0,"armor":0,"ishandcuffed":false,"jailitems":[],"bloodtype":"A+","callsign":"NO CALLSIGN","inlaststand":false,"fingerprint":"Ve309Z17Tcv4283"}', '[{"slot":1,"amount":1,"type":"item","name":"phone","info":[]},{"slot":2,"amount":1,"type":"weapon","name":"weapon_assaultrifle","info":{"ammo":146,"serie":"33gFn9gq318SclH","quality":89.2}},{"slot":3,"amount":1,"type":"weapon","name":"weapon_machinepistol","info":{"ammo":190,"serie":"12hfN7mR981tPDl","quality":74.5}},{"slot":4,"amount":1,"type":"item","name":"joint","info":[]},{"slot":5,"amount":541029,"type":"item","name":"cash","info":[]},{"slot":6,"amount":1,"type":"item","name":"briquet","info":[]},{"slot":7,"amount":1,"type":"item","name":"vehiclekey","info":{"model":"NULL","plate":"09QZC287","lock":4322}},{"slot":9,"amount":1,"type":"item","name":"rentalpapers","info":{"label":"RT5726"}},{"slot":11,"amount":20,"type":"item","name":"cigarette","info":[]},{"slot":16,"amount":1,"type":"item","name":"vehiclekey","info":{"model":"Honda 2023 ADV 150","plate":"82WRC665","lock":4322}},{"slot":21,"amount":2,"type":"item","name":"veh_plates","info":[]},{"slot":29,"amount":2,"type":"item","name":"veh_engine","info":[]},{"slot":30,"amount":1,"type":"item","name":"veh_transmission","info":[]},{"slot":24,"amount":1,"type":"item","name":"tunerlaptop","info":[]},{"slot":28,"amount":2,"type":"item","name":"veh_suspension","info":[]},{"slot":27,"amount":2,"type":"item","name":"nitrous","info":[]},{"slot":23,"amount":1,"type":"item","name":"veh_turbo","info":[]}]', '2025-03-11 18:39:22', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 1, '', NULL),
	(737, 'HVA50742', 1, 'license:35f0f6ff6002a7d9089a12a20dde5c2de4dafb85', 'Darwin Smith', '{"bank":5000,"printedbills":0,"cash":5000124,"crypto":0,"blackmoney":6100}', '{"nationality":"Jamaica","gender":0,"account":"US04QBCore9089776288","lastname":"Wali","cid":1,"birthdate":"1990-09-16","firstname":"Papy","phone":"5483578765"}', '{"name":"unemployed","isboss":true,"label":"RSA","payment":550,"grade":{"name":"Demandeur d\'emploie","level":0,"isboss":true},"type":"none","onduty":false}', '{"grade":{"name":"Unaffiliated","level":0,"isboss":false},"name":"none","label":"No Gang","isboss":false}', '{"x":117.92967224121094,"y":-1022.914306640625,"z":29.3135986328125}', '{"hunger":100,"vehicleKeys":{"49TZA163":true,"29MYU130":true,"60GAN625":true,"23MLQ362":true},"bloodtype":"A-","inside":{"apartment":[]},"jailitems":[],"status":[],"tracker":false,"isdead":false,"criminalrecord":{"hasRecord":false},"ishandcuffed":false,"injail":0,"walletid":"QB-58337534","licences":{"business":false,"weapon":false,"driver":true},"fingerprint":"oI427b01sKM1642","phone":[],"stress":0,"armor":0,"inlaststand":false,"communityservice":0,"phonedata":{"SerialNumber":95674740,"InstalledApps":[]},"callsign":"NO CALLSIGN","thirst":100,"rep":[]}', '[{"slot":1,"name":"phone","info":[],"type":"item","amount":1},{"slot":2,"name":"cash","info":[],"type":"item","amount":5000124},{"slot":3,"name":"weapon_gadgetpistol","info":{"ammo":75,"quality":96.4,"serie":"55VRT5qM139KfpN"},"type":"weapon","amount":1},{"slot":4,"name":"black","info":[],"type":"item","amount":6100},{"slot":16,"name":"scalpel","info":[],"type":"item","amount":1},{"slot":17,"name":"weapon_compactlauncher","info":{"ammo":5,"quality":97.6,"serie":"32KUV2Qe771mqRo"},"type":"weapon","amount":1},{"slot":18,"name":"weapon_snspistol_mk2","info":{"ammo":69,"quality":95.35,"serie":"05rnO1HC002ueup"},"type":"weapon","amount":1},{"slot":19,"name":"weapon_pistol_mk2","info":{"ammo":76,"quality":96.4,"serie":"22CDH6Cg096lHof"},"type":"weapon","amount":1},{"slot":20,"name":"weapon_gazeuse","info":{"ammo":97,"quality":100,"serie":"87TZZ5YW651GrBR"},"type":"weapon","amount":1},{"slot":21,"name":"weapon_handcuffs","info":{"quality":100,"serie":"28RUN3Zy664cwSH"},"type":"weapon","amount":1},{"slot":22,"name":"weapon_stone_hatchet","info":{"quality":100,"serie":"31KJx3wh907QTIe"},"type":"weapon","amount":1},{"slot":23,"name":"weapon_golfclub","info":{"quality":100,"serie":"88QTI8JM999LKqT"},"type":"weapon","amount":1},{"slot":24,"name":"weapon_hominglauncher","info":{"ammo":0,"quality":98.65,"serie":"66TDF6Ok189volJ"},"type":"weapon","amount":1},{"slot":25,"name":"weapon_golfclub","info":{"quality":100,"serie":"64oBB2Dn646LCUn"},"type":"weapon","amount":1},{"slot":13,"name":"weapon_raycarbine","info":{"ammo":73,"quality":97.9,"serie":"31rFm0MI487JvPj"},"type":"weapon","amount":1}]', '2025-03-10 11:43:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(1176, 'OJT10595', 1, 'license:c377cc03bba233a7795a575c699faf8896a26779', 'NicoHydreBZH', '{"bank":5040,"cash":0,"printedbills":0,"crypto":0,"blackmoney":0}', '{"gender":0,"lastname":"h","firstname":"n","birthdate":"2025-03-09","account":"US06QBCore9204760074","nationality":"Anguilla","phone":"2401372616","cid":1}', '{"type":"none","name":"unemployed","label":"Civilian","onduty":true,"payment":10,"isboss":false,"grade":{"name":"Freelancer","level":0}}', '{"grade":{"name":"none","level":0},"isboss":false,"name":"none","label":"No Gang Affiliation"}', '{"x":-1701.4154052734376,"y":-876.3956298828125,"z":7.813232421875}', '{"thirst":96.19999999999982,"vehicleKeys":{"85PKV318":true,"04EGN434":true,"40NMA288":true,"06GSY406":true,"29RCH244":true,"23YWN519":true,"27GWW203":true,"68JCN720":true,"02USO641":true,"25RSX631":true,"83OFH684":true,"42CDM561":true,"83BKT921":true,"25EFB855":true,"20ZUN575":true,"41NVI965":true,"44TXC339":true,"61DRV071":true,"24EYC096":true,"07BPY111":true,"21TJM424":true,"69TEG210":true,"65MTZ948":true,"83MTO079":true,"68GQZ554":true,"62MXK248":true,"24DBW269":true,"42TMO494":true,"44SPC279":true,"80PBF810":true,"61KDB977":true,"09TOQ081":true,"86EEV553":true,"24OEX511":true,"03URO388":true,"07DVE258":true,"61QVO718":true,"88YHP680":true,"24SKI729":true,"42PDQ160":true,"22SMU867":true,"43KQZ673":true,"85LRD044":true,"86ABA997":true,"41LIR689":true,"66ZNA859":true,"27GNO969":true,"82PNV439":true,"45RWA870":true,"83JKT472":true,"88IHV986":true,"02CLR890":true,"68UUY113":true,"86MHF797":true,"62XGA512":true,"88OTO338":true,"08SUA613":true,"45OUU005":true,"85RVQ280":true,"48PZD641":true,"27PDT628":true,"04CXZ158":true,"26IVM457":true,"09NND692":true,"25IEY453":true},"tracker":false,"rep":[],"stress":0,"criminalrecord":{"hasRecord":false},"status":[],"inlaststand":false,"armor":0,"communityservice":0,"hunger":95.79999999999927,"jailitems":[],"phone":[],"ishandcuffed":false,"phonedata":{"InstalledApps":[],"SerialNumber":92962671},"inside":{"apartment":[]},"bloodtype":"B+","callsign":"NO CALLSIGN","walletid":"QB-87245465","isdead":false,"injail":0,"licences":{"business":false,"weapon":false,"driver":true},"fingerprint":"iP546R97OdT1929"}', '[]', '2025-03-09 21:52:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(299, 'PVW49266', 1, 'license:52479ff86d602fad477fe2e7f0449bd9adbf7524', 'Martin Pira', '{"bank":5000,"cash":0,"crypto":0,"printedbills":0,"blackmoney":0}', '{"nationality":"Timor-Leste","birthdate":"2025-03-30","firstname":"test","account":"US04QBCore1716177330","cid":1,"phone":"5233953851","gender":0,"lastname":"test"}', '{"isboss":false,"name":"unemployed","label":"Civilian","payment":10,"type":"none","onduty":true,"grade":{"name":"Freelancer","level":0}}', '{"isboss":false,"name":"none","grade":{"name":"none","level":0},"label":"No Gang Affiliation"}', '{"x":4364.26806640625,"y":7927.0419921875,"z":90.7310791015625}', '{"vehicleKeys":{"47GTE039":true,"02CDK122":true,"42MIU835":true,"87GGF075":true,"44LTV692":true,"85KAZ722":true,"24RKQ591":true,"28PEI814":true,"83CCI509":true,"63SKF922":true,"89JGP590":true,"61SFU102":true,"44SXO585":true,"21UFY761":true,"65WYE538":true,"03MMA742":true,"61HDM399":true,"08VDO124":true,"86LMH121":true,"81PSW155":true,"29FAE287":true,"02NLL157":true,"43KBN836":true,"09VFX037":true,"24RHK467":true,"85RVQ280":true,"29NAG982":true,"48ANV144":true,"44SRM096":true},"injail":0,"armor":0,"jailitems":[],"rep":[],"communityservice":0,"isdead":false,"ishandcuffed":false,"thirst":100,"bloodtype":"AB+","inlaststand":true,"tracker":false,"inside":{"apartment":[]},"criminalrecord":{"hasRecord":false},"status":[],"callsign":"NO CALLSIGN","stress":0,"fingerprint":"lk148w57CrK7567","walletid":"QB-91732189","phonedata":{"SerialNumber":76701027,"InstalledApps":[]},"phone":[],"hunger":100,"licences":{"driver":true,"business":false,"weapon":false}}', '[]', '2025-03-06 22:44:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(253, 'QHY46830', 1, 'license:c27a7d15613e513d7d9ea0512fbf965efe76fde6', 'Piratek', '{"blackmoney":4043,"cash":134,"bank":5000,"printedbills":0,"crypto":0}', '{"account":"US03QBCore9743229222","firstname":"Harture","cid":1,"phone":"3671889882","gender":0,"birthdate":"2025-10-30","lastname":"Harris","nationality":"France"}', '{"isboss":true,"onduty":false,"payment":10,"label":"Civilian","name":"unemployed","grade":{"isboss":true,"level":0,"name":"Freelancer"},"type":"none"}', '{"label":"No Gang","grade":{"isboss":false,"level":0,"name":"Unaffiliated"},"name":"none","isboss":false}', '{"x":4636.826171875,"y":6059.208984375,"z":-142.5208740234375}', '{"criminalrecord":{"hasRecord":false},"isdead":true,"communityservice":0,"stress":1,"armor":0,"fingerprint":"SX940t75FFA8777","bloodtype":"B-","rep":[],"phonedata":{"InstalledApps":[],"SerialNumber":94631505},"inlaststand":false,"phone":[],"tracker":false,"walletid":"QB-48707867","hunger":41.19999999998983,"callsign":"NO CALLSIGN","injail":0,"thirst":46.79999999999745,"vehicleKeys":{"29THZ960":true,"89HAA830":true,"02XGV516":true,"86NCX521":true,"89NYM439":true,"25GAP389":true,"02MVE738":true,"03UTG431":true,"87OBD877":true,"29MLM744":true,"25THQ835":true,"82ZMR896":true,"43ODL830":true,"29ACT306":true,"20XRR976":true,"29HNN419":true,"28PNS512":true,"43ISD360":true,"43IAG066":true,"60ION272":true,"69TON949":true,"45EWR286":true,"60LPL676":true,"20JCA314":true,"89WBY065":true,"21FCG046":true,"44UKA113":true,"65QRI045":true,"65XWC606":true,"81LYD783":true,"69OHY128":true,"60UUQ245":true,"21BSP717":true,"20KOM600":true,"05GUH443":true,"05POQ933":true,"65FGZ986":true,"07VEC143":true,"49VHN484":true,"48THT414":true,"26UHX157":true,"81XVA546":true},"jailitems":[],"ishandcuffed":false,"inside":{"apartment":[]},"licences":{"driver":true,"weapon":false,"business":false},"status":[]}', '[{"slot":1,"name":"cash","type":"item","info":[],"amount":134},{"slot":2,"name":"goldchain","type":"item","info":[],"amount":3},{"slot":6,"name":"black","type":"item","info":[],"amount":4043}]', '2025-03-07 20:58:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(721, 'TBQ82996', 1, 'license:31001c3e939c26f779120b1c743d856795bc523d', 'Kevin le BG', '{"printedbills":0,"cash":2499792,"bank":5000,"blackmoney":0,"crypto":0}', '{"gender":0,"cid":1,"nationality":"Afghanistan","account":"US09QBCore8055772565","firstname":"josiane","lastname":"kader","birthdate":"2025-03-24","phone":"2806165912"}', '{"label":"Police Nationale","onduty":false,"type":"leo","isboss":true,"payment":2500,"name":"police_nationale","grade":{"payment":2500,"name":"Commissaire de Police","level":4,"isboss":true}}', '{"label":"No Gang","name":"none","isboss":false,"grade":{"level":0,"name":"Unaffiliated","isboss":false}}', '{"x":1200.949462890625,"y":2696.38671875,"z":37.906982421875}', '{"vehicleKeys":{"40BSB151":true,"25YIC418":true,"01BEB006":true,"47MFC568":true,"45XGN901":true,"42PVD656":true,"60LBC685":true,"45YSW872":true,"68BLO579":true,"63HNG413":true,"48QYX101":true,"20PRM347":true,"86ZFZ686":true,"89MUV870":true,"20QJB264":true,"09HWO393":true,"29UPN409":true,"45LJU348":true,"28KPH468":true,"22CJW576":true,"26GHM709":true,"85EZH946":true,"88XXL556":true,"83FCQ075":true,"04PKU161":true,"03GWW120":true,"47CYL696":true,"27VGC195":true,"07JII596":true,"89CNE407":true,"08PKL475":true,"43GFM073":true,"27CCD601":true,"62DBP103":true,"62VDW447":true,"40TFW566":true,"22YZD329":true,"06JQB406":true,"86TOQ579":true,"86IEK276":true,"45LGW359":true,"82DOV961":true,"60URR339":true,"02OUO810":true,"40FVU508":true,"88EPY040":true,"60RQK470":true,"40VJC830":true,"44GNY300":true,"66LSC013":true,"28BWZ019":true,"85EDI961":true,"09GKC680":true,"02XGV516":true,"83XTH549":true,"80NUZ045":true,"45MUZ061":true,"63MOT694":true,"40VEP286":true,"29KXU045":true,"23LKQ709":true,"60ARO205":true,"21HJV221":true,"61MXE339":true,"05MQR763":true,"83WFG825":true,"89NDD676":true,"28OCE202":true,"00GQX315":true,"07RGA694":true,"05HVL915":true,"64UVZ654":true,"01HZZ082":true,"25ORX976":true,"88HNE497":true,"46NVL044":true,"63CZC562":true,"89TDX905":true,"04AHH659":true,"29BFE062":true,"48MMU216":true,"64OSB544":true,"26XNI365":true,"84VTA192":true,"40FIZ603":true,"46NUY969":true,"42AYW548":true,"29XCF448":true,"84TDD878":true,"26KJM004":true,"68SQT877":true,"22UGF383":true,"22HRZ436":true,"21TRP033":true,"61YSV746":true,"02VOD142":true,"66MJG637":true,"22IVG035":true,"88HFM057":true,"67RMW346":true,"49JCL029":true,"47AKS708":true,"86TWM756":true,"65DDU989":true,"61FTR184":true,"05WWC301":true,"64MCL789":true,"27COY682":true,"25KBF995":true,"85SAB498":true,"46UQD425":true,"41WCJ856":true,"01HOU296":true,"42VOF501":true,"23DMA766":true,"41VRJ970":true,"29DSY486":true,"60KTI065":true,"45BCI105":true,"82KTF802":true,"48NFA761":true},"hunger":0,"isdead":false,"thirst":10.99999999999454,"tracker":false,"licences":{"weapon":false,"driver":true,"business":false},"rep":[],"communityservice":0,"stress":0,"walletid":"QB-33062122","inside":{"apartment":[]},"inlaststand":false,"status":[],"criminalrecord":{"hasRecord":false},"bloodtype":"AB-","injail":0,"armor":0,"ishandcuffed":false,"phonedata":{"SerialNumber":78290926,"InstalledApps":[]},"jailitems":[],"phone":[],"callsign":"NO CALLSIGN","fingerprint":"AY207O49EZW7345"}', '[{"slot":2,"amount":2499792,"type":"item","name":"cash","info":[]},{"slot":3,"amount":1,"type":"item","name":"chloroform","info":[]},{"slot":5,"amount":1,"type":"item","name":"scalpel","info":[]},{"slot":6,"amount":1,"type":"item","name":"phone","info":[]},{"slot":7,"amount":2,"type":"item","name":"cloth","info":[]},{"slot":8,"amount":1,"type":"weapon","name":"weapon_pumpshotgun","info":{"ammo":38,"serie":"44Czs0Tm296jCbQ","quality":89.2}},{"slot":9,"amount":1,"type":"weapon","name":"weapon_rayminigun","info":{"ammo":0,"serie":"01Zjq1Qi038SqVy","quality":96.25}},{"slot":10,"amount":1,"type":"weapon","name":"weapon_specialcarbine_mk2","info":{"ammo":0,"serie":"14XIu3Bp782xdnD","quality":83.05}},{"slot":11,"amount":1,"type":"weapon","name":"weapon_bottle","info":{"serie":"84gBm8nN956lbCw","quality":100}},{"slot":12,"amount":1,"type":"weapon","name":"weapon_snspistol_mk2","info":{"serie":"12jYF1lx192oPZk","quality":100}},{"slot":13,"amount":1,"type":"weapon","name":"weapon_handcuffs","info":{"serie":"35wCL6cn190ykdr","quality":100}},{"slot":14,"amount":1,"type":"weapon","name":"weapon_snspistol_mk2","info":{"ammo":0,"serie":"66Gtd0Dr597SoXQ","quality":100}},{"slot":15,"amount":1,"type":"weapon","name":"weapon_snspistol_mk2","info":{"ammo":0,"serie":"51Yxq5re297vYvH","quality":100}},{"slot":16,"amount":1,"type":"weapon","name":"weapon_bottle","info":{"serie":"85QYW0ci993ULIi","quality":100}},{"slot":17,"amount":1,"type":"weapon","name":"weapon_specialcarbine_mk2","info":{"ammo":0,"serie":"53zae2qX849fqVp","quality":100}},{"slot":18,"amount":1,"type":"weapon","name":"weapon_compactlauncher","info":{"ammo":0,"serie":"45Lqh4md823Otvd","quality":97.15}},{"slot":19,"amount":1,"type":"weapon","name":"weapon_handcuffs","info":{"serie":"86LWy3CU239AIwb","quality":100}},{"slot":20,"amount":1,"type":"weapon","name":"weapon_rayminigun","info":{"ammo":0,"serie":"90Opo7tp491GcxC","quality":100}},{"slot":24,"amount":1,"type":"weapon","name":"weapon_dagger","info":{"serie":"64lkT6yT459kqOb","quality":100}},{"slot":25,"amount":1,"type":"weapon","name":"weapon_rayminigun","info":{"serie":"97dnp9xU796lbPK","quality":100}}]', '2025-03-11 15:40:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL),
	(1, 'UYK15733', 1, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'Nico', '{"crypto":0,"cash":0,"blackmoney":0,"bank":1999541632.0}', '{"birthdate":"2025-03-05","cid":1,"phone":"9839490898","account":"FR9094566815","nationality":"France","lastname":"tttttttttttttttttt","firstname":"ttttttttttttt","gender":0}', '{"label":"Concessionnaire","onduty":true,"type":"none","isboss":true,"payment":2500,"name":"concessionnaire","grade":{"payment":2500,"name":"Directeur","level":4,"isboss":true}}', '{"label":"No Gang","name":"none","grade":{"level":0,"name":"Unaffiliated","isboss":false},"isboss":false}', '{"x":-1865.90771484375,"y":-332.1626281738281,"z":50.1904296875}', '{"vehicleKeys":{"23DDN405":true,"88BNH335":true,"85RQR950":true,"43KBN836":true,"44CHH353":true,"65KME877":true,"60OUR071":true,"82BCG651":true,"43PIY808":true,"08BQU558":true,"44UDI565":true,"88JDK915":true,"42TUA688":true,"81RYC924":true,"65XSE573":true," RENT 5 ":true," RENT 6 ":true,"24MSE907":true,"41VYB116":true,"85WQX040":true,"28FTF448":true,"42KKT663":true,"06BHI163":true,"47WWK326":true,"24TOP624":true,"83JHS998":true,"64EXU794":true,"83LLA242":true,"07QZI889":true,"27LMI535":true,"63SKF922":true,"22XDS179":true,"44MBO655":true,"27ZJQ217":true,"85VRJ182":true," RENT 1 ":true,"84OMA232":true,"86DPX288":true,"85UYG797":true,"42MFJ708":true,"27XBP892":true,"29KMH369":true,"45GOO560":true,"80IOV483":true,"60BMJ465":true,"62WVR212":true,"00QCC943":true,"82NID711":true,"05NNN923":true," RENT 4 ":true,"67NNF686":true,"07UDT088":true,"42RXV080":true,"81ZUR216":true,"48HSM368":true,"64OMS024":true,"40NCA547":true,"43QXJ805":true,"06GQM969":true,"64RCC224":true,"85LED397":true,"43OJQ233":true,"21WGZ779":true,"05RZK312":true,"05TSV372":true,"66RTC243":true,"47JQE658":true,"08EAS796":true," RENT 3 ":true,"46IXX634":true,"09DCZ601":true,"5YE617DK":true,"84BFG726":true," RENT 2 ":true,"23CZR946":true,"28LDE549":true,"25XOW384":true,"28BHP628":true},"hunger":48.80000000000291,"isdead":false,"thirst":55.19999999999709,"tracker":false,"licences":{"weapon":false,"driver":true,"business":false},"phone":{"background":"b2","lockscreen":false},"communityservice":0,"stress":0,"walletid":"QB-42786409","inside":{"apartment":[]},"phonedata":{"SerialNumber":36525415,"InstalledApps":[]},"rep":[],"criminalrecord":{"hasRecord":false},"status":[],"injail":0,"armor":0,"ishandcuffed":false,"inlaststand":false,"bloodtype":"A+","jailitems":[],"callsign":"NO CALLSIGN","fingerprint":"TH456Y17iWI0639"}', '[]', '2025-03-11 19:29:26', NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 1, '', 1234);

-- Listage de la structure de table paris_horizon_base_dev. playerskins
DROP TABLE IF EXISTS `playerskins`;
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.playerskins : ~8 rows (environ)
DELETE FROM `playerskins`;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(4, 'QHY46830', 'mp_m_freemode_01', '{"faceFeatures":{"jawBoneBackSize":0,"eyesOpening":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"chinBoneLenght":0,"noseWidth":0,"chinBoneLowering":0,"jawBoneWidth":0,"cheeksWidth":0,"noseBoneTwist":0,"lipsThickness":0,"eyeBrownForward":0,"chinBoneSize":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"nosePeakSize":0,"chinHole":0,"neckThickness":0,"eyeBrownHigh":0,"nosePeakLowering":0},"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"model":"mp_m_freemode_01","headBlend":{"skinSecond":0,"shapeSecond":0,"shapeMix":0,"thirdMix":0,"skinFirst":0,"skinThird":0,"shapeFirst":0,"skinMix":0,"shapeThird":0},"hair":{"style":0,"texture":0,"highlight":0,"color":0},"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"tattoos":[],"eyeColor":0,"headOverlays":{"bodyBlemishes":{"opacity":0,"style":0,"secondColor":0,"color":0},"eyebrows":{"opacity":0,"style":0,"secondColor":0,"color":0},"beard":{"opacity":0,"style":0,"secondColor":0,"color":0},"sunDamage":{"opacity":0,"style":0,"secondColor":0,"color":0},"chestHair":{"opacity":0,"style":0,"secondColor":0,"color":0},"blemishes":{"opacity":0,"style":0,"secondColor":0,"color":0},"makeUp":{"opacity":0,"style":0,"secondColor":0,"color":0},"complexion":{"opacity":0,"style":0,"secondColor":0,"color":0},"moleAndFreckles":{"opacity":0,"style":0,"secondColor":0,"color":0},"ageing":{"opacity":0,"style":0,"secondColor":0,"color":0},"blush":{"opacity":0,"style":0,"secondColor":0,"color":0},"lipstick":{"opacity":0,"style":0,"secondColor":0,"color":0}}}', 1),
	(5, 'PVW49266', 'mp_m_freemode_01', '{"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1}],"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":4,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":8,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":0,"texture":0}],"model":"mp_m_freemode_01","headOverlays":{"bodyBlemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"eyebrows":{"color":0,"opacity":0,"secondColor":0,"style":0},"beard":{"color":0,"opacity":0,"secondColor":0,"style":0},"sunDamage":{"color":0,"opacity":0,"secondColor":0,"style":0},"chestHair":{"color":0,"opacity":0,"secondColor":0,"style":0},"blemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"makeUp":{"color":0,"opacity":0,"secondColor":0,"style":0},"complexion":{"color":0,"opacity":0,"secondColor":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"secondColor":0,"style":0},"ageing":{"color":0,"opacity":0,"secondColor":0,"style":0},"blush":{"color":0,"opacity":0,"secondColor":0,"style":0},"lipstick":{"color":0,"opacity":0,"secondColor":0,"style":0}},"hair":{"texture":0,"style":0,"highlight":0,"color":0},"faceFeatures":{"jawBoneBackSize":0,"eyesOpening":0,"cheeksBoneWidth":0,"noseBoneHigh":0,"chinBoneLenght":0,"noseWidth":0,"chinBoneLowering":0,"chinBoneSize":0,"neckThickness":0,"noseBoneTwist":0,"lipsThickness":0,"eyeBrownForward":0,"nosePeakLowering":0,"cheeksBoneHigh":0,"jawBoneWidth":0,"nosePeakHigh":0,"chinHole":0,"nosePeakSize":0,"eyeBrownHigh":0,"cheeksWidth":0},"tattoos":[],"eyeColor":0,"headBlend":{"skinSecond":0,"shapeThird":0,"shapeMix":0,"thirdMix":0,"skinFirst":0,"skinThird":0,"shapeFirst":0,"skinMix":0,"shapeSecond":0}}', 1),
	(7, 'HVA50742', 'mp_m_freemode_01', '{"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":1,"drawable":0,"texture":0},{"component_id":2,"drawable":0,"texture":0},{"component_id":3,"drawable":0,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":0,"texture":0},{"component_id":11,"drawable":62,"texture":0},{"component_id":8,"drawable":1,"texture":1},{"component_id":4,"drawable":1,"texture":0},{"component_id":6,"drawable":12,"texture":0}],"eyeColor":2,"tattoos":[],"props":[{"prop_id":1,"drawable":-1,"texture":-1},{"prop_id":2,"drawable":-1,"texture":-1},{"prop_id":6,"drawable":-1,"texture":-1},{"prop_id":7,"drawable":-1,"texture":-1},{"prop_id":0,"drawable":56,"texture":2}],"model":"mp_m_freemode_01","faceFeatures":{"cheeksBoneWidth":0,"jawBoneWidth":0,"noseBoneTwist":0,"chinBoneSize":0,"jawBoneBackSize":0,"nosePeakLowering":0,"cheeksWidth":0,"nosePeakHigh":0,"eyeBrownForward":0,"neckThickness":0,"nosePeakSize":0,"cheeksBoneHigh":0,"eyeBrownHigh":0,"noseWidth":0,"chinHole":0,"chinBoneLowering":0,"chinBoneLenght":0,"eyesOpening":0,"noseBoneHigh":0,"lipsThickness":0},"headBlend":{"shapeMix":0,"shapeFirst":0,"skinSecond":0,"skinMix":0,"skinThird":0,"thirdMix":0,"shapeThird":0,"shapeSecond":0,"skinFirst":0},"headOverlays":{"lipstick":{"color":0,"opacity":0,"secondColor":0,"style":0},"moleAndFreckles":{"color":0,"opacity":0,"secondColor":0,"style":0},"chestHair":{"color":0,"opacity":0,"secondColor":0,"style":0},"blush":{"color":0,"opacity":0,"secondColor":0,"style":0},"ageing":{"color":0,"opacity":0,"secondColor":0,"style":0},"bodyBlemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"eyebrows":{"color":0,"opacity":1,"secondColor":0,"style":0},"blemishes":{"color":0,"opacity":0,"secondColor":0,"style":0},"makeUp":{"color":0,"opacity":0,"secondColor":0,"style":0},"beard":{"color":0,"opacity":1,"secondColor":0,"style":6},"complexion":{"color":0,"opacity":0,"secondColor":0,"style":0},"sunDamage":{"color":0,"opacity":0,"secondColor":0,"style":0}},"hair":{"texture":0,"color":44,"highlight":34,"style":3}}', 1),
	(8, 'OJT10595', 'mp_m_freemode_01', '{"faceFeatures":{"eyesOpening":0,"chinBoneLenght":0,"chinBoneSize":0,"cheeksBoneHigh":0,"nosePeakHigh":0,"cheeksBoneWidth":0,"chinHole":0,"eyeBrownForward":0,"noseWidth":0,"cheeksWidth":0,"nosePeakSize":0,"chinBoneLowering":0,"noseBoneHigh":0,"neckThickness":0,"nosePeakLowering":0,"lipsThickness":0,"noseBoneTwist":0,"jawBoneWidth":0,"eyeBrownHigh":0,"jawBoneBackSize":0},"components":[{"component_id":0,"texture":0,"drawable":0},{"component_id":1,"texture":0,"drawable":0},{"component_id":2,"texture":0,"drawable":0},{"component_id":3,"texture":0,"drawable":0},{"component_id":4,"texture":0,"drawable":0},{"component_id":5,"texture":0,"drawable":0},{"component_id":6,"texture":0,"drawable":0},{"component_id":7,"texture":0,"drawable":0},{"component_id":8,"texture":0,"drawable":0},{"component_id":9,"texture":0,"drawable":0},{"component_id":10,"texture":0,"drawable":0},{"component_id":11,"texture":0,"drawable":0}],"hair":{"texture":0,"highlight":0,"style":0,"color":0},"props":[{"texture":-1,"prop_id":0,"drawable":-1},{"texture":-1,"prop_id":1,"drawable":-1},{"texture":-1,"prop_id":2,"drawable":-1},{"texture":-1,"prop_id":6,"drawable":-1},{"texture":-1,"prop_id":7,"drawable":-1}],"headBlend":{"skinThird":0,"skinFirst":0,"shapeThird":0,"shapeSecond":0,"skinSecond":0,"shapeFirst":0,"skinMix":0,"thirdMix":0,"shapeMix":0},"model":"mp_m_freemode_01","headOverlays":{"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0}},"eyeColor":0,"tattoos":[]}', 1),
	(14, 'UYK15733', 'mp_m_freemode_01', '{"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":3,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":0,"component_id":9,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":15,"component_id":8,"texture":0},{"drawable":585,"component_id":11,"texture":0},{"drawable":2,"component_id":7,"texture":0},{"drawable":32,"component_id":4,"texture":0},{"drawable":17,"component_id":6,"texture":0}],"tattoos":[],"model":"mp_m_freemode_01","faceFeatures":{"noseBoneTwist":0,"eyeBrownForward":0,"chinBoneLowering":0,"neckThickness":0,"nosePeakHigh":0,"jawBoneBackSize":0,"jawBoneWidth":0,"noseBoneHigh":0,"cheeksBoneHigh":0,"noseWidth":0,"chinBoneSize":0,"chinBoneLenght":0,"eyeBrownHigh":0,"lipsThickness":0,"cheeksWidth":0,"eyesOpening":0,"cheeksBoneWidth":0,"chinHole":0,"nosePeakLowering":0,"nosePeakSize":0},"headOverlays":{"blemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"lipstick":{"secondColor":0,"opacity":0,"style":0,"color":0},"eyebrows":{"secondColor":0,"opacity":0,"style":0,"color":0},"chestHair":{"secondColor":0,"opacity":0,"style":0,"color":0},"sunDamage":{"secondColor":0,"opacity":0,"style":0,"color":0},"complexion":{"secondColor":0,"opacity":0,"style":0,"color":0},"makeUp":{"secondColor":0,"opacity":0,"style":0,"color":0},"moleAndFreckles":{"secondColor":0,"opacity":0,"style":0,"color":0},"ageing":{"secondColor":0,"opacity":0,"style":0,"color":0},"bodyBlemishes":{"secondColor":0,"opacity":0,"style":0,"color":0},"beard":{"secondColor":0,"opacity":0,"style":0,"color":0},"blush":{"secondColor":0,"opacity":0,"style":0,"color":0}},"props":[{"drawable":-1,"texture":-1,"prop_id":0},{"drawable":-1,"texture":-1,"prop_id":1},{"drawable":-1,"texture":-1,"prop_id":2},{"drawable":-1,"texture":-1,"prop_id":6},{"drawable":-1,"texture":-1,"prop_id":7}],"hair":{"texture":0,"highlight":0,"style":173,"color":0},"headBlend":{"shapeMix":0,"thirdMix":0,"skinMix":0,"skinThird":0,"shapeFirst":0,"shapeSecond":0,"skinSecond":0,"shapeThird":0,"skinFirst":0},"eyeColor":0}', 1),
	(16, 'AGM09146', 'mp_m_freemode_01', '{"props":[{"prop_id":0,"drawable":-1,"texture":-1},{"prop_id":1,"drawable":8,"texture":3},{"prop_id":2,"drawable":8,"texture":0},{"prop_id":6,"drawable":1,"texture":0},{"prop_id":7,"drawable":-1,"texture":-1}],"model":"mp_m_freemode_01","tattoos":{"ZONE_HAIR":[{"zone":"ZONE_HAIR","hashMale":"FM_M_Hair_003_d","collection":"multiplayer_overlays","label":"hair-0-189","hashFemale":"FM_F_Hair_003_d","name":"hair-0-189"}]},"eyeColor":0,"headOverlays":{"complexion":{"style":0,"color":0,"opacity":0,"secondColor":0},"eyebrows":{"style":0,"color":0,"opacity":0,"secondColor":0},"chestHair":{"style":0,"color":0,"opacity":0,"secondColor":0},"bodyBlemishes":{"style":0,"color":0,"opacity":0,"secondColor":0},"makeUp":{"style":0,"color":0,"opacity":0,"secondColor":0},"moleAndFreckles":{"style":0,"color":0,"opacity":0,"secondColor":0},"beard":{"style":0,"color":0,"opacity":0,"secondColor":0},"sunDamage":{"style":0,"color":0,"opacity":0,"secondColor":0},"ageing":{"style":0,"color":0,"opacity":0,"secondColor":0},"blush":{"style":0,"color":0,"opacity":0,"secondColor":0},"blemishes":{"style":0,"color":0,"opacity":0,"secondColor":0},"lipstick":{"style":0,"color":0,"opacity":0,"secondColor":0}},"components":[{"component_id":0,"drawable":0,"texture":0},{"component_id":2,"drawable":79,"texture":0},{"component_id":3,"drawable":88,"texture":0},{"component_id":5,"drawable":0,"texture":0},{"component_id":6,"drawable":17,"texture":5},{"component_id":8,"drawable":15,"texture":0},{"component_id":9,"drawable":0,"texture":0},{"component_id":10,"drawable":9,"texture":0},{"component_id":11,"drawable":69,"texture":1},{"component_id":1,"drawable":0,"texture":0},{"component_id":7,"drawable":0,"texture":0},{"component_id":4,"drawable":92,"texture":0}],"headBlend":{"shapeThird":0,"skinThird":0,"skinSecond":0,"skinFirst":0,"skinMix":0,"shapeMix":0,"shapeSecond":0,"thirdMix":0,"shapeFirst":0},"faceFeatures":{"noseBoneHigh":0,"chinHole":0,"eyeBrownHigh":0,"jawBoneWidth":0,"chinBoneLowering":0,"lipsThickness":0,"noseWidth":0,"eyesOpening":0,"nosePeakLowering":0,"cheeksWidth":0,"cheeksBoneHigh":0,"neckThickness":0,"eyeBrownForward":0,"jawBoneBackSize":0,"nosePeakHigh":0,"chinBoneLenght":0,"nosePeakSize":0,"noseBoneTwist":0,"chinBoneSize":0,"cheeksBoneWidth":0},"hair":{"texture":0,"highlight":31,"color":33,"style":79}}', 1),
	(20, 'AYN44292', 'mp_m_freemode_01', '{"props":[{"texture":-1,"drawable":-1,"prop_id":1},{"texture":-1,"drawable":-1,"prop_id":2},{"texture":-1,"drawable":-1,"prop_id":6},{"texture":-1,"drawable":-1,"prop_id":7},{"texture":24,"drawable":175,"prop_id":0}],"eyeColor":12,"components":[{"texture":0,"drawable":0,"component_id":0},{"texture":0,"drawable":0,"component_id":1},{"texture":0,"drawable":85,"component_id":2},{"texture":0,"drawable":1,"component_id":3},{"texture":0,"drawable":78,"component_id":4},{"texture":0,"drawable":0,"component_id":5},{"texture":0,"drawable":10,"component_id":6},{"texture":0,"drawable":0,"component_id":7},{"texture":0,"drawable":15,"component_id":8},{"texture":0,"drawable":0,"component_id":9},{"texture":0,"drawable":0,"component_id":10},{"texture":7,"drawable":462,"component_id":11}],"hair":{"highlight":61,"texture":0,"color":61,"style":85},"tattoos":{"ZONE_HEAD":[{"hashMale":"mpHeist3_Tat_042_M","hashFemale":"mpHeist3_Tat_042_F","collection":"mpheist3_overlays","name":"TAT_H3_042","zone":"ZONE_HEAD","label":"Hearts","opacity":1}],"ZONE_HAIR":[{"hashMale":"FM_M_Hair_005_b","hashFemale":"FM_F_Hair_005_b","name":"hair-0-157","zone":"ZONE_HAIR","label":"hair-0-157","collection":"multiplayer_overlays"}]},"headBlend":{"skinSecond":0,"shapeMix":0,"skinFirst":0,"thirdMix":0,"skinThird":0,"skinMix":0,"shapeFirst":0,"shapeSecond":0,"shapeThird":0},"model":"mp_m_freemode_01","headOverlays":{"beard":{"color":0,"opacity":0,"style":0,"secondColor":0},"bodyBlemishes":{"color":0,"opacity":0,"style":0,"secondColor":0},"lipstick":{"color":0,"opacity":0,"style":0,"secondColor":0},"complexion":{"color":0,"opacity":0,"style":0,"secondColor":0},"moleAndFreckles":{"color":0,"opacity":0,"style":0,"secondColor":0},"ageing":{"color":0,"opacity":0,"style":0,"secondColor":0},"sunDamage":{"color":0,"opacity":0,"style":0,"secondColor":0},"eyebrows":{"color":61,"opacity":1,"style":0,"secondColor":0},"makeUp":{"color":0,"opacity":0,"style":0,"secondColor":0},"blemishes":{"color":0,"opacity":0,"style":0,"secondColor":0},"chestHair":{"color":61,"opacity":0,"style":0,"secondColor":0},"blush":{"color":0,"opacity":0,"style":0,"secondColor":0}},"faceFeatures":{"chinHole":0,"cheeksBoneWidth":0,"chinBoneSize":0,"noseBoneTwist":0,"chinBoneLenght":0,"jawBoneWidth":0,"nosePeakHigh":0,"jawBoneBackSize":0,"nosePeakLowering":0,"neckThickness":0,"noseWidth":0,"chinBoneLowering":0,"cheeksBoneHigh":0,"noseBoneHigh":0,"eyeBrownForward":0,"cheeksWidth":0,"eyeBrownHigh":0,"nosePeakSize":0,"eyesOpening":0,"lipsThickness":0}}', 1),
	(22, 'TBQ82996', 'mp_m_freemode_01', '{"faceFeatures":{"noseBoneHigh":0,"nosePeakHigh":0,"jawBoneBackSize":0,"chinBoneLenght":0,"eyesOpening":0,"cheeksBoneHigh":0,"cheeksWidth":0,"chinHole":0,"lipsThickness":0,"noseWidth":0,"chinBoneSize":0,"nosePeakLowering":0,"eyeBrownHigh":0,"neckThickness":0,"jawBoneWidth":0,"nosePeakSize":0,"eyeBrownForward":0,"chinBoneLowering":0,"cheeksBoneWidth":0,"noseBoneTwist":0},"eyeColor":0,"headOverlays":{"sunDamage":{"style":0,"opacity":0,"secondColor":0,"color":0},"ageing":{"style":0,"opacity":0,"secondColor":0,"color":0},"lipstick":{"style":0,"opacity":0,"secondColor":0,"color":0},"chestHair":{"style":0,"opacity":0,"secondColor":0,"color":0},"moleAndFreckles":{"style":0,"opacity":0,"secondColor":0,"color":0},"makeUp":{"style":0,"opacity":0,"secondColor":0,"color":0},"eyebrows":{"style":0,"opacity":0,"secondColor":0,"color":0},"bodyBlemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"blemishes":{"style":0,"opacity":0,"secondColor":0,"color":0},"beard":{"style":0,"opacity":0,"secondColor":0,"color":0},"complexion":{"style":0,"opacity":0,"secondColor":0,"color":0},"blush":{"style":0,"opacity":0,"secondColor":0,"color":0}},"headBlend":{"thirdMix":0,"skinSecond":3,"shapeThird":3,"skinThird":0,"shapeFirst":4,"skinFirst":9,"shapeMix":0,"shapeSecond":4,"skinMix":0},"hair":{"style":0,"highlight":0,"texture":0,"color":0},"model":"mp_m_freemode_01","props":[{"drawable":-1,"prop_id":2,"texture":-1},{"drawable":-1,"prop_id":6,"texture":-1},{"drawable":-1,"prop_id":7,"texture":-1},{"drawable":0,"prop_id":1,"texture":0},{"drawable":289,"prop_id":0,"texture":0}],"tattoos":[],"components":[{"drawable":0,"component_id":0,"texture":0},{"drawable":0,"component_id":1,"texture":0},{"drawable":0,"component_id":2,"texture":0},{"drawable":0,"component_id":5,"texture":0},{"drawable":175,"component_id":6,"texture":0},{"drawable":0,"component_id":7,"texture":0},{"drawable":297,"component_id":4,"texture":0},{"drawable":0,"component_id":10,"texture":0},{"drawable":719,"component_id":11,"texture":0},{"drawable":177,"component_id":3,"texture":0},{"drawable":4,"component_id":9,"texture":1},{"drawable":251,"component_id":8,"texture":0}]}', 1);

-- Listage de la structure de table paris_horizon_base_dev. player_contacts
DROP TABLE IF EXISTS `player_contacts`;
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  `isBlocked` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_contacts : ~0 rows (environ)
DELETE FROM `player_contacts`;
INSERT INTO `player_contacts` (`id`, `identifier`, `citizenid`, `name`, `number`, `iban`, `display`, `note`, `pp`, `isBlocked`) VALUES
	(38, '6769228213', NULL, 'ttttttttttttt tttttttttttttttttt', '9839490898', '0', NULL, '', '', NULL);

-- Listage de la structure de table paris_horizon_base_dev. player_gallery
DROP TABLE IF EXISTS `player_gallery`;
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_gallery : ~0 rows (environ)
DELETE FROM `player_gallery`;

-- Listage de la structure de table paris_horizon_base_dev. player_houses
DROP TABLE IF EXISTS `player_houses`;
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  `decorateStash` text DEFAULT NULL,
  `charge` text DEFAULT NULL,
  `credit` varchar(50) DEFAULT NULL,
  `creditPrice` varchar(50) DEFAULT NULL,
  `console` text DEFAULT NULL,
  `decorateCoords` text DEFAULT NULL,
  `rented` int(11) DEFAULT NULL,
  `rentPrice` int(11) DEFAULT NULL,
  `rentable` int(11) DEFAULT NULL,
  `purchasable` int(11) DEFAULT NULL,
  `vaultCodes` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `house` (`house`) USING BTREE,
  KEY `owner` (`owner`) USING BTREE,
  KEY `citizenid` (`citizenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_houses : ~0 rows (environ)
DELETE FROM `player_houses`;

-- Listage de la structure de table paris_horizon_base_dev. player_mails
DROP TABLE IF EXISTS `player_mails`;
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT NULL,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_mails : ~0 rows (environ)
DELETE FROM `player_mails`;

-- Listage de la structure de table paris_horizon_base_dev. player_notes
DROP TABLE IF EXISTS `player_notes`;
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_notes : ~0 rows (environ)
DELETE FROM `player_notes`;

-- Listage de la structure de table paris_horizon_base_dev. player_outfits
DROP TABLE IF EXISTS `player_outfits`;
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(11) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_outfits : ~0 rows (environ)
DELETE FROM `player_outfits`;

-- Listage de la structure de table paris_horizon_base_dev. player_outfit_codes
DROP TABLE IF EXISTS `player_outfit_codes`;
CREATE TABLE IF NOT EXISTS `player_outfit_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `FK_player_outfit_codes_player_outfits` (`outfitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_outfit_codes : ~0 rows (environ)
DELETE FROM `player_outfit_codes`;

-- Listage de la structure de table paris_horizon_base_dev. player_priv_garages
DROP TABLE IF EXISTS `player_priv_garages`;
CREATE TABLE IF NOT EXISTS `player_priv_garages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `h` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT 10,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_priv_garages : ~0 rows (environ)
DELETE FROM `player_priv_garages`;

-- Listage de la structure de table paris_horizon_base_dev. player_vehicles
DROP TABLE IF EXISTS `player_vehicles`;
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(11) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(8) NOT NULL,
  `fakeplate` varchar(8) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `financed` tinyint(1) NOT NULL DEFAULT 0,
  `finance_data` longtext DEFAULT NULL,
  `vin` varchar(50) DEFAULT NULL,
  `in_garage` tinyint(1) DEFAULT 1,
  `garage_id` varchar(50) DEFAULT 'Legion Square',
  `job_vehicle` tinyint(1) DEFAULT 0,
  `gang_vehicle` tinyint(1) DEFAULT 0,
  `impound` int(10) DEFAULT 0,
  `impound_retrievable` int(10) DEFAULT 0,
  `impound_data` longtext DEFAULT '',
  `lock` int(11) DEFAULT 4321,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_vehicles : ~35 rows (environ)
DELETE FROM `player_vehicles`;
INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `financed`, `finance_data`, `vin`, `in_garage`, `garage_id`, `job_vehicle`, `gang_vehicle`, `impound`, `impound_retrievable`, `impound_data`, `lock`) VALUES
	(1, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'megane3bana', '-249040995', '{"modLivery":-1,"modAerials":-1,"modTrunk":-1,"modDashboard":-1,"interiorColor":0,"modSpoilers":-1,"wheelSize":0.0,"fuelLevel":23.03551880700416,"modStruts":-1,"modTrimA":-1,"modVanityPlate":-1,"modEngine":-1,"modFrame":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":false},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":2,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modKit47":-1,"modOrnaments":-1,"modSideSkirt":-1,"modHorns":-1,"oilLevel":4.76596940834568,"modEngineBlock":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"bodyHealth":1000.0592475178704,"wheels":1,"modRearBumper":-1,"modHydrolic":-1,"modSuspension":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"plate":"49ZLY692","modSteeringWheel":-1,"modTrimB":-1,"wheelWidth":0.0,"modArchCover":-1,"modKit19":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"neonColor":[255,0,255],"modCustomTiresR":false,"plateIndex":4,"tankHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modTransmission":-1,"modXenon":false,"color2":0,"xenonColor":255,"model":-249040995,"modAirFilter":-1,"modHood":-1,"modKit21":-1,"modSeats":-1,"modRightFender":-1,"modKit17":-1,"windowTint":-1,"modBackWheels":-1,"dirtLevel":0.0,"modExhaust":-1,"modTank":-1,"modFrontBumper":-1,"modRoof":-1,"modPlateHolder":-1,"modTurbo":false,"modBrakes":-1,"modCustomTiresF":false,"modAPlate":-1,"tyreSmokeColor":[255,255,255],"dashboardColor":0,"liveryRoof":-1,"modFrontWheels":-1,"pearlescentColor":134,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modSpeakers":-1,"modWindows":-1,"modGrille":-1,"wheelColor":156,"extras":{"1":false,"2":false,"3":false,"4":false,"5":false},"modArmor":-1}', '49ZLY692', NULL, NULL, 97, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking N104', 0, 0, 0, 0, '', 4321),
	(2, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'rsb_mbsprinter', '1264164828', '{"modLivery":-1,"modAerials":-1,"modTrunk":-1,"modDashboard":-1,"interiorColor":0,"modSpoilers":-1,"wheelSize":0.0,"fuelLevel":47.65969408345688,"modStruts":-1,"modTrimA":-1,"modVanityPlate":-1,"modEngine":-1,"modFrame":-1,"windowStatus":{"1":false,"2":true,"3":true,"4":false,"5":false,"6":false,"7":false,"0":true},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":89,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modKit47":-1,"modOrnaments":-1,"modSideSkirt":-1,"modHorns":-1,"oilLevel":7.94328234724281,"modEngineBlock":-1,"tireHealth":{"1":22.375,"2":1000.0,"3":1000.0,"0":1000.0},"bodyHealth":614.8100536765938,"wheels":0,"modRearBumper":-1,"modHydrolic":-1,"modSuspension":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"plate":"69ZKR711","modSteeringWheel":-1,"modTrimB":-1,"wheelWidth":0.0,"modArchCover":-1,"modKit19":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"neonColor":[255,0,255],"modCustomTiresR":false,"plateIndex":4,"tankHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modTransmission":-1,"modXenon":false,"color2":156,"xenonColor":255,"model":1264164828,"modAirFilter":-1,"modHood":-1,"modKit21":-1,"modSeats":-1,"modRightFender":-1,"modKit17":-1,"windowTint":-1,"modBackWheels":-1,"dirtLevel":0.0,"modExhaust":-1,"modTank":-1,"modFrontBumper":-1,"modRoof":-1,"modPlateHolder":-1,"modTurbo":false,"modBrakes":-1,"modCustomTiresF":false,"modAPlate":-1,"tyreSmokeColor":[255,255,255],"dashboardColor":0,"liveryRoof":-1,"modFrontWheels":-1,"pearlescentColor":156,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modSpeakers":-1,"modWindows":-1,"modGrille":-1,"wheelColor":156,"extras":[],"modArmor":-1}', '69ZKR711', NULL, NULL, 100, 1000, 615, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Casino', 0, 0, 0, 0, '', 4321),
	(3, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AGM09146', 'chrono2', '-740964027', '{"modLivery":-1,"modAerials":-1,"modTrunk":-1,"modDashboard":-1,"interiorColor":0,"modSpoilers":-1,"wheelSize":0.0,"fuelLevel":64.3405870126668,"modStruts":-1,"modTrimA":-1,"modVanityPlate":-1,"modEngine":-1,"modFrame":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":0,"modSmokeEnabled":false,"modDoorSpeaker":-1,"modKit47":-1,"modOrnaments":-1,"modSideSkirt":-1,"modHorns":-1,"oilLevel":4.76596940834568,"modEngineBlock":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"bodyHealth":1000.0592475178704,"wheels":1,"modRearBumper":-1,"modHydrolic":-1,"modSuspension":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"plate":"86XFK049","modSteeringWheel":-1,"modTrimB":-1,"wheelWidth":0.0,"modArchCover":-1,"modKit19":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"neonColor":[255,0,255],"modCustomTiresR":false,"plateIndex":4,"tankHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modTransmission":-1,"modXenon":false,"color2":0,"xenonColor":255,"model":-740964027,"modAirFilter":-1,"modHood":-1,"modKit21":-1,"modSeats":-1,"modRightFender":-1,"modKit17":-1,"windowTint":-1,"modBackWheels":-1,"dirtLevel":0.0,"modExhaust":-1,"modTank":-1,"modFrontBumper":-1,"modRoof":-1,"modPlateHolder":-1,"modTurbo":false,"modBrakes":-1,"modCustomTiresF":false,"modAPlate":-1,"tyreSmokeColor":[255,255,255],"dashboardColor":0,"liveryRoof":-1,"modFrontWheels":-1,"pearlescentColor":156,"modDial":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modShifterLeavers":-1,"modSpeakers":-1,"modWindows":-1,"modGrille":-1,"wheelColor":156,"extras":[],"modArmor":-1}', '86XFK049', NULL, NULL, 99, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Prison', 0, 0, 0, 0, '', 4321),
	(4, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'svj63', '-675592250', '{"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"modAerials":-1,"modAirFilter":-1,"oilLevel":4.76596940834568,"modKit21":-1,"modArmor":-1,"interiorColor":0,"modLivery":3,"modRoof":-1,"modFender":-1,"dashboardColor":0,"tankHealth":1000.0592475178704,"color2":90,"xenonColor":255,"plate":"89GJZ601","modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modTrimB":-1,"modCustomTiresF":false,"neonColor":[255,0,255],"modBackWheels":-1,"modHorns":-1,"color1":112,"modEngineBlock":-1,"modSpoilers":-1,"modRearBumper":-1,"modKit17":-1,"modFrontBumper":-1,"modEngine":-1,"modWindows":-1,"modFrame":-1,"modGrille":-1,"wheelWidth":0.0,"modHydrolic":-1,"modRightFender":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modAPlate":-1,"modKit19":-1,"liveryRoof":-1,"modKit49":-1,"modSuspension":-1,"modVanityPlate":-1,"modSpeakers":-1,"modTransmission":-1,"modTank":-1,"pearlescentColor":0,"modCustomTiresR":false,"model":-675592250,"fuelLevel":72.28386935990962,"modArchCover":-1,"windowTint":-1,"modSmokeEnabled":false,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"wheels":7,"modFrontWheels":-1,"modHood":-1,"modXenon":false,"wheelSize":0.0,"modTrimA":-1,"modPlateHolder":-1,"modDoorSpeaker":-1,"extras":[],"modDial":-1,"modShifterLeavers":-1,"plateIndex":0,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modDashboard":-1,"modTurbo":false,"modKit47":-1,"dirtLevel":0.0,"modSeats":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"modBrakes":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1}', '89GJZ601', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(5, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'yPG205t16B', '-16098358', '{"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":5,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"modAerials":-1,"modAirFilter":-1,"oilLevel":4.76596940834568,"modKit21":-1,"modArmor":-1,"interiorColor":0,"modLivery":-1,"modRoof":-1,"modFender":-1,"dashboardColor":0,"tankHealth":1000.0592475178704,"color2":0,"xenonColor":255,"plate":"40NGN951","modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modTrimB":-1,"modCustomTiresF":false,"neonColor":[255,0,255],"modBackWheels":-1,"modHorns":-1,"color1":2,"modEngineBlock":-1,"modSpoilers":-1,"modRearBumper":-1,"modKit17":-1,"modFrontBumper":-1,"modEngine":-1,"modWindows":-1,"modFrame":-1,"modGrille":-1,"wheelWidth":0.0,"modHydrolic":-1,"modRightFender":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modAPlate":-1,"modKit19":-1,"liveryRoof":-1,"modKit49":-1,"modSuspension":-1,"modVanityPlate":-1,"modSpeakers":-1,"modTransmission":-1,"modTank":-1,"pearlescentColor":5,"modCustomTiresR":false,"model":-16098358,"fuelLevel":23.82984704172844,"modArchCover":-1,"windowTint":-1,"modSmokeEnabled":false,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"modOrnaments":-1,"wheels":5,"modFrontWheels":-1,"modHood":-1,"modXenon":false,"wheelSize":0.0,"modTrimA":-1,"modPlateHolder":-1,"modDoorSpeaker":-1,"extras":[],"modDial":-1,"modShifterLeavers":-1,"plateIndex":3,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modDashboard":-1,"modTurbo":false,"modKit47":-1,"dirtLevel":0.0,"modSeats":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"bodyHealth":1000.0592475178704,"modBrakes":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1}', '40NGN951', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(6, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'AGM09146', 'rs6', '2113441065', '{"modHorns":-1,"modWindows":-1,"bodyHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":27,"modOrnaments":-1,"wheelWidth":0.0,"modCustomTiresF":false,"xenonColor":255,"modBrakes":2,"modHydrolic":-1,"modRightFender":-1,"modSideSkirt":-1,"dirtLevel":0.0,"engineHealth":1000.0592475178704,"modFender":-1,"extras":{"2":true,"1":true},"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSuspension":2,"modKit47":-1,"modTransmission":1,"modTrimB":-1,"modTrunk":-1,"modDial":-1,"modRoof":-1,"neonEnabled":[false,false,false,false],"wheelSize":0.0,"tankHealth":1000.0592475178704,"modRearBumper":-1,"modAPlate":-1,"modTurbo":1,"interiorColor":0,"modSeats":-1,"modGrille":-1,"wheelColor":119,"model":2113441065,"modDoorSpeaker":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"pearlescentColor":36,"modVanityPlate":-1,"wheels":0,"modBackWheels":-1,"modArmor":4,"modDashboard":-1,"modFrontWheels":-1,"modFrame":-1,"modSteeringWheel":-1,"modStruts":-1,"plate":"64OMS024","oilLevel":4.76596940834568,"modHood":-1,"modEngineBlock":-1,"modShifterLeavers":-1,"color2":27,"modSpeakers":-1,"modEngine":2,"fuelLevel":65.13491524739108,"windowTint":-1,"modAerials":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"dashboardColor":0,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modKit19":-1,"modTrimA":-1,"modAirFilter":-1,"modCustomTiresR":false,"modSpoilers":-1,"modArchCover":-1,"modXenon":false,"modFrontBumper":-1,"modTank":-1,"modKit49":-1,"modKit17":-1,"tyreSmokeColor":[255,255,255],"modExhaust":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":3,"modKit21":-1,"modSmokeEnabled":false,"plateIndex":0}', '64OMS024', NULL, NULL, 99, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, '64OMS024SDAO35WGRG', 0, 'Parking Casino', 0, 0, 0, 0, '', 4322),
	(7, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'UYK15733', 'rs6', '2113441065', '{"modHorns":-1,"modWindows":-1,"bodyHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":27,"modBackWheels":-1,"wheelWidth":0.0,"modCustomTiresF":false,"xenonColor":255,"modBrakes":-1,"modGrille":-1,"modRightFender":-1,"modSideSkirt":-1,"dirtLevel":0.0,"engineHealth":1000.0592475178704,"modFender":-1,"modFrontBumper":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSuspension":-1,"modKit47":-1,"modTransmission":-1,"modTrimB":-1,"modTrunk":-1,"modDial":-1,"tankHealth":1000.0592475178704,"modHood":-1,"wheelSize":0.0,"modLivery":3,"modAirFilter":-1,"modSmokeEnabled":false,"modTurbo":false,"neonEnabled":[false,false,false,false],"modSpeakers":-1,"modShifterLeavers":-1,"modRearBumper":-1,"model":2113441065,"modDoorSpeaker":-1,"modSpoilers":-1,"tyreSmokeColor":[255,255,255],"plateIndex":0,"modVanityPlate":-1,"wheels":0,"modRoof":-1,"modArmor":-1,"modKit21":-1,"modFrontWheels":-1,"modSteeringWheel":-1,"oilLevel":4.76596940834568,"modStruts":-1,"plate":"21WGZ779","modDashboard":-1,"modExhaust":-1,"modEngineBlock":-1,"modKit17":-1,"color2":27,"neonColor":[255,0,255],"modPlateHolder":-1,"fuelLevel":74.66685406408246,"modArchCover":-1,"modAerials":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"dashboardColor":0,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modKit19":-1,"modTrimA":-1,"modSeats":-1,"modCustomTiresR":false,"modHydrolic":-1,"modKit49":-1,"modXenon":false,"interiorColor":0,"modTank":-1,"modEngine":-1,"pearlescentColor":36,"extras":{"2":true,"1":true},"modFrame":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelColor":119,"modOrnaments":-1,"modAPlate":-1,"windowTint":-1}', '21WGZ779', NULL, NULL, 73, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Parking Plage', 0, 0, 0, 0, '', 4323),
	(8, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'pm19', '-1560751994', '{"modSpeakers":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":156,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":{"3":false,"2":false,"1":false,"4":true},"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":6,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":111,"interiorColor":0,"modBrakes":-1,"model":-1560751994,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":4.76596940834568,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":7,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":59.57461760432111,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":6,"tankHealth":1000.0592475178704,"plate":"23TOP165","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":0,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '23TOP165', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(9, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'mbc63', '-1406469014', '{"modSpeakers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":156,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":{"3":false,"2":false,"5":false,"4":true},"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":6,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":111,"interiorColor":0,"modBrakes":-1,"model":-1406469014,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":4.76596940834568,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":7,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":30.18447291952269,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":6,"tankHealth":1000.0592475178704,"plate":"27JBU860","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":0,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '27JBU860', NULL, NULL, 100, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Prison', 0, 0, 0, 0, '', 4321),
	(10, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'agerars', '-654239719', '{"modSpeakers":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":27,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":[],"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":112,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":30,"interiorColor":0,"modBrakes":-1,"model":-654239719,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":4.76596940834568,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":7,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":50.04267878762973,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":34,"tankHealth":1000.0592475178704,"plate":"04NUP644","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":3,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '04NUP644', NULL, NULL, 100, 1000, 1001, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Plage', 0, 0, 0, 0, '', 4321),
	(11, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'rculi', '1640627795', '{"modSpeakers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":0,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":[],"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":134,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":0,"interiorColor":0,"modBrakes":-1,"model":1640627795,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":7.94328234724281,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":77.0498387682553,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":134,"tankHealth":1000.0592475178704,"plate":"22ESZ994","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":4,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '22ESZ994', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(12, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'lykan', '2005386580', '{"modSpeakers":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":158,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":[],"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":64,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":70,"interiorColor":0,"modBrakes":-1,"model":2005386580,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":4.76596940834568,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":7,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":77.0498387682553,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":64,"tankHealth":1000.0592475178704,"plate":"23YXZ512","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":0,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '23YXZ512', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(13, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'stingray', '-1136096889', '{"modSpeakers":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":0,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":0,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":{"1":true,"2":false},"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":0,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":5,"interiorColor":0,"modBrakes":-1,"model":-1136096889,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":3.9716411736214,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":61.16327407376967,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":2,"tankHealth":1000.0592475178704,"plate":"20QOL843","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":2,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '20QOL843', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(14, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'rs615', '939131970', '{"modSpeakers":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modExhaust":-1,"modBackWheels":-1,"modCustomTiresR":false,"dashboardColor":28,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"wheelColor":28,"wheelSize":0.0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"modFender":-1,"modDoorSpeaker":-1,"modStruts":-1,"modHood":-1,"modKit49":-1,"extras":{"2":false,"1":true,"4":false},"modKit17":-1,"modTrunk":-1,"modAirFilter":-1,"color2":1,"modArmor":-1,"modEngine":-1,"modAPlate":-1,"modSuspension":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modTank":-1,"modSpoilers":-1,"modVanityPlate":-1,"modDial":-1,"modOrnaments":-1,"xenonColor":255,"modShifterLeavers":-1,"modFrontBumper":-1,"modGrille":-1,"modTrimA":-1,"modKit21":-1,"pearlescentColor":0,"interiorColor":2,"modBrakes":-1,"model":939131970,"modSmokeEnabled":false,"modRearBumper":-1,"oilLevel":4.76596940834568,"modFrontWheels":-1,"modDashboard":-1,"liveryRoof":-1,"wheels":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"neonEnabled":[false,false,false,false],"modTrimB":-1,"modKit47":-1,"fuelLevel":100.08535757525947,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSeats":-1,"neonColor":[255,0,255],"color1":12,"tankHealth":1000.0592475178704,"plate":"63XCH007","modFrame":-1,"modCustomTiresF":false,"modArchCover":-1,"modRightFender":-1,"modLivery":2,"modSideSkirt":-1,"modEngineBlock":-1,"modTurbo":false,"modSteeringWheel":-1,"modHorns":-1,"plateIndex":4,"dirtLevel":0.0,"modHydrolic":-1,"modXenon":false,"windowTint":-1,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"tyreSmokeColor":[255,255,255],"modWindows":-1}', '63XCH007', NULL, NULL, 100, 1000, 1000, 1, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(15, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'UYK15733', '650s', '-2076784418', '{"extras":[],"tankHealth":1000.0592475178704,"color2":63,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":63,"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"pearlescentColor":0,"xenonColor":255,"windowTint":-1,"modKit47":-1,"modTransmission":-1,"modSuspension":-1,"modAerials":-1,"modDial":-1,"windowStatus":{"1":false,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":false},"modStruts":-1,"modArchCover":-1,"modArmor":-1,"modShifterLeavers":-1,"dirtLevel":0.0,"modCustomTiresR":false,"modExhaust":-1,"modKit21":-1,"modOrnaments":-1,"modSmokeEnabled":false,"wheelSize":0.0,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modLivery":-1,"neonColor":[255,0,255],"modFender":-1,"modCustomTiresF":false,"modVanityPlate":-1,"modTrimA":-1,"modAPlate":-1,"modHood":-1,"model":-2076784418,"modXenon":false,"modSteeringWheel":-1,"modWindows":-1,"wheelColor":156,"modSeats":-1,"modEngine":-1,"modSideSkirt":-1,"engineHealth":1000.0592475178704,"modKit19":-1,"liveryRoof":-1,"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRoof":-1,"modAirFilter":-1,"modRightFender":-1,"modKit17":-1,"modTurbo":false,"wheelWidth":0.0,"wheels":0,"modKit49":-1,"modDashboard":-1,"modTrunk":-1,"modFrame":-1,"modSpeakers":-1,"modHydrolic":-1,"bodyHealth":1000.0592475178704,"modBackWheels":-1,"modRearBumper":-1,"oilLevel":4.76596940834568,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modFrontWheels":-1,"modGrille":-1,"interiorColor":0,"modDoorSpeaker":-1,"modFrontBumper":-1,"modBrakes":-1,"dashboardColor":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrimB":-1,"fuelLevel":21.4468623375556,"plateIndex":3,"modHorns":-1,"plate":"00PVD050"}', '00PVD050', NULL, NULL, 19, 995, 982, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Plage', 0, 0, 0, 0, '', 4322),
	(16, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'ap2', '-1549019518', '{"extras":{"2":true},"modSeats":-1,"color2":0,"modEngineBlock":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"color1":0,"modPlateHolder":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":0,"xenonColor":255,"windowTint":-1,"modKit47":-1,"modRoof":-1,"modSuspension":-1,"modAerials":-1,"modDial":-1,"windowStatus":{"1":true,"2":true,"3":false,"4":false,"5":false,"6":true,"7":true,"0":true},"modStruts":-1,"modArchCover":-1,"modArmor":-1,"modShifterLeavers":-1,"dirtLevel":0.0,"modCustomTiresR":false,"modExhaust":-1,"modKit21":-1,"modOrnaments":-1,"modSmokeEnabled":false,"wheelSize":0.0,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modLivery":-1,"modKit49":-1,"modFender":-1,"modCustomTiresF":false,"modVanityPlate":-1,"modTrimA":-1,"modAPlate":-1,"modTrunk":-1,"fuelLevel":38.12775526676551,"modXenon":false,"modSteeringWheel":-1,"dashboardColor":0,"modWindows":-1,"modKit19":-1,"modEngine":-1,"tankHealth":1000.0592475178704,"engineHealth":1000.0592475178704,"modRearBumper":-1,"plateIndex":1,"modTank":-1,"modDoorSpeaker":-1,"modKit17":-1,"wheelColor":156,"neonColor":[255,0,255],"modHydrolic":-1,"modTurbo":false,"wheelWidth":0.0,"wheels":0,"modRightFender":-1,"modDashboard":-1,"liveryRoof":-1,"modFrame":-1,"modTransmission":-1,"modSideSkirt":-1,"bodyHealth":1000.0592475178704,"modBackWheels":-1,"modFrontBumper":-1,"oilLevel":4.76596940834568,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modFrontWheels":-1,"modGrille":-1,"interiorColor":0,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHood":-1,"modBrakes":-1,"modAirFilter":-1,"model":-1549019518,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"modSpeakers":-1,"modHorns":-1,"plate":"47GQQ635"}', '47GQQ635', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(17, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', '1310', '1822975256', '{"modAirFilter":-1,"modEngine":-1,"wheelColor":0,"modHorns":-1,"wheels":5,"modBrakes":-1,"modKit19":-1,"modKit17":-1,"modDial":-1,"modArmor":-1,"modSpoilers":-1,"modArchCover":-1,"modShifterLeavers":-1,"modFrame":-1,"modExhaust":-1,"xenonColor":255,"dirtLevel":0.0,"modFrontBumper":-1,"modSteeringWheel":-1,"modVanityPlate":-1,"modStruts":-1,"modSeats":-1,"modPlateHolder":-1,"modHydrolic":-1,"dashboardColor":0,"modKit49":-1,"modCustomTiresR":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowTint":-1,"modXenon":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"oilLevel":7.94328234724281,"modTrunk":-1,"model":1822975256,"color1":[0,0,0],"modSmokeEnabled":false,"modKit47":-1,"modSuspension":-1,"fuelLevel":100.08535757525947,"wheelSize":0.0,"neonEnabled":[false,false,false,false],"modSideSkirt":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":0,"modFrontWheels":-1,"neonColor":[255,0,255],"modTurbo":false,"modRoof":-1,"modBackWheels":-1,"modDashboard":-1,"plate":"0ZH114LB","modKit21":-1,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"modSpeakers":-1,"plateIndex":4,"interiorColor":0,"modRightFender":-1,"modGrille":-1,"modTrimA":-1,"modHood":-1,"modWindows":-1,"modTransmission":-1,"engineHealth":1000.0592475178704,"extras":[],"modCustomTiresF":false,"modOrnaments":-1,"modTank":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modRearBumper":-1,"tankHealth":1000.0592475178704,"tyreSmokeColor":[255,255,255],"color2":[0,0,0],"modFender":-1,"modEngineBlock":-1,"modAPlate":-1,"liveryRoof":-1,"modAerials":-1,"modLivery":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTrimB":-1,"modDoorSpeaker":-1}', '0ZH114LB', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 'null', NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(18, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'AGM09146', 'rs6', '2113441065', '{"modAirFilter":-1,"modEngine":-1,"wheelColor":0,"modHorns":-1,"wheels":0,"modBrakes":-1,"modKit19":-1,"modKit17":-1,"modDial":-1,"modArmor":-1,"modGrille":-1,"modArchCover":-1,"modShifterLeavers":-1,"modFrame":-1,"modExhaust":-1,"xenonColor":255,"dirtLevel":0.0,"modFrontBumper":-1,"modSteeringWheel":-1,"modVanityPlate":-1,"modStruts":-1,"modSeats":-1,"modPlateHolder":-1,"modHydrolic":-1,"dashboardColor":0,"modKit49":-1,"modCustomTiresR":false,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowTint":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1,"oilLevel":4.76596940834568,"modTrunk":-1,"model":2113441065,"color1":[72,125,231],"modSmokeEnabled":false,"modKit47":-1,"plateIndex":0,"modTrimB":-1,"wheelSize":0.0,"modHood":-1,"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"pearlescentColor":0,"modFrontWheels":-1,"modSpoilers":-1,"modDashboard":-1,"modRoof":-1,"modBackWheels":-1,"neonEnabled":[false,false,false,false],"plate":"9AJ909WP","modKit21":-1,"bodyHealth":1000.0592475178704,"wheelWidth":0.0,"modSpeakers":-1,"modLivery":2,"modOrnaments":-1,"modRightFender":-1,"modXenon":false,"modCustomTiresF":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"tyreSmokeColor":[255,255,255],"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modSuspension":-1,"color2":[72,125,231],"fuelLevel":100.08535757525947,"modFender":-1,"modTrimA":-1,"modRearBumper":-1,"modTransmission":-1,"interiorColor":0,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"liveryRoof":-1,"modEngineBlock":-1,"modAPlate":-1,"modWindows":-1,"modAerials":-1,"extras":{"2":true,"1":true},"tankHealth":1000.0592475178704,"neonColor":[255,0,255],"modDoorSpeaker":-1}', '9AJ909WP', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 'null', NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(19, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'UYK15733', '1310', '1822975256', '{"model":1822975256,"liveryRoof":-1,"modSuspension":-1,"modDial":-1,"plate":"5YE617DK","modAirFilter":-1,"modWindows":-1,"modShifterLeavers":-1,"extras":[],"modSteeringWheel":-1,"modSideSkirt":-1,"modKit17":-1,"modTransmission":-1,"windowTint":-1,"modSpoilers":-1,"modArchCover":-1,"modPlateHolder":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpeakers":-1,"dashboardColor":0,"modArmor":-1,"modVanityPlate":-1,"modKit49":-1,"dirtLevel":0.0,"modCustomTiresF":false,"modExhaust":-1,"modCustomTiresR":false,"modTurbo":false,"modFrame":-1,"color1":[0,0,0],"modFrontBumper":-1,"modGrille":-1,"modRightFender":-1,"tankHealth":1000.0592475178704,"modKit19":-1,"modHydrolic":-1,"modKit21":-1,"modSeats":-1,"interiorColor":0,"oilLevel":7.94328234724281,"bodyHealth":1000.0592475178704,"wheelSize":0.0,"modTrimA":-1,"modAerials":-1,"modBrakes":-1,"wheelWidth":0.0,"neonColor":[255,0,255],"modOrnaments":-1,"modRearBumper":-1,"engineHealth":1000.0592475178704,"modDoorSpeaker":-1,"wheelColor":0,"fuelLevel":100.08535757525947,"modDashboard":-1,"modAPlate":-1,"modEngineBlock":-1,"modTrunk":-1,"modSmokeEnabled":false,"modStruts":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"xenonColor":255,"modBackWheels":-1,"wheels":5,"plateIndex":4,"modFender":-1,"modXenon":false,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modTrimB":-1,"modRoof":-1,"modTank":-1,"modLivery":-1,"modHood":-1,"pearlescentColor":0,"modKit47":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tyreSmokeColor":[255,255,255],"color2":[0,0,0],"modHorns":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFrontWheels":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true}}', '5YE617DK', NULL, NULL, 100, 1000, 1000, 1, 0, NULL, NULL, 0, 0, 0, 0, 1, '{"payment_interval":12,"dealership_id":"evry","paid":3168.0,"recurring_payment":528.0,"total_payments":20,"payment_failed":false,"total":13200.0,"seconds_to_next_payment":34200.0,"seconds_to_repo":0,"vehicle":"1310","payments_complete":1}', NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(20, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'cgts', '-193081966', '{"modFrontWheels":-1,"liveryRoof":-1,"modArchCover":-1,"xenonColor":255,"tyreSmokeColor":[255,255,255],"neonColor":[255,0,255],"modTrunk":-1,"modPlateHolder":-1,"fuelLevel":77.84416700297959,"modSpeakers":-1,"modShifterLeavers":-1,"modXenon":false,"modKit19":-1,"modKit47":-1,"modAirFilter":-1,"dashboardColor":0,"model":-193081966,"pearlescentColor":111,"modVanityPlate":-1,"modFrontBumper":-1,"modSuspension":-1,"modHydrolic":-1,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modWindows":-1,"color2":3,"modSpoilers":-1,"dirtLevel":0.0,"modTrimA":-1,"modKit21":-1,"modGrille":-1,"modTank":-1,"color1":4,"modStruts":-1,"wheelWidth":0.0,"modEngineBlock":-1,"modBackWheels":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modSmokeEnabled":false,"windowTint":-1,"bodyHealth":1000.0592475178704,"modDial":-1,"modOrnaments":-1,"modRoof":-1,"oilLevel":6.35462587779425,"modLivery":-1,"modAPlate":-1,"extras":{"1":false},"modFrame":-1,"wheelSize":0.0,"modAerials":-1,"wheelColor":156,"engineHealth":1000.0592475178704,"tankHealth":1000.0592475178704,"modKit49":-1,"modDoorSpeaker":-1,"modCustomTiresF":false,"modRightFender":-1,"windowStatus":{"1":true,"2":false,"3":false,"4":false,"5":false,"6":true,"7":false,"0":true},"modBrakes":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modExhaust":-1,"modSideSkirt":-1,"modFender":-1,"modHood":-1,"plateIndex":0,"modSeats":-1,"plate":"82IHC002","modArmor":-1,"modSteeringWheel":-1,"modRearBumper":-1,"modHorns":-1,"modCustomTiresR":false,"modKit17":-1,"wheels":0,"neonEnabled":[false,false,false,false],"modTurbo":false,"modTransmission":-1,"interiorColor":0,"modTrimB":-1,"modEngine":-1}', '82IHC002', NULL, NULL, 78, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Prison', 0, 0, 0, 0, '', 4321),
	(21, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'AGM09146', 'lp700r', '949614817', '{"modFrontWheels":-1,"liveryRoof":-1,"modArchCover":-1,"xenonColor":255,"modHood":-1,"neonColor":[255,0,255],"modTrunk":-1,"modPlateHolder":-1,"fuelLevel":21.4468623375556,"modSpeakers":-1,"modShifterLeavers":-1,"modXenon":false,"modTransmission":-1,"modKit47":-1,"modAirFilter":-1,"dashboardColor":0,"model":949614817,"modAerials":-1,"modVanityPlate":-1,"modFrontBumper":-1,"modSuspension":-1,"modHydrolic":-1,"modDashboard":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modWindows":-1,"color2":31,"modSpoilers":-1,"dirtLevel":0.0,"modTrimA":-1,"modKit21":-1,"modGrille":-1,"modTank":-1,"color1":27,"modStruts":-1,"wheelWidth":0.0,"modEngineBlock":-1,"modBackWheels":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modRightFender":-1,"windowTint":-1,"bodyHealth":997.6762628136975,"modDial":-1,"modOrnaments":-1,"modRoof":-1,"oilLevel":4.76596940834568,"modLivery":-1,"modAPlate":-1,"extras":[],"modFrame":-1,"pearlescentColor":31,"wheelColor":156,"plateIndex":1,"modArmor":-1,"tankHealth":1000.0592475178704,"modTurbo":false,"modDoorSpeaker":-1,"modCustomTiresF":false,"modSmokeEnabled":false,"windowStatus":{"1":true,"2":false,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modBrakes":-1,"plate":"28YXE941","wheels":7,"modExhaust":-1,"modSideSkirt":-1,"modFender":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"modSeats":-1,"modKit49":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modRearBumper":-1,"modHorns":-1,"wheelSize":0.0,"engineHealth":1000.0592475178704,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit17":-1,"neonEnabled":[false,false,false,false],"modKit19":-1,"interiorColor":0,"modTrimB":-1,"modEngine":-1}', '28YXE941', NULL, NULL, 21, 1000, 998, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Prison', 0, 0, 0, 0, '', 4321),
	(22, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'UYK15733', 'rs6', '2113441065', '{"dashboardColor":0,"modVanityPlate":-1,"neonColor":[255,0,255],"color1":162,"plateIndex":0,"modTrimB":-1,"modSmokeEnabled":false,"modPlateHolder":-1,"modDoorSpeaker":-1,"modArchCover":-1,"wheels":0,"modFender":-1,"modTrunk":-1,"pearlescentColor":235,"model":2113441065,"extras":{"2":true,"1":true},"interiorColor":0,"modSpoilers":-1,"modSeats":-1,"modCustomTiresF":false,"wheelColor":227,"modKit49":-1,"xenonColor":255,"modRightFender":-1,"engineHealth":1000.0592475178704,"modDial":-1,"modCustomTiresR":false,"windowTint":-1,"modWindows":-1,"modExhaust":1,"oilLevel":4.76596940834568,"modHood":-1,"modKit17":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":2,"modHydrolic":-1,"modArmor":4,"modEngineBlock":-1,"modTurbo":1,"neonEnabled":[false,false,false,false],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"modBrakes":2,"modFrontWheels":-1,"modDashboard":-1,"modKit47":-1,"wheelSize":1.0,"modBackWheels":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modSteeringWheel":-1,"modTank":-1,"modFrontBumper":-1,"plate":"29KMH369","modHorns":-1,"modSpeakers":-1,"modOrnaments":-1,"modRearBumper":-1,"modTrimA":-1,"modTransmission":1,"modGrille":-1,"tankHealth":1000.0592475178704,"modAerials":-1,"dirtLevel":0.0,"liveryRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"fuelLevel":64.3405870126668,"modFrame":-1,"modSuspension":2,"modXenon":false,"color2":196,"wheelWidth":1.0,"tyreSmokeColor":[255,255,255],"bodyHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngine":1,"modShifterLeavers":-1,"modAirFilter":-1,"modKit19":-1,"modRoof":-1,"modSideSkirt":-1}', '29KMH369', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(23, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'AGM09146', 'c6320', '-1079976045', '{"dashboardColor":0,"modVanityPlate":-1,"neonColor":[3,83,255],"color1":164,"plateIndex":5,"modTrimB":-1,"modSmokeEnabled":false,"modPlateHolder":-1,"modDoorSpeaker":-1,"modArchCover":-1,"wheels":0,"modFender":-1,"modTrunk":-1,"pearlescentColor":166,"model":-1079976045,"extras":[],"interiorColor":11,"modSpoilers":-1,"modSeats":-1,"modCustomTiresF":false,"wheelColor":195,"modKit49":-1,"xenonColor":255,"modRightFender":-1,"engineHealth":1000.0592475178704,"modDial":-1,"modCustomTiresR":false,"windowTint":1,"modWindows":-1,"modExhaust":-1,"oilLevel":5.56029764306997,"modHood":-1,"modKit17":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":-1,"modHydrolic":-1,"modArmor":4,"modEngineBlock":-1,"modTurbo":1,"neonEnabled":[1,1,1,1],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"modBrakes":2,"modFrontWheels":-1,"modDashboard":-1,"modKit47":-1,"wheelSize":1.0,"modBackWheels":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modSteeringWheel":-1,"modTank":-1,"modFrontBumper":-1,"plate":"02CUA023","modHorns":-1,"modSpeakers":-1,"modOrnaments":-1,"modRearBumper":-1,"modTrimA":-1,"modTransmission":2,"modGrille":-1,"tankHealth":1000.0592475178704,"modAerials":-1,"dirtLevel":0.0,"liveryRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"fuelLevel":65.13491524739108,"modFrame":-1,"modSuspension":3,"modXenon":1,"color2":165,"wheelWidth":1.0,"tyreSmokeColor":[255,255,255],"bodyHealth":993.7046216400761,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngine":3,"modShifterLeavers":-1,"modAirFilter":-1,"modKit19":-1,"modRoof":-1,"modSideSkirt":-1}', '02CUA023', NULL, NULL, 99, 1000, 994, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Parking Aeroport', 0, 0, 0, 0, '', 4321),
	(24, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'toysupmk4', '-1062758007', '{"dashboardColor":3,"modVanityPlate":-1,"neonColor":[255,0,255],"color1":12,"plateIndex":0,"modTrimB":-1,"modSmokeEnabled":false,"modPlateHolder":-1,"modDoorSpeaker":-1,"modArchCover":-1,"wheels":0,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTrunk":-1,"pearlescentColor":12,"model":-1062758007,"modXenon":false,"interiorColor":147,"modSpoilers":-1,"modSeats":-1,"modCustomTiresF":false,"liveryRoof":-1,"modKit49":-1,"xenonColor":255,"modRightFender":-1,"engineHealth":1000.0592475178704,"modDial":-1,"modCustomTiresR":false,"windowTint":-1,"modWindows":-1,"modExhaust":-1,"oilLevel":4.76596940834568,"modKit47":-1,"modRoof":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":-1,"modHydrolic":-1,"modArmor":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"neonEnabled":[false,false,false,false],"wheelWidth":0.0,"modStruts":-1,"modBrakes":-1,"modFrontWheels":-1,"modAirFilter":-1,"modEngine":-1,"wheelSize":0.0,"modBackWheels":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modSteeringWheel":-1,"modRearBumper":-1,"modFrontBumper":-1,"plate":"24QPT231","modHorns":-1,"modDashboard":-1,"modOrnaments":-1,"tankHealth":1000.0592475178704,"modTrimA":-1,"modTransmission":-1,"modGrille":-1,"modEngineBlock":-1,"modAerials":-1,"bodyHealth":1000.0592475178704,"modKit17":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":false,"7":true,"0":true},"modSpeakers":-1,"modFrame":-1,"modSuspension":-1,"modKit19":-1,"color2":12,"dirtLevel":0.0,"modShifterLeavers":-1,"modHood":-1,"modFender":-1,"modTank":-1,"wheelColor":12,"extras":{"1":false},"tyreSmokeColor":[255,255,255],"fuelLevel":100.08535757525947,"modSideSkirt":-1}', '24QPT231', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(25, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'nissantitan17', '1221510024', '{"dashboardColor":0,"modVanityPlate":-1,"neonColor":[15,3,255],"color1":12,"plateIndex":0,"modTrimB":-1,"modSmokeEnabled":1,"modPlateHolder":-1,"modDoorSpeaker":-1,"modArchCover":-1,"wheels":4,"modFender":-1,"modTrunk":-1,"pearlescentColor":12,"model":1221510024,"extras":{"1":true,"9":false},"interiorColor":0,"modSpoilers":-1,"modSeats":-1,"modCustomTiresF":false,"wheelColor":12,"modKit49":-1,"xenonColor":255,"modRightFender":-1,"engineHealth":1000.0592475178704,"modDial":-1,"modCustomTiresR":false,"windowTint":1,"modWindows":-1,"modExhaust":-1,"oilLevel":6.35462587779425,"modHood":-1,"modKit17":-1,"modAPlate":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modLivery":2,"modHydrolic":-1,"modArmor":4,"modEngineBlock":-1,"modTurbo":1,"neonEnabled":[1,1,1,1],"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modStruts":-1,"modBrakes":2,"modFrontWheels":1,"modDashboard":-1,"modKit47":-1,"wheelSize":0.88182753324508,"modBackWheels":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit21":-1,"modSteeringWheel":-1,"modTank":-1,"modFrontBumper":-1,"plate":"42SPK118","modHorns":3,"modSpeakers":-1,"modOrnaments":-1,"modRearBumper":-1,"modTrimA":-1,"modTransmission":2,"modGrille":-1,"tankHealth":1000.0592475178704,"modAerials":-1,"dirtLevel":0.0,"liveryRoof":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"fuelLevel":99.29102934053518,"modFrame":0,"modSuspension":3,"modXenon":1,"color2":12,"wheelWidth":0.69617962837219,"tyreSmokeColor":[255,255,255],"bodyHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modEngine":3,"modShifterLeavers":-1,"modAirFilter":-1,"modKit19":-1,"modRoof":-1,"modSideSkirt":-1}', '42SPK118', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(26, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'AGM09146', 'adv1502023', '-254386275', '{"modTransmission":-1,"modFender":-1,"dirtLevel":0.0,"modWindows":-1,"dashboardColor":0,"liveryRoof":-1,"modSpeakers":-1,"modCustomTiresR":false,"wheelWidth":0.0,"modOrnaments":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modEngine":-1,"modExhaust":-1,"modSideSkirt":-1,"tyreSmokeColor":[255,255,255],"neonEnabled":[false,false,false,false],"wheelColor":147,"modAerials":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modSteeringWheel":-1,"xenonColor":255,"modKit49":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tankHealth":1000.0592475178704,"modFrame":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"windowTint":-1,"modKit47":-1,"interiorColor":0,"modTrunk":-1,"modLivery":-1,"color2":112,"modDial":-1,"modDashboard":-1,"modAPlate":-1,"modArmor":-1,"modGrille":-1,"modSuspension":-1,"modStruts":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"24HLR439","modTank":-1,"color1":112,"wheels":6,"modArchCover":-1,"plateIndex":1,"modBrakes":-1,"extras":[],"modFrontBumper":-1,"modRearBumper":-1,"engineHealth":1000.0592475178704,"modRoof":-1,"modKit19":-1,"modPlateHolder":-1,"modKit17":-1,"oilLevel":4.76596940834568,"modTrimB":-1,"modShifterLeavers":-1,"modFrontWheels":-1,"modXenon":false,"modHood":-1,"pearlescentColor":112,"neonColor":[255,0,255],"model":-254386275,"modRightFender":-1,"modHydrolic":-1,"modEngineBlock":-1,"modHorns":-1,"modVanityPlate":-1,"modKit21":-1,"bodyHealth":999.2649192831461,"modTurbo":false,"modCustomTiresF":false,"modBackWheels":-1,"modSeats":-1,"wheelSize":0.0,"modSpoilers":-1,"modTrimA":-1,"modSmokeEnabled":false,"fuelLevel":53.21999172652686}', '24HLR439', NULL, NULL, 44, 990, 991, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Parking N104', 0, 0, 0, 0, '', 4323),
	(27, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', 'UYK15733', 'rs6', '2113441065', '{"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modWindows":-1,"modVanityPlate":-1,"modHydrolic":-1,"wheelSize":0.0,"modAirFilter":-1,"modCustomTiresR":false,"modAPlate":-1,"modXenon":false,"modStruts":-1,"modArmor":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modLivery":7,"plateIndex":0,"modDial":-1,"modRoof":-1,"neonColor":[255,0,255],"modTrunk":-1,"modSpeakers":-1,"modTrimA":-1,"modKit21":-1,"modRearBumper":-1,"modCustomTiresF":false,"modKit47":-1,"windowTint":-1,"oilLevel":4.76596940834568,"modFrame":-1,"modSmokeEnabled":false,"plate":"2UX364WY","tankHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modArchCover":-1,"modFrontBumper":-1,"modEngine":-1,"modShifterLeavers":-1,"dirtLevel":0.0,"modKit49":-1,"modSuspension":-1,"wheelColor":0,"modDashboard":-1,"modTrimB":-1,"modPlateHolder":-1,"modBrakes":-1,"extras":{"1":true,"2":true},"pearlescentColor":0,"color1":[112,54,157],"modGrille":-1,"modHood":-1,"modKit19":-1,"modTank":-1,"modAerials":-1,"modFender":-1,"modExhaust":-1,"modHorns":-1,"wheelWidth":0.0,"modTurbo":false,"tyreSmokeColor":[255,255,255],"xenonColor":255,"modSeats":-1,"modKit17":-1,"modFrontWheels":-1,"modSteeringWheel":-1,"modRightFender":-1,"modDoorSpeaker":-1,"bodyHealth":1000.0592475178704,"modOrnaments":-1,"dashboardColor":0,"modEngineBlock":-1,"engineHealth":1000.0592475178704,"color2":[112,54,157],"model":2113441065,"neonEnabled":[false,false,false,false],"modTransmission":-1,"modSideSkirt":-1,"modBackWheels":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"interiorColor":0,"wheels":0,"windowStatus":{"1":true,"2":true,"3":true,"4":true,"5":true,"6":true,"7":true,"0":true},"modSpoilers":-1,"fuelLevel":100.08535757525947}', '2UX364WY', NULL, NULL, 80, 988, 898, 1, 0, NULL, NULL, 0, 0, 0, 0, 0, 'null', NULL, 0, 'Parking Prison', 0, 0, 0, 0, '', 4323),
	(28, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'trx', '909518807', '{"modSpoilers":-1,"wheelSize":0.0,"modHood":-1,"windowTint":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modHydrolic":-1,"modVanityPlate":-1,"modEngine":-1,"modSuspension":-1,"model":909518807,"modSmokeEnabled":false,"engineHealth":1000.0592475178704,"modCustomTiresF":false,"modKit21":-1,"wheelColor":0,"modStruts":-1,"modAirFilter":-1,"color2":13,"modDashboard":-1,"modFrame":-1,"wheels":3,"oilLevel":6.35462587779425,"modTurbo":false,"neonColor":[255,0,255],"modXenon":false,"modBackWheels":-1,"modTrimA":-1,"modKit19":-1,"modTrimB":-1,"modArchCover":-1,"tankHealth":1000.0592475178704,"interiorColor":0,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"xenonColor":255,"modShifterLeavers":-1,"color1":126,"bodyHealth":1000.0592475178704,"modLivery":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modHorns":-1,"modSeats":-1,"modKit47":-1,"modEngineBlock":-1,"extras":[],"dashboardColor":0,"modRoof":-1,"modFender":-1,"modKit17":-1,"modAPlate":-1,"modRightFender":-1,"modTank":-1,"modWindows":-1,"plateIndex":0,"wheelWidth":0.0,"modFrontBumper":-1,"modPlateHolder":-1,"modSpeakers":-1,"modSideSkirt":-1,"modCustomTiresR":false,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modBrakes":-1,"modTrunk":-1,"dirtLevel":0.0,"modArmor":-1,"pearlescentColor":3,"modTransmission":-1,"tyreSmokeColor":[255,255,255],"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"plate":"05QCM806","modKit49":-1,"liveryRoof":-1,"modRearBumper":-1,"modAerials":-1,"fuelLevel":100.08535757525947,"modExhaust":-1,"neonEnabled":[false,false,false,false],"modDial":-1,"modOrnaments":-1,"modSteeringWheel":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modGrille":-1}', '05QCM806', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(29, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'mt09pn', '43494928', '{"modRightFender":-1,"bodyHealth":1000.0592475178704,"modFrame":-1,"modSeats":-1,"neonColor":[255,0,255],"modSteeringWheel":-1,"modSuspension":-1,"tankHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"modExhaust":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modXenon":false,"modSpeakers":-1,"modEngine":-1,"modKit47":-1,"modSmokeEnabled":false,"modBackWheels":-1,"modCustomTiresR":false,"modBrakes":-1,"pearlescentColor":64,"modAerials":-1,"dirtLevel":0.0,"modOrnaments":-1,"modWindows":-1,"windowTint":-1,"modCustomTiresF":false,"model":43494928,"plate":"46LNO708","modArmor":-1,"modTrimA":-1,"color2":1,"modTrunk":-1,"extras":[],"modGrille":-1,"modTank":-1,"fuelLevel":100.08535757525947,"oilLevel":4.76596940834568,"xenonColor":255,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modDial":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modSpoilers":-1,"modRearBumper":-1,"modStruts":-1,"modFrontWheels":-1,"modPlateHolder":-1,"interiorColor":0,"modRoof":-1,"modVanityPlate":-1,"modArchCover":-1,"color1":64,"modTurbo":false,"modShifterLeavers":-1,"modHorns":-1,"wheelWidth":0.0,"modDoorSpeaker":-1,"modLivery":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1,"modKit19":-1,"wheelSize":0.0,"modAPlate":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modDashboard":-1,"modHydrolic":-1,"modAirFilter":-1,"wheels":6,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"modTransmission":-1,"plateIndex":0,"modHood":-1,"wheelColor":1,"modFrontBumper":-1,"modKit21":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modKit17":-1}', '46LNO708', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(30, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'blazer3', '-1269889662', '{"modRightFender":-1,"bodyHealth":1000.0592475178704,"modFrame":-1,"modSeats":-1,"neonColor":[255,0,255],"modSteeringWheel":-1,"modSuspension":-1,"tankHealth":1000.0592475178704,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modKit49":-1,"modExhaust":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modFender":-1,"modXenon":false,"modSpeakers":-1,"modEngine":-1,"modKit47":-1,"modSmokeEnabled":false,"modBackWheels":-1,"modCustomTiresR":false,"modBrakes":-1,"pearlescentColor":0,"modAerials":-1,"dirtLevel":0.0,"modOrnaments":-1,"modWindows":-1,"windowTint":-1,"modCustomTiresF":false,"model":-1269889662,"plate":"00CLV472","modArmor":-1,"modTrimA":-1,"color2":0,"modTrunk":-1,"extras":[],"modGrille":-1,"modTank":-1,"fuelLevel":100.08535757525947,"oilLevel":2.38298470417284,"xenonColor":255,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modDial":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modSpoilers":-1,"modRearBumper":-1,"modStruts":-1,"modFrontWheels":-1,"modPlateHolder":-1,"interiorColor":0,"modRoof":-1,"modVanityPlate":-1,"modArchCover":-1,"color1":0,"modTurbo":false,"modShifterLeavers":-1,"modHorns":-1,"wheelWidth":0.0,"modDoorSpeaker":-1,"modLivery":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1,"modKit19":-1,"wheelSize":0.0,"modAPlate":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modDashboard":-1,"modHydrolic":-1,"modAirFilter":-1,"wheels":4,"dashboardColor":0,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"liveryRoof":-1,"modTransmission":-1,"plateIndex":4,"modHood":-1,"wheelColor":0,"modFrontBumper":-1,"modKit21":-1,"neonEnabled":[false,false,false,false],"modEngineBlock":-1,"modKit17":-1}', '00CLV472', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(31, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'adv1502023', '-254386275', '{"plateIndex":0,"wheels":6,"plate":"82WRC665","modRightFender":3,"modSeats":-1,"modTurbo":1,"model":-254386275,"modRearBumper":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"wheelWidth":1.0,"color2":12,"modOrnaments":-1,"modLivery":-1,"modTrimB":-1,"liveryRoof":-1,"modSpoilers":-1,"modDoorSpeaker":-1,"engineHealth":1000.0592475178704,"modSideSkirt":-1,"color1":12,"pearlescentColor":12,"modSuspension":-1,"wheelColor":12,"modRoof":-1,"modBackWheels":-1,"tyreSmokeColor":[255,0,0],"modEngine":3,"modSteeringWheel":-1,"modKit49":-1,"extras":[],"modFender":4,"modSmokeEnabled":1,"modSpeakers":-1,"modXenon":false,"modFrontWheels":-1,"modArchCover":-1,"neonColor":[255,1,1],"modHood":-1,"modKit17":-1,"modGrille":4,"modEngineBlock":-1,"neonEnabled":[1,1,1,1],"modFrame":0,"dashboardColor":0,"xenonColor":255,"modTransmission":2,"modAirFilter":-1,"modArmor":4,"modKit19":-1,"modVanityPlate":-1,"dirtLevel":2.38298470417284,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modCustomTiresR":false,"modCustomTiresF":false,"windowTint":1,"modKit21":-1,"modAPlate":-1,"modTrimA":-1,"modStruts":-1,"modWindows":-1,"tankHealth":1000.0592475178704,"modExhaust":-1,"modTrunk":-1,"modAerials":-1,"interiorColor":0,"modPlateHolder":-1,"bodyHealth":1000.0592475178704,"modHorns":3,"modShifterLeavers":-1,"modBrakes":2,"modKit47":-1,"modDashboard":-1,"fuelLevel":65.13491524739108,"oilLevel":4.76596940834568,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modTank":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheelSize":1.0,"modDial":-1,"modFrontBumper":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modHydrolic":-1}', '82WRC665', NULL, NULL, 94, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Parking Casino', 0, 0, 0, 0, '', 4322),
	(32, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'banshee87', '1803318603', '{"engineHealth":1000.0592475178704,"modSuspension":-1,"modExhaust":-1,"modRearBumper":-1,"extras":{"1":true},"modKit49":-1,"modSideSkirt":-1,"pearlescentColor":12,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSpoilers":-1,"xenonColor":[255,0,0],"bodyHealth":991.3216369359033,"modKit17":-1,"modFender":-1,"modDial":-1,"modKit21":-1,"modKit47":-1,"modFrontBumper":-1,"modXenon":1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modKit19":-1,"modHood":-1,"modDoorSpeaker":-1,"modTrimB":-1,"modSmokeEnabled":1,"modHorns":-1,"wheelColor":12,"plateIndex":1,"modCustomTiresF":false,"modEngine":-1,"modAPlate":-1,"modRoof":-1,"fuelLevel":97.70237287108663,"modAirFilter":-1,"tyreSmokeColor":[245,0,0],"modStruts":-1,"modBrakes":2,"modGrille":-1,"modTank":-1,"modBackWheels":-1,"modWindows":-1,"modShifterLeavers":-1,"neonColor":[255,1,1],"modSpeakers":-1,"oilLevel":2.38298470417284,"dirtLevel":0.0,"wheelSize":1.0,"color1":12,"modOrnaments":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modLivery":2,"modVanityPlate":-1,"modSteeringWheel":-1,"model":1803318603,"modTrimA":-1,"modAerials":-1,"modSeats":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"wheels":4,"color2":12,"modHydrolic":-1,"modRightFender":-1,"modFrame":-1,"modEngineBlock":-1,"modPlateHolder":-1,"modCustomTiresR":false,"tankHealth":996.0876063442489,"modTrunk":-1,"plate":"29NCR897","interiorColor":0,"wheelWidth":1.0,"modArchCover":-1,"modArmor":-1,"dashboardColor":0,"liveryRoof":-1,"windowTint":1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTransmission":-1,"modFrontWheels":-1,"modTurbo":false,"neonEnabled":[1,1,1,1],"modDashboard":-1}', '29NCR897', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(33, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'tracer900bana', '1767812840', '{"neonEnabled":[false,false,false,false],"modCustomTiresR":false,"modKit49":-1,"modAPlate":-1,"modRightFender":-1,"dirtLevel":0.0,"wheels":6,"modArmor":-1,"modOrnaments":-1,"dashboardColor":0,"modKit21":-1,"modFrontBumper":-1,"windowStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"6":false,"7":false,"0":false},"modEngine":-1,"modSeats":-1,"modSmokeEnabled":false,"modTrunk":-1,"modHydrolic":-1,"oilLevel":4.76596940834568,"wheelWidth":0.0,"modPlateHolder":-1,"bodyHealth":1000.0592475178704,"modKit19":-1,"tireHealth":{"1":1000.0,"2":0.0,"3":0.0,"0":1000.0},"modHorns":-1,"plate":"25YZO058","modSuspension":-1,"modStruts":-1,"modEngineBlock":-1,"modExhaust":-1,"modVanityPlate":-1,"modFrame":-1,"modRearBumper":-1,"engineHealth":1000.0592475178704,"neonColor":[255,0,255],"modGrille":-1,"modXenon":false,"modShifterLeavers":-1,"color2":1,"modWindows":-1,"wheelSize":0.0,"liveryRoof":-1,"color1":64,"modLivery":-1,"modHood":-1,"modSpeakers":-1,"modTrimB":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"extras":[],"modDial":-1,"modFrontWheels":-1,"modRoof":-1,"pearlescentColor":64,"tyreSmokeColor":[255,255,255],"tankHealth":1000.0592475178704,"modKit17":-1,"modFender":-1,"modSteeringWheel":-1,"xenonColor":255,"modAirFilter":-1,"modDashboard":-1,"wheelColor":1,"plateIndex":0,"interiorColor":0,"modTransmission":-1,"modBrakes":-1,"modCustomTiresF":false,"modArchCover":-1,"fuelLevel":27.80148821534985,"modTrimA":-1,"modKit47":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAerials":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTank":-1,"modTurbo":false,"modDoorSpeaker":-1,"model":1767812840,"modSideSkirt":-1,"windowTint":-1,"modSpoilers":-1,"modBackWheels":-1}', '25YZO058', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(34, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'AGM09146', 'xc90', '284310455', '{"neonEnabled":[false,false,false,false],"modCustomTiresR":false,"model":284310455,"modFrontWheels":-1,"pearlescentColor":0,"dirtLevel":0.0,"modLivery":-1,"modArmor":-1,"modOrnaments":-1,"dashboardColor":0,"modKit21":-1,"modFrontBumper":-1,"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modEngine":-1,"xenonColor":255,"modSmokeEnabled":false,"modTrunk":-1,"modHydrolic":-1,"modBrakes":-1,"wheelWidth":0.0,"modPlateHolder":-1,"bodyHealth":1000.0592475178704,"modKit19":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modHorns":-1,"plate":"85CGV512","modSuspension":-1,"modStruts":-1,"modEngineBlock":-1,"modSpeakers":-1,"modVanityPlate":-1,"modFrame":-1,"modDial":-1,"modTrimB":-1,"neonColor":[255,0,255],"modWindows":-1,"modCustomTiresF":false,"tyreSmokeColor":[255,255,255],"color2":0,"modRoof":-1,"wheelSize":0.0,"modAPlate":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modTurbo":false,"modRightFender":-1,"modKit49":-1,"modTank":-1,"wheels":7,"extras":[],"modShifterLeavers":-1,"modTransmission":-1,"modXenon":false,"liveryRoof":-1,"modHood":-1,"modKit47":-1,"modKit17":-1,"modFender":-1,"modSteeringWheel":-1,"modSeats":-1,"modAirFilter":-1,"modDashboard":-1,"wheelColor":156,"plateIndex":3,"interiorColor":0,"modGrille":-1,"color1":111,"oilLevel":4.76596940834568,"modArchCover":-1,"fuelLevel":46.86536584873261,"modTrimA":-1,"engineHealth":1000.0592475178704,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modRearBumper":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"tankHealth":1000.0592475178704,"modAerials":-1,"modDoorSpeaker":-1,"modExhaust":-1,"modSideSkirt":-1,"windowTint":-1,"modSpoilers":-1,"modBackWheels":-1}', '85CGV512', NULL, NULL, 100, 1000, 1000, 0, 500, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 1, 'Legion Square', 0, 0, 0, 0, '', 4321),
	(35, 'license:3d0f61a039b8eeab05905900b0d47d15fe3b062c', 'AYN44292', 'yFe458i1', '-1307201065', '{"modRearBumper":-1,"modHydrolic":-1,"modKit19":-1,"modFrontBumper":-1,"interiorColor":0,"modRightFender":-1,"engineHealth":1000.0592475178704,"wheelColor":0,"modSpeakers":-1,"modSideSkirt":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"color2":106,"modOrnaments":-1,"modVanityPlate":-1,"modKit47":-1,"modAerials":-1,"modTransmission":-1,"modHood":-1,"modDoorSpeaker":-1,"modEngine":-1,"modFender":-1,"doorStatus":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modAirFilter":-1,"modSeats":-1,"modAPlate":-1,"modWindows":-1,"pearlescentColor":28,"modCustomTiresR":false,"modFrame":-1,"dirtLevel":0.0,"fuelLevel":66.72357171683965,"modTank":-1,"modKit21":-1,"modSmokeEnabled":false,"modArmor":-1,"extras":[],"modHorns":-1,"modRoof":-1,"tankHealth":1000.0592475178704,"model":-1307201065,"modKit49":-1,"wheelWidth":0.0,"wheels":7,"modTrunk":-1,"modDashboard":-1,"tireBurstState":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modSteeringWheel":-1,"modBrakes":-1,"plateIndex":0,"modLivery":1,"modTrimA":-1,"xenonColor":255,"modSuspension":-1,"modFrontWheels":-1,"modBackWheels":-1,"color1":29,"neonColor":[255,0,255],"windowStatus":{"1":true,"2":true,"3":true,"4":false,"5":false,"6":true,"7":true,"0":true},"modKit17":-1,"wheelSize":0.0,"plate":"09QZC287","modDial":-1,"oilLevel":4.76596940834568,"modTurbo":false,"modEngineBlock":-1,"bodyHealth":1000.0592475178704,"modExhaust":-1,"modSpoilers":-1,"tireBurstCompletely":{"1":false,"2":false,"3":false,"4":false,"5":false,"0":false},"modPlateHolder":-1,"modShifterLeavers":-1,"tireHealth":{"1":1000.0,"2":1000.0,"3":1000.0,"0":1000.0},"modGrille":-1,"liveryRoof":-1,"modCustomTiresF":false,"modXenon":false,"windowTint":-1,"modTrimB":-1,"tyreSmokeColor":[255,255,255],"dashboardColor":0,"modStruts":-1}', '09QZC287', NULL, NULL, 98, 1000, 1000, 0, 0, NULL, NULL, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Parking Paleto', 0, 0, 0, 0, '', 4322);

-- Listage de la structure de table paris_horizon_base_dev. player_warns
DROP TABLE IF EXISTS `player_warns`;
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_warns : ~0 rows (environ)
DELETE FROM `player_warns`;

-- Listage de la structure de table paris_horizon_base_dev. race_tracks
DROP TABLE IF EXISTS `race_tracks`;
CREATE TABLE IF NOT EXISTS `race_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.race_tracks : ~0 rows (environ)
DELETE FROM `race_tracks`;

-- Listage de la structure de table paris_horizon_base_dev. robberies_creator_cargo_robberies
DROP TABLE IF EXISTS `robberies_creator_cargo_robberies`;
CREATE TABLE IF NOT EXISTS `robberies_creator_cargo_robberies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `blip_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.robberies_creator_cargo_robberies : ~0 rows (environ)
DELETE FROM `robberies_creator_cargo_robberies`;

-- Listage de la structure de table paris_horizon_base_dev. robberies_creator_heists
DROP TABLE IF EXISTS `robberies_creator_heists`;
CREATE TABLE IF NOT EXISTS `robberies_creator_heists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(100) NOT NULL,
  `minimum_police` int(11) NOT NULL DEFAULT 0,
  `timeout_minutes` int(11) NOT NULL DEFAULT 120,
  `minutes_before_reset` int(11) NOT NULL DEFAULT 60,
  `time_limit_minutes` int(11) NOT NULL DEFAULT 0,
  `stages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.robberies_creator_heists : ~0 rows (environ)
DELETE FROM `robberies_creator_heists`;

-- Listage de la structure de table paris_horizon_base_dev. robberies_creator_plannings
DROP TABLE IF EXISTS `robberies_creator_plannings`;
CREATE TABLE IF NOT EXISTS `robberies_creator_plannings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `cargo_robbery_id` int(11) DEFAULT NULL,
  `minimum_police` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  KEY `cargo_robbery_id` (`cargo_robbery_id`) USING BTREE,
  CONSTRAINT `cargo_robbery_id` FOREIGN KEY (`cargo_robbery_id`) REFERENCES `robberies_creator_cargo_robberies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.robberies_creator_plannings : ~0 rows (environ)
DELETE FROM `robberies_creator_plannings`;

-- Listage de la structure de table paris_horizon_base_dev. tiktok_users
DROP TABLE IF EXISTS `tiktok_users`;
CREATE TABLE IF NOT EXISTS `tiktok_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text DEFAULT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `bio` text NOT NULL DEFAULT '',
  `birthday` varchar(50) NOT NULL DEFAULT '0',
  `videos` text NOT NULL DEFAULT '{}',
  `followers` text NOT NULL,
  `following` text NOT NULL,
  `liked` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.tiktok_users : ~0 rows (environ)
DELETE FROM `tiktok_users`;

-- Listage de la structure de table paris_horizon_base_dev. tiktok_videos
DROP TABLE IF EXISTS `tiktok_videos`;
CREATE TABLE IF NOT EXISTS `tiktok_videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `created` varchar(50) NOT NULL DEFAULT '00:00:00',
  `data` text DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.tiktok_videos : ~0 rows (environ)
DELETE FROM `tiktok_videos`;

-- Listage de la structure de table paris_horizon_base_dev. tinder_accounts
DROP TABLE IF EXISTS `tinder_accounts`;
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.tinder_accounts : ~0 rows (environ)
DELETE FROM `tinder_accounts`;

-- Listage de la structure de table paris_horizon_base_dev. tinder_likes
DROP TABLE IF EXISTS `tinder_likes`;
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.tinder_likes : ~0 rows (environ)
DELETE FROM `tinder_likes`;

-- Listage de la structure de table paris_horizon_base_dev. tinder_messages
DROP TABLE IF EXISTS `tinder_messages`;
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` longtext NOT NULL,
  `messages` longtext DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.tinder_messages : ~0 rows (environ)
DELETE FROM `tinder_messages`;

-- Listage de la structure de table paris_horizon_base_dev. twitter_account
DROP TABLE IF EXISTS `twitter_account`;
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.twitter_account : ~0 rows (environ)
DELETE FROM `twitter_account`;

-- Listage de la structure de table paris_horizon_base_dev. twitter_hashtags
DROP TABLE IF EXISTS `twitter_hashtags`;
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.twitter_hashtags : ~0 rows (environ)
DELETE FROM `twitter_hashtags`;

-- Listage de la structure de table paris_horizon_base_dev. twitter_mentions
DROP TABLE IF EXISTS `twitter_mentions`;
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.twitter_mentions : ~0 rows (environ)
DELETE FROM `twitter_mentions`;

-- Listage de la structure de table paris_horizon_base_dev. twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `message` longtext NOT NULL,
  `hashtags` varchar(50) NOT NULL,
  `mentions` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `likes` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.twitter_tweets : ~0 rows (environ)
DELETE FROM `twitter_tweets`;

-- Listage de la structure de table paris_horizon_base_dev. vehicle_parking
DROP TABLE IF EXISTS `vehicle_parking`;
CREATE TABLE IF NOT EXISTS `vehicle_parking` (
  `id` varchar(16) NOT NULL,
  `model` int(11) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `status` text NOT NULL,
  `tuning` text NOT NULL,
  `stateBags` text NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL,
  `lastUpdate` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.vehicle_parking : ~6 rows (environ)
DELETE FROM `vehicle_parking`;
INSERT INTO `vehicle_parking` (`id`, `model`, `type`, `status`, `tuning`, `stateBags`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `lastUpdate`) VALUES
	('11c21a5349e13ca6', 284310455, 'automobile', '[\n    712,\n    652.9,\n    995.9999999999434,\n    842.999999999952,\n    0.9,\n    36.8,\n    0,\n    [],\n    [\n        [\n            0,\n            false\n        ],\n        [\n            1,\n            false\n        ],\n        [\n            2,\n            false\n        ],\n        [\n            3,\n            false\n        ],\n        [\n            4,\n            false\n        ],\n        [\n            5,\n            false\n        ]\n    ],\n    [\n        0,\n        1,\n        2,\n        4,\n        5,\n        6,\n        7,\n        8,\n        9,\n        10,\n        11,\n        12,\n        13\n    ]\n]', '[\n    "85CGV512",\n    [],\n    111,\n    0,\n    0,\n    156,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [],\n    7,\n    false,\n    false,\n    false,\n    false,\n    3,\n    -1,\n    -1,\n    -1\n]', '{\n    "deformation": [\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.20332968235015,\n                "y": -0.48313999176025,\n                "z": -0.04007547348737\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.19996309280395,\n                "y": -0.47514048218727,\n                "z": -0.12677335739135\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.1618513315916,\n                "y": -0.38458153605461,\n                "z": -0.17332196235656\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.09926080703735,\n                "y": -0.23585766553878,\n                "z": -0.14966139197349\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.10557103157043,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.16506288945674,\n                "y": -0.28799724578857,\n                "z": -0.03253323957324\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.10557103157043,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.15243874490261,\n                "y": -0.26597094535827,\n                "z": -0.09664368629455\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.10519790649414,\n                "y": -0.18354642391204,\n                "z": -0.112653426826\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.05217657610774,\n                "y": -0.09103626012802,\n                "z": -0.07866971194744\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": -2.46599459648132,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.03354649245738,\n                "y": 0.06855010986328,\n                "z": -0.02126793004572\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": -2.46599459648132,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.03114108182489,\n                "y": 0.06363481283187,\n                "z": -0.03334809467196\n            }\n        ],\n        [\n            {\n                "x": -1.2067881822586,\n                "y": -3.22792220115661,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.02835983410477,\n                "y": 0.07585700601339,\n                "z": -0.00558961043134\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.16492216289043,\n                "y": -0.5215601325035,\n                "z": -0.043262347579\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.14899167418479,\n                "y": -0.47118058800697,\n                "z": -0.12571680545806\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.13246050477027,\n                "y": -0.41890135407447,\n                "z": -0.18878911435604\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.08487243950366,\n                "y": -0.26840588450431,\n                "z": -0.17031459510326\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.10557103157043,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.15124253928661,\n                "y": -0.35120928287506,\n                "z": -0.03967390954494\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.07938886433839,\n                "y": -0.18435361981391,\n                "z": -0.11314885318279\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.04154518619179,\n                "y": -0.096474558115,\n                "z": -0.08336925506591\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": -3.22792220115661,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.0187883451581,\n                "y": 0.06688577681779,\n                "z": -0.00492855487391\n            }\n        ],\n        [\n            {\n                "x": -0.90672969818115,\n                "y": -3.22792220115661,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.02581697516143,\n                "y": 0.09190742671489,\n                "z": -0.02178395353257\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.10448171943426,\n                "y": -0.49384441971778,\n                "z": -0.04096338525414\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.10395934432744,\n                "y": -0.49137535691261,\n                "z": -0.13110502064228\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.08963135629892,\n                "y": -0.42365252971649,\n                "z": -0.19093035161495\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.05799421295523,\n                "y": -0.27411603927612,\n                "z": -0.17393793165683\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.06162548065185,\n                "y": -0.21388326585292,\n                "z": -0.13127297163009\n            }\n        ],\n        [\n            {\n                "x": -0.60667121410369,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.03188214451074,\n                "y": -0.1106532216072,\n                "z": -0.09562186151742\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.04913842305541,\n                "y": -0.45955154299736,\n                "z": -0.03811886161565\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.04890091344714,\n                "y": -0.45733031630516,\n                "z": -0.12202138453722\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.03934771195054,\n                "y": -0.36798703670501,\n                "z": -0.16584320366382\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.02463923767209,\n                "y": -0.23043069243431,\n                "z": -0.14621776342391\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.02722032368183,\n                "y": -0.18692742288112,\n                "z": -0.11472854018211\n            }\n        ],\n        [\n            {\n                "x": -0.30661273002624,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.01286533568054,\n                "y": -0.08834883570671,\n                "z": -0.07634735107421\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": 0.00095809227786,\n                "y": -0.41916769742965,\n                "z": -0.03476910293102\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": 0.00095217529451,\n                "y": -0.41657903790473,\n                "z": -0.11114843934774\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.00068615633063,\n                "y": -0.30019506812095,\n                "z": -0.13529093563556\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.00048262972268,\n                "y": -0.211151689291,\n                "z": -0.13398443162441\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": 0.00051108020124,\n                "y": -0.16418603062629,\n                "z": -0.10077080130577\n            }\n        ],\n        [\n            {\n                "x": -0.00655424594879,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": 0.00024818498059,\n                "y": -0.07973016798496,\n                "z": -0.0688994526863\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.03833907470107,\n                "y": -0.37456786632537,\n                "z": -0.0310696363449\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": -0.03744599595665,\n                "y": -0.36584258079528,\n                "z": -0.09761131554841\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.02794805727899,\n                "y": -0.27304890751838,\n                "z": -0.12305679917335\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.01856747828423,\n                "y": -0.18140186369419,\n                "z": -0.11510696262121\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.01872337237,\n                "y": -0.13431967794895,\n                "z": -0.08244002610445\n            }\n        ],\n        [\n            {\n                "x": 0.29350423812866,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.00967901479452,\n                "y": -0.0694363117218,\n                "z": -0.06000394001603\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.06030645966529,\n                "y": -0.29134020209312,\n                "z": -0.02416607551276\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": -0.06082024425268,\n                "y": -0.2938223183155,\n                "z": -0.07839542627334\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.05182049795985,\n                "y": -0.25034457445144,\n                "z": -0.11282448470592\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.03153496235609,\n                "y": -0.15234525501728,\n                "z": -0.09666933864355\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.03028056211769,\n                "y": -0.10741557180881,\n                "z": -0.06592736393213\n            }\n        ],\n        [\n            {\n                "x": 0.59356272220611,\n                "y": 2.10557103157043,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.01477346569299,\n                "y": -0.0524065606296,\n                "z": -0.0452875457704\n            }\n        ],\n        [\n            {\n                "x": 0.89362120628356,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.0642953813076,\n                "y": -0.20631439983844,\n                "z": -0.01711335591971\n            }\n        ],\n        [\n            {\n                "x": 0.89362120628356,\n                "y": 2.86749863624572,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.05955575406551,\n                "y": -0.19110563397407,\n                "z": -0.08612687140703\n            }\n        ],\n        [\n            {\n                "x": 0.89362120628356,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.03952200338244,\n                "y": -0.12682028114795,\n                "z": -0.08047269284725\n            }\n        ],\n        [\n            {\n                "x": 0.89362120628356,\n                "y": 2.10557103157043,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.0437064319849,\n                "y": -0.10298211127519,\n                "z": -0.01163324248045\n            }\n        ],\n        [\n            {\n                "x": 0.89362120628356,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.031518176198,\n                "y": -0.07426385581493,\n                "z": -0.04558017477393\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.86749863624572,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.05354210361838,\n                "y": -0.12862069904804,\n                "z": -0.0106688234955\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.86749863624572,\n                "z": 0.76508408784866\n            },\n            {\n                "x": -0.06843671947717,\n                "y": -0.16440105438232,\n                "z": -0.04386423155665\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.86749863624572,\n                "z": 1.81954598426818\n            },\n            {\n                "x": -0.03865128755569,\n                "y": -0.09284946322441,\n                "z": -0.05891681089997\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.10557103157043,\n                "z": 0.2378531396389\n            },\n            {\n                "x": -0.02542004175484,\n                "y": -0.04483925178647,\n                "z": -0.0050652087666\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.10557103157043,\n                "z": 0.76508408784866\n            },\n            {\n                "x": -0.03189248591661,\n                "y": -0.0562562122941,\n                "z": -0.02044135890901\n            }\n        ],\n        [\n            {\n                "x": 1.19367969036102,\n                "y": 2.10557103157043,\n                "z": 1.2923150062561\n            },\n            {\n                "x": -0.0264661218971,\n                "y": -0.0466844625771,\n                "z": -0.02865305170416\n            }\n        ]\n    ]\n}', -1903.35, -238.36, 39.87, -17.27, 17, 130.06, 1741702610),
	('54f40342ec718617', -1307201065, 'automobile', '[\n    1000,\n    1000.0,\n    1000.0,\n    1000.0,\n    0.1,\n    94.8,\n    1,\n    [],\n    [\n        [\n            0,\n            false\n        ],\n        [\n            1,\n            false\n        ],\n        [\n            4,\n            false\n        ],\n        [\n            5,\n            false\n        ]\n    ],\n    []\n]', '[\n    "09QZC287",\n    [],\n    29,\n    106,\n    28,\n    0,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [],\n    7,\n    false,\n    false,\n    false,\n    false,\n    0,\n    -1,\n    1,\n    -1\n]', '[]', -78.51, 6535.22, 31.04, 1.08, 0.02, -134.7, 1741717367),
	('5ca96be50afee398', 43494928, 'bike', '[\n    1000,\n    1000.0,\n    999.9999999999432,\n    999.9999999999432,\n    3.5,\n    59.5,\n    0,\n    [],\n    [\n        [\n            0,\n            false\n        ]\n    ],\n    []\n]', '[\n    "46LNO708",\n    [\n        [\n            11,\n            3\n        ],\n        [\n            12,\n            2\n        ],\n        [\n            13,\n            2\n        ],\n        [\n            15,\n            3\n        ],\n        [\n            16,\n            4\n        ],\n        [\n            18,\n            true\n        ]\n    ],\n    64,\n    1,\n    64,\n    1,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [],\n    6,\n    false,\n    false,\n    false,\n    false,\n    0,\n    -1,\n    0,\n    -1\n]', '[]', 2271.81, 3008.18, 44.88, -2.47, 85.49, -89.7, 1741692399),
	('6f42389cf3f99673', 2113441065, 'automobile', '[\n    0,\n    0.0,\n    -3999.9999999997728,\n    699.9999999999602,\n    15.0,\n    29.8,\n    0,\n    [],\n    [\n        [\n            0,\n            false\n        ],\n        [\n            1,\n            false\n        ],\n        [\n            2,\n            false\n        ],\n        [\n            3,\n            false\n        ],\n        [\n            4,\n            false\n        ]\n    ],\n    [\n        2,\n        3,\n        4,\n        7,\n        8,\n        9,\n        10,\n        11,\n        12,\n        13\n    ]\n]', '[\n    "29KMH369",\n    [\n        [\n            4,\n            1\n        ],\n        [\n            11,\n            1\n        ],\n        [\n            12,\n            2\n        ],\n        [\n            13,\n            1\n        ],\n        [\n            15,\n            2\n        ],\n        [\n            16,\n            4\n        ],\n        [\n            18,\n            true\n        ],\n        [\n            22,\n            true\n        ]\n    ],\n    162,\n    196,\n    235,\n    227,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [\n        [\n            1,\n            0\n        ],\n        [\n            2,\n            0\n        ]\n    ],\n    0,\n    false,\n    false,\n    false,\n    false,\n    0,\n    1,\n    2,\n    -1\n]', '{\n    "deformation": [\n        [\n            {\n                "x": 0.69328099489212,\n                "y": -2.38846039772033,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.01893416047096,\n                "y": 0.06523110717535,\n                "z": 0.01073460653424\n            }\n        ]\n    ]\n}', 861.16, -894.24, 25.28, 0.2, -1.72, 4.87, 1741479820),
	('6fe3f9937e8609fe', -1269889662, 'automobile', '[\n    999,\n    999.6,\n    998.9999999999432,\n    999.9999999999432,\n    0.6,\n    97.2,\n    0,\n    [],\n    [],\n    []\n]', '[\n    "00CLV472",\n    [\n        [\n            11,\n            3\n        ],\n        [\n            12,\n            2\n        ],\n        [\n            13,\n            2\n        ],\n        [\n            15,\n            3\n        ],\n        [\n            16,\n            4\n        ],\n        [\n            18,\n            true\n        ]\n    ],\n    0,\n    0,\n    0,\n    0,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [],\n    4,\n    false,\n    false,\n    false,\n    false,\n    4,\n    -1,\n    -1,\n    -1\n]', '[]', 747.21, 741.96, 189.01, 13.13, 15.19, 18.97, 1741692515),
	('d3e612fed11c0de4', 2113441065, 'automobile', '[\n    997,\n    997.0,\n    999.9999999999432,\n    999.9999999999432,\n    3.0,\n    20.4,\n    2,\n    [],\n    [\n        [\n            0,\n            false\n        ],\n        [\n            1,\n            false\n        ],\n        [\n            2,\n            false\n        ],\n        [\n            3,\n            false\n        ],\n        [\n            4,\n            false\n        ]\n    ],\n    [\n        0,\n        6,\n        8,\n        9,\n        10,\n        11,\n        12,\n        13\n    ]\n]', '[\n    "2UX364WY",\n    [\n        [\n            11,\n            2\n        ],\n        [\n            12,\n            2\n        ],\n        [\n            13,\n            1\n        ],\n        [\n            15,\n            2\n        ],\n        [\n            16,\n            4\n        ],\n        [\n            18,\n            true\n        ]\n    ],\n    62,\n    27,\n    0,\n    0,\n    [\n        112,\n        54,\n        157\n    ],\n    [\n        112,\n        54,\n        157\n    ],\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [\n        [\n            1,\n            0\n        ],\n        [\n            2,\n            0\n        ]\n    ],\n    0,\n    false,\n    false,\n    false,\n    false,\n    0,\n    -1,\n    7,\n    -1\n]', '{\n    "deformation": [\n        [\n            {\n                "z": -0.04659238457679,\n                "y": 2.36745572090148,\n                "x": -0.6960991024971\n            },\n            {\n                "z": 0.00096525484696,\n                "y": -0.04904660210013,\n                "x": 0.01442109234631\n            }\n        ]\n    ]\n}', 154.6, -1032.68, 29.02, 1.48, -3.2, -139.82, 1741562442),
	('d4c04934115ae8d0', 2113441065, 'automobile', '[\n    925,\n    925.2,\n    973.4,\n    988.0,\n    0.5,\n    64.9,\n    1,\n    [],\n    [\n        [\n            0,\n            false\n        ],\n        [\n            1,\n            false\n        ],\n        [\n            2,\n            false\n        ],\n        [\n            3,\n            false\n        ],\n        [\n            4,\n            false\n        ]\n    ],\n    [\n        3,\n        5,\n        6,\n        7,\n        8,\n        9,\n        10,\n        11,\n        12,\n        13\n    ]\n]', '[\n    "21WGZ779",\n    [],\n    27,\n    27,\n    36,\n    119,\n    null,\n    null,\n    0,\n    0,\n    [\n        255,\n        255,\n        255\n    ],\n    255,\n    [\n        255,\n        0,\n        255\n    ],\n    [\n        false,\n        false,\n        false,\n        false\n    ],\n    [\n        [\n            1,\n            0\n        ],\n        [\n            2,\n            0\n        ]\n    ],\n    0,\n    false,\n    false,\n    false,\n    false,\n    0,\n    -1,\n    3,\n    -1\n]', '{\n    "deformation": [\n        [\n            {\n                "x": -0.92766243219375,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.0767316520214,\n                "y": -0.19582425057888,\n                "z": -0.05346087738871\n            }\n        ],\n        [\n            {\n                "x": -0.92766243219375,\n                "y": 1.77296614646911,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.10072618722915,\n                "y": -0.19250980019569,\n                "z": 0.04267777875065\n            }\n        ],\n        [\n            {\n                "x": -0.92766243219375,\n                "y": 1.77296614646911,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.11120656132698,\n                "y": -0.21254010498523,\n                "z": 0.00558541435748\n            }\n        ],\n        [\n            {\n                "x": -0.92766243219375,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.05096289142966,\n                "y": -0.09740126132965,\n                "z": -0.03550713136792\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.12136386334896,\n                "y": -0.41276243329048,\n                "z": 0.068527944386\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.12608557939529,\n                "y": -0.42882114648818,\n                "z": 0.00843935459852\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.06430646777153,\n                "y": -0.21870839595794,\n                "z": -0.05970834568142\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 1.77296614646911,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.10324228554964,\n                "y": -0.26295837759971,\n                "z": 0.05829562619328\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": 0.07752586901187,\n                "y": -0.19745858013629,\n                "z": -0.03339671716094\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.04709086939692,\n                "y": -0.11994055658578,\n                "z": -0.04372372105717\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": -2.38846039772033,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.02503379061818,\n                "y": 0.08589612692594,\n                "z": 0.01413529645651\n            }\n        ],\n        [\n            {\n                "x": -0.6960991024971,\n                "y": -2.38846039772033,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.02224558033049,\n                "y": 0.07632920145988,\n                "z": 0.00148897571489\n            }\n        ],\n        [\n            {\n                "x": -0.46453574299812,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.08932777494192,\n                "y": -0.45524924993515,\n                "z": 0.07558172196149\n            }\n        ],\n        [\n            {\n                "x": -0.46453574299812,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.0879873484373,\n                "y": -0.44841793179512,\n                "z": 0.00882502645254\n            }\n        ],\n        [\n            {\n                "x": -0.46453574299812,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.04862163960933,\n                "y": -0.24779488146305,\n                "z": -0.06764908879995\n            }\n        ],\n        [\n            {\n                "x": -0.46453574299812,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": 0.06223884224891,\n                "y": -0.23754332959651,\n                "z": -0.04017636179924\n            }\n        ],\n        [\n            {\n                "x": -0.46453574299812,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.03174420073628,\n                "y": -0.12115620821714,\n                "z": -0.04416688159108\n            }\n        ],\n        [\n            {\n                "x": -0.2329723984003,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.0420988202095,\n                "y": -0.42780643701553,\n                "z": 0.07102558761835\n            }\n        ],\n        [\n            {\n                "x": -0.2329723984003,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.04246036335825,\n                "y": -0.43148043751716,\n                "z": 0.00849169120192\n            }\n        ],\n        [\n            {\n                "x": -0.2329723984003,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.02638474665582,\n                "y": -0.26812067627906,\n                "z": -0.07319811731576\n            }\n        ],\n        [\n            {\n                "x": -0.2329723984003,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": 0.03373878449201,\n                "y": -0.25675883889198,\n                "z": -0.04342633113265\n            }\n        ],\n        [\n            {\n                "x": -0.2329723984003,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.01800583675503,\n                "y": -0.13702797889709,\n                "z": -0.04995285347104\n            }\n        ],\n        [\n            {\n                "x": -0.00140905380249,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": 0.00026334819267,\n                "y": -0.44247078895568,\n                "z": 0.07346020638942\n            }\n        ],\n        [\n            {\n                "x": -0.00140905380249,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": 0.00026447433629,\n                "y": -0.4443629682064,\n                "z": 0.00874522421509\n            }\n        ],\n        [\n            {\n                "x": -0.00140905380249,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.00016175076598,\n                "y": -0.27176943421363,\n                "z": -0.07419423758983\n            }\n        ],\n        [\n            {\n                "x": -0.00140905380249,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": 0.0002077929821,\n                "y": -0.26145908236503,\n                "z": -0.04422129690647\n            }\n        ],\n        [\n            {\n                "x": -0.00140905380249,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": 0.00009211820724,\n                "y": -0.11590931564569,\n                "z": -0.04225414991378\n            }\n        ],\n        [\n            {\n                "x": 0.23015429079532,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.04588508233428,\n                "y": -0.4719915986061,\n                "z": 0.07836133241653\n            }\n        ],\n        [\n            {\n                "x": 0.23015429079532,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": -0.04623324796557,\n                "y": -0.47557300329208,\n                "z": 0.00935944821685\n            }\n        ],\n        [\n            {\n                "x": 0.23015429079532,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.02470022067427,\n                "y": -0.25407597422599,\n                "z": -0.06936384737491\n            }\n        ],\n        [\n            {\n                "x": 0.23015429079532,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": -0.03555238619446,\n                "y": -0.27387356758117,\n                "z": -0.04632099345326\n            }\n        ],\n        [\n            {\n                "x": 0.23015429079532,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.01551131159067,\n                "y": -0.11948953568935,\n                "z": -0.04355930164456\n            }\n        ],\n        [\n            {\n                "x": 0.46171763539314,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.10119893401861,\n                "y": -0.51889723539352,\n                "z": 0.0861487314105\n            }\n        ],\n        [\n            {\n                "x": 0.46171763539314,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": -0.10152166336774,\n                "y": -0.52055203914642,\n                "z": 0.01024465169757\n            }\n        ],\n        [\n            {\n                "x": 0.46171763539314,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.0506351403892,\n                "y": -0.25963151454925,\n                "z": -0.07088053971529\n            }\n        ],\n        [\n            {\n                "x": 0.46171763539314,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": -0.06162600964307,\n                "y": -0.23663991689682,\n                "z": -0.04002356529235\n            }\n        ],\n        [\n            {\n                "x": 0.46171763539314,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.03257310390472,\n                "y": -0.12507863342761,\n                "z": -0.04559677839279\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 2.36745572090148,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.14206786453723,\n                "y": -0.48514148592948,\n                "z": 0.08054450154304\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 2.36745572090148,\n                "z": -0.04659238457679\n            },\n            {\n                "x": -0.14966565370559,\n                "y": -0.51108682155609,\n                "z": 0.01005837321281\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.07165520638227,\n                "y": -0.24469231069087,\n                "z": -0.06680206954479\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 1.77296614646911,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.11302679777145,\n                "y": -0.28904974460601,\n                "z": 0.06407985836267\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 1.77296614646911,\n                "z": 0.29986667633056\n            },\n            {\n                "x": -0.08646089583635,\n                "y": -0.22111125290393,\n                "z": -0.03739716112613\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.05143584683537,\n                "y": -0.13153976202011,\n                "z": -0.04795214906334\n            }\n        ],\n        [\n            {\n                "x": 0.69328099489212,\n                "y": -2.38846039772033,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.01890888623893,\n                "y": 0.06514403969049,\n                "z": 0.0107202772051\n            }\n        ],\n        [\n            {\n                "x": 0.92484432458877,\n                "y": 2.36745572090148,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.08872871100902,\n                "y": -0.2271315306425,\n                "z": -0.06200789660215\n            }\n        ],\n        [\n            {\n                "x": 0.92484432458877,\n                "y": 1.77296614646911,\n                "z": -0.39305144548416\n            },\n            {\n                "x": -0.0955027937889,\n                "y": -0.18308295309543,\n                "z": 0.04058792814612\n            }\n        ],\n        [\n            {\n                "x": 0.92484432458877,\n                "y": 1.77296614646911,\n                "z": -0.04659238457679\n            },\n            {\n                "x": -0.13027699291706,\n                "y": -0.24974657595157,\n                "z": 0.00656317546963\n            }\n        ],\n        [\n            {\n                "x": 0.92484432458877,\n                "y": 1.77296614646911,\n                "z": 0.64632576704025\n            },\n            {\n                "x": -0.05129300057888,\n                "y": -0.0983308777213,\n                "z": -0.03584602102637\n            }\n        ]\n    ]\n}', 1385.73, 2695.67, 37.33, 0.78, -0.29, -145.06, 1741615249);

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_accounts
DROP TABLE IF EXISTS `whatsapp_accounts`;
CREATE TABLE IF NOT EXISTS `whatsapp_accounts` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_accounts : ~0 rows (environ)
DELETE FROM `whatsapp_accounts`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_chats
DROP TABLE IF EXISTS `whatsapp_chats`;
CREATE TABLE IF NOT EXISTS `whatsapp_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `messages` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_chats : ~0 rows (environ)
DELETE FROM `whatsapp_chats`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_chats_messages
DROP TABLE IF EXISTS `whatsapp_chats_messages`;
CREATE TABLE IF NOT EXISTS `whatsapp_chats_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chat` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL,
  `message` mediumtext NOT NULL,
  `readed` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_chats_messages : ~0 rows (environ)
DELETE FROM `whatsapp_chats_messages`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_groups
DROP TABLE IF EXISTS `whatsapp_groups`;
CREATE TABLE IF NOT EXISTS `whatsapp_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_groups : ~0 rows (environ)
DELETE FROM `whatsapp_groups`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_groups_messages
DROP TABLE IF EXISTS `whatsapp_groups_messages`;
CREATE TABLE IF NOT EXISTS `whatsapp_groups_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_group` varchar(50) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `read` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_groups_messages : ~0 rows (environ)
DELETE FROM `whatsapp_groups_messages`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_groups_users
DROP TABLE IF EXISTS `whatsapp_groups_users`;
CREATE TABLE IF NOT EXISTS `whatsapp_groups_users` (
  `number_group` varchar(50) NOT NULL,
  `admin` int(11) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_groups_users : ~0 rows (environ)
DELETE FROM `whatsapp_groups_users`;

-- Listage de la structure de table paris_horizon_base_dev. whatsapp_stories
DROP TABLE IF EXISTS `whatsapp_stories`;
CREATE TABLE IF NOT EXISTS `whatsapp_stories` (
  `phone` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `created` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.whatsapp_stories : ~0 rows (environ)
DELETE FROM `whatsapp_stories`;

-- Listage de la structure de table paris_horizon_base_dev. yellowpages_posts
DROP TABLE IF EXISTS `yellowpages_posts`;
CREATE TABLE IF NOT EXISTS `yellowpages_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.yellowpages_posts : ~0 rows (environ)
DELETE FROM `yellowpages_posts`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
