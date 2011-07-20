[getList]
SELECT * FROM truecopy ORDER BY txnno

[getListDesc]
SELECT * FROM truecopy ORDER BY txnno DESC

[getListByTdNo]
SELECT * FROM truecopy WHERE tdno LIKE $P{tdno} ORDER BY txnno

[getListByOrNo]
SELECT * FROM truecopy WHERE orno LIKE $P{orno} ORDER BY txnno

[getListByRequestedBy]
SELECT * FROM truecopy WHERE requestedby LIKE $P{requestedby} ORDER BY txnno

[getById]
SELECT * FROM truecopy WHERE objid = $P{objid}

