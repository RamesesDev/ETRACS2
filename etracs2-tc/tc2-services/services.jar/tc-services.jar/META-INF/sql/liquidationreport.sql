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
