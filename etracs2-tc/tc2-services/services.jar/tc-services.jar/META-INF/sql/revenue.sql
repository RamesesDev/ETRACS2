[postRemittance] 
INSERT INTO revenue 
( 
	objid, 
	docstate, 
	remittanceid, 
	remittanceno, 
	remittancedate, 
	remittancetimestamp, 
	collectorid, 
	collectorname, 
	collectortitle, 
	receipttype, 
	receiptid, 
	receiptdate, 
	receiptamount, 
	receiptitemid, 
	afid, 
	afcontrolid, 
	stubno, 
	serialno, 
	payorname, 
	payoraddress, 
	acctid, 
	acctno, 
	accttitle, 
	fundid, 
	fundname, 
	ngasid, 
	sreid, 
	amount, 
	voided
	)
SELECT 
	ri.objid AS objid, 
	'REMITTED' AS docstate, 
	rem.objid AS remittanceid, 
	rem.txnno AS remittanceno, 
	rem.txndate AS remittancedate, 
	$P{timestamp} AS remittancetimestamp, 
	rct.collectorid, 
	rct.collectorname, 
	rct.collectortitle, 
	rct.doctype AS receipttype, 
	rct.objid AS receiptid, 
	rct.txndate AS receiptdate, 
	CASE WHEN rct.voided = 0 THEN rct.amount ELSE 0.0 END AS receiptamount, 
	ri.objid AS receiptitemid, 
	rct.afid, 
	rct.afcontrolid, 
	rct.stubno, 
	rct.serialno, 
	rct.payorname, 
	rct.payoraddress, 
	ri.acctid, 
	ri.acctno, 
	ri.accttitle, 
	ri.fundid, 
	ri.fundname, 
	ia.ngasid, 
	ia.sreid, 
	CASE WHEN rct.voided = 0 THEN ri.amount ELSE 0.0 END AS amount,  
	rct.voided 
FROM remittancelist rem, receiptlist rct, receiptitem ri, incomeaccount ia   
WHERE rem.objid = rct.remittanceid  
  AND rct.objid = ri.receiptid   
  AND ri.acctid = ia.objid  
  AND rem.objid = $P{remittanceid} 


[postLiquidation]
UPDATE liquidationlist l, remittance rem, revenue rev  set
	rev.docstate = 'LIQUIDATED',
	rev.liquidationid = l.objid,
	rev.liquidationno  = l.txnno,
	rev.liquidationdate = l.txndate,
	rev.liquidationtimestamp = $P{timestamp} 
WHERE l.objid = rem.liquidationid  
  AND rem.objid = rev.remittanceid  
  AND l.objid = $P{liquidationid} 
  
  
[postLiquidationByRcd]  
UPDATE liquidationrcd lr, receiptitem ri, revenue rev set
	rev.docstate = 'LIQUIDATED',
	rev.liquidationid = lr.liquidationid,
	rev.liquidationrcdid = lr.objid, 
	rev.liquidationno  = lr.liquidationno,
	rev.liquidationdate = lr.liquidationdate,
	rev.liquidationtimestamp = $P{timestamp} 
WHERE lr.objid = ri.liquidationrcdid 
  AND rev.receiptitemid = ri.objid 
  AND lr.objid = $P{liquidationrcdid} 
 


[postDeposit]
UPDATE deposit d, liquidationlist l, revenue rev  set
	rev.docstate = 'DEPOSITED',
	rev.depositid = d.objid,
	rev.depositno  = d.txnno,
	rev.depositdate = d.dtposted,
	rev.deposittimestamp = $P{timestamp} 
WHERE d.objid = l.depositid
  AND l.objid = rev.liquidationid 
  AND d.objid = $P{depositid}
  
[postDepositByCashier]
UPDATE deposit d, liquidationrcd l, revenue rev  set 
	rev.docstate = 'DEPOSITED', 
	rev.depositid = d.objid, 
	rev.depositno  = d.txnno,
	rev.depositdate = d.dtposted,
	rev.deposittimestamp = $P{timestamp} 
WHERE d.objid = l.depositid 
  AND l.objid = rev.liquidationrcdid  
  AND d.objid = $P{depositid} 
