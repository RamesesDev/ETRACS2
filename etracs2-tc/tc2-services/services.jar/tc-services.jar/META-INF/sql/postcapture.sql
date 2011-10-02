[getList]
SELECT 
	objid, docstate, dtposted, collectorid, collectorname, collectortitle,  
	postedbyname, amount  
FROM postcapture  
WHERE collectorname LIKE $P{collectorname}  
ORDER BY dtposted DESC  

[getCapturedReceiptsSummaries]
SELECT 
	afid, SUM( CASE WHEN voided = 0 THEN amount ELSE 0.0 END) AS amount, COUNT(*) AS icount  
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND mode = 'CAPTURE'  
  AND docstate = 'CAPTURED' 
GROUP BY afid 

[getCapturedReceipts] 
SELECT 
	objid, afid, serialno, opener, stubno, collectiontype, payorname, payoraddress, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount, 
	voided, voidreason 
FROM receiptlist 
WHERE collectorid = $P{collectorid} 
  AND mode = 'CAPTURE' 
  AND docstate = 'CAPTURED'  
  AND afid = $P{afid} 
ORDER BY stubno, serialno  

[postCapturedReceipts]
UPDATE receipt SET docstate = 'OPEN' WHERE collectorid = $P{collectorid} AND docstate = 'CAPTURED' 

[postCapturedReceiptList]
UPDATE receiptlist SET docstate = 'OPEN' WHERE collectorid = $P{collectorid} AND docstate = 'CAPTURED' 




