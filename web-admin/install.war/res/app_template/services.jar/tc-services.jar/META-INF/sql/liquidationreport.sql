[getOtherPaymentsByLiquidation] 
SELECT pm.amount as amount, pm.paytype as paytype, pm.particulars as particulars  FROM paymentitem pm 
INNER JOIN receiptlist rl on rl.objid = pm.receiptid 
INNER JOIN remittancelist rml on rml.objid = rl.remittanceid 
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 
AND   pm.paytype != 'CASH' 
AND rl.voided = 0 

[getRemittancesByLiquidation] 
SELECT 
		rml.collectorname as collectorname, 
		rml.amount as amount, 
		rml.txnno as txnno, 
		rml.txndate as txndate 
FROM remittancelist rml 
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 

[getRemittedForms]
SELECT 
	rf.afid, rf.beginqty, rf.beginfrom, rf.beginto, 
	rf.receivedqty, rf.receivedfrom, rf.receivedto,  
	rf.issuedqty, rf.issuedfrom, rf.issuedto,  
	rf.endingqty, rf.endingfrom, rf.endingto  
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'serial'  
ORDER BY afid, rf.beginfrom  

[getNonSerialRemittedForms]
SELECT 
	CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END AS receivedamt, 
	CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END AS beginamt, 
	CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END AS issuedamt, 
	CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END AS endingamt, 
	rf.afid, rf.beginqty, rf.receivedqty, rf.issuedqty, rf.endingqty 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'nonserial'  
ORDER BY rf.afid, rf.beginfrom  

[getNonSerialRemittedFormsSummary]
SELECT 
	rf.afid, 
	SUM( CASE WHEN rf.beginqty IS NULL THEN 0 ELSE rf.beginqty END ) AS beginqty,  
	SUM( CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END ) AS beginamt,  
	SUM( CASE WHEN rf.receivedqty IS NULL THEN 0 ELSE rf.receivedqty END ) AS receivedqty,  
	SUM( CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END ) AS receivedamt,  
	SUM( CASE WHEN rf.issuedqty IS NULL THEN 0 ELSE rf.issuedqty END ) AS issuedqty,  
	SUM( CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END ) AS issuedamt, 
	SUM( CASE WHEN rf.endingqty IS NULL THEN 0 ELSE rf.endingqty END ) AS endingqty,   
	SUM( CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END ) AS endingamt  
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'nonserial'  
GROUP BY rf.afid 
ORDER BY rf.afid 

[getCollectionSummaryByAF]
SELECT 
	CASE 
	WHEN af.objid = '51' AND af.aftype = 'serial' AND ia.groupid IS NULL THEN CONCAT( 'AF#', rl.afid, ': ', ri.fundname ) 
	WHEN af.objid = '51' AND af.aftype = 'serial' AND ia.groupid IS NOT NULL THEN CONCAT( 'AF#', rl.afid, ': ', ia.groupid ) 
	WHEN af.aftype = 'nonserial' AND ia.groupid IS NOT NULL THEN CONCAT( rl.afid, ': ', ia.groupid ) 
	ELSE CONCAT( 'AF#',rl.afid, ': ', af.description,' - ', ri.fundname ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount   
FROM receiptitem ri   
INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
INNER JOIN receiptlist rl on rl.objid = ri.receiptid    
INNER JOIN remittancelist rml on rml.objid = rl.remittanceid     
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid     
INNER JOIN af af ON rl.afid = af.objid 
WHERE ll.objid = $P{liquidationid} 
  AND rl.voided = 0   
GROUP BY rl.afid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE CASE WHEN ia.groupid IS NULL THEN ri.fundname ELSE ia.groupid END  END  
ORDER BY rl.afid, ri.fundname, ia.groupid 


[getRemittanceFundTotalByLiquidationAndFund] 
SELECT SUM( o.amount ) as amount, o.remittanceno, o.collectorname 
FROM revenue o 
WHERE o.liquidationid = $P{liquidationid} 
AND   o.fundid = $P{fundid} 
AND o.voided = 0  
GROUP BY o.remittanceno, o.collectorname   

[getFundList] 
SELECT o.objid, o.fundname FROM fund o ORDER BY fundname 

[getRevenueByGLAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS acctcode,  
	a.accttitle AS accttitle, 
	p.acctcode as parentcode, 
	p.accttitle as parenttitle, 
	SUM(r.amount) AS amount 
FROM revenue r 
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.sreid = a.objid 
LEFT JOIN account p on p.objid = a.parentid  
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND r.voided = 0  
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
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.ngasid = a.objid 
LEFT JOIN account p on p.objid = a.parentid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND r.voided = 0   
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, p.acctcode, p.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByIncomeAccountSRE]  
SELECT  
	a.pathbytitle AS pathtitle,   
	a.acctcode AS parentcode,   
	a.accttitle AS parenttitle, 
	r.acctno AS acctcode, 
	r.accttitle AS accttitle, 
	SUM(r.amount) AS amount 
FROM revenue r  
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.sreid = a.objid 
WHERE r.fundid = $P{fundid}   
AND   r.liquidationid = $P{liquidationid}  
AND r.voided = 0  
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, r.acctno, r.accttitle  
ORDER BY a.pathbytitle

[getRevenueByIncomeAccountNGAS]  
SELECT  
	a.pathbytitle AS pathtitle,  
	a.acctcode AS parentcode,
	a.accttitle AS parenttitle,
	r.acctno AS acctcode,  
	r.accttitle AS accttitle,
	SUM(r.amount) AS amount 
FROM revenue r 
INNER JOIN incomeaccount ia ON r.acctid = ia.objid 
LEFT JOIN account a ON ia.ngasid =  a.objid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND   r.fundid = $P{fundid} 
AND r.voided = 0  
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, r.acctno, r.accttitle 
ORDER BY a.pathbytitle 

[getRevenueByLiquidationId]
SELECT 
	lq.amount as liquidationamount, 
	rl.objid as remittanceid,
	rl.amount as remittanceamount, 
	r.collectorname as collectorname,  
	r.receiptdate as receiptdate,  
	r.serialno as serialno, 
	r.payorname as payorname,  
	r.accttitle as accttitle,  
	r.amount as amount, 
	ia.acctno  as acctno,
	r.voided as voided,
	r.afid as afid 
FROM revenue r 
	inner join liquidationlist lq on r.liquidationid = lq.objid  
	inner join remittancelist rl on r.remittanceid = rl.objid 
	inner join incomeaccount ia on r.acctid = ia.objid  
WHERE r.liquidationid = $P{liquidationid} 
ORDER BY r.collectorname, rl.objid, r.afid, r.serialno, r.receiptdate 

