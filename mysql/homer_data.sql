-- Adminer 4.7.7 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS `homer_data`;
CREATE DATABASE `homer_data` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `homer_data`;

DROP TABLE IF EXISTS `isup_capture_all_20220103`;
CREATE TABLE `isup_capture_all_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `method` varchar(4) NOT NULL DEFAULT '',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `opc` int(10) NOT NULL DEFAULT '0',
  `dpc` int(10) NOT NULL DEFAULT '0',
  `cic` int(10) NOT NULL DEFAULT '0',
  `called_number` varchar(16) DEFAULT '',
  `called_ton` int(10) DEFAULT '0',
  `called_npi` int(10) DEFAULT '0',
  `called_inn` int(10) DEFAULT '0',
  `calling_number` varchar(16) DEFAULT '',
  `calling_ton` int(10) DEFAULT '0',
  `calling_npi` int(10) DEFAULT '0',
  `calling_ni` int(10) DEFAULT '0',
  `calling_restrict` int(10) DEFAULT '0',
  `calling_screened` int(10) DEFAULT '0',
  `calling_category` int(10) DEFAULT '0',
  `cause_standard` int(10) DEFAULT '0',
  `cause_location` int(10) DEFAULT '0',
  `cause_itu_class` int(10) DEFAULT '0',
  `cause_itu_cause` int(10) DEFAULT '0',
  `event_num` int(10) DEFAULT '0',
  `hop_counter` int(10) DEFAULT '0',
  `nci_satellite` int(10) DEFAULT '0',
  `nci_continuity_check` int(10) DEFAULT '0',
  `nci_echo_device` int(10) DEFAULT '0',
  `fwc_nic` int(10) DEFAULT '0',
  `fwc_etem` int(10) DEFAULT '0',
  `fwc_iw` int(10) DEFAULT '0',
  `fwc_etei` int(10) DEFAULT '0',
  `fwc_isup` int(10) DEFAULT '0',
  `fwc_isup_pref` int(10) DEFAULT '0',
  `fwc_ia` int(10) DEFAULT '0',
  `fwc_sccpm` int(10) DEFAULT '0',
  `transmission_medium` int(10) DEFAULT '0',
  `user_coding_standard` int(10) DEFAULT '0',
  `user_transfer_cap` int(10) DEFAULT '0',
  `user_transfer_mode` int(10) DEFAULT '0',
  `user_transfer_rate` int(10) DEFAULT '0',
  `user_layer1_ident` int(10) DEFAULT '0',
  `user_layer1_proto` int(10) DEFAULT '0',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(3000) NOT NULL DEFAULT '',
  `expires` int(5) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `called_number` (`called_number`),
  KEY `calling_number` (`calling_number`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




DROP TABLE IF EXISTS `logs_capture`;
CREATE TABLE `logs_capture` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2013082901 VALUES LESS THAN (1377734400) ENGINE = InnoDB,
 PARTITION p2013090821 VALUES LESS THAN (1378670400) ENGINE = InnoDB,
 PARTITION p2013090822 VALUES LESS THAN (1378674000) ENGINE = InnoDB,
 PARTITION p2013090823 VALUES LESS THAN (1378677600) ENGINE = InnoDB,
 PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `report_capture`;
CREATE TABLE `report_capture` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2013082901 VALUES LESS THAN (1377734400) ENGINE = InnoDB,
 PARTITION p2013090821 VALUES LESS THAN (1378670400) ENGINE = InnoDB,
 PARTITION p2013090822 VALUES LESS THAN (1378674000) ENGINE = InnoDB,
 PARTITION p2013090823 VALUES LESS THAN (1378677600) ENGINE = InnoDB,
 PARTITION p2022010400 VALUES LESS THAN (1641340800) ENGINE = InnoDB,
 PARTITION p2022010500 VALUES LESS THAN (1641427200) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `rtcp_capture`;
CREATE TABLE `rtcp_capture` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2013082901 VALUES LESS THAN (1377734400) ENGINE = InnoDB,
 PARTITION p2013090821 VALUES LESS THAN (1378670400) ENGINE = InnoDB,
 PARTITION p2013090822 VALUES LESS THAN (1378674000) ENGINE = InnoDB,
 PARTITION p2013090823 VALUES LESS THAN (1378677600) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `rtcp_capture_all_20220103`;
CREATE TABLE `rtcp_capture_all_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(1500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




DROP TABLE IF EXISTS `sip_capture_call_20220103`;
CREATE TABLE `sip_capture_call_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `method` varchar(50) NOT NULL DEFAULT '',
  `reply_reason` varchar(100) NOT NULL DEFAULT '',
  `ruri` varchar(4500) NOT NULL DEFAULT '',
  `ruri_user` varchar(100) NOT NULL DEFAULT '',
  `ruri_domain` varchar(150) NOT NULL DEFAULT '',
  `from_user` varchar(100) NOT NULL DEFAULT '',
  `from_domain` varchar(150) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_user` varchar(100) NOT NULL DEFAULT '',
  `to_domain` varchar(150) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `pid_user` varchar(100) NOT NULL DEFAULT '',
  `contact_user` varchar(120) NOT NULL DEFAULT '',
  `auth_user` varchar(120) NOT NULL DEFAULT '',
  `callid` varchar(120) NOT NULL DEFAULT '',
  `callid_aleg` varchar(120) NOT NULL DEFAULT '',
  `via_1` varchar(512) NOT NULL DEFAULT '',
  `via_1_branch` varchar(256) NOT NULL DEFAULT '',
  `cseq` varchar(25) NOT NULL DEFAULT '',
  `diversion` varchar(256) NOT NULL DEFAULT '',
  `reason` varchar(200) NOT NULL DEFAULT '',
  `content_type` varchar(256) NOT NULL DEFAULT '',
  `auth` varchar(256) NOT NULL DEFAULT '',
  `user_agent` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `contact_ip` varchar(60) NOT NULL DEFAULT '',
  `contact_port` int(10) NOT NULL DEFAULT '0',
  `originator_ip` varchar(60) NOT NULL DEFAULT '',
  `originator_port` int(10) NOT NULL DEFAULT '0',
  `expires` int(5) NOT NULL DEFAULT '-1',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `custom_field1` varchar(120) NOT NULL DEFAULT '',
  `custom_field2` varchar(120) NOT NULL DEFAULT '',
  `custom_field3` varchar(120) NOT NULL DEFAULT '',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `rtp_stat` varchar(256) NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(6000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `ruri_user` (`ruri_user`),
  KEY `from_user` (`from_user`),
  KEY `to_user` (`to_user`),
  KEY `pid_user` (`pid_user`),
  KEY `auth_user` (`auth_user`),
  KEY `callid_aleg` (`callid_aleg`),
  KEY `date` (`date`),
  KEY `callid` (`callid`),
  KEY `method` (`method`),
  KEY `source_ip` (`source_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




DROP TABLE IF EXISTS `sip_capture_registration_20220103`;
CREATE TABLE `sip_capture_registration_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `method` varchar(50) NOT NULL DEFAULT '',
  `reply_reason` varchar(100) NOT NULL DEFAULT '',
  `ruri` varchar(4500) NOT NULL DEFAULT '',
  `ruri_user` varchar(100) NOT NULL DEFAULT '',
  `ruri_domain` varchar(150) NOT NULL DEFAULT '',
  `from_user` varchar(100) NOT NULL DEFAULT '',
  `from_domain` varchar(150) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_user` varchar(100) NOT NULL DEFAULT '',
  `to_domain` varchar(150) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `pid_user` varchar(100) NOT NULL DEFAULT '',
  `contact_user` varchar(120) NOT NULL DEFAULT '',
  `auth_user` varchar(120) NOT NULL DEFAULT '',
  `callid` varchar(120) NOT NULL DEFAULT '',
  `callid_aleg` varchar(120) NOT NULL DEFAULT '',
  `via_1` varchar(512) NOT NULL DEFAULT '',
  `via_1_branch` varchar(256) NOT NULL DEFAULT '',
  `cseq` varchar(25) NOT NULL DEFAULT '',
  `diversion` varchar(256) NOT NULL DEFAULT '',
  `reason` varchar(200) NOT NULL DEFAULT '',
  `content_type` varchar(256) NOT NULL DEFAULT '',
  `auth` varchar(256) NOT NULL DEFAULT '',
  `user_agent` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `contact_ip` varchar(60) NOT NULL DEFAULT '',
  `contact_port` int(10) NOT NULL DEFAULT '0',
  `originator_ip` varchar(60) NOT NULL DEFAULT '',
  `originator_port` int(10) NOT NULL DEFAULT '0',
  `expires` int(5) NOT NULL DEFAULT '-1',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `custom_field1` varchar(120) NOT NULL DEFAULT '',
  `custom_field2` varchar(120) NOT NULL DEFAULT '',
  `custom_field3` varchar(120) NOT NULL DEFAULT '',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `rtp_stat` varchar(256) NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `ruri_user` (`ruri_user`),
  KEY `from_user` (`from_user`),
  KEY `to_user` (`to_user`),
  KEY `pid_user` (`pid_user`),
  KEY `auth_user` (`auth_user`),
  KEY `callid_aleg` (`callid_aleg`),
  KEY `date` (`date`),
  KEY `callid` (`callid`),
  KEY `method` (`method`),
  KEY `source_ip` (`source_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




DROP TABLE IF EXISTS `sip_capture_rest_20220103`;
CREATE TABLE `sip_capture_rest_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `method` varchar(50) NOT NULL DEFAULT '',
  `reply_reason` varchar(100) NOT NULL DEFAULT '',
  `ruri` varchar(4500) NOT NULL DEFAULT '',
  `ruri_user` varchar(100) NOT NULL DEFAULT '',
  `ruri_domain` varchar(150) NOT NULL DEFAULT '',
  `from_user` varchar(100) NOT NULL DEFAULT '',
  `from_domain` varchar(150) NOT NULL DEFAULT '',
  `from_tag` varchar(128) NOT NULL DEFAULT '',
  `to_user` varchar(100) NOT NULL DEFAULT '',
  `to_domain` varchar(150) NOT NULL DEFAULT '',
  `to_tag` varchar(128) NOT NULL DEFAULT '',
  `pid_user` varchar(100) NOT NULL DEFAULT '',
  `contact_user` varchar(120) NOT NULL DEFAULT '',
  `auth_user` varchar(120) NOT NULL DEFAULT '',
  `callid` varchar(120) NOT NULL DEFAULT '',
  `callid_aleg` varchar(120) NOT NULL DEFAULT '',
  `via_1` varchar(512) NOT NULL DEFAULT '',
  `via_1_branch` varchar(256) NOT NULL DEFAULT '',
  `cseq` varchar(25) NOT NULL DEFAULT '',
  `diversion` varchar(256) NOT NULL DEFAULT '',
  `reason` varchar(200) NOT NULL DEFAULT '',
  `content_type` varchar(256) NOT NULL DEFAULT '',
  `auth` varchar(256) NOT NULL DEFAULT '',
  `user_agent` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `contact_ip` varchar(60) NOT NULL DEFAULT '',
  `contact_port` int(10) NOT NULL DEFAULT '0',
  `originator_ip` varchar(60) NOT NULL DEFAULT '',
  `originator_port` int(10) NOT NULL DEFAULT '0',
  `expires` int(5) NOT NULL DEFAULT '-1',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `custom_field1` varchar(120) NOT NULL DEFAULT '',
  `custom_field2` varchar(120) NOT NULL DEFAULT '',
  `custom_field3` varchar(120) NOT NULL DEFAULT '',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `rtp_stat` varchar(256) NOT NULL DEFAULT '',
  `type` int(2) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `ruri_user` (`ruri_user`),
  KEY `from_user` (`from_user`),
  KEY `to_user` (`to_user`),
  KEY `pid_user` (`pid_user`),
  KEY `auth_user` (`auth_user`),
  KEY `callid_aleg` (`callid_aleg`),
  KEY `date` (`date`),
  KEY `callid` (`callid`),
  KEY `method` (`method`),
  KEY `source_ip` (`source_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




DROP TABLE IF EXISTS `webrtc_capture`;
CREATE TABLE `webrtc_capture` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(4500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `correlationid` (`correlation_id`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2013082901 VALUES LESS THAN (1377734400) ENGINE = InnoDB,
 PARTITION p2013090821 VALUES LESS THAN (1378670400) ENGINE = InnoDB,
 PARTITION p2013090822 VALUES LESS THAN (1378674000) ENGINE = InnoDB,
 PARTITION p2013090823 VALUES LESS THAN (1378677600) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;


DROP TABLE IF EXISTS `webrtc_capture_all_20220103`;
CREATE TABLE `webrtc_capture_all_20220103` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `micro_ts` bigint(18) NOT NULL DEFAULT '0',
  `method` varchar(100) NOT NULL DEFAULT '',
  `caller` varchar(250) NOT NULL DEFAULT '',
  `callee` varchar(250) NOT NULL DEFAULT '',
  `session_id` varchar(256) NOT NULL DEFAULT '',
  `correlation_id` varchar(256) NOT NULL DEFAULT '',
  `source_ip` varchar(60) NOT NULL DEFAULT '',
  `source_port` int(10) NOT NULL DEFAULT '0',
  `destination_ip` varchar(60) NOT NULL DEFAULT '',
  `destination_port` int(10) NOT NULL DEFAULT '0',
  `proto` int(5) NOT NULL DEFAULT '0',
  `family` int(1) DEFAULT NULL,
  `type` int(5) NOT NULL DEFAULT '0',
  `node` varchar(125) NOT NULL DEFAULT '',
  `msg` varchar(6000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`date`),
  KEY `date` (`date`),
  KEY `sessionid` (`session_id`),
  KEY `correlationid` (`correlation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=8 COMMENT='20220103'
/*!50100 PARTITION BY RANGE ( UNIX_TIMESTAMP(`date`))
(PARTITION p2022010300 VALUES LESS THAN (1641254400) ENGINE = InnoDB,
 PARTITION pmax VALUES LESS THAN MAXVALUE ENGINE = InnoDB) */;




-- 2022-01-03 05:58:19
