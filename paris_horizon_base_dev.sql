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
DROP DATABASE IF EXISTS `paris_horizon_base_dev`;
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

-- Listage des données de la table paris_horizon_base_dev.bank_accounts : ~0 rows (environ)
DELETE FROM `bank_accounts`;

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

-- Listage des données de la table paris_horizon_base_dev.bank_statements : ~0 rows (environ)
DELETE FROM `bank_statements`;

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

-- Listage des données de la table paris_horizon_base_dev.dealership_data : ~8 rows (environ)
DELETE FROM `dealership_data`;
INSERT INTO `dealership_data` (`name`, `label`, `balance`, `owner_id`, `owner_name`, `employee_commission`) VALUES
	('air', '', 0, NULL, NULL, 10),
	('boats', '', 0, NULL, NULL, 10),
	('cergy', 'Cergy', 0, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 20),
	('evry', 'Evry', 0, 'ZJH82164', 'Gino Blajou', 20),
	('luxury', '', 0, NULL, NULL, 10),
	('paris', '', 0, 'UYK15733', 'ttttttttttttt tttttttttttttttttt', 20),
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_dispveh : ~0 rows (environ)
DELETE FROM `dealership_dispveh`;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_employees : ~4 rows (environ)
DELETE FROM `dealership_employees`;
INSERT INTO `dealership_employees` (`id`, `identifier`, `dealership`, `role`, `joined`) VALUES
	(1, 'AGM09146', 'evry', 'manager', '2025-03-08 23:08:00'),
	(3, 'AYN44292', 'evry', 'manager', '2025-03-10 14:46:37'),
	(6, 'WEP56265', 'cergy', 'manager', '2025-03-15 01:34:05'),
	(7, 'ZJH82164', 'cergy', 'manager', '2025-03-15 01:40:10');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_orders : ~0 rows (environ)
DELETE FROM `dealership_orders`;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.dealership_sales : ~0 rows (environ)
DELETE FROM `dealership_sales`;

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

