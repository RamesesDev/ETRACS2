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

[getListByCollectorid]
SELECT * FROM remittancelist 
WHERE collectorid = $P{collectorid} 
ORDER BY txndate DESC, txnno DESC

[getRemittanceByTxnNoByCollectorid]
SELECT * 
FROM remittancelist 
WHERE txnno = $P{txnno} 
AND collectorid = $P{collectorid} 
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
AND rl.docstate = 'OPEN'

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

[getReceiptsByRemittanceAllCollectionType]
SELECT * FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno DESC, txndate DESC 

[getReceiptsByRemittanceCollectionType]
SELECT * FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
	AND collectiontypeid = $P{collectiontypeid} 
ORDER BY afid, serialno DESC, txndate DESC

[getReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
ORDER BY rl.afid, rl.serialno, ri.accttitle 

[getReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
ORDER BY rl.afid, rl.serialno, ri.accttitle

[getIncomeAccuntSummaryByAllFund] 
SELECT 
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
GROUP BY ri.acctid, ri.accttitle 
ORDER BY ri.accttitle 

[getIncomeAccuntSummaryByFund]
SELECT 
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
GROUP BY ri.acctid, ri.accttitle 
ORDER BY ri.accttitle

[getSerialReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, rl.serialno, ri.accttitle

[getSerialReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, rl.serialno, ri.accttitle

[getNonSerialReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	ri.amount AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, rl.serialno, ri.accttitle

[getNonSerialReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	rl.paidby AS payer, 
	ri.fundname AS fundname, 
	ri.accttitle AS particulars, 
	ri.amount AS amount 
FROM receiptlist rl, receiptitem ri, af af 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid = $P{fundid} 
	AND rl.afid = af.objid 
	AND af.aftype = 'serial' 
ORDER BY rl.afid, rl.serialno, ri.accttitle




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
  
  