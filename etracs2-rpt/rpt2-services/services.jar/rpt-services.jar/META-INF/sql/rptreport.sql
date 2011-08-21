[getRPTSetting]  
SELECT * FROM rptsetting 

[getBarangayList]
SELECT objid, lguname AS barangay FROM lgu 
WHERE parentid = $P{parentid} AND lgutype = 'BARANGAY'
ORDER BY lguname 

 

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

[getAssessmentRollTaxable]
SELECT
	ry, section,  
	provcity AS parentlguname, provcityindex AS parentlguindex,   
	munidistrict AS lguname, munidistrictindex AS lguindex,  
	barangay, barangayindex, 
	ownername, owneraddress, tdno, effectivityyear, 
	cadastrallotno, classcode, rputype, totalav, 
	CASE WHEN claimno = '-' THEN fullpin ELSE CONCAT(fullpin, '-', claimno) END AS fullpin, 
	prevtdno, memoranda, barangayid 
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate = 'CURRENT'  
  AND section LIKE $P{section} 
  AND taxable = 1 
ORDER BY fullpin   
  
[getAssessmentRollExempt]
SELECT
	ry, section,  
	provcity AS parentlguname, provcityindex AS parentlguindex,   
	munidistrict AS lguname, munidistrictindex AS lguindex,  
	barangay, barangayindex, 
	ownername, owneraddress, tdno, effectivityyear, 
	cadastrallotno, classcode, rputype, totalav, 
	CASE WHEN claimno = '-' THEN fullpin ELSE CONCAT(fullpin, '-', claimno) END AS fullpin,  
	memoranda, barangayid, exemptcode AS legalbasis  
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate = 'CURRENT'   
  AND section LIKE $P{section}  
  AND taxable = 0  
ORDER BY fullpin     


[getTmcrList]
SELECT
	barangay, cadastrallotno, classcode, docstate,  
	CASE WHEN claimno = '-' THEN fullpin ELSE CONCAT(fullpin, '-', claimno) END AS fullpin, 
	memoranda, ownername, owneraddress, rputype, section, surveyno, 
	tdno, titleno, totalareasqm, totalareasqm, totalav, totalmv 
FROM faaslist   
WHERE barangayid = $P{barangayid} 
  AND docstate = 'CURRENT'  
  AND section LIKE $P{section} 
ORDER BY fullpin   

  
[getORF]  
SELECT
	barangay, cadastrallotno, classcode, 
	CASE WHEN claimno = '-' THEN fullpin ELSE CONCAT(fullpin, '-', claimno) END AS fullpin, 
	prevtdno, taxpayeraddress, taxpayername, tdno, 
	totalareasqm, totalareaha, totalav, txntype 
FROM faaslist   
WHERE taxpayerid = $P{taxpayerid} 
  AND docstate = 'CURRENT'  
ORDER BY fullpin   
