-- --------------------------------------------------------
-- Hôte:                         91.99.58.165
-- Version du serveur:           10.11.11-MariaDB-0+deb12u1 - Debian 12
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


-- Listage de la structure de la base pour nocturnrp_dev
CREATE DATABASE IF NOT EXISTS `nocturnrp_dev` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `nocturnrp_dev`;

-- Listage de la structure de table nocturnrp_dev. players
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
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table nocturnrp_dev.players : ~2 rows (environ)
DELETE FROM `players`;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(3, 'GXW56802', 1, 'license:79b355c37aff2d003091800c4e52f531a801c1a1', '[ F ] Nico', '{"bank":5000,"crypto":0,"cash":496}', '{"nationality":"France","cid":1,"lastname":"Arnaud","account":"US01QBCore5216329677","gender":0,"phone":"4649184935","birthdate":"2000-01-17","firstname":"Nicolas"}', '{"type":"none","isboss":false,"grade":{"isboss":false,"level":0,"name":"Indépendant"},"payment":10,"label":"Civil","name":"unemployed","onduty":false}', '{"label":"No Gang","isboss":false,"name":"none","grade":{"isboss":false,"level":0,"name":"Unaffiliated"}}', '{"x":-184.54945373535157,"y":-1671.230712890625,"z":33.4754638671875}', '{"criminalrecord":{"hasRecord":false},"phonedata":{"SerialNumber":72144902,"InstalledApps":[]},"callsign":"NO CALLSIGN","thirst":84.79999999999927,"armor":0,"hunger":83.1999999999971,"isdead":false,"inside":{"apartment":[]},"phone":[],"tracker":false,"bloodtype":"O+","licences":{"business":false,"driver":true,"weapon":false},"ishandcuffed":false,"stress":0,"walletid":"QB-32854194","fingerprint":"NL026t09gpQ3325","rep":[],"jailitems":[],"inlaststand":false,"vehicleKeys":{"65TOU349":true},"status":[],"injail":0}', '[{"name":"driver_license","amount":1,"slot":1,"created":1744237730,"info":{"type":"Class C Driver License","quality":100,"lastname":"Arnaud","birthdate":"2000-01-17","firstname":"Nicolas"},"type":"item","count":1},{"name":"id_card","amount":1,"slot":2,"created":1744237730,"info":{"nationality":"France","gender":0,"quality":100,"citizenid":"GXW56802","lastname":"Arnaud","birthdate":"2000-01-17","firstname":"Nicolas"},"type":"item","count":1},{"name":"phone","amount":1,"slot":3,"created":1744237730,"info":{"quality":100},"type":"item","count":1},{"name":"tosti","amount":1,"slot":9,"created":1744237884,"info":{"quality":100},"type":"item","count":1},{"name":"water_bottle","amount":1,"slot":15,"created":1744237888,"info":{"quality":100},"type":"item","count":1}]', '2025-04-09 22:42:04'),
	(1, 'PVN51254', 1, 'license:07451e3c9f7a322fb30c44791735aa8b037c9078', 'Minox', '{"cash":500,"crypto":0,"bank":5000}', '{"account":"US08QBCore9432775866","firstname":"steve","cid":1,"phone":"6407695400","gender":0,"birthdate":"2025-04-10","nationality":"France","lastname":"blajou"}', '{"type":"none","label":"Civilian","name":"unemployed","onduty":false,"payment":10,"grade":{"level":0,"name":"Freelancer"},"isboss":false}', '{"name":"none","label":"No Gang Affiliation","grade":{"level":0,"name":"none"},"isboss":false}', '{"x":-1040.5977783203126,"y":-2695.371337890625,"z":13.6600341796875}', '{"hunger":91.59999999999855,"armor":0,"phone":[],"injail":0,"stress":0,"licences":{"driver":true,"business":false,"weapon":false},"phonedata":{"InstalledApps":[],"SerialNumber":33316001},"callsign":"NO CALLSIGN","isdead":false,"thirst":92.39999999999964,"status":[],"inside":{"apartment":[]},"bloodtype":"O-","criminalrecord":{"hasRecord":false},"inlaststand":false,"jailitems":[],"ishandcuffed":false,"tracker":false,"rep":[],"fingerprint":"dJ602B07faU4626","walletid":"QB-36800155"}', '[{"slot":1,"created":1744237619,"amount":1,"name":"driver_license","count":1,"info":{"birthdate":"2025-04-10","firstname":"steve","quality":100,"lastname":"blajou","type":"Class C Driver License"},"type":"item"},{"slot":2,"created":1744237619,"amount":1,"name":"id_card","count":1,"info":{"birthdate":"2025-04-10","lastname":"blajou","nationality":"France","firstname":"steve","gender":0,"citizenid":"PVN51254","quality":100},"type":"item"},{"slot":3,"created":1744237619,"amount":1,"name":"phone","count":1,"info":{"quality":100},"type":"item"}]', '2025-04-09 22:34:19');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;









-- --------------------------------------------------------
-- Hôte:                         91.99.58.165
-- Version du serveur:           10.11.11-MariaDB-0+deb12u1 - Debian 12
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


-- Listage de la structure de la base pour nocturnrp_dev
CREATE DATABASE IF NOT EXISTS `nocturnrp_dev` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;
USE `nocturnrp_dev`;

-- Listage de la structure de table nocturnrp_dev. inventories
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `items` longtext DEFAULT '[]',
  PRIMARY KEY (`identifier`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Listage des données de la table nocturnrp_dev.inventories : ~0 rows (environ)
DELETE FROM `inventories`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
