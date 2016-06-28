CREATE TABLE `yarn_swatch` (
  `id` int(11) NOT NULL,
  `yarn_id` int(11) NOT NULL,
  `machine` enum('White 1602','Singer 2200','Brother KH860','Studio SK155','Silver Reed SK860') NOT NULL,
  `stitch_size` decimal(2,1) NOT NULL,
  `mast_tension` int(11) NOT NULL,
  `rows_per_4cm` decimal(2,1) NOT NULL,
  `stitches_per_10cm` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `swatch_yarn` (`yarn_id`),
  CONSTRAINT `swatch_yarn` FOREIGN KEY (`yarn_id`) REFERENCES `yarn_yarn` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
