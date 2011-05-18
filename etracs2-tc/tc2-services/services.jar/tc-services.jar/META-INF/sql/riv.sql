[getList]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE rivtype = $P{rivtype} ORDER BY txnno DESC 

[getListByTxnno]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE txnno = $P{txnno} AND rivtype = $P{rivtype}

[getListByRequester]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE requestedby LIKE $P{requestedby} AND rivtype = $P{rivtype}

[getListByRequesterTxnno]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE txnno = $P{txnno} AND requestedby LIKE $P{requestedby} 

[getListByState]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE docstate = 'OPEN'

[getListByRequesterOpen]
SELECT objid, txnno, docstate, requestedby, rivtype FROM riv WHERE requestedby LIKE $P{requestedby} AND docstate = 'OPEN'

[checkReferencedId]
SELECT COUNT(*) AS count FROM iraf WHERE rivid = $P{rivid}
