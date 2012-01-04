[getList]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
   AND docstate LIKE $P{docstate} 
ORDER BY afid, serialno 

[getList2]
SELECT * FROM receiptlist 

[getListBySerialNo]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
  AND docstate LIKE $P{docstate} 
  AND serialno = $P{serialno} 
  
[getListByStubNo]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
  AND docstate LIKE $P{docstate} 
  AND stubno = $P{stubno} 
ORDER BY afid, serialno 

[getListByTxnDate]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
  AND docstate LIKE $P{docstate} 
  AND txndate = $P{txndate} 
ORDER BY afid, serialno 

[getListByPayor]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
  AND docstate LIKE $P{docstate} 
  AND payorname LIKE $P{payorname} 
ORDER BY afid, serialno 

[getListByPaidBy]
SELECT * FROM receiptlist 
WHERE collectorid LIKE $P{collectorid} 
  AND docstate LIKE $P{docstate} 
  AND paidby LIKE $P{paidby} 
ORDER BY afid, serialno 

[getState]
SELECT docstate FROM receipt WHERE objid = $P{objid}

[getVoidedStatus]
SELECT voided FROM receipt WHERE objid = $P{objid}

[getSerialNo]
SELECT serialno FROM receiptlist WHERE objid = $P{objid} 

[getFundName]
SELECT fundname FROM fund WHERE objid = $P{objid} 


[checkDuplicateSerialNo]
SELECT objid, serialno FROM receiptlist WHERE serialno = $P{serialno} AND afid = $P{afid} 



[voidReceipt]
UPDATE receipt SET voided = 1, voidreason = $P{voidreason} WHERE objid = $P{objid} 

[voidReceiptList]
UPDATE receiptlist SET voided = 1, voidreason = $P{voidreason} WHERE objid = $P{objid} 


[deleteReceipt]
DELETE FROM receipt WHERE objid = $P{objid}

[deleteReceiptList]
DELETE FROM receiptlist WHERE objid = $P{objid}

[deleteReceiptItem]
DELETE FROM receiptitem WHERE receiptid = $P{receiptid}

[deletePaymentItem]
DELETE FROM paymentitem WHERE receiptid = $P{receiptid}




