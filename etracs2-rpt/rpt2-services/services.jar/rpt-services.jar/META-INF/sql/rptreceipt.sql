
[getIncomeAccountInfo]
SELECT objid AS acctid, acctno, accttitle, fundid, fundname FROM incomeaccount  WHERE objid = $P{objid}

[getRPTPayments]
SELECT r.*,
	rl.tdno, 
	rl.assessedvalue,
	rl.rputype,
	rl.classcode, 
	rl.taxpayername,
	rl.barangay,
	rl.cadastrallotno,
	r.basicint - r.basicdisc AS basicdp, 
	r.basic + r.basicint - r.basicdisc AS basicnet, 
	r.sefint - r.sefdisc AS sefdp, 
	r.sef + r.sefint - r.sefdisc AS sefnet,
    r.basic + r.basicint - r.basicdisc + r.sef + r.sefint - r.sefdisc AS amount 
FROM rptpayment r, rptledger rl 
WHERE rl.objid = r.rptledgerid 
  AND receiptid = $P{receiptid} 

[getRPTPaymentInfo]
SELECT objid, rptledgerid, fromyear, fromqtr, toyear, toqtr FROM rptpayment WHERE receiptid = $P{receiptid}


[updateLedgerLastYearQtrPaid]
UPDATE rptledger SET lastyearpaid = $P{lastyearpaid}, lastqtrpaid = $P{lastqtrpaid} WHERE objid = $P{objid} 


[voidRPTPayment]
UPDATE rptpayment SET voided = 1 WHERE objid = $P{objid} 



[getRPTIncomeAccounts]
SELECT objid AS acctid, acctno, accttitle, fundid, fundname, systype, 0 AS amount    
FROM incomeaccount 
WHERE systype LIKE 'RPT_BASIC%' OR systype LIKE 'RPT_SEF%' 

[getBarangays]
SELECT lguname FROM lgu WHERE lgutype = 'BARANGAY' ORDER BY lguname  

[getClassifications]
SELECT propertycode AS classcode  FROM propertyclassification ORDER BY orderno  

