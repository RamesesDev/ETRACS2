[getList]
SELECT * FROM txntypes ORDER BY txntype

[getListByCode]
SELECT * FROM txntypes WHERE txntype LIKE $P{txntype} ORDER BY txntype

[getById]
SELECT * FROM txntypes WHERE objid = $P{objid}

[checkDuplicateType]
SELECT COUNT(*) AS count FROM txntypes WHERE txntype = $P{txntype}

[checkReferenced]
SELECT COUNT(*) AS count FROM txnrequirements WHERE txntypeid = $P{objid}
