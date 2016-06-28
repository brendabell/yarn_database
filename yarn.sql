CREATE TABLE `yarn_yarn` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `manufacturer` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `yarn_name` (`name`),
  KEY `yarn_manufacturer` (`manufacturer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
