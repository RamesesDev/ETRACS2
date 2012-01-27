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
	lobid VARCHAR(50),
	lobname VARCHAR(50),
	acctid VARCHAR(50),
	accttitle VARCHAR(50),
	amount DECIMAL(10, 2),
	surcharge DECIMAL(10, 2),
	interest DECIMAL(10, 2),
	discount DECIMAL(10, 2),
	totalamount DECIMAL(10, 2),
	voided INT
);


