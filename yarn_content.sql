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
