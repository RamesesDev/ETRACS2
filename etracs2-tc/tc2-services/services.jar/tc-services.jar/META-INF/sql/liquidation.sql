[getList]
SELECT * FROM liquidationlist 
ORDER BY txndate DESC, txnno DESC


[getUnliquidatedRemittanceByLiquidatingOfficer]
SELECT * FROM remittancelist 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid}  
ORDER BY txndate, txnno 


[getUnliquidatedRemittanceOtherPaymentsByLiquidatingOfficer]
SELECT pay.* 
FROM paymentitem pay, receiptlist rl, remittancelist rml 
WHERE rml.liquidatingofficerid = $P{liquidatingofficerid} 
AND rml.docstate = 'OPEN' 
AND rml.objid = rl.remittanceid 
AND rl.objid = pay.receiptid 
AND NOT pay.paytype = 'CASH'

[updateReceiptItemRcdId]
UPDATE receiptitem ri, receiptlist r, remittancelist rem, incomeaccount ia SET  
	ri.liquidationrcdid = $P{liquidationrcdid}  
WHERE ri.receiptid = r.objid  
  AND ri.acctid = ia.objid  
  AND r.remittanceid = rem.objid  
  AND rem.liquidationid = $P{liquidationid}   
  AND ia.fundid = $P{fundid} 

[updateNonCashPaymentLiquidationId]
UPDATE paymentitem SET 
	liquidationid = $P{liquidationid}, 
	liquidationrcdid = $P{liquidationrcdid} 
WHERE objid = $P{objid}	 
	


[getUnliquidatedRemittanceInfoByLiquidatingOfficer]
SELECT 
	SUM( amount ) AS totalamount, 
	SUM( totalcash ) AS totalcash, 
	SUM( totalotherpayment ) AS totalotherpayment 
FROM remittancelist 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid} 


[getOpenFundSummaries]
SELECT 
	ia.fundid, 
	ia.fundname, 
	null AS cashierid, 
	null AS cashiername, 
	null AS cashiertitle, 
	SUM(ri.amount) AS cash, 
	0.0 AS noncash, 
	SUM( ri.amount) AS amount 
FROM receiptlist rct  
	INNER JOIN receiptitem ri ON rct.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
	INNER JOIN remittancelist rem ON rct.remittanceid = rem.objid  
WHERE rem.liquidatingofficerid = $P{lqofficerid}  
  AND rem.docstate = 'OPEN' 
  AND rct.voided = 0 
GROUP BY ia.fundid, ia.fundname 
ORDER BY ia.fundname  





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

[getRemittancesByLiquidationByFund]
SELECT rl.collectorname, rl.collectortitle, 
	rl.txnno, rl.txndate,  SUM( ri.amount ) AS amount 
FROM remittancelist rl 
	INNER JOIN receiptlist r ON rl.objid = r.remittanceid 
	INNER JOIN receiptitem ri ON r.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid 
WHERE rl.liquidationid = $P{liquidationid}  
  AND ia.fundid = $P{fundid} 
  AND r.voided = 0 
GROUP BY rl.collectorname, rl.collectortitle, rl.txnno, rl.txndate 
ORDER BY rl.txnno  


[getCollectionSummaryByAFByFund]
SELECT 
	CASE 
	WHEN af.objid = '51' AND af.aftype = 'serial' AND ia.groupid IS NULL THEN CONCAT( 'AF#', rl.afid, ': ', ri.fundname ) 
	WHEN af.objid = '51' AND af.aftype = 'serial' AND ia.groupid IS NOT NULL THEN CONCAT( 'AF#', rl.afid, ': ', ia.groupid ) 
	WHEN af.aftype = 'nonserial' AND ia.groupid IS NOT NULL THEN CONCAT( rl.afid, ': ', ia.groupid ) 
	ELSE CONCAT( 'AF#',rl.afid, ': ', af.description,' - ', ri.fundname ) 
	END AS particulars, 
	SUM( ri.amount ) AS  amount   
FROM receiptitem ri   
INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
INNER JOIN receiptlist rl on rl.objid = ri.receiptid    
INNER JOIN remittancelist rml on rml.objid = rl.remittanceid     
INNER JOIN liquidationlist ll on ll.objid = rml.liquidationid     
INNER JOIN af af ON rl.afid = af.objid 
WHERE ll.objid = $P{liquidationid} 
  AND rl.voided = 0   
  AND ia.fundid = $P{fundid} 
GROUP BY rl.afid, CASE WHEN af.aftype = 'nonserial' THEN ri.fundname ELSE CASE WHEN ia.groupid IS NULL THEN ri.fundname ELSE ia.groupid END  END  
ORDER BY rl.afid, ri.fundname, ia.groupid 

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


[closeRemittanceByLiquidatingOfficer]
UPDATE remittance SET 
	docstate = 'CLOSED', 
	liquidationid = $P{liquidationid}, 
	liquidationno = $P{liquidationno}, 
	liquidationdate = $P{liquidationdate} 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid}


[closeRemittanceListByLiquidatingOfficer]
UPDATE remittancelist  
SET docstate = 'CLOSED', 
	liquidationid = $P{liquidationid}, 
	liquidationno = $P{liquidationno} 
WHERE docstate = 'OPEN' 
AND liquidatingofficerid = $P{liquidatingofficerid} 

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





