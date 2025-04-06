-- player_vehicles
/* ALTER TABLE `player_vehicles` ADD COLUMN IF NOT EXISTS `damage` LONGTEXT DEFAULT ''; */
ALTER TABLE `player_vehicles` ADD COLUMN `damage` LONGTEXT;
ALTER TABLE `player_vehicles` ADD COLUMN `in_garage` TINYINT(1) DEFAULT '1';
ALTER TABLE `player_vehicles` ADD COLUMN `garage_id` VARCHAR(255) DEFAULT 'Legion Square';
ALTER TABLE `player_vehicles` ADD COLUMN `job_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `job_vehicle_rank` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `gang_vehicle` TINYINT(1) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `gang_vehicle_rank` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `impound` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `impound_retrievable` INT(10) DEFAULT '0';
ALTER TABLE `player_vehicles` ADD COLUMN `impound_data` LONGTEXT;
ALTER TABLE `player_vehicles` ADD COLUMN `nickname` VARCHAR(255) DEFAULT '';

CREATE TABLE IF NOT EXISTS `player_priv_garages` (
	`id` INT(11) unsigned NOT NULL AUTO_INCREMENT,
	`owners` longtext,
	`name` VARCHAR(255),
	`type` VARCHAR(50),
	`x` FLOAT,
	`y` FLOAT,
	`z` FLOAT,
	`h` FLOAT,
	`distance` INT(11) DEFAULT '10',
	PRIMARY KEY (`id`)
);