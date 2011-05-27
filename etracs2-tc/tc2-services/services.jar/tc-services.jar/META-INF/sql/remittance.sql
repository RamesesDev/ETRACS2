[getList]
SELECT * FROM remittancelist 
ORDER BY txndate DESC, txnno DESC

[getRemittanceByTxnNo]
SELECT * 
FROM remittancelist 
WHERE txnno = $P{txnno} 
ORDER BY txndate DESC, txnno DESC

[getRemittanceByCollector]
SELECT * FROM remittancelist 
WHERE collectorname LIKE CONCAT($P{collectorname}, '%') 
ORDER BY txndate DESC, txnno DESC



[getReceiptsByRemittance]
SELECT * FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno DESC, txndate DESC

[getOtherPaymentsByRemittance]
SELECT pi.* FROM paymentitem pi, receiptlist rl 
WHERE rl.objid = pi.receiptid 
AND NOT pi.paytype = 'CASH' 
AND rl.objid = $P{remittanceid}

[getRemittedFormsByRemittance]
SELECT * FROM remittedform 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, stubno

[getSerialRemittedFormsByRemittance]
SELECT * FROM remittedform 
WHERE remittanceid = $P{remittanceid} 
	AND aftype = 'serial' 
ORDER BY afid, stubno

[getNonSerialRemittedFormsByRemittance]
SELECT * FROM remittedform 
WHERE remittanceid = $P{remittanceid} 
	AND aftype = 'nonserial' 
ORDER BY afid, stubno


[getUnremittedReceipts]
SELECT * FROM receiptlist 
WHERE remittanceid IS NULL 
AND docstate = 'OPEN' 
AND collectorid = $P{collectorid} 
ORDER BY serialno DESC, txndate DESC

[getOtherPayments]
SELECT pi.* FROM paymentitem pi, receiptlist rl 
WHERE rl.objid = pi.receiptid 
AND NOT pi.paytype = 'CASH' 
AND rl.collectorid = $P{collectorid}

[getRemittanceInfo]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( cash ) AS totalcash, 
	SUM( otherpayment ) AS totalotherpayment 
FROM receiptlist rl 
WHERE remittanceid IS NULL 
AND docstate = 'OPEN' 
AND voided = 0 
AND collectorid = $P{collectorid} 

[getAfControls]
SELECT * FROM afcontrol 
WHERE docstate = 'APPROVED' 
AND collectorid = $P{collectorid} 
ORDER BY afid, stubno

[getFundSummaries] 
SELECT o.fundid, o.fundname, SUM( o.amount ) FROM receiptitem ri, receiptlist rl
WHERE ri.receiptid = rl.objid 
	AND rl.collectorid = $P{collectorid}
GROUP BY o.fundid, o.fundname 






[updateAfControlForRemittance]
UPDATE afcontrol SET 
	beginseries = currentseries, 
	beginqty = balance, 
	qtyissued = 0, 
	issuedfrom = 0, 
	issuedto = 0 
WHERE collectorid = $P{collectorid}

[closeAfControl]
UPDATE afcontrol SET 
	docstate = 'CLOSED' 
WHERE beginqty = 0 
  AND docstate = 'OPEN' 
  AND collectorid = $P{collectorid}

[closeReceiptForRemittance]
UPDATE receipt SET 
	docstate = 'CLOSED', 
	remittanceid = $P{remittanceid}, 
	remittanceno = $P{remittanceno}, 
	remittancedate = $P{remittancedate} 
WHERE collectorid = $P{collectorid} 
  AND docstate = 'OPEN' 
  
[closeReceiptListForRemittance]
UPDATE receiptlist SET 
	docstate = 'CLOSED', 
	remittanceid = $P{remittanceid}, 
	remittanceno = $P{remittanceno}, 
	remittancedate = $P{remittancedate}
WHERE collectorid = $P{collectorid} 
  AND docstate = 'OPEN' 
  
  