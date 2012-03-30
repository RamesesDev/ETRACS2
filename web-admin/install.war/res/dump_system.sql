/*
SQLyog Enterprise - MySQL GUI v7.15 
MySQL - 5.0.27-community-nt : Database - @dbname
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

create database if not exists `@dbname`;
USE `@dbname`;

/*Table structure for table `rule_package` */

DROP TABLE IF EXISTS `rule_package`;

CREATE TABLE `rule_package` (
  `ruleset` varchar(50) NOT NULL,
  `rulegroup` varchar(50) NOT NULL,
  `packagename` varchar(255) NOT NULL,
  `orderindex` int(11) default NULL,
  `type` varchar(10) default NULL,
  `content` text,
  `lastmodified` datetime default NULL,
  PRIMARY KEY  (`ruleset`,`rulegroup`,`packagename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rule_package` */

insert  into `rule_package`(`ruleset`,`rulegroup`,`packagename`,`orderindex`,`type`,`content`,`lastmodified`) values ('bpassessment','','bp.assessment.facts',NULL,'facts','package bp.assessment.facts\r\n\r\ndeclare ApplicationFact\r\n	appid             : String \r\n	applicationtype   : String    \r\n	organization      : String    \r\n	officetype        : String    \r\n	barangayid        : String\r\nend \r\n\r\ndeclare LOBFact\r\n	appid            : String	\r\n	lobid            : String  	\r\n	name             : String \r\n	assessmenttype   : String  \r\n	classificationid : String \r\n	attributes       : java.util.List \r\nend\r\n\r\ndeclare InputVariableFact \r\n	appid   : String \r\n	lobid   : String \r\n	varid   : String\r\n	varname : String \r\n	vartype : String \r\n	value   : Object\r\n	systype : String\r\nend \r\n\r\ndeclare TaxFeeFact\r\n	appid : String \r\n	lobid : String \r\n	acctid  : String \r\n	assessedvalue : Double\r\n	amountdue     : Double \r\nend \r\n\r\ndeclare TaxFeeSummaryFact\r\n	appid   : String\r\n	name    : String\r\n	acctid  : String\r\n	value   : Double\r\nend \r\n\r\ndeclare HighestComputed\r\n	appid : String \r\n	acctid : String\r\nend \r\n\r\ndeclare NotHighestComputed\r\n	appid : String \r\n	acctid : String\r\nend \r\n\r\ndeclare LowestComputed\r\n	appid : String \r\n	acctid : String\r\nend \r\n\r\ndeclare NotLowestComputed\r\n	appid : String \r\n	acctid : String\r\nend \r\n\r\n\r\n\r\n',NULL),('bpbilling','','bp.billing.facts',0,'facts','package bp.billing.facts\r\n\r\ndeclare CurrentYearFact\r\n	year  : Integer\r\n	qtr   : Integer\r\n	month : Integer\r\n	day   : Integer\r\nend\r\n\r\ndeclare BPLedgerFact\r\n	ledgerid      : String\r\n	yearstarted   : Integer\r\n	lastyearpaid  : Integer\r\n	lastqtrpaid   : Integer\r\nend\r\n\r\ndeclare TaxFeeFact\r\n	ledgerid  : String\r\n	appid     : String \r\n	taxfeeid  : String \r\n	lobid     : String\r\n	lobname   : String\r\n	rulename  : String\r\n	year      : Integer\r\n	qtr       : Integer\r\n	monthsfromjan : Integer\r\n	monthsfromqtr : Integer\r\n	daysfromjan : Integer\r\n	daysfromqtr : Integer\r\n	acctid    : String\r\n	accttitle : String\r\n	amount    : Double\r\n	surchargeacctid : String \r\n	surchargeaccttitle : String \r\n	surcharge   : Double \r\n	interestacctid : String	\r\n	interestaccttitle : String \r\n	interest  : Double\r\n	discount  : Double\r\n	expr      : String \r\n	varlist   : java.util.Map\r\n	applysurcharge	: Boolean\r\n	applydiscount	: Boolean\r\nend\r\n   \r\n',NULL),('bpbillingx','','bp.billing.facts',0,'facts','package bp.billing.facts\r\n\r\ndeclare CurrentYearFact\r\n	year  : Integer\r\n	qtr   : Integer\r\n	month : Integer\r\n	day   : Integer\r\nend\r\n\r\ndeclare BPLedgerFact\r\n	ledgerid      : String\r\n	yearstarted   : Integer\r\n	lastyearpaid  : Integer\r\n	lastqtrpaid   : Integer\r\nend\r\n\r\n\r\ndeclare TaxFeeFact\r\n	taxfeeid  : String \r\n	ledgerid  : String\r\n	lobid     : String\r\n	lobname   : String\r\n	rulename  : String\r\n	year      : Integer\r\n	qtr       : Integer\r\n	monthsfromjan : Integer\r\n	monthsfromqtr : Integer\r\n	acctid    : String\r\n	accttitle : String\r\n	amount    : Double\r\n	surchargeacctid : String \r\n	surchargeaccttitle : String \r\n	surcharge   : Double \r\n	intacctid : String	\r\n	intaccttitle : String \r\n	interest  : Double\r\n	discount  : Double\r\nend\r\n   \r\ndeclare InputVariableFact \r\n	taxfeeid : String \r\n	ledgerid : String \r\n	varid    : String \r\n	varname  : String\r\n	value    : Double \r\nend    ',NULL),('rptbilling','','etracs2.rpt.billing.facts',NULL,'facts','package etracs2.rpt.billing.facts;\r\n\r\ndeclare CurrentYearFact\r\n        factname  : String\r\n	year  : Integer\r\n	qtr   : Integer\r\n	month : Integer\r\n	day   : Integer\r\nend\r\n\r\ndeclare RPTLedgerFact\r\n    rptledgerid             : String\r\n    factname                : String\r\n    firstitem               : Boolean\r\n    ledgerid                : String\r\n    rulename                : String\r\n    tdno                    : String \r\n    year                    : Integer\r\n    qtr                     : Integer \r\n    assessedvalue           : Double\r\n    txntype                 : String \r\n    rputype                 : String \r\n    classid                 : String\r\n    actualuseid             : String\r\n    numberofmonthsfromqtr   : Integer\r\n    numberofmonthsfromjan   : Integer\r\n    firstqtrpaidontime      : Boolean\r\n    qtrlypaymentavailed     : Boolean\r\n    backtax                 : Boolean \r\n    fullpayment             : Boolean \r\n    advancepayment          : Boolean \r\n    lastyearpaid            : Integer\r\n    lastqtrpaid             : Integer \r\n\r\n    revtype                 : String\r\n    basic                   : Double\r\n    basicint 	            : Double\r\n    basicdisc   	    : Double\r\n    sef                     : Double\r\n    sefint                  : Double\r\n    sefdisc                 : Double\r\n    \r\n    basicacctid             : String \r\n    basicintacctid          : String \r\n    sefacctid               : String \r\n    sefintacctid            : String \r\n\r\n    partialbasic            : Double\r\n    partialsef              : Double	\r\n\r\n    varlist                 : java.util.Map\r\n    expr                    : String \r\nend     \r\n\r\n',NULL);

/*Table structure for table `rule_sets` */

DROP TABLE IF EXISTS `rule_sets`;

CREATE TABLE `rule_sets` (
  `name` varchar(50) NOT NULL default '',
  `rulegroup` varchar(50) NOT NULL,
  PRIMARY KEY  (`name`,`rulegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rule_sets` */

insert  into `rule_sets`(`name`,`rulegroup`) values ('bpassessment',''),('bpbilling',''),('rptbilling',''),('test','');

/*Table structure for table `sys_async_response` */

DROP TABLE IF EXISTS `sys_async_response`;

CREATE TABLE `sys_async_response` (
  `objid` varchar(50) NOT NULL,
  `requestId` varchar(50) default NULL,
  `data` blob,
  `expiryDate` datetime default NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_async_response` */

/*Table structure for table `sys_cache` */

DROP TABLE IF EXISTS `sys_cache`;

CREATE TABLE `sys_cache` (
  `id` varchar(50) NOT NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `host` (`host`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `sys_cache` */

/*Table structure for table `sys_cluster_host` */

DROP TABLE IF EXISTS `sys_cluster_host`;

CREATE TABLE `sys_cluster_host` (
  `name` varchar(50) NOT NULL,
  `context` varchar(50) default NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sys_cluster_host` */

/*Table structure for table `sys_content_fragment` */

DROP TABLE IF EXISTS `sys_content_fragment`;

CREATE TABLE `sys_content_fragment` (
  `id` varchar(50) NOT NULL,
  `pageid` varchar(50) default NULL,
  `section` varchar(50) default NULL,
  `content` mediumtext,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_link_section` (`pageid`,`section`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_content_fragment` */

/*Table structure for table `sys_content_page` */

DROP TABLE IF EXISTS `sys_content_page`;

CREATE TABLE `sys_content_page` (
  `id` varchar(50) NOT NULL,
  `path` varchar(255) NOT NULL,
  `template` varchar(50) NOT NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_content_page` */

/*Table structure for table `sys_ds` */

DROP TABLE IF EXISTS `sys_ds`;

CREATE TABLE `sys_ds` (
  `name` varchar(50) NOT NULL,
  `host` varchar(20) default NULL,
  `dbname` varchar(50) default NULL,
  `user` varchar(50) default NULL,
  `pwd` varchar(50) default NULL,
  `scheme` varchar(10) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_ds` */

/*Table structure for table `sys_module` */

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `name` varchar(50) NOT NULL,
  `title` varchar(50) default NULL,
  `description` varchar(255) default NULL,
  `version` decimal(10,4) default NULL,
  `filename` varchar(255) default NULL,
  `lastmodified` datetime default NULL,
  `permissions` mediumtext,
  PRIMARY KEY  (`name`),
  UNIQUE KEY `filename` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_module` */

insert  into `sys_module`(`name`,`title`,`description`,`version`,`filename`,`lastmodified`,`permissions`) values ('bp2','BPLS',NULL,NULL,NULL,NULL,'[\r\n [action:\'bpadmin.setting\',                   title:\'Manage Business Settings\'],\r\n [action:\'bpadmin.bprulevariable\',                   title:\'Manage Business Variable\'],\r\n [action:\'bpadmin.lobattributes\',              title:\'Manage LOB Attributes\'],\r\n [action:\'bpadmin.bpruleanalyzer\',              title:\'Manage Rule Analyzer\'],\r\n\r\n [action:\'bpadmin.newrule\',                   title:\'Create New Business Rule\'],\r\n [action:\'bpadmin.openrule\',                   title:\'Open Business Rule\'],\r\n [action:\'bpadmin.deleterule\',                   title:\'Delete Business Rule\'],\r\n \r\n [action:\'bpadmin.lob\',                          title:\'Create View and Update Line Of Business Transaction\'],\r\n [action:\'bpadmin.lobclassification\',            title:\'Create View and Update Line Of Business Classification Transaction\'],\r\n \r\n [action:\'bpbillingrules.view\'			,title:\'View BP Billing Rules\' ],\r\n [action:\'bpbillingrules.create\'		,title:\'Create BP Billing Rule\' ],\r\n [action:\'bpbillingrules.delete\'		,title:\'Delete BP Billing Rule\' ],\r\n\r\n [action:\'bpassessmentrule.view\'		,title:\'View BP Assessment Rules\' ],\r\n [action:\'bpassessmentrule.create\'		,title:\'Create BP Assessment Rule\' ],\r\n [action:\'bpassessmentrule.delete\'		,title:\'Delete BP Assessment Rule\' ],\r\n [action:\'bpbilling.generate\',                title:\'Generate BP Billing\'],\r\n\r\n [action:\'bpmanagement.open\'		,title:\'Manage Master Files\' ],\r\n \r\n\r\n  [action:\'bplicensing.newtransaction\',		title:\'Create New Application Transaction\'],\r\n  [action:\'bplicensing.renewtransaction\',		title:\'Create Renew Application Transaction\'],\r\n  [action:\'bplicensing.addlobtransaction\',		title:\'Create Add Line of Business Application Transaction\'],\r\n  [action:\'bplicensing.retiretransaction\',		title:\'Create Retire Application Transaction\'],\r\n  [action:\'bplicensing.capturenewtransaction\',		title:\'Create Capture New Application Transaction\'],\r\n  [action:\'bplicensing.capturerenewtransaction\',		title:\'Create Capture Renew Application Transaction\'],\r\n  \r\n  [action:\'bplicensing.save\',                title:\'Save Application Transaction\'],\r\n  [action:\'bplicensing.edit\',                title:\'Edit Application Transaction\'],\r\n  [action:\'bplicensing.delete\',                title:\'Delete Application Transaction\'],\r\n  [action:\'bplicensing.submit\',                title:\'Submit Application Transaction\'],\r\n  \r\n  [action:\'bplicensing.applicationlist\',       title:\'View Application Listing\'],\r\n  [action:\'bplicensing.viewapplication\',         title:\'View Business Application\'],\r\n  [action:\'bplicensing.viewassessment\',         title:\'View Business Assessment\'],\r\n  [action:\'bplicensing.approve\',                title:\'Approve Business Application\'],\r\n  [action:\'bplicensing.disapprove\',                title:\'Disapprove Business Application\'],\r\n  [action:\'bplicensing.submitforreview\',                title:\'Submit Business Application For Review\'],\r\n  [action:\'bplicensing.reassess\',                title:\'Reassess Business Application For Review\'],\r\n  [action:\'bplicensing.assess\',                title:\'Assess Business Application\'],\r\n  [action:\'bplicensing.cancelassessment\',                title:\'Cancel Assessment\'],\r\n  [action:\'bpbilling.generate\',                title:\'Generate BP Billing\'],\r\n  \r\n [action:\'bptransaction.view\'		,title:\'View Business Transactions\'],\r\n[action:\'bpadmin.changebusinessaddress\',        title:\'Allow Change Business Address Transaction\'],\r\n [action:\'bpadmin.changepermittee\',              title:\'Allow Change Permittee Transaction\'],\r\n [action:\'bpadmin.changetradename\',              title:\'Allow Change Trade Name\'],\r\n [action:\'bpadmin.changeadministrator\',          title:\'Change Business Administrator\'],\r\n\r\n[action:\'bpadmin.ledger\',                       title:\'Manage Business Ledger\'],\r\n\r\n [action:\'bpreportmgmt.open\'		,title:\'View Report Management\' ],\r\n [action:\'bpreport.delinquency\'		,title:\'Generate Delinquency Listing\' ],\r\n [action:\'bpreport.masterlist\'		,title:\'Generate Taxpayer Masterlist\' ],\r\n [action:\'bpreport.applisting\'		,title:\'Generate Application Listing\' ],\r\n [action:\'bpreport.apploblisting\'	,title:\'Generate Application With LOB Listing\' ],\r\n [action:\'bpreport.lobcountlisting\'	,title:\'Generate LOB Count Listing\' ],\r\n \r\n\r\n\r\n [action:\'bppermit.approvedapplications\',         title:\'View Approved Business Applications\'],\r\n [action:\'bppermit.forreleasepermits\',         title:\'View For Relased Permits\'],\r\n [action:\'bppermit.activepermits\',         title:\'View Active Permits\'],\r\n [action:\'bppermit.activepermits\',         title:\'View Active Permits\'],	\r\n [action:\'bppermit.release\',         title:\'View Active Permits\'],\r\n [action:\'bppermit.retire\',          title:\'View Retired Applications\'],\r\n [action:\'bppermit.forrenewapplications\',          title:\'View Retired Applications\']\r\n\r\n [action:\'collection_bp.create\',	 title:\'Create Business Collection\'],\r\n [action:\'collection_bp.print\',	         title:\'Print Business Collection\'],\r\n [action:\'collection_bp.edit\',	         title:\'Edit Business Collection\'],\r\n [action:\'collection_bp.void\',	         title:\'Void Business Collection\'],\r\n]'),('etracs2-admin','Admin',NULL,NULL,NULL,NULL,'[\r\n [action:\'etracsadmin.manage\'  ,title:\'Manage ETRACS User Accounts\'],\r\n [action:\'etracsuser.edit\'     ,title:\'Edit ETRACS User Account\'],\r\n [action:\'etracstask.manage\'   ,title:\'Manage Task\'],\r\n [action:\'etracstask.create\'   ,title:\'Create Task\'],\r\n [action:\'etracstask.delete\'   ,title:\'Delete Task\'],\r\n [action:\'etracstask.start\'    ,title:\'Start Task\'],\r\n [action:\'etracstask.suspend\'  ,title:\'Suspend Task\'],\r\n [action:\'etracstask.resume\'   ,title:\'Resume Task\'],\r\n]'),('etracs2common','Shared',NULL,NULL,NULL,NULL,'[\r\n  [action:\'entity.manage\',	title:\'Manage Entity\'],\r\n  [action:\'individual.create\',    title:\'Create Individual Entity\'],\r\n  [action:\'individual.edit\',    	title:\'Edit Individual Entity\'],\r\n  [action:\'individual.delete\',    title:\'Delete Individual Entity\'],\r\n  [action:\'juridical.create\',    	title:\'Create Juridical Entity\'],\r\n  [action:\'juridical.edit\',    	title:\'Edit Juridical Entity\'],\r\n  [action:\'juridical.delete\',    	title:\'Delete Juridical Entity\'],\r\n  [action:\'multiple.create\',    	title:\'Create Multiple Entity\'],\r\n  [action:\'multiple.edit\',    	title:\'Edit Multiple Entity\'],\r\n  [action:\'multiple.delete\',    	title:\'Delete Multiple Entity\'],\r\n\r\n   [action:\'lgu.management\', 	title:\'Manage LGU\']\r\n\r\n [action:\'rule.manage\',		title:\'Manage Rules\'],\r\n]'),('jobposition','Jobposition Management',NULL,NULL,NULL,NULL,'[\r\n	[action:\"jobposition.viewList\"]\r\n]'),('orgunit','Org. Unit Management',NULL,NULL,'orgunit',NULL,'[\r\n	[action:\"orgunit.viewList\"],\r\n	[action:\"orgunit.create\"],\r\n	[action:\"orgunit.read\"],\r\n	[action:\"orgunit.update\"],\r\n	[action:\"orgunit.delete\"],\r\n\r\n	[action:\"controller1.create\"],\r\n	[action:\"controller1.read\"],\r\n	[action:\"controller1.update\"],\r\n	[action:\"controller1.delete\"],\r\n	[action:\"controller1.approve\"],\r\n	[action:\"controller1.disapprove\"],\r\n\r\n	[action:\"controller2.post\"],\r\n	[action:\"controller2.submit\"],\r\n	[action:\"controller2.approve\"],\r\n	[action:\"controller2.disapprove\"],\r\n]'),('personnel','Personnel Management',NULL,NULL,'personnel',NULL,'[\r\n	[action: \"personnel.viewList\"]\r\n]'),('role','Role Management',NULL,NULL,NULL,NULL,'[\r\n	[action: \"role.viewList\"]\r\n]'),('rpt2','RPT Assessment',NULL,NULL,NULL,NULL,'[\r\n [ action:\'rpttransaction.open\' 		,title:\'OPEN RPT Transaction\' ],\r\n\r\n [ action:\'consolidation.view\'  		,title:\'View Consolidation\' ],\r\n [ action:\'consolidation.update\' 		,title:\'Update Consolidation\' ],\r\n [ action:\'consolidation.edit\'  		,title:\'Edit Consolidation\' ],\r\n [ action:\'consolidation.submit\' 		,title:\'Submit Consolidation\' ],\r\n [ action:\'consolidation.remove\' 		,title:\'Remove Consolidation\' ],\r\n [ action:\'consolidation.updateland\' 			,title:\'Update Land Consolidation\' ],\r\n \r\n [ action:\'consolidationmgt.view\' 		,title:\'View Consolidation Management\' ],\r\n [ action:\'consolidationmgt.create\' 	,title:\'Create Consolidation Management\' ],\r\n [ action:\'consolidationmgt.view\' 		,title:\'Approve Consolidation Management\' ],\r\n \r\n [ action:\'datacapture.create\' 		,title:\'Create FAAS Data Capture\' ],\r\n [ action:\'transfer.create\' 		,title:\'Create Transfer of Ownership\' ],\r\n [ action:\'reassessment.create\' 	,title:\'Create Reassessment\' ],\r\n [ action:\'correction.create\' 		,title:\'Create Correction of Entry\' ],\r\n [ action:\'newdiscovery.create\' 	,title:\'Create New Discovery\' ],\r\n [ action:\'multipleclaim.create\' 	,title:\'Create Multiple Claim\' ],\r\n \r\n [ action:\'cancelfaasmgt.view\'		,title:\'View Cancel FAAS Management\' ],\r\n [ action:\'cancelfaasmgt.create\'	,title:\'Create Cancel FAAS Management\' ], \r\n [ action:\'cancelfaasmgt.open\'		,title:\'Open Cancel FAAS Management\' ],\r\n\r\n [ action:\'cancelfaas.create\'		,title:\'Create Cancel FAAS\' ],\r\n [ action:\'cancelfaas.edit\'		,title:\'Edit Cancel FAAS\' ],\r\n [ action:\'cancelfaas.open\'		,title:\'Open Cancel FAAS\' ],\r\n [ action:\'cancelfaas.submit\'		,title:\'Submit Cancel FAAS for approval\' ],\r\n [ action:\'cancelfaas.delete\'		,title:\'Delete Cancel FAAS\' ],\r\n [ action:\'cancelfaas.approve\'		,title:\'Approve Cancel FAAS\' ],\r\n\r\n\r\n [ action:\'faasmgt.view\'		,title:\'View FAAS Management\' ],\r\n [ action:\'faasmgt.create\'		,title:\'Create FAAS Management\' ],\r\n\r\n [ action:\'faas.create\'			,title:\'Create FAAS\' ],\r\n [ action:\'faas.open\'			,title:\'Open FAAS\' ],\r\n [ action:\'faas.submit\'			,title:\'Submit FAAS for approval\' ],\r\n [ action:\'faas.delete\'			,title:\'Delete FAAS\' ],\r\n [ action:\'faas.disapprove\'		,title:\'Dispprove FAAS\' ],\r\n [ action:\'faas.approve\'		,title:\'Approve FAAS\' ],\r\n [ action:\'faas.submittoprovince\'	,title:\'Submit to Province FAAS\' ],\r\n [ action:\'faas.disapprove\'		,title:\'Disapprove FAAS\' ],\r\n [ action:\'faas.approvebyprovince\'	,title:\'Approve By Province FAAS\' ],\r\n \r\n [ action:\'subdivision.view\' 		,title:\'View Subdivision\' ],\r\n [ action:\'subdivision.open\' 		,title:\'View Subdivision\' ],\r\n [ action:\'subdivision.create\'		,title:\'Create Subdivision\' ],\r\n [ action:\'subdivision.update\' 			,title:\'Update Subdivision\' ],\r\n [ action:\'subdivision.submit\' 			,title:\'Submit Subdivision\' ],\r\n [ action:\'subdivision.remove\' 			,title:\'Remove Subdivision\' ],\r\n \r\n [ action:\'subdivisionmgt.view\'		,title:\'View Subdivision Management\' ],\r\n [ action:\'subdivisionmgt.open\'		,title:\'Open Subdivision Management\' ],\r\n [ action:\'subdivisionmgt.create\'	,title:\'Create Subdivision Management\' ],\r\n \r\n [ action:\'truecopy.view\'			,title:\'View Certified True Copy\' ],\r\n [ action:\'truecopy.create\'			,title:\'Create Certified True Copy\' ],\r\n [ action:\'truecopy.viewReport\'		,title:\'View Report Certified True Copy\' ],\r\n\r\n [ action:\'rpttransaction.view\'		,title:\'View Real Property Transactions\'],\r\n \r\n [ action:\'consolidation.disapprove\' 			,title:\'Disapprove Consolidation\' ],\r\n [ action:\'consolidation.approve\' 				,title:\'Approve Consolidation\' ],\r\n \r\n [ action:\'consolidation.disapproveByProvince\' 	,title:\'Disapprove by Province Consolidation\' ],\r\n [ action:\'consolidation.approveByProvince\'	,title:\'Approve By Province Consolidation\' ],\r\n\r\n [ action:\'consolidation.submitToProvince\' 	,title:\'Disapprove by Province Consolidation\' ],\r\n \r\n [ action:\'datacapture.approve\' 				,title:\'Approve Data Capture\' ],\r\n [ action:\'datacapture.disapprove\'				,title:\'Disapprove Data Capture\' ],\r\n \r\n [ action:\'datacapture.submitToProvince\' 		,title:\'Submit to Province Data Capture\' ],\r\n [ action:\'datacapture.disapproveByProvince\'	,title:\'Disapprove by Province Data Capture\' ],\r\n [ action:\'datacapture.approveByProvince\'		,title:\'Approve By Province Data Capture\' ],\r\n \r\n [ action:\'subdivision.disapprove\' 				,title:\'Disapprove Subdivision\' ],\r\n [ action:\'subdivision.approve\' 				,title:\'Approve Subdivision\' ],\r\n [ action:\'subdivision.submitToProvince\' 		,title:\'Submit to Province Subdivision\' ],\r\n [ action:\'subdivision.disapproveByProvince\' 	,title:\'Disapprove By Province Subdivision\' ],\r\n [ action:\'subdivision.approveByProvince\' 		,title:\'Appry By Province Subdivision\' ],\r\n\r\n\r\n	[ action: \'rptcertification_list.view\', title: \'RPT Certifications List View\' ],\r\n	\r\n	[ action: \'rptcertifications.open\', title: \'RPT Certifications Open\' ],\r\n	\r\n	[ action: \'noproperty.open\', 	title: \'RPT Certifications No Property Open\' ],\r\n	[ action: \'noproperty.view\', 	title: \'RPT Certifications No Property View\' ],\r\n	[ action: \'noproperty.create\', 	title: \'RPT Certifications No Property Create\' ],\r\n	\r\n	[ action: \'landholding.open\', 		title: \'RPT Certifications Land Holding Open\' ],\r\n	[ action: \'landholding.view\', 		title: \'RPT Certifications Land Holding View\' ],\r\n	[ action: \'landholding.create\', 	title: \'RPT Certifications Land Holding Create\' ],\r\n	\r\n	[ action: \'multipleproperty.open\', 		title: \'RPT Certifications Multiple Property Open\' ],\r\n	[ action: \'multipleproperty.view\', 		title: \'RPT Certifications Multiple Property View\' ],\r\n	[ action: \'multipleproperty.create\', 	title: \'RPT Certifications Multiple Property Create\' ],\r\n	\r\n	[ action: \'noimprovement.open\', 	title: \'RPT Certifications No Improvement Open\' ],\r\n	[ action: \'noimprovement.view\', 	title: \'RPT Certifications No Improvement View\' ],\r\n	[ action: \'noimprovement.create\', 	title: \'RPT Certifications No Improvement Create\' ],\r\n	\r\n	[ action: \'noimprovement.open\', 	title: \'RPT Certifications No Improvement Open\' ],\r\n	[ action: \'noimprovement.view\', 	title: \'RPT Certifications No Improvement View\' ],\r\n	[ action: \'noimprovement.create\', 	title: \'RPT Certifications No Improvement Create\' ],\r\n	\r\n	[ action: \'noimprovementbytdno.open\', 		title: \'RPT Certifications No Improvement By TD No Open\' ],\r\n	[ action: \'noimprovementbytdno.view\', 		title: \'RPT Certifications No Improvement By TD No View\' ],\r\n	[ action: \'noimprovementbytdno.create\', 	title: \'RPT Certifications No Improvement By TD No Create\' ],\r\n	\r\n	[ action: \'noimprovementbytdno.open\', 		title: \'RPT Certifications No Improvement By TD No Open\' ],\r\n	[ action: \'noimprovementbytdno.view\', 		title: \'RPT Certifications No Improvement By TD No View\' ],\r\n	[ action: \'noimprovementbytdno.create\', 	title: \'RPT Certifications No Improvement By TD No Create\' ],\r\n	\r\n	[ action: \'latestexistproperty.open\', 		title: \'RPT Certifications Latest Exist Property Open\' ],\r\n	[ action: \'latestexistproperty.view\', 		title: \'RPT Certifications Latest Exist Property View\' ],\r\n	[ action: \'latestexistproperty.create\', 	title: \'RPT Certifications Latest Exist Property Create\' ],\r\n	\r\n	[ action: \'latestexistproperty.open\', 		title: \'RPT Certifications Latest Exist Property Open\' ],\r\n	[ action: \'latestexistproperty.view\', 		title: \'RPT Certifications Latest Exist Property View\' ],\r\n	[ action: \'latestexistproperty.create\', 	title: \'RPT Certifications Latest Exist Property Create\' ],\r\n	\r\n	[ action: \'withimproveland.open\', 		title: \'RPT Certifications With Improvement ( Land ) Open\' ],\r\n	[ action: \'withimproveland.view\', 		title: \'RPT Certifications With Improvement ( Land ) View\' ],\r\n	[ action: \'withimproveland.create\', 	title: \'RPT Certifications With Improvement ( Land ) Create\' ],\r\n	\r\n	[ action: \'wimprovebytdno.open\', 	title: \'RPT Certifications With Improvement By TD No Open\' ],\r\n	[ action: \'wimprovebytdno.view\', 	title: \'RPT Certifications With Improvement By TD No View\' ],\r\n	[ action: \'wimprovebytdno.create\', 	title: \'RPT Certifications With Improvement By TD No Create\' ],\r\n\r\n [ action:\'rptreport.notice\'		,title:\'Generate Notice of Assessment\' ],\r\n [ action:\'rptreport.assessmentroll\'    ,title:\'Generate Assessment Roll\' ],\r\n [ action:\'rptreportmgmt.open\'		,title:\'Open Report Management\' ],\r\n [ action:\'rptreport.tmcr\'		,title:\'Generate TMCR Report\' ],\r\n [ action:\'rptreport.orf\'  		,title:\'Generate Ownership Record Form\' ], \r\n [ action:\'rptreport.jat\' 		,title:\'Generate Journal of Assessment Transaction\' ],\r\n [ action:\'rptreport.accomplishmentrpa\' ,title:\'Generate Accomplishment Report on Real Property Assessment\'],\r\n [ action:\'rptreport.comparativeav\'	,title:\'Generate Comparative Data On Assessed Value\' ],\r\n [ action:\'rptreport.comparativerpucount\',title:\'Generate Comparative Data on RPU Count\' ],\r\n [ action:\'rptreport.comparativemv\'	,title:\'Generate Comparative Data on Market Value\' ],\r\n [ action:\'rptreport.annotationlisting\' ,title:\'Generate Annotation Listing\' ],\r\n\r\n [ action:\'rptbilling.generate\'		,title:\'Generate Real Property Billing\' ],\r\n [ action:\'rptbilling.printbill\'	,title:\'Print Real Property Billing\' ],\r\n [ action:\'rptbilling.previewbill\'	,title:\'Preview Real Property Billing\' ],\r\n\r\n\r\n [ action:\'rptledger.view\'		,title:\'View RPT Ledger\' ], \r\n [ action:\'rptledger.open\'		,title:\'Open RPT Ledger\' ], \r\n [ action:\'rptledger.approve\'		,title:\'Approve RPT Ledger\' ],\r\n [ action:\'rptledger.capturepayment\'    ,title:\'Capture RPT Ledger Payment\' ],\r\n [ action:\'rptledger.printbill\'		,title:\'Print RPT Bill\' ],\r\n [ action:\'rptledger.previewbill\'	,title:\'Preview RPT Bill\' ],\r\n\r\n [ action:\'propertypayer.view\'		,title:\'View Property Payers\' ],\r\n [ action:\'propertypayer.create\'	,title:\'Create Property Payer\' ],\r\n [ action:\'propertypayer.delete\'	,title:\'Delete Property Payer\' ],\r\n\r\n [ action:\'rptbillingrule.view\'		,title:\'View RPT Billing Rules\' ],\r\n [ action:\'rptbillingrule.create\'	,title:\'Create RPT Billing Rule\' ],\r\n [ action:\'rptbillingrule.delete\'	,title:\'Delete RPT Billing Rule\' ],\r\n\r\n\r\n [action:\'landtax.abstractrptcollection\'	,title:\'Generate Abstract of Realty Tax Collection\' ],\r\n [action:\'landtax.brgyshare\'			,title:\'Generate Barangay Share\' ],\r\n [ action:\'rptreport.delinquency\'	,title:\'Generate Realty Tax Delinquency Listing\' ],\r\n [ action:\'landtax.rptc\'		,title:\'Real Property Tax Collection\' ],\r\n\r\n [action:\'rptmanagement.open\'			,title:\'Open RPT Master Management\'],\r\n [action:\'rysetting.view\',			,title:\'View General Revision Year Setting\'],\r\n	\r\n [action:\'propertyclassification.view\'		,title:\'View Property Classifications\' ],\r\n [action:\'propertyclassification.create\'	,title:\'Create Property Classification\' ] ,\r\n [action:\'propertyclassification.edit\'		,title:\'Edit Property Classification\' ] ,\r\n [action:\'propertyclassification.delete\'	,title:\'Delete Property Classification\' ] ,\r\n\r\n [action:\'exemptiontypes.view\'			,title:\'View Exemption Types\' ] ,\r\n [action:\'exemptiontypes.create\'		,title:\'Create Exemption Types\' ] ,\r\n [action:\'exemptiontypes.edit\'			,title:\'Edit Exemption Types\' ] ,\r\n [action:\'exemptiontypes.delete\'		,title:\'Delete Exemption Types\' ] ,\r\n \r\n [action:\'kindofbldg.view\'			,title:\'View Kind of Building\' ] ,\r\n [action:\'kindofbldg.create\'			,title:\'Create Kind of Building\' ] ,\r\n [action:\'kindofbldg.edit\'			,title:\'Edit Kind of Building\' ] ,\r\n [action:\'kindofbldg.delete\'			,title:\'Delete Kind of Building\' ] ,\r\n\r\n [action:\'materials.view\'			,title:\'View Materials\' ] ,\r\n [action:\'materials.create\'			,title:\'Create Materials\' ] ,\r\n [action:\'materials.edit\'			,title:\'Edit Materials\' ] ,\r\n [action:\'materials.delete\'			,title:\'Delete Materials\' ] ,\r\n\r\n [action:\'structures.view\'			,title:\'View Structures\' ] ,\r\n [action:\'structures.create\'			,title:\'Create Structures\' ] ,\r\n [action:\'structures.edit\'			,title:\'Edit Structures\' ] ,\r\n [action:\'structures.delete\'			,title:\'Delete Structures\' ] ,\r\n\r\n [action:\'structuretemplates.view\'		,title:\'View Structure Templates\' ] ,\r\n [action:\'structuretemplates.edit\'		,title:\'Edit Structure Templates\' ] ,\r\n\r\n [action:\'machines.view\'			,title:\'View Machines\' ] ,\r\n [action:\'machines.create\'			,title:\'Create Machines\' ] ,\r\n [action:\'machines.edit\'			,title:\'Edit Machines\' ] ,\r\n [action:\'machines.delete\'			,title:\'Delete Machines\' ] ,\r\n \r\n [action:\'plantstrees.view\'			,title:\'View Plants and Trees\' ] ,\r\n [action:\'plantstrees.create\'			,title:\'Create Plants and Trees\' ] ,\r\n [action:\'plantstrees.edit\'			,title:\'Edit Plants and Trees\' ] ,\r\n [action:\'plantstrees.delete\'			,title:\'Delete Plants and Trees\' ] ,\r\n \r\n [action:\'miscitems.view\'			,title:\'View Miscellaneous Items\' ] ,\r\n [action:\'miscitems.create\'			,title:\'Create Miscellaneous Items\' ] ,\r\n [action:\'miscitems.edit\'			,title:\'Edit Miscellaneous Items\' ] ,\r\n [action:\'miscitems.delete\'			,title:\'Delete Miscellaneous Items\' ] ,\r\n\r\n [action:\'rptofficers.view\'			,title:\'View RPT OFFICERS\' ] ,\r\n [action:\'rptofficers.create\'			,title:\'Create RPT OFFICERS\' ] ,\r\n [action:\'rptofficers.edit\'			,title:\'Edit RPT OFFICERS\' ] ,\r\n [action:\'rptofficers.delete\'			,title:\'Delete RPT OFFICERS\' ] ,\r\n\r\n [action:\'canceltdreasons.view\'			,title:\'View Cancel TD Reasons\' ] ,\r\n [action:\'canceltdreasons.create\'		,title:\'Create Cancel TD Reasons\' ] ,\r\n [action:\'canceltdreasons.edit\'			,title:\'Edit Cancel TD Reasons\' ] ,\r\n [action:\'canceltdreasons.delete\'		,title:\'Delete Cancel TD Reasons\' ] ,\r\n\r\n [action:\'txnrequirements.view\'			,title:\'View Transaction Requirements\' ] ,\r\n [action:\'txnrequirements.create\'		,title:\'Create Transaction Requirements\' ] ,\r\n [action:\'txnrequirements.edit\'			,title:\'Edit Transaction Requirements\' ] ,\r\n [action:\'txnrequirements.delete\'		,title:\'Delete Transaction Requirements\' ] ,\r\n\r\n [action:\'rptparameters.view\'			,title:\'View RPT Parameters\' ] ,\r\n [action:\'rptparameters.create\'			,title:\'Create RPT Parameters\' ] ,\r\n [action:\'rptparameters.edit\'			,title:\'Edit RPT Parameters\' ] ,\r\n [action:\'rptparameters.delete\'			,title:\'Delete RPT Parameters\' ] ,\r\n\r\n [action:\'rptsetting.view\'			,title:\'View RPT Settings\' ] ,\r\n [action:\'rptsetting.save\'			,title:\'Save RPT Settings\' ] ,\r\n \r\n\r\n [action:\'annotationmgmt.view\'		,title:\'Manage Annotations\' ],\r\n [action:\'annotation.view\'		,title:\'View Annotation\' ],\r\n [action:\'annotation.delete\'		,title:\'Delete Annotation\' ],\r\n [action:\'annotation.submit\'		,title:\'Submit Annotation for Approval\' ],\r\n [action:\'annotation.approve\'		,title:\'Approve Annotation\' ],\r\n\r\n [action:\'cancelannotationmgmt.view\'	,title:\'Manage Cancelled Annotations\' ],\r\n [action:\'cancelannotation.open\'	,title:\'Open Cancel Annotation\' ],\r\n [action:\'cancelannotation.create\'	,title:\'Create Cancel Annotation\' ],\r\n [action:\'cancelannotation.view\'	,title:\'View Cancel Annotation\' ],\r\n [action:\'cancelannotation.delete\'	,title:\'Delete Cancel Annotation\' ],\r\n [action:\'cancelannotation.submit\'	,title:\'Submit Cancel Annotation for Approval\' ],\r\n [action:\'cancelannotation.approve\'	,title:\'Approve Cancel Annotation\' ],\r\n\r\n [action:\'mortgage.create\'		,title:\'Create Mortgage Annotation\' ],\r\n [action:\'bailbond.create\'		,title:\'Create BailBond Annotation\' ],\r\n [action:\'other.create\'			,title:\'Create Other Annotation\' ],\r\n\r\n [action:\'landtax.rptclearance\'		,title:\'Realty Tax Clearance\'],\r\n\r\n]'),('tc2','Treasury/Collection',NULL,NULL,NULL,NULL,'[\r\n [ action:\'account.view\',           title:\'View Chart of Account\' ],\r\n [ action:\'account.addcategory\',    title:\'Add Account Category\' ],\r\n [ action:\'account.addglacct\',      title:\'Add GL Account\' ],\r\n [ action:\'account.addsubacct\',     title:\'Add Sub-Account\' ],\r\n [ action:\'account.edit\',     title:\'Edit Account Information\' ],\r\n [ action:\'account.delete\',   title:\'Delete Account Information\' ],\r\n\r\n [ action:\'bank.view\',     title:\'View Bank Information\' ],\r\n [ action:\'bank.create\',   title:\'Create Bank\' ],\r\n [ action:\'bank.edit\',     title:\'Edit Bank\' ],\r\n [ action:\'bank.delete\',   title:\'Delete Bank\' ],\r\n\r\n [ action:\'bankacct.view\',     title:\'View Bank Account Information\' ],\r\n [ action:\'bankacct.create\',   title:\'Create Bank Account\' ],\r\n [ action:\'bankacct.edit\',     title:\'Edit Bank Account\' ],\r\n [ action:\'bankacct.delete\',   title:\'Delete Bank Account\' ],\r\n [ action:\'bankacct.approve\',  title:\'Approve Bank Account\' ],\r\n\r\n [ action:\'collectionsetting.manage\', title:\'Manage Collection Setting\' ],\r\n [ action:\'collectiontype.viewlist\',  title:\'View Collection Type Listing\' ],\r\n [ action:\'collectiontype.create\',    title:\'Create Collection Type\' ],\r\n [ action:\'collectiontype.edit\',      title:\'Edit Collection Type\' ],\r\n [ action:\'collectiontype.delete\',    title:\'Delete Collection Type\' ],\r\n\r\n [ action:\'fund.viewlist\',  title:\'View Fund Listing\' ],\r\n [ action:\'fund.create\',    title:\'Create Fund\' ],\r\n [ action:\'fund.edit\',      title:\'Edit Fund\' ],\r\n [ action:\'fund.delete\',    title:\'Delete Fund\' ],\r\n [ action:\'fund.approve\',   title:\'Approve Fund\' ],\r\n\r\n [ action:\'incomeacct.viewlist\',  title:\'View Income Account Listing\' ],\r\n [ action:\'incomeacct.create\',    title:\'Create Income Account\' ],\r\n [ action:\'incomeacct.edit\',      title:\'Edit Income Account\' ],\r\n [ action:\'incomeacct.delete\',    title:\'Delete Income Account\' ],\r\n [ action:\'incomeacct.approve\',   title:\'Approve Income Account\' ],\r\n\r\n [ action:\'incomeacctgroup.viewlist\',  title:\'View Income Account Group Listing\' ],\r\n [ action:\'incomeacctgroup.create\',    title:\'Create Income Account Group\' ],\r\n [ action:\'incomeacctgroup.delete\',    title:\'Delete Income Account Group\' ],\r\n \r\n [ action:\'tcmanagement.open\'	,title:\'Manage TC Master Files\' ],\r\n \r\n\r\n [ action:\'af.viewlist\',  title:\'View Accountable Form Listing\' ],\r\n [ action:\'af.create\',    title:\'Create Accountable Form\' ],\r\n [ action:\'af.edit\',      title:\'Edit Accountable Form\' ],\r\n [ action:\'af.delete\',    title:\'Delete Accountable Form\' ],\r\n [ action:\'af.approve\',   title:\'Approve Accountable Form\' ],\r\n\r\n [ action:\'afcontrol.changemode\',  title:\'AF Control Change Mode\' ],\r\n [ action:\'afcontrol.activate\',    title:\'Activate AF Control\' ],\r\n [ action:\'afcontrol.transfer\'	,title:\'Transfer AF Control\' ],\r\n [ action:\'afcontrol.adjustqty\' ,title:\'Adjust AF Control Quantity (NonSerial)\' ], \r\n \r\n\r\n [ action:\'afinventory.view\', title:\'View AF Inventory Information\' ],\r\n\r\n\r\n [ action:\'deposit.viewlist\',   title:\'View Deposit Listing\' ],\r\n [ action:\'deposit.view\',       title:\'View Deposit Information\' ],\r\n [ action:\'deposit.create\',     title:\'Create Deposit Information\' ],\r\n [ action:\'deposit.close\',      title:\'Close Deposit Information\' ],\r\n [ action:\'deposit.addnoncash\', title:\'Add Non-Cash Payments for Deposit\' ],\r\n [ action:\'deposit.addexternalnoncash\',     title:\'Add External Non-Cash for Deposit\' ],\r\n\r\n [ action:\'collection.create_online\',   title:\'Create Online Collection\'],\r\n [ action:\'collection.create_offline\',  title:\'Create Offline Collection\'],\r\n \r\n [ action:\'remittance.create\',          title:\'Create Remittance\' ],\r\n [ action:\'remittance.submit\',          title:\'Submit Remittance\' ],\r\n [ action:\'remittance.viewlist\',        title:\'View Remittance Listing\' ],\r\n\r\n [ action:\'receipt.viewissued\',    title:\'View Issued Receipt Listing\' ],\r\n [ action:\'receipt.inquire\',       title:\'Inquire Receipt Information\' ],\r\n\r\n [ action:\'afcontrol.activate\',  title:\'Activate AF Control\' ]\r\n\r\n\r\n [action:\'batchcapturemgmt.view\'	,title:\'View Batch Capture Management\'], \r\n [action:\'batchcapture.create\'		,title:\'Create Batch Capture\' ],\r\n [action:\'batchcapture.open\'		,title:\'Open Batch Capture\' ], \r\n [action:\'batchcapture.view\'		,title:\'View Batch Capture\' ],\r\n [action:\'batchcapture.delete\'		,title:\'Delete Batch Capture\' ],\r\n [action:\'batchcapture.post\'		,title:\'Post Batch Capture\' ],\r\n\r\n [ action:\'collection_burial.create\',  title:\'Create Burial Permit Fee Collection\' ],\r\n [ action:\'collection_burial.edit\',    title:\'Edit Burial Permit Fee Collection\' ],\r\n [ action:\'collection_burial.print\',   title:\'Print Burial Permit Fee Collection\' ],\r\n [ action:\'collection_burial.void\',    title:\'Void Burial Permit Fee Collection\' ],\r\n [ action:\'collection_burial.inquire\', title:\'Inquire Burial Permit Fee Collection\' ],\r\n\r\n [ action:\'collection_cashticket.create\',  title:\'Create Cash Ticket Collection\' ],\r\n [ action:\'collection_cashticket.delete\',  title:\'Delete Cash Ticket Collection\' ],\r\n [ action:\'collection_cashticket.inquire\', title:\'Inquire Cash Ticket  Collection\' ],\r\n\r\n [ action:\'collection_cattleownership.create\',  title:\'Create Large Cattle Ownership Collection\' ],\r\n [ action:\'collection_cattleownership.edit\',    title:\'Edit Large Cattle Ownership Collection\' ],\r\n [ action:\'collection_cattleownership.print\',   title:\'Print Large Cattle Ownership Collection\' ],\r\n [ action:\'collection_cattleownership.void\',    title:\'Void Large Cattle Ownership Collection\' ],\r\n [ action:\'collection_cattleownership.inquiry\', title:\'Inquire Large Cattle Ownership  Collection\' ],\r\n\r\n [ action:\'collection_cattletransfer.create\',  title:\'Create Large Cattle Transfer Collection\' ],\r\n [ action:\'collection_cattletransfer.edit\',    title:\'Edit Large Cattle Transfer Collection\' ],\r\n [ action:\'collection_cattletransfer.print\',   title:\'Print Large Cattle Transfer Collection\' ],\r\n [ action:\'collection_cattletransfer.void\',    title:\'Void Large Cattle Transfer Collection\' ],\r\n [ action:\'collection_cattletransfer.inquiry\', title:\'Inquire Large Cattle Transfer  Collection\' ],\r\n\r\n [ action:\'collection_general.create\',  title:\'Create General Collection\' ],\r\n [ action:\'collection_general.edit\',    title:\'Edit General Collection\' ],\r\n [ action:\'collection_general.print\',   title:\'Print General Collection\' ],\r\n [ action:\'collection_general.void\',    title:\'Void General Collection\' ],\r\n [ action:\'collection_general.inquire\', title:\'Inquire General Collection\' ],\r\n\r\n [ action:\'collection_marriage.create\',  title:\'Create Marriage License Fee Collection\' ],\r\n [ action:\'collection_marriage.edit\',    title:\'Edit Marriage License Fee Collection\' ],\r\n [ action:\'collection_marriage.print\',   title:\'Print Marriage License Fee Collection\' ],\r\n [ action:\'collection_marriage.void\',    title:\'Void Marriage License Fee Collection\' ],\r\n [ action:\'collection_marriage.inquiry\', title:\'Inquire Marriage License Fee  Collection\' ],\r\n\r\n [action:\'postcapturereceipt.create\',   title:\'Create Post Capture Receipt\'],\r\n [action:\'postcapturereceipt.post\',     title:\'Submit Post Capture Receipt\'],\r\n\r\n\r\n [action:\'tcreport.abstractofcollection\'	,title:\'Generate Abstract of Collection Report\'],\r\n [action:\'tcreport.abstractofcollectionbychart\' ,title:\'Generate Abstract of Colleciton By Chart of Account\' ],\r\n [action:\'tcreport.incomeaccount\' 		,title:\'Income Account Report\'],\r\n [action:\'tcreport.craaf\'		 	,title:\'CRAAF Report\'],\r\n [action:\'tcreport.statementofrevenue\'		,title:\'Generate Statement of Revenue\'], \r\n [action:\'tcreport.reportofcollection\'		,title:\'Report of Collection\' ],\r\n [action:\'tcreport.reportofcollection2\'		,title:\'Report of Collection 2\' ],\r\n\r\n [action:\'collection_slaughterpermit.inquiry\'		,title:\'Inquire Slaughter Permit\' ],\r\n [action:\'collection_slaughterpermit.create\'		,title:\'Create Slaughter Permit\'],\r\n [action:\'collection_slaughterpermit.print\'		,title:\'Print Slaughter Permit\' ],\r\n [action:\'collection_slaughterpermit.void\'		,title:\'Void Slaughter Permit\' ],\r\n [action:\'collection_slaughterpermit.edit\'		,title:\'Edit Slaughter Permit\' ],\r\n\r\n\r\n [ action:\'liquidation.create\', title:\'Create Liquidation\' ],\r\n [ action:\'liquidation.submit\', title:\'Submit Liquidation\' ],\r\n [ action:\'liquidation.viewlist\', title:\'View Liquidation Listing\' ]\r\n\r\n [ action:\'collection.create_capture\'	,title:\'Create Capture Collection\'],\r\n [ action:\'receipt.viewissued\'		,title:\'View Issued Receipt Listing\' ],\r\n [ action:\'afcontrol.activate\'		,title:\'Activate AF Control\' ],\r\n [ action:\'postcapturereceipt.create\'	,title:\'Create Post Capture Receipt\'],\r\n [ action:\'postcapturereceipt.post\'	,title:\'Submit Post Capture Receipt\'],\r\n [ action:\'postcapturereceipt.viewlist\' ,title:\'View Post Capture Listing\' ],\r\n\r\n\r\n [action:\'treasurymgmt.view\',                title:\'View Treasury Management\'],\r\n [action:\'treasurymgmt_abstract.view\',       title:\'View Treasury Management (Abstract of Collection)\'],\r\n [action:\'treasurymgmt_afmonitoring.view\',   title:\'View Treasury Management (AF Monitoring)\'],\r\n [action:\'treasurymgmt_collection.view\',     title:\'View Treasury Management (Collection Summary)\'],\r\n [action:\'treasurymgmt_fund.view\',           title:\'View Treasury Management (Fund Summary)\'],\r\n [action:\'treasurymgmt_liquidation.view\',    title:\'View Treasury Management (Liquidation Detail)\'],\r\n [action:\'treasurymgmt_remittance.view\',     title:\'View Treasury Management (Remittance Monitoring)\'],\r\n [action:\'treasurymgmt_liquidation.view\',    title:\'View Undeposited Liquidation Summary\' ],\r\n]');

/*Table structure for table `sys_roleclass` */

DROP TABLE IF EXISTS `sys_roleclass`;

CREATE TABLE `sys_roleclass` (
  `name` varchar(50) NOT NULL,
  `description` varchar(50) default NULL,
  `rolelevel` int(11) default NULL,
  `tags` mediumtext,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_roleclass` */

insert  into `sys_roleclass`(`name`,`description`,`rolelevel`,`tags`) values ('ACCOUNTING','ACCOUNTING',1,NULL),('ADMIN','ADMIN',1,NULL),('BP','BUSINESS LICENSING',1,NULL),('IT','IT',1,NULL),('RPT','RPT ASSESSMENT',1,NULL),('TREASURY','TREASURY',1,'[\'AFO\', \'CASHIER\', \'COLLECTOR\', \'LIQUIDATING_OFFICER\']');

/*Table structure for table `sys_roleclass_module` */

DROP TABLE IF EXISTS `sys_roleclass_module`;

CREATE TABLE `sys_roleclass_module` (
  `roleclass` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY  (`roleclass`,`module`),
  KEY `FK_roleclass_module_module1` (`module`),
  CONSTRAINT `FK_roleclass_module_module` FOREIGN KEY (`module`) REFERENCES `sys_module` (`name`),
  CONSTRAINT `FK_sys_roleclass_module` FOREIGN KEY (`roleclass`) REFERENCES `sys_roleclass` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_roleclass_module` */

insert  into `sys_roleclass_module`(`roleclass`,`module`) values ('BP','bp2'),('TREASURY','bp2'),('ADMIN','etracs2-admin'),('BP','etracs2common'),('IT','etracs2common'),('RPT','etracs2common'),('TREASURY','etracs2common'),('ADMIN','jobposition'),('ADMIN','orgunit'),('ADMIN','personnel'),('ADMIN','role'),('RPT','rpt2'),('TREASURY','rpt2'),('ACCOUNTING','tc2'),('TREASURY','tc2');

/*Table structure for table `sys_schema` */

DROP TABLE IF EXISTS `sys_schema`;

CREATE TABLE `sys_schema` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_schema` */

/*Table structure for table `sys_script` */

DROP TABLE IF EXISTS `sys_script`;

CREATE TABLE `sys_script` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  `notes` text,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sys_script` */

/*Table structure for table `sys_sequence` */

DROP TABLE IF EXISTS `sys_sequence`;

CREATE TABLE `sys_sequence` (
  `objid` varchar(100) NOT NULL,
  `nextSeries` int(11) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_sequence` */

/*Table structure for table `sys_session` */

DROP TABLE IF EXISTS `sys_session`;

CREATE TABLE `sys_session` (
  `sessionid` varchar(50) NOT NULL,
  `username` varchar(50) default NULL,
  `host` varchar(50) default NULL,
  `dtaccessed` datetime default NULL,
  PRIMARY KEY  (`sessionid`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sys_session` */

/*Table structure for table `sys_sql` */

DROP TABLE IF EXISTS `sys_sql`;

CREATE TABLE `sys_sql` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `sys_sql` */

/*Table structure for table `sys_task` */

DROP TABLE IF EXISTS `sys_task`;

CREATE TABLE `sys_task` (
  `id` varchar(50) NOT NULL,
  `appcontext` varchar(50) default NULL,
  `apphost` varchar(50) default NULL,
  `service` varchar(50) default NULL,
  `servicetype` varchar(10) default NULL,
  `method` varchar(50) default NULL,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `currentdate` datetime default NULL,
  `interval` varchar(5) default NULL,
  `parameters` text,
  `allowedhost` varchar(50) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task` */

/*Table structure for table `sys_task_active` */

DROP TABLE IF EXISTS `sys_task_active`;

CREATE TABLE `sys_task_active` (
  `id` varchar(50) NOT NULL,
  `host` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_active` */

/*Table structure for table `sys_task_error` */

DROP TABLE IF EXISTS `sys_task_error`;

CREATE TABLE `sys_task_error` (
  `id` varchar(50) NOT NULL,
  `message` mediumtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_error` */

/*Table structure for table `sys_task_suspended` */

DROP TABLE IF EXISTS `sys_task_suspended`;

CREATE TABLE `sys_task_suspended` (
  `id` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_task_suspended` */

/*Table structure for table `sys_template` */

DROP TABLE IF EXISTS `sys_template`;

CREATE TABLE `sys_template` (
  `name` varchar(50) NOT NULL,
  `content` text,
  `category` varchar(255) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_template` */

/*Table structure for table `sys_var` */

DROP TABLE IF EXISTS `sys_var`;

CREATE TABLE `sys_var` (
  `name` varchar(50) NOT NULL,
  `value` text,
  `description` varchar(255) default NULL,
  `datatype` varchar(15) default NULL,
  `category` varchar(50) default NULL,
  PRIMARY KEY  (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sys_var` */

insert  into `sys_var`(`name`,`value`,`description`,`datatype`,`category`) values ('assessor_name',NULL,NULL,NULL,'RPT'),('assessor_officename',NULL,NULL,NULL,'RPT'),('assessor_title',NULL,NULL,NULL,'RPT'),('barcode_url','http://localhost:8080/barcode?data=$P{data}&width=1','barcode servlet path',NULL,'SYSTEM'),('collecting_agency',NULL,NULL,NULL,'TREASURY'),('deposit_print_date','0',NULL,NULL,'SYSTEM'),('faas_attachment_path','D:/temp/faasattachments',NULL,NULL,'SYSTEM'),('invalid_login_access_date_interval','1m','number of hours/days access date is moved when failed_login_max_retries is reached( d=days, h=hours)',NULL,NULL),('invalid_login_action','1','0 - suspend 1-move access to a later date',NULL,NULL),('invalid_login_max_retries','5','No. of times a user can retry login before disabling account',NULL,NULL),('lgu_address',NULL,NULL,NULL,'LGU'),('lgu_formal_name',NULL,NULL,NULL,'LGU'),('lgu_index',NULL,NULL,NULL,'LGU'),('lgu_name',NULL,'lgu name',NULL,'LGU'),('lgu_type',NULL,'Type of LGU. Valid values are city, municipality and province',NULL,'SYSTEM'),('mayor_name',NULL,NULL,NULL,'LGU'),('mayor_office_name',NULL,NULL,NULL,'LGU'),('mayor_title',NULL,NULL,NULL,'LGU'),('parent_lgu_formal_name',NULL,NULL,NULL,'LGU'),('parent_lgu_name',NULL,'Parent LGU Name',NULL,'LGU'),('pin_autonumber','0',NULL,NULL,'SYSTEM'),('pin_parcel_length',NULL,'The number of digits in pin parcel.',NULL,'RPT'),('pin_section_length',NULL,'The number of digits in pin section.',NULL,'RPT'),('pin_type',NULL,'PIN Formatting Type valid values: old or new',NULL,'RPT'),('provincial_treasurer_name',NULL,NULL,NULL,'TREASURY'),('provincial_treasurer_title',NULL,NULL,NULL,'TREASURY'),('pwd_change_cycle','3','No. of times the user cannot use a repeating password',NULL,NULL),('pwd_change_date_interval','1M','No. of days/months before a user is required to change their password (d=days, M=months)',NULL,NULL),('pwd_change_login_count','0','No. of times a user has successfully logged in before changing their password. (0=no limit) ',NULL,NULL),('receipt_item_printout_count','10',NULL,NULL,'SYSTEM'),('remote_context','guimaras','Application context of the remote server',NULL,'SYSTEM'),('remote_host','localhost:8080','IP Address of the remote server ',NULL,'SYSTEM'),('remote_lgu_index','075',NULL,NULL,'SYSTEM'),('remote_lgu_name','GUIMARAS',NULL,NULL,'SYSTEM'),('rptbilling_previousledger_quarterly',NULL,NULL,NULL,'RPT'),('sangguinan_name',NULL,'sangguinian name',NULL,'LGU'),('server_address','localhost',NULL,NULL,NULL),('server_timezone','Asia/Shanghai','this must be matched with default timezone of server',NULL,NULL),('session_timeout_interval','1d ','expiry dates of inactive session (d=days, h=hours)',NULL,'SYSTEM'),('system_pwd','!12345','system password',NULL,'SYSTEM'),('td_autonumber','1',NULL,NULL,'SYSTEM'),('td_format','Y-M-B','Tax Declaration No. format. Options: Y- revision year, M-municipality index, C - city index, D-district index, B=-barangay index',NULL,'SYSTEM'),('td_report_display_appraisedby','1',NULL,NULL,'SYSTEM'),('td_report_item_format','BLGF',NULL,NULL,'SYSTEM'),('td_show_landinfo_on_improvements','1','Show the land information such as boundary etc in the improvement tax declaration. Options: 1 - show; 0 - hide',NULL,'SYSTEM'),('treasurer_name',NULL,NULL,NULL,'TREASURY'),('treasurer_title',NULL,NULL,NULL,'TREASURY'),('treasury_officename',NULL,NULL,NULL,'TREASURY'),('url_logo_lgu','http://localhost:8080/downloads/images/lgu.png','logo path','image','LGU');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
