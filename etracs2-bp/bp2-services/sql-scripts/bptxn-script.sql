CREATE TABLE `bptxn` (
  `objid` varchar(50) NOT NULL,
  `schemaname` varchar(50) NOT NULL,
  `schemaversion` varchar(20) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `info` text NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `business` text,
  `businessid` varchar(50) NOT NULL,
  PRIMARY KEY  (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `changeaddresslist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `prevbusinessaddress` varchar(255) NOT NULL,
  `newbusinessaddress` varchar(255) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changeaddresslist_business` (`businessid`),
  CONSTRAINT `FK_changeaddresslist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changeaddresslist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `changeadminlist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  `prevadminid` varchar(50) default NULL,
  `prevadminname` varchar(100) default NULL,
  `prevadminaddress` varchar(255) default NULL,
  `newadminid` varchar(50) default NULL,
  `newadminname` varchar(100) default NULL,
  `newadminaddress` varchar(255) default NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changeadminlist_newadmin` (`newadminid`),
  KEY `FK_changeadminlist_prevadmin` (`prevadminid`),
  KEY `FK_changeadminlist_business` (`businessid`),
  CONSTRAINT `FK_changeadminlist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changeadminlist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changeadminlist_newadmin` FOREIGN KEY (`newadminid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `FK_changeadminlist_prevadmin` FOREIGN KEY (`prevadminid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `changepermitteelist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(20) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `tradename` varchar(100) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `prevtaxpayerid` varchar(50) NOT NULL,
  `prevtaxpayername` varchar(100) NOT NULL,
  `prevtaxpayeraddress` varchar(255) NOT NULL,
  `newtaxpayerid` varchar(50) NOT NULL,
  `newtaxpayername` varchar(100) NOT NULL,
  `newtaxpayeraddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changepermitteelist_newtaxpayer` (`newtaxpayerid`),
  KEY `FK_changepermitteelist_prevtaxpayer` (`prevtaxpayerid`),
  KEY `FK_changepermitteelist_business` (`businessid`),
  CONSTRAINT `FK_changepermitteelist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changepermitteelist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`),
  CONSTRAINT `FK_changepermitteelist_newtaxpayer` FOREIGN KEY (`newtaxpayerid`) REFERENCES `entity` (`objid`),
  CONSTRAINT `FK_changepermitteelist_prevtaxpayer` FOREIGN KEY (`prevtaxpayerid`) REFERENCES `entity` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




CREATE TABLE `changetradenamelist` (
  `objid` varchar(50) NOT NULL,
  `docstate` varchar(10) NOT NULL,
  `txnno` varchar(20) NOT NULL,
  `businessid` varchar(50) NOT NULL,
  `newtradename` varchar(100) NOT NULL,
  `prevtradename` varchar(100) NOT NULL,
  `taxpayername` varchar(100) NOT NULL,
  `taxpayeraddress` varchar(255) NOT NULL,
  `txntype` varchar(20) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  PRIMARY KEY  (`objid`),
  KEY `FK_changetradenamelist_business` (`businessid`),
  CONSTRAINT `FK_changetradenamelist_business` FOREIGN KEY (`businessid`) REFERENCES `business` (`objid`),
  CONSTRAINT `FK_changetradenamelist` FOREIGN KEY (`objid`) REFERENCES `bptxn` (`objid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;