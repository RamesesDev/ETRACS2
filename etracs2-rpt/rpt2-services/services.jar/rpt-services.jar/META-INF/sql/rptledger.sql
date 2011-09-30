[getList]
SELECT 
	objid, docstate, tdno, fullpin, barangay, prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid, assessedvalue , classcode 
FROM rptledger  
WHERE docstate LIKE $P{docstate} 

[getListByTdno]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid, assessedvalue  , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND tdno LIKE $P{tdno} 

[getListByPin]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND fullpin LIKE $P{fullpin} 

[getListByTaxpayer]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND taxpayername LIKE  $P{taxpayername} 


[getListByCadastral]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND cadastrallotno = $P{cadastrallotno} 

[getListByBlock]
SELECT 
	objid, docstate, tdno, fullpin, barangay,  prevtdno, 
	taxpayerid, taxpayername, taxpayeraddress, rputype, cadastrallotno, 
	lastyearpaid, lastqtrpaid , assessedvalue , classcode 
FROM rptledger 
WHERE docstate LIKE $P{docstate} AND blockno = $P{blockno} 


[getLatestItem]
SELECT * FROM rptledgeritem WHERE toyear = 0 AND parentid = $P{parentid} 

[getLedgerItemList]
SELECT * FROM rptledgeritem WHERE parentid = $P{parentid} ORDER BY fromyear DESC 

[getSmallestFromYear]
SELECT MIN(fromyear) AS minfromyear FROM rptledgeritem WHERE parentid = $P{parentid} AND docstate = 'APPROVED' 


[getPayments]
SELECT 
	r.*,  
	basic + basicint - basicdisc AS basicnet,   
	sef + sefint - sefdisc AS sefnet,  
	basic + basicint - basicdisc + sef + sefint - sefdisc AS total  
FROM rptpayment r 
WHERE rptledgerid = $P{ledgerid} 
ORDER BY fromYear DESC, fromqtr DESC   


[updateFaasLedgerId]
UPDATE faas SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}

[updateFaasListLedgerId]
UPDATE faaslist SET ledgerid = $P{ledgerid} WHERE objid = $P{objid}


[updateLastYearQtrPaid]
UPDATE rptledger SET lastyearpaid = $P{lastyearpaid}, lastqtrpaid = $P{lastqtrpaid} WHERE objid = $P{objid} 

