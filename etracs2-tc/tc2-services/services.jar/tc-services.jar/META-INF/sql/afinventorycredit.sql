[getList]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU'

[getListByState]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND docstate = $P{docstate}

[getListByAfIdState]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND docstate = $P{docstate} AND afid = $P{afid}

[getListByAfTypeState]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND docstate = $P{docstate} AND aftype = $P{aftype}

[getListByAfUnitState]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND docstate = $P{docstate} AND afunit = $P{afunit}

[getListByStartSeriesState]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND docstate = $P{docstate} AND startseries LIKE $P{startseries}

[getListByAfId]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND afid = $P{afid}

[getListByAfType]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND aftype = $P{aftype}

[getListByAfUnit]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND afunit = $P{afunit}

[getListByStartSeries]
SELECT * FROM afinventorycredit WHERE iraftype != 'LGU' AND startseries LIKE $P{startseries}

[getSummaryList]
SELECT afid, aftype, SUM(balance) AS totalbal FROM afinventorycredit WHERE docstate = 'OPEN' AND iraftype != 'LGU'   
GROUP BY afid, aftype
