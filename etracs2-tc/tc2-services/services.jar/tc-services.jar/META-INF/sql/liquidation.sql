[getList]
SELECT * FROM liquidationlist 
ORDER BY txndate DESC, txnno DESC




[getUnliquidatedRemittanceByCollector]
SELECT * FROM remittancelist 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

[getUnliquidatedRemittanceInfoByCollector]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( totalcash ) AS totalcash, 
	SUM( totalotherpayment ) AS totalotherpayment 
FROM remittancelist 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY txnno DESC, txndate DESC

[getUnliquidatedRemittanceOtherPaymentsByCollector]
SELECT pay.* 
FROM paymentitem pay, receiptlist rl, remittancelist rml 
WHERE rml.collectorid = $P{collectorid} 
AND rml.docstate = 'OPEN' 
AND rml.objid = rl.remittanceid 
AND rl.objid = pay.receiptid 
AND NOT pay.paytype = 'CASH'

[getRemittancesByLiquidation]
SELECT * 
FROM remittancelist 
WHERE liquidationid = $P{liquidationid} 
ORDER BY txnno DESC, txndate DESC 

[getOtherPaymentsByLiquidation]
SELECT pay.* 
FROM paymentitem pay, receiptlist r, remittancelist rm 
WHERE rm.liquidationid = $P{liquidationid} 
AND NOT pay.paytype = 'CASH' 
AND rm.objid = r.remittanceid 
AND r.objid = pay.receiptid 

[getFundSummaries] 
SELECT fundid, fundname, SUM( amount ) FROM revenue 
WHERE liquidationid = $P{liquidationid} 
GROUP BY fundid, fundname 





[closeRemittances]
UPDATE remittance SET 
	docstate = 'CLOSED', 
	liquidationid = $P{liquidationid}, 
	liquidationno = $P{liquidationno}, 
	liquidationdate = $P{liquidationdate} 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid}


[closeRemittanceLists]
UPDATE remittancelist 
SET docstate = 'CLOSED', 
	liquidationid = $P{liquidationid}, 
	liquidationno = $P{liquidationno} 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid}
