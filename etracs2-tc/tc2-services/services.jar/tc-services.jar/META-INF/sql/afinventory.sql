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







