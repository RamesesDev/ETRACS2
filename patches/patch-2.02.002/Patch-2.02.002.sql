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
	accttitle VARCHAR(150),
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
update liquidation set rcds = '[]' where rcds is null ;

alter table liquidation add column opener varchar(50) not null;
alter table liquidationlist add column opener varchar(50) not null;

update liquidation set opener='single' where opener is null;
update liquidationlist set opener='single' where opener is null;

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

update paymentitem p, receiptlist rl, remittancelist rem  set
	p.liquidationid = rem.liquidationid 
where p.receiptid = rl.objid 
  and rl.remittanceid = rem.objid
  and p.liquidationid is null; 

alter table receiptitem add column liquidationrcdid varchar(50);
create index ix_receiptitem_liquidationrcdid on receiptitem(liquidationrcdid );

alter table revenue add column liquidationrcdid varchar(50);
create index ix_revenue_liquidationrcdid on revenue(liquidationrcdid );

alter table faaslist add column message text;

alter table bldgrysetting add column straightdepreciation int not null;
update bldgrysetting set straightdepreciation = 1 ;


update craaf c, afcontrol a set 
	c.collectorid = a.collectorid 
where c.afid = a.afid
  and c.afinventorycreditid = a.afinventorycreditid 
  and c.collectorid is null ;
  
  

update craaf c, afinventorycredit cr set
	c.stubno = cr.stubno
where c.afinventorycreditid = cr.objid ;

create index ix_liquidationlist_period on liquidationlist( iyear, iqtr, imonth );


alter table faaslist change column prevtdno prevtdno varchar(200) not null;

create index ix_faaslist_timestamp_docstate_taxable ON faaslist( txntimestamp, docstate, taxable);

alter table faaslist add column restriction varchar(30);

  
  
alter table bldgrysetting add column calcbldgagebasedondtoccupied int not null;

update bldgrysetting set calcbldgagebasedondtoccupied = 0;


CREATE TABLE `cancelfaas` (                
	  `objid` varchar(50) NOT NULL,            
	  `docstate` varchar(50) NOT NULL,         
	  `schemaname` varchar(50) NOT NULL,       
	  `schemaversion` varchar(5) NOT NULL,     
	  `tdno` varchar(30) NOT NULL,             
	  `ownername` varchar(800) NOT NULL,       
	  `fullpin` varchar(35) NOT NULL,          
	  `classcode` varchar(10) NOT NULL,        
	  `faasid` varchar(50) NOT NULL,           
	  `rputype` varchar(20) NOT NULL,          
	  `remarks` varchar(200) NOT NULL,         
	  `dtapproved` date default NULL,          
	  `approvedby` varchar(100) default NULL,  
	  `cancelreasonid` varchar(50) NOT NULL,   
	  `cancelreason` varchar(25) NOT NULL,     
	  `extended` text,                         
	  PRIMARY KEY  (`objid`)                   
	) ENGINE=InnoDB DEFAULT CHARSET=latin1   ;

			
			
