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
