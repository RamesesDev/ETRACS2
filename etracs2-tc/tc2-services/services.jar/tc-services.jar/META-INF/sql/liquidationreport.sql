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
	rf.afid, rf.beginqty, rf.receivedqty, rf.issuedqty, rf.endingqty 
FROM liquidationlist lq 
	INNER JOIN remittancelist rem ON lq.objid = rem.liquidationid 
	INNER JOIN remittedform rf ON rem.objid = rf.remittanceid 
WHERE lq.objid = $P{liquidationid} 
  AND rf.aftype = 'nonserial'  
ORDER BY afid, rf.beginfrom  


[getCollectionSummaryByAF]
SELECT 
	CASE WHEN af.aftype = 'serial' 
		THEN CONCAT( 'AF#', rl.afid, ': ', af.description, ' - ', ri.fundname) 
		ELSE CONCAT( rl.afid, ': ', af.description, ' - ', ri.fundname ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount  
FROM receiptitem ri   
INNER JOIN receiptlist rl on rl.objid = ri.receiptid   
INNER JOIN remittancelist rml on rml.objid = rl.remittanceid    
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid    
INNER JOIN af af ON rl.afid = af.objid 
WHERE ll.objid = $P{liquidationid}   
  AND rl.voided = 0   
GROUP BY rl.afid, ri.fundname  


[getRemittanceFundTotalByLiquidationAndFund] 
SELECT SUM( o.amount ) as amount, o.remittanceno, o.collectorname 
FROM revenue o 
WHERE o.liquidationid = $P{liquidationid} 
AND   o.fundid = $P{fundid} 
AND o.voided = 0  
GROUP BY o.remittanceno, o.collectorname   

[getFundList] 
SELECT o.objid, o.fundname FROM fund o 

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
	r.collectorname as collectorname,  
	r.receiptdate as receiptdate,  
	r.serialno as serialno, 
	r.payorname as payorname,  
	r.accttitle as accttitle,  
	r.amount as amount, 
	r.acctno as acctno,
	r.voided as voided,
	r.afid as afid 
FROM revenue r 
WHERE r.liquidationid = $P{liquidationid}
ORDER BY r.serialno, r.receiptdate