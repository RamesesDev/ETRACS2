[getList]
SELECT * FROM liquidationlist 
ORDER BY txndate DESC, txnno DESC


[getUnliquidatedRemittanceByLiquidatingOfficer]
SELECT * FROM remittancelist 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid}  
ORDER BY txndate DESC, txnno DESC


[getUnliquidatedRemittanceOtherPaymentsByLiquidatingOfficer]
SELECT pay.* 
FROM paymentitem pay, receiptlist rl, remittancelist rml 
WHERE rml.liquidatingofficerid = $P{liquidatingofficerid} 
AND rml.docstate = 'OPEN' 
AND rml.objid = rl.remittanceid 
AND rl.objid = pay.receiptid 
AND NOT pay.paytype = 'CASH'

[getUnliquidatedRemittanceInfoByLiquidatingOfficer]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( totalcash ) AS totalcash, 
	SUM( totalotherpayment ) AS totalotherpayment 
FROM remittancelist 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid} 



[getUnliquidatedRemittanceByCollector]
SELECT * FROM remittancelist 
WHERE docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

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
AND r.voided = 0 
AND r.objid = pay.receiptid 

[getFundSummaries] 
SELECT fundid, fundname, SUM( amount ) FROM revenue 
WHERE liquidationid = $P{liquidationid} AND voided = 0 
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

[getOtherPaymentNoLiq]
SELECT  
 rl.objid, rl.remittanceid, r.objid, r.liquidationid,
 i.receiptid, i.paytype, i.particulars, i.amount 
FROM remittance r 
INNER JOIN receiptlist rl ON rl.remittanceid = r.objid 
INNER JOIN paymentitem i ON i.receiptid = rl.objid  
WHERE rl.voided = 0  
 AND r.liquidationid IS NULL 
 AND paytype = 'CHECK' 





