-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `homer_configuration`;
CREATE DATABASE `homer_configuration` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `homer_configuration`;

DROP TABLE IF EXISTS `alias`;
CREATE TABLE `alias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `gid` int(5) NOT NULL DEFAULT '0',
  `ip` varchar(80) NOT NULL DEFAULT '',
  `port` int(10) NOT NULL DEFAULT '0',
  `capture_id` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `is_stp` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `host_2` (`ip`,`port`,`capture_id`),
  KEY `host` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `alias` (`id`, `gid`, `ip`, `port`, `capture_id`, `alias`, `is_stp`, `status`, `created`) VALUES
(1,	10,	'192.168.0.30',	0,	'homer01',	'proxy01',	0,	1,	'2014-06-12 13:36:50'),
(2,	10,	'192.168.0.4',	0,	'homer01',	'acme-234',	0,	1,	'2014-06-12 13:37:01'),
(22,	10,	'127.0.0.1:5060',	0,	'homer01',	'sip.local.net',	0,	1,	'2014-06-12 13:37:01');

DROP TABLE IF EXISTS `api_auth_key`;
CREATE TABLE `api_auth_key` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authkey` varchar(200) NOT NULL,
  `source_ip` varchar(200) NOT NULL DEFAULT '0.0.0.0',
  `startdate` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `stopdate` datetime NOT NULL DEFAULT '2032-01-01 00:00:00',
  `userobject` varchar(250) NOT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `lastvisit` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `enable` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `authkey` (`authkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `gid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  UNIQUE KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `group` (`gid`, `name`) VALUES
(10,	'Administrator');

DROP TABLE IF EXISTS `link_share`;
CREATE TABLE `link_share` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `uuid` varchar(120) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `expire` datetime NOT NULL DEFAULT '2032-12-31 00:00:00',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(80) NOT NULL DEFAULT '',
  `dbname` varchar(100) NOT NULL DEFAULT '',
  `dbport` varchar(100) NOT NULL DEFAULT '',
  `dbusername` varchar(100) NOT NULL DEFAULT '',
  `dbpassword` varchar(100) NOT NULL DEFAULT '',
  `dbtables` varchar(100) NOT NULL DEFAULT 'sip_capture',
  `name` varchar(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `host_2` (`host`),
  KEY `host` (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `node` (`id`, `host`, `dbname`, `dbport`, `dbusername`, `dbpassword`, `dbtables`, `name`, `status`) VALUES
(1,	'127.0.0.1',	'homer_data',	'3306',	'homer_user',	'mysql_password',	'sip_capture',	'homer01',	1),
(21,	'10.1.0.7',	'homer_data',	'3306',	'homer_user',	'mysql_password',	'sip_capture',	'external',	1);

DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `param_name` varchar(120) NOT NULL DEFAULT '',
  `param_value` text NOT NULL,
  `valid_param_from` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `valid_param_to` datetime NOT NULL DEFAULT '2032-12-01 00:00:00',
  `param_prio` int(2) NOT NULL DEFAULT '10',
  `active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_2` (`uid`,`param_name`),
  KEY `param_name` (`param_name`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `setting` (`id`, `uid`, `param_name`, `param_value`, `valid_param_from`, `valid_param_to`, `param_prio`, `active`) VALUES
(1,	1,	'timerange',	'{\"from\":\"2015-05-26T18:34:42.654Z\",\"to\":\"2015-05-26T18:44:42.654Z\"}',	'2012-01-01 00:00:00',	'2032-12-01 00:00:00',	10,	1);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(10) NOT NULL DEFAULT '10',
  `grp` varchar(200) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `firstname` varchar(250) NOT NULL DEFAULT '',
  `lastname` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(250) NOT NULL DEFAULT '',
  `department` varchar(100) NOT NULL DEFAULT '',
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `login` (`username`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`uid`, `gid`, `grp`, `username`, `password`, `firstname`, `lastname`, `email`, `department`, `regdate`, `lastvisit`, `active`) VALUES
(1,	10,	'users,admins',	'admin',	'*676243218923905CF94CB52A3C9D3EB30CE8E20D',	'Admin',	'Admin',	'admin@test.com',	'Voice Enginering',	'2012-01-18 17:00:00',	'2015-05-29 07:17:35',	1),
(2,	10,	'users',	'noc',	'*B7B6F1339340C168B59DE181DB6E5801A7133EC8',	'NOC',	'NOC',	'noc@test.com',	'Voice NOC',	'2012-01-18 17:00:00',	'2015-05-29 07:17:35',	1);

DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu` (
  `id` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(200) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `weight` int(10) NOT NULL DEFAULT '10',
  `active` int(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_menu` (`id`, `name`, `alias`, `icon`, `weight`, `active`) VALUES
('_1426001444630',	'SIP Search',	'search',	'fa-search',	10,	1),
('_1427728371642',	'Home',	'home',	'fa-home',	1,	1),
('_1431721484444',	'Alarms',	'alarms',	'fa-warning',	20,	1);

-- 2022-01-03 05:59:34
