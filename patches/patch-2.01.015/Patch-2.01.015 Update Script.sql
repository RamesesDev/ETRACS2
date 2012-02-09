create index ix_bpapplication_tradename on bpapplication( tradename );
create index ix_bpapplication_txnno on bpapplication( txnno );
create index ix_rptledger_faasid on rptledger(faasid);

ALTER TABLE rptpaymentmanual add column municity varchar(200) not null;
ALTER TABLE rptpaymentmanual add column municityid varchar(50) not null;
ALTER TABLE rptpaymentmanual add column municityname varchar(100) not null; 

alter table bppermit add column info text null;


-- update for municipality 
UPDATE rptpaymentmanual r, lgu l, lgu m  SET
	r.municityid = m.objid,
	r.municityname = m.lguname,
	r.municity = CONCAT('[objid:"', m.objid, '",lgutype:"', m.lgutype, '",lguname:"', m.lguname, '"]')
WHERE r.barangay = l.lguname 
  AND l.parentid = m.objid ;
  

-- update for city 
UPDATE rptpaymentmanual r, lgu l   SET
	r.municityid = l.objid,
	r.municityname = l.lguname,
	r.municity = CONCAT('[objid:"', l.objid, '",lgutype:"', l.lgutype, '",lguname:"', l.lguname, '"]')
WHERE l.lgutype = 'CITY';


create index ix_receiptlist_doctype_voided on receiptlist( doctype, voided);
create index ix_txnlog_refid on txnlog( refid );

create index ix_bppermit_appid on bppermit( applicationid ) ;
create index ix_bpapplicationlisting_barcode on bpapplicationlisting(barcode);
create index ix_bpapplication_barcode on bpapplication(barcode);
create index ix_bpapplicationlisting_sym on bpapplicationlisting( docstate, iyear, txnmode );

create index ix_bploblisting_appid on bploblisting( applicationid );

create index ix_faaslist_prevtdno_ry on faaslist (prevtdno, ry );
create index ix_faaslist_prevtdno on faaslist(prevtdno);

create index ix_faaslist_rydocstate on faaslist (ry,docstate );


-- permissionset for bp collection report listing
-- 		module : bp2 
-- 		permissionset: BP_LICENSING 
-- 		permissions: [action:'bpreport.bpcollectionreport'	,title:'Generate BP Collection Report Listing' ]


-- bppayment table structure
CREATE TABLE bppayment (
	objid VARCHAR(50),
	applicationid VARCHAR(50),
	receiptid VARCHAR(50),
	afid VARCHAR(20),
	serialno VARCHAR(30),
	txndate Date,
	iyear INT,
	iqtr INT,
	imonth INT,
	iday INT,
	paidyear INT,
	paidqtr INT,
	lobid VARCHAR(50),
	lobname VARCHAR(50),
	acctid VARCHAR(50),
	accttitle VARCHAR(50),
	amount DECIMAL(10, 2),
	surcharge DECIMAL(10, 2),
	interest DECIMAL(10, 2),
	discount DECIMAL(10, 2),
	total DECIMAL(10, 2),
	voided INT
);

create index ix_bppayment_applicationid on bppayment( applicationid );
create index ix_bppayment_txndate on bppayment( txndate );
create index ix_bppayment_receiptid on bppayment( receiptid );

alter table bppayment add column paidyear int not null;
alter table bppayment add column paidqtr int not null;


/* ------------------------------------------------------------------
*
* MULTI-CASHIER SUPPORT 
*
------------------------------------------------------------------ */

alter table liquidation add column rcds text;
update liquidation set rcds = '[]';

alter table liquidation add column opener varchar(50) not null;
alter table liquidationlist add column opener varchar(50) not null;

update liquidation set opener='single';
update liquidationlist set opener='single';

CREATE TABLE `liquidationrcd` (                                                                     
  `objid` varchar(50) NOT NULL,        
  `docstate` varchar(20) NOT NULL,        
  `schemaname` varchar(25) NOT NULL,                                                                
  `schemaversion` varchar(5) NOT NULL,                                                              
  `liquidationid` varchar(50) NOT NULL,                                                             
  `liquidationno` varchar(25) NOT NULL,                                                             
  `liquidationdate` date NOT NULL,                                                                  
  `lqofficerid` varchar(50) NOT NULL,                                                               
  `lqofficername` varchar(100) NOT NULL,                                                            
  `lqofficertitle` varchar(50) NOT NULL,                                                            
  `fundid` varchar(50) NOT NULL,                                                                    
  `fundname` varchar(100) NOT NULL,                                                                 
  `cashierid` varchar(50) NOT NULL,                                                                 
  `cashiername` varchar(100) NOT NULL,                                                              
  `cashiertitle` varchar(50) NOT NULL,                                                              
  `cash` decimal(14,2) NOT NULL,                                                                    
  `noncash` decimal(14,2) NOT NULL,                                                                 
  `amount` decimal(14,2) NOT NULL,                                                                  
  `denominations` text NOT NULL,                                                                    
  `noncashpayments` text NOT NULL,                                                                        
  `depositid` varchar(50) NULL, 
  `dtdeposited` date null, 
  PRIMARY KEY  (`objid`),                                                                           
  KEY `FK_liquidationrcd` (`liquidationid`),                                                        
  KEY `FK_liquidationrcd_fund` (`fundid`),                                                          
  KEY `lqofficerid` (`lqofficerid`),                                                                
  KEY `ix_liquidationrcd_cashierid` (`cashierid`),                                                  
  CONSTRAINT `FK_liquidationrcd` FOREIGN KEY (`liquidationid`) REFERENCES `liquidation` (`objid`),  
  CONSTRAINT `FK_liquidationrcd_fund` FOREIGN KEY (`fundid`) REFERENCES `fund` (`objid`)            
) ENGINE=InnoDB DEFAULT CHARSET=latin1   ;



alter table paymentitem add column liquidationid varchar(50);
alter table paymentitem add column liquidationrcdid varchar(50);

create index ix_paymentitem_liquidationid on paymentitem( liquidationid );
create index ix_paymentitem_liquidationrcdid on paymentitem( liquidationrcdid );

alter table receiptitem add column liquidationrcdid varchar(50);
create index ix_receiptitem_liquidationrcdid on receiptitem(liquidationrcdid );

alter table revenue add column liquidationrcdid varchar(50);
create index ix_revenue_liquidationrcdid on revenue(liquidationrcdid );

alter table faaslist add column message text;