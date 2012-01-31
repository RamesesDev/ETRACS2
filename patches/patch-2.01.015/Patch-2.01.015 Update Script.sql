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

