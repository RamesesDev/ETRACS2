[getOtherPaymentsByLiquidation] 
SELECT pm.amount as amount, pm.paytype as paytype, pm.particulars as particulars  FROM paymentitem pm 
INNER JOIN receiptlist rl on rl.objid = pm.receiptid 
INNER JOIN remittancelist rml on rml.objid = rl.remittanceid 
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 
AND   pm.paytype != 'CASH' 

[getRemittancesByLiquidation] 
SELECT 
		rml.collectorname as collectorname, 
		rml.amount as amount, 
		rml.txnno as txnno, 
		rml.txndate as txndate 
FROM remittancelist rml 
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid 
WHERE ll.objid = $P{liquidationid} 

[getRemittanceFundTotalByLiquidationAndFund] 
SELECT SUM( o.amount ) as amount, o.remittanceno, o.collectorname FROM revenue o 
WHERE o.liquidationid = $P{liquidationid} 
AND   o.fundid = $P{fundid} 
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
INNER JOIN account a ON a.objid = r.sreid  
INNER JOIN account p on p.objid = a.parentid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
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
INNER JOIN account a ON a.objid = r.ngasid 
INNER JOIN account p on p.objid = a.parentid 
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
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
INNER JOIN account a ON a.objid = r.sreid  
WHERE r.fundid = $P{fundid}   
AND   r.liquidationid = $P{liquidationid}  
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
INNER JOIN account a ON a.objid = r.ngasid  
WHERE r.fundid = $P{fundid} 
AND   r.liquidationid = $P{liquidationid} 
AND   r.fundid = $P{fundid} 
GROUP BY a.pathbytitle, a.acctcode, a.accttitle, r.acctno, r.accttitle 
ORDER BY a.pathbytitle 