[getOpenLedgersByTaxpayerId]
SELECT 
	objid, taxpayerid, fullpin AS pin, tdno , rputype, assessedvalue, 
    barangay, classcode, txntype, cadastrallotno, 
	CASE WHEN lastqtrpaid = 4 THEN lastyearpaid +1 ELSE lastyearpaid END AS fromyear, 
	CASE WHEN lastqtrpaid = 4 THEN 1 ELSE lastqtrpaid + 1 END AS fromqtr, 
    lastyearpaid, lastqtrpaid, 
	0 AS toyear, 0 AS toqtr, partialbasic, partialsef, 
    0.0 AS basic, 0.0 AS basicint, 0.0 AS basicdisc,
    0.0 AS sef, 0.0 AS sefint, 0.0 AS sefdisc 
FROM rptledger 
WHERE taxpayerid = $P{taxpayerid} AND docstate = 'APPROVED' AND taxable = 1 
 AND ( lastyearpaid < $P{currentyr} OR (lastyearpaid = $P{currentyr} AND lastqtrpaid < 4 ) ) 
 

[getOpenLedgersById]
SELECT 
	objid, taxpayerid, fullpin AS pin, tdno , rputype, assessedvalue, 
    barangay, classcode, txntype, cadastrallotno, 
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


[lookupAccount]
SELECT objid, acctno, accttitle FROM incomeaccount WHERE systype = $P{systype} ORDER BY accttitle 


[lookupAccountByNo]
SELECT objid, acctno, accttitle FROM incomeaccount  WHERE acctno = $P{acctno} AND systype = $P{systype} ORDER BY accttitle 

[lookupAccountByTitle]
SELECT objid, acctno, accttitle FROM incomeaccount  WHERE accttitle LIKE $P{accttitle} AND systype = $P{systype} ORDER BY accttitle 