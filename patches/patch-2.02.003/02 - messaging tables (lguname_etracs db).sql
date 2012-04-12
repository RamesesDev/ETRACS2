/*
SQLyog Community Edition- MySQL GUI v6.03
Host - 5.0.27-community-nt-log : Database - municipality_etracs
*********************************************************************
Server version : 5.0.27-community-nt-log
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `domain` */

DROP TABLE IF EXISTS `domain`;

CREATE TABLE `domain` (
  `domainid` varchar(50) NOT NULL,
  `domainname` varchar(50) NOT NULL,
  `dtlastconnected` datetime NOT NULL,
  `info` text,
  `domaintype` varchar(25) NOT NULL,
  PRIMARY KEY  (`domainid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `entityformapping` */

DROP TABLE IF EXISTS `entityformapping`;

CREATE TABLE `entityformapping` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `domainid` varchar(50) NOT NULL,
  `domainname` varchar(100) NOT NULL,
  `entityno` varchar(15) NOT NULL,
  `entityname` varchar(500) NOT NULL,
  `entityaddress` varchar(200) NOT NULL,
  `mappings` text,
  PRIMARY KEY  (`objid`),
  KEY `dmainname` (`domainname`),
  KEY `entityname` (`entityname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `entitymapping` */

DROP TABLE IF EXISTS `entitymapping`;

CREATE TABLE `entitymapping` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `parentid` varchar(50) NOT NULL,
  `entityid` varchar(50) NOT NULL,
  `domainid` varchar(50) NOT NULL,
  `domainname` varchar(100) NOT NULL,
  `entityno` varchar(15) NOT NULL,
  `entityname` varchar(500) NOT NULL,
  `entityaddress` varchar(200) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `ix_entitymapping_entityid` (`parentid`),
  KEY `dmainname` (`domainname`),
  KEY `entityname` (`entityname`),
  KEY `mappingid` (`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_inbox` */

DROP TABLE IF EXISTS `sys_inbox`;

CREATE TABLE `sys_inbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(10) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_outbox` */

DROP TABLE IF EXISTS `sys_outbox`;

CREATE TABLE `sys_outbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(20) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_processedinbox` */

DROP TABLE IF EXISTS `sys_processedinbox`;

CREATE TABLE `sys_processedinbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(10) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_processedoutbox` */

DROP TABLE IF EXISTS `sys_processedoutbox`;

CREATE TABLE `sys_processedoutbox` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(5) NOT NULL,
  `fromlguindex` varchar(20) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(20) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  `dtsent` datetime NOT NULL,
  `sentby` varchar(50) NOT NULL,
  `sentbytitle` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` text,
  `refid` varchar(50) NOT NULL,
  `stacktrace` text,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sys_responsedata` */

DROP TABLE IF EXISTS `sys_responsedata`;

CREATE TABLE `sys_responsedata` (
  `objid` varchar(50) NOT NULL,
  `sessionid` varchar(50) NOT NULL,
  `status` text,
  `data` text NOT NULL,
  `fromlguindex` varchar(25) NOT NULL,
  `fromlguname` varchar(50) NOT NULL,
  `tolguindex` varchar(25) NOT NULL,
  `tolguname` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
