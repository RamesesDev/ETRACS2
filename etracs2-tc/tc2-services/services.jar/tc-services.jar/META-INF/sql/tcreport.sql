[getFundList]
SELECT objid AS fundid, fundname  FROM fund ORDER BY fundname 


[getAbstractOfCollection]
SELECT afid, serialno, receiptdate, payorname, payoraddress, accttitle, fundname, amount, collectorname, collectortitle  
FROM revenue  
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
ORDER BY afid, serialno  


[getAbstractAccountSummaries]
SELECT accttitle, fundname, SUM(amount) AS amount 
FROM revenue  
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY fundname, accttitle 
ORDER BY fundname, accttitle 



[getRevenueByGLAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.sreid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByGLAccountNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS acctcode,   
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.ngasid 
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 




[getStatementOfRevenueSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.sreid  
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getStatementOfRevenueNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS acctcode,   
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
	LEFT JOIN account a ON a.objid = r.ngasid 
	LEFT JOIN account p on p.objid = a.parentid 
WHERE liquidationtimestamp LIKE $P{txntimestamp}  
  AND fundid LIKE $P{fundid} 
  AND voided = 0 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 


#-------------------------------------------
# Report of Collection 2
#-------------------------------------------
[getAffectedNGLListingNGAS]
SELECT DISTINCT 
	p.objid AS parentglacctid,
	p.acctcode AS parentglcode,  
	p.accttitle AS parentgltitle,  
	a.objid AS glacctid, 
	a.acctcode AS glcode, 
	a.accttitle AS gltitle  
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp} 
  AND r.voided = 0 
ORDER BY p.acctcode, a.acctcode 


[getReportOfCollection2NGAS]
SELECT  
	p.acctcode AS parentglacctcode, 
	p.accttitle AS parentglaccttitle, 
	a.acctcode AS glacctcode, 
	a.accttitle AS glaccttitle,  
	r.receiptid, r.remittanceno, r.receiptdate, r.serialno, r.payorname, r.collectorname,  
	r.acctid, r.amount, p.objid AS parentglacctid, a.objid AS glacctid 
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}  
  AND r.voided = 0  
ORDER BY p.acctcode, a.acctcode, r.collectorname, r.remittanceno, r.serialno 

[getReportOfCollection2SRE]
SELECT  
	p.acctcode AS parentglacctcode, 
	p.accttitle AS parentglaccttitle, 
	a.acctcode AS glacctcode, 
	a.accttitle AS glaccttitle,  
	r.receiptid, r.remittanceno, r.receiptdate, r.serialno, r.payorname, r.collectorname,  
	r.acctid, r.amount, p.objid AS parentglacctid, a.objid AS glacctid 
FROM revenue r  
	LEFT JOIN incomeaccount ia ON r.acctid = ia.objid   
	LEFT JOIN account a ON ia.sreid = a.objid   
	LEFT JOIN account p ON a.parentid = p.objid  
WHERE r.liquidationtimestamp LIKE $P{txntimestamp}  
  AND ia.fundid LIKE $P{fundid}  
  AND r.voided = 0  
ORDER BY p.acctcode, a.acctcode, r.collectorname, r.remittanceno, r.serialno 







