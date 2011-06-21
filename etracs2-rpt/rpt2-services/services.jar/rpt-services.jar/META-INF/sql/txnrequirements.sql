[getList]
SELECT * FROM txnrequirements ORDER BY txntype

[getListByType]
SELECT * FROM txnrequirements WHERE txntype LIKE $P{txntype} ORDER BY txntype

[getById]
SELECT * FROM txnrequirements WHERE objid = $P{objid}

[getTxnTypes]
SELECT * FROM txntypes WHERE used = 0

[getAllTxnTypes]
SELECT * FROM txntypes

[checkDuplicateType]
SELECT COUNT(*) AS count FROM txnrequirements WHERE txntype = $P{txntype}

[updateTxnType]
UPDATE txntypes SET used = 1 WHERE objid = $P{objid}