-- Listage des données de la table paris_horizon_base_dev.dealership_stock : ~222 rows (environ)
DELETE FROM `dealership_stock`;
INSERT INTO `dealership_stock` (`dealership`, `vehicle`, `stock`, `price`) VALUES
	('cergy', '09tahoe', 1, 75000),
	('cergy', '110i2019', 1, 78000),
	('cergy', '1310', 1, 20000),
	('cergy', '15tahoe', 1, 95000),
	('cergy', '16challenger', 1, 95000),
	('cergy', '16charger', 1, 100000),
	('cergy', '180sx', 1, 85000),
	('cergy', '2020ss', 1, 130000),
	('cergy', '488', 1, 450000),
	('cergy', '650s', 1, 450000),
	('cergy', '675lt', 1, 480000),
	('cergy', '718caymans', 1, 145000),
	('cergy', '720s', 1, 510000),
	('cergy', '760li04', 1, 120000),
	('cergy', '84rx7k', 1, 85000),
	('cergy', '99viper', 1, 180000),
	('cergy', 'aaq4', 1, 87000),
	('cergy', 'adv1502023', 1, 75000),
	('cergy', 'agerars', 1, 875000),
	('cergy', 'allnewnmax', 1, 97000),
	('cergy', 'amarok', 1, 95000),
	('cergy', 'amdbx', 1, 387000),
	('cergy', 'amggtrr20', 1, 310000),
	('cergy', 'ap2', 1, 95000),
	('cergy', 'ast', 1, 365000),
	('cergy', 'banshee87', 1, 98000),
	('cergy', 'batic', 1, 142000),
	('cergy', 'bbentayga', 1, 420000),
	('cergy', 'blazer3', 1, 150000),
	('cergy', 'bmci', 1, 175000),
	('cergy', 'bmws', 1, 150000),
	('cergy', 'bmx80rp', 1, 45000),
	('cergy', 'bmx82rmxii', 1, 48000),
	('cergy', 'bmx82rmxiii', 1, 50000),
	('cergy', 'bmx82rpii', 1, 42000),
	('cergy', 'bmx83600a', 1, 45000),
	('cergy', 'bmx84rp', 1, 49000),
	('cergy', 'bolide', 1, 1950000),
	('cergy', 'brt600', 1, 140000),
	('cergy', 'c6320', 1, 175000),
	('cergy', 'c7', 1, 165000),
	('cergy', 'cam8tun', 1, 75000),
	('cergy', 'camrs17', 1, 120000),
	('cergy', 'cats', 1, 95000),
	('cergy', 'cb500f23', 1, 85000),
	('cergy', 'cesc21', 1, 175000),
	('cergy', 'cgt', 1, 475000),
	('cergy', 'cgts', 1, 460000),
	('cergy', 'chr20', 1, 155000),
	('cergy', 'cit2cv', 1, 25000),
	('cergy', 'corvettec5z06', 1, 140000),
	('cergy', 'cp9a', 1, 95000),
	('cergy', 'cutlass', 1, 30000),
	('cergy', 'czr1', 1, 180000),
	('cergy', 'dawnonyx', 1, 450000),
	('cergy', 'demon', 1, 195000),
	('cergy', 'dl250', 1, 89000),
	('cergy', 'doublec', 1, 75000),
	('cergy', 'e34', 1, 110000),
	('cergy', 'e400', 1, 125000),
	('cergy', 'esprit02', 1, 110000),
	('cergy', 'f150', 1, 125000),
	('cergy', 'f430s', 1, 430000),
	('cergy', 'f812', 1, 490000),
	('cergy', 'fc3s', 1, 75000),
	('cergy', 'fct', 1, 420000),
	('cergy', 'fgt', 1, 350000),
	('cergy', 'fk8', 1, 85000),
	('cergy', 'fpacehm', 1, 145000),
	('cergy', 'fto', 1, 70000),
	('cergy', 'fxxk', 1, 870000),
	('cergy', 'G65', 1, 220000),
	('cergy', 'gl63', 1, 160000),
	('cergy', 'gobi600', 1, 135000),
	('cergy', 'golfgti7', 1, 65000),
	('cergy', 'gs350', 1, 90000),
	('cergy', 'gsxr19', 1, 40000),
	('cergy', 'gt17', 1, 450000),
	('cergy', 'gtr', 1, 215000),
	('cergy', 'gtr96', 1, 850000),
	('cergy', 'gtrc', 1, 230000),
	('cergy', 'HBL_DH2', 1, 60000),
	('cergy', 'hcbr17', 1, 79000),
	('cergy', 'hellspawn', 1, 110000),
	('cergy', 'honcrx91', 1, 65000),
	('cergy', 'huracanst', 1, 550000),
	('cergy', 'i8', 1, 210000),
	('cergy', 'is350mod', 1, 95000),
	('cergy', 'it18', 1, 750000),
	('cergy', 'jeep2012', 1, 85000),
	('cergy', 'jeepreneg', 1, 70000),
	('cergy', 'katana2', 1, 450000),
	('cergy', 'kev', 1, 120000),
	('cergy', 'kr150', 1, 116000),
	('cergy', 'kx250f', 1, 115000),
	('cergy', 'laferrari', 1, 850000),
	('cergy', 'lambose', 1, 720000),
	('cergy', 'levante', 1, 160000),
	('cergy', 'logan', 1, 25000),
	('cergy', 'lp670sv', 1, 580000),
	('cergy', 'lp700r', 1, 630000),
	('cergy', 'lpbagger2', 1, 95000),
	('cergy', 'ltr450', 1, 93000),
	('cergy', 'lykan', 1, 850000),
	('cergy', 'm2', 1, 115000),
	('cergy', 'm3e36', 1, 98000),
	('cergy', 'm3e92', 1, 130000),
	('cergy', 'm3f80', 1, 145000),
	('cergy', 'm4f82', 1, 150000),
	('cergy', 'm6f13', 1, 170000),
	('cergy', 'm6prior', 1, 250000),
	('cergy', 'maj350', 1, 95000),
	('cergy', 'maj935', 1, 350000),
	('cergy', 'majfd', 1, 110000),
	('cergy', 'mbc63', 1, 150000),
	('cergy', 'mcst', 1, 750000),
	('cergy', 'miata3', 1, 60000),
	('cergy', 'mig', 1, 780000),
	('cergy', 'mk2100', 1, 95000),
	('cergy', 'models', 1, 140000),
	('cergy', 'mp412c', 1, 430000),
	('cergy', 'mt09', 1, 97000),
	('cergy', 'na1', 1, 225000),
	('cergy', 'na6', 1, 65000),
	('cergy', 'nh2r', 1, 118000),
	('cergy', 'nis15', 1, 110000),
	('cergy', 'nissantitan17', 1, 125000),
	('cergy', 'ns350', 1, 90000),
	('cergy', 'nzp', 1, 105000),
	('cergy', 'ocnetrongt', 1, 170000),
	('cergy', 'ocni422spe', 1, 155000),
	('cergy', 'p90d', 1, 170000),
	('cergy', 'passat', 1, 95000),
	('cergy', 'pcj', 1, 82000),
	('cergy', 'pcs18', 1, 175000),
	('cergy', 'pcx160', 1, 80000),
	('cergy', 'pcx160_2025', 1, 84000),
	('cergy', 'pm19', 1, 160000),
	('cergy', 'q820', 1, 120000),
	('cergy', 'r1', 1, 91000),
	('cergy', 'r12007', 1, 95000),
	('cergy', 'r2525', 1, 93000),
	('cergy', 'r32025ld', 1, 92000),
	('cergy', 'r6', 1, 94000),
	('cergy', 'r820', 1, 395000),
	('cergy', 'r8ppi', 1, 385000),
	('cergy', 'raid', 1, 165000),
	('cergy', 'ram2500', 1, 130000),
	('cergy', 'raptor2017', 1, 165000),
	('cergy', 'rcf', 1, 120000),
	('cergy', 'rculi', 1, 510000),
	('cergy', 'regalia', 1, 180000),
	('cergy', 'regera', 1, 895000),
	('cergy', 'rrevoque', 1, 125000),
	('cergy', 'rrphantom', 1, 620000),
	('cergy', 'rrst', 1, 175000),
	('cergy', 'rs6', 1, 175000),
	('cergy', 'rs615', 1, 180000),
	('cergy', 'rs72020', 1, 195000),
	('cergy', 'rsvr16', 1, 190000),
	('cergy', 'rvsuzukiltr450', 1, 95000),
	('cergy', 's14', 1, 100000),
	('cergy', 's500w222', 1, 140000),
	('cergy', 'Safari97', 1, 75000),
	('cergy', 'sahara300', 1, 130000),
	('cergy', 'sanchez', 1, 108000),
	('cergy', 'sandero', 1, 28000),
	('cergy', 'senna', 1, 890000),
	('cergy', 'shinobi25', 1, 138000),
	('cergy', 'sl500', 1, 90000),
	('cergy', 'snsquash', 1, 82000),
	('cergy', 'speedstercr', 1, 145000),
	('cergy', 'sq72016', 1, 140000),
	('cergy', 'srt4', 1, 50000),
	('cergy', 'srt8', 1, 110000),
	('cergy', 'stepway', 1, 32000),
	('cergy', 'stingray', 1, 210000),
	('cergy', 'subisti08', 1, 85000),
	('cergy', 'subwrx', 1, 105000),
	('cergy', 'svj63', 1, 780000),
	('cergy', 'svx', 1, 75000),
	('cergy', 'tahoe21', 1, 120000),
	('cergy', 'taycan', 1, 185000),
	('cergy', 'teslapd', 1, 135000),
	('cergy', 'teslax', 1, 160000),
	('cergy', 'tltypes', 1, 98000),
	('cergy', 'tmax', 1, 99000),
	('cergy', 'tmodel', 1, 120000),
	('cergy', 'toysupmk4', 1, 185000),
	('cergy', 'tr22', 1, 240000),
	('cergy', 'trhawk', 1, 120000),
	('cergy', 'trx', 1, 140000),
	('cergy', 'ttrs', 1, 95000),
	('cergy', 'twingo', 1, 25000),
	('cergy', 'urus', 1, 425000),
	('cergy', 'v250', 1, 120000),
	('cergy', 'veneno', 1, 950000),
	('cergy', 'vtf1000', 1, 90000),
	('cergy', 'vwr', 1, 85000),
	('cergy', 'vxr', 1, 165000),
	('cergy', 'whiplash', 1, 85000),
	('cergy', 'wildtrak', 1, 115000),
	('cergy', 'wmfenyr', 1, 895000),
	('cergy', 'wraith', 1, 480000),
	('cergy', 'x5e53', 1, 90000),
	('cergy', 'x6m', 1, 185000),
	('cergy', 'xc90', 1, 130000),
	('cergy', 'yFe458i1', 1, 410000),
	('cergy', 'yFe458i2', 1, 440000),
	('cergy', 'yFe458s1', 1, 425000),
	('cergy', 'yFe458s2', 1, 455000),
	('cergy', 'yFeF12A', 1, 650000),
	('cergy', 'yFeF12T', 1, 670000),
	('cergy', 'yPG205t16A', 1, 60000),
	('cergy', 'yPG205t16B', 1, 75000),
	('cergy', 'yz450f', 1, 91000),
	('cergy', 'yz85', 1, 93000),
	('cergy', 'yzf', 1, 94000),
	('cergy', 'z32', 1, 85000),
	('cergy', 'z419', 1, 125000),
	('cergy', 'zoomerx', 1, 83000),
	('cergy', 'zx10r', 1, 112000);

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

