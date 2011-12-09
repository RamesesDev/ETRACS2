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

[getLiquidatingOfficer]
SELECT lq.* FROM etracsuser lq WHERE lq.objid IN (	
	select c.lqofficerid from etracsuser c WHERE c.objid = $P{collectorid}
)




[getReceiptsByRemittance]
SELECT * FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno DESC, txndate DESC

[getOtherPaymentsByRemittance]
SELECT pi.* FROM paymentitem pi, receiptlist rl 
WHERE rl.objid = pi.receiptid 
AND rl.voided = 0 
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
SELECT 
	CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END AS receivedamt, 
	CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END AS beginamt, 
	CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END AS issuedamt, 
	CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END AS endingamt, 
	rf.* 
FROM remittedform rf 
	INNER JOIN af af ON rf.afid = af.objid 
WHERE rf.remittanceid = $P{remittanceid} 
	AND rf.aftype = 'nonserial' 
ORDER BY rf.afid, rf.stubno

[getNonSerialRemittedFormsSummary]
SELECT 
	rf.afid, 
	SUM( CASE WHEN rf.beginqty IS NULL THEN 0 ELSE rf.beginqty END ) AS beginqty,  
	SUM( CASE WHEN rf.beginqty >= 0 THEN rf.beginqty * af.denomination ELSE 0.0 END ) AS beginamt,  
	SUM( CASE WHEN rf.receivedqty IS NULL THEN 0 ELSE rf.receivedqty END ) AS receivedqty,  
	SUM( CASE WHEN rf.receivedqty >= 0 THEN rf.receivedqty * af.denomination ELSE 0.0 END ) AS receivedamt,  
	SUM( CASE WHEN rf.issuedqty IS NULL THEN 0 ELSE rf.issuedqty END ) AS issuedqty,  
	SUM( CASE WHEN rf.issuedqty >= 0 THEN rf.issuedqty * af.denomination ELSE 0.0 END ) AS issuedamt, 
	SUM( CASE WHEN rf.endingqty IS NULL THEN 0 ELSE rf.endingqty END ) AS endingqty,   
	SUM( CASE WHEN rf.endingqty >= 0 THEN rf.endingqty * af.denomination ELSE 0.0 END ) AS endingamt  
FROM remittedform rf  
	INNER JOIN af af ON rf.afid = af.objid  
WHERE rf.remittanceid = $P{remittanceid}  
  AND rf.aftype = 'nonserial' 
GROUP BY rf.afid 
ORDER BY rf.afid 

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
AND rl.voided = 0 
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
SELECT 
	afid, 
	serialno, 
	txndate, paidby, 
	CASE WHEN voided = 0 THEN collectiontype ELSE '***VOIDED***' END AS collectiontype, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
ORDER BY afid, serialno 

[getReceiptsByRemittanceCollectionType]
SELECT 
	afid, 
	serialno, 
	txndate, paidby, 
	CASE WHEN voided = 0 THEN collectiontype ELSE '***VOIDED***' END AS collectiontype, 
	CASE WHEN voided = 0 THEN amount ELSE 0.0 END AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
	AND collectiontypeid = $P{collectiontypeid} 
ORDER BY afid, serialno 

[getReceiptDetailsByAllFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	ri.fundname AS fundname, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '***VOIDED***' END AS payer, 
	CASE WHEN rl.voided = 0 THEN ri.accttitle ELSE '***VOIDED***' END AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
ORDER BY rl.afid, rl.serialno

[getReceiptDetailsByFund]
SELECT 
	rl.afid AS afid, 
	rl.serialno AS serialno, 
	rl.txndate AS txndate, 
	ri.fundname AS fundname, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '***VOIDED***' END AS payer, 
	CASE WHEN rl.voided = 0 THEN ri.accttitle ELSE '***VOIDED***' END AS particulars, 
	CASE WHEN rl.voided = 0 THEN ri.amount ELSE 0.0 END AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND ri.fundid LIKE $P{fundid} 
ORDER BY  rl.afid, rl.serialno, rl.paidby, ri.accttitle 
	
[getIncomeAccuntSummaryByAllFund] 
SELECT 
	ri.fundname, 
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
	AND rl.remittanceid = $P{remittanceid} 
	AND rl.voided = 0 
GROUP BY ri.acctid, ri.accttitle 
ORDER BY ri.fundname, ri.accttitle 

[getIncomeAccuntSummaryByFund]
SELECT 
	ri.fundname,
	ri.acctid AS acctid, 
	ri.accttitle AS acctname, 
	SUM( ri.amount ) AS amount 
FROM receiptlist rl, receiptitem ri 
WHERE rl.objid = ri.receiptid 
  AND rl.remittanceid = $P{remittanceid} 
  AND ri.fundid LIKE $P{fundid} 
  AND rl.voided = 0 
GROUP BY ri.fundname, ri.acctid, ri.accttitle 
ORDER BY ri.fundname, ri.accttitle

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
ORDER BY rl.afid, ri.accttitle, rl.serialno 

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
ORDER BY rl.afid, ri.accttitle, rl.serialno 

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
ORDER BY rl.afid, ri.accttitle

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
ORDER BY rl.afid, ri.accttitle 


[getCashTicketSummary]
SELECT  
	u.name AS particulars,  
	SUM(ri.amount) AS amount  
FROM receiptlist rl, receiptitem ri, etracsuser u, af af 
WHERE rl.objid = ri.receiptid  
  AND rl.capturedbyid = u.objid  
  AND rl.afid = af.objid  
  AND rl.remittanceid = $P{remittanceid}  
  AND rl.mode = 'CAPTURE'  
  AND ri.fundid LIKE 'GENERAL'   
  AND rl.voided = 0 
  AND af.aftype = 'nonserial'  
GROUP BY u.name  
ORDER BY u.name  

 

[updateAfControlForRemittance]
UPDATE afcontrol SET 
	beginseries = currentseries, 
	beginqty = balance, 
	qtyissued = 0, 
	issuedfrom = 0, 
	issuedto = 0 
WHERE collectorid = $P{collectorid}

[updateAFInventoryCreditInfo]
UPDATE afinventorycredit c, afcontrol af SET 
    c.qtyissued = c.qtyissued + $P{qtyissued}, 
	c.balance = c.balance - $P{qtyissued},
	c.docstate = CASE WHEN c.balance - $P{qtyissued} = 0 THEN 'CLOSED' ELSE 'OPEN' end 
WHERE c.objid = af.afinventorycreditid 
  AND af.objid = $P{afcontrolid} 
 

[closeAfControl]
UPDATE afcontrol SET 
	docstate = 'CLOSED' 
WHERE balance = 0 
  AND docstate = 'APPROVED' 
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
 

[getCollectionType] 
SELECT 
	afid, stubno, 
	MIN(serialno) AS fromserialno, 
	MAX(serialno) AS toserialno, 
	SUM(CASE WHEN voided =0 THEN amount ELSE 0 END ) AS amount 
FROM receiptlist 
WHERE remittanceid = $P{remittanceid} 
GROUP BY afid, stubno 

[fetchOtherPayments]
SELECT  
 rl.objid, rl.remittanceid, 
 i.receiptid, i.paytype, i.particulars, i.amount 
FROM receiptlist rl 
INNER JOIN paymentitem i ON i.receiptid = rl.objid 
WHERE rl.remittanceid = $P{objid} 
 AND rl.voided = 0 
 AND paytype = 'CHECK' 
 
[getDistinctAccountSRE]
SELECT DISTINCT 
	a.objid,  
	a.acctcode, 
	a.accttitle  
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
	LEFT JOIN account a ON ia.sreid = a.objid 
WHERE rl.remittanceid = $P{remittanceid} 
ORDER BY a.acctcode 

[getSummaryOfCollectionSRE]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
	LEFT JOIN account a ON ia.sreid = a.objid  
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	

[getDistinctAccountNGAS]
SELECT DISTINCT 
	a.objid,
	a.acctcode, 
	a.accttitle  
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
	LEFT JOIN account a ON ia.ngasid = a.objid 
WHERE rl.remittanceid = $P{remittanceid} 
ORDER BY a.acctcode 

[getSummaryOfCollectionNGAS]
SELECT 
	rl.afid, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
	LEFT JOIN account a ON ia.ngasid = a.objid  
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	


 
[getDistinctFundAccount]
 SELECT DISTINCT 
	ia.fundid, 
	ia.fundname 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid 
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid  
WHERE rl.remittanceid = $P{remittanceid} AND rl.voided = 0 
ORDER BY ia.fundname  

[getReportByFundDetailCrosstab]
SELECT 
	rl.afid, 
	rl.collectiontype, 
	rl.serialno, 
	CASE WHEN rl.voided = 0 THEN rl.paidby ELSE '*** VOIDED ***' END AS paidby, 
	rl.txndate, 
	${columnsql} 
	rl.voided 
FROM receiptlist rl  
	INNER JOIN receiptitem ri ON rl.objid = ri.receiptid  
	INNER JOIN incomeaccount ia ON ri.acctid = ia.objid   
WHERE rl.remittanceid = $P{remittanceid} 
GROUP BY rl.afid, rl.serialno, rl.paidby, rl.txndate, rl.voided 
ORDER BY rl.afid, rl.serialno 	


[getAbstractCollectionBASIC] 
SELECT  
	rp.period AS payperiod, 
	'BASIC' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS currentyear, 
	IFNULL((SELECT SUM( basic ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS previousyear, 
	IFNULL((SELECT SUM( basicdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ), 0.0) AS discount, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ), 0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( basicint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior') ), 0.0) AS penaltyprevious 
FROM remittancelist rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE rem.objid = $P{objid}
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
ORDER BY r.serialno, rl.tdno    


[getAbstractCollectionSEF]
SELECT 
	rp.period AS payperiod, 
	'SEF' AS type, 
	r.txndate AS ordate, 
	rl.taxpayername, 
	rl.tdno, 
	r.serialno AS orno, 
	rl.barangay, 
	rl.classcode AS classification, 
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS currentyear, 
	IFNULL((SELECT SUM( sef ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous', 'prior') ),0.0) AS previousyear, 
	IFNULL((SELECT SUM( sefdisc ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid ),0.0) AS discount, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('current','advance') ),0.0) AS penaltycurrent, 
	IFNULL((SELECT SUM( sefint ) FROM rptpaymentdetail WHERE receiptid = r.objid AND rptledgerid = rl.objid AND revtype IN ('previous','prior' ) ),0.0) AS penaltyprevious 
FROM remittancelist rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid  
	INNER JOIN rptpayment rp ON rp.receiptid = r.objid  
	INNER JOIN rptledger rl ON rp.rptledgerid = rl.objid  
WHERE rem.objid = $P{objid}
  AND r.doctype = 'RPT'  
  AND r.voided = 0  
ORDER BY r.serialno, rl.tdno 


[getAbstractCollectionManualBASIC]
SELECT 
	rp.period AS payperiod,
	'BASIC' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.basic AS currentyear, 
	rp.basicprev + rp.basicprior AS previousyear, 
	rp.basicdisc AS discount, 
	rp.basicint AS penaltycurrent, 
	rp.basicprevint + rp.basicpriorint AS penaltyprevious 
FROM remittancelist rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE rem.objid = $P{objid} 
  AND r.doctype = 'RPT' 
  AND r.voided = 0 
ORDER BY r.serialno   
  
  


[getAbstractCollectionManualSEF]
SELECT 
	rp.period AS payperiod,
	'SEF' AS type,
	r.txndate AS ordate,
	rp.taxpayername,
	rp.tdno,
	r.serialno AS orno,
	rp.barangay,
	rp.classcode AS classification, 
	rp.sef AS currentyear, 
	rp.sefprev + rp.sefprior AS previousyear, 
	rp.sefdisc AS discount, 
	rp.sefint AS penaltycurrent, 
	rp.sefprevint + rp.sefpriorint AS penaltyprevious 
FROM remittancelist rem 
	INNER JOIN receiptlist r ON rem.objid = r.remittanceid 
	INNER JOIN rptpaymentmanual rp ON rp.receiptid = r.objid 
WHERE rem.objid = $P{objid} 
  AND r.doctype = 'RPT' 
  AND r.voided = 0  
ORDER BY r.serialno   

[getFundName]
SELECT objid, fundname FROM fund ORDER BY fundname 
