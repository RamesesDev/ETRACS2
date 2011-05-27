[getList]
SELECT * FROM craaf WHERE afid = $P{afid}

[getCRAAFItem]
SELECT * FROM craaf WHERE afinventoryid = $P{afinventoryid} OR afinventorycreditid = $P{afinventorycreditid} AND afid = $P{afid}

[getAFInventoryId]
SELECT objid FROM afinventory WHERE irafid = $P{irafid} AND afid = $P{afid}

[getAFInventoryCredit]
SELECT * FROM afinventorycredit WHERE irafid = $P{irafid} AND afid = $P{afid}

[getStartEndSeries]
SELECT MIN(startseries) AS startseries, MAX(endseries) AS endseries   
FROM afinventorycredit    
WHERE irafid = $P{irafid} AND afid = $P{afid}    
GROUP BY afid

[getAFControl]
SELECT * FROM afcontrol WHERE objid = $P{afcontrolid}


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