-- Listage des données de la table paris_horizon_base_dev.dealership_vehicles : ~222 rows (environ)
DELETE FROM `dealership_vehicles`;
INSERT INTO `dealership_vehicles` (`spawn_code`, `brand`, `model`, `hashkey`, `category`, `price`, `created_at`) VALUES
	('09tahoe', 'Chevrolet', '2009 Tahoe', '2029533781', 'chevrolet', 75000, '2025-03-15 01:52:45'),
	('110i2019', 'Honda', ' Wave110i 2019', '-759052976', 'moto', 78000, '2025-03-15 01:52:45'),
	('1310', 'Dacia', '1310 2001', '1822975256', 'dacia', 20000, '2025-03-15 01:52:45'),
	('15tahoe', 'Chevrolet', '2015 Tahoe', '216954982', 'chevrolet', 95000, '2025-03-15 01:52:46'),
	('16challenger', 'Dodge', '2016 Challenger', '-216150906', 'dodge', 95000, '2025-03-15 01:52:45'),
	('16charger', 'Dodge', '2016 Charger', '-1513691047', 'dodge', 100000, '2025-03-15 01:52:46'),
	('180sx', 'Nissan', '180SX Type-X', '-1467569396', 'nissan', 85000, '2025-03-15 01:52:45'),
	('2020ss', 'Chevrolet', '2020 Camaro SS', '-1942383131', 'chevrolet', 130000, '2025-03-15 01:52:45'),
	('488', 'Ferrari', '488 Spider', '-127896429', 'ferrari', 450000, '2025-03-15 01:52:45'),
	('650s', 'Mclaren', '650S Coupe', '-2076784418', 'mclaren', 450000, '2025-03-15 01:52:45'),
	('675lt', 'Mclaren', '2016 675LT Coupe', '-1088481501', 'mclaren', 480000, '2025-03-15 01:52:45'),
	('718caymans', 'Porsche', '718 Cayman S', '-1393620193', 'porsche', 145000, '2025-03-15 01:52:45'),
	('720s', 'Mclaren', '2017 720S', '-1370111350', 'mclaren', 510000, '2025-03-15 01:52:45'),
	('760li04', 'BMW', '2004 760Li Individual (E66/PFL)', '1302012179', 'bmw', 120000, '2025-03-15 01:52:46'),
	('84rx7k', 'Mazda', '1984 RX-7 Stanced Version', '291607896', 'mazda', 85000, '2025-03-15 01:52:45'),
	('99viper', 'Dodge', '1999 Viper GTS ACR', '726460559', 'dodge', 180000, '2025-03-15 01:52:45'),
	('aaq4', 'Audi', '2017 A4 Quattro ABT', '-985643932', 'audi', 87000, '2025-03-15 01:52:45'),
	('adv1502023', 'Honda', ' 2023 ADV 150', '-254386275', 'moto', 75000, '2025-03-15 01:52:45'),
	('agerars', 'Koenigsegg', '2017 Agera RS', '-654239719', 'koenigsegg', 875000, '2025-03-15 01:52:45'),
	('allnewnmax', 'Yamaha', ' Nmax 155', '552769487', 'moto', 97000, '2025-03-15 01:52:45'),
	('amarok', 'Volkswagen', '2018 Amarok V6', '493030188', 'volkswagen', 95000, '2025-03-15 01:52:45'),
	('amdbx', 'Aston', 'Aston Martin DBX Carbon Edition', '-1799332707', 'aston', 387000, '2025-03-15 01:52:46'),
	('amggtrr20', 'Mercedes', '2020 AMG GT-R Roadster', '-1394302834', 'mercedes', 310000, '2025-03-15 01:52:45'),
	('ap2', 'Honda', 'S2000 AP2', '-1549019518', 'honda', 95000, '2025-03-15 01:52:45'),
	('ast', 'Aston', '2013 Aston Martin Vanquish', '-1865955898', 'aston', 365000, '2025-03-15 01:52:45'),
	('banshee87', 'Yamaha', ' 1987 Banshee', '1803318603', 'moto', 98000, '2025-03-15 01:52:45'),
	('batic', 'Bati', ' 801 Custom', '1266507359', 'moto', 142000, '2025-03-15 01:52:45'),
	('bbentayga', 'Bentley', 'Bentayga', '1402024844', 'bentley', 420000, '2025-03-15 01:52:45'),
	('blazer3', 'Monster', ' Banshee Graphics', '-1269889662', 'moto', 150000, '2025-03-15 01:52:45'),
	('bmci', 'BMW', '2018 M5 F90', '1093697054', 'bmw', 175000, '2025-03-15 01:52:45'),
	('bmws', 'BMW', ' S1000 RR 2014', '2047166283', 'moto', 150000, '2025-03-15 01:52:45'),
	('bmx80rp', 'BMX', ' 1980 Proline', '47916497', 'moto', 45000, '2025-03-15 01:52:46'),
	('bmx82rmxii', 'BMX', ' 1982 MXII', '-1814687679', 'moto', 48000, '2025-03-15 01:52:46'),
	('bmx82rmxiii', 'BMX', ' 1982 MXIII', '-51475337', 'moto', 50000, '2025-03-15 01:52:46'),
	('bmx82rpii', 'BMX', ' 1982 Proline II', '-2110024055', 'moto', 42000, '2025-03-15 01:52:45'),
	('bmx83600a', 'BMX', ' 1983 600a', '-757822350', 'moto', 45000, '2025-03-15 01:52:46'),
	('bmx84rp', 'BMX', ' 1984 Prostyler', '2100429181', 'moto', 49000, '2025-03-15 01:52:46'),
	('bolide', 'Bugatti', '2020 Bolide', '1975081724', 'bugatti', 1950000, '2025-03-15 01:52:45'),
	('brt600', 'Nagasaki', ' BRT-600', '-185436960', 'moto', 140000, '2025-03-15 01:52:45'),
	('c6320', 'Mercedes', '2020 C63s', '-1079976045', 'mercedes', 175000, '2025-03-15 01:52:45'),
	('c7', 'Chevrolet', '2014 Corvette C7 Stingray', '874739883', 'chevrolet', 165000, '2025-03-15 01:52:46'),
	('cam8tun', 'Toyota', '2018 Camry XSE', '-1890188908', 'toyota', 75000, '2025-03-15 01:52:45'),
	('camrs17', 'Chevrolet', '2017 Camaro RS', '-1318923904', 'chevrolet', 120000, '2025-03-15 01:52:46'),
	('cats', 'Cadillac', '2016 ATS-V Coupe', '1725614162', 'cadillac', 95000, '2025-03-15 01:52:45'),
	('cb500f23', 'Honda', ' 2023 CB500F', '2085856412', 'moto', 85000, '2025-03-15 01:52:45'),
	('cesc21', 'Cadillac', '2021 Escalade', '1701712977', 'cadillac', 175000, '2025-03-15 01:52:45'),
	('cgt', 'Porsche', '2003 Carrera GT (980)', '-1716760427', 'porsche', 475000, '2025-03-15 01:52:45'),
	('cgts', 'Bentley', '2020 Continental GT Convertible', '-193081966', 'bentley', 460000, '2025-03-15 01:52:45'),
	('chr20', 'Dodge', '2021 Charger Hellcat Widebody', '691582755', 'dodge', 155000, '2025-03-15 01:52:46'),
	('cit2cv', 'Citroen', '2 chevaux', '1113184459', 'citroen', 25000, '2025-03-15 01:52:45'),
	('corvettec5z06', 'Chevrolet', 'Corvette C5 Z06', '-1295717775', 'chevrolet', 140000, '2025-03-15 01:52:45'),
	('cp9a', 'Mitsubishi', 'Lancer Evo VI T.M.E (CP9A)', '383323718', 'mitsubishi', 95000, '2025-03-15 01:52:45'),
	('cutlass', 'Dacia', 'logan pickup ', '-1426878004', 'dacia', 30000, '2025-03-15 01:52:45'),
	('czr1', 'Chevrolet', '2009 Corvette ZR1', '796303759', 'chevrolet', 180000, '2025-03-15 01:52:45'),
	('dawnonyx', 'Rollsroyce', '2016 Dawn Onyx', '2076472358', 'rollsroyce', 450000, '2025-03-15 01:52:45'),
	('demon', 'Dodge', '2018 Challenger SRT Demon', '885421525', 'dodge', 195000, '2025-03-15 01:52:45'),
	('dl250', 'Suzuki', ' 2017 DL250 V-Strom', '509251873', 'moto', 89000, '2025-03-15 01:52:46'),
	('doublec', 'Dinka', ' Double T Classic', '-1206389755', 'moto', 75000, '2025-03-15 01:52:45'),
	('e34', 'BMW', '1995 BMW M5 E34', '-1831563210', 'bmw', 110000, '2025-03-15 01:52:45'),
	('e400', 'Mercedes', '2019 E400 Coupe 4matic (C238)', '1075154240', 'mercedes', 125000, '2025-03-15 01:52:45'),
	('esprit02', 'Lotus', '2002 Esprit V8', '-11497678', 'lotus', 110000, '2025-03-15 01:52:45'),
	('f150', 'Ford', '2012 F150 SVT Raptor R', '-1304790695', 'ford', 125000, '2025-03-15 01:52:46'),
	('f430s', 'Ferrari', 'F430 Scuderia', '-1567297735', 'ferrari', 430000, '2025-03-15 01:52:45'),
	('f812', 'Ferrari', '812 Superfast', '1127414868', 'ferrari', 490000, '2025-03-15 01:52:46'),
	('fc3s', 'Mazda', 'RX7 FC3S', '3467202', 'mazda', 75000, '2025-03-15 01:52:46'),
	('fct', 'Ferrari', 'California T', '-784906648', 'ferrari', 420000, '2025-03-15 01:52:45'),
	('fgt', 'Ford', '2005 GT', '1315816827', 'ford', 350000, '2025-03-15 01:52:46'),
	('fk8', 'Honda', '2018 Civic Type-R (FK8)', '-1745789659', 'honda', 85000, '2025-03-15 01:52:45'),
	('fpacehm', 'Jaguar', 'F-pace 2017 Hamann Edition', '-1919297986', 'jaguar', 145000, '2025-03-15 01:52:45'),
	('fto', 'Nitsubishi', 'FTO GP Version-R', '-1837978521', 'mitsubishi', 70000, '2025-03-15 01:52:45'),
	('fxxk', 'Ferrari', 'FXX-K Hybrid Hypercar', '1200120654', 'ferrari', 870000, '2025-03-15 01:52:45'),
	('G65', 'Mercedes', '2013 G65 AMG', '178350184', 'mercedes', 220000, '2025-03-15 01:52:46'),
	('gl63', 'Mercedes', 'GL63 AMG', '1382221388', 'mercedes', 160000, '2025-03-15 01:52:46'),
	('gobi600', 'Nagasaki', ' Gobi 600', '961316878', 'moto', 135000, '2025-03-15 01:52:46'),
	('golfgti7', 'Volkswagen', '2015 Golf GTI MK7', '-2018557295', 'volkswagen', 65000, '2025-03-15 01:52:45'),
	('gs350', 'Lexus', 'GS 350', '-940807017', 'lexus', 90000, '2025-03-15 01:52:45'),
	('gsxr19', 'Suzuki', '2019 GSX-R1000R', '-1269329530', 'suzuki', 40000, '2025-03-15 01:52:45'),
	('gt17', 'Ford', '2017 GT', '-2011325074', 'ford', 450000, '2025-03-15 01:52:45'),
	('gtr', 'Nissan', '2017 GTR', '-1752116803', 'nissan', 215000, '2025-03-15 01:52:46'),
	('gtr96', 'Mclaren', '1996 F1 GTR', '-234577516', 'mclaren', 850000, '2025-03-15 01:52:45'),
	('gtrc', 'Nissan', '2017 R35 GTR Convertible', '-1384177335', 'nissan', 230000, '2025-03-15 01:52:45'),
	('HBL_DH2', 'Downhill', ' Bike', '-149201085', 'moto', 60000, '2025-03-15 01:52:45'),
	('hcbr17', 'Honda', ' 2017 CBR1000RR/SP', '-1265899455', 'moto', 79000, '2025-03-15 01:52:45'),
	('hellspawn', 'LCC', ' Hellspawn', '2086709231', 'moto', 110000, '2025-03-15 01:52:45'),
	('honcrx91', 'Honda', 'CRX SiR 1991', '487628275', 'honda', 65000, '2025-03-15 01:52:45'),
	('huracanst', 'Lamborghini', 'Huracan Super Trofeo', '2041307381', 'lamborghini', 550000, '2025-03-15 01:52:46'),
	('i8', 'BMW', '2015 i8 (I12)', '1718441594', 'bmw', 210000, '2025-03-15 01:52:45'),
	('is350mod', 'Lexus', '2014 IS 350', '761919778', 'lexus', 95000, '2025-03-15 01:52:46'),
	('it18', 'ItalDesign', '2017 Zerouno', '1835697308', 'italdesign', 750000, '2025-03-15 01:52:45'),
	('jeep2012', 'Jeep', '2012 Wrangler', '-1691715558', 'jeep', 85000, '2025-03-15 01:52:45'),
	('jeepreneg', 'Jeep', 'Renegade', '-1246383966', 'jeep', 70000, '2025-03-15 01:52:45'),
	('katana2', 'Suzuki', '2019 Katana', '303432435', 'suzuki', 450000, '2025-03-15 01:52:45'),
	('kev', 'Cadillac', 'CTSV 2012', '525782703', 'cadillac', 120000, '2025-03-15 01:52:45'),
	('kr150', 'Kawasaki', ' KR 150', '143338082', 'moto', 116000, '2025-03-15 01:52:45'),
	('kx250f', 'Kawasaki', ' 2016 KX250F', '-1381440113', 'moto', 115000, '2025-03-15 01:52:45'),
	('laferrari', 'Ferrari', 'LaFerrari', '-548280172', 'ferrari', 850000, '2025-03-15 01:52:45'),
	('lambose', 'Lamborghini', 'Sesto Elemento', '-626024238', 'lamborghini', 720000, '2025-03-15 01:52:45'),
	('levante', 'Maserati', 'Levante', '468704959', 'maserati', 160000, '2025-03-15 01:52:45'),
	('logan', 'Dacia', '2008 Logan', '-701405977', 'dacia', 25000, '2025-03-15 01:52:45'),
	('lp670sv', 'Lamborghini', '2009 Murcielago LP 670-4 SV', '344199304', 'lamborghini', 580000, '2025-03-15 01:52:45'),
	('lp700r', 'Lamborghini', '2013 Aventador LP700-4 Roadster', '949614817', 'lamborghini', 630000, '2025-03-15 01:52:45'),
	('lpbagger2', 'LCC', ' Santacruz', '-1073050960', 'moto', 95000, '2025-03-15 01:52:45'),
	('ltr450', 'Suzuki', ' 2009 LTR 450', '-612649443', 'moto', 93000, '2025-03-15 01:52:45'),
	('lykan', 'WMotors', 'Lykan HyperSport', '2005386580', 'wmotors', 850000, '2025-03-15 01:52:45'),
	('m2', 'BMW', '2016 M2', '-1313740730', 'bmw', 115000, '2025-03-15 01:52:45'),
	('m3e36', 'BMW', '1997 M3 E36', '-1127249378', 'bmw', 98000, '2025-03-15 01:52:45'),
	('m3e92', 'BMW', '2008 M3 e92', '708207258', 'bmw', 130000, '2025-03-15 01:52:45'),
	('m3f80', 'BMW', '2015 M3 (F80)', '-580610645', 'bmw', 145000, '2025-03-15 01:52:45'),
	('m4f82', 'BMW', '2015 M4 F82', '909765281', 'bmw', 150000, '2025-03-15 01:52:45'),
	('m6f13', 'BMW', 'M6 F13 Shadow Line', '1897898727', 'bmw', 170000, '2025-03-15 01:52:45'),
	('m6prior', 'BMW', 'M6 PRIOR', '-407186207', 'bmw', 250000, '2025-03-15 01:52:45'),
	('maj350', 'Nissan', 'Fairlady Z Z33', '1810239784', 'nissan', 95000, '2025-03-15 01:52:46'),
	('maj935', 'Porsche', '1978 935 Moby Dick', '1430426251', 'porsche', 350000, '2025-03-15 01:52:45'),
	('majfd', 'Mazda', 'RX-7 FD', '-147717767', 'mazda', 110000, '2025-03-15 01:52:45'),
	('mbc63', 'Mercedes', '2012 C63 AMG Coupe Black Series', '-1406469014', 'mercedes', 150000, '2025-03-15 01:52:45'),
	('mcst', 'Mclaren', '2020 Speedtail', '-1837375955', 'mclaren', 750000, '2025-03-15 01:52:45'),
	('miata3', 'Mazda', '1989 Miata NA', '-1135287548', 'mazda', 60000, '2025-03-15 01:52:45'),
	('mig', 'Ferrari', 'Enzo', '669333619', 'ferrari', 780000, '2025-03-15 01:52:45'),
	('mk2100', 'Toyota', 'Mark II JZX100', '-1503289273', 'toyota', 95000, '2025-03-15 01:52:45'),
	('models', 'Tesla', '2016 Model S P90D', '-252836656', 'tesla', 140000, '2025-03-15 01:52:45'),
	('mp412c', 'Mclaren', 'MP4-12C', '-640306883', 'mclaren', 430000, '2025-03-15 01:52:45'),
	('mt09', 'Yamaha', ' MT-09 2017', '-1536909876', 'moto', 97000, '2025-03-15 01:52:46'),
	('na1', 'Honda', '1992 NSX-R (NA1)', '871327565', 'honda', 225000, '2025-03-15 01:52:45'),
	('na6', 'Mazda', 'MX-5 Miata (NA6C)', '-1539291163', 'mazda', 65000, '2025-03-15 01:52:45'),
	('nh2r', 'Kawasaki', ' Ninja H2 & H2R', '-1667727259', 'moto', 118000, '2025-03-15 01:52:45'),
	('nis15', 'Nissan', 'Silvia S15 Spec-R', '1132804740', 'nissan', 110000, '2025-03-15 01:52:45'),
	('nissantitan17', 'Nissan', '2017 Titan Warrior', '1221510024', 'nissan', 125000, '2025-03-15 01:52:46'),
	('ns350', 'Nissan', '350z Stardast', '-1195532806', 'nissan', 90000, '2025-03-15 01:52:45'),
	('nzp', 'Nissan', '370z Pandem', '995682231', 'nissan', 105000, '2025-03-15 01:52:46'),
	('ocnetrongt', 'Audi', 'E-TRON GT', '1125354406', 'audi', 170000, '2025-03-15 01:52:45'),
	('ocni422spe', 'BMW', 'i4', '958633118', 'bmw', 155000, '2025-03-15 01:52:46'),
	('p90d', 'Tesla', 'Model X Performance', '-1672062838', 'tesla', 170000, '2025-03-15 01:52:45'),
	('passat', 'Volkswagen', '2016 Passat B8', '-1773424714', 'volkswagen', 95000, '2025-03-15 01:52:46'),
	('pcj', 'Honda', ' 2007 Hornet Carburada', '-909201658', 'moto', 82000, '2025-03-15 01:52:46'),
	('pcs18', 'Porsche', '2018 Cayenne S', '-932637740', 'porsche', 175000, '2025-03-15 01:52:45'),
	('pcx160', 'Honda', ' New PCX160', '175227503', 'moto', 80000, '2025-03-15 01:52:45'),
	('pcx160_2025', 'Honda', ' PCX160 2025', '2076118992', 'moto', 84000, '2025-03-15 01:52:45'),
	('pm19', 'Porsche', '2019 Macan Turbo', '-1560751994', 'porsche', 160000, '2025-03-15 01:52:45'),
	('q820', 'Audi', '2020 Q8 50TDI', '-2006731729', 'audi', 120000, '2025-03-15 01:52:45'),
	('r1', 'Yamaha', ' R1 2014', '1474015055', 'moto', 91000, '2025-03-15 01:52:46'),
	('r12007', 'Yamaha', ' R1 2007', '477462508', 'moto', 95000, '2025-03-15 01:52:45'),
	('r2525', 'Yamaha', ' R25 2025', '-1940014869', 'moto', 93000, '2025-03-15 01:52:45'),
	('r32025ld', 'Yamaha', ' R3 2025', '-1709104763', 'moto', 92000, '2025-03-15 01:52:45'),
	('r6', 'Yamaha', ' YZF R6 2017', '-188978926', 'moto', 94000, '2025-03-15 01:52:46'),
	('r820', 'Audi', '2020 R8', '-143695728', 'audi', 395000, '2025-03-15 01:52:45'),
	('r8ppi', 'Audi', '2013 R8 V10', '-1385753106', 'audi', 385000, '2025-03-15 01:52:46'),
	('raid', 'Dodge', 'Challenger Raid', '-1299229688', 'dodge', 165000, '2025-03-15 01:52:45'),
	('ram2500', 'Dodge', '2015 RAM 2500', '-301519603', 'dodge', 130000, '2025-03-15 01:52:46'),
	('raptor2017', 'Ford', '2017 Raptor', '624514487', 'ford', 165000, '2025-03-15 01:52:45'),
	('rcf', 'Lexus', '2015 RCF', '-213537235', 'lexus', 120000, '2025-03-15 01:52:45'),
	('rculi', 'Rollsroyce', 'Rolls Royce Cullinan', '1640627795', 'rollsroyce', 510000, '2025-03-15 01:52:45'),
	('regalia', 'Quartz', 'Regalia 723', '-864376482', 'quartz', 180000, '2025-03-15 01:52:45'),
	('regera', 'Koenigsegg', 'Regera', '1085789913', 'koenigsegg', 895000, '2025-03-15 01:52:46'),
	('rrevoque', 'Rangerover', 'Range Rover Evoque', '-1848675521', 'rangerover', 125000, '2025-03-15 01:52:45'),
	('rrphantom', 'Rollsroyce', '2018 Phantom VIII', '-1724630220', 'rollsroyce', 620000, '2025-03-15 01:52:46'),
	('rrst', 'Rangerover', 'Range Rover Vogue Startech', '1993609528', 'rangerover', 175000, '2025-03-15 01:52:45'),
	('rs6', 'Audi', '2016 RS6 C7', '2113441065', 'audi', 175000, '2025-03-15 01:52:45'),
	('rs615', 'Audi', 'RS6', '939131970', 'audi', 180000, '2025-03-15 01:52:46'),
	('rs72020', 'Audi', '2020 RS7', '-1606986894', 'audi', 195000, '2025-03-15 01:52:45'),
	('rsvr16', 'Rangerover', '2016 Range Rover Sport SVR', '-1031680535', 'rangerover', 190000, '2025-03-15 01:52:45'),
	('rvsuzukiltr450', 'Suzuki', ' LTR450 Quad', '1245988292', 'moto', 95000, '2025-03-15 01:52:45'),
	('s14', 'Nissan', '1998 Silvia K', '-1033545199', 'nissan', 100000, '2025-03-15 01:52:45'),
	('s500w222', 'Mercedes', '2014 S500 W222', '859560111', 'mercedes', 140000, '2025-03-15 01:52:45'),
	('Safari97', 'Nissan', '1997 Patrol Super Safari Y60', '1585663266', 'nissan', 75000, '2025-03-15 01:52:45'),
	('sahara300', 'Sahara', ' 300', '695108097', 'moto', 130000, '2025-03-15 01:52:46'),
	('sanchez', 'Kawasaki', ' KX - Monster Energy Limited Edition 2008', '788045382', 'moto', 108000, '2025-03-15 01:52:46'),
	('sandero', 'Dacia', 'Sandero 2014', '-516616829', 'dacia', 28000, '2025-03-15 01:52:46'),
	('senna', 'Mclaren', '2019 Senna', '-433961724', 'mclaren', 890000, '2025-03-15 01:52:46'),
	('shinobi25', 'Nagasaki', ' Shinobi 2025 Plus', '-1456670784', 'moto', 138000, '2025-03-15 01:52:45'),
	('sl500', 'Mercedes', '1995 SL500', '200570146', 'mercedes', 90000, '2025-03-15 01:52:46'),
	('snsquash', 'Honda', ' Squash', '-1100713200', 'moto', 82000, '2025-03-15 01:52:45'),
	('speedstercr', 'Speedster', ' Western Motorcycles', '-1570341098', 'moto', 145000, '2025-03-15 01:52:45'),
	('sq72016', 'Audi', '2016 SQ7', '119794591', 'audi', 140000, '2025-03-15 01:52:46'),
	('srt4', 'Dodge', 'Neon SRT-4', '-1631107402', 'dodge', 50000, '2025-03-15 01:52:45'),
	('srt8', 'Jeep', '2015 SRT-8', '-1003581048', 'jeep', 110000, '2025-03-15 01:52:45'),
	('stepway', 'Dacia', 'Sandero Stepway 2014', '-303004972', 'dacia', 32000, '2025-03-15 01:52:46'),
	('stingray', 'Chevrolet', '2020 Corvette C8 Stingray', '-1136096889', 'chevrolet', 210000, '2025-03-15 01:52:45'),
	('subisti08', 'Subaru', '2008 WRX STi', '-66416094', 'subaru', 85000, '2025-03-15 01:52:46'),
	('subwrx', 'Subaru', '2004 Impreza WRX STI', '-1298373790', 'subaru', 105000, '2025-03-15 01:52:46'),
	('svj63', 'Lamborghini', 'Aventador SVJ', '-675592250', 'lamborghini', 780000, '2025-03-15 01:52:45'),
	('svx', 'Subaru', '1996 Alcyone SVX', '-1451213984', 'subaru', 75000, '2025-03-15 01:52:45'),
	('tahoe21', 'Chevrolet', '2021 Tahoe RST', '-2132526642', 'chevrolet', 120000, '2025-03-15 01:52:45'),
	('taycan', 'Porsche', '2020 Taycan Turbo S', '1295777722', 'porsche', 185000, '2025-03-15 01:52:46'),
	('teslapd', 'Tesla', '2017 Model S', '-435728526', 'tesla', 135000, '2025-03-15 01:52:45'),
	('teslax', 'Tesla', '2016 Model X P90D', '-429774847', 'tesla', 160000, '2025-03-15 01:52:45'),
	('tltypes', 'Aston', 'Acura TL Type-S', '1118479944', 'aston', 98000, '2025-03-15 01:52:46'),
	('tmax', 'Yamaha', ' TMAX 500', '-85371949', 'moto', 99000, '2025-03-15 01:52:45'),
	('tmodel', 'Tesla', '2018 Model 3', '4239369', 'tesla', 120000, '2025-03-15 01:52:45'),
	('toysupmk4', 'Toyota', '1998 Supra Turbo (A80)', '-1062758007', 'toyota', 185000, '2025-03-15 01:52:45'),
	('tr22', 'Tesla', '2020 Roadster', '1197361861', 'tesla', 240000, '2025-03-15 01:52:45'),
	('trhawk', 'Jeep', '2018 Grand Cherokee', '231217483', 'jeep', 120000, '2025-03-15 01:52:45'),
	('trx', 'Dodge', '2017 RAM 1500 Rebel TRX', '909518807', 'dodge', 140000, '2025-03-15 01:52:45'),
	('ttrs', 'Audi', '2010 TT RS', '-586459613', 'audi', 95000, '2025-03-15 01:52:46'),
	('twingo', 'Renault', 'Twingo I', '1938131410', 'renault', 25000, '2025-03-15 01:52:45'),
	('urus', 'Lamborghini', 'Urus', '-520214134', 'lamborghini', 425000, '2025-03-15 01:52:45'),
	('v250', 'Mercedes', 'V-class 250 Bluetec LWB', '-1412248195', 'mercedes', 120000, '2025-03-15 01:52:45'),
	('veneno', 'Lamborghini', 'Veneno', '-42051018', 'lamborghini', 950000, '2025-03-15 01:52:45'),
	('vtf1000', 'Suzuki', ' VTF 1000', '-190451552', 'moto', 90000, '2025-03-15 01:52:45'),
	('vwr', 'Volkswagen', 'Scirocco R 2011', '1864073763', 'volkswagen', 85000, '2025-03-15 01:52:46'),
	('vxr', 'Toyota', '2016 Land Cruiser VXR', '-1124510526', 'toyota', 165000, '2025-03-15 01:52:45'),
	('whiplash', 'Dinka', ' Whiplash', '-2032448433', 'moto', 85000, '2025-03-15 01:52:45'),
	('wildtrak', 'Ford', '2021 Bronco Wildtrak', '-1180922538', 'ford', 115000, '2025-03-15 01:52:45'),
	('wmfenyr', 'WMotors', 'Fenyr Supersport', '-1792334644', 'wmotors', 895000, '2025-03-15 01:52:46'),
	('wraith', 'Rollsroyce', 'Wraith', '-1095688294', 'rollsroyce', 480000, '2025-03-15 01:52:45'),
	('x5e53', 'BMW', 'X5 E53 2005 Sport Package', '1716918782', 'bmw', 90000, '2025-03-15 01:52:45'),
	('x6m', 'BMW', 'X6M F16', '-506359117', 'bmw', 185000, '2025-03-15 01:52:45'),
	('xc90', 'Wolvo', 'XC90 T8', '284310455', 'volvo', 130000, '2025-03-15 01:52:46'),
	('yFe458i1', 'Ferrari', '458 Italia', '-1307201065', 'ferrari', 410000, '2025-03-15 01:52:45'),
	('yFe458i2', 'Ferrari', '458 Speciale', '-1487430565', 'ferrari', 440000, '2025-03-15 01:52:45'),
	('yFe458s1', 'Ferrari', '458 Spider', '270595188', 'ferrari', 425000, '2025-03-15 01:52:45'),
	('yFe458s2', 'Ferrari', '458 Speciale Aperta', '-27569943', 'ferrari', 455000, '2025-03-15 01:52:45'),
	('yFeF12A', 'Ferrari', 'F60 America', '-1149788194', 'ferrari', 650000, '2025-03-15 01:52:45'),
	('yFeF12T', 'Ferrari', 'F12 TRS Roadster', '-767865503', 'ferrari', 670000, '2025-03-15 01:52:46'),
	('yPG205t16A', 'Peugeot', '205 Rally', '257490023', 'peugeot', 60000, '2025-03-15 01:52:45'),
	('yPG205t16B', 'Peugeot', '205 Turbo 16', '-16098358', 'peugeot', 75000, '2025-03-15 01:52:45'),
	('yz450f', 'Yamaha', ' 2015 YZ450F - Flúor Graphics', '1560126475', 'moto', 91000, '2025-03-15 01:52:45'),
	('yz85', 'Yamaha', ' 85cc', '-159635646', 'moto', 93000, '2025-03-15 01:52:45'),
	('yzf', 'Yamaha', ' YZ250F - RedBull Graphics', '169724928', 'moto', 94000, '2025-03-15 01:52:45'),
	('z32', 'Nissan', '300ZX Z32', '624293437', 'nissan', 85000, '2025-03-15 01:52:45'),
	('z419', 'BMW', '2019 Z4 M40i', '392244532', 'bmw', 125000, '2025-03-15 01:52:45'),
	('zoomerx', 'Honda', ' ZoomerX-Custom', '504706096', 'moto', 83000, '2025-03-15 01:52:45'),
	('zx10r', 'Kawasaki', ' Ninja Zx6r', '-714386060', 'moto', 112000, '2025-03-15 01:52:45');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_farms