CREATE TABLE `form60setup` (            
   `objid` varchar(50) NOT NULL,         
   `items` text NOT NULL,                 
   PRIMARY KEY  (`objid`)                
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1  ;			
			
			
CREATE TABLE `form60account` (          
	 `objid` varchar(50) NOT NULL,         
	 `parentid` varchar(50) NOT NULL,      
	 `acctid` varchar(50) NOT NULL,        
	 `accttitle` varchar(250) NOT NULL,    
	 PRIMARY KEY  (`objid`)                
   ) ENGINE=InnoDB DEFAULT CHARSET=latin1  ;

create index ix_form60account_parentid on form60account( parentid );
create index ix_form60account_acctid on form60account( acctid);

alter table faaslist change column prevtdno prevtdno varchar(300) null;

alter table truecopy change column authority authority varchar(300) null;


/*========================================================================================
//
//  MIGRATE LiquidationRCD records 
//
========================================================================================*/


/* ===========================================================================
* insert liquidationrcd record for "single" type liquidation
* that have no equivalent liquidationrcd entry which is possible
* for liquidations before the "multi" type was implemented
=========================================================================== */
insert into liquidationrcd (
	objid, 
	docstate, 
	schemaname, 
	schemaversion, 
	liquidationid, 
	liquidationno, 
	liquidationdate, 
	lqofficerid, 
	lqofficername, 
	lqofficertitle, 
	fundid, 
	fundname, 
	cashierid, 
	cashiername, 
	cashiertitle, 
	cash, 
	noncash, 
	amount, 
	denominations, 
	noncashpayments, 
	depositid, 
	dtdeposited
)
select 
	concat(ll.objid, '-', ia.fundname) as objid, 
	'CLOSED' as docstate, 
	'liquidationrcd' as schemaname, 
	'1.0' as schemaversion, 
	ll.objid as liquidationid, 
	ll.txnno as liquidationno, 
	ll.txndate as liquidationdate, 
	ll.liquidatingofficerid as lqofficerid, 
	ll.liquidatingofficername as lqofficername, 
	ll.liquidatingofficertitle as lqofficertitle, 
	ia.fundid, 
	ia.fundname, 
	ll.depositedbyid as cashierid, 
	ll.depositedbyname as cashiername, 
	ll.depositedbytitle as cashiertitle, 
	SUM(ri.amount) as cash, 
	0.0 as noncash, 
	SUM(ri.amount) as amount, 
	'[[:]]' as denominations, 
	'[]' as noncashpayments, 
	ll.depositid, 
	ll.dtdeposited
from liquidationlist ll
	inner join liquidation lq on ll.objid = lq.objid 
	inner join remittancelist rl on ll.objid = rl.liquidationid 
	inner join receiptlist r on rl.objid = r.remittanceid
	inner join receiptitem ri on r.objid = ri.receiptid
	inner join incomeaccount ia on ri.acctid = ia.objid 
where not exists(select * from liquidationrcd where liquidationid = ll.objid )
  and ll.depositid is not null
group by ll.objid, ia.fundid;


/* ===========================================================================
* update the receiptitem.liquidationrcdid field 
=========================================================================== */
update receiptitem ri, receiptlist r, remittancelist rl, incomeaccount ia set
	ri.liquidationrcdid = concat(rl.liquidationid, '-', ia.fundname)
where ri.receiptid = r.objid 
  and ri.acctid = ia.objid 
  and r.remittanceid = rl.objid 
  and ri.liquidationrcdid is null 
  and rl.liquidationid is not null;


/* ===========================================================================
* update the revenue.liquidationrcdid field 
=========================================================================== */
update revenue rev, receiptitem ri set
	rev.liquidationrcdid = ri.liquidationrcdid
where rev.receiptitemid = ri.objid 
  and rev.liquidationrcdid is null ;


/* ===========================================================================
* update the revenue.liquidationrcdid field 
=========================================================================== */
update liquidationlist ll set 
	docstate = 'CLOSED'
where ll.objid in (
	select a.liquidationid from 
	( select lr.liquidationid, 
		 count(*) as itemcount, 
		 sum( case when lr.docstate = 'closed' then 1 else 0 end ) as closeditemcount
	  from liquidationrcd lr, liquidationlist ll
	  where lr.liquidationid = ll.objid  and ll.docstate = 'open'
	  group by lr.liquidationid
	) a
	where a.itemcount = a.closeditemcount 
);

update liquidation l, liquidationlist lq set
	l.docstate = lq.docstate
where l.docstate = 'open'
  and lq.docstate = 'closed';

  
/* ===========================================================================
* update renveue deposit related info  
=========================================================================== */
update revenue rev, liquidationrcd lr, deposit d set
	rev.depositid = d.objid,
	rev.depositno = d.txnno,
	rev.depositdate = lr.dtdeposited,
	rev.deposittimestamp = concat( year(lr.dtdeposited), 
		quarter(lr.dtdeposited), 
		case when month(lr.dtdeposited) < 10 then concat('0', month(lr.dtdeposited)) else month(lr.dtdeposited) end,
		case when day(lr.dtdeposited) < 10 then concat('0', day(lr.dtdeposited)) else day(lr.dtdeposited) end 
	)
where rev.liquidationrcdid = lr.objid 
  and lr.depositid = d.objid 
  and rev.liquidationrcdid is not null 
  and rev.depositid is null;


/* ===========================================================================
* new field for variable printtopermit 
=========================================================================== */
ALTER TABLE variable ADD COLUMN printtopermit INT NULL; 


/* add indexno */
alter table structures add column indexno int;
update structures set indexno = 0 where indexno is null;




