[getLedgerByTdId]
SELECT 
	r.objid, r.type, r.tdno, r.pin, r.taxpayername, r.taxpayeraddress,  
	r.lastyearpaid, r.lastqtrpaid, r.taxable, 
	r.classcode, r.previoustdno, r.cadastrallotno, r.location as barangay 
FROM RPTLedger r 
WHERE r.tdid = $P{tdid} 


[getLedgerItems]
SELECT i.state, i.tdno, i.fromyear, CASE WHEN i.toyear = 0 THEN '-' ELSE i.toyear END as toyear, i.assessedvalue, i.parentid 
FROM RPTLedgerItem i 
WHERE i.parentid = $P{ledgerid} 
ORDER BY i.fromYear DESC 

[getLedgerCredits]
SELECT  
	c.txndate, 
	c.refno, 
	c.collectorname, 
	CASE WHEN dtype = 'RPTDataCapturePayment' THEN 'CAPTURE' ELSE 'ONLINE'  END as mode, 
	c.basic + c.basicprior + c.basicprevious - basicdiscount + c.basicinterest + c.basicintprevious + c.basicintprior as basic, 
	c.sef + c.sefprior + c.sefprevious - sefdiscount + c.sefinterest + c.sefintprevious + c.sefintprior as sef, 
	CONCAT(fromqtr, 'Q,', fromyear) as paymentfrom, 
	CONCAT(toqtr, 'Q,', toyear) as paymentto 
FROM AbstractRPTCredit c 
WHERE c.ledgerid = $P{ledgerid} 
ORDER BY txndate DESC 
