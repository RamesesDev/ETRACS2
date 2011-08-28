[getRPTSetting]  
SELECT * FROM rptsetting 

[getBarangayList]
SELECT objid, lguname AS barangay FROM lgu 
WHERE parentid = $P{parentid} AND lgutype = 'BARANGAY'
ORDER BY indexno

 

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


[getJAT]
SELECT 
	barangay, issuedate, tdno, fullpin, 
	txntype, ownername, rputype, classcode, 
	totalareaha, totalmv, totalav, docstate 
FROM faaslist  
WHERE barangayid = $P{barangayid} 
 AND docstate IN ( 'CURRENT', 'CANCELLED' ) 
ORDER BY convert(replace(tdno,'-',''), UNSIGNED ) 


#----------------------------------------------------------------------
#
# Real Property Assessment Accomplishment Report 
#
#----------------------------------------------------------------------
[getPreceedingRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS preceedingtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS preceedingtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS preceedingexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS preceedingexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp < $P{txntimestamp} 
  AND f.docstate IN ( 'CURRENT', 'CANCELLED' ) 
  AND l.parentid = $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY l.indexno 	 

[getCurrentRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( IFNULL(CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END,0) ) AS currenttaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS currenttaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS currentexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS currentexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp LIKE $P{txntimestamp} 
  AND f.docstate = 'CURRENT' 
  AND l.parentid = $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY l.indexno  

[getCancelledRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS cancelledtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS cancelledtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS cancelledexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS cancelledexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid 
WHERE f.txntimestamp LIKE $P{txntimestamp}  
  AND f.docstate = 'CANCELLED' 
  AND l.parentid = $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY l.indexno 	 

[getEndingRPAAccomplishment]
SELECT  
	l.objid AS barangayid, 
	l.lguname AS barangay, 
	SUM( CASE WHEN f.taxable = 1 THEN 1 ELSE 0 END ) AS endingtaxablecount, 
	SUM( CASE WHEN f.taxable = 1 THEN f.totalav ELSE 0 END ) AS endingtaxableav, 
	SUM( CASE WHEN f.taxable = 0 THEN 1 ELSE 0 END ) AS endingexemptcount, 
	SUM( CASE WHEN f.taxable = 0 THEN f.totalav ELSE 0 END ) AS endingexemptav 
FROM faaslist f 
	LEFT JOIN lgu l ON l.objid = f.barangayid  
WHERE f.txntimestamp < $P{txntimestamp} 
  AND f.docstate = 'CURRENT' 
  AND l.parentid = $P{lguindex} 
GROUP BY l.objid, l.lguname  
ORDER BY l.indexno 	 
