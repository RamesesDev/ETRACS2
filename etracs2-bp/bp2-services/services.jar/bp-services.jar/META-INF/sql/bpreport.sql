[getBarangayList]
SELECT objid AS barangayid, lguname AS barangayname FROM lgu WHERE lgutype = 'BARANGAY'  ORDER BY lguname  



[getTaxpayerMasterList]
SELECT  
	a.objid,  
	p.txnno AS permitno, a.iyear,  a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, a.txntype, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'CAPITAL' and objid like CONCAT(a.objid,'%')) AS capital, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'GROSS' and objid like CONCAT(a.objid,'%')) AS gross 
FROM bpapplicationlisting a, bppermit p  
WHERE a.objid = p.applicationid  
  AND a.iyear = $P{iyear} 
ORDER BY a.txnno  

[getApplicationListing]
SELECT 
	a.txnno AS appno, a.iyear, a.docstate, a.txntype, a.organization, a.barangayname,  
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress,  
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'CAPITAL' and objid like CONCAT(a.objid,'%')) AS capital, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'GROSS' and objid like CONCAT(a.objid,'%')) AS gross, 
	p.txnno AS permitno 
FROM bpapplicationlisting a 
	LEFT JOIN bppermit p ON a.objid= p.applicationid  
WHERE a.iyear = $P{iyear} 
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayid LIKE $P{barangayid} 
ORDER BY a.txnno  

[getApplicationLOBListing]
SELECT 
	a.txnno AS appno, a.iyear, a.docstate, a.txntype, a.organization, a.barangayname, 
	a.tradename, a.businessaddress, a.taxpayername, a.taxpayeraddress, 
	l.name AS lobname, l.classification, 
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'CAPITAL' and objid like CONCAT(a.objid,'%') AND lobid = bl.lobid) AS capital,
	(SELECT SUM(value) FROM bpappinfolisting WHERE varname = 'GROSS' and objid like CONCAT(a.objid,'%')  AND lobid = bl.lobid) AS gross 
FROM bpapplicationlisting a
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid 
	INNER JOIN lob l ON l.objid = bl.lobid 
WHERE a.iyear = $P{iyear} 
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayname LIKE $P{barangay}  
  AND l.classification LIKE $P{classification} 
ORDER BY a.txnno 

[getLOBCountListing]
SELECT  
	l.name AS lobname, 
	SUM(CASE WHEN a.txntype = 'NEW' THEN 1 ELSE 0 END)  AS newcount, 
	SUM(CASE WHEN a.txntype = 'RENEW' THEN 1 ELSE 0 END)  AS renewcount, 
	SUM(CASE WHEN a.txntype = 'ADDLOB' THEN 1 ELSE 0 END)  AS addlobcount, 
	SUM(CASE WHEN a.txntype = 'RETIRE' THEN 1 ELSE 0 END)  AS retirecount 
FROM bpapplicationlisting a 
	INNER JOIN bploblisting bl ON bl.applicationid = a.objid  
	INNER JOIN lob l ON l.objid = bl.lobid  
WHERE a.iyear = $P{iyear}  
  AND a.docstate LIKE $P{docstate}   
  AND a.barangayname LIKE $P{barangay} 
GROUP BY l.name   


