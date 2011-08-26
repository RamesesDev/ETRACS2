[getOpenLedgersByTaxpayerId]
SELECT 
	objid, taxpayerid, fullpin AS pin, tdno , rputype, assessedvalue, 
    barangay, classcode, txntype, cadastrallotno, taxpayername, 
	CASE WHEN lastqtrpaid = 4 THEN lastyearpaid +1 ELSE lastyearpaid END AS fromyear, 
	CASE WHEN lastqtrpaid = 4 THEN 1 ELSE lastqtrpaid + 1 END AS fromqtr, 
    lastyearpaid, lastqtrpaid, 
	0 AS toyear, 0 AS toqtr, partialbasic, partialsef, 
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc,
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc 
FROM rptledger 
WHERE taxpayerid = $P{taxpayerid} AND docstate = 'APPROVED' AND taxable = 1 
 AND ( lastyearpaid < $P{currentyr} OR (lastyearpaid = $P{currentyr} AND lastqtrpaid < 4 ) ) 
 
[getOpenLedgersByPropertyPayer]
SELECT 
	rl.objid, rl.taxpayerid, rl.fullpin AS pin, rl.tdno , rl.rputype, rl.assessedvalue, 
    rl.barangay, rl.classcode, rl.txntype, rl.cadastrallotno, rl.taxpayername, 
	CASE WHEN rl.lastqtrpaid = 4 THEN rl.lastyearpaid +1 ELSE rl.lastyearpaid END AS fromyear, 
	CASE WHEN rl.lastqtrpaid = 4 THEN 1 ELSE rl.lastqtrpaid + 1 END AS fromqtr, 
    rl.lastyearpaid, rl.lastqtrpaid, 
	0 AS toyear, 0 AS toqtr, rl.partialbasic, rl.partialsef, 
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc,
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc 
FROM rptledger rl, propertypayer p, propertypayeritem ppi  
WHERE rl.objid = ppi.ledgerid  
 AND ppi.propertypayerid = p.objid 
 AND p.taxpayerid = $P{taxpayerid}
 AND rl.docstate = 'APPROVED' AND rl.taxable = 1 
 AND ( rl.lastyearpaid < $P{currentyr} OR (rl.lastyearpaid = $P{currentyr} AND rl.lastqtrpaid < 4 ) ) 
 
 
[getOpenLedgersById]
SELECT 
	objid, taxpayerid, fullpin AS pin, tdno , rputype, assessedvalue, 
    barangay, classcode, txntype, cadastrallotno, taxpayername, 
	CASE WHEN lastqtrpaid = 4 THEN lastyearpaid +1 ELSE lastyearpaid END AS fromyear, 
	CASE WHEN lastqtrpaid = 4 THEN 1 ELSE lastqtrpaid + 1 END AS fromqtr, 
    lastyearpaid, lastqtrpaid, 
	0 AS toyear, 0 AS toqtr, partialbasic, partialsef,  
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc, 
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc 
FROM rptledger 
WHERE objid = $P{objid} AND docstate = 'APPROVED' AND taxable = 1 
 AND ( lastyearpaid < $P{currentyr} OR (lastyearpaid = $P{currentyr} AND lastqtrpaid < 4 ) ) 
 
 
[getOpenLedgerItems] 
SELECT 
	objid, tdno, txntype, classid, classcode, actualuseid, actualusecode, backtax,  
	fromyear, CASE WHEN toyear = 0 THEN $P{currentyr} ELSE toyear END AS toyear, assessedvalue ,
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc,
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc     
FROM rptledgeritem  
WHERE parentid = $P{parentid} AND docstate = 'APPROVED' AND taxable = 1   
ORDER BY fromyear   

[getIncomeAccountInfo]
SELECT objid AS acctid, acctno, accttitle, fundid, fundname FROM incomeaccount  WHERE objid = $P{objid}


[lookupAccount]
SELECT objid, acctno, accttitle FROM incomeaccount WHERE systype = $P{systype} ORDER BY accttitle 


[lookupAccountByNo]
SELECT objid, acctno, accttitle FROM incomeaccount  WHERE acctno = $P{acctno} AND systype = $P{systype} ORDER BY accttitle 

[lookupAccountByTitle]
SELECT objid, acctno, accttitle FROM incomeaccount  WHERE accttitle LIKE $P{accttitle} AND systype = $P{systype} ORDER BY accttitle 