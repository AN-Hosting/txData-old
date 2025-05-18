CREATE TABLE `farming_crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `crop` varchar(255) NOT NULL,
  `prop` varchar(255) NOT NULL,
  `hunger` double NOT NULL,
  `thirst` double NOT NULL,
  `quality` double NOT NULL,
  `growth` double NOT NULL,
  `growthrate` int(11) NOT NULL,
  `degraderate` int(11) NOT NULL,
  `coords` text DEFAULT NULL,
  `zheight` int(11) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `farming_warehouse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crop` varchar(255) NOT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

INSERT INTO `farming_warehouse` (`crop`) VALUES ('Barley'), ('Maize'), ('Potato'), ('Mushroom'), ('Apple'), ('Orange'), ('Lemon'), ('Lime'), ('Lettuce'), ('CactusFruit'), ('Tomato'), ('Strawberry'), ('Blueberry'), ('Milk'), ('Egg'), ('Pineapple');