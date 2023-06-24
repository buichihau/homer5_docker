-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `homer_statistic`;
CREATE DATABASE `homer_statistic` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `homer_statistic`;

DROP TABLE IF EXISTS `alarm_config`;
CREATE TABLE `alarm_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `startdate` datetime NOT NULL,
  `stopdate` datetime NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `value` int(5) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(200) NOT NULL DEFAULT '',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `alarm_data`;
CREATE TABLE `alarm_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL DEFAULT '',
  `total` int(20) NOT NULL DEFAULT '0',
  `source_ip` varchar(150) NOT NULL DEFAULT '0.0.0.0',
  `description` varchar(256) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`create_date`),
  KEY `to_date` (`create_date`),
  KEY `method` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`create_date`))
(PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `alarm_data_mem`;
CREATE TABLE `alarm_data_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(50) NOT NULL DEFAULT '',
  `total` int(20) NOT NULL DEFAULT '0',
  `source_ip` varchar(150) NOT NULL DEFAULT '0.0.0.0',
  `description` varchar(256) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`source_ip`),
  KEY `to_date` (`create_date`),
  KEY `method` (`type`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stats_data`;
CREATE TABLE `stats_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `type` varchar(50) NOT NULL DEFAULT '',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`type`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `method` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_dest_mem`;
CREATE TABLE `stats_dest_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prefix` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT '',
  `status_code` varchar(3) NOT NULL DEFAULT '',
  `reason_phrase` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT 'UN',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `duration` int(11) DEFAULT NULL,
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `datemethod` (`country`,`prefix`,`method`,`status_code`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stats_dest_reply`;
CREATE TABLE `stats_dest_reply` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `prefix` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL DEFAULT '',
  `status_code` varchar(3) NOT NULL DEFAULT '',
  `reason_phrase` varchar(100) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT 'UN',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`country`,`prefix`,`method`,`status_code`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `prefix` (`prefix`),
  KEY `method` (`method`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_generic`;
CREATE TABLE `stats_generic` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `type` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '',
  `total` int(20) NOT NULL,
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`type`,`tag`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `method` (`type`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_geo`;
CREATE TABLE `stats_geo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `method` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT 'UN',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`method`,`country`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `method` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_geo_mem`;
CREATE TABLE `stats_geo_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT 'UN',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `datemethod` (`method`,`country`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stats_ip`;
CREATE TABLE `stats_ip` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `method` varchar(50) NOT NULL DEFAULT '',
  `source_ip` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`method`,`source_ip`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `method` (`method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_ip_mem`;
CREATE TABLE `stats_ip_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` varchar(50) NOT NULL DEFAULT '',
  `source_ip` varchar(255) NOT NULL DEFAULT '0.0.0.0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `datemethod` (`method`,`source_ip`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stats_method`;
CREATE TABLE `stats_method` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `method` varchar(50) NOT NULL DEFAULT '',
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `cseq` varchar(100) NOT NULL DEFAULT '',
  `totag` tinyint(1) NOT NULL DEFAULT '0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethod` (`from_date`,`to_date`,`method`,`auth`,`totag`,`cseq`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `method` (`method`),
  KEY `completed` (`cseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_method_mem`;
CREATE TABLE `stats_method_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `method` varchar(50) NOT NULL DEFAULT '',
  `auth` tinyint(1) NOT NULL DEFAULT '0',
  `cseq` varchar(100) NOT NULL DEFAULT '',
  `totag` tinyint(1) NOT NULL DEFAULT '0',
  `total` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `datemethod` (`method`,`auth`,`totag`,`cseq`),
  KEY `from_date` (`create_date`),
  KEY `method` (`method`),
  KEY `completed` (`cseq`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `stats_useragent`;
CREATE TABLE `stats_useragent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `to_date` timestamp NOT NULL DEFAULT '1970-12-31 16:00:01',
  `useragent` varchar(256) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `total` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`from_date`),
  UNIQUE KEY `datemethodua` (`from_date`,`to_date`,`method`,`useragent`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `useragent` (`useragent`),
  KEY `method` (`method`),
  KEY `total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`from_date`))
(PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `stats_useragent_mem`;
CREATE TABLE `stats_useragent_mem` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `useragent` varchar(256) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `total` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `useragent` (`useragent`,`method`)
) ENGINE=MEMORY DEFAULT CHARSET=latin1;


-- 2022-01-03 05:59:56