DROP TABLE IF EXISTS `farming_creator_farms`;
CREATE TABLE IF NOT EXISTS `farming_creator_farms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_farms : ~2 rows (environ)
DELETE FROM `farming_creator_farms`;
INSERT INTO `farming_creator_farms` (`id`, `label`, `data`) VALUES
	(1, 'ASPIRINE', '{"markerData":{"color":{"green":255,"blue":0,"opacity":200,"red":0},"rotation":{"x":0,"y":0,"z":0},"followCamera":false,"bounce":false,"type":27,"rotate":true,"scale":{"x":0.7,"y":0.7,"z":0.7}},"requiredItems":[],"rewardItems":[{"maxQuantity":1,"minQuantity":1,"type":"item","chances":50,"name":"aspirine"}],"activeTimeStart":"00:00","maxObjectsAmount":3,"minimumPolice":0,"objectData":{"isEnabled":false,"model":"bkr_prop_coke_table01a","rotation":{"x":0,"y":0,"z":0}},"animations":[{"type":"scenario","duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN"}],"minObjectsAmount":1,"activeTimeEnd":"23:59","allowedVehicles":[],"blipData":{"color":2,"display":2,"label":"Farm","sprite":1,"isEnabled":false,"scale":0.8},"radius":10,"coords":{"x":3244.89,"y":-126.1,"z":12.88},"requiresToBeInVehicle":false,"requiresSpecificVehicle":false}'),
	(2, 'LSD', '{"markerData":{"color":{"green":255,"blue":0,"opacity":200,"red":0},"rotation":{"x":0,"y":0,"z":0},"followCamera":false,"bounce":false,"type":27,"rotate":true,"scale":{"x":0.7,"y":0.7,"z":0.7}},"requiredItems":[{"loseOnUse":true,"type":"item","minQuantity":1,"name":"aspirine"}],"rewardItems":[{"maxQuantity":1,"minQuantity":1,"type":"item","chances":100,"name":"lsd"}],"activeTimeStart":"00:00","maxObjectsAmount":1,"minimumPolice":0,"objectData":{"isEnabled":true,"model":"v_ret_ml_tableb","rotation":{"x":0,"y":0,"z":0}},"animations":[{"type":"scenario","duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN"}],"minObjectsAmount":1,"activeTimeEnd":"23:59","allowedVehicles":[],"blipData":{"color":2,"display":2,"label":"Farm","sprite":1,"isEnabled":false,"scale":0.8},"radius":5,"coords":{"x":467.06,"y":-3111.49,"z":5.07},"requiresToBeInVehicle":false,"requiresSpecificVehicle":false}');

-- Listage de la structure de table paris_horizon_base_dev. farming_creator_fields
DROP TABLE IF EXISTS `farming_creator_fields`;
CREATE TABLE IF NOT EXISTS `farming_creator_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.farming_creator_fields : ~6 rows (environ)
DELETE FROM `farming_creator_fields`;
INSERT INTO `farming_creator_fields` (`id`, `label`, `data`) VALUES
	(1, 'Pommier', '{"animations":[{"duration":8,"specialAnimation":"axe","type":"special"}],"blipData":{"sprite":651,"isEnabled":true,"color":2,"label":"Recolte Pomme","scale":0.8,"display":2},"maxObjectsAmount":1,"coords":{"x":-818.11,"y":858.83,"z":201.98},"respawnTimer":15,"maxObjects":10,"minimumPolice":0,"objectModel":"prop_tree_birch_04","spawnType":"automatic","radius":30,"rewardItems":[{"name":"apple","type":"item","minQuantity":1,"maxQuantity":5,"chances":10}],"minObjectsAmount":1,"requiredItems":[{"loseOnUse":false,"name":"axe","minQuantity":1,"type":"item"}]}'),
	(2, 'Framboisier', '{"objectModel":"prop_plant_cane_01a","spawnType":"automatic","coords":{"y":-1346,"x":1300.33,"z":44.84},"maxObjectsAmount":1,"rewardItems":[{"chances":10,"type":"item","minQuantity":1,"maxQuantity":2,"name":"raspberry"}],"requiredItems":[],"blipData":{"label":"Field","isEnabled":true,"display":2,"sprite":651,"scale":0.8,"color":2},"respawnTimer":15,"maxObjects":30,"animations":[{"scenarioName":"PROP_HUMAN_BUM_BIN","type":"scenario","duration":5}],"radius":30,"minObjectsAmount":1,"minimumPolice":0}'),
	(3, 'Carriére', '{"coords":{"x":2955,"z":40.1,"y":2783.94},"respawnTimer":30,"animations":[{"type":"special","duration":5,"specialAnimation":"pickaxe"}],"radius":100,"minObjectsAmount":1,"spawnType":"automatic","requiredItems":[{"loseOnUse":false,"minQuantity":1,"name":"pickaxe","type":"item"}],"rewardItems":[{"chances":90,"name":"stone","maxQuantity":3,"type":"item","minQuantity":1},{"chances":40,"name":"uncut_emerald","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_ruby","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_diamond","maxQuantity":1,"type":"item","minQuantity":1},{"chances":30,"name":"uncut_sapphire","maxQuantity":1,"type":"item","minQuantity":1},{"chances":10,"name":"carbon","maxQuantity":1,"type":"item","minQuantity":1},{"chances":80,"name":"ironore","maxQuantity":3,"type":"item","minQuantity":1},{"chances":70,"name":"copperore","maxQuantity":2,"type":"item","minQuantity":1},{"chances":50,"name":"goldore","maxQuantity":2,"type":"item","minQuantity":1},{"chances":60,"name":"silverore","maxQuantity":2,"type":"item","minQuantity":1}],"blipData":{"display":2,"scale":0.8,"color":0,"label":"Carrière","isEnabled":true,"sprite":677},"maxObjectsAmount":3,"maxObjects":50,"minimumPolice":0,"objectModel":"prop_rock_5_smash3"}'),
	(4, 'Bucheron', '{"respawnTimer":30,"animations":[{"duration":7,"specialAnimation":"axe","type":"special"}],"requiredItems":[{"minQuantity":1,"name":"pickaxe","loseOnUse":false,"type":"item"}],"maxObjects":25,"objectModel":"prop_tree_birch_04","spawnType":"automatic","coords":{"z":67.24,"x":-701.55,"y":5343.52},"blipData":{"display":2,"sprite":651,"label":"Field","scale":0.8,"color":2,"isEnabled":true},"radius":60,"rewardItems":[{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"rondin","type":"item"},{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"branche","type":"item"},{"minQuantity":1,"chances":20,"maxQuantity":3,"name":"ecorce","type":"item"}],"minimumPolice":0,"maxObjectsAmount":1,"minObjectsAmount":1}'),
	(5, 'Tabac', '{"maxObjects":30,"allowedJobs":{"tabac":true},"spawnType":"automatic","minimumPolice":0,"coords":{"x":1350.7,"y":1246.85,"z":104.91},"minObjectsAmount":1,"animations":[{"duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN","type":"scenario"}],"radius":40,"blipData":{"sprite":651,"isEnabled":true,"scale":0.8,"color":2,"display":2,"label":"Field"},"respawnTimer":30,"requiredItems":[{"name":"trimming_scissors","loseOnUse":false,"type":"item","minQuantity":1}],"rewardItems":[{"chances":3,"minQuantity":1,"name":"feuilletabac","type":"item","maxQuantity":5}],"objectModel":"h4_prop_tree_frangipani_lrg_01","maxObjectsAmount":1}'),
	(6, 'LSD', '{"spawnType":"automatic","requiredItems":[{"loseOnUse":false,"type":"item","minQuantity":1,"name":"trimming_scissors"}],"rewardItems":[{"maxQuantity":3,"minQuantity":1,"type":"item","chances":3,"name":"aspirine"}],"respawnTimer":20,"objectModel":"h4_prop_bush_cocaplant_01_row","animations":[{"type":"scenario","duration":5,"scenarioName":"PROP_HUMAN_BUM_BIN"}],"minObjectsAmount":1,"maxObjects":30,"minimumPolice":0,"blipData":{"color":2,"display":2,"label":"Field","sprite":651,"isEnabled":false,"scale":0.8},"radius":30,"maxObjectsAmount":1,"coords":{"x":3255.1,"y":-144.61,"z":15.7}}');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.inventories : ~0 rows (environ)
