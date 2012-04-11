[getCollectionSummary]
SELECT objid, iday, txnno, txndate, liquidatingofficername, amount   
FROM liquidationlist  
WHERE iyear = $P{iyear} 
  AND imonth = $P{imonth} 
ORDER BY iday, txnno 

[getFundSummary]  
SELECT 
	ri.fundid, 
	ri.fundname, 
	SUM(CASE WHEN r.voided = 0 THEN ri.amount ELSE 0.0 END) AS amount 
FROM receiptlist r, receiptitem ri, remittancelist rem 
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND rem.liquidationid = $P{liquidationid}
GROUP BY ri.fundid, ri.fundname 
ORDER BY ri.fundname 


[getFundSummaryReceipts]
SELECT 
	r.objid, 
	r.collectorname, 
	rem.txnno AS remittanceno, 
	rem.txndate AS remittancedate, 
	r.mode,  
	r.afid, 
	r.stubno, 
	r.serialno, 
	r.txndate, 
	ri.accttitle, 
	ri.fundname, 
	ri.amount, 
	r.voidreason 
FROM receiptlist r, receiptitem ri, remittancelist rem 
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND rem.liquidationid = $P{liquidationid} 
  AND ri.fundid = $P{fundid}  
  AND r.voided = 0 
ORDER BY rem.txnno, r.afid, r.stubno, r.serialno 




[getNgasAbstractSummary]
SELECT 
	a.objid, 
	a.acctcode,
	a.accttitle,  
	SUM(CASE WHEN r.voided = 0 THEN ri.amount ELSE 0.0 END) AS amount  
FROM receiptlist r, receiptitem ri, remittancelist rem, 
     incomeaccount ia, account a 
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND ri.acctid = ia.objid 
  AND ia.ngasid = a.objid 
  AND rem.liquidationid = $P{liquidationid} 
GROUP BY a.objid, a.acctcode, a.accttitle 
ORDER BY a.acctcode  

[getNgasSummaryReceipts]
SELECT 
	r.objid, 
	r.collectorname, 
	rem.txnno AS remittanceno, 
	rem.txndate AS remittancedate, 
	r.mode,  
	r.afid, 
	r.stubno, 
	r.serialno, 
	r.txndate, 
	ri.accttitle, 
	ri.fundname, 
	ri.amount, 
	r.voidreason 
FROM receiptlist r, receiptitem ri, remittancelist rem, 
     incomeaccount ia, account a 
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND ri.acctid = ia.objid 
  AND ia.ngasid = a.objid 
  AND rem.liquidationid = $P{liquidationid} 
  AND a.objid = $P{acctid} 
  AND r.voided = 0 
ORDER BY rem.txnno, r.afid, r.stubno, r.serialno 



[getSreAbstractSummary]
SELECT 
	a.objid, 
	a.acctcode, 
	a.accttitle,  
	SUM(CASE WHEN r.voided = 0 THEN ri.amount ELSE 0.0 END) AS amount 
FROM receiptlist r, receiptitem ri, remittancelist rem,  
     incomeaccount ia, account a  
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND ri.acctid = ia.objid 
  AND ia.sreid = a.objid 
  AND rem.liquidationid = $P{liquidationid} 
GROUP BY a.objid, a.acctcode, a.accttitle 
ORDER BY a.acctcode  

[getSreSummaryReceipts]
SELECT 
	r.objid, 
	r.collectorname, 
	rem.txnno AS remittanceno, 
	rem.txndate AS remittancedate, 
	r.mode,  
	r.afid, 
	r.stubno, 
	r.serialno, 
	r.txndate, 
	ri.accttitle, 
	ri.fundname, 
	ri.amount, 
	r.voidreason 
FROM receiptlist r, receiptitem ri, remittancelist rem, 
     incomeaccount ia, account a 
WHERE r.objid = ri.receiptid 
  AND r.remittanceid = rem.objid 
  AND ri.acctid = ia.objid 
  AND ia.sreid = a.objid 
  AND rem.liquidationid = $P{liquidationid} 
  AND a.objid = $P{acctid} 
  AND r.voided = 0 
ORDER BY rem.txnno, r.afid, r.stubno, r.serialno 



[getOpenAFControls]
SELECT 
	afid, 
	stubno,  
	aftype, 
	currentseries, 
	beginseries, 
	endseries, 
	beginqty, 
	issuedfrom, 
	issuedto, 
	qtyissued, 
	balance, 
	prefix, 
	suffix, 
	serieslength 
FROM afcontrol 
WHERE collectorid = $P{collectorid} 
  AND docstate <> 'CLOSED' 
ORDER BY afid, stubno, startseries 


[getUnremittedCollections]
SELECT collectorid, collectorname, SUM( amount ) AS amount 
FROM receiptlist 
WHERE collectorid LIKE $P{collectorid}
  AND docstate = 'OPEN' 
  AND voided = 0 
GROUP BY collectorid, collectorname 
ORDER BY collectorname 

[getLastRemittance]
SELECT txnno, txndate  FROM remittancelist  WHERE collectorid = $P{collectorid}  ORDER BY txnno DESC 

[getOpenLiquidations]
SELECT 
	lqofficername AS liquidatingofficername, lqofficertitle AS liquidatingofficertitle, 
	liquidationno AS txnno, liquidationdate AS txndate, amount 
from liquidationrcd 
where docstate = 'OPEN' 
ORDER BY lqofficername, liquidationno  
