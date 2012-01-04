[getList]
SELECT * FROM afinventory 
WHERE iraftype = 'LGU' 
ORDER BY startseries, stubfrom 

[getById]
SELECT * FROM afinventory WHERE objid = $P{objid} 
ORDER BY startseries, stubfrom 

[getListByState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} 
ORDER BY startseries, stubfrom 

[getListByAfIdState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND afid = $P{afid} 
ORDER BY startseries, stubfrom 

[getListByAfTypeState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND aftype = $P{aftype} 
ORDER BY startseries, stubfrom 


[getListByAfUnitState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND afunit = $P{afunit} 
ORDER BY startseries, stubfrom 

[getListByStartSeriesState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND startseries LIKE $P{startseries} 
ORDER BY startseries, stubfrom 

[getListByAfId]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND afid = $P{afid} 
ORDER BY startseries, stubfrom 

[getListByAfType]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND aftype = $P{aftype} 
ORDER BY startseries, stubfrom 

[getListByAfUnit]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND afunit = $P{afunit} 
ORDER BY startseries, stubfrom 

[getListByStartSeries]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND startseries LIKE $P{startseries} 
ORDER BY startseries, stubfrom 

[getSummaryList]
SELECT afid, aftype, SUM(qtyonhand) AS totalqty FROM afinventory WHERE docstate = 'OPEN' AND iraftype = 'LGU'   
GROUP BY afid, aftype

[getInventoryCreditByAFInventoryId]
SELECT ivc.* , a.collectorname AS rivrequestedby, a.collectortitle AS rivrequestedbytitle , a.currentseries  
FROM afinventorycredit ivc	 
	LEFT JOIN iraf i ON ivc.irafid = i.objid   
	INNER JOIN afcontrol a ON ivc.objid = a.afinventorycreditid  
WHERE ivc.afinventoryid = $P{afinventoryid}  
ORDER BY a.stubno 

[getInventoryCreditByAFInventoryId2]
SELECT
	a.docstate, 
	ivc.irafno, ivc.iraftype, 
	CASE WHEN c.collectorid IS NOT NULL THEN 'COLLECTOR' ELSE '-' END AS credittype, 
	c.collectorname AS rivrequestedby,  c.stubno, c.afid, a.aftype, 
	CASE WHEN a.aftype = 'serial' THEN a.prefix ELSE '' END AS prefix, 
	CASE WHEN a.aftype = 'serial' THEN a.suffix ELSE '' END AS suffix, 
	c.receivedqty, 
	CASE WHEN a.aftype = 'serial' THEN c.receivedfrom ELSE '' END AS receivedfrom, 
	CASE WHEN a.aftype = 'serial' THEN c.receivedto ELSE '' END AS receivedto, 
	c.issuedqty, 
	CASE WHEN a.aftype = 'serial' THEN c.issuedfrom ELSE '' END AS issuedfrom, 
	CASE WHEN a.aftype = 'serial' THEN c.issuedto ELSE '' END AS issuedto, 
	c.endingqty, 
	CASE WHEN a.aftype = 'serial' THEN c.endingfrom ELSE '' END AS endingfrom, 
	CASE WHEN a.aftype = 'serial' THEN c.endingto ELSE '' END AS endingto 
FROM craaf c 
	LEFT JOIN afcontrol a ON c.afinventorycreditid = a.afinventorycreditid 
	LEFT JOIN afinventorycredit ivc ON ivc.objid = c.afinventorycreditid 
WHERE ivc.afinventoryid = $P{afinventoryid} 
ORDER BY a.startseries 








