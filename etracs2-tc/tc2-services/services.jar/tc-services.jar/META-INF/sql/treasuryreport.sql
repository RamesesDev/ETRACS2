[getRevenueByGLAccountNGAS]   
SELECT   
	'NGAS' AS chartcode, 
	'NGAS' AS charttitle, 
	c.target as target,
	a.acctcode AS acctcode, 
	a.accttitle AS accttitle, 
	SUM( r.amount ) AS amount 
FROM revenue r 
INNER JOIN account c ON c.objid = 'NGAS' 
INNER JOIN account a ON a.objid = r.ngasid 
WHERE r.fundid = $P{fundid} 
  AND r.liquidationtimestamp LIKE $P{liqtimestamp} 
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle, a.target 
ORDER BY a.acctcode  

[getRevenueByGLAccountSRE]   
SELECT  
	'SRE' AS chartcode, 
	'SRE' AS charttitle, 
	c.target AS target,
	a.acctcode AS acctcode, 
	a.accttitle AS accttitle, 
	SUM( r.amount ) AS amount 
FROM revenue r 
INNER JOIN account c ON c.objid = 'SRE' 
INNER JOIN account a ON a.objid = r.sreid 
WHERE r.fundid = $P{fundid} 
  AND r.liquidationtimestamp LIKE $P{liqtimestamp} 
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle, a.target 
ORDER BY a.acctcode 

[getRevenueByIncomeAccountSRE]   
SELECT  
	'SRE' AS chartcode, 
	'SRE' AS charttitle, 
	a.acctcode AS glcode,   
	a.accttitle AS gltitle,  
	a.target as gltarget,
	CASE WHEN r.acctno IS NULL THEN '' ELSE r.acctno END AS slcode, 
	r.accttitle AS sltitle,
	SUM(r.amount) AS slamount 
FROM revenue r  
INNER JOIN account a ON a.objid = r.sreid    
WHERE r.fundid = $P{fundid} 
  AND r.liquidationtimestamp LIKE $P{liqtimestamp}  
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle, r.acctno, r.accttitle, a.target 
ORDER BY a.acctcode 

[getRevenueByIncomeAccountNGAS]  
SELECT  
	'NGAS' AS chartcode, 
	'NGAS' AS charttitle, 
	a.acctcode AS glcode,   
	a.accttitle AS gltitle,  
	a.target as gltarget, 
	CASE WHEN r.acctno IS NULL THEN '' ELSE r.acctno END AS slcode, 
	r.accttitle AS sltitle, 
	SUM(r.amount) AS slamount  
FROM revenue r 
INNER JOIN account a ON a.objid = r.ngasid   
WHERE r.fundid = $P{fundid}  
  AND r.liquidationtimestamp LIKE $P{liqtimestamp} 
  AND r.voided = 0 
GROUP BY a.acctcode, a.accttitle, r.acctno, r.accttitle, a.target 
ORDER BY a.acctcode 

[getChartList] 
SELECT o.objid, o.acctcode, o.accttitle FROM account o 
WHERE o.accttype = 'CHART' 

[getFundList]
SELECT o.objid, o.fundname FROM fund o 
