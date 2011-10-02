[getList]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
ORDER BY txnno  

[getListByTxnno]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
WHERE txnno = $P{txnno} 
ORDER BY txnno  

[getListByDepositor]
SELECT objid, docstate, txnno, txndate, depositedbyname, depositedbytitle, cash, noncash, amount 
FROM deposit 
WHERE depositedbyname LIKE $P{depositedbyname}  
ORDER BY txnno  

[getState]
SELECT docstate FROM deposit WHERE objid = $P{objid} 

[getOpenLiquidations] 
SELECT 
	objid, txnno, txndate, amount, 
	liquidatingofficerid, liquidatingofficername, liquidatingofficertitle 
FROM liquidationlist 
WHERE docstate = 'OPEN'  

[getOpenFundSummaries]
SELECT 
	ri.fundid, ri.fundname, 
	ba.objid AS bankacctid, 
	ba.acctno AS bankacctno,
	ba.bankcode, bankacctname, 
	ba.bankname, 
	ba.branchname, 
	ba.accttype,
	SUM( ri.amount ) AS cash,  
	0.0 AS noncash, 
	SUM( ri.amount ) AS amount 
FROM liquidationlist lq, remittancelist rem, receiptlist r, receiptitem ri, bankaccount ba, fund f 
WHERE lq.objid = rem.liquidationid 
  AND rem.objid = r.remittanceid  
  AND r.objid = ri.receiptid  
  AND ri.fundid = ba.fundid  
  AND ri.fundid = f.objid  
  AND lq.docstate = 'OPEN' 
  AND r.voided = 0 
GROUP BY ri.fundid, ba.objid, ba.bankcode, ba.bankname, ba.branchname 

[getOpenNonCashPayments]
SELECT 
	p.objid AS paymentitemid, 
	p.paytype, 
	p.particulars, 
	p.amount, 
	'SYSTEM' AS source, 
	p.extended 
FROM liquidationlist l, remittancelist rem, receipt r, paymentitem p 
WHERE l.objid = rem.liquidationid 
  AND rem.objid = r.remittanceid  
  AND r.objid = p.receiptid  
  AND l.docstate = 'OPEN'  
  AND p.paytype <> 'CASH'  
  AND r.voided = 0 
ORDER BY paytype, particulars  

[depositOpenLiquidation]
UPDATE liquidation SET 
	docstate  = 'CLOSED', 
	depositid = $P{depositid},
	dtdeposited = $P{dtdeposited}  
WHERE docstate = 'OPEN'	 

[depositOpenLiquidationList]
UPDATE liquidationlist SET 
	docstate  = 'CLOSED', 
	depositid = $P{depositid}, 
	dtdeposited = $P{dtdeposited} 
WHERE docstate = 'OPEN'	 


