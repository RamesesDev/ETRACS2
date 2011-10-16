[getClassificationList] 
SELECT objid AS classid, propertydesc AS classname, special   
FROM propertyclassification  ORDER BY orderno  

[getExemptionList]
SELECT objid AS classid, exemptdesc AS classname, 0 AS special 
FROM exemptiontype ORDER BY orderno  

[getBarangayList]
SELECT objid AS barangayid, lguname AS barangay FROM lgu WHERE lgutype = 'BARANGAY' AND parentid = $P{parentid} ORDER BY lguname 

[getBrgyCount]
SELECT COUNT(*) AS brgycount FROM lgu WHERE lgutype = 'BARANGAY' 

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




[getOnlineRPTC]
SELECT 	
	rl.classid, 
	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.basic ELSE 0 END ) AS basiccurrent, 
	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.basicdisc ELSE 0 END ) AS basicdisc, 
	SUM( CASE WHEN rpd.revtype = 'previous' THEN rpd.basic  ELSE 0 END ) AS basicprev, 
	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.basicint ELSE 0 END ) AS basiccurrentint, 
	SUM( CASE WHEN rpd.revtype = 'previous' THEN rpd.basicint  ELSE 0 END ) AS basicprevint, 
	SUM( rpd.basic + rpd.basicint ) AS basicgross, 
	SUM( rpd.basic + rpd.basicint - rpd.basicdisc ) AS basicnet, 

	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.sef ELSE 0 END ) AS sefcurrent, 
	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.sefdisc ELSE 0 END ) AS sefdisc, 
	SUM( CASE WHEN rpd.revtype = 'previous' THEN rpd.sef  ELSE 0 END ) AS sefprev, 
	SUM( CASE WHEN rpd.revtype = 'current' THEN rpd.sefint ELSE 0 END ) AS sefcurrentint, 
	SUM( CASE WHEN rpd.revtype = 'previous' THEN rpd.sefint  ELSE 0 END ) AS sefprevint, 
	SUM( rpd.sef + rpd.sefint ) AS sefgross, 
	SUM( rpd.sef + rpd.sefint - rpd.sefdisc ) AS sefnet,
	SUM( rpd.basic + rpd.basicint + rpd.sef + rpd.sefint ) AS grandtotal, 
	SUM( rpd.basic + rpd.basicint - rpd.basicdisc + rpd.sef + rpd.sefint - rpd.sefdisc ) AS netgrandtotal 
FROM revenue r 
	INNER JOIN receiptlist rct ON r.receiptid = rct.objid
	INNER JOIN rptpayment rp ON r.receiptid = rp.receiptid
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid 
	INNER JOIN rptpaymentdetail rpd ON r.receiptid = rpd.receiptid 
WHERE r.voided = 0 
  AND r.liquidationtimestamp LIKE $P{txntimestamp} 
GROUP BY rl.classid 


[getManualRPTC]
SELECT 	
	pc.objid AS classid ,
	SUM( rpm.basic ) AS basiccurrent, 
	SUM( rpm.basicdisc ) AS basicdisc, 
	SUM( rpm.basicprev + rpm.basicprior ) AS basicprev, 
	SUM( rpm.basicint ) AS basiccurrentint, 
	SUM( rpm.basicprevint + rpm.basicpriorint ) AS basicprevint, 
	SUM( rpm.basic + rpm.basicprev + rpm.basicprior + rpm.basicint + rpm.basicprevint + rpm.basicpriorint ) AS basicgross, 
	SUM( rpm.basic + rpm.basicprev + rpm.basicprior + rpm.basicint + rpm.basicprevint + rpm.basicpriorint - rpm.basicdisc  ) AS basicnet,

	SUM( rpm.sef ) AS sefcurrent, 
	SUM( rpm.sefdisc ) AS sefdisc, 
	SUM( rpm.sefprev + rpm.sefprior ) AS sefprev, 
	SUM( rpm.sefint ) AS sefcurrentint, 
	SUM( rpm.sefprevint + rpm.sefpriorint ) AS sefprevint, 
	SUM( rpm.sef + rpm.sefprev + rpm.sefprior + rpm.sefint + rpm.sefprevint + rpm.sefpriorint ) AS sefgross,  
	SUM( rpm.sef + rpm.sefprev + rpm.sefprior + rpm.sefint + rpm.sefprevint + rpm.sefpriorint - rpm.sefdisc  ) AS sefnet, 

	SUM( rpm.basic + rpm.basicprev + rpm.basicprior + rpm.basicint + rpm.basicprevint + rpm.basicpriorint +
	     rpm.sef + rpm.sefprev + rpm.sefprior + rpm.sefint + rpm.sefprevint + rpm.sefpriorint ) AS grandtotal,  

	SUM( rpm.basic + rpm.basicprev + rpm.basicprior + rpm.basicint + rpm.basicprevint + rpm.basicpriorint + 
	     rpm.sef + rpm.sefprev + rpm.sefprior + rpm.sefint + rpm.sefprevint + rpm.sefpriorint - rpm.basicdisc - rpm.sefdisc ) AS netgrandtotal  
FROM revenue r  
	INNER JOIN receiptlist rct ON r.receiptid = rct.objid 
	INNER JOIN rptpaymentmanual rpm ON r.receiptid = rpm.receiptid 
	LEFT JOIN propertyclassification pc ON rpm.classcode = pc.propertycode  
WHERE r.voided = 0 
  AND r.liquidationtimestamp LIKE $P{txntimestamp}  
GROUP BY rpm.classcode  


