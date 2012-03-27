/*
SQLyog Community Edition- MySQL GUI v6.03
Host - 5.0.27-community-nt-log : Database - municipality_system
*********************************************************************
Server version : 5.0.27-community-nt-log
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `sys_task_error` */

DROP TABLE IF EXISTS `sys_task_error`;

CREATE TABLE `sys_task_error` (
  `taskid` int(11) NOT NULL,
  `msg` mediumtext,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_error` */

/*Table structure for table `sys_task_info` */

DROP TABLE IF EXISTS `sys_task_info`;

CREATE TABLE `sys_task_info` (
  `taskid` int(11) NOT NULL,
  `scriptname` varchar(50) default NULL,
  `method` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `nextdate` datetime default NULL,
  `duration` varchar(5) default NULL,
  `parameters` text,
  `allowedhost` varchar(255) default NULL,
  `ownerid` varchar(50) default NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_info` */

insert  into `sys_task_info`(`taskid`,`scriptname`,`method`,`startdate`,`enddate`,`nextdate`,`duration`,`parameters`,`allowedhost`,`ownerid`) values (50,'OutboundMessageTask','deliverMessage','2012-03-24 15:00:00',NULL,'2012-03-27 15:07:55','5s',NULL,NULL,NULL),(51,'InboxTask','processMessage','2012-03-24 15:00:00',NULL,'2012-03-27 01:16:30','5s',NULL,NULL,NULL),(52,'InboundMessageTask','fetchMessage','2012-03-24 15:00:00',NULL,'2012-03-26 10:32:10','10s',NULL,NULL,NULL),(53,'FAASAttachmentTask','deliverAttachment','2012-03-24 15:00:00',NULL,'2012-03-25 06:00:20','10s',NULL,NULL,NULL);

/*Table structure for table `sys_task_processing` */

DROP TABLE IF EXISTS `sys_task_processing`;

CREATE TABLE `sys_task_processing` (
  `taskid` int(11) NOT NULL,
  `machineid` varchar(50) default NULL,
  `processdate` datetime default NULL,
  `processhost` varchar(50) default NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_processing` */

/*Table structure for table `sys_task_queue` */

DROP TABLE IF EXISTS `sys_task_queue`;

CREATE TABLE `sys_task_queue` (
  `taskid` int(11) NOT NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_queue` */

insert  into `sys_task_queue`(`taskid`) values (50),(51),(52),(53);

/*Table structure for table `sys_task_suspended` */

DROP TABLE IF EXISTS `sys_task_suspended`;

CREATE TABLE `sys_task_suspended` (
  `taskid` int(11) NOT NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_suspended` */

insert  into `sys_task_suspended`(`taskid`) values (50),(51),(52),(53);

/*Table structure for table `sys_task_taskid` */

DROP TABLE IF EXISTS `sys_task_taskid`;

CREATE TABLE `sys_task_taskid` (
  `taskid` int(11) NOT NULL,
  PRIMARY KEY  (`taskid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_taskid` */

insert  into `sys_task_taskid`(`taskid`) values (54);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
