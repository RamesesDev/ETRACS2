[getList]
SELECT * FROM afinventory WHERE iraftype = 'LGU'

[getListByState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate}

[getListByAfIdState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND afid = $P{afid}

[getListByAfTypeState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND aftype = $P{aftype}

[getListByAfUnitState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND afunit = $P{afunit}

[getListByStartSeriesState]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND docstate = $P{docstate} AND startseries LIKE $P{startseries}

[getListByAfId]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND afid = $P{afid}

[getListByAfType]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND aftype = $P{aftype}

[getListByAfUnit]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND afunit = $P{afunit}

[getListByStartSeries]
SELECT * FROM afinventory WHERE iraftype = 'LGU' AND startseries LIKE $P{startseries}

[getSummaryList]
SELECT afid, aftype, SUM(qtyonhand) AS totalqty FROM afinventory WHERE docstate = 'OPEN' AND iraftype = 'LGU'   
GROUP BY afid, aftype