DELETE FROM `inventories`;

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

-- Listage des données de la table paris_horizon_base_dev.jobs : ~0 rows (environ)
DELETE FROM `jobs`;

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

-- Listage des données de la table paris_horizon_base_dev.jobs_data : ~0 rows (environ)
DELETE FROM `jobs_data`;

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

-- Listage des données de la table paris_horizon_base_dev.job_grades : ~0 rows (environ)
DELETE FROM `job_grades`;

-- Listage de la structure de table paris_horizon_base_dev. kq_extra
DROP TABLE IF EXISTS `kq_extra`;
CREATE TABLE IF NOT EXISTS `kq_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(256) DEFAULT '0',
  `tag` varchar(50) DEFAULT '0',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.kq_extra : ~0 rows (environ)
DELETE FROM `kq_extra`;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.okokbanking_transactions : ~0 rows (environ)
DELETE FROM `okokbanking_transactions`;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

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

-- Listage des données de la table paris_horizon_base_dev.phone_alertjobs : ~0 rows (environ)
DELETE FROM `phone_alertjobs`;

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
	('btc', 987, '[{"NewWorth":985,"PreviousWorth":993},{"NewWorth":985,"PreviousWorth":993},{"NewWorth":985,"PreviousWorth":993},{"NewWorth":987,"PreviousWorth":985}]');

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
) ENGINE=InnoDB AUTO_INCREMENT=3369 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.players : ~0 rows (environ)
DELETE FROM `players`;

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.playerskins : ~0 rows (environ)
DELETE FROM `playerskins`;

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table paris_horizon_base_dev.player_vehicles : ~0 rows (environ)
DELETE FROM `player_vehicles`;

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

-- Listage de la structure de table paris_horizon_base_dev. sa_moneywash
DROP TABLE IF EXISTS `sa_moneywash`;
CREATE TABLE IF NOT EXISTS `sa_moneywash` (
  `cid` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) NOT NULL,
  `reward` varchar(255) DEFAULT NULL,
  `items` longtext DEFAULT NULL,
  PRIMARY KEY (`ticket`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- Listage des données de la table paris_horizon_base_dev.sa_moneywash : ~0 rows (environ)
DELETE FROM `sa_moneywash`;

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

-- Listage des données de la table paris_horizon_base_dev.vehicle_parking : ~0 rows (environ)
DELETE FROM `vehicle_parking`;

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
