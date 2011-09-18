[getBarangayList]
SELECT objid AS barangayid, lguname AS barangay FROM lgu WHERE lgutype = 'BARANGAY' AND parentid = $P{parentid} ORDER BY lguname 


[getCollectorList]
SELECT objid AS collectorid, name AS collectorname, jobtitle AS collectortitle  from etracsuser WHERE iscollector = 1 ORDER BY name 


[getAbstractCollectionBASIC] 
SELECT  
	rp.period AS payperiod, 
	'BASIC' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS currentyear, 
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS previousyear, 
	IFNULL((SELECT SUM( basicdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ), 0.0) AS discount, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS penaltyprevious 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE lq.txntimestamp LIKE $P{txntimestamp} 
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
  AND r.collectorid LIKE $P{collectorid} 
ORDER BY r.serialno, rl.tdno    

[getAbstractCollectionSEF]
SELECT 
	rp.period AS payperiod, 
	'SEF' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS currentyear, 
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous', 'prior') ),0.0) AS previousyear, 
	IFNULL((SELECT SUM( sefdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ),0.0) AS discount, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior' ) ),0.0) AS penaltyprevious 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
  AND r.collectorid LIKE $P{collectorid} 
ORDER BY r.serialno, rl.tdno 


[getAbstractCollectionManualBASIC]
SELECT 
	rp.period AS payperiod,
	'BASIC' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.basic AS currentyear, 
	rp.basicprev + rp.basicprior AS previousyear, 
	rp.basicdisc AS discount, 
	rp.basicint AS penaltycurrent, 
	rp.basicprevint + rp.basicpriorint AS penaltyprevious 
FROM liquidationlist lq
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
  AND r.collectorid LIKE $P{collectorid}



[getAbstractCollectionManualSEF]
SELECT 
	rp.period AS payperiod,
	'SEF' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.sef AS currentyear, 
	rp.sefprev + rp.sefprior AS previousyear, 
	rp.sefdisc AS discount, 
	rp.sefint AS penaltycurrent, 
	rp.sefprevint + rp.sefpriorint AS penaltyprevious 
FROM liquidationlist lq
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE lq.txntimestamp LIKE $P{txntimestamp}  
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
  AND r.collectorid LIKE $P{collectorid}

  
[getBasicSummaryByMonth]
SELECT 
	rl.barangay, 
	SUM( CASE WHEN rpd.revtype IN ('current', 'advance' ) THEN rpd.basic - rpd.basicdisc + rpd.basicint ELSE 0 END ) AS basiccurrent, 
	SUM( CASE WHEN rpd.revtype IN ('previous', 'prior' ) THEN rpd.basic + rpd.basicint ELSE 0 END ) AS basicprevious, 
	SUM( rpd.basic - rpd.basicdisc + rpd.basicint ) AS basictotal ,
	0.0 AS basiccurrentshare, 
	0.0 AS basicpreviousshare, 
	0.0 AS totalshare 
FROM liquidationlist l  
	INNER JOIN remittance rem ON l.objid = rem.liquidationid  
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON r.objid = rp.receiptid 
	INNER JOIN rptpaymentdetail rpd ON r.objid = rpd.receiptid  AND rp.rptledgerid = rpd.rptledgerid 
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE l.iyear = $P{iyear} 
  AND l.imonth = $P{imonth} 
  AND r.voided = 0  
GROUP BY rl.barangay 
ORDER BY rl.barangay  

[getManualBasicSummaryByMonth]
SELECT 
	rp.barangay, 
	SUM(rp.basic + rp.basicint - rp.basicdisc) AS basiccurrent, 
	SUM(rp.basicprev + rp.basicprevint + rp.basicprior + rp.basicpriorint) AS basicprevious, 
	SUM(rp.basic + rp.basicint - rp.basicdisc + rp.basicprev + rp.basicprevint + rp.basicprior + rp.basicpriorint) AS basictotal, 
	0.0 AS basiccurrentshare,  
	0.0 AS basicpreviousshare,  
	0.0 AS totalshare  
FROM liquidationlist l   
	INNER JOIN remittance rem ON l.objid = rem.liquidationid   
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid   
	INNER JOIN rptpaymentmanual rp ON r.objid = rp.receiptid   
WHERE l.iyear = $P{iyear}  
  AND l.imonth = $P{imonth}  
  AND r.voided = 0  
GROUP BY rp.barangay  
ORDER BY rp.barangay   




