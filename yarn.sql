CREATE TABLE `yarn_yarn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `manufacturer` varchar(128) NOT NULL,
  `rows_per_4cm` decimal(2,1) NOT NULL,
  `stitches_per_10cm` decimal(2,1) NOT NULL,
  `needle_size` varchar(128),
  `hook_size` varchar(128),
  PRIMARY KEY (`id`),
  UNIQUE KEY `yarn_name` (`name`),
  KEY `yarn_manufacturer` (`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `yarn_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yarn_id` int(11) NOT NULL,
  `fiber` enum('acrylic','alpaca','cotton','linen','mohair','rayon','silk','wool') NOT NULL,
  `percentage` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_yarn_id` (`yarn_id`),
  KEY `content_fiber` (`fiber`),
  CONSTRAINT `content_yarn` FOREIGN KEY (`yarn_id`) REFERENCES `yarn_yarn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `yarn_swatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yarn_id` int(11) NOT NULL,
  `machine` enum('White 1602','Singer 2200','Brother KH860','Studio SK155','Silver Reed SK860') NOT NULL,
  `stitch_size` decimal(2,1) NOT NULL,
  `mast_tension` int(11) NOT NULL,
  `rows_per_10cm` decimal(2,1) NOT NULL,
  `stitches_per_10cm` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swatch_yarn` (`yarn_id`),
  CONSTRAINT `swatch_yarn` FOREIGN KEY (`yarn_id`) REFERENCES `yarn_yarn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
