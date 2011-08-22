
[getList]
SELECT 
	* 
FROM rptcertification 
ORDER BY docno

[searchByTaxpayerName]
SELECT 
	* 
FROM rptcertification 
WHERE taxpayername LIKE $P{taxpayername} 
ORDER BY docno

[searchByReqBy]
SELECT 
	* 
FROM rptcertification 
WHERE  requestedby LIKE $P{requestedby}
ORDER BY docno

[getDataById]
SELECT 
	*
FROM rptcertification 
WHERE objid = $P{objid} 
ORDER BY docno 

[fetchData]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist 
WHERE taxpayerid = $P{taxpayerid} 
	AND docstate = 'CURRENT' 
	ORDER BY fullpin 

[getLandHolding]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist 
WHERE taxpayerid = $P{taxpayerid} 
  AND docstate = 'CURRENT' 
  AND rputype = 'land' 
  ORDER BY fullpin

[getMultipleProperty]  
SELECT	
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist 
WHERE taxpayerid = $P{taxpayerid} 
	AND docstate = 'CURRENT'  
	ORDER BY fullpin 

[getNoImprovements]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist f 
WHERE taxpayerid = $P{taxpayerid} 
	AND docstate = 'CURRENT' 
	AND rputype = 'land' 
	AND NOT EXISTS ( 
		SELECT landfaasid FROm faaslist  
		WHERE landfaasid = f.objid AND docstate <> 'CANCELLED' 
	) 
	ORDER BY fullpin 

[getNoImprovementsTDNo]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist 
WHERE tdno = $P{tdno} 
	AND landfaasid IS NULL  
	
[getImprovementsTDNo]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist 
WHERE tdno = $P{tdno} 
	AND landfaasid IS NOT NULL  

[getWImproveLand]
SELECT 
	objid, tdno, taxpayername, ownername, titleno, cadastrallotno, barangay, fullpin, 
	rputype, totalmv, totalav, totalareaha, totalareasqm, classcode 
FROM faaslist f 
WHERE taxpayerid = $P{taxpayerid} 
	AND docstate = 'CURRENT' 
	AND landfaasid IS NOT NULL 
	
[searchByTaxpayerid]
select taxpayerid from faaslist where taxpayerid = $P{taxpayerid}  


