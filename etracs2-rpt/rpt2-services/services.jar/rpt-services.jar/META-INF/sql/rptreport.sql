[getNoticeItemsByTaxpayerId]
SELECT 
	objid, tdno, fullpin, barangay, classcode, 
	totalareasqm, totalareaha, totalmv, totalav, 
	cadastrallotno, txntype, rputype 
FROM faaslist 
WHERE taxpayerid = $P{taxpayerid}
  AND docstate = 'CURRENT' 
ORDER BY fullpin   
  
[getNoticeItemsByFaasid]
SELECT 
	objid, tdno, fullpin, barangay, classcode, 
	totalareasqm, totalareaha, totalmv, totalav, 
	cadastrallotno, txntype, rputype 
FROM faaslist 
WHERE objid = $P{objid} 
  AND docstate = 'CURRENT'  
ORDER BY fullpin   
  
  
[getNoticeList]
SELECT 
	objid, docstate, docno, issuedate, 
	taxpayername, taxpayeraddress, 
	preparedby, approvedby, 
	receivedby, dtdelivered, remarks 
FROM noticeofassessment 
ORDER BY objid DESC 


[getRPTSetting]  
SELECT * FROM rptsetting 