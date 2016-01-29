# ************************************************************
# Sequel Pro SQL dump
# Versão 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.10)
# Base de Dados: missingperson
# Tempo de Geração: 2016-01-29 09:25:17 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump da tabela beard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `beard`;

CREATE TABLE `beard` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `barba` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `beard` WRITE;
/*!40000 ALTER TABLE `beard` DISABLE KEYS */;

INSERT INTO `beard` (`id`, `barba`)
VALUES
	(1,'Com'),
	(2,'Sem'),
	(3,'Curta'),
	(4,'Longa'),
	(5,'Ruiva'),
	(6,'Preta'),
	(7,'Grisalha');

/*!40000 ALTER TABLE `beard` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela companion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companion`;

CREATE TABLE `companion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_sighting_id` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `hair_id` int(11) NOT NULL,
  `eyes_id` int(11) NOT NULL,
  `skin_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela eyes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eyes`;

CREATE TABLE `eyes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `eyes` WRITE;
/*!40000 ALTER TABLE `eyes` DISABLE KEYS */;

INSERT INTO `eyes` (`id`, `color`)
VALUES
	(1,'Castanho'),
	(2,'Preto'),
	(3,'Azul'),
	(4,'Verde'),
	(5,'Castanho claro');

/*!40000 ALTER TABLE `eyes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela facebook
# ------------------------------------------------------------

DROP TABLE IF EXISTS `facebook`;

CREATE TABLE `facebook` (
  `uid` int(11) NOT NULL,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birthday` varchar(16) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela hair
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hair`;

CREATE TABLE `hair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `hair` WRITE;
/*!40000 ALTER TABLE `hair` DISABLE KEYS */;

INSERT INTO `hair` (`id`, `color`)
VALUES
	(1,'Branco'),
	(2,'Preto'),
	(3,'Loiro'),
	(4,'Ruivo'),
	(5,'Grisalho'),
	(6,'Careca'),
	(7,'Longo'),
	(8,'Curto');

/*!40000 ALTER TABLE `hair` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela provider
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider`;

CREATE TABLE `provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facebook_uid` int(11) DEFAULT NULL,
  `twitter_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela report_missing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_missing`;

CREATE TABLE `report_missing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) NOT NULL,
  `age` varchar(6) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `height` varchar(6) DEFAULT NULL,
  `last_seen` varchar(45) DEFAULT NULL,
  `hair_id` int(11) NOT NULL,
  `eyes_id` int(11) unsigned zerofill NOT NULL,
  `skin_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela report_sighting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `report_sighting`;

CREATE TABLE `report_sighting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_missing_id` int(11) NOT NULL,
  `companion_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `geolocation` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela skin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skin`;

CREATE TABLE `skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `skin` WRITE;
/*!40000 ALTER TABLE `skin` DISABLE KEYS */;

INSERT INTO `skin` (`id`, `color`)
VALUES
	(1,'Branco'),
	(2,'Preto'),
	(3,'Moreno');

/*!40000 ALTER TABLE `skin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump da tabela twitter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `twitter`;

CREATE TABLE `twitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_uid` text,
  `oauth_token` text,
  `oauth_secret` text,
  `username` text,
  `fullname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `birthday` varchar(16) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_uid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump da tabela vehicle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vehicle`;

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_sighting_id` int(11) NOT NULL,
  `color` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
