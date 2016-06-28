DROP TABLE `yarn_swatch`;

DROP TABLE `yarn_content`;

DROP TABLE `yarn_yarn`;

CREATE TABLE `yarn_yarn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `manufacturer` varchar(128) NOT NULL,
  `knit_rows_per_10cm` tinyint(3),
  `knit_stitches_per_10cm` tinyint(3),
  `knit_needle_size_mm` varchar(128),
  `crochet_rows_per_10cm` tinyint(3),
  `crochet_stitches_per_10cm` tinyint(3),
  `crochet_hook_size_mm` varchar(128),
  `meters` smallint(5),
  `grams` smallint(5),
  PRIMARY KEY (`id`),
  UNIQUE KEY `yarn_name` (`name`),
  KEY `yarn_manufacturer` (`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `yarn_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yarn_id` int(11) NOT NULL,
  `fiber` enum('acrylic','alpaca','cotton','linen','mohair','rayon','silk','unknown','wool') NOT NULL,
  `percentage` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `content_yarn_id` (`yarn_id`),
  KEY `content_fiber` (`fiber`),
  CONSTRAINT `content_yarn` FOREIGN KEY (`yarn_id`) REFERENCES `yarn_yarn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `yarn_swatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yarn_id` int(11) NOT NULL,
  `machine` enum('Brother KH860','Silver Reed SK860','Singer 2200','Studio SK155','White 1602') NOT NULL,
  `stitch_type` enum('1x1 Rib','2x1 Rib','2x2 Rib','Full Needle Rib','Industrial Rib','Slip','Stockinette','Tuck'),
  `stitch_dial` decimal(3,1),
  `tension` tinyint(3),
  `rows_per_10cm` decimal(3,1),
  `stitches_per_10cm` decimal(3,1),
  `rows` smallint(3),
  `stitches` smallint(3),
  `grams` decimal(3,1),
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `swatch_yarn_id` (`yarn_id`),
  KEY `swatch_machine` (`machine`),
  CONSTRAINT `swatch_yarn` FOREIGN KEY (`yarn_id`) REFERENCES `yarn_yarn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
