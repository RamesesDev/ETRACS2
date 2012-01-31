
[voidBPPayment]
UPDATE bppayment 
SET voided = 1 
WHERE receiptid = $P{receiptid}  

[deleteBPPayment]
DELETE bppayment 
WHERE receiptid = $P{receiptid} 

[getBPPReportLists]
SELECT 
	b.tradename,
	b.businessaddress,
	b.taxpayername,
	e.entityaddress AS taxpayeraddress,
	SUM(CASE WHEN ia.systype = 'BUSINESS_TAX' THEN bpp.amount + bpp.surcharge + bpp.interest - bpp.discount ELSE 0.0 END )AS businesstax, 
	SUM(CASE WHEN ia.systype = 'REG_FEE' THEN bpp.amount + bpp.surcharge + bpp.interest - bpp.discount ELSE 0.0 END) AS regfee, 
	SUM(CASE WHEN ia.systype IS NULL OR ia.systype NOT IN( 'BUSINESS_TAX', 'REG_FEE') THEN bpp.amount + bpp.surcharge + bpp.interest - bpp.discount ELSE 0.0 END) AS otherfee, 
	sum( bpp.total ) as total 
FROM bppayment bpp 
INNER JOIN business b ON b.applicationid = bpp.applicationid 
INNER JOIN incomeaccount ia ON ia.objid = bpp.acctid  
INNER JOIN entity e ON e.objid = b.taxpayerid 
WHERE bpp.iyear = $P{iyear} 
 AND bpp.iqtr = $P{iqtr} 
 AND bpp.imonth LIKE $P{imonth} 
 AND bpp.iday LIKE $P{iday} 
 AND voided = 0 
GROUP BY b.tradename, b.businessaddress, b.taxpayername, e.entityaddress  


