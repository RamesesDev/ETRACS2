[getList]
SELECT * FROM craaf WHERE afid = $P{afid}

[getCRAAFItem]
SELECT * FROM craaf WHERE afinventoryid = $P{afinventoryid} OR afinventorycreditid = $P{afinventorycreditid} AND afid = $P{afid}

[getAFInventoryId]
SELECT objid FROM afinventory WHERE irafid = $P{irafid} AND afid = $P{afid}

[getAFInventoryCredit]
SELECT * FROM afinventorycredit WHERE irafid = $P{irafid} AND afid = $P{afid}

[getAF]
SELECT * FROM af WHERE objid = $P{afid}

[getStartEndSeries]
SELECT MIN(startseries) AS startseries, MAX(endseries) AS endseries   
FROM afinventorycredit    
WHERE irafid = $P{irafid} AND afid = $P{afid}    
GROUP BY afid

[getAFControl]
SELECT * FROM afcontrol WHERE objid = $P{afcontrolid}

[getReportDataGeneral]
SELECT collectorname, afid, beginqty, beginfrom, beginto,  
	receivedqty, receivedfrom, receivedto,  
	issuedqty, issuedfrom, issuedto, 
	endingqty, endingfrom, endingto 
FROM craaf  
WHERE collectorid IS NULL   
AND craafmonth = $P{craafmonth}   
AND craafyear = $P{craafyear}  
ORDER BY afid, beginfrom, receivedfrom

[getReportDataCollector]
SELECT c.collectorname, a.stubno, c.afid, c.beginqty, c.beginfrom, c.beginto,  
	c.receivedqty, c.receivedfrom, c.receivedto,  
	c.issuedqty, c.issuedfrom, c.issuedto,  
	c.endingqty, c.endingfrom, c.endingto   
FROM craaf c, afcontrol a   
WHERE c.afinventorycreditid = a.afinventorycreditid   
AND craafmonth = $P{craafmonth}   
AND craafyear = $P{craafyear}   
ORDER BY c.collectorname, c.afid, c.beginfrom, c.receivedfrom

[updateCRAAFbyIRAFCol]
UPDATE craaf SET
	issuedqty = $P{issuedqty},
	issuedfrom = $P{issuedfrom},
	issuedto = $P{issuedto},
	endingqty = $P{endingqty},
	endingfrom = $P{endingfrom},
	endingto = $P{endingto}
WHERE afinventoryid = $P{afinventoryid} AND afid = $P{afid}

[updateCRAAFbyRemittance]
UPDATE craaf SET
	issuedqty = $P{issuedqty},
	issuedfrom = $P{issuedfrom},
	issuedto = $P{issuedto},
	endingqty = $P{endingqty},
	endingfrom = $P{endingfrom},
	endingto = $P{endingto}
WHERE objid = $P{objid}